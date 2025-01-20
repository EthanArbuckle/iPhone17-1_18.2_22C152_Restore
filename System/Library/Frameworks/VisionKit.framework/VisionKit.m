double RecognizedItem.Bounds.topLeft.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void RecognizedItem.Bounds.topLeft.setter(double a1, double a2)
{
  double *v2 = a1;
  v2[1] = a2;
}

uint64_t (*RecognizedItem.Bounds.topLeft.modify())()
{
  return nullsub_1;
}

double RecognizedItem.Bounds.topRight.getter()
{
  return *(double *)(v0 + 16);
}

void RecognizedItem.Bounds.topRight.setter(double a1, double a2)
{
  *(double *)(v2 + 16) = a1;
  *(double *)(v2 + 24) = a2;
}

uint64_t (*RecognizedItem.Bounds.topRight.modify())()
{
  return nullsub_1;
}

double RecognizedItem.Bounds.bottomRight.getter()
{
  return *(double *)(v0 + 32);
}

void RecognizedItem.Bounds.bottomRight.setter(double a1, double a2)
{
  *(double *)(v2 + 32) = a1;
  *(double *)(v2 + 40) = a2;
}

uint64_t (*RecognizedItem.Bounds.bottomRight.modify())()
{
  return nullsub_1;
}

double RecognizedItem.Bounds.bottomLeft.getter()
{
  return *(double *)(v0 + 48);
}

void RecognizedItem.Bounds.bottomLeft.setter(double a1, double a2)
{
  *(double *)(v2 + 48) = a1;
  *(double *)(v2 + 56) = a2;
}

uint64_t (*RecognizedItem.Bounds.bottomLeft.modify())()
{
  return nullsub_1;
}

id RecognizedItem.Text.bounds.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_217960A08(type metadata accessor for RecognizedItem.Text, a1);
}

uint64_t type metadata accessor for RecognizedItem.Text(uint64_t a1)
{
  return sub_217960D38(a1, (uint64_t *)&unk_267BA43B0);
}

uint64_t RecognizedItem.Text.transcript.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for RecognizedItem.Text(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

id RecognizedItem.Text.observation.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for RecognizedItem.Text(0) + 28));

  return v1;
}

uint64_t _s9VisionKit14RecognizedItemO4TextV2id10Foundation4UUIDVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21797C608();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

id RecognizedItem.Barcode.bounds.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_217960A08(type metadata accessor for RecognizedItem.Barcode, a1);
}

id sub_217960A08@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  v5 = *(void **)(v4 + 64);
  long long v6 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v4;
  *(_OWORD *)(a2 + 16) = v6;
  long long v7 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(a2 + 48) = v7;
  *(void *)(a2 + 64) = v5;

  return v5;
}

uint64_t type metadata accessor for RecognizedItem.Barcode(uint64_t a1)
{
  return sub_217960D38(a1, (uint64_t *)&unk_267BA43C0);
}

uint64_t RecognizedItem.Barcode.payloadStringValue.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for RecognizedItem.Barcode(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

id RecognizedItem.Barcode.observation.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for RecognizedItem.Barcode(0) + 28));

  return v1;
}

uint64_t RecognizedItem.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x270FA5388]();
  long long v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RecognizedItem(0);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217960D70(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217960DD4((uint64_t)v9, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
    uint64_t v10 = sub_21797C608();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, v5, v10);
    v11 = type metadata accessor for RecognizedItem.Barcode;
    uint64_t v12 = (uint64_t)v5;
  }
  else
  {
    sub_217960DD4((uint64_t)v9, (uint64_t)v7, type metadata accessor for RecognizedItem.Text);
    uint64_t v13 = sub_21797C608();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, v7, v13);
    v11 = type metadata accessor for RecognizedItem.Text;
    uint64_t v12 = (uint64_t)v7;
  }
  return sub_217960E3C(v12, v11);
}

uint64_t type metadata accessor for RecognizedItem(uint64_t a1)
{
  return sub_217960D38(a1, (uint64_t *)&unk_267BA43A0);
}

uint64_t sub_217960D38(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_217960D70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RecognizedItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217960DD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_217960E3C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t RecognizedItem.bounds.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RecognizedItem(0);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217960D70(v2, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217960DD4((uint64_t)v11, (uint64_t)v6, type metadata accessor for RecognizedItem.Barcode);
    uint64_t v12 = &v6[*(int *)(v4 + 20)];
    uint64_t v13 = *(void *)v12;
    uint64_t v14 = *((void *)v12 + 1);
    uint64_t v15 = *((void *)v12 + 2);
    uint64_t v16 = *((void *)v12 + 3);
    uint64_t v17 = *((void *)v12 + 4);
    uint64_t v18 = *((void *)v12 + 5);
    uint64_t v19 = *((void *)v12 + 6);
    uint64_t v20 = *((void *)v12 + 7);
    id v21 = *((id *)v12 + 8);
    v22 = type metadata accessor for RecognizedItem.Barcode;
    uint64_t v23 = (uint64_t)v6;
  }
  else
  {
    sub_217960DD4((uint64_t)v11, (uint64_t)v9, type metadata accessor for RecognizedItem.Text);
    v24 = &v9[*(int *)(v7 + 20)];
    uint64_t v13 = *(void *)v24;
    uint64_t v14 = *((void *)v24 + 1);
    uint64_t v15 = *((void *)v24 + 2);
    uint64_t v16 = *((void *)v24 + 3);
    uint64_t v17 = *((void *)v24 + 4);
    uint64_t v18 = *((void *)v24 + 5);
    uint64_t v19 = *((void *)v24 + 6);
    uint64_t v20 = *((void *)v24 + 7);
    id v21 = *((id *)v24 + 8);
    v22 = type metadata accessor for RecognizedItem.Text;
    uint64_t v23 = (uint64_t)v9;
  }
  uint64_t result = sub_217960E3C(v23, v22);
  *a1 = v13;
  a1[1] = v14;
  a1[2] = v15;
  a1[3] = v16;
  a1[4] = v17;
  a1[5] = v18;
  a1[6] = v19;
  a1[7] = v20;
  a1[8] = v21;
  return result;
}

uint64_t sub_2179610D4()
{
  return sub_2179628F4(&qword_267BA4398, MEMORY[0x263F07508]);
}

uint64_t sub_21796111C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  type metadata accessor for RecognizedItem.Barcode(0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RecognizedItem.Text(0);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217960D70(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_217960DD4((uint64_t)v10, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
    uint64_t v11 = sub_21797C608();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, v5, v11);
    uint64_t v12 = type metadata accessor for RecognizedItem.Barcode;
    uint64_t v13 = (uint64_t)v5;
  }
  else
  {
    sub_217960DD4((uint64_t)v10, (uint64_t)v8, type metadata accessor for RecognizedItem.Text);
    uint64_t v14 = sub_21797C608();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, v8, v14);
    uint64_t v12 = type metadata accessor for RecognizedItem.Text;
    uint64_t v13 = (uint64_t)v8;
  }
  return sub_217960E3C(v13, v12);
}

uint64_t *initializeBufferWithCopyOfBuffer for RecognizedItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = sub_21797C608();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1) {
      uint64_t v8 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
    }
    else {
      uint64_t v8 = (int *)type metadata accessor for RecognizedItem.Text(0);
    }
    uint64_t v9 = v8[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    long long v12 = *((_OWORD *)v11 + 1);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v12;
    long long v13 = *((_OWORD *)v11 + 3);
    *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
    *((_OWORD *)v10 + 3) = v13;
    uint64_t v14 = (void *)*((void *)v11 + 8);
    *((void *)v10 + 8) = v14;
    uint64_t v15 = v8[6];
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = v8[7];
    uint64_t v20 = *(void **)((char *)a2 + v19);
    *(uint64_t *)((char *)a1 + v19) = (uint64_t)v20;
    id v21 = v14;
    swift_bridgeObjectRetain();
    id v22 = v20;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for RecognizedItem(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v3 = sub_21797C608();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  if (EnumCaseMultiPayload == 1) {
    uint64_t v4 = type metadata accessor for RecognizedItem.Barcode(0);
  }
  else {
    uint64_t v4 = type metadata accessor for RecognizedItem.Text(0);
  }
  uint64_t v5 = v4;

  swift_bridgeObjectRelease();
  uint64_t v6 = *(void **)(a1 + *(int *)(v5 + 28));
}

uint64_t initializeWithCopy for RecognizedItem(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_21797C608();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1) {
    uint64_t v6 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
  }
  else {
    uint64_t v6 = (int *)type metadata accessor for RecognizedItem.Text(0);
  }
  uint64_t v7 = v6[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  long long v11 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v11;
  long long v12 = *(void **)(v9 + 64);
  *(void *)(v8 + 64) = v12;
  uint64_t v13 = v6[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = v6[7];
  uint64_t v18 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v18;
  id v19 = v12;
  swift_bridgeObjectRetain();
  id v20 = v18;
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for RecognizedItem(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_217960E3C(a1, type metadata accessor for RecognizedItem);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_21797C608();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1) {
      uint64_t v6 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
    }
    else {
      uint64_t v6 = (int *)type metadata accessor for RecognizedItem.Text(0);
    }
    uint64_t v7 = v6[5];
    uint64_t v8 = a1 + v7;
    uint64_t v9 = a2 + v7;
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = *(_OWORD *)(v9 + 48);
    long long v10 = *(void **)(v9 + 64);
    *(void *)(v8 + 64) = v10;
    uint64_t v11 = v6[6];
    long long v12 = (void *)(a1 + v11);
    uint64_t v13 = (void *)(a2 + v11);
    *long long v12 = *v13;
    v12[1] = v13[1];
    uint64_t v14 = v6[7];
    uint64_t v15 = *(void **)(a2 + v14);
    *(void *)(a1 + v14) = v15;
    id v16 = v10;
    swift_bridgeObjectRetain();
    id v17 = v15;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for RecognizedItem(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_21797C608();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1) {
    uint64_t v6 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
  }
  else {
    uint64_t v6 = (int *)type metadata accessor for RecognizedItem.Text(0);
  }
  uint64_t v7 = v6[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v10;
  *(void *)(v8 + 64) = *(void *)(v9 + 64);
  long long v11 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v11;
  *(_OWORD *)(a1 + v6[6]) = *(_OWORD *)(a2 + v6[6]);
  *(void *)(a1 + v6[7]) = *(void *)(a2 + v6[7]);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for RecognizedItem(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_217960E3C(a1, type metadata accessor for RecognizedItem);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_21797C608();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1) {
      uint64_t v6 = (int *)type metadata accessor for RecognizedItem.Barcode(0);
    }
    else {
      uint64_t v6 = (int *)type metadata accessor for RecognizedItem.Text(0);
    }
    uint64_t v7 = v6[5];
    uint64_t v8 = a1 + v7;
    uint64_t v9 = a2 + v7;
    long long v10 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = v10;
    *(void *)(v8 + 64) = *(void *)(v9 + 64);
    long long v11 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v11;
    *(_OWORD *)(a1 + v6[6]) = *(_OWORD *)(a2 + v6[6]);
    *(void *)(a1 + v6[7]) = *(void *)(a2 + v6[7]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for RecognizedItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for RecognizedItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_217961A3C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_217961A4C()
{
  uint64_t result = type metadata accessor for RecognizedItem.Text(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for RecognizedItem.Barcode(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RecognizedItem.Bounds(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for RecognizedItem.Bounds(uint64_t a1)
{
}

uint64_t initializeWithCopy for RecognizedItem.Bounds(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  uint64_t v5 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v5;
  id v6 = v5;
  return a1;
}

void *assignWithCopy for RecognizedItem.Bounds(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  long long v3 = (void *)a2[8];
  long long v4 = (void *)a1[8];
  a1[8] = v3;
  id v5 = v3;

  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for RecognizedItem.Bounds(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  id v5 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  return a1;
}

uint64_t getEnumTagSinglePayload for RecognizedItem.Bounds(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RecognizedItem.Bounds(uint64_t result, int a2, int a3)
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RecognizedItem.Bounds()
{
  return &type metadata for RecognizedItem.Bounds;
}

uint64_t getEnumTagSinglePayload for RecognizedItem.Text(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for RecognizedItem.Text(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t sub_217961D5C()
{
  return sub_217962414();
}

uint64_t *_s9VisionKit14RecognizedItemO4TextVwCP_0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_21797C608();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    long long v10 = (char *)a1 + v8;
    long long v11 = (char *)a2 + v8;
    long long v12 = *((_OWORD *)v11 + 1);
    *(_OWORD *)long long v10 = *(_OWORD *)v11;
    *((_OWORD *)v10 + 1) = v12;
    long long v13 = *((_OWORD *)v11 + 3);
    *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
    *((_OWORD *)v10 + 3) = v13;
    uint64_t v14 = (void *)*((void *)v11 + 8);
    *((void *)v10 + 8) = v14;
    uint64_t v15 = (uint64_t *)((char *)a1 + v9);
    id v16 = (uint64_t *)((char *)a2 + v9);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = a3[7];
    id v19 = *(void **)((char *)a2 + v18);
    *(uint64_t *)((char *)a1 + v18) = (uint64_t)v19;
    id v20 = v14;
    swift_bridgeObjectRetain();
    id v21 = v19;
  }
  return a1;
}

void _s9VisionKit14RecognizedItemO4TextVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21797C608();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease();
  int v5 = *(void **)(a1 + *(int *)(a2 + 28));
}

uint64_t _s9VisionKit14RecognizedItemO4TextVwcp_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21797C608();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  long long v12 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v12;
  long long v13 = *(void **)(v10 + 64);
  *(void *)(v9 + 64) = v13;
  uint64_t v14 = (void *)(a1 + v8);
  uint64_t v15 = (void *)(a2 + v8);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[7];
  uint64_t v18 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v18;
  id v19 = v13;
  swift_bridgeObjectRetain();
  id v20 = v18;
  return a1;
}

uint64_t _s9VisionKit14RecognizedItemO4TextVwca_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21797C608();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v8[5] = v9[5];
  v8[6] = v9[6];
  v8[7] = v9[7];
  uint64_t v10 = (void *)v9[8];
  long long v11 = (void *)v8[8];
  v8[8] = v10;
  id v12 = v10;

  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = *(void **)(a2 + v16);
  uint64_t v18 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = v17;
  id v19 = v17;

  return a1;
}

uint64_t _s9VisionKit14RecognizedItemO4TextVwtk_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21797C608();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)(v9 + 64) = *(void *)(v10 + 64);
  long long v11 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v11;
  long long v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t _s9VisionKit14RecognizedItemO4TextVwta_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21797C608();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  long long v11 = *(_OWORD *)(v9 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
  *(_OWORD *)(v8 + 48) = v11;
  long long v12 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = *(void *)(v9 + 64);

  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  id v19 = *(void **)(a1 + v18);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);

  return a1;
}

uint64_t getEnumTagSinglePayload for RecognizedItem.Barcode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_217962268);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21797C608();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 64);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for RecognizedItem.Barcode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_217962344);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_21797C608();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 64) = (a2 - 1);
  }
  return result;
}

uint64_t sub_217962408()
{
  return sub_217962414();
}

uint64_t sub_217962414()
{
  uint64_t result = sub_21797C608();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for VNBarcodeSymbology(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_217962500(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_217962520(uint64_t result, int a2, int a3)
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

void sub_217962560(void *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_217962568(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_21796257C(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

void *sub_217962590@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_21796259C(void *result)
{
  *v1 |= *result;
  return result;
}

uint64_t sub_2179625B0(uint64_t a1, uint64_t a2)
{
  return sub_21796299C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2179625C8(uint64_t a1, id *a2)
{
  uint64_t result = sub_21797C738();
  *a2 = 0;
  return result;
}

uint64_t sub_217962640(uint64_t a1, id *a2)
{
  char v3 = sub_21797C748();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2179626C0@<X0>(uint64_t *a1@<X8>)
{
  sub_21797C758();
  uint64_t v2 = sub_21797C728();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_217962704@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_217962718(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_217962748(void *result)
{
  *v1 &= *result;
  return result;
}

void sub_21796275C(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_217962768(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21796277C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21797C728();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2179627C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21797C758();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2179627F0(uint64_t a1)
{
  uint64_t v2 = sub_2179628F4(&qword_267BA4400, type metadata accessor for VNBarcodeSymbology);
  uint64_t v3 = sub_2179628F4(&qword_267BA4408, type metadata accessor for VNBarcodeSymbology);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2179628AC()
{
  return sub_2179628F4(&qword_267BA43E8, type metadata accessor for VNBarcodeSymbology);
}

uint64_t sub_2179628F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21796293C()
{
  return sub_2179628F4(&qword_267BA43F0, type metadata accessor for VNBarcodeSymbology);
}

uint64_t sub_217962984(uint64_t a1, uint64_t a2)
{
  return sub_21796299C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_21796299C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_21797C758();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2179629E0()
{
  sub_21797C758();
  sub_21797C768();

  return swift_bridgeObjectRelease();
}

uint64_t sub_217962A34()
{
  sub_21797C758();
  sub_21797CA88();
  sub_21797C768();
  uint64_t v0 = sub_21797CAA8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_217962AA8()
{
  uint64_t v0 = sub_21797C758();
  uint64_t v2 = v1;
  if (v0 == sub_21797C758() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_21797CA08();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_217962B34()
{
  return sub_2179628F4(&qword_267BA43F8, type metadata accessor for VNBarcodeSymbology);
}

void type metadata accessor for VKSceneStabilityState(uint64_t a1)
{
}

uint64_t sub_217962B90(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_217962BB0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

void sub_217962BEC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_217962C54()
{
  return 1;
}

uint64_t ImageAnalysisInteractionDelegate.interaction(_:shouldBeginAt:for:)()
{
  return 1;
}

double sub_217962C64()
{
  return 0.0;
}

double ImageAnalysisInteractionDelegate.contentsRect(for:)()
{
  return 0.0;
}

id sub_217962C8C(uint64_t a1)
{
  id v1 = objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view);

  return v1;
}

id ImageAnalysisInteractionDelegate.contentView(for:)(uint64_t a1)
{
  id v1 = objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view);

  return v1;
}

id sub_217962D0C(uint64_t a1)
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view));
  id v2 = objc_msgSend(v1, sel_window);

  id v3 = objc_msgSend(v2, sel_rootViewController);
  return v3;
}

id ImageAnalysisInteractionDelegate.presentingViewController(for:)(uint64_t a1)
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view));
  id v2 = objc_msgSend(v1, sel_window);

  id v3 = objc_msgSend(v2, sel_rootViewController);
  return v3;
}

id ImageAnalysisInteraction.view.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view);

  return v1;
}

uint64_t ImageAnalysisInteraction.InteractionTypes.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t ImageAnalysisInteraction.InteractionTypes.rawValue.setter(uint64_t result)
{
  *id v1 = result;
  return result;
}

uint64_t (*ImageAnalysisInteraction.InteractionTypes.rawValue.modify())()
{
  return nullsub_1;
}

VisionKit::ImageAnalysisInteraction::InteractionTypes __swiftcall ImageAnalysisInteraction.InteractionTypes.init(rawValue:)(VisionKit::ImageAnalysisInteraction::InteractionTypes rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ImageAnalysisInteraction.InteractionTypes.automatic.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static ImageAnalysisInteraction.InteractionTypes.automaticTextOnly.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void static ImageAnalysisInteraction.InteractionTypes.textSelection.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static ImageAnalysisInteraction.InteractionTypes.dataDetectors.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static ImageAnalysisInteraction.InteractionTypes.imageSubject.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static ImageAnalysisInteraction.InteractionTypes.visualLookUp.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void *sub_217962F1C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_217962F30@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

void *sub_217962F44@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_217962F70@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_217962F94(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_217962FA8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_217962FBC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_217962FD0()
{
  return *v0 == 0;
}

uint64_t sub_217962FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_217962FF8(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_21796300C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

id ImageAnalysisInteraction.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

char *ImageAnalysisInteraction.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction;
  id v3 = objc_allocWithZone(MEMORY[0x263F847E0]);
  uint64_t v4 = v0;
  *(void *)&v0[v2] = objc_msgSend(v3, sel_init);
  uint64_t v5 = OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_proxy;
  *(void *)&v4[v5] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ImageAnalysisInteractionDelegateProxy()), sel_init);
  *(void *)&v4[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_analysis] = 0;
  *(void *)&v4[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes] = 0;

  v10.receiver = v4;
  v10.super_class = ObjectType;
  uint64_t v6 = (char *)objc_msgSendSuper2(&v10, sel_init);
  uint64_t v7 = *(void **)&v6[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction];
  uint64_t v8 = v6;
  objc_msgSend(v7, sel_setActionInfoViewHidden_, 0);
  objc_msgSend(v7, sel_set_isPublicAPI_, 1);
  objc_msgSend(v7, sel_setDelegate_, *(void *)&v8[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_proxy]);
  objc_msgSend(v7, sel_setAnalysisButtonRequiresVisibleContentGating_, 0);
  swift_unknownObjectWeakAssign();

  return v8;
}

uint64_t type metadata accessor for ImageAnalysisInteractionDelegateProxy()
{
  return self;
}

id ImageAnalysisInteraction._internalInteraction.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
}

uint64_t ImageAnalysisInteraction.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  return MEMORY[0x21D450800](v1);
}

uint64_t sub_21796325C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  uint64_t v4 = *a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = v2;
  uint64_t v5 = swift_unknownObjectWeakAssign();
  uint64_t v6 = *(void **)(v3 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  uint64_t v7 = MEMORY[0x21D450800](v5);
  swift_unknownObjectRetain();
  if (v7) {
    swift_unknownObjectRelease();
  }
  objc_msgSend(v6, sel_set_publicAPIDelegateExists_, v7 != 0);
  return swift_unknownObjectRelease();
}

uint64_t ImageAnalysisInteraction.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  uint64_t v5 = swift_unknownObjectWeakAssign();
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  uint64_t v7 = MEMORY[0x21D450800](v5);
  if (v7) {
    swift_unknownObjectRelease();
  }
  objc_msgSend(v6, sel_set_publicAPIDelegateExists_, v7 != 0);
  return swift_unknownObjectRelease();
}

void (*ImageAnalysisInteraction.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x21D450800](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_217963434;
}

void sub_217963434(uint64_t a1, char a2)
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
    uint64_t v4 = v3[5];
    uint64_t v5 = v4 + v3[6];
    swift_endAccess();
    swift_unknownObjectRelease();
    uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    uint64_t v7 = MEMORY[0x21D450800](v5);
    if (v7) {
      swift_unknownObjectRelease();
    }
    objc_msgSend(v6, sel_set_publicAPIDelegateExists_, v7 != 0);
  }

  free(v3);
}

char *ImageAnalysisInteraction.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v5 = &v4[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate];
  swift_beginAccess();
  *((void *)v5 + 1) = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t ImageAnalysisInteraction.analysis.getter()
{
  return swift_retain();
}

uint64_t ImageAnalysisInteraction.analysis.setter(uint64_t a1)
{
  sub_217968148(a1);

  return swift_release();
}

void (*ImageAnalysisInteraction.analysis.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_analysis;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_217963678;
}

void sub_217963678(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    uint64_t v5 = *(void **)(v4 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    uint64_t v6 = *(void *)(v4 + v3[4]);
    if (v6) {
      id v7 = *(id *)(v6 + 16);
    }
    else {
      id v7 = 0;
    }
    objc_msgSend(v5, sel_setAnalysis_, v7);
  }

  free(v3);
}

Swift::Void __swiftcall ImageAnalysisInteraction.willMove(to:)(UIView_optional *to)
{
  if (!to)
  {
    uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    id v3 = objc_msgSend(v2, sel_view);
    if (v3)
    {
      id v4 = v3;
      objc_msgSend(v3, sel_removeInteraction_, v2);
    }
  }
}

Swift::Void __swiftcall ImageAnalysisInteraction.didMove(to:)(UIView_optional *to)
{
  if (to)
  {
    uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    id v3 = to;
    [(UIView_optional *)v3 addInteraction:v2];
    sub_21796860C(0, &qword_267BA4450);
    objc_msgSend(v2, sel_setWantsAutomaticContentsRectCalculation_, -[UIView_optional isKindOfClass:](v3, sel_isKindOfClass_, swift_getObjCClassFromMetadata()));
  }
}

uint64_t ImageAnalysisInteraction.preferredInteractionTypes.getter@<X0>(void *a1@<X8>)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  uint64_t result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

void ImageAnalysisInteraction.preferredInteractionTypes.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  swift_beginAccess();
  *id v3 = v2;
  sub_217963A38();
}

void sub_217963A38()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  swift_beginAccess();
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  uint64_t v3 = *v1;
  objc_msgSend(v2, sel_set_isInPublicAutomaticMode_, (*v1 & 0x21) != 0);
  if (v3)
  {
    if (objc_msgSend(v2, sel_highlightSelectableItems)) {
      uint64_t v5 = 11;
    }
    else {
      uint64_t v5 = 9;
    }
  }
  else
  {
    if ((v3 & 0x20) == 0)
    {
      uint64_t v4 = *v1;
      if (*v1)
      {
        if ((v4 & 0x20) == 0)
        {
          uint64_t v5 = 9;
          if ((v4 & 2) == 0)
          {
            if ((v4 & 4) == 0) {
              goto LABEL_23;
            }
            goto LABEL_17;
          }
          goto LABEL_22;
        }
      }
      else if ((v4 & 0x20) == 0)
      {
        if ((v4 & 2) == 0)
        {
          uint64_t v5 = 0;
          if ((v4 & 4) == 0)
          {
LABEL_23:
            if ((v4 & 8) == 0)
            {
LABEL_24:
              if ((v4 & 0x10) == 0) {
                goto LABEL_26;
              }
              goto LABEL_25;
            }
LABEL_18:
            v5 |= 8uLL;
            if ((v4 & 0x10) == 0) {
              goto LABEL_26;
            }
LABEL_25:
            v5 |= 4uLL;
            goto LABEL_26;
          }
LABEL_17:
          v5 |= 2uLL;
          if ((v4 & 8) == 0) {
            goto LABEL_24;
          }
          goto LABEL_18;
        }
        uint64_t v5 = 1;
LABEL_22:
        if ((v4 & 4) == 0) {
          goto LABEL_23;
        }
        goto LABEL_17;
      }
      uint64_t v5 = 1;
      goto LABEL_26;
    }
    if (objc_msgSend(v2, sel_highlightSelectableItems)) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
  }
LABEL_26:
  objc_msgSend(v2, sel_setActiveInteractionTypes_, v5);
  if (*v1)
  {
    id v6 = objc_msgSend(v2, sel_view);
    if (v6)
    {
      id v7 = v6;
      objc_msgSend(v6, sel_setUserInteractionEnabled_, 1);
    }
  }
}

id ImageAnalysisInteraction.selectableItemsHighlighted.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_highlightSelectableItems);
}

void (*ImageAnalysisInteraction.preferredInteractionTypes.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_217963C30;
}

void sub_217963C30(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_217963A38();
  }
}

unint64_t ImageAnalysisInteraction.activeInteractionTypes.getter@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = (unint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_activeInteractionTypes);
  *a1 = result & 8 | (2 * (result & 3)) & 0xEF | (16 * ((result >> 2) & 1));
  return result;
}

id ImageAnalysisInteraction.selectableItemsHighlighted.setter(char a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setHighlightSelectableItems_, a1 & 1);
}

id (*ImageAnalysisInteraction.selectableItemsHighlighted.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = objc_msgSend(v3, sel_highlightSelectableItems);
  return sub_217963D2C;
}

id sub_217963D2C(uint64_t a1, uint64_t a2)
{
  return sub_217963DEC(a1, a2, (SEL *)&selRef_setHighlightSelectableItems_);
}

id ImageAnalysisInteraction.allowLongPressForDataDetectorsInTextMode.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_allowLongPressForDataDetectorsInTextMode);
}

id ImageAnalysisInteraction.allowLongPressForDataDetectorsInTextMode.setter(char a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setAllowLongPressForDataDetectorsInTextMode_, a1 & 1);
}

id (*ImageAnalysisInteraction.allowLongPressForDataDetectorsInTextMode.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = objc_msgSend(v3, sel_allowLongPressForDataDetectorsInTextMode);
  return sub_217963DE0;
}

id sub_217963DE0(uint64_t a1, uint64_t a2)
{
  return sub_217963DEC(a1, a2, (SEL *)&selRef_setAllowLongPressForDataDetectorsInTextMode_);
}

id sub_217963DEC(uint64_t a1, uint64_t a2, SEL *a3)
{
  return objc_msgSend(*(id *)a1, *a3, *(unsigned __int8 *)(a1 + 8));
}

id ImageAnalysisInteraction.hasActiveTextSelection.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_hasActiveTextSelection);
}

Swift::Void __swiftcall ImageAnalysisInteraction.resetTextSelection()()
{
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_resetSelection);
}

uint64_t ImageAnalysisInteraction.text.getter()
{
  return sub_217963E60((SEL *)&selRef_text);
}

uint64_t ImageAnalysisInteraction.selectedText.getter()
{
  return sub_217963E60((SEL *)&selRef_selectedText);
}

uint64_t sub_217963E60(SEL *a1)
{
  id v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), *a1));
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_21797C758();

  return v4;
}

uint64_t ImageAnalysisInteraction.selectedAttributedText.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_selectedAttributedText);
  if (!v1)
  {
    id v2 = objc_allocWithZone(MEMORY[0x263F086A0]);
    uint64_t v3 = (void *)sub_21797C728();
    id v1 = objc_msgSend(v2, sel_initWithString_, v3);
  }

  return MEMORY[0x270EEEE40](v1);
}

void *ImageAnalysisInteraction.selectedRanges.getter()
{
  id v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction], sel_selectedRanges);
  sub_21796860C(0, &qword_267BA4458);
  unint64_t v2 = sub_21797C798();

  uint64_t v3 = v0;
  uint64_t v4 = sub_2179681F0(v2, (uint64_t)v3);
  swift_bridgeObjectRelease();

  return v4;
}

void sub_21796401C(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  id v4 = objc_msgSend(*(id *)((char *)*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_selectedRanges);
  sub_21796860C(0, &qword_267BA4458);
  unint64_t v5 = sub_21797C798();

  id v6 = v3;
  id v7 = sub_2179681F0(v5, (uint64_t)v6);
  swift_bridgeObjectRelease();

  *a2 = v7;
}

void sub_2179640CC(uint64_t a1, id *a2)
{
  unint64_t v2 = *(void **)((char *)*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  id v3 = *a2;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_217968408(v4, (uint64_t)v3);
  swift_bridgeObjectRelease();

  sub_21796860C(0, &qword_267BA4458);
  id v5 = (id)sub_21797C788();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSelectedRanges_, v5);
}

void ImageAnalysisInteraction.selectedRanges.setter(uint64_t a1)
{
  id v3 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction];
  uint64_t v4 = v1;
  sub_217968408(a1, (uint64_t)v4);
  swift_bridgeObjectRelease();

  sub_21796860C(0, &qword_267BA4458);
  id v5 = (id)sub_21797C788();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setSelectedRanges_, v5);
}

void (*ImageAnalysisInteraction.selectedRanges.modify(void *a1))(uint64_t **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction];
  v3[1] = v1;
  v3[2] = v4;
  id v5 = objc_msgSend(v4, sel_selectedRanges);
  v3[3] = sub_21796860C(0, &qword_267BA4458);
  unint64_t v6 = sub_21797C798();

  id v7 = v1;
  uint64_t v8 = sub_2179681F0(v6, (uint64_t)v7);
  v3[4] = 0;

  swift_bridgeObjectRelease();
  *id v3 = v8;
  return sub_217964338;
}

void sub_217964338(uint64_t **a1, char a2)
{
  id v3 = *a1;
  uint64_t v4 = **a1;
  id v5 = (id)(*a1)[1];
  unint64_t v6 = (void *)v3[2];
  if (a2)
  {
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_217968408(v7, (uint64_t)v5);

    swift_bridgeObjectRelease();
    uint64_t v8 = (void *)sub_21797C788();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setSelectedRanges_, v8);

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_217968408(v4, (uint64_t)v5);

    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)sub_21797C788();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setSelectedRanges_, v9);
  }

  free(v3);
}

Swift::Void __swiftcall ImageAnalysisInteraction.setContentsRectNeedsUpdate()()
{
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_updateContentsRect);
}

id ImageAnalysisInteraction.contentsRect.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_contentsRect);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.hasInteractiveItem(at:)(CGPoint at)
{
  return sub_2179644B8((SEL *)&selRef_interactableItemExistsAtPoint_);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.hasText(at:)(CGPoint at)
{
  return sub_2179644B8((SEL *)&selRef_textExistsAtPoint_);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.hasDataDetector(at:)(CGPoint at)
{
  return sub_2179644B8((SEL *)&selRef_dataDetectorExistsAtPoint_);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.hasSupplementaryInterface(at:)(CGPoint at)
{
  return sub_2179644B8((SEL *)&selRef_actionInfoItemExistsAtPoint_);
}

Swift::Bool __swiftcall ImageAnalysisInteraction.analysisHasText(at:)(CGPoint at)
{
  return sub_2179644B8((SEL *)&selRef_analysisContainsTextAtPoint_);
}

id sub_2179644B8(SEL *a1)
{
  return [*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction) *a1];
}

id ImageAnalysisInteraction.liveTextButtonVisible.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_liveTextButtonVisible);
}

id ImageAnalysisInteraction.isSupplementaryInterfaceHidden.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoViewHidden);
}

id ImageAnalysisInteraction.isSupplementaryInterfaceHidden.setter(char a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoViewHidden_animated_, a1 & 1, 1);
}

id (*ImageAnalysisInteraction.isSupplementaryInterfaceHidden.modify(uint64_t a1))(uint64_t a1)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = objc_msgSend(v3, sel_actionInfoViewHidden);
  return sub_2179645BC;
}

id sub_2179645BC(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setActionInfoViewHidden_animated_, *(unsigned __int8 *)(a1 + 8), 1);
}

Swift::Void __swiftcall ImageAnalysisInteraction.setSupplementaryInterfaceHidden(_:animated:)(Swift::Bool _, Swift::Bool animated)
{
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoViewHidden_animated_, _, animated);
}

id ImageAnalysisInteraction.supplementaryInterfaceContentInsets.getter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoEdgeInsets);
}

id ImageAnalysisInteraction.supplementaryInterfaceContentInsets.setter()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoEdgeInsets_);
}

void (*ImageAnalysisInteraction.supplementaryInterfaceContentInsets.modify(void *a1))(double **a1)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v3[4] = v4;
  objc_msgSend(v4, sel_actionInfoEdgeInsets);
  *id v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  return sub_2179646A8;
}

void sub_2179646A8(double **a1)
{
  uint64_t v1 = *a1;
  objc_msgSend(*((id *)*a1 + 4), sel_setActionInfoEdgeInsets_, *v1, v1[1], v1[2], v1[3]);

  free(v1);
}

id ImageAnalysisInteraction.supplementaryInterfaceFont.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoCustomFont);

  return v1;
}

void ImageAnalysisInteraction.supplementaryInterfaceFont.setter(void *a1)
{
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoCustomFont_, a1);
}

void (*ImageAnalysisInteraction.supplementaryInterfaceFont.modify(void *a1))(id *a1)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_actionInfoCustomFont);
  return sub_2179647E8;
}

void sub_2179647E8(id *a1)
{
  id v1 = *a1;
  objc_msgSend(a1[1], sel_setActionInfoCustomFont_);
}

uint64_t static ImageAnalysisInteraction.SubjectUnavailable.== infix(_:_:)()
{
  return 1;
}

uint64_t ImageAnalysisInteraction.SubjectUnavailable.hash(into:)()
{
  return sub_21797CA98();
}

uint64_t ImageAnalysisInteraction.SubjectUnavailable.hashValue.getter()
{
  return sub_21797CAA8();
}

uint64_t sub_2179648A4()
{
  return sub_21797CAA8();
}

uint64_t sub_2179648E8()
{
  return sub_21797CA98();
}

uint64_t sub_217964910()
{
  return sub_21797CAA8();
}

double ImageAnalysisInteraction.Subject.bounds.getter()
{
  uint64_t v1 = sub_21797C688();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void **)(v0 + 8);
  sub_21797C668();
  uint64_t v6 = (void *)sub_21797C638();
  objc_msgSend(v5, sel_imageSubjectBoundsWithIndexes_, v6);
  double v8 = v7;

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v8;
}

uint64_t ImageAnalysisInteraction.Subject.image.getter()
{
  uint64_t v2 = sub_21797C688();
  v1[16] = v2;
  v1[17] = *(void *)(v2 - 8);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = *v0;
  uint64_t v5 = v0[1];
  v1[18] = v3;
  v1[19] = v4;
  v1[20] = v5;
  return MEMORY[0x270FA2498](sub_217964B44, 0, 0);
}

uint64_t sub_217964B44()
{
  uint64_t v1 = (void *)v0[20];
  sub_21797C668();
  uint64_t v2 = sub_21797C638();
  v0[21] = v2;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_217964C68;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217964E7C;
  v0[13] = &block_descriptor;
  v0[14] = v3;
  objc_msgSend(v1, sel_loadImageSubjectWithIndexes_completion_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_217964C68()
{
  return MEMORY[0x270FA2498](sub_217964D48, 0, 0);
}

uint64_t sub_217964D48()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = (void *)v0[21];
  uint64_t v4 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v5 = v0[16];
  if (v1)
  {
    (*(void (**)(void, void))(v4 + 8))(v0[18], v0[16]);

    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
    return v6(v1);
  }
  else
  {

    sub_2179685B8();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    double v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_217964E7C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_2179693A4((uint64_t)&v6, v3);
  return swift_continuation_resume();
}

uint64_t ImageAnalysisInteraction.Subject.hash(into:)()
{
  return sub_21797CA98();
}

uint64_t static ImageAnalysisInteraction.Subject.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  sub_21796860C(0, &qword_267BA4470);
  return sub_21797C8E8() & 1;
}

uint64_t ImageAnalysisInteraction.Subject.hashValue.getter()
{
  return sub_21797CAA8();
}

uint64_t sub_217964FB8()
{
  return sub_21797CAA8();
}

uint64_t sub_217965000()
{
  return sub_21797CA98();
}

uint64_t sub_21796502C()
{
  return sub_21797CAA8();
}

uint64_t sub_217965070(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  sub_21796860C(0, &qword_267BA4470);
  return sub_21797C8E8() & 1;
}

uint64_t ImageAnalysisInteraction.subjects.getter()
{
  v1[19] = v0;
  uint64_t v2 = sub_21797C618();
  v1[20] = v2;
  v1[21] = *(void *)(v2 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  uint64_t v3 = sub_21797C688();
  v1[24] = v3;
  v1[25] = *(void *)(v3 - 8);
  v1[26] = swift_task_alloc();
  v1[27] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4480);
  v1[28] = swift_task_alloc();
  sub_21797C818();
  v1[29] = sub_21797C808();
  uint64_t v5 = sub_21797C7D8();
  v1[30] = v5;
  v1[31] = v4;
  return MEMORY[0x270FA2498](sub_217965270, v5, v4);
}

uint64_t sub_217965270()
{
  uint64_t v1 = *(void **)(v0[19] + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v0[32] = v1;
  v0[2] = v0;
  v0[3] = sub_217965374;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21796576C;
  v0[13] = &block_descriptor_4;
  v0[14] = v2;
  objc_msgSend(v1, sel_beginImageSubjectAnalysisIfNecessaryWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_217965374()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 248);
  uint64_t v2 = *(void *)(*(void *)v0 + 240);
  return MEMORY[0x270FA2498](sub_21796547C, v2, v1);
}

uint64_t sub_21796547C()
{
  v30 = v0;
  uint64_t v1 = (void *)v0[32];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[27];
  uint64_t v5 = v0[24];
  uint64_t v6 = v0[25];
  uint64_t v7 = v0[21];
  swift_release();
  uint64_t v28 = MEMORY[0x263F8EE88];
  id v8 = objc_msgSend(v1, sel_allSubjectIndexes);
  sub_21797C648();

  sub_21797C628();
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v26(v3, v5);
  uint64_t v9 = v2 + *(int *)(v4 + 36);
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v10 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  v25 = (void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  while (1)
  {
    uint64_t v11 = v0[23];
    uint64_t v12 = v0[22];
    uint64_t v13 = v0[20];
    v27(v11, v9, v13);
    sub_2179686F8(&qword_267BA4488, MEMORY[0x263F07978]);
    sub_21797C868();
    sub_2179686F8(&qword_267BA4490, MEMORY[0x263F07948]);
    char v14 = sub_21797C718();
    uint64_t v15 = *v10;
    (*v10)(v12, v13);
    v15(v11, v13);
    if (v14) {
      break;
    }
    uint64_t v16 = (void *)v0[32];
    uint64_t v17 = v0[28];
    uint64_t v18 = v0[26];
    uint64_t v19 = v0[24];
    id v20 = (void (*)(void *, void))sub_21797C888();
    uint64_t v22 = *v21;
    v20(v0 + 15, 0);
    (*v25)(v18, v17, v19);
    sub_21797C878();
    v26(v18, v19);
    sub_217967154(v29, v22, v16);
  }
  sub_21796868C(v0[28]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(uint64_t))v0[1];
  return v23(v28);
}

uint64_t sub_21796576C()
{
  return swift_continuation_resume();
}

uint64_t ImageAnalysisInteraction.highlightedSubjects.getter()
{
  uint64_t v1 = sub_21797C618();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  v35 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v34 = (char *)&v28 - v5;
  uint64_t v6 = sub_21797C688();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4480);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x263F8EE88];
  id v30 = *(id *)(v0 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  id v14 = objc_msgSend(v30, sel_selectedSubjectIndexes);
  sub_21797C648();

  sub_21797C628();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v31 = v9;
  v29 = v15;
  v15(v9, v6);
  uint64_t v16 = &v13[*(int *)(v11 + 44)];
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v32 = v7 + 8;
  v33 = v17;
  uint64_t v36 = v2 + 16;
  uint64_t v18 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v28 = (void (**)(char *, char *, uint64_t))(v7 + 16);
  id v20 = v34;
  uint64_t v19 = v35;
  while (1)
  {
    v33(v20, v16, v1);
    sub_2179686F8(&qword_267BA4488, MEMORY[0x263F07978]);
    sub_21797C868();
    sub_2179686F8(&qword_267BA4490, MEMORY[0x263F07948]);
    char v21 = sub_21797C718();
    uint64_t v22 = *v18;
    (*v18)(v19, v1);
    v22(v20, v1);
    if (v21) {
      break;
    }
    uint64_t v23 = (void (*)(uint64_t *, void))sub_21797C888();
    uint64_t v25 = *v24;
    v23(v37, 0);
    uint64_t v26 = v31;
    (*v28)(v31, v13, v6);
    sub_21797C878();
    v29(v26, v6);
    sub_217967154(v37, v25, v30);
  }
  sub_21796868C((uint64_t)v13);
  return v38;
}

id ImageAnalysisInteraction.highlightedSubjects.setter(uint64_t a1)
{
  uint64_t v3 = sub_21797C688();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    uint64_t v33 = v8;
    v34 = (char *)&v32 - v6;
    uint64_t v35 = v1;
    uint64_t v36 = v7;
    uint64_t v37 = v5;
    v39 = (void *)MEMORY[0x263F8EE78];
    sub_217967BE0(0, v9, 0);
    uint64_t v10 = v39;
    id result = (id)sub_217967FC4(a1);
    int64_t v12 = (int64_t)result;
    int v14 = v13;
    char v16 = v15 & 1;
    do
    {
      if (v12 < 0 || v12 >= 1 << *(unsigned char *)(a1 + 32))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
        return result;
      }
      if (((*(void *)(a1 + 56 + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        goto LABEL_18;
      }
      if (*(_DWORD *)(a1 + 36) != v14) {
        goto LABEL_19;
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 16 * v12);
      v39 = v10;
      unint64_t v19 = v10[2];
      unint64_t v18 = v10[3];
      if (v19 >= v18 >> 1)
      {
        sub_217967BE0(v18 > 1, v19 + 1, 1);
        uint64_t v10 = v39;
      }
      v10[2] = v19 + 1;
      v10[v19 + 4] = v17;
      id result = (id)sub_217968064(v12, v14, v16 & 1, a1);
      int64_t v12 = (int64_t)result;
      int v14 = v20;
      char v16 = v21 & 1;
      --v9;
    }
    while (v9);
    sub_2179686EC((uint64_t)result, v20, v21 & 1);
    swift_bridgeObjectRelease();
    sub_2179686F8(&qword_267BA4498, MEMORY[0x263F07978]);
    uint64_t v22 = v33;
    uint64_t v23 = v37;
    sub_21797C938();
    uint64_t v24 = v10[2];
    if (v24)
    {
      uint64_t v25 = v10 + 4;
      do
      {
        uint64_t v26 = *v25++;
        uint64_t v38 = v26;
        sub_21797C918();
        --v24;
      }
      while (v24);
    }
    swift_release();
    uint64_t v27 = v36;
    uint64_t v28 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v34, v22, v23);
    v29 = *(void **)(v35 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    id v30 = (void *)sub_21797C638();
    objc_msgSend(v29, sel_highlightSubjectAtIndexSet_showCallout_showBurst_burstPoint_animated_, v30, 0, 0, 1, 0.0, 0.0);

    return (id)(*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v28, v23);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v31 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    return objc_msgSend(v31, sel_highlightSubjectAtIndexSet_showCallout_showBurst_burstPoint_animated_, 0, 0, 0, 1, 0.0, 0.0);
  }
}

id (*ImageAnalysisInteraction.highlightedSubjects.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = ImageAnalysisInteraction.highlightedSubjects.getter();
  return sub_217965F20;
}

id sub_217965F20(uint64_t *a1, char a2)
{
  if ((a2 & 1) == 0) {
    return ImageAnalysisInteraction.highlightedSubjects.setter(*a1);
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  ImageAnalysisInteraction.highlightedSubjects.setter(v2);

  return (id)swift_bridgeObjectRelease();
}

uint64_t ImageAnalysisInteraction.subject(at:)(uint64_t a1, double a2, double a3)
{
  *(void *)(v4 + 144) = v3;
  *(double *)(v4 + 128) = a2;
  *(double *)(v4 + 136) = a3;
  *(void *)(v4 + 120) = a1;
  sub_21797C818();
  *(void *)(v4 + 152) = sub_21797C808();
  uint64_t v6 = sub_21797C7D8();
  *(void *)(v4 + 160) = v6;
  *(void *)(v4 + 168) = v5;
  return MEMORY[0x270FA2498](sub_217966018, v6, v5);
}

uint64_t sub_217966018()
{
  uint64_t v1 = *(void **)(v0[18] + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  v0[22] = v1;
  v0[2] = v0;
  v0[3] = sub_21796611C;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21796576C;
  v0[13] = &block_descriptor_5;
  v0[14] = v2;
  objc_msgSend(v1, sel_beginImageSubjectAnalysisIfNecessaryWithCompletion_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21796611C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 168);
  uint64_t v2 = *(void *)(*(void *)v0 + 160);
  return MEMORY[0x270FA2498](sub_217966224, v2, v1);
}

uint64_t sub_217966224()
{
  id v1 = objc_msgSend(*(id *)(v0 + 176), sel_subjectIndexAtPoint_, *(double *)(v0 + 128), *(double *)(v0 + 136));
  if (v1)
  {
    uint64_t v2 = v1;
    *(void *)(v0 + 184) = objc_msgSend(v1, sel_integerValue);

    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_21796632C;
    return ImageAnalysisInteraction.subjects.getter();
  }
  else
  {
    uint64_t v5 = *(void **)(v0 + 120);
    swift_release();
    void *v5 = 0;
    v5[1] = 0;
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_21796632C(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 168);
  uint64_t v4 = *(void *)(v2 + 160);
  return MEMORY[0x270FA2498](sub_217966454, v4, v3);
}

uint64_t sub_217966454()
{
  uint64_t v1 = v0[25];
  uint64_t result = swift_release();
  int64_t v3 = 0;
  uint64_t v4 = v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(v1 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v1 + 56);
  int64_t v8 = (unint64_t)(63 - v5) >> 6;
  while (v7)
  {
    unint64_t v9 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v10 = v9 | (v3 << 6);
LABEL_6:
    uint64_t v11 = v0[23];
    uint64_t v12 = *(void *)(v1 + 48);
    if (*(void *)(v12 + 16 * v10) == v11)
    {
      char v16 = (void *)v0[15];
      id v17 = *(id *)(v12 + 16 * v10 + 8);
      swift_release();
      *char v16 = v11;
      v16[1] = v17;
      goto LABEL_28;
    }
  }
  int64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
LABEL_32:
    __break(1u);
    return result;
  }
  if (v13 >= v8) {
    goto LABEL_27;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  ++v3;
  if (v14) {
    goto LABEL_25;
  }
  int64_t v3 = v13 + 1;
  if (v13 + 1 >= v8) {
    goto LABEL_27;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v3);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v3 = v13 + 2;
  if (v13 + 2 >= v8) {
    goto LABEL_27;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v3);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v3 = v13 + 3;
  if (v13 + 3 >= v8) {
    goto LABEL_27;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v3);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v3 = v13 + 4;
  if (v13 + 4 >= v8) {
    goto LABEL_27;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v3);
  if (v14)
  {
LABEL_25:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_6;
  }
  int64_t v15 = v13 + 5;
  if (v15 < v8)
  {
    unint64_t v14 = *(void *)(v4 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v3 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_32;
        }
        if (v3 >= v8) {
          goto LABEL_27;
        }
        unint64_t v14 = *(void *)(v4 + 8 * v3);
        ++v15;
        if (v14) {
          goto LABEL_25;
        }
      }
    }
    int64_t v3 = v15;
    goto LABEL_25;
  }
LABEL_27:
  unint64_t v18 = (void *)v0[15];
  swift_release();
  *unint64_t v18 = 0;
  v18[1] = 0;
LABEL_28:
  unint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t ImageAnalysisInteraction.image(for:)(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  uint64_t v3 = sub_21797C688();
  v2[18] = v3;
  v2[19] = *(void *)(v3 - 8);
  v2[20] = swift_task_alloc();
  sub_21797C818();
  v2[21] = sub_21797C808();
  uint64_t v5 = sub_21797C7D8();
  v2[22] = v5;
  v2[23] = v4;
  return MEMORY[0x270FA2498](sub_21796671C, v5, v4);
}

uint64_t sub_21796671C()
{
  uint64_t v1 = v0[16];
  sub_21797C678();
  uint64_t v2 = v1 + 56;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  uint64_t v5 = v3 & *(void *)(v1 + 56);
  int64_t v6 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_25:
      __break(1u);
      return MEMORY[0x270FA23F0](v7);
    }
    if (v9 >= v6) {
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(v2 + 8 * v9);
    ++v8;
    if (!v10)
    {
      int64_t v8 = v9 + 1;
      if (v9 + 1 >= v6) {
        goto LABEL_21;
      }
      uint64_t v10 = *(void *)(v2 + 8 * v8);
      if (!v10)
      {
        int64_t v8 = v9 + 2;
        if (v9 + 2 >= v6) {
          goto LABEL_21;
        }
        uint64_t v10 = *(void *)(v2 + 8 * v8);
        if (!v10) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v5 = (v10 - 1) & v10;
LABEL_5:
    uint64_t v7 = sub_21797C658();
  }
  int64_t v11 = v9 + 3;
  if (v11 < v6)
  {
    uint64_t v10 = *(void *)(v2 + 8 * v11);
    if (!v10)
    {
      while (1)
      {
        int64_t v8 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_25;
        }
        if (v8 >= v6) {
          goto LABEL_21;
        }
        uint64_t v10 = *(void *)(v2 + 8 * v8);
        ++v11;
        if (v10) {
          goto LABEL_20;
        }
      }
    }
    int64_t v8 = v11;
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v12 = v0[17];
  swift_release();
  int64_t v13 = *(void **)(v12 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  uint64_t v14 = sub_21797C638();
  v0[24] = v14;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_21796695C;
  uint64_t v15 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_217964E7C;
  v0[13] = &block_descriptor_7;
  v0[14] = v15;
  objc_msgSend(v13, sel_loadImageSubjectWithIndexes_completion_, v14, v0 + 10);
  uint64_t v7 = (uint64_t)(v0 + 2);
  return MEMORY[0x270FA23F0](v7);
}

uint64_t sub_21796695C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  uint64_t v2 = *(void *)(*(void *)v0 + 176);
  return MEMORY[0x270FA2498](sub_217966A64, v2, v1);
}

uint64_t sub_217966A64()
{
  swift_release();
  uint64_t v1 = v0[15];
  uint64_t v2 = (void *)v0[24];
  uint64_t v4 = v0[19];
  uint64_t v3 = v0[20];
  uint64_t v5 = v0[18];
  if (v1)
  {
    (*(void (**)(void, void))(v4 + 8))(v0[20], v0[18]);

    swift_task_dealloc();
    int64_t v6 = (uint64_t (*)(uint64_t))v0[1];
    return v6(v1);
  }
  else
  {

    sub_2179685B8();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    int64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

id ImageAnalysisInteraction.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_217967110()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImageAnalysisInteractionDelegateProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_217967154(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  sub_21797CA88();
  sub_21797CA98();
  uint64_t v9 = sub_21797CAA8();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v24 = a1;
    uint64_t v12 = ~v10;
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v13 = *(void *)(v8 + 48);
      if (*(void *)(v13 + 16 * v11) == a2)
      {
        uint64_t v14 = *(void **)(v13 + 16 * v11 + 8);
        sub_21796860C(0, &qword_267BA4470);
        id v15 = v14;
        char v16 = sub_21797C8E8();

        if (v16)
        {

          swift_bridgeObjectRelease();
          uint64_t v17 = (uint64_t *)(*(void *)(*v4 + 48) + 16 * v11);
          uint64_t v19 = *v17;
          unint64_t v18 = (void *)v17[1];
          uint64_t *v24 = v19;
          v24[1] = (uint64_t)v18;
          id v20 = v18;
          return 0;
        }
      }
      unint64_t v11 = (v11 + 1) & v12;
    }
    while (((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    swift_bridgeObjectRelease();
    a1 = v24;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v25 = *v4;
  *uint64_t v4 = 0x8000000000000000;
  id v23 = a3;
  sub_2179675E0(a2, (uint64_t)v23, v11, isUniquelyReferenced_nonNull_native);
  *uint64_t v4 = v25;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = (uint64_t)v23;
  return 1;
}

uint64_t sub_217967310()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45C0);
  uint64_t result = sub_21797C978();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    v29 = (void *)(v2 + 56);
    uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9) {
          goto LABEL_33;
        }
        unint64_t v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v16 = v29[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v16 = v29[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v29 = -1 << v28;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v29[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      unint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      sub_21797CA88();
      sub_21797CA98();
      uint64_t result = sub_21797CAA8();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = (void *)(*(void *)(v4 + 48) + 16 * v11);
      *uint64_t v12 = v20;
      v12[1] = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

void sub_2179675E0(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  unint64_t v8 = *(void *)(*v4 + 16);
  unint64_t v9 = *(void *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0) {
    goto LABEL_14;
  }
  if (a4)
  {
    sub_217967310();
  }
  else
  {
    if (v9 > v8)
    {
      sub_21796778C();
      goto LABEL_14;
    }
    sub_217967940();
  }
  uint64_t v10 = *v4;
  sub_21797CA88();
  sub_21797CA98();
  uint64_t v11 = sub_21797CAA8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  a3 = v11 & ~v12;
  if ((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v13 = ~v12;
    while (1)
    {
      uint64_t v14 = *(void *)(v10 + 48);
      if (*(void *)(v14 + 16 * a3) == a1)
      {
        int64_t v15 = *(void **)(v14 + 16 * a3 + 8);
        sub_21796860C(0, &qword_267BA4470);
        id v16 = v15;
        char v17 = sub_21797C8E8();

        if (v17) {
          break;
        }
      }
      a3 = (a3 + 1) & v13;
      if (((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
        goto LABEL_14;
      }
    }
    sub_21797CA28();
    __break(1u);
  }
LABEL_14:
  uint64_t v18 = *v23;
  *(void *)(*v23 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v19 = (void *)(*(void *)(v18 + 48) + 16 * a3);
  *uint64_t v19 = a1;
  v19[1] = a2;
  uint64_t v20 = *(void *)(v18 + 16);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21) {
    __break(1u);
  }
  else {
    *(void *)(v18 + 16) = v22;
  }
}

id sub_21796778C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21797C968();
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22)
      {
        int64_t v9 = v21 + 2;
        if (v21 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v6 + 8 * v9);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = (void *)v17[1];
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v20 = v19;
    v20[1] = v18;
    id result = v18;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v13) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_217967940()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45C0);
  uint64_t result = sub_21797C978();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v28 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v28) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v28) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
    uint64_t v19 = *v18;
    uint64_t v20 = (void *)v18[1];
    sub_21797CA88();
    sub_21797CA98();
    uint64_t result = sub_21797CAA8();
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 16 * v11);
    *unint64_t v12 = v19;
    v12[1] = v20;
    ++*(void *)(v4 + 16);
    uint64_t result = v20;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v28) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_217967BE0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_217967C20(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_217967C00(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_217967D80(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_217967C20(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21797C9E8();
  __break(1u);
  return result;
}

uint64_t sub_217967D80(char a1, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45B0);
  uint64_t v10 = *(void *)(type metadata accessor for RecognizedItem(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(type metadata accessor for RecognizedItem(0) - 8);
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
  uint64_t result = sub_21797C9E8();
  __break(1u);
  return result;
}

uint64_t sub_217967FC4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_217968064(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_217968148(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_analysis;
  swift_beginAccess();
  *(void *)uint64_t v3 = a1;
  swift_retain();
  swift_release();
  unint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
  if (*(void *)v3) {
    id v5 = *(id *)(*(void *)v3 + 16);
  }
  else {
    id v5 = 0;
  }
  objc_msgSend(v4, sel_setAnalysis_, v5);
}

void *sub_2179681F0(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_21797C9B8())
  {
    id v20 = *(id *)(a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    unint64_t v22 = v3 & 0xC000000000000001;
    unint64_t v23 = (void *)MEMORY[0x263F8EE78];
    uint64_t v5 = 4;
    unint64_t v21 = v3;
    while (1)
    {
      id v7 = v22 ? (id)MEMORY[0x21D4500C0](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      unint64_t v8 = v7;
      uint64_t v9 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      a2 = v4;
      objc_msgSend(v7, sel_rangeValue);
      id v10 = objc_msgSend(v20, sel_text);
      if (v10)
      {
        unint64_t v11 = v10;
        sub_21797C758();
      }
      uint64_t v12 = sub_21797C898();
      uint64_t v14 = v13;
      char v16 = v15;

      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v23 = sub_217977944(0, v23[2] + 1, 1, v23);
        }
        unint64_t v18 = v23[2];
        unint64_t v17 = v23[3];
        if (v18 >= v17 >> 1) {
          unint64_t v23 = sub_217977944((void *)(v17 > 1), v18 + 1, 1, v23);
        }
        v23[2] = v18 + 1;
        uint64_t v6 = &v23[2 * v18];
        v6[4] = v12;
        v6[5] = v14;
      }
      ++v5;
      uint64_t v4 = a2;
      unint64_t v3 = v21;
      if (v9 == a2) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  unint64_t v23 = (void *)MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_217968408(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = self;
    uint64_t v7 = 0;
    unint64_t v8 = *(void **)(a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    do
    {
      id v9 = objc_msgSend(v8, sel_text);
      if (v9)
      {
        id v10 = v9;
        sub_21797C758();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45D0);
      sub_21796940C();
      sub_2179694B0();
      uint64_t v11 = sub_21797C8F8();
      if (objc_msgSend(v6, sel_valueWithRange_, v11, v12))
      {
        MEMORY[0x21D44FEB0]();
        if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21797C7B8();
        }
        sub_21797C7C8();
        sub_21797C7A8();
      }
      ++v7;
    }
    while (v4 != v7);
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

unint64_t sub_2179685B8()
{
  unint64_t result = qword_267BA4468;
  if (!qword_267BA4468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4468);
  }
  return result;
}

uint64_t sub_21796860C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21796868C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4480);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2179686EC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2179686F8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_217968744()
{
  unint64_t result = qword_267BA44B0;
  if (!qword_267BA44B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA44B0);
  }
  return result;
}

unint64_t sub_21796879C()
{
  unint64_t result = qword_267BA44B8;
  if (!qword_267BA44B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA44B8);
  }
  return result;
}

unint64_t sub_2179687F4()
{
  unint64_t result = qword_267BA44C0;
  if (!qword_267BA44C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA44C0);
  }
  return result;
}

unint64_t sub_21796884C()
{
  unint64_t result = qword_267BA44C8;
  if (!qword_267BA44C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA44C8);
  }
  return result;
}

unint64_t sub_2179688A4()
{
  unint64_t result = qword_267BA44D0;
  if (!qword_267BA44D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA44D0);
  }
  return result;
}

unint64_t sub_2179688FC()
{
  unint64_t result = qword_267BA44D8;
  if (!qword_267BA44D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA44D8);
  }
  return result;
}

uint64_t sub_217968950@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x21D450800](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_2179689B0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_analysis);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t sub_217968A08()
{
  uint64_t v0 = swift_retain();
  sub_217968148(v0);

  return swift_release();
}

uint64_t sub_217968A4C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_217968AA0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_preferredInteractionTypes);
  swift_beginAccess();
  *uint64_t v3 = v2;
  sub_217963A38();
}

id sub_217968AFC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_13Tm(a1, (SEL *)&selRef_highlightSelectableItems, a2);
}

id sub_217968B08(unsigned __int8 *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, (SEL *)&selRef_setHighlightSelectableItems_);
}

id sub_217968B14@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_13Tm(a1, (SEL *)&selRef_allowLongPressForDataDetectorsInTextMode, a2);
}

id sub_217968B20(unsigned __int8 *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, (SEL *)&selRef_setAllowLongPressForDataDetectorsInTextMode_);
}

id keypath_set_14Tm(unsigned __int8 *a1, void *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), *a5, *a1);
}

id sub_217968B50@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_13Tm(a1, (SEL *)&selRef_actionInfoViewHidden, a2);
}

id keypath_get_13Tm@<X0>(void *a1@<X0>, SEL *a2@<X3>, unsigned char *a3@<X8>)
{
  id result = [*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction) *a2];
  *a3 = (_BYTE)result;
  return result;
}

id sub_217968B98(unsigned __int8 *a1, void *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoViewHidden_animated_, *a1, 1);
}

id sub_217968BBC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoEdgeInsets);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

id sub_217968C00(double *a1, void *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoEdgeInsets_, *a1, a1[1], a1[2], a1[3]);
}

id sub_217968C24@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_actionInfoCustomFont);
  *a2 = result;
  return result;
}

id sub_217968C6C(void *a1, void *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_setActionInfoCustomFont_, *a1);
}

uint64_t sub_217968C90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ImageAnalysisInteraction.highlightedSubjects.getter();
  *a1 = result;
  return result;
}

id sub_217968CBC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return ImageAnalysisInteraction.highlightedSubjects.setter(v0);
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.interaction(_:shouldBeginAt:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.contentsRect(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.contentView(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.presentingViewController(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.interaction(_:liveTextButtonDidChangeToVisible:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.interaction(_:highlightSelectedItemsDidChange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ImageAnalysisInteractionDelegate.textSelectionDidChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t type metadata accessor for ImageAnalysisInteraction()
{
  return self;
}

ValueMetadata *type metadata accessor for ImageAnalysisInteraction.InteractionTypes()
{
  return &type metadata for ImageAnalysisInteraction.InteractionTypes;
}

uint64_t getEnumTagSinglePayload for ImageAnalysisInteraction.SubjectUnavailable(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for ImageAnalysisInteraction.SubjectUnavailable(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x217968E98);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_217968EC0()
{
  return 0;
}

ValueMetadata *type metadata accessor for ImageAnalysisInteraction.SubjectUnavailable()
{
  return &type metadata for ImageAnalysisInteraction.SubjectUnavailable;
}

void *initializeBufferWithCopyOfBuffer for ImageAnalysisInteraction.Subject(void *a1, void *a2)
{
  int v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for ImageAnalysisInteraction.Subject(uint64_t a1)
{
}

void *assignWithCopy for ImageAnalysisInteraction.Subject(void *a1, void *a2)
{
  *a1 = *a2;
  int v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for ImageAnalysisInteraction.Subject(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for ImageAnalysisInteraction.Subject(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImageAnalysisInteraction.Subject(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageAnalysisInteraction.Subject()
{
  return &type metadata for ImageAnalysisInteraction.Subject;
}

uint64_t sub_21796901C(unint64_t a1, double a2, double a3)
{
  uint64_t v7 = MEMORY[0x21D450800](v3 + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner);
  if (!v7) {
    goto LABEL_5;
  }
  unint64_t v8 = (void *)v7;
  uint64_t v9 = v7 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  if (!MEMORY[0x21D450800](v9))
  {

LABEL_5:
    char v12 = 1;
    return v12 & 1;
  }
  uint64_t v10 = *(void *)(v9 + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v14 = a1 & 8 | (2 * (a1 & 3)) & 0xEF | (16 * ((a1 >> 2) & 1));
  char v12 = (*(uint64_t (**)(void *, uint64_t *, uint64_t, uint64_t, double, double))(v10 + 8))(v8, &v14, ObjectType, v10, a2, a3);

  swift_unknownObjectRelease();
  return v12 & 1;
}

double sub_217969114()
{
  uint64_t v1 = MEMORY[0x21D450800](v0 + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner);
  double v2 = 0.0;
  if (v1)
  {
    uint64_t v3 = (void *)v1;
    uint64_t v4 = v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
    swift_beginAccess();
    if (MEMORY[0x21D450800](v4))
    {
      uint64_t v5 = *(void *)(v4 + 8);
      uint64_t ObjectType = swift_getObjectType();
      double v2 = (*(double (**)(void *, uint64_t, uint64_t))(v5 + 16))(v3, ObjectType, v5);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  return v2;
}

uint64_t sub_217969204()
{
  uint64_t v1 = MEMORY[0x21D450800](v0 + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner);
  if (!v1) {
    return 0;
  }
  double v2 = (void *)v1;
  uint64_t v3 = v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  if (!MEMORY[0x21D450800](v3))
  {

    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v4 + 24))(v2, ObjectType, v4);

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_2179692C0()
{
  uint64_t v1 = MEMORY[0x21D450800](v0 + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner);
  if (!v1) {
    return 0;
  }
  double v2 = (void *)v1;
  uint64_t v3 = v1 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
  swift_beginAccess();
  if (!MEMORY[0x21D450800](v3))
  {

    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v4 + 32))(v2, ObjectType, v4);

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_21796937C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2179693A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21796940C()
{
  unint64_t result = qword_267BA45D8;
  if (!qword_267BA45D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BA45D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA45D8);
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

unint64_t sub_2179694B0()
{
  unint64_t result = qword_267BA45E0;
  if (!qword_267BA45E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA45E0);
  }
  return result;
}

uint64_t ImageAnalysis.transcript.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_transcript);
  uint64_t v2 = sub_21797C758();

  return v2;
}

Swift::Bool __swiftcall ImageAnalysis.hasResults(for:)(VisionKit::ImageAnalyzer::AnalysisTypes a1)
{
  uint64_t v2 = *(void *)a1.rawValue;
  if ((*(void *)a1.rawValue & 1) == 0)
  {
    if ((v2 & 2) != 0)
    {
      uint64_t v3 = 4;
      if ((v2 & 4) == 0) {
        return objc_msgSend(*(id *)(v1 + 16), sel_hasResultsForAnalysisTypes_, v3);
      }
    }
    else
    {
      uint64_t v3 = 0;
      if ((v2 & 4) == 0) {
        return objc_msgSend(*(id *)(v1 + 16), sel_hasResultsForAnalysisTypes_, v3);
      }
    }
    goto LABEL_11;
  }
  if ((v2 & 2) == 0)
  {
    uint64_t v3 = 1;
    if ((v2 & 4) == 0) {
      return objc_msgSend(*(id *)(v1 + 16), sel_hasResultsForAnalysisTypes_, v3);
    }
    goto LABEL_11;
  }
  uint64_t v3 = 5;
  if ((v2 & 4) != 0) {
LABEL_11:
  }
    v3 |= 0x10uLL;
  return objc_msgSend(*(id *)(v1 + 16), sel_hasResultsForAnalysisTypes_, v3);
}

uint64_t ImageAnalysis.deinit()
{
  return v0;
}

uint64_t ImageAnalysis.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ImageAnalysis()
{
  return self;
}

uint64_t method lookup function for ImageAnalysis(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ImageAnalysis);
}

void ImageAnalyzer.Configuration.analysisTypes.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ImageAnalyzer.Configuration.locales.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ImageAnalyzer.Configuration.locales.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ImageAnalyzer.Configuration.locales.modify())()
{
  return nullsub_1;
}

VisionKit::ImageAnalyzer::Configuration __swiftcall ImageAnalyzer.Configuration.init(_:)(VisionKit::ImageAnalyzer::AnalysisTypes a1)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *uint64_t v1 = *(void *)a1.rawValue;
  v1[1] = v2;
  result.analysisTypes = a1;
  return result;
}

uint64_t ImageAnalyzer.AnalysisTypes.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t ImageAnalyzer.AnalysisTypes.rawValue.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ImageAnalyzer.AnalysisTypes.rawValue.modify())()
{
  return nullsub_1;
}

VisionKit::ImageAnalyzer::AnalysisTypes __swiftcall ImageAnalyzer.AnalysisTypes.init(rawValue:)(VisionKit::ImageAnalyzer::AnalysisTypes rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ImageAnalyzer.AnalysisTypes.text.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static ImageAnalyzer.AnalysisTypes.machineReadableCode.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static ImageAnalyzer.AnalysisTypes.visualLookUp.getter(void *a1@<X8>)
{
  *a1 = 4;
}

uint64_t ImageAnalyzer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847E8]), sel_init);
  *(void *)(v0 + 16) = v1;
  objc_msgSend(v1, sel_set_isPublicAPI_, 1);
  return v0;
}

uint64_t ImageAnalyzer.init()()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847E8]), sel_init);
  *(void *)(v0 + 16) = v1;
  objc_msgSend(v1, sel_set_isPublicAPI_, 1);
  return v0;
}

id static ImageAnalyzer.isSupported.getter()
{
  return objc_msgSend(self, sel_deviceSupportsImageAnalysis);
}

uint64_t static ImageAnalyzer.supportedTextRecognitionLanguages.getter()
{
  id v0 = objc_msgSend(self, sel_supportedRecognitionLanguages);
  uint64_t v1 = sub_21797C798();

  return v1;
}

uint64_t ImageAnalyzer.analyze(_:configuration:)(uint64_t a1, void *a2)
{
  v3[3] = a1;
  v3[4] = v2;
  uint64_t v4 = a2[1];
  v3[5] = *a2;
  v3[6] = v4;
  return MEMORY[0x270FA2498](sub_21796987C, 0, 0);
}

uint64_t sub_21796987C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  id v2 = objc_msgSend(*(id *)(v0 + 24), sel_imageOrientation);
  if (v1)
  {
    if ((v1 & 2) != 0)
    {
      uint64_t v3 = 5;
      if ((*(unsigned char *)(v0 + 40) & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v3 = 1;
    if ((*(unsigned char *)(v0 + 40) & 4) != 0) {
LABEL_11:
    }
      v3 |= 0x10uLL;
  }
  else
  {
    if ((v1 & 2) == 0)
    {
      uint64_t v3 = 0;
      if ((*(unsigned char *)(v0 + 40) & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v3 = 4;
    if ((*(unsigned char *)(v0 + 40) & 4) != 0) {
      goto LABEL_11;
    }
  }
LABEL_12:
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847F0]), sel_initWithImage_orientation_requestType_, v4, v2, v3);
  *(void *)(v0 + 56) = v6;

  uint64_t v7 = (void *)sub_21797C788();
  objc_msgSend(v6, sel_setLocales_, v7);

  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 64) = v8;
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v6;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v9;
  uint64_t v10 = type metadata accessor for ImageAnalysis();
  void *v9 = v0;
  v9[1] = sub_217969A4C;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000012, 0x8000000217980650, sub_21796AEEC, v8, v10);
}

uint64_t sub_217969A4C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_21796B2A4;
  }
  else
  {
    swift_task_dealloc();
    id v2 = sub_21796B2AC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t ImageAnalyzer.analyze(_:orientation:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  v4[3] = a1;
  v4[4] = a2;
  uint64_t v5 = *a3;
  uint64_t v6 = a3[1];
  v4[5] = v3;
  v4[6] = v5;
  v4[7] = v6;
  return MEMORY[0x270FA2498](sub_217969B94, 0, 0);
}

uint64_t sub_217969B94()
{
  uint64_t v1 = v0[6];
  if (v1)
  {
    if ((v1 & 2) != 0)
    {
      uint64_t v2 = 5;
      if ((v1 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v2 = 1;
    if ((v1 & 4) != 0) {
LABEL_11:
    }
      v2 |= 0x10uLL;
  }
  else
  {
    if ((v1 & 2) == 0)
    {
      uint64_t v2 = 0;
      if ((v1 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v2 = 4;
    if ((v1 & 4) != 0) {
      goto LABEL_11;
    }
  }
LABEL_12:
  uint64_t v3 = v0[5];
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847F0]), sel_initWithImage_orientation_requestType_, v0[3], v0[4], v2);
  v0[8] = v4;
  uint64_t v5 = (void *)sub_21797C788();
  objc_msgSend(v4, sel_setLocales_, v5);

  uint64_t v6 = swift_task_alloc();
  v0[9] = v6;
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v4;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[10] = v7;
  uint64_t v8 = type metadata accessor for ImageAnalysis();
  *uint64_t v7 = v0;
  v7[1] = sub_217969D3C;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000012, 0x8000000217980650, sub_21796B2B0, v6, v8);
}

uint64_t sub_217969D3C()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_217969EC4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_217969E58;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_217969E58()
{
  uint64_t v1 = *(void *)(v0 + 16);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_217969EC4()
{
  uint64_t v1 = *(void **)(v0 + 64);
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t ImageAnalyzer.analyze(_:orientation:configuration:)(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(v4 + 88) = a2;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = v3;
  uint64_t v5 = a3[1];
  *(void *)(v4 + 40) = *a3;
  *(void *)(v4 + 48) = v5;
  return MEMORY[0x270FA2498](sub_217969F58, 0, 0);
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(v4 + 88) = a2;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = v3;
  uint64_t v5 = a3[1];
  *(void *)(v4 + 40) = *a3;
  *(void *)(v4 + 48) = v5;
  return MEMORY[0x270FA2498](sub_21796A334, 0, 0);
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(v4 + 88) = a2;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = v3;
  uint64_t v5 = a3[1];
  *(void *)(v4 + 40) = *a3;
  *(void *)(v4 + 48) = v5;
  return MEMORY[0x270FA2498](sub_21796A520, 0, 0);
}

uint64_t sub_217969F58()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = vk_orientationFromCGImagePropertyOrientation();
  if (v1)
  {
    if ((v1 & 2) != 0)
    {
      uint64_t v3 = 5;
      if ((v0[5] & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v3 = 1;
    if ((v0[5] & 4) != 0) {
LABEL_11:
    }
      v3 |= 0x10uLL;
  }
  else
  {
    if ((v1 & 2) == 0)
    {
      uint64_t v3 = 0;
      if ((v0[5] & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v3 = 4;
    if ((v0[5] & 4) != 0) {
      goto LABEL_11;
    }
  }
LABEL_12:
  uint64_t v4 = v0[4];
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847F0]), sel_initWithCGImage_orientation_requestType_, v0[3], v2, v3);
  v0[7] = v5;
  uint64_t v6 = (void *)sub_21797C788();
  objc_msgSend(v5, sel_setLocales_, v6);

  uint64_t v7 = swift_task_alloc();
  v0[8] = v7;
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v5;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  uint64_t v9 = type metadata accessor for ImageAnalysis();
  *uint64_t v8 = v0;
  v8[1] = sub_21796A118;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000012, 0x8000000217980650, sub_21796B2B0, v7, v9);
}

uint64_t sub_21796A118()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21796A2A0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_21796A234;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21796A234()
{
  uint64_t v1 = *(void *)(v0 + 16);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_21796A2A0()
{
  uint64_t v1 = *(void **)(v0 + 56);
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21796A334()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = vk_orientationFromCGImagePropertyOrientation();
  if (v1)
  {
    if ((v1 & 2) != 0)
    {
      uint64_t v3 = 5;
      if ((v0[5] & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v3 = 1;
    if ((v0[5] & 4) != 0) {
LABEL_11:
    }
      v3 |= 0x10uLL;
  }
  else
  {
    if ((v1 & 2) == 0)
    {
      uint64_t v3 = 0;
      if ((v0[5] & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v3 = 4;
    if ((v0[5] & 4) != 0) {
      goto LABEL_11;
    }
  }
LABEL_12:
  uint64_t v4 = v0[4];
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847F0]), sel_initWithCIImage_orientation_requestType_, v0[3], v2, v3);
  v0[7] = v5;
  uint64_t v6 = (void *)sub_21797C788();
  objc_msgSend(v5, sel_setLocales_, v6);

  uint64_t v7 = swift_task_alloc();
  v0[8] = v7;
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v5;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  uint64_t v9 = type metadata accessor for ImageAnalysis();
  *uint64_t v8 = v0;
  v8[1] = sub_217969A4C;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000012, 0x8000000217980650, sub_21796B2B0, v7, v9);
}

uint64_t sub_21796A520()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = vk_orientationFromCGImagePropertyOrientation();
  if (v1)
  {
    if ((v1 & 2) != 0)
    {
      uint64_t v3 = 5;
      if ((v0[5] & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v3 = 1;
    if ((v0[5] & 4) != 0) {
LABEL_11:
    }
      v3 |= 0x10uLL;
  }
  else
  {
    if ((v1 & 2) == 0)
    {
      uint64_t v3 = 0;
      if ((v0[5] & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v3 = 4;
    if ((v0[5] & 4) != 0) {
      goto LABEL_11;
    }
  }
LABEL_12:
  uint64_t v4 = v0[4];
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847F0]), sel_initWithCVPixelBuffer_orientation_requestType_, v0[3], v2, v3);
  v0[7] = v5;
  uint64_t v6 = (void *)sub_21797C788();
  objc_msgSend(v5, sel_setLocales_, v6);

  uint64_t v7 = swift_task_alloc();
  v0[8] = v7;
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v5;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  uint64_t v9 = type metadata accessor for ImageAnalysis();
  *uint64_t v8 = v0;
  v8[1] = sub_217969A4C;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000012, 0x8000000217980650, sub_21796B2B0, v7, v9);
}

uint64_t ImageAnalyzer.analyze(imageAt:orientation:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  v4[3] = a1;
  v4[4] = v3;
  uint64_t v6 = sub_21797C5D8();
  v4[5] = v6;
  v4[6] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  v4[7] = v7;
  v4[8] = v8;
  v4[9] = v9;
  return MEMORY[0x270FA2498](sub_21796A7AC, 0, 0);
}

uint64_t sub_21796A7AC()
{
  uint64_t v1 = v0[8];
  (*(void (**)(void, void, void))(v0[6] + 16))(v0[7], v0[3], v0[5]);
  if (v1)
  {
    if ((v1 & 2) != 0)
    {
      uint64_t v2 = 5;
      if ((v0[8] & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v2 = 1;
    if ((v0[8] & 4) != 0) {
LABEL_11:
    }
      v2 |= 0x10uLL;
  }
  else
  {
    if ((v1 & 2) == 0)
    {
      uint64_t v2 = 0;
      if ((v0[8] & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    uint64_t v2 = 4;
    if ((v0[8] & 4) != 0) {
      goto LABEL_11;
    }
  }
LABEL_12:
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  id v7 = objc_allocWithZone(MEMORY[0x263F847F0]);
  uint64_t v8 = (void *)sub_21797C5C8();
  id v9 = objc_msgSend(v7, sel_initWithImageURL_requestType_, v8, v2);
  v0[10] = v9;

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v10 = (void *)sub_21797C788();
  objc_msgSend(v9, sel_setLocales_, v10);

  uint64_t v11 = swift_task_alloc();
  v0[11] = v11;
  *(void *)(v11 + 16) = v6;
  *(void *)(v11 + 24) = v9;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[12] = v12;
  uint64_t v13 = type metadata accessor for ImageAnalysis();
  *uint64_t v12 = v0;
  v12[1] = sub_21796A9B4;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000012, 0x8000000217980650, sub_21796B2B0, v11, v13);
}

uint64_t sub_21796A9B4()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_21796AB48;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_21796AAD0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21796AAD0()
{
  uint64_t v1 = *(void *)(v0 + 16);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_21796AB48()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_task_dealloc();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_21796ABBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA46A0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  id v9 = *(void **)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_21796B208;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21796AE08;
  aBlock[3] = &block_descriptor_0;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v9, sel_processRequest_progressHandler_completionHandler_, a3, 0, v12);
  _Block_release(v12);
}

void *sub_21796AD74(void *result, id a2)
{
  if (result)
  {
    uint64_t v2 = result;
    type metadata accessor for ImageAnalysis();
    *(void *)(swift_allocObject() + 16) = v2;
    id v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA46A0);
    return (void *)sub_21797C7F8();
  }
  else if (a2)
  {
    id v4 = a2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA46A0);
    return (void *)sub_21797C7E8();
  }
  return result;
}

void sub_21796AE08(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t ImageAnalyzer.deinit()
{
  return v0;
}

uint64_t ImageAnalyzer.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void sub_21796AEEC(uint64_t a1)
{
  sub_21796ABBC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_21796AEF8()
{
  unint64_t result = qword_267BA4680;
  if (!qword_267BA4680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4680);
  }
  return result;
}

unint64_t sub_21796AF50()
{
  unint64_t result = qword_267BA4688;
  if (!qword_267BA4688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4688);
  }
  return result;
}

unint64_t sub_21796AFA8()
{
  unint64_t result = qword_267BA4690;
  if (!qword_267BA4690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4690);
  }
  return result;
}

unint64_t sub_21796B000()
{
  unint64_t result = qword_267BA4698;
  if (!qword_267BA4698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4698);
  }
  return result;
}

uint64_t type metadata accessor for ImageAnalyzer()
{
  return self;
}

uint64_t method lookup function for ImageAnalyzer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ImageAnalyzer);
}

uint64_t dispatch thunk of ImageAnalyzer.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void *initializeBufferWithCopyOfBuffer for ImageAnalyzer.Configuration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ImageAnalyzer.Configuration()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ImageAnalyzer.Configuration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ImageAnalyzer.Configuration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ImageAnalyzer.Configuration()
{
  return &type metadata for ImageAnalyzer.Configuration;
}

ValueMetadata *type metadata accessor for ImageAnalyzer.AnalysisTypes()
{
  return &type metadata for ImageAnalyzer.AnalysisTypes;
}

uint64_t sub_21796B174()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA46A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void *sub_21796B208(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA46A0);

  return sub_21796AD74(a1, a2);
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

uint64_t sub_21796B2B8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_21796B310()
{
  uint64_t v0 = sub_21797C6B8();
  __swift_allocate_value_buffer(v0, qword_267BA46B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BA46B0);
  return sub_21797C6A8();
}

BOOL sub_21796B3B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21796B3D0()
{
  return sub_21797CA98();
}

uint64_t static DataScannerViewController.RecognizedDataType.text(languages:textContentType:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *a2;
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 8) = a1;
  *(unsigned char *)(a3 + 16) = v3;
  *(void *)(a3 + 24) = MEMORY[0x263F8EE78];
  return swift_bridgeObjectRetain();
}

uint64_t static DataScannerViewController.RecognizedDataType.barcode(symbologies:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(unsigned char *)a2 = 1;
  *(void *)(a2 + 8) = v2;
  *(unsigned char *)(a2 + 16) = 8;
  *(void *)(a2 + 24) = a1;
  return swift_bridgeObjectRetain();
}

BOOL static DataScannerViewController.RecognizedDataType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DataScannerViewController.RecognizedDataType.hash(into:)()
{
  return sub_21797CA98();
}

uint64_t DataScannerViewController.RecognizedDataType.hashValue.getter()
{
  return sub_21797CAA8();
}

uint64_t _s9VisionKit25DataScannerViewControllerC12QualityLevelO9hashValueSivg_0()
{
  return sub_21797CAA8();
}

uint64_t sub_21796B518()
{
  return sub_21797CAA8();
}

BOOL static DataScannerViewController.QualityLevel.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DataScannerViewController.QualityLevel.hash(into:)()
{
  return sub_21797CA98();
}

BOOL sub_21796B5A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL static DataScannerViewController.ScanningUnavailable.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DataScannerViewController.ScanningUnavailable.hash(into:)()
{
  return sub_21797CA98();
}

uint64_t DataScannerViewController.ScanningUnavailable.hashValue.getter()
{
  return sub_21797CAA8();
}

uint64_t sub_21796B648@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_217978D84(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_21796B688(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_21797C6C8();
  uint64_t v18 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_21797C6E8();
  uint64_t v7 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21796860C(0, &qword_267BA4978);
  unint64_t v10 = (void *)sub_21797C8C8();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a1;
  v12[4] = a2;
  aBlock[4] = sub_21797BF8C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21796BA2C;
  aBlock[3] = &block_descriptor_182;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  id v14 = a1;
  sub_21797C6D8();
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_21797BFA0(&qword_267BA4980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4988);
  sub_21797C16C(&qword_267BA4990, &qword_267BA4988);
  sub_21797C948();
  MEMORY[0x21D450010](0, v9, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  swift_release();
  return swift_release();
}

void sub_21796B9AC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x21D450800](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = (void *)MEMORY[0x21D450800](v5 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v7)
    {
      sub_217978EA8(a3);
    }
  }
}

uint64_t sub_21796BAA0(void *a1, double a2)
{
  uint64_t v4 = sub_21797C6C8();
  uint64_t v18 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_21797C6E8();
  uint64_t v7 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21796860C(0, &qword_267BA4978);
  unint64_t v10 = (void *)sub_21797C8C8();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = a1;
  *(double *)(v12 + 32) = a2;
  aBlock[4] = sub_21797BF2C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21796BA2C;
  aBlock[3] = &block_descriptor_175;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  id v14 = a1;
  sub_21797C6D8();
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_21797BFA0(&qword_267BA4980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4988);
  sub_21797C16C(&qword_267BA4990, &qword_267BA4988);
  sub_21797C948();
  MEMORY[0x21D450010](0, v9, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  swift_release();
  return swift_release();
}

void sub_21796BDCC(uint64_t a1, double a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x21D450800](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (char *)MEMORY[0x21D450800](v4 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v6)
    {
      uint64_t v7 = &v6[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate];
      swift_beginAccess();
      if (MEMORY[0x21D450800](v7))
      {
        uint64_t v8 = *((void *)v7 + 1);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t, double))(v8 + 24))(v6, ObjectType, v8, a2);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
  }
}

uint64_t sub_21796BF30(void *a1, int a2)
{
  return sub_21796CDD4(a1, a2, (uint64_t)&unk_26C7EEE20, (uint64_t)sub_21797BF18, (uint64_t)&block_descriptor_168);
}

void sub_21796BF58(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x21D450800](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = (char *)MEMORY[0x21D450800](v5 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v7)
    {
      if (a3) {
        objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge], sel_beginSessionForText_barcodes_, *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] & 1, (*(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] >> 1) & 1);
      }
      else {
        objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge], sel_endSession);
      }
    }
  }
}

uint64_t sub_21796C08C(void *a1, void *a2, void *a3)
{
  void aBlock[6] = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_21797C6C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v37 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_21797C6E8();
  uint64_t v36 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v35 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267BA4390 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_21797C6B8();
  __swift_project_value_buffer(v10, (uint64_t)qword_267BA46B0);
  id v11 = a2;
  id v12 = a3;
  id v13 = v11;
  id v14 = a3;
  uint64_t v15 = sub_21797C698();
  os_log_type_t v16 = sub_21797C8B8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v32 = a1;
    uint64_t v33 = v7;
    uint64_t v34 = v6;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 138412546;
    aBlock[0] = v13;
    id v19 = v13;
    sub_21797C908();
    *uint64_t v18 = v13;

    *(_WORD *)(v17 + 12) = 2112;
    if (a3)
    {
      id v20 = a3;
      uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v21;
      sub_21797C908();
    }
    else
    {
      aBlock[0] = 0;
      sub_21797C908();
      uint64_t v21 = 0;
    }
    uint64_t v6 = v34;
    v18[1] = v21;

    _os_log_impl(&dword_21795E000, v15, v16, "DataScannerViewController impl received didCapturePhoto with photo: %@, error: %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4998);
    swift_arrayDestroy();
    MEMORY[0x21D450750](v18, -1, -1);
    MEMORY[0x21D450750](v17, -1, -1);

    a1 = v32;
    uint64_t v7 = v33;
  }
  else
  {
  }
  sub_21796860C(0, &qword_267BA4978);
  unint64_t v22 = (void *)sub_21797C8C8();
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  char v24 = (void *)swift_allocObject();
  v24[2] = v23;
  v24[3] = a1;
  v24[4] = v13;
  v24[5] = a3;
  aBlock[4] = sub_21797BF04;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21796BA2C;
  aBlock[3] = &block_descriptor_161;
  unint64_t v25 = _Block_copy(aBlock);
  id v26 = v13;
  id v27 = a3;
  swift_retain();
  id v28 = a1;
  v29 = v35;
  sub_21797C6D8();
  uint64_t v39 = MEMORY[0x263F8EE78];
  sub_21797BFA0(&qword_267BA4980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4988);
  sub_21797C16C(&qword_267BA4990, &qword_267BA4988);
  id v30 = v37;
  sub_21797C948();
  MEMORY[0x21D450010](0, v29, v30, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v30, v6);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v29, v38);
  swift_release();
  return swift_release();
}

void sub_21796C5F4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = a1 + 16;
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x21D450800](v6);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = MEMORY[0x21D450800](v7 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);
    if (v9)
    {
      uint64_t v10 = v9;
      sub_217979288(a3, a4);

      goto LABEL_9;
    }
  }
  if (qword_267BA4390 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_21797C6B8();
  __swift_project_value_buffer(v11, (uint64_t)qword_267BA46B0);
  uint64_t v10 = sub_21797C698();
  os_log_type_t v12 = sub_21797C8A8();
  if (os_log_type_enabled(v10, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_21795E000, v10, v12, "Unexpected error before calling didCapturePhoto on DataScannerViewController. Missing self or owner.", v13, 2u);
    MEMORY[0x21D450750](v13, -1, -1);
  }
LABEL_9:
}

uint64_t sub_21796C7C4(void *a1)
{
  return sub_21796C958(a1, (uint64_t)&unk_26C7EEDD0, (uint64_t)sub_21797BEAC, (uint64_t)&block_descriptor_154);
}

void sub_21796C7EC(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21D450800](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (char *)MEMORY[0x21D450800](v2 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v4)
    {
      uint64_t v5 = &v4[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
      swift_beginAccess();
      if (MEMORY[0x21D450800](v5))
      {
        uint64_t v6 = *((void *)v5 + 1);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 8))(v4, ObjectType, v6);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
  }
}

uint64_t sub_21796C930(void *a1)
{
  return sub_21796C958(a1, (uint64_t)&unk_26C7EEDA8, (uint64_t)sub_21797BE9C, (uint64_t)&block_descriptor_147);
}

uint64_t sub_21796C958(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  uint64_t v5 = sub_21797C6C8();
  uint64_t v21 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_21797C6E8();
  uint64_t v8 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21796860C(0, &qword_267BA4978);
  uint64_t v11 = (void *)sub_21797C8C8();
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = a1;
  aBlock[4] = v18;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21796BA2C;
  aBlock[3] = v19;
  id v14 = _Block_copy(aBlock);
  swift_retain();
  id v15 = a1;
  sub_21797C6D8();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_21797BFA0(&qword_267BA4980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4988);
  sub_21797C16C(&qword_267BA4990, &qword_267BA4988);
  sub_21797C948();
  MEMORY[0x21D450010](0, v10, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v20);
  swift_release();
  return swift_release();
}

void sub_21796CC68(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21D450800](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (char *)MEMORY[0x21D450800](v2 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v4)
    {
      uint64_t v5 = &v4[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate];
      swift_beginAccess();
      if (MEMORY[0x21D450800](v5))
      {
        uint64_t v6 = *((void *)v5 + 1);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 8))(v4, ObjectType, v6);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
  }
}

uint64_t sub_21796CDAC(void *a1, int a2)
{
  return sub_21796CDD4(a1, a2, (uint64_t)&unk_26C7EED80, (uint64_t)sub_21797BE70, (uint64_t)&block_descriptor_1);
}

uint64_t sub_21796CDD4(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  int v19 = a2;
  uint64_t v6 = sub_21797C6C8();
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v22 = sub_21797C6E8();
  uint64_t v9 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21796860C(0, &qword_267BA4978);
  uint64_t v12 = (void *)sub_21797C8C8();
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = a1;
  *(unsigned char *)(v14 + 32) = v19;
  aBlock[4] = v20;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21796BA2C;
  aBlock[3] = v21;
  id v15 = _Block_copy(aBlock);
  swift_retain();
  id v16 = a1;
  sub_21797C6D8();
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_21797BFA0(&qword_267BA4980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4988);
  sub_21797C16C(&qword_267BA4990, &qword_267BA4988);
  sub_21797C948();
  MEMORY[0x21D450010](0, v11, v8, v15);
  _Block_release(v15);

  (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v8, v6);
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v22);
  swift_release();
  return swift_release();
}

void sub_21796D0F0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x21D450800](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = (char *)MEMORY[0x21D450800](v5 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

    if (v7)
    {
      if ((a3 & 1) != 0
        || (uint64_t v8 = &v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate],
            swift_beginAccess(),
            !MEMORY[0x21D450800](v8)))
      {
      }
      else
      {
        uint64_t v9 = *((void *)v8 + 1);
        uint64_t ObjectType = swift_getObjectType();
        char v11 = 1;
        (*(void (**)(char *, char *, uint64_t, uint64_t))(v9 + 48))(v7, &v11, ObjectType, v9);

        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_21796D250(uint64_t a1)
{
  if (objc_msgSend(self, sel_isCameraRestricted))
  {
    swift_beginAccess();
    uint64_t v2 = MEMORY[0x21D450800](a1 + 16);
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = (char *)MEMORY[0x21D450800](v2 + OBJC_IVAR____TtCC9VisionKit25DataScannerViewController4Impl_owner);

      if (v4)
      {
        uint64_t v5 = &v4[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
        swift_beginAccess();
        if (MEMORY[0x21D450800](v5))
        {
          uint64_t v6 = *((void *)v5 + 1);
          uint64_t ObjectType = swift_getObjectType();
          char v8 = 1;
          (*(void (**)(char *, char *, uint64_t, uint64_t))(v6 + 48))(v4, &v8, ObjectType, v6);

          swift_unknownObjectRelease();
        }
        else
        {
        }
      }
    }
  }
}

id sub_21796D40C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataScannerViewController.Impl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21796D450()
{
  return objc_msgSend(self, sel_isSupported);
}

uint64_t sub_21796D47C()
{
  return objc_msgSend(self, sel_isCameraRestricted) ^ 1;
}

uint64_t sub_21796D4AC()
{
  id v0 = objc_msgSend(self, sel_supportedRecognitionLanguages);
  uint64_t v1 = sub_21797C798();

  return v1;
}

uint64_t sub_21796D504()
{
  return sub_21796DD48(&OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
}

uint64_t sub_21796D510(uint64_t a1, uint64_t a2)
{
  return sub_21796DDA0(a1, a2, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
}

uint64_t (*sub_21796D51C(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x21D450800](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_21796D5A4;
}

void sub_21796D5A8(void **a1, void *a2)
{
  objc_super v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

id sub_21796D60C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView);
  swift_beginAccess();
  objc_super v2 = *v1;

  return v2;
}

uint64_t DataScannerViewController.recognizedDataTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void DataScannerViewController.qualityLevel.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_qualityLevel);
}

uint64_t DataScannerViewController.recognizesMultipleItems.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems);
}

uint64_t DataScannerViewController.isHighFrameRateTrackingEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled);
}

uint64_t DataScannerViewController.isPinchToZoomEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isPinchToZoomEnabled);
}

uint64_t DataScannerViewController.isGuidanceEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isGuidanceEnabled);
}

uint64_t DataScannerViewController.isHighlightingEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled);
}

id sub_21796D6D8(uint64_t a1, uint64_t *a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)(a1 + 8);
  double v4 = *(double *)(a1 + 16);
  double v5 = *(double *)(a1 + 24);
  char v6 = *(unsigned char *)(a1 + 32);
  uint64_t v7 = *a2;
  uint64_t v8 = *a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  id result = (id)swift_beginAccess();
  *(double *)uint64_t v8 = v2;
  *(double *)(v8 + 8) = v3;
  *(double *)(v8 + 16) = v4;
  *(double *)(v8 + 24) = v5;
  *(unsigned char *)(v8 + 32) = v6;
  if ((v6 & 1) == 0) {
    return objc_msgSend(*(id *)(v7 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setRegionOfInterest_, v2, v3, v4, v5);
  }
  return result;
}

__n128 sub_21796D77C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = v4;
  return result;
}

id sub_21796D7D4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  swift_beginAccess();
  sub_21797C1B0(a1, v3, &qword_267BA4718);
  id result = (id)sub_21797C1B0(a1, (uint64_t)v5, &qword_267BA4718);
  if ((v6 & 1) == 0) {
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setRegionOfInterest_, v5[0], v5[1], v5[2], v5[3]);
  }
  return result;
}

void (*sub_21796D874(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_21796D8E0;
}

void sub_21796D8E0(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    uint64_t v5 = v4 + v3[4];
    if ((*(unsigned char *)(v5 + 32) & 1) == 0) {
      objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setRegionOfInterest_, *(double *)v5, *(double *)(v5 + 8), *(double *)(v5 + 16), *(double *)(v5 + 24));
    }
  }

  free(v3);
}

id sub_21796D954()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_isProcessing);
}

uint64_t sub_21796D980()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4728);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v6[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4730);
  (*(void (**)(unsigned char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F580], v1);
  return sub_21797C848();
}

uint64_t sub_21796DA98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4840);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = (unint64_t *)(a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations);
  swift_beginAccess();
  unint64_t v9 = *v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v8 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v9 = sub_217977A54(0, *(void *)(v9 + 16) + 1, 1, v9, &qword_267BA4A30, &qword_267BA4840);
    *uint64_t v8 = v9;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    unint64_t v9 = sub_217977A54(v11 > 1, v12 + 1, 1, v9, &qword_267BA4A30, &qword_267BA4840);
    *uint64_t v8 = v9;
  }
  *(void *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v12, v7, v4);
  return swift_endAccess();
}

uint64_t sub_21796DC60(uint64_t a1)
{
  return sub_21796DA98(a1, *(void *)(v1 + 16));
}

id sub_21796DC68()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_minZoomFactor);
}

id sub_21796DC80()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_maxZoomFactor);
}

id sub_21796DC98()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_zoomFactor);
}

id sub_21796DCB0()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setZoomFactor_);
}

id (*sub_21796DCC8(void *a1))(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  a1[1] = v3;
  objc_msgSend(v3, sel_zoomFactor);
  *a1 = v4;
  return sub_21796DD24;
}

id sub_21796DD24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setZoomFactor_, *(double *)a1);
}

uint64_t sub_21796DD3C()
{
  return sub_21796DD48(&OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);
}

uint64_t sub_21796DD48(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x21D450800](v2);
}

uint64_t sub_21796DD94(uint64_t a1, uint64_t a2)
{
  return sub_21796DDA0(a1, a2, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);
}

uint64_t sub_21796DDA0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = v3 + *a3;
  swift_beginAccess();
  *(void *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_21796DE08(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x21D450800](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_21796D5A4;
}

void sub_21796DE90(uint64_t a1, char a2)
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

double sub_21796DF18()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_21796DF60(double a1)
{
  return sub_21796E05C(&OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval, (SEL *)&selRef_setProcessingInterval_, a1);
}

void (*sub_21796DF74(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = (void *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_21796DFF4;
}

void sub_21796DFF4(uint64_t a1, uint64_t a2)
{
}

double sub_21796E000()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_21796E048(double a1)
{
  return sub_21796E05C(&OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval, (SEL *)&selRef_setInfrequentProcessingInterval_, a1);
}

id sub_21796E05C(void *a1, SEL *a2, double a3)
{
  uint64_t v6 = (double *)(v3 + *a1);
  id result = (id)swift_beginAccess();
  double v8 = *v6;
  *uint64_t v6 = a3;
  if (v8 != a3)
  {
    unint64_t v9 = *(void **)(v3 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
    if (v9) {
      objc_msgSend(v9, *a2, a3);
    }
    id result = *(id *)(v3 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor);
    if (result) {
      return objc_msgSend(result, *a2, *v6);
    }
  }
  return result;
}

void (*sub_21796E0FC(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = (void *)(v1 + v4);
  swift_beginAccess();
  v3[3] = *v5;
  return sub_21796E17C;
}

void sub_21796E17C(uint64_t a1, uint64_t a2)
{
}

void sub_21796E188(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v4 = *(void **)a1;
  double v5 = *(double *)(*(void *)a1 + 24);
  uint64_t v7 = *(void *)(*(void *)a1 + 32);
  uint64_t v6 = *(void *)(*(void *)a1 + 40);
  double v8 = *(double *)(v7 + v6);
  *(double *)(v7 + v6) = v5;
  if (v5 != v8)
  {
    uint64_t v9 = v4[4];
    uint64_t v10 = *(void **)(v9 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
    if (v10)
    {
      [v10 *a3];
      uint64_t v9 = v4[4];
    }
    unint64_t v11 = *(void **)(v9 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor);
    if (v11) {
      objc_msgSend(v11, *a3, *(double *)(v9 + v4[5]));
    }
  }

  free(v4);
}

id sub_21796E21C()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_hasTorch);
}

id sub_21796E248()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_isTorchOn);
}

id sub_21796E274(char a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setTorchOn_, a1 & 1);
}

id (*sub_21796E294(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = objc_msgSend(v3, sel_isTorchOn);
  return sub_21796E2F0;
}

id sub_21796E2F0(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setTorchOn_, *(unsigned __int8 *)(a1 + 8));
}

void sub_21796E308(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21796E378();
}

void sub_21796E378()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v2, sel_configuration);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_21797C788();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setCustomWords_, v4);

    objc_msgSend(v2, sel_setConfiguration_, v3);
  }
  double v5 = *(void **)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor);
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(v6, sel_configuration);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    double v8 = (void *)sub_21797C788();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setCustomWords_, v8);

    objc_msgSend(v6, sel_setConfiguration_, v7);
  }
}

uint64_t sub_21796E4FC()
{
  return swift_bridgeObjectRetain();
}

void sub_21796E548(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords);
  swift_beginAccess();
  *id v3 = a1;
  swift_bridgeObjectRelease();
  sub_21796E378();
}

void (*sub_21796E5A8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_21796E608;
}

void sub_21796E608(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_21796E378();
  }
}

uint64_t sub_21796E63C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection);
  swift_beginAccess();
  return *v1;
}

void sub_21796E684(unsigned __int8 a1)
{
  id v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection);
  swift_beginAccess();
  *id v3 = a1;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v5, sel_configuration);
    objc_msgSend(v6, sel_setUsesLanguageDetection_, *v3);
    objc_msgSend(v5, sel_setConfiguration_, v6);
  }
  id v7 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor);
  if (v7)
  {
    id v8 = v7;
    id v9 = objc_msgSend(v8, sel_configuration);
    objc_msgSend(v9, sel_setUsesLanguageDetection_, *v3);
    objc_msgSend(v8, sel_setConfiguration_, v9);
  }
}

void (*sub_21796E794(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_21796E800;
}

void sub_21796E800(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    id v5 = *(void **)(v4 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
    if (v5)
    {
      uint64_t v6 = v3[4];
      id v7 = v5;
      id v8 = objc_msgSend(v7, sel_configuration);
      objc_msgSend(v8, sel_setUsesLanguageDetection_, *(unsigned __int8 *)(v4 + v6));
      objc_msgSend(v7, sel_setConfiguration_, v8);

      uint64_t v4 = v3[3];
    }
    id v9 = *(void **)(v4 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor);
    if (v9)
    {
      uint64_t v10 = v3[4];
      id v11 = v9;
      id v12 = objc_msgSend(v11, sel_configuration);
      objc_msgSend(v12, sel_setUsesLanguageDetection_, *(unsigned __int8 *)(v4 + v10));
      objc_msgSend(v11, sel_setConfiguration_, v12);
    }
  }

  free(v3);
}

id DataScannerViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void DataScannerViewController.init(coder:)()
{
}

id DataScannerViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_21797C728();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void DataScannerViewController.init(nibName:bundle:)()
{
}

uint64_t DataScannerViewController.__allocating_init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)(uint64_t a1, char *a2, char a3, char a4, char a5, char a6, char a7)
{
  id v15 = objc_allocWithZone(v7);
  return DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)(uint64_t a1, char *a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v11 = *a2;
  v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer] = 0;
  v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidBeginPinchToZoom] = 0;
  v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidEndPinchToZoom] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor] = 0;
  *(void *)&v7[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor] = 0;
  uint64_t v12 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView;
  id v13 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v14 = v7;
  *(void *)&v7[v12] = objc_msgSend(v13, sel_init);
  uint64_t v15 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_impl;
  *(void *)&v14[v15] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DataScannerViewController.Impl()), sel_init);
  uint64_t v16 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge;
  *(void *)&v14[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84818]), sel_init);
  uint64_t v17 = MEMORY[0x263F8EE78];
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems] = MEMORY[0x263F8EE78];
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems] = v17;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems] = v17;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView] = 0;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID] = 0;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView] = 0;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions] = v17;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations] = v17;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom] = 0;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v18 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView;
  *(void *)&v14[v18] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  int v19 = &v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest];
  *(_OWORD *)int v19 = 0u;
  *((_OWORD *)v19 + 1) = 0u;
  BOOL v20 = 1;
  v19[32] = 1;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v21 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  uint64_t v22 = self;
  objc_msgSend(v22, sel_defaultProcessingInterval);
  *(void *)&v14[v21] = v23;
  uint64_t v24 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  objc_msgSend(v22, sel_defaultInfrequentProcessingInterval);
  *(void *)&v14[v24] = v25;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords] = v17;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection] = 1;
  uint64_t v26 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes;
  *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes] = a1;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_qualityLevel] = v11;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] = a3;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled] = a4;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isPinchToZoomEnabled] = a5;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isGuidanceEnabled] = a6;
  v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled] = a7;
  if ((a4 & 1) == 0
    || !objc_msgSend(self, sel_isOpticalFlowForTextEnabled)
    || *(void *)(a1 + 16) != 1)
  {
    goto LABEL_12;
  }
  uint64_t result = sub_217967FC0(a1);
  if (v29) {
    goto LABEL_17;
  }
  if (*(_DWORD *)(a1 + 36) != v28)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_217978CE4(result, v28, a1, (uint64_t)v42);
  char v30 = v42[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30)
  {
LABEL_12:
    id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84830]), sel_init);
    objc_msgSend(v35, sel_setResolutionPreset_, qword_21797E220[v11]);
    objc_msgSend(v35, sel_setFrameRatePreset_, 1);
    objc_msgSend(v35, sel_setCameraPreset_, 2);
    objc_msgSend(v35, sel_setPreferBinning_, v20);
    id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847C0]), sel_initWithConfiguration_, v35);

    *(void *)&v14[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider] = v36;
    uint64_t v37 = (objc_class *)type metadata accessor for DataScannerViewController();
    v43.receiver = v14;
    v43.super_class = v37;
    id v38 = objc_msgSendSuper2(&v43, sel_initWithNibName_bundle_, 0, 0);
    sub_21796F718();

    return (uint64_t)v38;
  }
  uint64_t v31 = *(void *)&v14[v26];
  uint64_t result = sub_217967FC0(v31);
  if ((v33 & 1) == 0)
  {
    if (*(_DWORD *)(v31 + 36) == v32)
    {
      if (result != 1 << *(unsigned char *)(v31 + 32))
      {
        sub_217978CE4(result, v32, v31, (uint64_t)v42);
        int v34 = v42[16];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        BOOL v20 = v34 != 8;
        goto LABEL_12;
      }
      goto LABEL_16;
    }
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t DataScannerViewController.__allocating_init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)(uint64_t a1, char *a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  id v17 = objc_allocWithZone(v8);
  return DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)(uint64_t a1, char *a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  char v12 = *a2;
  v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer] = 0;
  v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidBeginPinchToZoom] = 0;
  v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidEndPinchToZoom] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor] = 0;
  *(void *)&v8[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor] = 0;
  uint64_t v13 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView;
  id v14 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v15 = v8;
  *(void *)&v8[v13] = objc_msgSend(v14, sel_init);
  uint64_t v16 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_impl;
  *(void *)&v15[v16] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DataScannerViewController.Impl()), sel_init);
  uint64_t v17 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge;
  *(void *)&v15[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84818]), sel_init);
  uint64_t v18 = MEMORY[0x263F8EE78];
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems] = MEMORY[0x263F8EE78];
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems] = v18;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems] = v18;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView] = 0;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID] = 0;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView] = 0;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions] = v18;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations] = v18;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom] = 0;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v19 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView;
  char v20 = v12;
  *(void *)&v15[v19] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v21 = &v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest];
  *(_OWORD *)uint64_t v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  char v22 = 1;
  v21[32] = 1;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v23 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  uint64_t v24 = self;
  objc_msgSend(v24, sel_defaultProcessingInterval);
  *(void *)&v15[v23] = v25;
  uint64_t v26 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  objc_msgSend(v24, sel_defaultInfrequentProcessingInterval);
  *(void *)&v15[v26] = v27;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords] = v18;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection] = 1;
  uint64_t v28 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes;
  *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes] = a1;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_qualityLevel] = v12;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] = a3;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled] = a4;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isPinchToZoomEnabled] = a5;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isGuidanceEnabled] = a6;
  v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled] = a7;
  if ((a4 & 1) == 0
    || !objc_msgSend(self, sel_isOpticalFlowForTextEnabled)
    || *(void *)(a1 + 16) != 1)
  {
    goto LABEL_12;
  }
  uint64_t result = sub_217967FC0(a1);
  if (v31) {
    goto LABEL_17;
  }
  if (*(_DWORD *)(a1 + 36) != v30)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_217978CE4(result, v30, a1, (uint64_t)v43);
  char v32 = v43[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32)
  {
LABEL_12:
    v43[0] = v20;
    *(void *)&v15[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider] = sub_21797A08C(v43, a8 & 1, a5 & 1, v22);

    uint64_t v37 = (objc_class *)type metadata accessor for DataScannerViewController();
    v44.receiver = v15;
    v44.super_class = v37;
    id v38 = objc_msgSendSuper2(&v44, sel_initWithNibName_bundle_, 0, 0);
    sub_21796F718();

    return (uint64_t)v38;
  }
  uint64_t v33 = *(void *)&v15[v28];
  uint64_t result = sub_217967FC0(v33);
  if ((v35 & 1) == 0)
  {
    if (*(_DWORD *)(v33 + 36) == v34)
    {
      if (result != 1 << *(unsigned char *)(v33 + 32))
      {
        sub_217978CE4(result, v34, v33, (uint64_t)v43);
        int v36 = v43[16];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v22 = v36 != 8;
        goto LABEL_12;
      }
      goto LABEL_16;
    }
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  __break(1u);
  return result;
}

id DataScannerViewController.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for DataScannerViewController();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_21796F718()
{
  id v1 = v0;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView];
  id v3 = objc_msgSend(self, sel_blackColor);
  id v4 = objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.01);

  objc_msgSend(v2, sel_setBackgroundColor_, v4);
  uint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_impl];
  swift_unknownObjectWeakAssign();
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider];
  sub_21796860C(0, &qword_267BA4978);
  id v7 = (void *)sub_21797C8C8();
  id v81 = v6;
  objc_msgSend(v6, sel_setDelegate_queue_, v5, v7);

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge], sel_setDelegate_, v5);
  if (v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isPinchToZoomEnabled] == 1)
  {
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82A40]), sel_initWithTarget_action_, v1, sel_onPinch_);
    uint64_t v9 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer;
    uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer];
    *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer] = v8;

    id v11 = objc_msgSend(v1, sel_view);
    if (!v11)
    {
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
    if (!*(void *)&v1[v9])
    {
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    char v12 = v11;
    objc_msgSend(v11, sel_addGestureRecognizer_);
  }
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v1, sel_onTap_);
  uint64_t v14 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer;
  uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer];
  *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer] = v13;

  id v16 = objc_msgSend(v1, sel_view);
  if (!v16) {
    goto LABEL_72;
  }
  if (!*(void *)&v1[v14])
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  uint64_t v17 = v16;
  objc_msgSend(v16, sel_addGestureRecognizer_);

  uint64_t v18 = self;
  id v19 = objc_msgSend(v18, sel_defaultCenter);
  objc_msgSend(v19, sel_addObserver_selector_name_object_, v1, sel_didEnterBackground, *MEMORY[0x263F83330], 0);

  id v20 = objc_msgSend(v18, sel_defaultCenter);
  objc_msgSend(v20, sel_addObserver_selector_name_object_, v1, sel_willEnterForeground, *MEMORY[0x263F833B8], 0);

  if (objc_msgSend(self, sel_isOpticalFlowForTextEnabled))
  {
    uint64_t v21 = *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes];
    if (*(void *)(v21 + 16) == 1)
    {
      uint64_t v22 = sub_217967FC0(*(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes]);
      if (v24)
      {
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }
      if (*(_DWORD *)(v21 + 36) != v23) {
        goto LABEL_66;
      }
      if (v22 == 1 << *(unsigned char *)(v21 + 32))
      {
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      sub_217978CE4(v22, v23, v21, (uint64_t)&aBlock);
      char v25 = aBlock;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
      {
        uint64_t v26 = sub_217967FC0(v21);
        if (v28)
        {
LABEL_77:
          __break(1u);
          goto LABEL_78;
        }
        if (*(_DWORD *)(v21 + 36) == v27)
        {
          if (v26 != 1 << *(unsigned char *)(v21 + 32))
          {
            sub_217978CE4(v26, v27, v21, (uint64_t)&aBlock);
            int v29 = v86;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v29 == 8
              && v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled] == 1)
            {
              uint64_t v30 = *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType];
              if ((v30 & 1) == 0) {
                *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] = v30 | 1;
              }
              id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84880]), sel_init);
              objc_msgSend(v31, sel_setIsForSingleItem_, (v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] & 1) == 0);
              uint64_t v32 = sub_217967FC0(v21);
              if (v34)
              {
LABEL_78:
                __break(1u);
                JUMPOUT(0x21797038CLL);
              }
              if (*(_DWORD *)(v21 + 36) == v33)
              {
                if (v32 != 1 << *(unsigned char *)(v21 + 32))
                {
                  sub_217978CE4(v32, v33, v21, (uint64_t)&aBlock);
                  swift_bridgeObjectRelease();
                  char v35 = (void *)sub_21797C788();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v31, sel_setRecognitionLanguages_, v35);

                  id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84890]), sel_init);
                  objc_msgSend(v36, sel_setConfiguration_, v31);
                  id v37 = v36;
                  id v38 = (void *)sub_21797C8C8();
                  objc_msgSend(v37, sel_setResultHandlerQueue_, v38);

                  uint64_t v39 = swift_allocObject();
                  swift_unknownObjectWeakInit();
                  v88 = sub_21797C4D0;
                  uint64_t v89 = v39;
                  uint64_t aBlock = MEMORY[0x263EF8330];
                  uint64_t v85 = 1107296256;
                  v86 = sub_2179703B0;
                  v87 = &block_descriptor_224;
                  v40 = _Block_copy(&aBlock);
                  swift_release();
                  objc_msgSend(v37, sel_setResultHandler_, v40);
                  _Block_release(v40);
                  objc_msgSend(v6, sel_registerProcessor_, v37);
                  v41 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor];
                  *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor] = v37;

                  goto LABEL_62;
                }
                goto LABEL_71;
              }
LABEL_70:
              __break(1u);
LABEL_71:
              __break(1u);
LABEL_72:
              __break(1u);
              goto LABEL_73;
            }
            goto LABEL_24;
          }
LABEL_69:
          __break(1u);
          goto LABEL_70;
        }
LABEL_68:
        __break(1u);
        goto LABEL_69;
      }
    }
  }
LABEL_24:
  uint64_t v42 = *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes];
  uint64_t v43 = *(void *)(v42 + 56);
  uint64_t v78 = v42 + 56;
  uint64_t v44 = 1 << *(unsigned char *)(v42 + 32);
  uint64_t v45 = -1;
  if (v44 < 64) {
    uint64_t v45 = ~(-1 << v44);
  }
  unint64_t v46 = v45 & v43;
  uint64_t v82 = *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedDataTypes];
  uint64_t v83 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType;
  uint64_t v76 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor;
  uint64_t v77 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor;
  int64_t v79 = (unint64_t)(v44 + 63) >> 6;
  uint64_t v80 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems;
  swift_bridgeObjectRetain();
  int64_t v47 = 0;
  while (1)
  {
    if (v46)
    {
      unint64_t v58 = __clz(__rbit64(v46));
      v46 &= v46 - 1;
      unint64_t v59 = v58 | (v47 << 6);
      goto LABEL_45;
    }
    int64_t v60 = v47 + 1;
    if (__OFADD__(v47, 1))
    {
      __break(1u);
      goto LABEL_65;
    }
    if (v60 >= v79) {
      goto LABEL_60;
    }
    unint64_t v61 = *(void *)(v78 + 8 * v60);
    ++v47;
    if (!v61)
    {
      int64_t v47 = v60 + 1;
      if (v60 + 1 >= v79) {
        goto LABEL_60;
      }
      unint64_t v61 = *(void *)(v78 + 8 * v47);
      if (!v61)
      {
        int64_t v47 = v60 + 2;
        if (v60 + 2 >= v79) {
          goto LABEL_60;
        }
        unint64_t v61 = *(void *)(v78 + 8 * v47);
        if (!v61) {
          break;
        }
      }
    }
LABEL_44:
    unint64_t v46 = (v61 - 1) & v61;
    unint64_t v59 = __clz(__rbit64(v61)) + (v47 << 6);
LABEL_45:
    v63 = (unsigned char *)(*(void *)(v82 + 48) + 32 * v59);
    uint64_t v64 = *(void *)&v1[v83];
    if (*v63)
    {
      if ((v64 & 2) == 0) {
        *(void *)&v1[v83] = v64 | 2;
      }
      id v48 = objc_allocWithZone(MEMORY[0x263F847D0]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v49 = objc_msgSend(v48, sel_init);
      objc_msgSend(v49, sel_setIsForSingleItem_, (v1[v80] & 1) == 0);
      type metadata accessor for VNBarcodeSymbology(0);
      v50 = (void *)sub_21797C788();
      objc_msgSend(v49, sel_setSymbologies_, v50);

      id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847C8]), sel_init);
      objc_msgSend(v51, sel_setConfiguration_, v49);
      id v52 = v51;
      v53 = (void *)sub_21797C8C8();
      objc_msgSend(v52, sel_setResultHandlerQueue_, v53);

      uint64_t v54 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v88 = sub_21797C4A0;
      uint64_t v89 = v54;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v85 = 1107296256;
      v86 = sub_2179703B0;
      v87 = &block_descriptor_212;
      v55 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v52, sel_setResultHandler_, v55);
      uint64_t v56 = v77;
    }
    else
    {
      uint64_t v65 = v63[16];
      if ((v64 & 1) == 0) {
        *(void *)&v1[v83] = v64 | 1;
      }
      id v66 = objc_allocWithZone(MEMORY[0x263F84880]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v49 = objc_msgSend(v66, sel_init);
      objc_msgSend(v49, sel_setIsForSingleItem_, (v1[v80] & 1) == 0);
      v67 = (void *)sub_21797C788();
      objc_msgSend(v49, sel_setRecognitionLanguages_, v67);

      uint64_t v68 = 5;
      switch(v65)
      {
        case 1:
          uint64_t v68 = 2;
          goto LABEL_58;
        case 2:
          uint64_t v68 = 7;
          goto LABEL_58;
        case 3:
          uint64_t v68 = 4;
          goto LABEL_58;
        case 4:
          uint64_t v68 = 8;
          goto LABEL_58;
        case 5:
          uint64_t v68 = 3;
          goto LABEL_58;
        case 6:
          uint64_t v68 = 1;
          goto LABEL_58;
        case 7:
          uint64_t v68 = 6;
          goto LABEL_58;
        case 8:
          goto LABEL_59;
        default:
LABEL_58:
          objc_msgSend(v49, sel_setDataType_, v68);
LABEL_59:
          id v69 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84878]), sel_init);
          objc_msgSend(v69, sel_setConfiguration_, v49);
          id v52 = v69;
          v70 = (void *)sub_21797C8C8();
          objc_msgSend(v52, sel_setResultHandlerQueue_, v70);

          uint64_t v71 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v88 = sub_21797C4D0;
          uint64_t v89 = v71;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v85 = 1107296256;
          v86 = sub_2179703B0;
          v87 = &block_descriptor_216;
          v55 = _Block_copy(&aBlock);
          swift_release();
          objc_msgSend(v52, sel_setResultHandler_, v55);
          uint64_t v56 = v76;
          break;
      }
    }
    _Block_release(v55);
    objc_msgSend(v81, sel_registerProcessor_, v52);
    v57 = *(void **)&v1[v56];
    *(void *)&v1[v56] = v52;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  int64_t v62 = v60 + 3;
  if (v62 < v79)
  {
    unint64_t v61 = *(void *)(v78 + 8 * v62);
    if (!v61)
    {
      while (1)
      {
        int64_t v47 = v62 + 1;
        if (__OFADD__(v62, 1)) {
          break;
        }
        if (v47 >= v79) {
          goto LABEL_60;
        }
        unint64_t v61 = *(void *)(v78 + 8 * v47);
        ++v62;
        if (v61) {
          goto LABEL_44;
        }
      }
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    int64_t v47 = v62;
    goto LABEL_44;
  }
LABEL_60:
  swift_release();
  if (v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighFrameRateTrackingEnabled] == 1)
  {
    id v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84838]), sel_init);
    v73 = (void *)sub_21797C8C8();
    objc_msgSend(v72, sel_setResultHandlerQueue_, v73);

    uint64_t v74 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v88 = sub_21797C500;
    uint64_t v89 = v74;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v85 = 1107296256;
    v86 = sub_2179703B0;
    v87 = &block_descriptor_220;
    v75 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v72, sel_setResultHandler_, v75);
    _Block_release(v75);
    objc_msgSend(v81, sel_registerProcessor_, v72);
    v41 = *(void **)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor];
    *(void *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor] = v72;
LABEL_62:
  }
}

void sub_2179703B4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x21D450800](v5);
  if (v6)
  {
    id v7 = (void *)v6;
    a3(a1);
  }
}

void sub_217970424(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x21D450800](v3);
  if (v4)
  {
    uint64_t v5 = (char *)v4;
    objc_msgSend(a1, sel_warpTransform);
    double v11 = v7;
    double v12 = v6;
    double v10 = v8;
    objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor], sel_applyHomographyWarpTransform_);
    id v9 = *(id *)&v5[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor];
    objc_msgSend(v9, sel_applyWarpTransform_, v12, v11, v10);
  }
}

void sub_2179705D4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49D8);
  uint64_t v202 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v200 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v212 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4840);
  uint64_t v204 = *(void *)(v212 - 8);
  MEMORY[0x270FA5388](v212);
  double v6 = (char *)&v200 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for RecognizedItem(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v216 = v7;
  uint64_t v217 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v208 = (char *)&v200 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v207 = (char *)&v200 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v200 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v200 - v16;
  id v210 = a1;
  id v18 = objc_msgSend(a1, sel_allItems);
  uint64_t v209 = sub_21796860C(0, &qword_267BA4A28);
  unint64_t v19 = sub_21797C798();

  if (v19 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_21797C9B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v203 = v6;
  uint64_t v206 = v2;
  v205 = v4;
  if (v20)
  {
    uint64_t v219 = MEMORY[0x263F8EE78];
    sub_217967C00(0, v20 & ~(v20 >> 63), 0);
    if (v20 < 0)
    {
      __break(1u);
      goto LABEL_42;
    }
    uint64_t v21 = 0;
    unint64_t v214 = v19 & 0xC000000000000001;
    unint64_t v215 = v19;
    uint64_t v22 = v219;
    do
    {
      if (v214) {
        id v23 = (id)MEMORY[0x21D4500C0](v21, v19);
      }
      else {
        id v23 = *(id *)(v19 + 8 * v21 + 32);
      }
      id v24 = v23;
      id v25 = objc_msgSend(v24, sel_uuid);
      sub_21797C5F8();

      id v26 = objc_msgSend(v24, sel_layerQuad);
      objc_msgSend(v26, sel_topLeft);
      uint64_t v28 = v27;
      uint64_t v30 = v29;
      objc_msgSend(v26, sel_topRight);
      uint64_t v32 = v31;
      uint64_t v34 = v33;
      objc_msgSend(v26, sel_bottomRight);
      uint64_t v36 = v35;
      uint64_t v38 = v37;
      objc_msgSend(v26, sel_bottomLeft);
      uint64_t v40 = v39;
      uint64_t v42 = v41;
      uint64_t v43 = (int *)type metadata accessor for RecognizedItem.Text(0);
      uint64_t v44 = &v17[v43[5]];
      *(void *)uint64_t v44 = v28;
      *((void *)v44 + 1) = v30;
      *((void *)v44 + 2) = v32;
      *((void *)v44 + 3) = v34;
      *((void *)v44 + 4) = v36;
      *((void *)v44 + 5) = v38;
      *((void *)v44 + 6) = v40;
      *((void *)v44 + 7) = v42;
      *((void *)v44 + 8) = v26;
      id v45 = objc_msgSend(v24, sel_transcript);
      uint64_t v46 = sub_21797C758();
      uint64_t v48 = v47;

      id v49 = (uint64_t *)&v17[v43[6]];
      *id v49 = v46;
      v49[1] = v48;
      id v50 = objc_msgSend(v24, sel_observation);

      *(void *)&v17[v43[7]] = v50;
      swift_storeEnumTagMultiPayload();

      uint64_t v219 = v22;
      unint64_t v52 = *(void *)(v22 + 16);
      unint64_t v51 = *(void *)(v22 + 24);
      if (v52 >= v51 >> 1)
      {
        sub_217967C00(v51 > 1, v52 + 1, 1);
        uint64_t v22 = v219;
      }
      ++v21;
      *(void *)(v22 + 16) = v52 + 1;
      sub_21797BFE8((uint64_t)v17, v22+ ((*(unsigned __int8 *)(v217 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v217 + 80))+ *(void *)(v217 + 72) * v52, type metadata accessor for RecognizedItem);
      unint64_t v19 = v215;
    }
    while (v20 != v21);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
  uint64_t v53 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems;
  uint64_t v54 = v213;
  *(void *)(v213 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems) = v22;
  swift_bridgeObjectRelease();
  unint64_t v55 = 0x267BA4000uLL;
  if (*(unsigned char *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems))
  {
    uint64_t v219 = *(void *)(v54 + v53);
    swift_bridgeObjectRetain();
    uint64_t v56 = swift_bridgeObjectRetain();
    sub_217977F28(v56);
    uint64_t v201 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems;
    *(void *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems) = v219;
    swift_bridgeObjectRelease();
    id v57 = objc_msgSend(v210, sel_addedItems);
    unint64_t v19 = sub_21797C798();

    if (!(v19 >> 62))
    {
      uint64_t v58 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_17;
    }
LABEL_42:
    swift_bridgeObjectRetain();
    uint64_t v58 = sub_21797C9B8();
    swift_bridgeObjectRelease();
LABEL_17:
    uint64_t v59 = (uint64_t)v208;
    if (v58)
    {
      uint64_t v219 = MEMORY[0x263F8EE78];
      sub_217967C00(0, v58 & ~(v58 >> 63), 0);
      if (v58 < 0)
      {
        __break(1u);
        goto LABEL_77;
      }
      uint64_t v60 = 0;
      unint64_t v61 = v19 & 0xC000000000000001;
      unint64_t v215 = v219;
      unint64_t v62 = v19;
      do
      {
        if (v61) {
          id v63 = (id)MEMORY[0x21D4500C0](v60, v19);
        }
        else {
          id v63 = *(id *)(v19 + 8 * v60 + 32);
        }
        id v64 = v63;
        id v65 = objc_msgSend(v64, sel_uuid);
        sub_21797C5F8();

        id v66 = objc_msgSend(v64, sel_layerQuad);
        objc_msgSend(v66, sel_topLeft);
        uint64_t v68 = v67;
        uint64_t v70 = v69;
        objc_msgSend(v66, sel_topRight);
        uint64_t v72 = v71;
        uint64_t v74 = v73;
        objc_msgSend(v66, sel_bottomRight);
        uint64_t v76 = v75;
        uint64_t v78 = v77;
        objc_msgSend(v66, sel_bottomLeft);
        uint64_t v80 = v79;
        uint64_t v82 = v81;
        uint64_t v83 = (int *)type metadata accessor for RecognizedItem.Text(0);
        v84 = &v15[v83[5]];
        *(void *)v84 = v68;
        *((void *)v84 + 1) = v70;
        *((void *)v84 + 2) = v72;
        *((void *)v84 + 3) = v74;
        *((void *)v84 + 4) = v76;
        *((void *)v84 + 5) = v78;
        *((void *)v84 + 6) = v80;
        *((void *)v84 + 7) = v82;
        *((void *)v84 + 8) = v66;
        id v85 = objc_msgSend(v64, sel_transcript);
        uint64_t v86 = sub_21797C758();
        uint64_t v88 = v87;

        uint64_t v89 = (uint64_t *)&v15[v83[6]];
        *uint64_t v89 = v86;
        v89[1] = v88;
        id v90 = objc_msgSend(v64, sel_observation);

        *(void *)&v15[v83[7]] = v90;
        swift_storeEnumTagMultiPayload();

        uint64_t v91 = v215;
        uint64_t v219 = v215;
        unint64_t v93 = *(void *)(v215 + 16);
        unint64_t v92 = *(void *)(v215 + 24);
        if (v93 >= v92 >> 1)
        {
          sub_217967C00(v92 > 1, v93 + 1, 1);
          uint64_t v91 = v219;
        }
        ++v60;
        *(void *)(v91 + 16) = v93 + 1;
        unint64_t v94 = (*(unsigned __int8 *)(v217 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v217 + 80);
        unint64_t v215 = v91;
        sub_21797BFE8((uint64_t)v15, v91 + v94 + *(void *)(v217 + 72) * v93, type metadata accessor for RecognizedItem);
        unint64_t v19 = v62;
      }
      while (v58 != v60);
      swift_bridgeObjectRelease();
      uint64_t v59 = (uint64_t)v208;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v215 = MEMORY[0x263F8EE78];
    }
    id v95 = objc_msgSend(v210, sel_updatedItems);
    unint64_t v96 = sub_21797C798();

    if (v96 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v97 = sub_21797C9B8();
      swift_bridgeObjectRelease();
      if (v97)
      {
LABEL_31:
        uint64_t v219 = MEMORY[0x263F8EE78];
        sub_217967C00(0, v97 & ~(v97 >> 63), 0);
        if ((v97 & 0x8000000000000000) == 0)
        {
          uint64_t v98 = 0;
          unint64_t v211 = v96 & 0xC000000000000001;
          unint64_t v214 = v219;
          uint64_t v99 = (uint64_t)v207;
          unint64_t v100 = v96;
          do
          {
            if (v211) {
              id v101 = (id)MEMORY[0x21D4500C0](v98, v96);
            }
            else {
              id v101 = *(id *)(v96 + 8 * v98 + 32);
            }
            id v102 = v101;
            id v103 = objc_msgSend(v102, sel_uuid);
            sub_21797C5F8();

            id v104 = objc_msgSend(v102, sel_layerQuad);
            objc_msgSend(v104, sel_topLeft);
            uint64_t v106 = v105;
            uint64_t v108 = v107;
            objc_msgSend(v104, sel_topRight);
            uint64_t v110 = v109;
            uint64_t v112 = v111;
            objc_msgSend(v104, sel_bottomRight);
            uint64_t v114 = v113;
            uint64_t v116 = v115;
            objc_msgSend(v104, sel_bottomLeft);
            uint64_t v118 = v117;
            uint64_t v120 = v119;
            v121 = (int *)type metadata accessor for RecognizedItem.Text(0);
            v122 = (void *)(v99 + v121[5]);
            void *v122 = v106;
            v122[1] = v108;
            v122[2] = v110;
            v122[3] = v112;
            v122[4] = v114;
            v122[5] = v116;
            v122[6] = v118;
            v122[7] = v120;
            v122[8] = v104;
            id v123 = objc_msgSend(v102, sel_transcript);
            uint64_t v124 = sub_21797C758();
            uint64_t v126 = v125;

            v127 = (uint64_t *)(v99 + v121[6]);
            uint64_t *v127 = v124;
            v127[1] = v126;
            id v128 = objc_msgSend(v102, sel_observation);

            *(void *)(v99 + v121[7]) = v128;
            swift_storeEnumTagMultiPayload();

            unint64_t v129 = v214;
            uint64_t v219 = v214;
            unint64_t v131 = *(void *)(v214 + 16);
            unint64_t v130 = *(void *)(v214 + 24);
            if (v131 >= v130 >> 1)
            {
              sub_217967C00(v130 > 1, v131 + 1, 1);
              unint64_t v129 = v219;
            }
            ++v98;
            *(void *)(v129 + 16) = v131 + 1;
            unint64_t v132 = (*(unsigned __int8 *)(v217 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v217 + 80);
            unint64_t v214 = v129;
            sub_21797BFE8(v99, v129 + v132 + *(void *)(v217 + 72) * v131, type metadata accessor for RecognizedItem);
            unint64_t v96 = v100;
          }
          while (v97 != v98);
          swift_bridgeObjectRelease();
          uint64_t v59 = (uint64_t)v208;
LABEL_45:
          id v133 = objc_msgSend(v210, sel_removedItems);
          unint64_t v134 = sub_21797C798();

          if (v134 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v135 = sub_21797C9B8();
            swift_bridgeObjectRelease();
            if (v135)
            {
LABEL_47:
              uint64_t v219 = MEMORY[0x263F8EE78];
              sub_217967C00(0, v135 & ~(v135 >> 63), 0);
              if ((v135 & 0x8000000000000000) == 0)
              {
                uint64_t v136 = 0;
                unint64_t v211 = v134 & 0xC000000000000001;
                uint64_t v137 = v219;
                unint64_t v138 = v134;
                do
                {
                  if (v211) {
                    id v139 = (id)MEMORY[0x21D4500C0](v136, v134);
                  }
                  else {
                    id v139 = *(id *)(v134 + 8 * v136 + 32);
                  }
                  id v140 = v139;
                  id v141 = objc_msgSend(v140, sel_uuid);
                  sub_21797C5F8();

                  id v142 = objc_msgSend(v140, sel_layerQuad);
                  objc_msgSend(v142, sel_topLeft);
                  uint64_t v144 = v143;
                  uint64_t v146 = v145;
                  objc_msgSend(v142, sel_topRight);
                  uint64_t v148 = v147;
                  uint64_t v150 = v149;
                  objc_msgSend(v142, sel_bottomRight);
                  uint64_t v152 = v151;
                  uint64_t v154 = v153;
                  objc_msgSend(v142, sel_bottomLeft);
                  uint64_t v156 = v155;
                  uint64_t v158 = v157;
                  v159 = (int *)type metadata accessor for RecognizedItem.Text(0);
                  v160 = (void *)(v59 + v159[5]);
                  void *v160 = v144;
                  v160[1] = v146;
                  v160[2] = v148;
                  v160[3] = v150;
                  v160[4] = v152;
                  v160[5] = v154;
                  v160[6] = v156;
                  v160[7] = v158;
                  v160[8] = v142;
                  id v161 = objc_msgSend(v140, sel_transcript);
                  uint64_t v162 = sub_21797C758();
                  uint64_t v164 = v163;

                  v165 = (uint64_t *)(v59 + v159[6]);
                  uint64_t *v165 = v162;
                  v165[1] = v164;
                  id v166 = objc_msgSend(v140, sel_observation);

                  *(void *)(v59 + v159[7]) = v166;
                  swift_storeEnumTagMultiPayload();

                  uint64_t v219 = v137;
                  unint64_t v168 = *(void *)(v137 + 16);
                  unint64_t v167 = *(void *)(v137 + 24);
                  if (v168 >= v167 >> 1)
                  {
                    sub_217967C00(v167 > 1, v168 + 1, 1);
                    uint64_t v137 = v219;
                  }
                  ++v136;
                  *(void *)(v137 + 16) = v168 + 1;
                  sub_21797BFE8(v59, v137+ ((*(unsigned __int8 *)(v217 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v217 + 80))+ *(void *)(v217 + 72) * v168, type metadata accessor for RecognizedItem);
                  unint64_t v134 = v138;
                }
                while (v135 != v136);
                swift_bridgeObjectRelease();
                goto LABEL_58;
              }
LABEL_78:
              __break(1u);
              return;
            }
          }
          else
          {
            uint64_t v135 = *(void *)((v134 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (v135) {
              goto LABEL_47;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v137 = MEMORY[0x263F8EE78];
LABEL_58:
          uint64_t v54 = v213;
          uint64_t v169 = v213 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate;
          swift_beginAccess();
          uint64_t v170 = MEMORY[0x21D450800](v169);
          unint64_t v55 = 0x267BA4000;
          uint64_t v171 = v201;
          unint64_t v211 = v137;
          if (v170)
          {
            v172 = *(void **)(v169 + 8);
            uint64_t v173 = v215;
            if (*(void *)(v215 + 16))
            {
              uint64_t ObjectType = swift_getObjectType();
              uint64_t v175 = v213;
              uint64_t v176 = *(void *)(v213 + v171);
              v177 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))v172[3];
              swift_bridgeObjectRetain();
              v177(v175, v173, v176, ObjectType, v172);
              swift_bridgeObjectRelease();
            }
            unint64_t v178 = v214;
            if (*(void *)(v214 + 16))
            {
              uint64_t v179 = swift_getObjectType();
              uint64_t v180 = v213;
              uint64_t v181 = *(void *)(v213 + v171);
              v182 = (void (*)(uint64_t, unint64_t, uint64_t, uint64_t, void *))v172[4];
              swift_bridgeObjectRetain();
              v182(v180, v178, v181, v179, v172);
              swift_bridgeObjectRelease();
            }
            uint64_t v137 = v211;
            if (*(void *)(v211 + 16))
            {
              uint64_t v183 = swift_getObjectType();
              uint64_t v54 = v213;
              uint64_t v184 = *(void *)(v213 + v171);
              v185 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))v172[5];
              swift_bridgeObjectRetain();
              v185(v54, v137, v184, v183, v172);
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_unknownObjectRelease();
              uint64_t v54 = v213;
            }
          }
          v186 = (char **)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations);
          swift_beginAccess();
          v187 = *v186;
          uint64_t v188 = *((void *)*v186 + 2);
          if (v188)
          {
            uint64_t v189 = *(void *)(v204 + 16);
            v190 = &v187[(*(unsigned __int8 *)(v204 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v204 + 80)];
            uint64_t v216 = *(void *)(v204 + 72);
            uint64_t v217 = v189;
            v191 = (void (**)(char *, uint64_t))(v202 + 8);
            v192 = (void (**)(char *, uint64_t))(v204 + 8);
            id v210 = v187;
            swift_bridgeObjectRetain();
            uint64_t v193 = v206;
            v194 = v205;
            uint64_t v195 = v212;
            uint64_t v196 = v171;
            v197 = v203;
            do
            {
              ((void (*)(char *, char *, uint64_t))v217)(v197, v190, v195);
              uint64_t v218 = *(void *)(v213 + v196);
              swift_bridgeObjectRetain();
              sub_21797C828();
              uint64_t v195 = v212;
              (*v191)(v194, v193);
              (*v192)(v197, v195);
              v190 += v216;
              --v188;
            }
            while (v188);
            swift_bridgeObjectRelease();
            uint64_t v54 = v213;
            unint64_t v55 = 0x267BA4000uLL;
            uint64_t v137 = v211;
          }
          if (*(unsigned char *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled) == 1) {
            sub_2179747C8(v215, v214, v137);
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_73;
        }
LABEL_77:
        __break(1u);
        goto LABEL_78;
      }
    }
    else
    {
      uint64_t v97 = *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v97) {
        goto LABEL_31;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v214 = MEMORY[0x263F8EE78];
    goto LABEL_45;
  }
  sub_217972E30();
LABEL_73:
  if (*(void *)(*(void *)(v54 + *(void *)(v55 + 2016)) + 16))
  {
    objc_msgSend(*(id *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView), sel_hideGuidance);
    uint64_t v198 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer;
    objc_msgSend(*(id *)(v54 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer), sel_invalidate);
    v199 = *(void **)(v54 + v198);
    *(void *)(v54 + v198) = 0;
  }
  else
  {
    sub_21797620C();
  }
}

void sub_217971750(void *a1)
{
  unint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49D8);
  uint64_t v234 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v233 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4840);
  uint64_t v236 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v233 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v262 = type metadata accessor for RecognizedItem.Barcode(0);
  uint64_t v8 = MEMORY[0x270FA5388](v262);
  v255 = (char *)&v233 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v256 = (char *)&v233 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v257 = (char *)&v233 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v233 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49F8);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  v245 = (char *)&v233 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v233 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  id v24 = (char *)&v233 - v23;
  MEMORY[0x270FA5388](v22);
  id v26 = (char *)&v233 - v25;
  uint64_t v27 = type metadata accessor for RecognizedItem(0);
  uint64_t v260 = *(void *)(v27 - 8);
  uint64_t v261 = v27;
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v244 = (uint64_t)&v233 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v241 = (uint64_t)&v233 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v247 = (uint64_t)&v233 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v242 = (uint64_t)&v233 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v249 = (uint64_t)&v233 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  uint64_t v243 = (uint64_t)&v233 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  unint64_t v258 = (unint64_t)&v233 - v41;
  MEMORY[0x270FA5388](v40);
  uint64_t v251 = (uint64_t)&v233 - v42;
  id v240 = a1;
  id v43 = objc_msgSend(a1, sel_allItems);
  uint64_t v239 = sub_21796860C(0, &qword_267BA4A20);
  unint64_t v44 = sub_21797C798();

  unint64_t v45 = v44;
  unint64_t v259 = v44;
  if (v44 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v45 = v259;
    uint64_t v46 = sub_21797C9B8();
  }
  else
  {
    uint64_t v46 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v248 = v21;
  v250 = v24;
  unint64_t v246 = v2;
  v238 = v4;
  uint64_t v237 = v5;
  v235 = v7;
  if (v46)
  {
    if (v46 < 1)
    {
      __break(1u);
      goto LABEL_65;
    }
    v254 = (char *)v46;
    uint64_t v47 = 0;
    unint64_t v253 = v45 & 0xC000000000000001;
    uint64_t v48 = (void (**)(char *, void, uint64_t, uint64_t))(v260 + 56);
    id v49 = (unsigned int (**)(char *, uint64_t, uint64_t))(v260 + 48);
    unint64_t v50 = MEMORY[0x263F8EE78];
    do
    {
      if (v253) {
        id v51 = (id)MEMORY[0x21D4500C0](v47, v45);
      }
      else {
        id v51 = *(id *)(v45 + 8 * (void)v47 + 32);
      }
      id v52 = v51;
      id v53 = objc_msgSend(v52, sel_uuid);
      sub_21797C5F8();

      id v54 = objc_msgSend(v52, sel_layerQuad);
      objc_msgSend(v54, sel_topLeft);
      uint64_t v56 = v55;
      uint64_t v58 = v57;
      objc_msgSend(v54, sel_topRight);
      uint64_t v60 = v59;
      uint64_t v62 = v61;
      objc_msgSend(v54, sel_bottomRight);
      uint64_t v64 = v63;
      uint64_t v66 = v65;
      objc_msgSend(v54, sel_bottomLeft);
      uint64_t v67 = v262;
      uint64_t v68 = &v15[*(int *)(v262 + 20)];
      *(void *)uint64_t v68 = v56;
      *((void *)v68 + 1) = v58;
      *((void *)v68 + 2) = v60;
      *((void *)v68 + 3) = v62;
      *((void *)v68 + 4) = v64;
      *((void *)v68 + 5) = v66;
      *((void *)v68 + 6) = v69;
      *((void *)v68 + 7) = v70;
      *((void *)v68 + 8) = v54;
      *(void *)&v15[*(int *)(v67 + 28)] = objc_msgSend(v52, sel_observation);
      id v71 = objc_msgSend(v52, sel_payloadStringValue);
      if (v71)
      {
        uint64_t v72 = v71;
        uint64_t v73 = sub_21797C758();
        uint64_t v75 = v74;
      }
      else
      {

        uint64_t v73 = 0;
        uint64_t v75 = 0;
      }
      uint64_t v76 = (uint64_t *)&v15[*(int *)(v262 + 24)];
      *uint64_t v76 = v73;
      v76[1] = v75;
      sub_21797BFE8((uint64_t)v15, (uint64_t)v26, type metadata accessor for RecognizedItem.Barcode);
      uint64_t v77 = v261;
      swift_storeEnumTagMultiPayload();
      (*v48)(v26, 0, 1, v77);

      if ((*v49)(v26, 1, v77) == 1)
      {
        sub_21797C214((uint64_t)v26, &qword_267BA49F8);
      }
      else
      {
        uint64_t v78 = v251;
        sub_21797BFE8((uint64_t)v26, v251, type metadata accessor for RecognizedItem);
        sub_21797BFE8(v78, v258, type metadata accessor for RecognizedItem);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v50 = sub_217977CC0(0, *(void *)(v50 + 16) + 1, 1, v50);
        }
        unint64_t v80 = *(void *)(v50 + 16);
        unint64_t v79 = *(void *)(v50 + 24);
        if (v80 >= v79 >> 1) {
          unint64_t v50 = sub_217977CC0(v79 > 1, v80 + 1, 1, v50);
        }
        *(void *)(v50 + 16) = v80 + 1;
        sub_21797BFE8(v258, v50+ ((*(unsigned __int8 *)(v260 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v260 + 80))+ *(void *)(v260 + 72) * v80, type metadata accessor for RecognizedItem);
      }
      ++v47;
      unint64_t v45 = v259;
    }
    while (v254 != v47);
  }
  else
  {
    unint64_t v50 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease_n();
  uint64_t v81 = v252;
  *(void *)(v252 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems) = v50;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v81 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems))
  {
    uint64_t v264 = *(void *)(v81 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems);
    swift_bridgeObjectRetain();
    uint64_t v82 = swift_bridgeObjectRetain();
    sub_217977F28(v82);
    uint64_t v4 = (char *)OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems;
    *(void *)(v81 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems) = v264;
    swift_bridgeObjectRelease();
    id v83 = objc_msgSend(v240, sel_addedItems);
    unint64_t v2 = sub_21797C798();

    if (!(v2 >> 62))
    {
      uint64_t v84 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      goto LABEL_24;
    }
LABEL_65:
    swift_bridgeObjectRetain();
    uint64_t v84 = sub_21797C9B8();
LABEL_24:
    v254 = v4;
    if (v84)
    {
      if (v84 < 1)
      {
        __break(1u);
        goto LABEL_107;
      }
      uint64_t v85 = 0;
      uint64_t v86 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v260 + 56);
      uint64_t v87 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v260 + 48);
      unint64_t v259 = MEMORY[0x263F8EE78];
      do
      {
        if ((v2 & 0xC000000000000001) != 0) {
          id v88 = (id)MEMORY[0x21D4500C0](v85, v2);
        }
        else {
          id v88 = *(id *)(v2 + 8 * v85 + 32);
        }
        id v89 = v88;
        id v90 = objc_msgSend(v89, sel_uuid);
        uint64_t v91 = v257;
        sub_21797C5F8();

        id v92 = objc_msgSend(v89, sel_layerQuad);
        objc_msgSend(v92, sel_topLeft);
        uint64_t v94 = v93;
        uint64_t v96 = v95;
        objc_msgSend(v92, sel_topRight);
        uint64_t v98 = v97;
        uint64_t v100 = v99;
        objc_msgSend(v92, sel_bottomRight);
        uint64_t v102 = v101;
        uint64_t v104 = v103;
        objc_msgSend(v92, sel_bottomLeft);
        uint64_t v105 = v262;
        uint64_t v106 = &v91[*(int *)(v262 + 20)];
        *(void *)uint64_t v106 = v94;
        *((void *)v106 + 1) = v96;
        *((void *)v106 + 2) = v98;
        *((void *)v106 + 3) = v100;
        *((void *)v106 + 4) = v102;
        *((void *)v106 + 5) = v104;
        *((void *)v106 + 6) = v107;
        *((void *)v106 + 7) = v108;
        *((void *)v106 + 8) = v92;
        *(void *)&v91[*(int *)(v105 + 28)] = objc_msgSend(v89, sel_observation);
        id v109 = objc_msgSend(v89, sel_payloadStringValue);
        if (v109)
        {
          uint64_t v110 = v109;
          uint64_t v111 = sub_21797C758();
          uint64_t v113 = v112;
        }
        else
        {

          uint64_t v111 = 0;
          uint64_t v113 = 0;
        }
        uint64_t v114 = (uint64_t)v257;
        uint64_t v115 = (uint64_t *)&v257[*(int *)(v262 + 24)];
        *uint64_t v115 = v111;
        v115[1] = v113;
        uint64_t v116 = (uint64_t)v250;
        sub_21797BFE8(v114, (uint64_t)v250, type metadata accessor for RecognizedItem.Barcode);
        uint64_t v117 = v261;
        swift_storeEnumTagMultiPayload();
        (*v86)(v116, 0, 1, v117);

        if ((*v87)(v116, 1, v117) == 1)
        {
          sub_21797C214(v116, &qword_267BA49F8);
        }
        else
        {
          uint64_t v118 = v243;
          sub_21797BFE8(v116, v243, type metadata accessor for RecognizedItem);
          sub_21797BFE8(v118, v249, type metadata accessor for RecognizedItem);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v119 = v259;
          }
          else {
            unint64_t v119 = sub_217977CC0(0, *(void *)(v259 + 16) + 1, 1, v259);
          }
          unint64_t v121 = *(void *)(v119 + 16);
          unint64_t v120 = *(void *)(v119 + 24);
          if (v121 >= v120 >> 1) {
            unint64_t v119 = sub_217977CC0(v120 > 1, v121 + 1, 1, v119);
          }
          *(void *)(v119 + 16) = v121 + 1;
          unint64_t v122 = (*(unsigned __int8 *)(v260 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v260 + 80);
          unint64_t v259 = v119;
          sub_21797BFE8(v249, v119 + v122 + *(void *)(v260 + 72) * v121, type metadata accessor for RecognizedItem);
        }
        ++v85;
      }
      while (v84 != v85);
    }
    else
    {
      unint64_t v259 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease_n();
    id v123 = objc_msgSend(v240, sel_updatedItems);
    unint64_t v124 = sub_21797C798();

    if (v124 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v125 = sub_21797C9B8();
      if (v125)
      {
LABEL_46:
        if (v125 >= 1)
        {
          uint64_t v126 = 0;
          v127 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v260 + 56);
          id v128 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v260 + 48);
          unint64_t v258 = MEMORY[0x263F8EE78];
          do
          {
            if ((v124 & 0xC000000000000001) != 0) {
              id v129 = (id)MEMORY[0x21D4500C0](v126, v124);
            }
            else {
              id v129 = *(id *)(v124 + 8 * v126 + 32);
            }
            id v130 = v129;
            id v131 = objc_msgSend(v130, sel_uuid);
            unint64_t v132 = v256;
            sub_21797C5F8();

            id v133 = objc_msgSend(v130, sel_layerQuad);
            objc_msgSend(v133, sel_topLeft);
            uint64_t v135 = v134;
            uint64_t v137 = v136;
            objc_msgSend(v133, sel_topRight);
            uint64_t v139 = v138;
            uint64_t v141 = v140;
            objc_msgSend(v133, sel_bottomRight);
            uint64_t v143 = v142;
            uint64_t v145 = v144;
            objc_msgSend(v133, sel_bottomLeft);
            uint64_t v146 = v262;
            uint64_t v147 = &v132[*(int *)(v262 + 20)];
            *(void *)uint64_t v147 = v135;
            *((void *)v147 + 1) = v137;
            *((void *)v147 + 2) = v139;
            *((void *)v147 + 3) = v141;
            *((void *)v147 + 4) = v143;
            *((void *)v147 + 5) = v145;
            *((void *)v147 + 6) = v148;
            *((void *)v147 + 7) = v149;
            *((void *)v147 + 8) = v133;
            *(void *)&v132[*(int *)(v146 + 28)] = objc_msgSend(v130, sel_observation);
            id v150 = objc_msgSend(v130, sel_payloadStringValue);
            if (v150)
            {
              uint64_t v151 = v150;
              uint64_t v152 = sub_21797C758();
              uint64_t v154 = v153;
            }
            else
            {

              uint64_t v152 = 0;
              uint64_t v154 = 0;
            }
            uint64_t v155 = (uint64_t)v256;
            uint64_t v156 = (uint64_t *)&v256[*(int *)(v262 + 24)];
            *uint64_t v156 = v152;
            v156[1] = v154;
            uint64_t v157 = (uint64_t)v248;
            sub_21797BFE8(v155, (uint64_t)v248, type metadata accessor for RecognizedItem.Barcode);
            uint64_t v158 = v261;
            swift_storeEnumTagMultiPayload();
            (*v127)(v157, 0, 1, v158);

            if ((*v128)(v157, 1, v158) == 1)
            {
              sub_21797C214(v157, &qword_267BA49F8);
            }
            else
            {
              uint64_t v159 = v242;
              sub_21797BFE8(v157, v242, type metadata accessor for RecognizedItem);
              sub_21797BFE8(v159, v247, type metadata accessor for RecognizedItem);
              if (swift_isUniquelyReferenced_nonNull_native()) {
                unint64_t v160 = v258;
              }
              else {
                unint64_t v160 = sub_217977CC0(0, *(void *)(v258 + 16) + 1, 1, v258);
              }
              unint64_t v162 = *(void *)(v160 + 16);
              unint64_t v161 = *(void *)(v160 + 24);
              if (v162 >= v161 >> 1) {
                unint64_t v160 = sub_217977CC0(v161 > 1, v162 + 1, 1, v160);
              }
              *(void *)(v160 + 16) = v162 + 1;
              unint64_t v163 = (*(unsigned __int8 *)(v260 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v260 + 80);
              unint64_t v258 = v160;
              sub_21797BFE8(v247, v160 + v163 + *(void *)(v260 + 72) * v162, type metadata accessor for RecognizedItem);
            }
            ++v126;
          }
          while (v125 != v126);
LABEL_68:
          swift_bridgeObjectRelease_n();
          id v164 = objc_msgSend(v240, sel_removedItems);
          unint64_t v165 = sub_21797C798();

          if (v165 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v166 = sub_21797C9B8();
            if (v166)
            {
LABEL_70:
              if (v166 >= 1)
              {
                unint64_t v167 = 0;
                v257 = (char *)(v165 & 0xC000000000000001);
                unint64_t v168 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v260 + 56);
                uint64_t v169 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v260 + 48);
                uint64_t v170 = MEMORY[0x263F8EE78];
                v256 = (char *)v166;
                do
                {
                  if (v257) {
                    id v172 = (id)MEMORY[0x21D4500C0](v167, v165);
                  }
                  else {
                    id v172 = *(id *)(v165 + 8 * (void)v167 + 32);
                  }
                  unint64_t v173 = v170;
                  id v174 = v172;
                  id v175 = objc_msgSend(v174, sel_uuid);
                  uint64_t v176 = v255;
                  sub_21797C5F8();

                  id v177 = objc_msgSend(v174, sel_layerQuad);
                  objc_msgSend(v177, sel_topLeft);
                  uint64_t v179 = v178;
                  uint64_t v181 = v180;
                  objc_msgSend(v177, sel_topRight);
                  uint64_t v183 = v182;
                  uint64_t v185 = v184;
                  objc_msgSend(v177, sel_bottomRight);
                  uint64_t v187 = v186;
                  uint64_t v189 = v188;
                  objc_msgSend(v177, sel_bottomLeft);
                  uint64_t v190 = v262;
                  v191 = &v176[*(int *)(v262 + 20)];
                  *(void *)v191 = v179;
                  *((void *)v191 + 1) = v181;
                  *((void *)v191 + 2) = v183;
                  *((void *)v191 + 3) = v185;
                  *((void *)v191 + 4) = v187;
                  *((void *)v191 + 5) = v189;
                  *((void *)v191 + 6) = v192;
                  *((void *)v191 + 7) = v193;
                  *((void *)v191 + 8) = v177;
                  *(void *)&v176[*(int *)(v190 + 28)] = objc_msgSend(v174, sel_observation);
                  id v194 = objc_msgSend(v174, sel_payloadStringValue);
                  if (v194)
                  {
                    uint64_t v195 = v194;
                    uint64_t v196 = sub_21797C758();
                    uint64_t v198 = v197;
                  }
                  else
                  {

                    uint64_t v196 = 0;
                    uint64_t v198 = 0;
                  }
                  uint64_t v199 = (uint64_t)v245;
                  uint64_t v200 = (uint64_t)v255;
                  uint64_t v201 = (uint64_t *)&v255[*(int *)(v262 + 24)];
                  *uint64_t v201 = v196;
                  v201[1] = v198;
                  sub_21797BFE8(v200, v199, type metadata accessor for RecognizedItem.Barcode);
                  uint64_t v202 = v261;
                  swift_storeEnumTagMultiPayload();
                  (*v168)(v199, 0, 1, v202);

                  if ((*v169)(v199, 1, v202) == 1)
                  {
                    sub_21797C214(v199, &qword_267BA49F8);
                    uint64_t v170 = v173;
                    uint64_t v171 = v256;
                  }
                  else
                  {
                    uint64_t v203 = v199;
                    uint64_t v204 = v241;
                    sub_21797BFE8(v203, v241, type metadata accessor for RecognizedItem);
                    sub_21797BFE8(v204, v244, type metadata accessor for RecognizedItem);
                    uint64_t v170 = v173;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                      uint64_t v170 = sub_217977CC0(0, *(void *)(v173 + 16) + 1, 1, v173);
                    }
                    uint64_t v171 = v256;
                    unint64_t v206 = *(void *)(v170 + 16);
                    unint64_t v205 = *(void *)(v170 + 24);
                    if (v206 >= v205 >> 1) {
                      uint64_t v170 = sub_217977CC0(v205 > 1, v206 + 1, 1, v170);
                    }
                    *(void *)(v170 + 16) = v206 + 1;
                    sub_21797BFE8(v244, v170+ ((*(unsigned __int8 *)(v260 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v260 + 80))+ *(void *)(v260 + 72) * v206, type metadata accessor for RecognizedItem);
                  }
                  ++v167;
                }
                while (v171 != v167);
                goto LABEL_88;
              }
LABEL_108:
              __break(1u);
              return;
            }
          }
          else
          {
            uint64_t v166 = *(void *)((v165 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (v166) {
              goto LABEL_70;
            }
          }
          uint64_t v170 = MEMORY[0x263F8EE78];
LABEL_88:
          swift_bridgeObjectRelease_n();
          uint64_t v81 = v252;
          uint64_t v207 = v252 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate;
          swift_beginAccess();
          if (MEMORY[0x21D450800](v207))
          {
            v208 = *(void **)(v207 + 8);
            unint64_t v209 = v259;
            if (*(void *)(v259 + 16))
            {
              uint64_t ObjectType = swift_getObjectType();
              uint64_t v211 = *(void *)&v254[v81];
              uint64_t v212 = (void (*)(uint64_t, unint64_t, uint64_t, uint64_t, void *))v208[3];
              swift_bridgeObjectRetain();
              v212(v81, v209, v211, ObjectType, v208);
              swift_bridgeObjectRelease();
            }
            unint64_t v213 = v258;
            if (*(void *)(v258 + 16))
            {
              uint64_t v214 = swift_getObjectType();
              uint64_t v215 = *(void *)&v254[v81];
              uint64_t v216 = (void (*)(uint64_t, unint64_t, uint64_t, uint64_t, void *))v208[4];
              swift_bridgeObjectRetain();
              v216(v81, v213, v215, v214, v208);
              swift_bridgeObjectRelease();
            }
            if (*(void *)(v170 + 16))
            {
              uint64_t v217 = swift_getObjectType();
              uint64_t v218 = *(void *)&v254[v81];
              uint64_t v219 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))v208[5];
              swift_bridgeObjectRetain();
              v219(v81, v170, v218, v217, v208);
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_unknownObjectRelease();
            }
          }
          v220 = (char **)(v81 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations);
          swift_beginAccess();
          v221 = *v220;
          uint64_t v222 = *((void *)*v220 + 2);
          if (v222)
          {
            uint64_t v260 = v170;
            uint64_t v223 = *(void *)(v236 + 16);
            v224 = &v221[(*(unsigned __int8 *)(v236 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v236 + 80)];
            uint64_t v261 = *(void *)(v236 + 72);
            uint64_t v262 = v223;
            v225 = (void (**)(char *, unint64_t))(v234 + 8);
            v226 = (void (**)(char *, uint64_t))(v236 + 8);
            v257 = v221;
            swift_bridgeObjectRetain();
            v227 = v238;
            uint64_t v228 = v237;
            v229 = v235;
            v230 = v254;
            do
            {
              ((void (*)(char *, char *, uint64_t))v262)(v229, v224, v228);
              uint64_t v263 = *(void *)&v230[v252];
              swift_bridgeObjectRetain();
              sub_21797C828();
              (*v225)(v227, v246);
              (*v226)(v229, v228);
              v224 += v261;
              --v222;
            }
            while (v222);
            swift_bridgeObjectRelease();
            uint64_t v81 = v252;
            uint64_t v170 = v260;
          }
          if (*(unsigned char *)(v81 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled) == 1) {
            sub_2179747C8(v259, v258, v170);
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_103;
        }
LABEL_107:
        __break(1u);
        goto LABEL_108;
      }
    }
    else
    {
      uint64_t v125 = *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v125) {
        goto LABEL_46;
      }
    }
    unint64_t v258 = MEMORY[0x263F8EE78];
    goto LABEL_68;
  }
  sub_217972E30();
LABEL_103:
  if (*(void *)(*(void *)(v81 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems) + 16))
  {
    objc_msgSend(*(id *)(v81 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView), sel_hideGuidance);
    uint64_t v231 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer;
    objc_msgSend(*(id *)(v81 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer), sel_invalidate);
    v232 = *(void **)(v81 + v231);
    *(void *)(v81 + v231) = 0;
  }
  else
  {
    sub_21797620C();
  }
}

void *sub_217972E30()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49D8);
  uint64_t v163 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v159 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4840);
  uint64_t v165 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164);
  v191 = (char *)&v159 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49E0);
  uint64_t v6 = MEMORY[0x270FA5388](v178);
  uint64_t v177 = (uint64_t)&v159 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v176 = (uint64_t)&v159 - v8;
  *(void *)&long long v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49E8);
  uint64_t v9 = MEMORY[0x270FA5388](v171);
  uint64_t v170 = (char *)&v159 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v180 = (uint64_t)&v159 - v11;
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49F0);
  uint64_t v166 = *(void *)(v181 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v181);
  id v175 = (char *)&v159 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v167 = (char *)&v159 - v14;
  uint64_t v183 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x270FA5388](v183);
  uint64_t v185 = (uint64_t)&v159 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v182 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x270FA5388](v182);
  uint64_t v184 = (uint64_t)&v159 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for RecognizedItem(0);
  uint64_t v186 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v160 = (uint64_t)&v159 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v159 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v179 = (uint64_t)&v159 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v159 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v159 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v159 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v159 - v34;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49F8);
  uint64_t v37 = MEMORY[0x270FA5388](v36 - 8);
  uint64_t v174 = (uint64_t)&v159 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (void *)MEMORY[0x270FA5388](v37);
  uint64_t v168 = (uint64_t)&v159 - v40;
  uint64_t v41 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor;
  if (!*(void *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor)
    && !*(void *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor)
    && !*(void *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor))
  {
    return result;
  }
  uint64_t v159 = v22;
  unint64_t v161 = v4;
  uint64_t v162 = v2;
  uint64_t aBlock = *(void *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems);
  swift_bridgeObjectRetain();
  uint64_t v42 = swift_bridgeObjectRetain();
  sub_217977F28(v42);
  uint64_t v43 = aBlock;
  unint64_t v44 = *(void **)(v1 + v41);
  uint64_t v187 = v1;
  if (v44)
  {
    id v45 = v44;
    id v46 = objc_msgSend(v45, sel_configuration);
    objc_msgSend(v46, sel_comparisonPoint);
    double v48 = v47;
    double v50 = v49;

LABEL_8:
    uint64_t v54 = v186;
    goto LABEL_9;
  }
  id v51 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor);
  if (v51)
  {
    id v46 = objc_msgSend(v51, sel_configuration);
    objc_msgSend(v46, sel_comparisonPoint);
    double v48 = v52;
    double v50 = v53;
    goto LABEL_8;
  }
  uint64_t result = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor);
  uint64_t v54 = v186;
  if (!result)
  {
LABEL_60:
    __break(1u);
    return result;
  }
  id v46 = objc_msgSend(result, sel_configuration);
  objc_msgSend(v46, sel_comparisonPoint);
  double v48 = v137;
  double v50 = v138;
LABEL_9:

  uint64_t v55 = *(void *)(v43 + 16);
  uint64_t v189 = v17;
  if (v55)
  {
    uint64_t v56 = v43 + ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80));
    sub_217960D70(v56, (uint64_t)v35);
    uint64_t v57 = v43;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v55 != 1)
    {
      uint64_t v190 = v184 + 64;
      uint64_t v188 = v185 + 64;
      unint64_t v104 = 1;
      while (v104 < *(void *)(v57 + 16))
      {
        sub_217960D70(v56 + *(void *)(v54 + 72) * v104, (uint64_t)v33);
        sub_217960D70((uint64_t)v33, (uint64_t)v30);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v105 = v185;
          sub_21797BFE8((uint64_t)v30, v185, type metadata accessor for RecognizedItem.Barcode);
          id v106 = *(id *)(v188 + *(int *)(v183 + 20));
          uint64_t v107 = type metadata accessor for RecognizedItem.Barcode;
        }
        else
        {
          uint64_t v105 = v184;
          sub_21797BFE8((uint64_t)v30, v184, type metadata accessor for RecognizedItem.Text);
          id v106 = *(id *)(v190 + *(int *)(v182 + 20));
          uint64_t v107 = type metadata accessor for RecognizedItem.Text;
        }
        sub_217960E3C(v105, v107);
        objc_msgSend(v106, sel_vertexCentroid);
        double v109 = v108;
        double v111 = v110;

        double v112 = MEMORY[0x21D4501F0](v48, v50, v109, v111);
        sub_217960D70((uint64_t)v35, (uint64_t)v27);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v113 = v185;
          sub_21797BFE8((uint64_t)v27, v185, type metadata accessor for RecognizedItem.Barcode);
          id v114 = *(id *)(v188 + *(int *)(v183 + 20));
          uint64_t v115 = type metadata accessor for RecognizedItem.Barcode;
        }
        else
        {
          uint64_t v113 = v184;
          sub_21797BFE8((uint64_t)v27, v184, type metadata accessor for RecognizedItem.Text);
          id v114 = *(id *)(v190 + *(int *)(v182 + 20));
          uint64_t v115 = type metadata accessor for RecognizedItem.Text;
        }
        sub_217960E3C(v113, v115);
        objc_msgSend(v114, sel_vertexCentroid);
        double v117 = v116;
        double v119 = v118;

        if (v112 >= MEMORY[0x21D4501F0](v48, v50, v117, v119))
        {
          uint64_t result = (void *)sub_217960E3C((uint64_t)v33, type metadata accessor for RecognizedItem);
        }
        else
        {
          sub_217960E3C((uint64_t)v35, type metadata accessor for RecognizedItem);
          uint64_t result = (void *)sub_21797BFE8((uint64_t)v33, (uint64_t)v35, type metadata accessor for RecognizedItem);
        }
        uint64_t v17 = v189;
        uint64_t v54 = v186;
        if (v55 == ++v104) {
          goto LABEL_11;
        }
      }
      __break(1u);
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v58 = v168;
    sub_21797BFE8((uint64_t)v35, v168, type metadata accessor for RecognizedItem);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v58, 0, 1, v17);
  }
  else
  {
    uint64_t v58 = v168;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56))(v168, 1, 1, v17);
  }
  swift_bridgeObjectRelease();
  uint64_t v59 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems;
  uint64_t v60 = v187;
  uint64_t v61 = *(void *)(v187 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems);
  uint64_t v62 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
  if (v62(v58, 1, v17) == 1)
  {
    uint64_t v63 = MEMORY[0x263F8EE78];
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45B0);
  unint64_t v64 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_21797DC50;
  uint64_t v65 = v58;
  uint64_t v66 = v174;
  sub_21797C270(v65, v174, &qword_267BA49F8);
  uint64_t result = (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))v62)(v66, 1, v17);
  if (result == 1) {
    goto LABEL_59;
  }
  sub_21797BFE8(v66, v63 + v64, type metadata accessor for RecognizedItem);
LABEL_17:
  *(void *)(v60 + v59) = v63;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v67 = v60 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate;
  swift_beginAccess();
  uint64_t v68 = MEMORY[0x21D450800](v67);
  uint64_t v190 = v59;
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v188 = *(void *)(v67 + 8);
    uint64_t aBlock = *(void *)(v60 + v59);
    uint64_t v198 = v61;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4730);
    sub_21797C16C(&qword_267BA4A00, &qword_267BA4730);
    sub_21797C708();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21797C16C(&qword_267BA4A08, &qword_267BA49F0);
    uint64_t v70 = v181;
    sub_21797C858();
    sub_21797C868();
    if (aBlock != v198 || (uint64_t v71 = *(void *)(v60 + v190), !*(void *)(v71 + 16)))
    {
      uint64_t v174 = v69;
      uint64_t v76 = *(void (**)(char *, uint64_t, uint64_t))(v166 + 16);
      uint64_t v77 = (uint64_t)v170;
      uint64_t v173 = v166 + 16;
      id v172 = v76;
      v76(v170, (uint64_t)v167, v70);
      sub_21797C858();
      uint64_t v78 = v171;
      *(void *)(v77 + *(int *)(v171 + 36)) = aBlock;
      uint64_t v79 = v180;
      sub_21797C1B0(v77, v180, &qword_267BA49E8);
      unint64_t v80 = (uint64_t *)(v79 + *(int *)(v78 + 36));
      uint64_t v81 = *v80;
      sub_21797C868();
      uint64_t v82 = v179;
      if (v81 != aBlock)
      {
        unint64_t v120 = (void (**)(char *, uint64_t))(v166 + 8);
        uint64_t v170 = (char *)(v188 + 24);
        uint64_t v169 = v188 + 40;
        long long v171 = xmmword_21797DC50;
        do
        {
          unint64_t v124 = (void (*)(uint64_t *, void))sub_21797C888();
          uint64_t v125 = v176;
          sub_21797C270(v126, v176, &qword_267BA49E0);
          v124(&aBlock, 0);
          v127 = v175;
          v172(v175, v79, v70);
          sub_21797C878();
          (*v120)(v127, v70);
          uint64_t v128 = v125;
          uint64_t v129 = v177;
          sub_21797C1B0(v128, v177, &qword_267BA49E0);
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA4A10);
          sub_21797BFE8(v129 + *(int *)(v131 + 48), v82, type metadata accessor for RecognizedItem);
          uint64_t ObjectType = swift_getObjectType();
          __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45B0);
          unint64_t v133 = (*(unsigned __int8 *)(v186 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v186 + 80);
          uint64_t v134 = swift_allocObject();
          *(_OWORD *)(v134 + 16) = v171;
          sub_217960D70(v82, v134 + v133);
          uint64_t v135 = v187;
          uint64_t v136 = *(void *)(v187 + v190);
          if (EnumCaseMultiPayload == 1)
          {
            uint64_t v121 = v188;
            unint64_t v122 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v188 + 40);
          }
          else
          {
            uint64_t v121 = v188;
            unint64_t v122 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v188 + 24);
          }
          swift_bridgeObjectRetain();
          v122(v135, v134, v136, ObjectType, v121);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v82 = v179;
          sub_217960E3C(v179, type metadata accessor for RecognizedItem);
          uint64_t v123 = *v80;
          uint64_t v79 = v180;
          uint64_t v70 = v181;
          sub_21797C868();
        }
        while (v123 != aBlock);
      }
      swift_unknownObjectRelease();
      sub_21797C214(v79, &qword_267BA49E8);
      (*(void (**)(char *, uint64_t))(v166 + 8))(v167, v70);
      uint64_t v60 = v187;
      uint64_t v83 = v164;
      uint64_t v59 = v190;
      goto LABEL_26;
    }
    uint64_t v72 = v70;
    uint64_t v73 = swift_getObjectType();
    uint64_t v74 = v188;
    uint64_t v75 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v188 + 32);
    swift_bridgeObjectRetain();
    v75(v60, v71, v71, v73, v74);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v166 + 8))(v167, v72);
    uint64_t v59 = v190;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v83 = v164;
LABEL_26:
  uint64_t v84 = (uint64_t *)(v60 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations);
  swift_beginAccess();
  uint64_t v85 = *v84;
  uint64_t v86 = *(void *)(*v84 + 16);
  uint64_t v87 = v191;
  if (v86)
  {
    uint64_t v188 = *(void *)(v165 + 16);
    unint64_t v88 = v85 + ((*(unsigned __int8 *)(v165 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v165 + 80));
    uint64_t v187 = *(void *)(v165 + 72);
    id v89 = (void (**)(char *, uint64_t))(v163 + 8);
    uint64_t v90 = v83;
    uint64_t v91 = v60;
    id v92 = (void (**)(char *, uint64_t))(v165 + 8);
    uint64_t v181 = v85;
    swift_bridgeObjectRetain();
    uint64_t v93 = v162;
    uint64_t v94 = v161;
    do
    {
      ((void (*)(char *, unint64_t, uint64_t))v188)(v87, v88, v90);
      uint64_t aBlock = *(void *)(v91 + v190);
      swift_bridgeObjectRetain();
      sub_21797C828();
      uint64_t v87 = v191;
      (*v89)(v94, v93);
      (*v92)(v87, v90);
      v88 += v187;
      --v86;
    }
    while (v86);
    swift_bridgeObjectRelease();
    uint64_t v60 = v91;
    uint64_t v59 = v190;
  }
  if (*(unsigned char *)(v60 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled) == 1)
  {
    uint64_t v95 = *(void **)(v60 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView);
    if (v95)
    {
      uint64_t v96 = *(void *)(v60 + v59);
      if (*(void *)(v96 + 16))
      {
        uint64_t v97 = (uint64_t)v159;
        sub_217960D70(v96 + ((*(unsigned __int8 *)(v186 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v186 + 80)), (uint64_t)v159);
        uint64_t v98 = v160;
        sub_217960D70(v97, v160);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v99 = v185;
          sub_21797BFE8(v98, v185, type metadata accessor for RecognizedItem.Barcode);
          uint64_t v100 = *(void **)(v99 + *(int *)(v183 + 20) + 64);
          id v101 = v95;
          id v102 = v100;
          uint64_t v103 = type metadata accessor for RecognizedItem.Barcode;
        }
        else
        {
          uint64_t v99 = v184;
          sub_21797BFE8(v98, v184, type metadata accessor for RecognizedItem.Text);
          uint64_t v143 = *(void **)(v99 + *(int *)(v182 + 20) + 64);
          id v144 = v95;
          id v102 = v143;
          uint64_t v103 = type metadata accessor for RecognizedItem.Text;
        }
        sub_217960E3C(v99, v103);
        objc_msgSend(v102, sel_minimumBoundingRectWithoutRotation);
        uint64_t v146 = v145;
        uint64_t v148 = v147;
        uint64_t v150 = v149;
        uint64_t v152 = v151;
        objc_msgSend(v102, sel_averagedAngleFromBottomAndTopEdges);
        uint64_t v154 = v153;
        uint64_t v155 = self;
        uint64_t v156 = (void *)swift_allocObject();
        v156[2] = v95;
        v156[3] = v146;
        v156[4] = v148;
        v156[5] = v150;
        v156[6] = v152;
        v156[7] = v154;
        uint64_t v196 = sub_21797C088;
        uint64_t v197 = v156;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v193 = 1107296256;
        id v194 = sub_21796BA2C;
        uint64_t v195 = &block_descriptor_192;
        uint64_t v157 = _Block_copy(&aBlock);
        id v158 = v95;
        swift_release();
        objc_msgSend(v155, sel_animate_, v157);
        _Block_release(v157);

        sub_217960E3C(v97, type metadata accessor for RecognizedItem);
      }
      else
      {
        uint64_t v139 = self;
        uint64_t v140 = swift_allocObject();
        *(void *)(v140 + 16) = v95;
        uint64_t v196 = sub_21797C11C;
        uint64_t v197 = (void *)v140;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v193 = 1107296256;
        id v194 = sub_21796BA2C;
        uint64_t v195 = &block_descriptor_198;
        uint64_t v141 = _Block_copy(&aBlock);
        id v142 = v95;
        swift_release();
        objc_msgSend(v139, sel_animate_, v141);

        _Block_release(v141);
      }
    }
  }
  return (void *)sub_21797C214(v168, &qword_267BA49F8);
}

uint64_t sub_2179743D0(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = a2;
  uint64_t v3 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for RecognizedItem(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v31 - v13;
  uint64_t v15 = sub_21797C608();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v31 - v20;
  sub_217960D70(a1, (uint64_t)v14);
  uint64_t v22 = (void (**)(char *, char *, uint64_t))(v16 + 16);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21797BFE8((uint64_t)v14, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
    uint64_t v23 = *v22;
    (*v22)(v21, v5, v15);
    uint64_t v24 = type metadata accessor for RecognizedItem.Barcode;
    uint64_t v25 = (uint64_t)v5;
  }
  else
  {
    sub_21797BFE8((uint64_t)v14, (uint64_t)v8, type metadata accessor for RecognizedItem.Text);
    uint64_t v23 = *v22;
    (*v22)(v21, v8, v15);
    uint64_t v24 = type metadata accessor for RecognizedItem.Text;
    uint64_t v25 = (uint64_t)v8;
  }
  sub_217960E3C(v25, v24);
  sub_217960D70(v32, (uint64_t)v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21797BFE8((uint64_t)v12, (uint64_t)v5, type metadata accessor for RecognizedItem.Barcode);
    v23(v19, v5, v15);
    uint64_t v26 = type metadata accessor for RecognizedItem.Barcode;
    uint64_t v27 = (uint64_t)v5;
  }
  else
  {
    sub_21797BFE8((uint64_t)v12, (uint64_t)v8, type metadata accessor for RecognizedItem.Text);
    v23(v19, v8, v15);
    uint64_t v26 = type metadata accessor for RecognizedItem.Text;
    uint64_t v27 = (uint64_t)v8;
  }
  sub_217960E3C(v27, v26);
  char v28 = sub_21797C5E8();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v16 + 8);
  v29(v19, v15);
  v29(v21, v15);
  return v28 & 1;
}

uint64_t sub_217974784(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_2179747C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v134 = a2;
  uint64_t v6 = sub_21797C608();
  uint64_t v145 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v146 = (uint64_t)v132 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v139 = (char *)v132 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v140 = (char *)v132 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v132 - v13;
  uint64_t v144 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x270FA5388](v144);
  uint64_t v159 = (uint64_t)v132 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x270FA5388](v143);
  uint64_t v158 = (uint64_t)v132 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = type metadata accessor for RecognizedItem(0);
  uint64_t v135 = *(void *)(v161 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v161);
  uint64_t v136 = (uint64_t)v132 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v132 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v154 = (uint64_t)v132 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v137 = (uint64_t)v132 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v153 = (char *)v132 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)v132 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)v132 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v150 = (uint64_t)v132 - v35;
  MEMORY[0x270FA5388](v34);
  uint64_t v151 = (uint64_t)v132 - v36;
  uint64_t v152 = v3;
  uint64_t v37 = (uint64_t *)&v3[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID];
  uint64_t result = swift_beginAccess();
  if (!*v37) {
    return result;
  }
  uint64_t v133 = a3;
  uint64_t v39 = *(void *)(a1 + 16);
  uint64_t v160 = v6;
  double v138 = v21;
  uint64_t v157 = v30;
  if (!v39) {
    goto LABEL_24;
  }
  uint64_t v156 = v37;
  uint64_t v40 = (id *)&v152[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView];
  uint64_t v41 = v135;
  uint64_t v42 = a1 + ((*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80));
  v132[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v149 = v40;
  swift_beginAccess();
  uint64_t v142 = v158 + 64;
  uint64_t v141 = v159 + 64;
  uint64_t v155 = (void (**)(char *, uint64_t, uint64_t))(v145 + 16);
  uint64_t v148 = (void (**)(uint64_t, uint64_t))(v145 + 8);
  uint64_t v147 = *(void *)(v41 + 72);
  uint64_t v43 = v151;
  do
  {
    sub_217960D70(v42, v43);
    id v45 = objc_msgSend(v152, sel_view);
    if (!v45) {
      goto LABEL_67;
    }
    id v46 = v45;
    objc_msgSend(v45, sel_bounds);
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;

    id v55 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84860]), sel_initWithFrame_, v48, v50, v52, v54);
    uint64_t v56 = v150;
    sub_217960D70(v43, v150);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v57 = v159;
      sub_21797BFE8(v56, v159, type metadata accessor for RecognizedItem.Barcode);
      id v58 = *(id *)(v141 + *(int *)(v144 + 20));
      uint64_t v59 = type metadata accessor for RecognizedItem.Barcode;
    }
    else
    {
      uint64_t v57 = v158;
      sub_21797BFE8(v56, v158, type metadata accessor for RecognizedItem.Text);
      id v58 = *(id *)(v142 + *(int *)(v143 + 20));
      uint64_t v59 = type metadata accessor for RecognizedItem.Text;
    }
    sub_217960E3C(v57, v59);
    objc_msgSend(v55, sel_setQuad_, v58);

    sub_217960D70(v43, (uint64_t)v33);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v60 = v159;
      sub_21797BFE8((uint64_t)v33, v159, type metadata accessor for RecognizedItem.Barcode);
      uint64_t v61 = *v155;
      (*v155)(v14, v60, v6);
      uint64_t v62 = type metadata accessor for RecognizedItem.Barcode;
    }
    else
    {
      uint64_t v60 = v158;
      sub_21797BFE8((uint64_t)v33, v158, type metadata accessor for RecognizedItem.Text);
      uint64_t v61 = *v155;
      (*v155)(v14, v60, v6);
      uint64_t v62 = type metadata accessor for RecognizedItem.Text;
    }
    sub_217960E3C(v60, v62);
    uint64_t v63 = v33;
    unint64_t v64 = v156;
    swift_beginAccess();
    if (!*v64) {
      goto LABEL_68;
    }
    id v65 = v55;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v162 = (void *)*v64;
    uint64_t v67 = (uint64_t)v162;
    *unint64_t v64 = 0x8000000000000000;
    uint64_t v68 = (uint64_t)v14;
    unint64_t v70 = sub_2179780D8((uint64_t)v14);
    uint64_t v71 = *(void *)(v67 + 16);
    BOOL v72 = (v69 & 1) == 0;
    uint64_t v73 = v71 + v72;
    if (__OFADD__(v71, v72))
    {
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      uint64_t result = sub_21797CA38();
      __break(1u);
      return result;
    }
    char v74 = v69;
    if (*(void *)(v67 + 24) >= v73)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_217978A4C();
      }
    }
    else
    {
      sub_217978330(v73, isUniquelyReferenced_nonNull_native);
      unint64_t v75 = sub_2179780D8(v68);
      if ((v74 & 1) != (v76 & 1)) {
        goto LABEL_70;
      }
      unint64_t v70 = v75;
    }
    uint64_t v6 = v160;
    uint64_t v77 = v162;
    if (v74)
    {
      uint64_t v44 = v162[7];

      *(void *)(v44 + 8 * v70) = v65;
    }
    else
    {
      v162[(v70 >> 6) + 8] |= 1 << v70;
      v61((char *)(v77[6] + *(void *)(v145 + 72) * v70), v68, v6);
      *(void *)(v77[7] + 8 * v70) = v65;
      uint64_t v78 = v77[2];
      BOOL v79 = __OFADD__(v78, 1);
      uint64_t v80 = v78 + 1;
      if (v79) {
        goto LABEL_64;
      }
      v77[2] = v80;
    }
    *uint64_t v156 = (uint64_t)v77;
    swift_bridgeObjectRelease();
    uint64_t v14 = (char *)v68;
    (*v148)(v68, v6);
    swift_endAccess();
    objc_msgSend(*v149, sel_addSubview_, v65);

    uint64_t v43 = v151;
    sub_217960E3C(v151, type metadata accessor for RecognizedItem);
    v42 += v147;
    --v39;
    uint64_t v30 = v157;
    uint64_t v33 = v63;
  }
  while (v39);
  swift_bridgeObjectRelease();
  uint64_t v37 = v156;
LABEL_24:
  uint64_t v81 = *(void *)(v134 + 16);
  if (!v81) {
    goto LABEL_40;
  }
  uint64_t v82 = v134 + ((*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80));
  uint64_t v156 = (uint64_t *)(v158 + 64);
  uint64_t v83 = v159 + 64;
  uint64_t v84 = (void (**)(uint64_t, uint64_t, uint64_t))(v145 + 16);
  uint64_t v85 = (void (**)(uint64_t, uint64_t))(v145 + 8);
  uint64_t v86 = *(void *)(v135 + 72);
  swift_bridgeObjectRetain();
  uint64_t v87 = (uint64_t)v140;
  uint64_t v88 = (uint64_t)v153;
  while (2)
  {
    sub_217960D70(v82, (uint64_t)v30);
    sub_217960D70((uint64_t)v30, v88);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v89 = v88;
      uint64_t v90 = v159;
      sub_21797BFE8(v89, v159, type metadata accessor for RecognizedItem.Barcode);
      (*v84)(v87, v90, v160);
      uint64_t v91 = type metadata accessor for RecognizedItem.Barcode;
    }
    else
    {
      uint64_t v92 = v88;
      uint64_t v90 = v158;
      sub_21797BFE8(v92, v158, type metadata accessor for RecognizedItem.Text);
      (*v84)(v87, v90, v160);
      uint64_t v91 = type metadata accessor for RecognizedItem.Text;
    }
    sub_217960E3C(v90, v91);
    uint64_t v93 = *v37;
    if (!*v37) {
      goto LABEL_65;
    }
    if (!*(void *)(v93 + 16))
    {
LABEL_27:
      (*v85)(v87, v160);
      goto LABEL_28;
    }
    swift_bridgeObjectRetain();
    unint64_t v94 = sub_2179780D8(v87);
    if ((v95 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    id v96 = *(id *)(*(void *)(v93 + 56) + 8 * v94);
    swift_bridgeObjectRelease();
    (*v85)(v87, v160);
    uint64_t v97 = v137;
    sub_217960D70((uint64_t)v157, v137);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v98 = v159;
      sub_21797BFE8(v97, v159, type metadata accessor for RecognizedItem.Barcode);
      id v99 = *(id *)(v83 + *(int *)(v144 + 20));
      uint64_t v100 = type metadata accessor for RecognizedItem.Barcode;
    }
    else
    {
      uint64_t v98 = v158;
      sub_21797BFE8(v97, v158, type metadata accessor for RecognizedItem.Text);
      id v99 = *(id *)((char *)v156 + *(int *)(v143 + 20));
      uint64_t v100 = type metadata accessor for RecognizedItem.Text;
    }
    sub_217960E3C(v98, v100);
    objc_msgSend(v96, sel_animateToQuad_, v99);

    uint64_t v87 = (uint64_t)v140;
LABEL_28:
    uint64_t v30 = v157;
    sub_217960E3C((uint64_t)v157, type metadata accessor for RecognizedItem);
    v82 += v86;
    --v81;
    uint64_t v88 = (uint64_t)v153;
    if (v81) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = v160;
LABEL_40:
  uint64_t result = v133;
  uint64_t v101 = *(void *)(v133 + 16);
  uint64_t v102 = (uint64_t)v138;
  if (v101)
  {
    uint64_t v103 = v133 + ((*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80));
    unint64_t v104 = (void (**)(uint64_t, uint64_t, uint64_t))(v145 + 16);
    uint64_t v105 = (void (**)(uint64_t, uint64_t))(v145 + 8);
    uint64_t v157 = *(char **)(v135 + 72);
    swift_bridgeObjectRetain();
    uint64_t v106 = (uint64_t)v139;
    uint64_t v107 = v154;
    while (1)
    {
      sub_217960D70(v103, v107);
      sub_217960D70(v107, v102);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v108 = v159;
        sub_21797BFE8(v102, v159, type metadata accessor for RecognizedItem.Barcode);
        double v109 = *v104;
        (*v104)(v106, v108, v6);
        double v110 = type metadata accessor for RecognizedItem.Barcode;
      }
      else
      {
        uint64_t v108 = v158;
        sub_21797BFE8(v102, v158, type metadata accessor for RecognizedItem.Text);
        double v109 = *v104;
        (*v104)(v106, v108, v6);
        double v110 = type metadata accessor for RecognizedItem.Text;
      }
      sub_217960E3C(v108, v110);
      uint64_t v111 = *v37;
      if (!*v37) {
        goto LABEL_66;
      }
      if (*(void *)(v111 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v112 = sub_2179780D8(v106);
        if (v113)
        {
          id v114 = v37;
          uint64_t v115 = (char *)*(id *)(*(void *)(v111 + 56) + 8 * v112);
          swift_bridgeObjectRelease();
          uint64_t v116 = v6;
          uint64_t v117 = v6;
          double v118 = *v105;
          (*v105)(v106, v117);
          uint64_t v156 = (uint64_t *)v115;
          objc_msgSend(v115, sel_removeFromSuperview);
          uint64_t v119 = v136;
          sub_217960D70(v154, v136);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v120 = v119;
            uint64_t v121 = v159;
            sub_21797BFE8(v120, v159, type metadata accessor for RecognizedItem.Barcode);
            v109(v146, v121, v116);
            unint64_t v122 = type metadata accessor for RecognizedItem.Barcode;
          }
          else
          {
            uint64_t v123 = v119;
            uint64_t v121 = v158;
            sub_21797BFE8(v123, v158, type metadata accessor for RecognizedItem.Text);
            v109(v146, v121, v116);
            unint64_t v122 = type metadata accessor for RecognizedItem.Text;
          }
          sub_217960E3C(v121, v122);
          uint64_t v37 = v114;
          swift_beginAccess();
          if (!*v114) {
            goto LABEL_69;
          }
          unint64_t v124 = v118;
          swift_bridgeObjectRetain();
          unint64_t v125 = sub_2179780D8(v146);
          char v127 = v126;
          swift_bridgeObjectRelease();
          if (v127)
          {
            int v128 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v129 = *v37;
            uint64_t v162 = (void *)*v37;
            *uint64_t v37 = 0x8000000000000000;
            if (!v128)
            {
              sub_217978A4C();
              uint64_t v129 = (uint64_t)v162;
            }
            uint64_t v6 = v160;
            v124(*(void *)(v129 + 48) + *(void *)(v145 + 72) * v125, v160);
            uint64_t v130 = (uint64_t)v162;
            uint64_t v131 = *(void **)(v162[7] + 8 * v125);
            sub_217978754(v125, (uint64_t)v162);
            *uint64_t v37 = v130;
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v131 = 0;
            uint64_t v6 = v160;
          }
          v124(v146, v6);
          swift_endAccess();

          uint64_t v106 = (uint64_t)v139;
          uint64_t v102 = (uint64_t)v138;
          goto LABEL_44;
        }
        swift_bridgeObjectRelease();
      }
      (*v105)(v106, v6);
LABEL_44:
      uint64_t v107 = v154;
      sub_217960E3C(v154, type metadata accessor for RecognizedItem);
      v103 += (uint64_t)v157;
      if (!--v101) {
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

void sub_2179757CC()
{
  id v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_previewView);
  objc_msgSend(v0, sel_setView_, v1);

  uint64_t v2 = (id *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView];
  swift_beginAccess();
  id v3 = *v2;
  id v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  objc_msgSend(v4, sel_bounds);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  objc_msgSend(*v2, sel_setAutoresizingMask_, 18);
  id v14 = objc_msgSend(v0, sel_view);
  if (!v14)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v15 = v14;
  objc_msgSend(v14, sel_addSubview_, *v2);

  uint64_t v16 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView];
  id v17 = objc_msgSend(v0, sel_view);
  if (!v17)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v18 = v17;
  objc_msgSend(v17, sel_bounds);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  objc_msgSend(v16, sel_setFrame_, v20, v22, v24, v26);
  objc_msgSend(v16, sel_setAutoresizingMask_, 18);
  id v27 = objc_msgSend(v0, sel_view);
  if (!v27)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v28 = v27;
  objc_msgSend(v27, sel_addSubview_, v16);

  if (v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isGuidanceEnabled] == 1)
  {
    id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84848]), sel_init);
    uint64_t v30 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView;
    uint64_t v31 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView];
    *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView] = v29;

    uint64_t v32 = *(void **)&v0[v30];
    if (v32)
    {
      id v33 = v32;
      objc_msgSend(v33, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      id v34 = objc_msgSend(v0, sel_view);
      if (v34)
      {
        uint64_t v35 = v34;
        objc_msgSend(v34, sel_addSubview_, v33);

        goto LABEL_9;
      }
LABEL_18:
      __break(1u);
      return;
    }
  }
LABEL_9:
  if (v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_isHighlightingEnabled] == 1)
  {
    if (v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] == 1)
    {
      uint64_t v36 = &v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID];
      swift_beginAccess();
      *(void *)uint64_t v36 = MEMORY[0x263F8EE80];
      swift_bridgeObjectRelease();
    }
    else
    {
      objc_msgSend(*v2, sel_bounds);
      id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84850]), sel_initWithFrame_, v37, v38, v39, v40);
      objc_msgSend(v41, sel_setAutoresizingMask_, 18);
      objc_msgSend(*v2, sel_addSubview_, v41);
      objc_msgSend(v41, sel_setSpotlightBlurRadius_, 20.0);
      objc_msgSend(v41, sel_setInvertedShadowAlpha_, 0.25);
      uint64_t v42 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView];
      *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView] = v41;
    }
  }
}

void sub_217975BB8()
{
  id v1 = v0;
  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for DataScannerViewController();
  objc_msgSendSuper2(&v23, sel_viewDidLoad);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView];
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4818);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_21797DC60;
    id v4 = v2;
    id v5 = objc_msgSend(v4, sel_widthAnchor);
    id v6 = objc_msgSend(v1, sel_view);
    if (v6)
    {
      double v7 = v6;
      id v8 = objc_msgSend(v6, sel_widthAnchor);

      id v9 = objc_msgSend(v5, sel_constraintLessThanOrEqualToAnchor_multiplier_, v8, 0.666666667);
      *(void *)(v3 + 32) = v9;
      id v10 = objc_msgSend(v4, sel_centerXAnchor);
      id v11 = objc_msgSend(v1, sel_view);
      if (v11)
      {
        double v12 = v11;
        id v13 = objc_msgSend(v11, sel_centerXAnchor);

        id v14 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v13);
        *(void *)(v3 + 40) = v14;
        id v15 = objc_msgSend(v4, sel_topAnchor);
        id v16 = objc_msgSend(v1, sel_view);
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = self;
          id v19 = objc_msgSend(v17, sel_safeAreaLayoutGuide);

          id v20 = objc_msgSend(v19, sel_topAnchor);
          id v21 = objc_msgSend(v15, sel_constraintEqualToAnchor_constant_, v20, 20.0);

          *(void *)(v3 + 48) = v21;
          sub_21797C7A8();
          sub_21796860C(0, (unint64_t *)&unk_267BA4820);
          double v22 = (void *)sub_21797C788();
          swift_bridgeObjectRelease();
          objc_msgSend(v18, sel_activateConstraints_, v22);

          return;
        }
LABEL_9:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
}

id sub_217975EB8(char a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for DataScannerViewController();
  objc_msgSendSuper2(&v10, sel_viewWillAppear_, a1 & 1);
  uint64_t v3 = self;
  if (objc_msgSend(v3, sel_isCameraRestricted))
  {
    id v4 = &v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
    swift_beginAccess();
    id result = (id)MEMORY[0x21D450800](v4);
    if (!result) {
      return result;
    }
    uint64_t v6 = *((void *)v4 + 1);
    uint64_t ObjectType = swift_getObjectType();
    char v9 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, sel_isSupported)) {
    return objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_startRunning);
  }
  id v8 = &v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
  swift_beginAccess();
  id result = (id)MEMORY[0x21D450800](v8);
  if (result)
  {
    uint64_t v6 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    char v9 = 0;
LABEL_8:
    (*(void (**)(char *, char *, uint64_t, uint64_t))(v6 + 48))(v1, &v9, ObjectType, v6);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_21797605C(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DataScannerViewController();
  objc_msgSendSuper2(&v5, sel_viewDidDisappear_, a1 & 1);
  sub_21797777C();
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_stopRunning);
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView], sel_hideGuidance);
  uint64_t v3 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer], sel_invalidate);
  id v4 = *(void **)&v1[v3];
  *(void *)&v1[v3] = 0;
}

id sub_21797614C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataScannerViewController();
  objc_msgSendSuper2(&v2, sel_removeFromParentViewController);
  sub_21797777C();
  return objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_stopRunning);
}

void sub_21797620C()
{
  uint64_t v1 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer;
  if (!*(void *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer))
  {
    if (*(void *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView))
    {
      objc_super v2 = self;
      uint64_t v3 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v7[4] = sub_21797C42C;
      v7[5] = v3;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 1107296256;
      v7[2] = sub_2179703B0;
      v7[3] = &block_descriptor_204;
      id v4 = _Block_copy(v7);
      swift_release();
      id v5 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v4, 3.0);
      _Block_release(v4);
      uint64_t v6 = *(void **)(v0 + v1);
      *(void *)(v0 + v1) = v5;
    }
  }
}

uint64_t sub_217976334(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_21797C6C8();
  uint64_t v15 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21797C6E8();
  uint64_t v6 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21796860C(0, &qword_267BA4978);
  char v9 = (void *)sub_21797C8C8();
  uint64_t v10 = swift_allocObject();
  swift_beginAccess();
  id v11 = (void *)MEMORY[0x21D450800](a2 + 16);
  swift_unknownObjectWeakInit();

  aBlock[4] = sub_21797C434;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21796BA2C;
  aBlock[3] = &block_descriptor_208;
  double v12 = _Block_copy(aBlock);
  swift_retain();
  sub_21797C6D8();
  uint64_t v16 = MEMORY[0x263F8EE78];
  sub_21797BFA0(&qword_267BA4980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4988);
  sub_21797C16C(&qword_267BA4990, &qword_267BA4988);
  sub_21797C948();
  MEMORY[0x21D450010](0, v8, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  swift_release();
  return swift_release();
}

void sub_21797665C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21D450800](v1);
  if (v2)
  {
    uint64_t v3 = (char *)v2;
    sub_21796860C(0, &qword_267BA49B8);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_21797C5B8();
    swift_bridgeObjectRelease();

    uint64_t v6 = *(void **)&v3[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView];
    if (v6)
    {
      id v7 = v6;
      id v8 = (void *)sub_21797C728();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_showGuidanceWithText_, v8, 0x8000000217980D30);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    char v9 = *(void **)&v3[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer];
    *(void *)&v3[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer] = 0;
  }
}

void sub_217976838(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_2179768A0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v63 = type metadata accessor for RecognizedItem.Barcode(0);
  MEMORY[0x270FA5388](v63);
  id v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = type metadata accessor for RecognizedItem.Text(0);
  MEMORY[0x270FA5388](v62);
  id v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RecognizedItem(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  double v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v57 - v13;
  id v15 = objc_msgSend(v2, sel_view);
  objc_msgSend(a1, sel_locationInView_, v15);
  double v17 = v16;
  double v19 = v18;

  id v20 = v2;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider], sel_setInterestPoint_, v17, v19);
  uint64_t v21 = *(void *)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems];
  uint64_t v22 = *(void *)(v21 + 16);
  if (v22)
  {
    uint64_t v57 = *(void *)&v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems];
    id v58 = v2;
    objc_super v23 = &v2[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate];
    uint64_t v24 = v21 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    swift_bridgeObjectRetain();
    swift_beginAccess();
    uint64_t v25 = (uint64_t)v5;
    uint64_t v26 = *(void *)(v9 + 72);
    uint64_t v60 = v7 + 64;
    uint64_t v61 = v25;
    uint64_t v59 = v25 + 64;
    do
    {
      sub_217960D70(v24, (uint64_t)v14);
      sub_217960D70((uint64_t)v14, (uint64_t)v12);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v27 = v61;
        sub_21797BFE8((uint64_t)v12, v61, type metadata accessor for RecognizedItem.Barcode);
        id v28 = *(id *)(v59 + *(int *)(v63 + 20));
        id v29 = type metadata accessor for RecognizedItem.Barcode;
        uint64_t v30 = v27;
      }
      else
      {
        sub_21797BFE8((uint64_t)v12, (uint64_t)v7, type metadata accessor for RecognizedItem.Text);
        id v28 = *(id *)&v60[*(int *)(v62 + 20)];
        id v29 = type metadata accessor for RecognizedItem.Text;
        uint64_t v30 = (uint64_t)v7;
      }
      sub_217960E3C(v30, v29);
      unsigned int v31 = objc_msgSend(v28, sel_containsPoint_, v17, v19);

      if (v31 && MEMORY[0x21D450800](v23))
      {
        uint64_t v32 = *((void *)v23 + 1);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(char *, char *, uint64_t, uint64_t))(v32 + 16))(v58, v14, ObjectType, v32);
        swift_unknownObjectRelease();
      }
      sub_217960E3C((uint64_t)v14, type metadata accessor for RecognizedItem);
      v24 += v26;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease();
    id v20 = v58;
  }
  if ((v20[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizesMultipleItems] & 1) == 0)
  {
    id v34 = objc_msgSend(v20, sel_view);
    if (v34)
    {
      uint64_t v35 = v34;
      objc_msgSend(v34, sel_bounds);
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;

      uint64_t v44 = MEMORY[0x21D450200](v17, v19, v37, v39, v41, v43);
      double v45 = MEMORY[0x21D450210](v44);
      double v47 = v46;
      double v48 = *(void **)&v20[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor];
      if (v48)
      {
        id v49 = v48;
        id v50 = objc_msgSend(v49, sel_configuration);
        objc_msgSend(v50, sel_setComparisonPoint_, v45, v47);
        objc_msgSend(v49, sel_setConfiguration_, v50);
      }
      double v51 = *(void **)&v20[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor];
      if (v51)
      {
        id v52 = v51;
        id v53 = objc_msgSend(v52, sel_configuration);
        objc_msgSend(v53, sel_setComparisonPoint_, v45, v47);
        objc_msgSend(v52, sel_setConfiguration_, v53);
      }
      double v54 = *(void **)&v20[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor];
      if (v54)
      {
        id v55 = v54;
        id v56 = objc_msgSend(v55, sel_configuration);
        objc_msgSend(v56, sel_setComparisonPoint_, v45, v47);
        objc_msgSend(v55, sel_setConfiguration_, v56);
      }
    }
    else
    {
      __break(1u);
    }
  }
}

id sub_217976E70(void *a1)
{
  id result = objc_msgSend(a1, sel_state);
  if (result == (id)2)
  {
    double v5 = *(double *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom);
    objc_msgSend(a1, sel_scale);
    uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
    double v8 = v5 * v7;
    return objc_msgSend(v6, sel_setZoomFactor_, v8);
  }
  else if (result == (id)1)
  {
    id result = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_zoomFactor);
    *(void *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom) = v4;
  }
  return result;
}

uint64_t sub_217976F94()
{
  v1[3] = v0;
  v1[4] = sub_21797C818();
  v1[5] = sub_21797C808();
  uint64_t v3 = sub_21797C7D8();
  v1[6] = v3;
  v1[7] = v2;
  return MEMORY[0x270FA2498](sub_217977030, v3, v2);
}

uint64_t sub_217977030()
{
  if (qword_267BA4390 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21797C6B8();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BA46B0);
  uint64_t v2 = sub_21797C698();
  os_log_type_t v3 = sub_21797C8B8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21795E000, v2, v3, "Starting capturePhoto()", v4, 2u);
    MEMORY[0x21D450750](v4, -1, -1);
  }
  uint64_t v5 = v0[3];

  objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_capturePhoto);
  uint64_t v6 = sub_21797C808();
  v0[8] = v6;
  uint64_t v7 = swift_task_alloc();
  v0[9] = v7;
  *(void *)(v7 + 16) = v5;
  double v8 = (void *)swift_task_alloc();
  v0[10] = v8;
  uint64_t v9 = sub_21796860C(0, &qword_267BA4830);
  *double v8 = v0;
  v8[1] = sub_21797722C;
  uint64_t v10 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2360](v0 + 2, v6, v10, 0x5065727574706163, 0xEE0029286F746F68, sub_21797A1A8, v7, v9);
}

uint64_t sub_21797722C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_2179773B8;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_217977350;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_217977350()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2179773B8()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_217977430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49A8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267BA4390 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21797C6B8();
  __swift_project_value_buffer(v8, (uint64_t)qword_267BA46B0);
  uint64_t v9 = sub_21797C698();
  os_log_type_t v10 = sub_21797C8B8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21795E000, v9, v10, "Appending continuation for capturePhoto()", v11, 2u);
    MEMORY[0x21D450750](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v12 = (unint64_t *)(a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions);
  swift_beginAccess();
  unint64_t v13 = *v12;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v12 = v13;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v13 = sub_217977A54(0, *(void *)(v13 + 16) + 1, 1, v13, &qword_267BA49B0, &qword_267BA49A8);
    *uint64_t v12 = v13;
  }
  unint64_t v16 = *(void *)(v13 + 16);
  unint64_t v15 = *(void *)(v13 + 24);
  if (v16 >= v15 >> 1)
  {
    unint64_t v13 = sub_217977A54(v15 > 1, v16 + 1, 1, v13, &qword_267BA49B0, &qword_267BA49A8);
    *uint64_t v12 = v13;
  }
  *(void *)(v13 + 16) = v16 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v13+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v16, v7, v4);
  return swift_endAccess();
}

void sub_2179776AC()
{
  uint64_t v1 = self;
  if (!objc_msgSend(v1, sel_isSupported))
  {
    char v2 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v1, sel_isCameraRestricted))
  {
    char v2 = 1;
LABEL_5:
    sub_21797A1B0();
    swift_allocError();
    *uint64_t v3 = v2;
    swift_willThrow();
    return;
  }
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider);
  if ((objc_msgSend(v4, sel_isProcessing) & 1) == 0)
  {
    objc_msgSend(v4, sel_startProcessing);
    sub_21797620C();
  }
}

uint64_t sub_21797777C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4840);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_stopProcessing);
  uint64_t v5 = (uint64_t *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v7 = *(void *)(*v5 + 16);
  if (v7)
  {
    uint64_t v14 = v5;
    os_log_type_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v8 = v2 + 16;
    uint64_t v9 = v10;
    uint64_t v11 = v6 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v12 = *(void *)(v8 + 56);
    swift_bridgeObjectRetain();
    do
    {
      v9(v4, v11, v1);
      sub_21797C838();
      (*(void (**)(char *, uint64_t))(v8 - 8))(v4, v1);
      v11 += v12;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    uint64_t v5 = v14;
  }
  uint64_t *v5 = MEMORY[0x263F8EE78];
  return swift_bridgeObjectRelease();
}

id sub_217977914()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_startRunning);
}

id sub_21797792C()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_stopRunning);
}

void *sub_217977944(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4A38);
      os_log_type_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      os_log_type_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_217978DBC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_217977A54(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v10 = a2;
      }
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    unint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (BOOL v18 = v14 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_29:
    uint64_t result = sub_21797C998();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v16 + v20;
  if (a1)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(void *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_217979C64(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_217977CC0(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA45B0);
  uint64_t v10 = *(void *)(type metadata accessor for RecognizedItem(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_21797C998();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for RecognizedItem(0) - 8);
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
    sub_21797C2D4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_217977F28(uint64_t a1)
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
  unint64_t v3 = sub_217977CC0(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for RecognizedItem(0) - 8);
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
  uint64_t result = sub_21797C9E8();
  __break(1u);
  return result;
}

unint64_t sub_2179780D8(uint64_t a1)
{
  sub_21797C608();
  sub_21797BFA0(&qword_267BA4398, MEMORY[0x263F07508]);
  uint64_t v2 = sub_21797C6F8();

  return sub_217978170(a1, v2);
}

unint64_t sub_217978170(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_21797C608();
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
    unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_21797BFA0(&qword_267BA49D0, MEMORY[0x263F07508]);
      char v15 = sub_21797C718();
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

uint64_t sub_217978330(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = sub_21797C608();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA49C0);
  int v46 = a2;
  uint64_t v10 = sub_21797C9D8();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  double v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  double v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  double v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_21797BFA0(&qword_267BA4398, MEMORY[0x263F07508]);
    uint64_t result = sub_21797C6F8();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  unint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v12;
  return result;
}

unint64_t sub_217978754(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21797C608();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_21797C958();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      unint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_21797BFA0(&qword_267BA4398, MEMORY[0x263F07508]);
        uint64_t v17 = sub_21797C6F8();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            unint64_t v23 = (void *)(v22 + 8 * a1);
            int64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *unint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *uint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_217978A4C()
{
  uint64_t v1 = sub_21797C608();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BA49C0);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_21797C9C8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    unint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_217978CE4@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (result < 0 || 1 << *(unsigned char *)(a3 + 32) <= result)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(void *)(a3 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(a3 + 36) != a2)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v4 = *(void *)(a3 + 48) + 32 * result;
  uint64_t v5 = *(void *)(v4 + 8);
  char v6 = *(unsigned char *)(v4 + 16);
  uint64_t v7 = *(void *)(v4 + 24);
  *(unsigned char *)a4 = *(unsigned char *)v4;
  *(void *)(a4 + 8) = v5;
  *(unsigned char *)(a4 + 16) = v6;
  *(void *)(a4 + 24) = v7;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_217978D84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

char *sub_217978DBC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21797C9E8();
  __break(1u);
  return result;
}

uint64_t sub_217978EA8(unint64_t a1)
{
  unint64_t v2 = a1;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView);
  if (v3)
  {
    if (a1 - 2 < 2 || a1 > 1)
    {
      objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView), sel_hideGuidance);
    }
    else
    {
      sub_21796860C(0, &qword_267BA49B8);
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v5 = self;
      id v6 = v3;
      id v7 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
      sub_21797C5B8();

      uint64_t v8 = (void *)sub_21797C728();
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_showGuidanceWithText_, v8, 0x8000000217980CB0);
    }
  }
  uint64_t v9 = v1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x21D450800](v9);
  if (result)
  {
    uint64_t v11 = *(void *)(v9 + 8);
    if (v2 >= 4) {
      LOBYTE(v2) = 0;
    }
    uint64_t ObjectType = swift_getObjectType();
    char v13 = v2;
    (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(v11 + 16))(v1, &v13, ObjectType, v11);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21797908C(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_217977A54(isUniquelyReferenced_nonNull_native, v11, 1, v4, &qword_267BA49B0, &qword_267BA49A8);
  }
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BA49A8) - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      unint64_t *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_21797C9E8();
  __break(1u);
  return result;
}

void sub_217979288(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v60 = ((char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA49A8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = ((char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_267BA4390 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_21797C6B8();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_267BA46B0);
  id v14 = a1;
  id v15 = a2;
  unint64_t v16 = (uint8_t *)v14;
  id v17 = a2;
  unint64_t v61 = v13;
  uint64_t v18 = sub_21797C698();
  os_log_type_t v19 = sub_21797C8B8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v55 = v3;
    os_log_t v57 = v11;
    id v58 = (void (*)(NSObject *, unint64_t, uint64_t))v8;
    uint64_t v59 = v9;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 138412546;
    uint64_t v63 = (uint64_t)v16;
    BOOL v22 = v16;
    sub_21797C908();
    id v56 = v16;
    *uint64_t v21 = v16;

    *(_WORD *)(v20 + 12) = 2112;
    if (a2)
    {
      id v23 = a2;
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v63 = v24;
      sub_21797C908();
    }
    else
    {
      uint64_t v63 = 0;
      sub_21797C908();
      uint64_t v24 = 0;
    }
    v21[1] = v24;

    _os_log_impl(&dword_21795E000, v18, v19, "Received callback for capturePhoto() with image:%@ error:%@", (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4998);
    swift_arrayDestroy();
    MEMORY[0x21D450750](v21, -1, -1);
    MEMORY[0x21D450750](v20, -1, -1);

    uint64_t v8 = (uint64_t)v58;
    uint64_t v9 = v59;
    unint64_t v16 = v56;
    int64_t v11 = v57;
    uint64_t v3 = v55;
  }
  else
  {
  }
  uint64_t v25 = v3 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions;
  swift_beginAccess();
  if (*(void *)(*(void *)v25 + 16))
  {
    uint64_t v26 = *(void (**)(NSObject *, unint64_t, uint64_t))(v9 + 16);
    unint64_t v27 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v26(v11, *(void *)v25 + v27, v8);
    if (a2)
    {
      id v58 = v26;
      id v28 = a2;
      id v29 = a2;
      id v30 = a2;
      unint64_t v31 = sub_21797C698();
      os_log_type_t v32 = sub_21797C8A8();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        uint64_t v59 = v9;
        uint64_t v34 = (uint8_t *)v33;
        uint64_t v35 = swift_slowAlloc();
        os_log_t v57 = v31;
        BOOL v36 = (void *)v35;
        unint64_t v61 = v27;
        *(_DWORD *)uint64_t v34 = 138412290;
        id v56 = v34 + 4;
        id v37 = a2;
        uint64_t v38 = v11;
        uint64_t v39 = v8;
        uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v62 = v40;
        unint64_t v27 = v61;
        sub_21797C908();
        *BOOL v36 = v40;
        uint64_t v8 = v39;
        int64_t v11 = v38;

        _os_log_impl(&dword_21795E000, v57, v32, "capturePhoto() error %@", v34, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4998);
        int64_t v41 = v36;
        unint64_t v31 = v57;
        swift_arrayDestroy();
        MEMORY[0x21D450750](v41, -1, -1);
        double v42 = v34;
        uint64_t v9 = v59;
        MEMORY[0x21D450750](v42, -1, -1);
      }
      else
      {
      }
      uint64_t v62 = (uint64_t)a2;
      sub_21797C7E8();
      uint64_t v26 = v58;
    }
    else
    {
      int v46 = v16;
      double v47 = sub_21797C698();
      os_log_type_t v48 = sub_21797C8B8();
      if (os_log_type_enabled(v47, v48))
      {
        id v49 = (uint8_t *)swift_slowAlloc();
        unint64_t v61 = v27;
        id v50 = v49;
        *(_WORD *)id v49 = 0;
        _os_log_impl(&dword_21795E000, v47, v48, "capturePhoto() success. Calling continuation.", v49, 2u);
        double v51 = v50;
        unint64_t v27 = v61;
        MEMORY[0x21D450750](v51, -1, -1);
      }

      uint64_t v62 = (uint64_t)v46;
      id v52 = v46;
      sub_21797C7F8();
    }
    swift_beginAccess();
    if (*(void *)(*(void *)v25 + 16))
    {
      unint64_t v53 = *(void *)v25 + v27;
      uint64_t v54 = (uint64_t)v60;
      v26(v60, v53, v8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v54, 0, 1, v8);
      sub_21797C214(v54, &qword_267BA49A0);
      if (*(void *)(*(void *)v25 + 16))
      {
        sub_21797908C(0, 1);
        swift_endAccess();
        (*(void (**)(NSObject *, uint64_t))(v9 + 8))(v11, v8);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  double v43 = sub_21797C698();
  os_log_type_t v44 = sub_21797C8A8();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v45 = 0;
    _os_log_impl(&dword_21795E000, v43, v44, "Unexpected error. Missing continuation for capturePhoto()", v45, 2u);
    MEMORY[0x21D450750](v45, -1, -1);
  }
}

uint64_t sub_217979968()
{
  uint64_t v0 = sub_21797C6C8();
  uint64_t v12 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_21797C6E8();
  uint64_t v3 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  int64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21796860C(0, &qword_267BA4978);
  uint64_t v6 = (void *)sub_21797C8C8();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_21797BF98;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21796BA2C;
  aBlock[3] = &block_descriptor_186;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  sub_21797C6D8();
  uint64_t v13 = MEMORY[0x263F8EE78];
  sub_21797BFA0(&qword_267BA4980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BA4988);
  sub_21797C16C(&qword_267BA4990, &qword_267BA4988);
  sub_21797C948();
  MEMORY[0x21D450010](0, v5, v2, v8);
  _Block_release(v8);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v11);
  swift_release();
  return swift_release();
}

uint64_t sub_217979C64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
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
  uint64_t result = sub_21797C9E8();
  __break(1u);
  return result;
}

void sub_217979DBC()
{
  v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_shouldResumeProcessingOnEnterForeground] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_internalDataType] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_cantFindItemsTimer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_pinchGestureRecognizer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_tapGestureRecognizer] = 0;
  v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidBeginPinchToZoom] = 0;
  v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_respondsToDidEndPinchToZoom] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textProcessor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeProcessor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_homographyProcessor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_optFlowTextProcessor] = 0;
  uint64_t v1 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_hitTestView;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_impl;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DataScannerViewController.Impl()), sel_init);
  uint64_t v3 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_bridge;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84818]), sel_init);
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_textItems] = MEMORY[0x263F8EE78];
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_barcodeItems] = v4;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_currentRecognizedItems] = v4;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_reticleView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_highlightViewForItemUUID] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_guidanceView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_capturePhotoCompletions] = v4;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_recognizedItemsContinuations] = v4;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_initialPinchZoom] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView;
  *(void *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v6 = &v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 1;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v7 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval;
  uint64_t v8 = self;
  objc_msgSend(v8, sel_defaultProcessingInterval);
  *(void *)&v0[v7] = v9;
  uint64_t v10 = OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval;
  objc_msgSend(v8, sel_defaultInfrequentProcessingInterval);
  *(void *)&v0[v10] = v11;
  *(void *)&v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords] = v4;
  v0[OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection] = 1;

  sub_21797C9A8();
  __break(1u);
}

uint64_t type metadata accessor for DataScannerViewController.Impl()
{
  return self;
}

uint64_t type metadata accessor for DataScannerViewController()
{
  return self;
}

id sub_21797A08C(char *a1, char a2, char a3, char a4)
{
  uint64_t v7 = *a1;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84830]), sel_init);
  objc_msgSend(v8, sel_setResolutionPreset_, qword_21797E220[v7]);
  objc_msgSend(v8, sel_setFrameRatePreset_, 1);
  if ((a2 & 1) != 0 || (a3 & 1) == 0)
  {
    if (a2) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    objc_msgSend(v8, sel_setCameraPreset_, v9);
  }
  objc_msgSend(v8, sel_setPreferBinning_, a4 & 1);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F847C0]), sel_initWithConfiguration_, v8);

  return v10;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_21797A1A8(uint64_t a1)
{
  return sub_217977430(a1, *(void *)(v1 + 16));
}

unint64_t sub_21797A1B0()
{
  unint64_t result = qword_267BA4838;
  if (!qword_267BA4838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4838);
  }
  return result;
}

unint64_t sub_21797A208()
{
  unint64_t result = qword_267BA4848;
  if (!qword_267BA4848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4848);
  }
  return result;
}

unint64_t sub_21797A260()
{
  unint64_t result = qword_267BA4850;
  if (!qword_267BA4850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4850);
  }
  return result;
}

unint64_t sub_21797A2B8()
{
  unint64_t result = qword_267BA4858;
  if (!qword_267BA4858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4858);
  }
  return result;
}

unint64_t sub_21797A310()
{
  unint64_t result = qword_267BA4860;
  if (!qword_267BA4860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4860);
  }
  return result;
}

unint64_t sub_21797A368()
{
  unint64_t result = qword_267BA4868;
  if (!qword_267BA4868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4868);
  }
  return result;
}

uint64_t sub_21797A3BC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate, a2);
}

uint64_t sub_21797A3C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_delegate);
}

id sub_21797A3D4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_overlayContainerView);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

__n128 sub_21797A43C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_regionOfInterest;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 32);
  __n128 result = *(__n128 *)v3;
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v4;
  return result;
}

id sub_21797A49C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_zoomFactor);
  *a2 = v4;
  return result;
}

id sub_21797A4DC(double *a1, void *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setZoomFactor_, *a1);
}

uint64_t sub_21797A500@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate, a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1 + *a2;
  swift_beginAccess();
  uint64_t result = MEMORY[0x21D450800](v4);
  uint64_t v6 = *(void *)(v4 + 8);
  *a3 = result;
  a3[1] = v6;
  return result;
}

uint64_t sub_21797A564(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_privateDelegate);
}

uint64_t keypath_setTm(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *a2 + *a5;
  swift_beginAccess();
  *(void *)(v6 + 8) = v5;
  return swift_unknownObjectWeakAssign();
}

double sub_21797A5D0@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_14Tm(a1, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_processingInterval, a2);
}

id sub_21797A5DC(double *a1)
{
  return sub_21796DF60(*a1);
}

double sub_21797A604@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_14Tm(a1, &OBJC_IVAR____TtC9VisionKit25DataScannerViewController_infrequentProcessingInterval, a2);
}

double keypath_get_14Tm@<D0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  double result = *v4;
  *a3 = *(void *)v4;
  return result;
}

id sub_21797A660(double *a1)
{
  return sub_21796E048(*a1);
}

id sub_21797A688@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_isTorchOn);
  *a2 = (_BYTE)result;
  return result;
}

id sub_21797A6C8(unsigned __int8 *a1, void *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_frameProvider), sel_setTorchOn_, *a1);
}

uint64_t sub_21797A6EC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_customWords);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21797A748@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC9VisionKit25DataScannerViewController_usesLanguageDetection);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_21797A79C(unsigned __int8 *a1)
{
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScannerDidZoom(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:didTapOn:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:didAdd:allItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:didUpdate:allItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:didRemove:allItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of DataScannerViewControllerDelegate.dataScanner(_:becameUnavailableWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of DataScannerViewControllerPrivateDelegate.dataScannerDidFinishPreparation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DataScannerViewControllerPrivateDelegate.dataScannerDidUpdateSceneStabilityState(_:newState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DataScannerViewControllerPrivateDelegate.dataScannerDidUpdateSceneLuminosity(_:newLuminosity:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t method lookup function for DataScannerViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DataScannerViewController);
}

uint64_t dispatch thunk of static DataScannerViewController.isSupported.getter()
{
  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t dispatch thunk of static DataScannerViewController.isAvailable.getter()
{
  return (*(uint64_t (**)(void))(v0 + 448))();
}

uint64_t dispatch thunk of static DataScannerViewController.supportedTextRecognitionLanguages.getter()
{
  return (*(uint64_t (**)(void))(v0 + 456))();
}

uint64_t dispatch thunk of DataScannerViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of DataScannerViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of DataScannerViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of DataScannerViewController.overlayContainerView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of DataScannerViewController.regionOfInterest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of DataScannerViewController.regionOfInterest.setter(uint64_t a1)
{
  char v2 = *(unsigned char *)(a1 + 32);
  uint64_t v3 = *(uint64_t (**)(_OWORD *))((*MEMORY[0x263F8EED0] & *v1) + 0x3B8);
  long long v4 = *(_OWORD *)(a1 + 16);
  v6[0] = *(_OWORD *)a1;
  v6[1] = v4;
  char v7 = v2;
  return v3(v6);
}

uint64_t dispatch thunk of DataScannerViewController.regionOfInterest.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of DataScannerViewController.isScanning.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of DataScannerViewController.recognizedItems.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of DataScannerViewController.minZoomFactor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3D8))();
}

uint64_t dispatch thunk of DataScannerViewController.maxZoomFactor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3E0))();
}

uint64_t dispatch thunk of DataScannerViewController.zoomFactor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3E8))();
}

uint64_t dispatch thunk of DataScannerViewController.zoomFactor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of DataScannerViewController.zoomFactor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of DataScannerViewController.privateDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of DataScannerViewController.privateDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of DataScannerViewController.privateDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of DataScannerViewController.processingInterval.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x418))();
}

uint64_t dispatch thunk of DataScannerViewController.processingInterval.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x420))();
}

uint64_t dispatch thunk of DataScannerViewController.processingInterval.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x428))();
}

uint64_t dispatch thunk of DataScannerViewController.infrequentProcessingInterval.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x430))();
}

uint64_t dispatch thunk of DataScannerViewController.infrequentProcessingInterval.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x438))();
}

uint64_t dispatch thunk of DataScannerViewController.infrequentProcessingInterval.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x440))();
}

uint64_t dispatch thunk of DataScannerViewController.hasTorch.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x448))();
}

uint64_t dispatch thunk of DataScannerViewController.isTorchOn.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x450))();
}

uint64_t dispatch thunk of DataScannerViewController.isTorchOn.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x458))();
}

uint64_t dispatch thunk of DataScannerViewController.isTorchOn.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x460))();
}

uint64_t dispatch thunk of DataScannerViewController.customWords.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x468))();
}

uint64_t dispatch thunk of DataScannerViewController.customWords.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x470))();
}

uint64_t dispatch thunk of DataScannerViewController.customWords.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x478))();
}

uint64_t dispatch thunk of DataScannerViewController.usesLanguageDetection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x480))();
}

uint64_t dispatch thunk of DataScannerViewController.usesLanguageDetection.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x488))();
}

uint64_t dispatch thunk of DataScannerViewController.usesLanguageDetection.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x490))();
}

uint64_t dispatch thunk of DataScannerViewController.__allocating_init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:)()
{
  return (*(uint64_t (**)(void))(v0 + 1184))();
}

uint64_t dispatch thunk of DataScannerViewController.__allocating_init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)()
{
  return (*(uint64_t (**)(void))(v0 + 1192))();
}

uint64_t dispatch thunk of DataScannerViewController.capturePhoto()()
{
  char v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x560);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21797B1EC;
  return v5();
}

uint64_t sub_21797B1EC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of DataScannerViewController.startScanning()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x568))();
}

uint64_t dispatch thunk of DataScannerViewController.stopScanning()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x570))();
}

uint64_t dispatch thunk of DataScannerViewController.startCamera()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x578))();
}

uint64_t dispatch thunk of DataScannerViewController.stopCamera()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x580))();
}

uint64_t destroy for DataScannerViewController.RecognizedDataType()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DataScannerViewController.RecognizedDataType(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DataScannerViewController.RecognizedDataType(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DataScannerViewController.RecognizedDataType(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DataScannerViewController.RecognizedDataType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataScannerViewController.RecognizedDataType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DataScannerViewController.RecognizedDataType()
{
  return &type metadata for DataScannerViewController.RecognizedDataType;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DataScannerViewController.QualityLevel(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DataScannerViewController.QualityLevel(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21797B740);
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

uint64_t sub_21797B768(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21797B770(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataScannerViewController.QualityLevel()
{
  return &type metadata for DataScannerViewController.QualityLevel;
}

uint64_t getEnumTagSinglePayload for DataScannerViewController.TextContentType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DataScannerViewController.TextContentType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21797B8E4);
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

ValueMetadata *type metadata accessor for DataScannerViewController.TextContentType()
{
  return &type metadata for DataScannerViewController.TextContentType;
}

ValueMetadata *type metadata accessor for DataScannerViewController.ScanningUnavailable()
{
  return &type metadata for DataScannerViewController.ScanningUnavailable;
}

uint64_t getEnumTagSinglePayload for DataScannerViewController.SceneStabilityState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DataScannerViewController.SceneStabilityState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21797BA90);
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

ValueMetadata *type metadata accessor for DataScannerViewController.SceneStabilityState()
{
  return &type metadata for DataScannerViewController.SceneStabilityState;
}

uint64_t _s9VisionKit25DataScannerViewControllerC18RecognizedDataTypeV11RawDataTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s9VisionKit25DataScannerViewControllerC18RecognizedDataTypeV11RawDataTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21797BC24);
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

unsigned char *sub_21797BC4C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DataScannerViewController.RecognizedDataType.RawDataType()
{
  return &type metadata for DataScannerViewController.RecognizedDataType.RawDataType;
}

ValueMetadata *type metadata accessor for DataScannerViewController.DataType()
{
  return &type metadata for DataScannerViewController.DataType;
}

unint64_t sub_21797BC7C()
{
  unint64_t result = qword_267BA4950;
  if (!qword_267BA4950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4950);
  }
  return result;
}

unint64_t sub_21797BCD4()
{
  unint64_t result = qword_267BA4958;
  if (!qword_267BA4958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4958);
  }
  return result;
}

unint64_t sub_21797BD2C()
{
  unint64_t result = qword_267BA4960;
  if (!qword_267BA4960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4960);
  }
  return result;
}

unint64_t sub_21797BD84()
{
  unint64_t result = qword_267BA4968;
  if (!qword_267BA4968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4968);
  }
  return result;
}

unint64_t sub_21797BDDC()
{
  unint64_t result = qword_267BA4970;
  if (!qword_267BA4970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BA4970);
  }
  return result;
}

uint64_t sub_21797BE30()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21797BE68()
{
  return objectdestroy_139Tm(33);
}

void sub_21797BE70()
{
  sub_21796D0F0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
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

uint64_t sub_21797BE94()
{
  return objectdestroy_139Tm(32);
}

void sub_21797BE9C()
{
  sub_21796CC68(*(void *)(v0 + 16));
}

uint64_t sub_21797BEA4()
{
  return objectdestroy_139Tm(32);
}

void sub_21797BEAC()
{
  sub_21796C7EC(*(void *)(v0 + 16));
}

uint64_t sub_21797BEB4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_21797BF04()
{
  sub_21796C5F4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_21797BF10()
{
  return objectdestroy_139Tm(33);
}

void sub_21797BF18()
{
  sub_21796BF58(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_21797BF24()
{
  return objectdestroy_139Tm(40);
}

void sub_21797BF2C()
{
  sub_21796BDCC(*(void *)(v0 + 16), *(double *)(v0 + 32));
}

uint64_t sub_21797BF38()
{
  return objectdestroy_139Tm(40);
}

uint64_t objectdestroy_139Tm(uint64_t a1)
{
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

void sub_21797BF8C()
{
  sub_21796B9AC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_21797BF98()
{
  sub_21796D250(v0);
}

uint64_t sub_21797BFA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21797BFE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21797C050()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

id sub_21797C088()
{
  uint64_t v1 = *(void **)(v0 + 16);
  objc_msgSend(v1, sel_setReticleRect_angle_, *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48), *(double *)(v0 + 56));

  return objc_msgSend(v1, sel_setReticleAlpha_, 1.0);
}

uint64_t sub_21797C0E4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21797C11C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  objc_msgSend(v1, sel_collapseReticleRect);

  return objc_msgSend(v1, sel_setReticleAlpha_, 0.0);
}

uint64_t sub_21797C16C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21797C1B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21797C214(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21797C270(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21797C2D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for RecognizedItem(0) - 8);
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
  uint64_t result = sub_21797C9E8();
  __break(1u);
  return result;
}

uint64_t sub_21797C42C(uint64_t a1)
{
  return sub_217976334(a1, v1);
}

void sub_21797C434()
{
  sub_21797665C(v0);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_21797C4A0(uint64_t a1)
{
  sub_2179703B4(a1, v1, (void (*)(uint64_t))sub_217971750);
}

void sub_21797C4D0(uint64_t a1)
{
  sub_2179703B4(a1, v1, (void (*)(uint64_t))sub_2179705D4);
}

void sub_21797C500(void *a1)
{
  sub_217970424(a1, v1);
}

uint64_t sub_21797C5B8()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_21797C5C8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21797C5D8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21797C5E8()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_21797C5F8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_21797C608()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21797C618()
{
  return MEMORY[0x270EF1458]();
}

uint64_t sub_21797C628()
{
  return MEMORY[0x270EF1478]();
}

uint64_t sub_21797C638()
{
  return MEMORY[0x270EF1490]();
}

uint64_t sub_21797C648()
{
  return MEMORY[0x270EF14A0]();
}

uint64_t sub_21797C658()
{
  return MEMORY[0x270EF14D8]();
}

uint64_t sub_21797C668()
{
  return MEMORY[0x270EF14F8]();
}

uint64_t sub_21797C678()
{
  return MEMORY[0x270EF1538]();
}

uint64_t sub_21797C688()
{
  return MEMORY[0x270EF1550]();
}

uint64_t sub_21797C698()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21797C6A8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21797C6B8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21797C6C8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21797C6D8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21797C6E8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21797C6F8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21797C708()
{
  return MEMORY[0x270F9D418]();
}

uint64_t sub_21797C718()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21797C728()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21797C738()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21797C748()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21797C758()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21797C768()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21797C778()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21797C788()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21797C798()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21797C7A8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21797C7B8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21797C7C8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21797C7D8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21797C7E8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_21797C7F8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_21797C808()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21797C818()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21797C828()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_21797C838()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_21797C848()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_21797C858()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_21797C868()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_21797C878()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_21797C888()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_21797C898()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_21797C8A8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21797C8B8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21797C8C8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21797C8D8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21797C8E8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_21797C8F8()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_21797C908()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21797C918()
{
  return MEMORY[0x270F9E760]();
}

uint64_t sub_21797C938()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_21797C948()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21797C958()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21797C968()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21797C978()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21797C988()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21797C998()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21797C9A8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21797C9B8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21797C9C8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21797C9D8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21797C9E8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21797CA08()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21797CA28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21797CA38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21797CA48()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21797CA58()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21797CA68()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21797CA78()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21797CA88()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21797CA98()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21797CAA8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t VKCDistanceSquared()
{
  return MEMORY[0x270F83C20]();
}

uint64_t VKCFlipPoint()
{
  return MEMORY[0x270F83C28]();
}

uint64_t VKCNormalizedPointInRect()
{
  return MEMORY[0x270F83C30]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}