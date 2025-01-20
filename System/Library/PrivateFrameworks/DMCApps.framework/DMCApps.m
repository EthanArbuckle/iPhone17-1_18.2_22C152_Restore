uint64_t DMCApp.bundleID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DMCApp.bundleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DMCApp.bundleID.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.originator.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DMCApp.originator.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*DMCApp.originator.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.sourceID.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DMCApp.sourceID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*DMCApp.sourceID.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.attributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DMCApp.attributes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*DMCApp.attributes.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.installSource.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DMCApp() + 32);
  return sub_24C86A3F4(v3, a1);
}

uint64_t type metadata accessor for DMCApp()
{
  uint64_t result = qword_2697F7A88;
  if (!qword_2697F7A88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C86A3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t DMCApp.installSource.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DMCApp() + 32);
  return sub_24C86A4E4(a1, v3);
}

uint64_t sub_24C86A4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*DMCApp.installSource.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.installBehavior.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for DMCApp();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t DMCApp.installBehavior.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DMCApp();
  *(unsigned char *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

uint64_t (*DMCApp.installBehavior.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.updateBehavior.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for DMCApp();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 40));
  return result;
}

uint64_t DMCApp.updateBehavior.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DMCApp();
  *(unsigned char *)(v1 + *(int *)(result + 40)) = v2;
  return result;
}

uint64_t (*DMCApp.updateBehavior.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.backupBehavior.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for DMCApp();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t DMCApp.backupBehavior.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DMCApp();
  *(unsigned char *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*DMCApp.backupBehavior.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.removeBehavior.getter@<X0>(_WORD *a1@<X8>)
{
  uint64_t result = type metadata accessor for DMCApp();
  *a1 = *(_WORD *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t DMCApp.removeBehavior.setter(__int16 *a1)
{
  __int16 v2 = *a1;
  uint64_t result = type metadata accessor for DMCApp();
  *(_WORD *)(v1 + *(int *)(result + 48)) = v2;
  return result;
}

uint64_t (*DMCApp.removeBehavior.modify())()
{
  return nullsub_1;
}

uint64_t DMCApp.documentSyncBehavior.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for DMCApp();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 52));
  return result;
}

uint64_t DMCApp.documentSyncBehavior.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for DMCApp();
  *(unsigned char *)(v1 + *(int *)(result + 52)) = v2;
  return result;
}

uint64_t (*DMCApp.documentSyncBehavior.modify())()
{
  return nullsub_1;
}

uint64_t sub_24C86A8F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, char *a10, char *a11, char *a12, __int16 *a13, char *a14)
{
  char v30 = *a11;
  char v31 = *a10;
  __int16 v28 = *a13;
  char v29 = *a12;
  char v27 = *a14;
  v18 = (int *)type metadata accessor for DMCApp();
  uint64_t v19 = (uint64_t)a9 + v18[8];
  uint64_t v20 = type metadata accessor for InstallSource(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  uint64_t v21 = v18[9];
  *((unsigned char *)a9 + v21) = 3;
  uint64_t v22 = v18[10];
  *((unsigned char *)a9 + v22) = 2;
  uint64_t v23 = v18[11];
  *((unsigned char *)a9 + v23) = 2;
  uint64_t v24 = v18[12];
  *(_WORD *)((char *)a9 + v24) = 2;
  uint64_t v25 = v18[13];
  *((unsigned char *)a9 + v25) = 2;
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  uint64_t result = sub_24C86A4E4(a8, v19);
  *((unsigned char *)a9 + v21) = v31;
  *((unsigned char *)a9 + v22) = v30;
  *((unsigned char *)a9 + v23) = v29;
  *(_WORD *)((char *)a9 + v24) = v28;
  *((unsigned char *)a9 + v25) = v27;
  return result;
}

uint64_t DMCApp.init(bundleID:originator:sourceID:attributes:backupBehavior:removeBehavior:documentSyncBehavior:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unsigned char *a8@<X7>, void *a9@<X8>, __int16 *a10, char *a11)
{
  uint64_t v25 = a6;
  uint64_t v26 = a7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
  MEMORY[0x270FA5388]();
  uint64_t v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a8) = *a8;
  __int16 v20 = *a10;
  char v21 = *a11;
  uint64_t v22 = type metadata accessor for InstallSource(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v19, 1, 1, v22);
  char v31 = 3;
  char v30 = 2;
  char v29 = (char)a8;
  __int16 v28 = v20;
  char v27 = v21;
  return sub_24C86A8F0(a1, a2, a3, a4, a5, v25, v26, (uint64_t)v19, a9, &v31, &v30, &v29, &v28, &v27);
}

uint64_t sub_24C86ABB4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24C86ABE4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_24C86AC1C())()
{
  return nullsub_1;
}

uint64_t sub_24C86AC3C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24C86AC6C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_24C86ACA4())()
{
  return nullsub_1;
}

uint64_t sub_24C86ACC4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24C86ACF4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*sub_24C86AD2C())()
{
  return nullsub_1;
}

uint64_t sub_24C86AD4C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24C86AD54(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_24C86AD80())()
{
  return nullsub_1;
}

uint64_t sub_24C86ADA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24C86A3F4(v2 + *(int *)(a1 + 32), a2);
}

uint64_t sub_24C86ADB0(uint64_t a1, uint64_t a2)
{
  return sub_24C86A4E4(a1, v2 + *(int *)(a2 + 32));
}

uint64_t (*sub_24C86ADBC())()
{
  return nullsub_1;
}

uint64_t sub_24C86ADE0@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(v2 + *(int *)(result + 36));
  return result;
}

unsigned char *sub_24C86ADF0(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 36)) = *result;
  return result;
}

uint64_t (*sub_24C86AE00())()
{
  return nullsub_1;
}

uint64_t sub_24C86AE24@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(v2 + *(int *)(result + 40));
  return result;
}

unsigned char *sub_24C86AE34(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 40)) = *result;
  return result;
}

uint64_t (*sub_24C86AE44())()
{
  return nullsub_1;
}

uint64_t sub_24C86AE68@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(v2 + *(int *)(result + 44));
  return result;
}

unsigned char *sub_24C86AE78(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 44)) = *result;
  return result;
}

uint64_t (*sub_24C86AE88())()
{
  return nullsub_1;
}

uint64_t sub_24C86AEAC@<X0>(uint64_t result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *(_WORD *)(v2 + *(int *)(result + 48));
  return result;
}

_WORD *sub_24C86AEBC(_WORD *result, uint64_t a2)
{
  *(_WORD *)(v2 + *(int *)(a2 + 48)) = *result;
  return result;
}

uint64_t (*sub_24C86AECC())()
{
  return nullsub_1;
}

uint64_t sub_24C86AEF0@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(v2 + *(int *)(result + 52));
  return result;
}

unsigned char *sub_24C86AF00(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 52)) = *result;
  return result;
}

uint64_t (*sub_24C86AF10())()
{
  return nullsub_1;
}

void *initializeBufferWithCopyOfBuffer for DMCApp(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    uint64_t v10 = a3[8];
    __dst = (char *)a1 + v10;
    v11 = (char *)a2 + v10;
    a1[6] = a2[6];
    uint64_t v12 = type metadata accessor for InstallSource(0);
    uint64_t v20 = *(void *)(v12 - 8);
    uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v22(v11, 1, v12))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
      memcpy(__dst, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = type metadata accessor for StoreSource(0);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v16 = sub_24C880F80();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(__dst, v11, v16);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(__dst, v11, *(void *)(*(void *)(v15 - 8) + 64));
      }
      __dst[*(int *)(v12 + 20)] = v11[*(int *)(v12 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v17 = a3[10];
    *((unsigned char *)v4 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *((unsigned char *)v4 + v17) = *((unsigned char *)a2 + v17);
    uint64_t v18 = a3[12];
    *((unsigned char *)v4 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    *(_WORD *)((char *)v4 + v18) = *(_WORD *)((char *)a2 + v18);
    *((unsigned char *)v4 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  }
  return v4;
}

uint64_t destroy for DMCApp(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for InstallSource(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (!result)
  {
    type metadata accessor for StoreSource(0);
    uint64_t result = swift_getEnumCaseMultiPayload();
    if (result == 2)
    {
      uint64_t v7 = sub_24C880F80();
      uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
      return v8(v4, v7);
    }
  }
  return result;
}

void *initializeWithCopy for DMCApp(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a3[8];
  __dst = (char *)a1 + v8;
  uint64_t v9 = (char *)a2 + v8;
  a1[6] = a2[6];
  uint64_t v10 = type metadata accessor for InstallSource(0);
  uint64_t v18 = *(void *)(v10 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
    memcpy(__dst, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v14 = sub_24C880F80();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(__dst, v9, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    __dst[*(int *)(v10 + 20)] = v9[*(int *)(v10 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v15 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
  uint64_t v16 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *(_WORD *)((char *)a1 + v16) = *(_WORD *)((char *)a2 + v16);
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  return a1;
}

void *assignWithCopy for DMCApp(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for InstallSource(0);
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      uint64_t v14 = type metadata accessor for StoreSource(0);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v15 = sub_24C880F80();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v7, v8, v15);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
      }
      v7[*(int *)(v9 + 20)] = v8[*(int *)(v9 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_15;
    }
LABEL_7:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
    memcpy(v7, v8, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_15;
  }
  if (v13)
  {
    sub_24C86B82C((uint64_t)v7, type metadata accessor for InstallSource);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_24C86B82C((uint64_t)v7, type metadata accessor for StoreSource);
    uint64_t v17 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v18 = sub_24C880F80();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v7, v8, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  v7[*(int *)(v9 + 20)] = v8[*(int *)(v9 + 20)];
LABEL_15:
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *(_WORD *)((char *)a1 + a3[12]) = *(_WORD *)((char *)a2 + a3[12]);
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  return a1;
}

uint64_t sub_24C86B82C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeWithTake for DMCApp(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a3[8];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for InstallSource(0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v14 = sub_24C880F80();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v8, v9, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    *((unsigned char *)v8 + *(int *)(v10 + 20)) = *((unsigned char *)v9 + *(int *)(v10 + 20));
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v15 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(_WORD *)(a1 + v16) = *(_WORD *)(a2 + v16);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  return a1;
}

void *assignWithTake for DMCApp(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[8];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for InstallSource(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      uint64_t v17 = type metadata accessor for StoreSource(0);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v18 = sub_24C880F80();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v10, v11, v18);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
      }
      v10[*(int *)(v12 + 20)] = v11[*(int *)(v12 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_15;
    }
LABEL_7:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
    memcpy(v10, v11, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_15;
  }
  if (v16)
  {
    sub_24C86B82C((uint64_t)v10, type metadata accessor for InstallSource);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_24C86B82C((uint64_t)v10, type metadata accessor for StoreSource);
    uint64_t v20 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v21 = sub_24C880F80();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v10, v11, v21);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    }
  }
  v10[*(int *)(v12 + 20)] = v11[*(int *)(v12 + 20)];
LABEL_15:
  uint64_t v22 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *((unsigned char *)a1 + v22) = *((unsigned char *)a2 + v22);
  uint64_t v23 = a3[12];
  *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
  *(_WORD *)((char *)a1 + v23) = *(_WORD *)((char *)a2 + v23);
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCApp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C86BD9C);
}

uint64_t sub_24C86BD9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for DMCApp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C86BE64);
}

uint64_t sub_24C86BE64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_24C86BF10()
{
  sub_24C86BFDC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24C86BFDC()
{
  if (!qword_2697F7A98)
  {
    type metadata accessor for InstallSource(255);
    unint64_t v0 = sub_24C881060();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2697F7A98);
    }
  }
}

BOOL static InstallWhen.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t InstallWhen.hash(into:)()
{
  return sub_24C8811C0();
}

BOOL sub_24C86C078(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24C86C090()
{
  return sub_24C8811C0();
}

uint64_t _s7DMCApps11InstallWhenO9hashValueSivg_0()
{
  return sub_24C8811D0();
}

uint64_t sub_24C86C10C()
{
  return sub_24C8811D0();
}

uint64_t InstallSource.init(storeSource:vppType:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v5 = *a2;
  uint64_t v6 = *(int *)(type metadata accessor for InstallSource(0) + 20);
  uint64_t result = sub_24C86C1BC(a1, a3);
  *(unsigned char *)(a3 + v6) = v5;
  return result;
}

uint64_t type metadata accessor for InstallSource(uint64_t a1)
{
  return sub_24C86C240(a1, (uint64_t *)&unk_2697F7AC0);
}

uint64_t sub_24C86C1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StoreSource(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for StoreSource(uint64_t a1)
{
  return sub_24C86C240(a1, (uint64_t *)&unk_2697F7AB0);
}

uint64_t sub_24C86C240(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

DMCApps::InstallBehavior __swiftcall InstallBehavior.init(installWhen:)(DMCApps::InstallBehavior installWhen)
{
  *uint64_t v1 = *(unsigned char *)installWhen.installWhen;
  return installWhen;
}

DMCApps::BackupBehavior __swiftcall BackupBehavior.init(backupAppData:)(DMCApps::BackupBehavior backupAppData)
{
  v1->backupAppData = backupAppData.backupAppData;
  return backupAppData;
}

DMCApps::RemoveBehavior __swiftcall RemoveBehavior.init(removable:removeKeychainGroupWhenUninstall:)(Swift::Bool removable, Swift::Bool_optional removeKeychainGroupWhenUninstall)
{
  v2->value = removable;
  v2[1].value = removeKeychainGroupWhenUninstall.value;
  result.removable = removable;
  return result;
}

unint64_t sub_24C86C29C()
{
  unint64_t result = qword_2697F7AA0;
  if (!qword_2697F7AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7AA0);
  }
  return result;
}

unint64_t sub_24C86C2F4()
{
  unint64_t result = qword_2697F7AA8;
  if (!qword_2697F7AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7AA8);
  }
  return result;
}

uint64_t dispatch thunk of DMCAppBase.bundleID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppBase.bundleID.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DMCAppBase.bundleID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DMCAppBase.originator.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DMCAppBase.originator.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of DMCAppBase.originator.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DMCAppBase.sourceID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of DMCAppBase.sourceID.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of DMCAppBase.sourceID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of DMCAppBase.attributes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of DMCAppBase.attributes.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of DMCAppBase.attributes.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of DMCAppBackupControl.backupBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppBackupControl.backupBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DMCAppBackupControl.backupBehavior.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DMCAppDocumentSyncControl.documentSyncBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppDocumentSyncControl.documentSyncBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DMCAppDocumentSyncControl.documentSyncBehavior.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DMCAppRemovalControl.removeBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppRemovalControl.removeBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DMCAppRemovalControl.removeBehavior.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installSource.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installSource.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.installBehavior.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.updateBehavior.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.updateBehavior.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of DMCAppInstallationControl.updateBehavior.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_24C86C5B8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24C86C5C0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InstallWhen()
{
  return &type metadata for InstallWhen;
}

uint64_t *initializeBufferWithCopyOfBuffer for StoreSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v7 = sub_24C880F80();
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

uint64_t destroy for StoreSource(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v3 = sub_24C880F80();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for StoreSource(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_24C880F80();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for StoreSource(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C86C8D0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v6 = sub_24C880F80();
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

uint64_t sub_24C86C8D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StoreSource(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for StoreSource(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_24C880F80();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for StoreSource(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C86C8D0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v6 = sub_24C880F80();
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

uint64_t getEnumTagSinglePayload for StoreSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for StoreSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24C86CB00()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24C86CB10()
{
  uint64_t result = sub_24C880F80();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for VPPLicenseType()
{
  return &type metadata for VPPLicenseType;
}

uint64_t *initializeBufferWithCopyOfBuffer for InstallSource(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v8 = sub_24C880F80();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for InstallSource(uint64_t a1)
{
  type metadata accessor for StoreSource(0);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v3 = sub_24C880F80();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for InstallSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for StoreSource(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v7 = sub_24C880F80();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *assignWithCopy for InstallSource(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C86C8D0((uint64_t)a1);
    uint64_t v6 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v7 = sub_24C880F80();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
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

void *initializeWithTake for InstallSource(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for StoreSource(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v7 = sub_24C880F80();
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

void *assignWithTake for InstallSource(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C86C8D0((uint64_t)a1);
    uint64_t v6 = type metadata accessor for StoreSource(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v7 = sub_24C880F80();
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

uint64_t getEnumTagSinglePayload for InstallSource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C86D0D8);
}

uint64_t sub_24C86D0D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for StoreSource(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) <= 3u) {
      int v10 = 3;
    }
    else {
      int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    }
    unsigned int v11 = v10 - 3;
    if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) >= 3u) {
      return v11;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for InstallSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C86D1B4);
}

uint64_t sub_24C86D1B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for StoreSource(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 3;
  }
  return result;
}

uint64_t sub_24C86D270()
{
  uint64_t result = type metadata accessor for StoreSource(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s7DMCApps14VPPLicenseTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s7DMCApps14VPPLicenseTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C86D460);
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

ValueMetadata *type metadata accessor for InstallBehavior()
{
  return &type metadata for InstallBehavior;
}

ValueMetadata *type metadata accessor for BackupBehavior()
{
  return &type metadata for BackupBehavior;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RemoveBehavior(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoveBehavior(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24C86D62CLL);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoveBehavior()
{
  return &type metadata for RemoveBehavior;
}

ValueMetadata *type metadata accessor for UpdateBehavior()
{
  return &type metadata for UpdateBehavior;
}

uint64_t _s7DMCApps14UpdateBehaviorVwet_0(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s7DMCApps14UpdateBehaviorVwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C86D7E0);
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

ValueMetadata *type metadata accessor for DocumentSyncBehavior()
{
  return &type metadata for DocumentSyncBehavior;
}

BOOL static DMCAppsScope.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DMCAppsScope.hash(into:)()
{
  return sub_24C8811C0();
}

uint64_t DMCAppsScope.hashValue.getter()
{
  return sub_24C8811D0();
}

BOOL sub_24C86D8D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t static DMCAppsClient.makeAppInfo(bundleID:originator:sourceID:attributes:installSource:installBehavior:updateBehavior:backupBehavior:removeBehavior:documentSyncBehavior:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, char *a10, char *a11, char *a12, __int16 *a13, char *a14)
{
  uint64_t v27 = a7;
  __int16 v28 = a9;
  uint64_t v30 = a3;
  uint64_t v31 = a5;
  uint64_t v29 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7A80);
  MEMORY[0x270FA5388]();
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v20 = *a10;
  char v21 = *a11;
  char v22 = *a12;
  __int16 v23 = *a13;
  char v24 = *a14;
  sub_24C86A3F4(a8, (uint64_t)v19);
  char v36 = v20;
  char v35 = v21;
  char v34 = v22;
  __int16 v33 = v23;
  char v32 = v24;
  uint64_t v25 = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_24C86A8F0(v29, a2, v30, a4, v31, a6, v25, (uint64_t)v19, v28, &v36, &v35, &v34, &v33, &v32);
}

id DMCAppsClient.init()@<X0>(uint64_t a1@<X8>)
{
  id result = objc_msgSend(self, sel_systemConnection);
  if (result)
  {
    id v3 = result;
    type metadata accessor for DMCAppsManager();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    type metadata accessor for DMCAppsManagementStateEvaluator();
    id result = (id)swift_allocObject();
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = result;
    *(unsigned char *)(a1 + 16) = 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id DMCAppsClient.init(scope:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  id v4 = self;
  if (v3)
  {
    id v4 = objc_msgSend(v4, sel_systemConnection);
    id v5 = v4;
    if (v4)
    {
LABEL_5:
      type metadata accessor for DMCAppsManager();
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = v5;
      type metadata accessor for DMCAppsManagementStateEvaluator();
      id result = (id)swift_allocObject();
      *(void *)a2 = v7;
      *(void *)(a2 + 8) = result;
      *(unsigned char *)(a2 + 16) = v3;
      return result;
    }
    __break(1u);
  }
  id result = objc_msgSend(v4, sel_currentUserConnection);
  id v5 = result;
  if (result) {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t DMCAppsClient.isManaged(bundleID:persona:)(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_24C86DC2C;
  return sub_24C8739F8(a1, a2);
}

uint64_t sub_24C86DC2C(char a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = *(uint64_t (**)(BOOL))(v4 + 8);
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = a1 != 0;
    id v5 = *(uint64_t (**)(BOOL))(v4 + 8);
  }
  return v5(v6);
}

uint64_t DMCAppsClient.willInstallApplication(_:options:)(uint64_t a1)
{
  id v5 = (uint64_t (*)(uint64_t))((char *)&dword_2697F7AE0 + dword_2697F7AE0);
  char v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *char v3 = v1;
  v3[1] = sub_24C873420;
  return v5(a1);
}

uint64_t DMCAppsClient.didInstallApplication(_:options:)(uint64_t a1)
{
  id v5 = (uint64_t (*)(uint64_t))((char *)&dword_2697F7AF0 + dword_2697F7AF0);
  char v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *char v3 = v1;
  v3[1] = sub_24C86DE98;
  return v5(a1);
}

uint64_t sub_24C86DE98(char a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (v1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 1;
  }
  return v4(v5);
}

uint64_t DMCAppsClient.updateApp(_:options:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2697F7B00 + dword_2697F7B00);
  char v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *char v3 = v1;
  v3[1] = sub_24C873420;
  return v5(a1);
}

uint64_t DMCAppsClient.getUnhideableApps()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24C86E0DC;
  return sub_24C875200();
}

uint64_t sub_24C86E0DC(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t DMCAppsClient.getUnlockableApps()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24C873424;
  return sub_24C875630();
}

uint64_t DMCAppsClient.getUnhideableAndUnlockableApps()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24C873424;
  return sub_24C875A60();
}

uint64_t DMCAppsClient.getUnhideableOrUnlockableApps()()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24C873424;
  return sub_24C875EFC();
}

uint64_t DMCAppsClient.configurationApplied(_:appAlreadyPresent:)(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v4 + 185) = a3;
  *(void *)(v4 + 80) = a1;
  *(void *)(v4 + 88) = a2;
  *(void *)(v4 + 96) = *v3;
  return MEMORY[0x270FA2498](sub_24C86E3B8, 0, 0);
}

uint64_t sub_24C86E3B8()
{
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[13] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[14] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C86E48C;
  return sub_24C8737E8();
}

uint64_t sub_24C86E48C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[17] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C86E5B0, 0, 0);
}

uint64_t sub_24C86E5B0()
{
  if (*(unsigned char *)(v0 + 120))
  {
    uint64_t v4 = *(void **)(v0 + 88);
    uint64_t v5 = v4[3];
    uint64_t v6 = v4[5];
    __swift_project_boxed_opaque_existential_5Tm(v4, v5);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
    uint64_t v9 = v8;
    *(void *)(v0 + 144) = v8;
    int v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v10;
    *int v10 = v0;
    v10[1] = sub_24C86E710;
    return sub_24C8739F8(v7, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24C872C74();
    swift_allocError();
    *(_OWORD *)uint64_t v1 = xmmword_24C881A30;
    *(unsigned char *)(v1 + 16) = 2;
    swift_willThrow();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_24C86E710(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 160) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24C86EBF8;
  }
  else
  {
    swift_bridgeObjectRelease();
    *(unsigned char *)(v4 + 186) = a1;
    uint64_t v5 = sub_24C86E840;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24C86E840()
{
  uint64_t v25 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 186);
  uint64_t v2 = *(void **)(v0 + 88);
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[7];
  __swift_project_boxed_opaque_existential_5Tm(v2, v3);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 32))(&v24, v3, v4);
  int v5 = v24;
  if (v24 == 3)
  {
    if (*(unsigned char *)(v0 + 185))
    {
      if (!v1) {
        goto LABEL_13;
      }
    }
    else if (v1 != 2)
    {
LABEL_13:
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
  }
  else if (*(unsigned char *)(v0 + 185))
  {
    if (!v1)
    {
      swift_bridgeObjectRelease();
      if (!v5)
      {
        uint64_t v6 = *(void *)(v0 + 80);
        if ((*(void *)(v0 + 120) & 0x100000000) != 0)
        {
          *(_OWORD *)uint64_t v6 = xmmword_24C881A40;
        }
        else
        {
          uint64_t v7 = 3;
          if ((*(void *)(v0 + 120) & 0x100) != 0) {
            uint64_t v7 = 1;
          }
          *(void *)uint64_t v6 = 0;
          *(void *)(v6 + 8) = v7;
        }
        goto LABEL_20;
      }
LABEL_19:
      uint64_t v18 = *(void **)(v0 + 80);
      void *v18 = 0;
      v18[1] = 0;
LABEL_20:
      uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
      return v19();
    }
  }
  else if (v1 != 2)
  {
    swift_bridgeObjectRelease();
    if (!v5)
    {
      char v20 = *(void **)(v0 + 80);
      uint64_t v21 = 1;
      if ((*(void *)(v0 + 120) & 0x100) == 0) {
        uint64_t v21 = 2;
      }
      *char v20 = 0;
      v20[1] = v21;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v8 = *(void *)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 88);
  uint64_t v10 = *(void *)(v9 + 64);
  long long v22 = *(_OWORD *)(v9 + 24);
  uint64_t v11 = *(void *)(v9 + 24);
  long long v23 = *(_OWORD *)(v9 + 40);
  uint64_t v12 = __swift_project_boxed_opaque_existential_5Tm((void *)v9, v11);
  *(_OWORD *)(v0 + 40) = v22;
  *(_OWORD *)(v0 + 56) = v23;
  *(void *)(v0 + 72) = v10;
  boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_4, v12, v11);
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_24C86EAA0;
  uint64_t v15 = *(void *)(v0 + 128);
  uint64_t v16 = *(void *)(v0 + 136);
  return sub_24C874554(v0 + 16, v8 & 0x101010100 | 1, v15, v16);
}

uint64_t sub_24C86EAA0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v3 = sub_24C86EC64;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_4(v2 + 16);
    uint64_t v3 = sub_24C86EBD0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24C86EBD0()
{
  *(_OWORD *)*(void *)(v0 + 80) = xmmword_24C881A50;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24C86EBF8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C86EC64()
{
  __swift_destroy_boxed_opaque_existential_4(v0 + 16);
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DMCAppsClient.configurationRemoved(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24C86ECE8, 0, 0);
}

uint64_t sub_24C86ECE8()
{
  **(unsigned char **)(v0 + 16) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DMCAppsClient.optionalAppRequested(_:appAlreadyPresent:)(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v4 + 97) = a3;
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = *v3;
  return MEMORY[0x270FA2498](sub_24C86ED34, 0, 0);
}

uint64_t sub_24C86ED34()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[5] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C86EE08;
  return sub_24C8737E8();
}

uint64_t sub_24C86EE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  *(void *)(v4 + 56) = a1;
  *(void *)(v4 + 64) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C86EF28, 0, 0);
}

uint64_t sub_24C86EF28()
{
  if (*(unsigned char *)(v0 + 56))
  {
    uint64_t v4 = *(void **)(v0 + 24);
    uint64_t v5 = v4[3];
    uint64_t v6 = v4[5];
    __swift_project_boxed_opaque_existential_5Tm(v4, v5);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
    uint64_t v9 = v8;
    *(void *)(v0 + 72) = v8;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_24C86F088;
    return sub_24C8739F8(v7, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24C872C74();
    swift_allocError();
    *(_OWORD *)uint64_t v1 = xmmword_24C881A30;
    *(unsigned char *)(v1 + 16) = 2;
    swift_willThrow();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_24C86F088(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24C86F244;
  }
  else
  {
    swift_bridgeObjectRelease();
    *(unsigned char *)(v4 + 98) = a1;
    uint64_t v5 = sub_24C86F1B8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24C86F1B8()
{
  int v1 = *(unsigned __int8 *)(v0 + 98);
  int v2 = *(unsigned __int8 *)(v0 + 97);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v4 = HIDWORD(*(void *)(v0 + 56)) & 1;
  swift_bridgeObjectRelease();
  if (v1) {
    int v5 = 0;
  }
  else {
    int v5 = v2;
  }
  *uint64_t v3 = 0;
  v3[1] = v5 & v4;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24C86F244()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DMCAppsClient.willInstall(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = v3;
  return MEMORY[0x270FA2498](sub_24C86F2D4, 0, 0);
}

uint64_t sub_24C86F2D4()
{
  int v1 = (void *)v0[14];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[16] = v4;
  int v5 = (void *)swift_task_alloc();
  v0[17] = v5;
  *int v5 = v0;
  v5[1] = sub_24C86F3A8;
  return sub_24C8737E8();
}

uint64_t sub_24C86F3A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[10] = v3;
  v4[11] = a1;
  v4[12] = a2;
  v4[13] = a3;
  v4[18] = a1;
  v4[19] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C86F4D0, 0, 0);
}

uint64_t sub_24C86F4D0()
{
  uint64_t v1 = *(void *)(v0 + 144);
  if (v1)
  {
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v7 = *(void *)(v6 + 64);
    long long v13 = *(_OWORD *)(v6 + 24);
    uint64_t v8 = *(void *)(v6 + 24);
    long long v14 = *(_OWORD *)(v6 + 40);
    uint64_t v9 = __swift_project_boxed_opaque_existential_5Tm((void *)v6, v8);
    *(_OWORD *)(v0 + 40) = v13;
    *(_OWORD *)(v0 + 56) = v14;
    *(void *)(v0 + 72) = v7;
    boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_4, v9, v8);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v11;
    void *v11 = v0;
    v11[1] = sub_24C86F698;
    uint64_t v12 = *(void *)(v0 + 152);
    return sub_24C873D7C(v0 + 16, v1 & 0x101010100 | 1, v5, v12);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24C872C74();
    swift_allocError();
    *(_OWORD *)uint64_t v2 = xmmword_24C881A30;
    *(unsigned char *)(v2 + 16) = 2;
    swift_willThrow();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_24C86F698()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x270FA2498](sub_24C86F7EC, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4(v2 + 16);
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24C86F7EC()
{
  __swift_destroy_boxed_opaque_existential_4(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DMCAppsClient.didInstall(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v3;
  return MEMORY[0x270FA2498](sub_24C86F874, 0, 0);
}

uint64_t sub_24C86F874()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[12] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[13] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C86F948;
  return sub_24C8737E8();
}

uint64_t sub_24C86F948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  *(void *)(v4 + 112) = a1;
  *(void *)(v4 + 120) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C86FA68, 0, 0);
}

uint64_t sub_24C86FA68()
{
  if (*(unsigned char *)(v0 + 112))
  {
    uint64_t v4 = *(void *)(v0 + 80);
    uint64_t v5 = *(void *)(v4 + 64);
    long long v10 = *(_OWORD *)(v4 + 24);
    uint64_t v6 = *(void *)(v4 + 24);
    long long v11 = *(_OWORD *)(v4 + 40);
    uint64_t v7 = __swift_project_boxed_opaque_existential_5Tm((void *)v4, v6);
    *(_OWORD *)(v0 + 40) = v10;
    *(_OWORD *)(v0 + 56) = v11;
    *(void *)(v0 + 72) = v5;
    boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_4, v7, v6);
    uint64_t v12 = (uint64_t (*)(uint64_t))((char *)&dword_2697F7CE0 + dword_2697F7CE0);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_24C86FC1C;
    return v12(v0 + 16);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24C872C74();
    swift_allocError();
    *(_OWORD *)uint64_t v1 = xmmword_24C881A30;
    *(unsigned char *)(v1 + 16) = 2;
    swift_willThrow();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_24C86FC1C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x270FA2498](sub_24C86FD70, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4(v2 + 16);
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24C86FD70()
{
  __swift_destroy_boxed_opaque_existential_4(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DMCAppsClient.willUpdate(_:)()
{
  return sub_24C872D7C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DMCAppsClient.didUpdate(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = v3;
  return MEMORY[0x270FA2498](sub_24C86FE30, 0, 0);
}

uint64_t sub_24C86FE30()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[16] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[17] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C86FF04;
  return sub_24C8737E8();
}

uint64_t sub_24C86FF04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[10] = v3;
  v4[11] = a1;
  v4[12] = a2;
  v4[13] = a3;
  v4[18] = a1;
  v4[19] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C87002C, 0, 0);
}

uint64_t sub_24C87002C()
{
  uint64_t v1 = *(void *)(v0 + 144);
  if (v1)
  {
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v7 = *(void *)(v6 + 64);
    long long v13 = *(_OWORD *)(v6 + 24);
    uint64_t v8 = *(void *)(v6 + 24);
    long long v14 = *(_OWORD *)(v6 + 40);
    uint64_t v9 = __swift_project_boxed_opaque_existential_5Tm((void *)v6, v8);
    *(_OWORD *)(v0 + 40) = v13;
    *(_OWORD *)(v0 + 56) = v14;
    *(void *)(v0 + 72) = v7;
    boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_4, v9, v8);
    long long v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v11;
    void *v11 = v0;
    v11[1] = sub_24C8701F4;
    uint64_t v12 = *(void *)(v0 + 152);
    return sub_24C874554(v0 + 16, v1 & 0x101010100 | 1, v5, v12);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24C872C74();
    swift_allocError();
    *(_OWORD *)uint64_t v2 = xmmword_24C881A30;
    *(unsigned char *)(v2 + 16) = 2;
    swift_willThrow();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_24C8701F4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x270FA2498](sub_24C873418, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4(v2 + 16);
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t DMCAppsClient.installFailed(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v3;
  return MEMORY[0x270FA2498](sub_24C87036C, 0, 0);
}

uint64_t sub_24C87036C()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[12] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[13] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C870440;
  return sub_24C8737E8();
}

uint64_t sub_24C870440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)v3 + 112) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C87055C, 0, 0);
}

uint64_t sub_24C87055C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v1 + 64);
  long long v8 = *(_OWORD *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 24);
  long long v9 = *(_OWORD *)(v1 + 40);
  uint64_t v4 = __swift_project_boxed_opaque_existential_5Tm((void *)v1, v3);
  *(_OWORD *)(v0 + 40) = v8;
  *(_OWORD *)(v0 + 56) = v9;
  *(void *)(v0 + 72) = v2;
  boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_4, v4, v3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24C870678;
  return sub_24C878B54(v0 + 16);
}

uint64_t sub_24C870678()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24C873410, 0, 0);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_4(v2 + 16);
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t DMCAppsClient.didUninstall(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v3;
  return MEMORY[0x270FA2498](sub_24C870800, 0, 0);
}

uint64_t sub_24C870800()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[12] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[13] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C8708D4;
  return sub_24C8737E8();
}

uint64_t sub_24C8708D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)v3 + 112) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C8709F0, 0, 0);
}

uint64_t sub_24C8709F0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v1 + 64);
  long long v8 = *(_OWORD *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 24);
  long long v9 = *(_OWORD *)(v1 + 40);
  uint64_t v4 = __swift_project_boxed_opaque_existential_5Tm((void *)v1, v3);
  *(_OWORD *)(v0 + 40) = v8;
  *(_OWORD *)(v0 + 56) = v9;
  *(void *)(v0 + 72) = v2;
  boxed_opaque_existential_4 = __swift_allocate_boxed_opaque_existential_4((uint64_t *)(v0 + 16));
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_4, v4, v3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24C870B0C;
  return sub_24C878B54(v0 + 16);
}

uint64_t sub_24C870B0C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24C870C70, 0, 0);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_4(v2 + 16);
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24C870C70()
{
  __swift_destroy_boxed_opaque_existential_4(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DMCAppsClient.didRemoveConfiguration(_:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v3;
  return MEMORY[0x270FA2498](sub_24C87036C, 0, 0);
}

uint64_t DMCAppsClient.shouldPromptForInstallConsent(for:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 24) = a2;
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24C870D1C, 0, 0);
}

uint64_t sub_24C870D1C()
{
  id v1 = objc_msgSend(self, sel_sharedConfiguration);
  unsigned __int8 v2 = objc_msgSend(v1, sel_isSupervised);

  if (v2) {
    LOBYTE(v3) = 0;
  }
  else {
    BOOL v3 = !sub_24C870DDC(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24) & 1);
  }
  uint64_t v4 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v4(v3);
}

BOOL sub_24C870DDC(void *a1, char a2)
{
  if (a2) {
    return 0;
  }
  BOOL v3 = sub_24C8711AC();
  return (v4 & 1) == 0 && v3 == a1;
}

void *sub_24C8711AC()
{
  uint64_t v1 = sub_24C880F80();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  char v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = (id)MDMFilePath();
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = (void *)sub_24C880FE0();

    sub_24C880F60();
    swift_bridgeObjectRelease();
    long long v8 = sub_24C880B90();
    if (!v0)
    {
      uint64_t v7 = v8;
      uint64_t v9 = sub_24C880FE0();
      if (v7[2] && (sub_24C871EBC(v9, v10), (v11 & 1) != 0))
      {
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        self;
        uint64_t v12 = (void *)swift_dynamicCastObjCClass();
        if (v12)
        {
          uint64_t v7 = objc_msgSend(v12, sel_unsignedLongLongValue);
        }
        else
        {
          sub_24C872C74();
          swift_allocError();
          *(void *)uint64_t v13 = 0;
          *(void *)(v13 + 8) = 0;
          *(unsigned char *)(v13 + 16) = 2;
          swift_willThrow();
        }
        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v7 = 0;
      }
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void DMCAppsClient.organizationName.getter()
{
  id v0 = objc_msgSend(self, sel_sharedConnection);
  if (!v0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_managingOrganizationInformation);

  if (!v2)
  {
LABEL_8:
    __break(1u);
    return;
  }
  uint64_t v3 = sub_24C880FC0();

  uint64_t v4 = sub_24C880FE0();
  if (*(void *)(v3 + 16))
  {
    sub_24C871EBC(v4, v5);
    if (v6) {
      swift_bridgeObjectRetain();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_24C8714DC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *(void *)uint64_t v8 = v4;
  *(void *)(v8 + 8) = sub_24C87342C;
  *(unsigned char *)(v8 + 185) = a3;
  *(void *)(v8 + 80) = a1;
  *(void *)(v8 + 88) = a2;
  *(void *)(v8 + 96) = *v3;
  return MEMORY[0x270FA2498](sub_24C86E3B8, 0, 0);
}

uint64_t sub_24C8715A4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24C873428, 0, 0);
}

uint64_t sub_24C8715C4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *(void *)uint64_t v8 = v4;
  *(unsigned char *)(v8 + 97) = a3;
  *(void *)(v8 + 8) = sub_24C87342C;
  *(void *)(v8 + 16) = a1;
  uint64_t v9 = *v3;
  *(void *)(v8 + 24) = a2;
  *(void *)(v8 + 32) = v9;
  return MEMORY[0x270FA2498](sub_24C86ED34, 0, 0);
}

uint64_t sub_24C871688(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C87342C;
  uint64_t v5 = *v1;
  v4[14] = a1;
  v4[15] = v5;
  return MEMORY[0x270FA2498](sub_24C86F2D4, 0, 0);
}

uint64_t sub_24C871738(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C8717E8;
  uint64_t v5 = *v1;
  v4[10] = a1;
  v4[11] = v5;
  return MEMORY[0x270FA2498](sub_24C86F874, 0, 0);
}

uint64_t sub_24C8717E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24C8718DC()
{
  return sub_24C872D7C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24C871914(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C87342C;
  uint64_t v5 = *v1;
  v4[14] = a1;
  v4[15] = v5;
  return MEMORY[0x270FA2498](sub_24C86FE30, 0, 0);
}

uint64_t sub_24C8719C4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C87342C;
  uint64_t v5 = *v1;
  v4[10] = a1;
  v4[11] = v5;
  return MEMORY[0x270FA2498](sub_24C87036C, 0, 0);
}

uint64_t sub_24C871A74(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C87342C;
  uint64_t v5 = *v1;
  v4[10] = a1;
  v4[11] = v5;
  return MEMORY[0x270FA2498](sub_24C870800, 0, 0);
}

uint64_t sub_24C871B24(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C87342C;
  uint64_t v5 = *v1;
  v4[10] = a1;
  v4[11] = v5;
  return MEMORY[0x270FA2498](sub_24C87036C, 0, 0);
}

void sub_24C871BD4()
{
}

uint64_t sub_24C871BEC(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 24) = a2;
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24C870D1C, 0, 0);
}

uint64_t sub_24C871C10(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24C873414;
  return sub_24C8739F8(a1, a2);
}

uint64_t sub_24C871CB8(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2697F7AE0 + dword_2697F7AE0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24C873420;
  return v5(a1);
}

uint64_t sub_24C871D64(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2697F7AF0 + dword_2697F7AF0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24C873420;
  return v5(a1);
}

uint64_t sub_24C871E10(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2697F7B00 + dword_2697F7B00);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24C873420;
  return v5(a1);
}

unint64_t sub_24C871EBC(uint64_t a1, uint64_t a2)
{
  sub_24C8811B0();
  sub_24C880FF0();
  uint64_t v4 = sub_24C8811D0();
  return sub_24C871F34(a1, a2, v4);
}

unint64_t sub_24C871F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24C881140() & 1) == 0)
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
      while (!v14 && (sub_24C881140() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24C872018(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v3;
  return MEMORY[0x270FA2498](sub_24C87203C, 0, 0);
}

uint64_t sub_24C87203C()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[8] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C872110;
  return sub_24C8737E8();
}

uint64_t sub_24C872110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a3;
  v4[10] = a1;
  v4[11] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C872238, 0, 0);
}

uint64_t sub_24C872238()
{
  uint64_t v1 = v0[10];
  if (v1)
  {
    uint64_t v5 = v0[4];
    uint64_t v6 = (void *)swift_task_alloc();
    v0[12] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_24C872374;
    uint64_t v7 = v0[11];
    uint64_t v8 = v0[6];
    return sub_24C873D7C(v8, v1 & 0x101010100 | 1, v5, v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24C872C74();
    swift_allocError();
    *(_OWORD *)uint64_t v2 = xmmword_24C881A30;
    *(unsigned char *)(v2 + 16) = 2;
    swift_willThrow();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3(0);
  }
}

uint64_t sub_24C872374()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(BOOL))(v2 + 8);
  return v3(v0 == 0);
}

uint64_t sub_24C8724A0(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_24C8724C4, 0, 0);
}

uint64_t sub_24C8724C4()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[4] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[5] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C872598;
  return sub_24C8737E8();
}

uint64_t sub_24C872598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  *(void *)(v4 + 48) = a1;
  *(void *)(v4 + 56) = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C8726B8, 0, 0);
}

uint64_t sub_24C8726B8()
{
  if (*(unsigned char *)(v0 + 48))
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_2697F7CE0 + dword_2697F7CE0);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_24C8727EC;
    uint64_t v5 = *(void *)(v0 + 16);
    return v6(v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24C872C74();
    swift_allocError();
    *(_OWORD *)uint64_t v1 = xmmword_24C881A30;
    *(unsigned char *)(v1 + 16) = 2;
    swift_willThrow();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2(0);
  }
}

uint64_t sub_24C8727EC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(BOOL))(v2 + 8);
  return v3(v0 == 0);
}

uint64_t sub_24C872918(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v3;
  return MEMORY[0x270FA2498](sub_24C87293C, 0, 0);
}

uint64_t sub_24C87293C()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 32))(v2, v3);
  v0[8] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C872A10;
  return sub_24C8737E8();
}

uint64_t sub_24C872A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a3;
  v4[10] = a1;
  v4[11] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24C872B38, 0, 0);
}

uint64_t sub_24C872B38()
{
  uint64_t v1 = v0[10];
  if (v1)
  {
    uint64_t v5 = v0[4];
    uint64_t v6 = (void *)swift_task_alloc();
    v0[12] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_24C87341C;
    uint64_t v7 = v0[11];
    uint64_t v8 = v0[6];
    return sub_24C874554(v8, v1 & 0x101010100 | 1, v5, v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24C872C74();
    swift_allocError();
    *(_OWORD *)uint64_t v2 = xmmword_24C881A30;
    *(unsigned char *)(v2 + 16) = 2;
    swift_willThrow();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3(0);
  }
}

unint64_t sub_24C872C74()
{
  unint64_t result = qword_2697F7B30;
  if (!qword_2697F7B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7B30);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_destroy_boxed_opaque_existential_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24C872D7C(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_24C872D8C()
{
  unint64_t result = qword_2697F7B90;
  if (!qword_2697F7B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7B90);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DMCAppsScope(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DMCAppsScope(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C872F3CLL);
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

unsigned char *sub_24C872F64(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsScope()
{
  return &type metadata for DMCAppsScope;
}

uint64_t destroy for DMCAppsClient()
{
  swift_release();
  return swift_release();
}

uint64_t _s7DMCApps13DMCAppsClientVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DMCAppsClient(uint64_t a1, uint64_t a2)
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

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DMCAppsClient(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCAppsClient(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DMCAppsClient(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsClient()
{
  return &type metadata for DMCAppsClient;
}

_UNKNOWN **sub_24C87315C()
{
  return &protocol witness table for DMCApp;
}

_UNKNOWN **sub_24C873168()
{
  return &protocol witness table for DMCApp;
}

_UNKNOWN **sub_24C873174()
{
  return &protocol witness table for DMCApp;
}

_UNKNOWN **sub_24C873180()
{
  return &protocol witness table for DMCApp;
}

_UNKNOWN **sub_24C87318C()
{
  return &protocol witness table for DMCApp;
}

uint64_t sub_24C87319C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for DMCAppsInternalError(uint64_t a1)
{
  return sub_24C8731C4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24C8731C4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s7DMCApps20DMCAppsInternalErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24C87319C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DMCAppsInternalError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24C87319C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24C8731C4(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DMCAppsInternalError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24C8731C4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCAppsInternalError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DMCAppsInternalError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 254;
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

uint64_t sub_24C873354(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24C87336C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsInternalError()
{
  return &type metadata for DMCAppsInternalError;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *__swift_project_boxed_opaque_existential_5Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24C87343C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 == 2) {
    return swift_bridgeObjectRetain();
  }
  if (a3 <= 1u) {
    JUMPOUT(0x2532FD9C0);
  }
  return result;
}

uint64_t destroy for DMCAppError(uint64_t a1)
{
  return sub_24C873474(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24C873474(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 == 2) {
    return swift_bridgeObjectRelease();
  }
  if (a3 <= 1u) {
    JUMPOUT(0x2532FD9B0);
  }
  return result;
}

uint64_t _s7DMCApps11DMCAppErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24C87343C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DMCAppError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24C87343C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24C873474(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DMCAppError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24C873474(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCAppError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DMCAppError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24C873614(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_24C87362C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DMCAppError()
{
  return &type metadata for DMCAppError;
}

void sub_24C873654()
{
  qword_26B17CF78 = 1936748609;
  unk_26B17CF80 = 0xE400000000000000;
}

uint64_t sub_24C873670()
{
  uint64_t v0 = sub_24C880FB0();
  __swift_allocate_value_buffer(v0, qword_26B17CF60);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B17CF60);
  if (qword_26B17CEB8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_24C880FA0();
}

uint64_t sub_24C87372C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for DMCAppsLog()
{
  return self;
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

uint64_t type metadata accessor for DMCAppsManagementStateEvaluator()
{
  return self;
}

uint64_t sub_24C8737E8()
{
  return MEMORY[0x270FA2498](sub_24C873804, 0, 0);
}

uint64_t sub_24C873804()
{
  id v1 = objc_msgSend(self, sel_sharedConfiguration);
  objc_msgSend(v1, sel_refreshDetailsFromDisk);
  id v2 = objc_msgSend(self, sel_sharedConfiguration);
  objc_msgSend(v2, sel_refreshDetailsFromDisk);
  unsigned int v3 = objc_msgSend(v1, sel_isSupervised);
  unsigned int v4 = objc_msgSend(v2, sel_isUserEnrollment);
  id v5 = objc_msgSend(v2, sel_personaID);
  id v6 = v5;
  if (v5) {

  }
  id v7 = objc_msgSend(v2, sel_personaID);
  if (v7)
  {
    unsigned __int8 v8 = v7;
    uint64_t v9 = sub_24C880FE0();
    uint64_t v11 = v10;
  }
  else
  {

    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v12 = 0x10000;
  if (!v4) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = 16777217;
  if (v3) {
    uint64_t v13 = 16777473;
  }
  BOOL v14 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v0 + 8);
  return v14(v12 | v13 | ((unint64_t)(v6 != 0) << 32), v9, v11);
}

void sub_24C873998()
{
  qword_26B17CF88 = 0x657355776F6C6C61;
  qword_26B17CF90 = 0xEF656469486F5472;
}

void sub_24C8739C8()
{
  qword_26B17CF98 = 0x657355776F6C6C61;
  qword_26B17CFA0 = 0xEF6B636F4C6F5472;
}

uint64_t sub_24C8739F8(uint64_t a1, uint64_t a2)
{
  id v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *id v6 = v3;
  v6[1] = sub_24C873ABC;
  v6[18] = &unk_26FEF7368;
  v6[19] = v2;
  v6[16] = a1;
  v6[17] = a2;
  return MEMORY[0x270FA2498](sub_24C877994, 0, 0);
}

uint64_t sub_24C873ABC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    unsigned int v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C873BF0, 0, 0);
  }
}

uint64_t sub_24C873BF0()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (!v1) {
    goto LABEL_12;
  }
  id v2 = v1;
  id v3 = objc_msgSend(v2, sel_managementInformation);
  if (v3)
  {
    unsigned int v4 = v3;
    unint64_t v5 = (unint64_t)objc_msgSend(v3, sel_state);

    if (v5 <= 0x10) {
      unsigned int v6 = (0x17DF5u >> v5) & 1;
    }
    else {
      unsigned int v6 = 0;
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  id v7 = objc_msgSend(v2, sel_sourceIdentifier);
  if (!v7)
  {

    if (v6)
    {
LABEL_19:
      uint64_t v13 = 1;
      goto LABEL_20;
    }
LABEL_12:
    uint64_t v13 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_24C880FE0();
  uint64_t v11 = v10;

  if (v9 == 0xD00000000000001DLL && v11 == 0x800000024C8820B0) {
    char v12 = 1;
  }
  else {
    char v12 = sub_24C881140();
  }

  swift_bridgeObjectRelease();
  if (v6) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v6 && (v12 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_20:
  BOOL v14 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v14(v13);
}

uint64_t sub_24C873D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a4;
  v5[5] = v4;
  v5[2] = a1;
  v5[3] = a3;
  return MEMORY[0x270FA2498](sub_24C873DA0, 0, 0);
}

uint64_t sub_24C873DA0()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  uint64_t v6 = v5;
  v0[6] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCA0);
  uint64_t v7 = swift_allocObject();
  v0[7] = v7;
  *(_OWORD *)(v7 + 16) = xmmword_24C881C50;
  *(void *)(v7 + 32) = 0xD000000000000010;
  *(void *)(v7 + 40) = 0x800000024C881F80;
  *(void *)(v7 + 48) = 1701869940;
  *(void *)(v7 + 56) = 0xE400000000000000;
  *(void *)(v7 + 64) = 0xD000000000000011;
  *(void *)(v7 + 72) = 0x800000024C881FC0;
  *(void *)(v7 + 80) = 0x696C437070417369;
  *(void *)(v7 + 88) = 0xE900000000000070;
  *(void *)(v7 + 96) = 0xD000000000000015;
  *(void *)(v7 + 104) = 0x800000024C881FE0;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[8] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24C873F40;
  uint64_t v9 = v0[5];
  v8[18] = v7;
  v8[19] = v9;
  v8[16] = v4;
  v8[17] = v6;
  return MEMORY[0x270FA2498](sub_24C877994, 0, 0);
}

uint64_t sub_24C873F40(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 72) = a1;
  *(void *)(v3 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_24C874484;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_24C874064;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C874064()
{
  uint64_t v1 = *(void **)(v0 + 72);
  if (!v1)
  {
LABEL_22:
    uint64_t v18 = swift_task_alloc();
    *(void *)(v0 + 88) = v18;
    *(void *)uint64_t v18 = v0;
    *(void *)(v18 + 8) = sub_24C87430C;
    uint64_t v19 = *(void *)(v0 + 16);
    long long v20 = *(_OWORD *)(v0 + 24);
    *(void *)(v18 + 176) = *(void *)(v0 + 40);
    *(_OWORD *)(v18 + 160) = v20;
    *(void *)(v18 + 152) = v19;
    return MEMORY[0x270FA2498](sub_24C8781A8, 0, 0);
  }
  id v2 = v1;
  id v3 = objc_msgSend(v2, sel_installationState);
  id v4 = objc_msgSend(v2, sel_type);
  if (v3) {
    BOOL v5 = v3 == (id)3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5
    || (id v6 = v4, (objc_msgSend(v2, sel_isAppClip) & 1) != 0)
    || (id v7 = objc_msgSend(v2, sel_managementInformation)) != 0
    && ((uint64_t v8 = v7, v9 = (unint64_t)objc_msgSend(v7, sel_state), v8, v9 <= 0x10)
      ? (BOOL v10 = ((1 << v9) & 0x17DF5) == 0)
      : (BOOL v10 = 1),
        !v10)
    || v6 != (id)1)
  {

    goto LABEL_22;
  }
  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24C880FB0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B17CF60);
  char v12 = sub_24C880F90();
  os_log_type_t v13 = sub_24C881040();
  if (os_log_type_enabled(v12, v13))
  {
    BOOL v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v14 = 0;
    _os_log_impl(&dword_24C868000, v12, v13, "Trying to install an existing system app...", v14, 2u);
    MEMORY[0x2532FDAD0](v14, -1, -1);
  }

  sub_24C87BF58();
  swift_allocError();
  *(void *)uint64_t v15 = 0;
  *(void *)(v15 + 8) = 0;
  *(unsigned char *)(v15 + 16) = 3;
  swift_willThrow();

  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_24C87430C()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_24C8744F0;
  }
  else {
    id v2 = sub_24C874420;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C874420()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C874484()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C8744F0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C874554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[6] = a1;
  v5[7] = v4;
  unint64_t v9 = (void *)swift_task_alloc();
  v5[8] = v9;
  *unint64_t v9 = v5;
  v9[1] = sub_24C874618;
  v9[21] = a4;
  v9[22] = v4;
  v9[19] = a1;
  v9[20] = a3;
  return MEMORY[0x270FA2498](sub_24C8781A8, 0, 0);
}

uint64_t sub_24C874618()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24C8750F8;
  }
  else
  {
    uint64_t v4 = swift_task_alloc();
    *(void *)(v2 + 80) = v4;
    *(void *)uint64_t v4 = v2;
    *(void *)(v4 + 8) = sub_24C874778;
    *(_OWORD *)(v4 + 160) = *(_OWORD *)(v2 + 48);
    uint64_t v3 = sub_24C8795E0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24C874778()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 128) = v0;
    uint64_t v4 = sub_24C874FF0;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 88) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C8748E8;
    *(_OWORD *)(v5 + 56) = *(_OWORD *)(v2 + 48);
    uint64_t v4 = sub_24C87A2A4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C8748E8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 128) = v0;
    uint64_t v4 = sub_24C874FF0;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 96) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C874A58;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(v2 + 48);
    uint64_t v4 = sub_24C87A7C8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C874A58()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 128) = v0;
    uint64_t v4 = sub_24C874FF0;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 104) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C874BC8;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(v2 + 48);
    uint64_t v4 = sub_24C87AC34;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C874BC8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 128) = v0;
    uint64_t v4 = sub_24C874FF0;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 112) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C874D38;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(v2 + 48);
    uint64_t v4 = sub_24C87B170;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C874D38()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 128) = v0;
    uint64_t v4 = sub_24C874FF0;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 120) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C874EA8;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(v2 + 48);
    uint64_t v4 = sub_24C87B4A8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C874EA8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 128) = v0;
    return MEMORY[0x270FA2498](sub_24C874FF0, 0, 0);
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_24C874FF0()
{
  uint64_t v1 = *(void *)(v0 + 128);
  *(void *)(v0 + 40) = v1;
  MEMORY[0x2532FD9C0](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCB0);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    int v4 = *(unsigned __int8 *)(v0 + 32);
    if (v4 == 1)
    {
      MEMORY[0x2532FD9B0](v1);
      sub_24C87BF58();
      swift_allocError();
      *(void *)uint64_t v5 = v3;
      *(void *)(v5 + 8) = v2;
      *(unsigned char *)(v5 + 16) = 2;
      swift_willThrow();
    }
    else
    {
      sub_24C8731C4(*(void *)(v0 + 16), *(void *)(v0 + 24), v4);
    }
  }
  MEMORY[0x2532FD9B0](*(void *)(v0 + 40));
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24C8750F8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  *(void *)(v0 + 40) = v1;
  MEMORY[0x2532FD9C0](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCB0);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    int v4 = *(unsigned __int8 *)(v0 + 32);
    if (v4 == 1)
    {
      MEMORY[0x2532FD9B0](v1);
      sub_24C87BF58();
      swift_allocError();
      *(void *)uint64_t v5 = v3;
      *(void *)(v5 + 8) = v2;
      *(unsigned char *)(v5 + 16) = 2;
      swift_willThrow();
    }
    else
    {
      sub_24C8731C4(*(void *)(v0 + 16), *(void *)(v0 + 24), v4);
    }
  }
  MEMORY[0x2532FD9B0](*(void *)(v0 + 40));
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24C875200()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_24C8752A8;
  v2[12] = v0;
  return MEMORY[0x270FA2498](sub_24C87652C, 0, 0);
}

uint64_t sub_24C8752A8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C8753DC, 0, 0);
  }
}

uint64_t sub_24C8753DC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (!v1)
  {
    if (qword_26B17CEB0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24C880FB0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B17CF60);
    uint64_t v8 = sub_24C880F90();
    os_log_type_t v9 = sub_24C881040();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_16;
    }
    BOOL v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v10 = 0;
    uint64_t v11 = "Failed to fetch any bundleIDs for protected apps.";
    goto LABEL_15;
  }
  if (qword_26B17CEC0 == -1)
  {
    if (*(void *)(v1 + 16))
    {
LABEL_4:
      uint64_t v2 = qword_26B17CF90;
      uint64_t v3 = qword_26B17CF88;
      swift_bridgeObjectRetain();
      unint64_t v4 = sub_24C871EBC(v3, v2);
      if (v5)
      {
        uint64_t v6 = *(void *)(*(void *)(v1 + 56) + 8 * v4);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_once();
    if (*(void *)(v1 + 16)) {
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24C880FB0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B17CF60);
  uint64_t v8 = sub_24C880F90();
  os_log_type_t v9 = sub_24C881040();
  if (!os_log_type_enabled(v8, v9)) {
    goto LABEL_16;
  }
  BOOL v10 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)BOOL v10 = 0;
  uint64_t v11 = "No unhideable apps found!";
LABEL_15:
  _os_log_impl(&dword_24C868000, v8, v9, v11, v10, 2u);
  MEMORY[0x2532FDAD0](v10, -1, -1);
LABEL_16:

  uint64_t v6 = 0;
LABEL_17:
  os_log_type_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v13(v6);
}

uint64_t sub_24C875630()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_24C8756D8;
  v2[12] = v0;
  return MEMORY[0x270FA2498](sub_24C87652C, 0, 0);
}

uint64_t sub_24C8756D8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C87580C, 0, 0);
  }
}

uint64_t sub_24C87580C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (!v1)
  {
    if (qword_26B17CEB0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24C880FB0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B17CF60);
    uint64_t v8 = sub_24C880F90();
    os_log_type_t v9 = sub_24C881040();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_16;
    }
    BOOL v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v10 = 0;
    uint64_t v11 = "Failed to fetch any bundleIDs for protected apps.";
    goto LABEL_15;
  }
  if (qword_26B17CC88 == -1)
  {
    if (*(void *)(v1 + 16))
    {
LABEL_4:
      uint64_t v2 = qword_26B17CFA0;
      uint64_t v3 = qword_26B17CF98;
      swift_bridgeObjectRetain();
      unint64_t v4 = sub_24C871EBC(v3, v2);
      if (v5)
      {
        uint64_t v6 = *(void *)(*(void *)(v1 + 56) + 8 * v4);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_once();
    if (*(void *)(v1 + 16)) {
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24C880FB0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B17CF60);
  uint64_t v8 = sub_24C880F90();
  os_log_type_t v9 = sub_24C881040();
  if (!os_log_type_enabled(v8, v9)) {
    goto LABEL_16;
  }
  BOOL v10 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)BOOL v10 = 0;
  uint64_t v11 = "No unlockable apps found!";
LABEL_15:
  _os_log_impl(&dword_24C868000, v8, v9, v11, v10, 2u);
  MEMORY[0x2532FDAD0](v10, -1, -1);
LABEL_16:

  uint64_t v6 = 0;
LABEL_17:
  os_log_type_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v13(v6);
}

uint64_t sub_24C875A60()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_24C875B08;
  v2[12] = v0;
  return MEMORY[0x270FA2498](sub_24C87652C, 0, 0);
}

uint64_t sub_24C875B08(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C875C3C, 0, 0);
  }
}

uint64_t sub_24C875C3C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    if (qword_26B17CEC0 == -1)
    {
      if (*(void *)(v1 + 16))
      {
LABEL_4:
        uint64_t v2 = qword_26B17CF90;
        uint64_t v3 = qword_26B17CF88;
        swift_bridgeObjectRetain();
        unint64_t v4 = sub_24C871EBC(v3, v2);
        if (v5)
        {
          uint64_t v6 = *(void *)(*(void *)(v1 + 56) + 8 * v4);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v7 = sub_24C87F01C(v6);
        }
        else
        {
          uint64_t v7 = MEMORY[0x263F8EE88];
        }
        swift_bridgeObjectRelease();
LABEL_15:
        if (qword_26B17CC88 == -1)
        {
          if (!*(void *)(v1 + 16)) {
            goto LABEL_21;
          }
        }
        else
        {
          swift_once();
          if (!*(void *)(v1 + 16)) {
            goto LABEL_21;
          }
        }
        uint64_t v13 = qword_26B17CFA0;
        uint64_t v14 = qword_26B17CF98;
        swift_bridgeObjectRetain();
        unint64_t v15 = sub_24C871EBC(v14, v13);
        if (v16)
        {
          uint64_t v17 = *(void *)(*(void *)(v1 + 56) + 8 * v15);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v18 = sub_24C87F01C(v17);
          swift_bridgeObjectRelease();
LABEL_22:
          uint64_t v19 = sub_24C87CD08(v18, v7);
          swift_bridgeObjectRelease();
          uint64_t v12 = sub_24C87E138(v19);
          swift_release();
          goto LABEL_23;
        }
        swift_bridgeObjectRelease();
LABEL_21:
        swift_bridgeObjectRelease();
        uint64_t v18 = MEMORY[0x263F8EE88];
        goto LABEL_22;
      }
    }
    else
    {
      swift_once();
      if (*(void *)(v1 + 16)) {
        goto LABEL_4;
      }
    }
    uint64_t v7 = MEMORY[0x263F8EE88];
    goto LABEL_15;
  }
  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24C880FB0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B17CF60);
  os_log_type_t v9 = sub_24C880F90();
  os_log_type_t v10 = sub_24C881040();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_24C868000, v9, v10, "Failed to fetch any bundleIDs for protected apps.", v11, 2u);
    MEMORY[0x2532FDAD0](v11, -1, -1);
  }

  uint64_t v12 = 0;
LABEL_23:
  long long v20 = *(uint64_t (**)(void *))(v0 + 8);
  return v20(v12);
}

uint64_t sub_24C875EFC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_24C875FA4;
  v2[12] = v0;
  return MEMORY[0x270FA2498](sub_24C87652C, 0, 0);
}

uint64_t sub_24C875FA4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 24) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C8760D8, 0, 0);
  }
}

uint64_t sub_24C8760D8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    if (qword_26B17CEC0 == -1)
    {
      if (*(void *)(v1 + 16))
      {
LABEL_4:
        uint64_t v2 = qword_26B17CF90;
        uint64_t v3 = qword_26B17CF88;
        swift_bridgeObjectRetain();
        unint64_t v4 = sub_24C871EBC(v3, v2);
        if (v5)
        {
          uint64_t v6 = *(void *)(*(void *)(v1 + 56) + 8 * v4);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v7 = sub_24C87F01C(v6);
        }
        else
        {
          uint64_t v7 = MEMORY[0x263F8EE88];
        }
        swift_bridgeObjectRelease();
LABEL_15:
        if (qword_26B17CC88 == -1)
        {
          if (!*(void *)(v1 + 16)) {
            goto LABEL_21;
          }
        }
        else
        {
          swift_once();
          if (!*(void *)(v1 + 16)) {
            goto LABEL_21;
          }
        }
        uint64_t v13 = qword_26B17CFA0;
        uint64_t v14 = qword_26B17CF98;
        swift_bridgeObjectRetain();
        unint64_t v15 = sub_24C871EBC(v14, v13);
        if (v16)
        {
          uint64_t v17 = *(void *)(*(void *)(v1 + 56) + 8 * v15);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v18 = sub_24C87F01C(v17);
          swift_bridgeObjectRelease();
LABEL_22:
          uint64_t v19 = sub_24C87638C(v18, v7);
          uint64_t v12 = sub_24C87E138(v19);
          swift_bridgeObjectRelease();
          goto LABEL_23;
        }
        swift_bridgeObjectRelease();
LABEL_21:
        swift_bridgeObjectRelease();
        uint64_t v18 = MEMORY[0x263F8EE88];
        goto LABEL_22;
      }
    }
    else
    {
      swift_once();
      if (*(void *)(v1 + 16)) {
        goto LABEL_4;
      }
    }
    uint64_t v7 = MEMORY[0x263F8EE88];
    goto LABEL_15;
  }
  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24C880FB0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B17CF60);
  os_log_type_t v9 = sub_24C880F90();
  os_log_type_t v10 = sub_24C881040();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_24C868000, v9, v10, "No unlockable or unhideable apps found!", v11, 2u);
    MEMORY[0x2532FDAD0](v11, -1, -1);
  }

  uint64_t v12 = 0;
LABEL_23:
  long long v20 = *(uint64_t (**)(void *))(v0 + 8);
  return v20(v12);
}

uint64_t sub_24C87638C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    uint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_24C87C878(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24C87650C()
{
  *(void *)(v1 + 96) = v0;
  return MEMORY[0x270FA2498](sub_24C87652C, 0, 0);
}

uint64_t sub_24C87652C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCA0);
  uint64_t v1 = swift_allocObject();
  v0[13] = v1;
  *(_OWORD *)(v1 + 16) = xmmword_24C881C60;
  if (qword_26B17CEC0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26B17CF90;
  *(void *)(v1 + 32) = qword_26B17CF88;
  *(void *)(v1 + 40) = v2;
  uint64_t v3 = qword_26B17CC88;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_26B17CFA0;
  *(void *)(v1 + 48) = qword_26B17CF98;
  *(void *)(v1 + 56) = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[14] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C876690;
  uint64_t v6 = v0[12];
  v5[16] = v1;
  v5[17] = v6;
  return MEMORY[0x270FA2498](sub_24C8770FC, 0, 0);
}

uint64_t sub_24C876690(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 120) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C8767E4, 0, 0);
  }
}

uint64_t sub_24C8767E4()
{
  int64_t v71 = v0;
  uint64_t v1 = *(void *)(v0 + 120);
  if (!v1)
  {
    if (qword_26B17CEB0 != -1) {
LABEL_72:
    }
      swift_once();
    uint64_t v59 = sub_24C880FB0();
    __swift_project_value_buffer(v59, (uint64_t)qword_26B17CF60);
    v60 = sub_24C880F90();
    os_log_type_t v61 = sub_24C881040();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v62 = 0;
      _os_log_impl(&dword_24C868000, v60, v61, "DMF Fetch Apps request returned nil without error!", v62, 2u);
      MEMORY[0x2532FDAD0](v62, -1, -1);
    }

    unint64_t v7 = 0;
LABEL_61:
    v63 = *(uint64_t (**)(void *))(v0 + 8);
    return v63(v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C881C60;
  uint64_t v3 = qword_26B17CF90;
  *(void *)(inited + 32) = qword_26B17CF88;
  *(void *)(inited + 40) = v3;
  uint64_t v4 = MEMORY[0x263F8EE78];
  uint64_t v5 = qword_26B17CF98;
  uint64_t v6 = qword_26B17CFA0;
  *(void *)(inited + 48) = MEMORY[0x263F8EE78];
  *(void *)(inited + 56) = v5;
  *(void *)(inited + 64) = v6;
  *(void *)(inited + 72) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v7 = (void *)sub_24C876EA4(inited);
  int64_t v0 = 0;
  uint64_t v66 = v1;
  uint64_t v67 = v1 + 64;
  uint64_t v8 = -1;
  uint64_t v9 = -1 << *(unsigned char *)(v1 + 32);
  if (-v9 < 64) {
    uint64_t v8 = ~(-1 << -(char)v9);
  }
  unint64_t v10 = v8 & *(void *)(v1 + 64);
  int64_t v68 = (unint64_t)(63 - v9) >> 6;
  uint64_t v11 = &off_2652EC000;
  uint64_t v12 = &off_2652EC000;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v0 << 6);
    }
    else
    {
      int64_t v15 = v0 + 1;
      if (__OFADD__(v0, 1))
      {
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
      if (v15 >= v68) {
        goto LABEL_56;
      }
      unint64_t v16 = *(void *)(v67 + 8 * v15);
      ++v0;
      if (!v16)
      {
        int64_t v0 = v15 + 1;
        if (v15 + 1 >= v68) {
          goto LABEL_56;
        }
        unint64_t v16 = *(void *)(v67 + 8 * v0);
        if (!v16)
        {
          int64_t v0 = v15 + 2;
          if (v15 + 2 >= v68) {
            goto LABEL_56;
          }
          unint64_t v16 = *(void *)(v67 + 8 * v0);
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v68) {
              goto LABEL_56;
            }
            unint64_t v16 = *(void *)(v67 + 8 * v17);
            if (!v16)
            {
              while (1)
              {
                int64_t v0 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_71;
                }
                if (v0 >= v68) {
                  goto LABEL_56;
                }
                unint64_t v16 = *(void *)(v67 + 8 * v0);
                ++v17;
                if (v16) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v0 = v17;
          }
        }
      }
LABEL_21:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v0 << 6);
    }
    uint64_t v18 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v14);
    uint64_t v19 = v18[1];
    uint64_t v69 = *v18;
    long long v20 = *(void **)(*(void *)(v1 + 56) + 8 * v14);
    swift_bridgeObjectRetain();
    id v21 = v20;
    id v22 = [v21 (SEL)v11[112]];

    if (v22) {
      break;
    }
LABEL_37:
    id v41 = [v21 (SEL)v12[113]];

    if (v41)
    {
      id v23 = [v21 (SEL)v12[113]];
      if (!v23) {
        goto LABEL_74;
      }
      v42 = v23;
      unsigned __int8 v43 = objc_msgSend(v23, sel_BOOLValue);

      if ((v43 & 1) == 0)
      {
        uint64_t v45 = qword_26B17CF98;
        uint64_t v44 = qword_26B17CFA0;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v70 = v7;
        swift_bridgeObjectRetain();
        unint64_t v48 = sub_24C871EBC(v45, v44);
        uint64_t v49 = v7[2];
        BOOL v50 = (v47 & 1) == 0;
        uint64_t v51 = v49 + v50;
        if (__OFADD__(v49, v50)) {
          goto LABEL_69;
        }
        char v52 = v47;
        if (v7[3] >= v51)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            uint64_t v12 = &off_2652EC000;
            if ((v47 & 1) == 0) {
              goto LABEL_55;
            }
          }
          else
          {
            unint64_t v7 = &v70;
            sub_24C87DF80();
            uint64_t v12 = &off_2652EC000;
            if ((v52 & 1) == 0)
            {
LABEL_55:
              __break(1u);
LABEL_56:
              swift_release();
              int64_t v0 = v65;
              goto LABEL_61;
            }
          }
        }
        else
        {
          sub_24C87DC68(v51, isUniquelyReferenced_nonNull_native);
          unint64_t v7 = v70;
          unint64_t v53 = sub_24C871EBC(v45, v44);
          if ((v52 & 1) != (v54 & 1))
          {
LABEL_64:
            id v23 = (id)MEMORY[0x263F8D310];
            return MEMORY[0x270F9FB18](v23);
          }
          unint64_t v48 = v53;
          uint64_t v12 = &off_2652EC000;
          if ((v52 & 1) == 0) {
            goto LABEL_55;
          }
        }
        v55 = *(void **)(v70[7] + 8 * v48);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v55 = sub_24C87BFAC(0, v55[2] + 1, 1, v55);
        }
        unint64_t v57 = v55[2];
        unint64_t v56 = v55[3];
        if (v57 >= v56 >> 1) {
          v55 = sub_24C87BFAC((void *)(v56 > 1), v57 + 1, 1, v55);
        }
        v55[2] = v57 + 1;
        v58 = &v55[2 * v57];
        v58[4] = v69;
        v58[5] = v19;
        unint64_t v7 = v70;
        *(void *)(v70[7] + 8 * v48) = v55;
        swift_bridgeObjectRelease();
        uint64_t v1 = v66;
        uint64_t v11 = &off_2652EC000;
      }
    }

    swift_bridgeObjectRelease();
  }
  id v23 = [v21 (SEL)v11[112]];
  if (v23)
  {
    uint64_t v24 = v23;
    unsigned __int8 v25 = objc_msgSend(v23, sel_BOOLValue);

    if ((v25 & 1) == 0)
    {
      uint64_t v27 = qword_26B17CF88;
      uint64_t v26 = qword_26B17CF90;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v28 = swift_isUniquelyReferenced_nonNull_native();
      v70 = v7;
      swift_bridgeObjectRetain();
      unint64_t v30 = sub_24C871EBC(v27, v26);
      uint64_t v31 = v7[2];
      BOOL v32 = (v29 & 1) == 0;
      uint64_t v33 = v31 + v32;
      if (__OFADD__(v31, v32)) {
        goto LABEL_68;
      }
      char v34 = v29;
      if (v7[3] >= v33)
      {
        if (v28)
        {
          uint64_t v12 = &off_2652EC000;
          if ((v29 & 1) == 0) {
            goto LABEL_70;
          }
        }
        else
        {
          sub_24C87DF80();
          uint64_t v12 = &off_2652EC000;
          if ((v34 & 1) == 0) {
            goto LABEL_70;
          }
        }
      }
      else
      {
        sub_24C87DC68(v33, v28);
        unint64_t v35 = sub_24C871EBC(v27, v26);
        if ((v34 & 1) != (v36 & 1)) {
          goto LABEL_64;
        }
        unint64_t v30 = v35;
        uint64_t v12 = &off_2652EC000;
        if ((v34 & 1) == 0) {
          goto LABEL_70;
        }
      }
      v37 = *(void **)(v70[7] + 8 * v30);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v37 = sub_24C87BFAC(0, v37[2] + 1, 1, v37);
      }
      unint64_t v39 = v37[2];
      unint64_t v38 = v37[3];
      if (v39 >= v38 >> 1) {
        v37 = sub_24C87BFAC((void *)(v38 > 1), v39 + 1, 1, v37);
      }
      v37[2] = v39 + 1;
      v40 = &v37[2 * v39];
      v40[4] = v69;
      v40[5] = v19;
      unint64_t v7 = v70;
      *(void *)(v70[7] + 8 * v30) = v37;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v1 = v66;
      uint64_t v11 = &off_2652EC000;
    }
    goto LABEL_37;
  }
  __break(1u);
LABEL_74:
  __break(1u);
  return MEMORY[0x270F9FB18](v23);
}

unint64_t sub_24C876EA4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED8);
  uint64_t v2 = (void *)sub_24C881120();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24C871EBC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_24C876FC0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CD8);
  uint64_t v2 = (void *)sub_24C881120();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_24C871EBC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

uint64_t sub_24C8770DC(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return MEMORY[0x270FA2498](sub_24C8770FC, 0, 0);
}

uint64_t sub_24C8770FC()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39D40]), sel_init);
  v0[18] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = v0[17];
    objc_msgSend(v1, sel_setType_, 3);
    objc_msgSend(v2, sel_setManagedAppsOnly_, 1);
    uint64_t v4 = (void *)sub_24C881010();
    objc_msgSend(v2, sel_setPropertyKeys_, v4);

    uint64_t v5 = *(void **)(v3 + 16);
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_24C877374;
    uint64_t v6 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_24C8778AC;
    v0[13] = &block_descriptor_36;
    v0[14] = v6;
    objc_msgSend(v5, sel_performRequest_completion_, v2, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    if (qword_26B17CEB0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24C880FB0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B17CF60);
    uint64_t v8 = sub_24C880F90();
    os_log_type_t v9 = sub_24C881040();
    if (os_log_type_enabled(v8, v9))
    {
      unint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl(&dword_24C868000, v8, v9, "Failed to create DMF Fetch Apps Request", v10, 2u);
      MEMORY[0x2532FDAD0](v10, -1, -1);
    }

    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11(0);
  }
}

uint64_t sub_24C877374()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_24C877668;
  }
  else {
    uint64_t v2 = sub_24C877484;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C877484()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = (void *)v0[15];
  id v3 = v2;

  if (v2)
  {
    self;
    uint64_t v4 = (void *)swift_dynamicCastObjCClass();
    if (v4)
    {
      uint64_t v5 = (void *)v0[18];
      id v6 = objc_msgSend(v4, sel_appsByBundleIdentifier);
      sub_24C87C83C(0, &qword_26B17CC98);
      uint64_t v7 = sub_24C880FC0();

      goto LABEL_11;
    }
  }
  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24C880FB0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B17CF60);
  os_log_type_t v9 = sub_24C880F90();
  os_log_type_t v10 = sub_24C881040();
  BOOL v11 = os_log_type_enabled(v9, v10);
  BOOL v12 = (void *)v0[18];
  if (v11)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_24C868000, v9, v10, "Failed to cast DMFFetchAppsRequest result object as DMFFetchAppsResultObject object. Fatal error", v13, 2u);
    MEMORY[0x2532FDAD0](v13, -1, -1);
  }
  else
  {
  }
  uint64_t v7 = 0;
LABEL_11:
  unint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(v7);
}

uint64_t sub_24C877668()
{
  uint64_t v1 = (void *)v0[18];
  swift_willThrow();

  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v3 = sub_24C880FB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B17CF60);
  MEMORY[0x2532FD9C0](v2);
  MEMORY[0x2532FD9C0](v2);
  uint64_t v4 = sub_24C880F90();
  os_log_type_t v5 = sub_24C881040();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[19];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    MEMORY[0x2532FD9C0](v7);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v10;
    sub_24C881070();
    *os_log_type_t v9 = v10;
    MEMORY[0x2532FD9B0](v7);
    MEMORY[0x2532FD9B0](v7);
    _os_log_impl(&dword_24C868000, v4, v5, "Fetch Apps request to DMFConnection failed with error: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED0);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v9, -1, -1);
    MEMORY[0x2532FDAD0](v8, -1, -1);
  }
  else
  {
    MEMORY[0x2532FD9B0](v0[19]);
    MEMORY[0x2532FD9B0](v7);
  }
  BOOL v12 = (void *)v0[18];
  uint64_t v11 = v0[19];

  sub_24C87BF58();
  swift_allocError();
  *(void *)uint64_t v13 = v11;
  *(void *)(v13 + 8) = 0;
  *(unsigned char *)(v13 + 16) = 0;
  MEMORY[0x2532FD9C0](v11);
  swift_willThrow();

  MEMORY[0x2532FD9B0](v11);
  unint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24C8778AC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCB0);
    uint64_t v5 = swift_allocError();
    *BOOL v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    uint64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_24C87C774((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_24C877970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[18] = a3;
  v4[19] = v3;
  v4[16] = a1;
  v4[17] = a2;
  return MEMORY[0x270FA2498](sub_24C877994, 0, 0);
}

uint64_t sub_24C877994()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39D40]), sel_init);
  v0[20] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = v0[19];
    uint64_t v5 = v0[16];
    uint64_t v4 = v0[17];
    objc_msgSend(v1, sel_setType_, 3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCA0);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_24C881C70;
    *(void *)(v6 + 32) = v5;
    *(void *)(v6 + 40) = v4;
    swift_bridgeObjectRetain();
    id v7 = (void *)sub_24C881010();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setBundleIdentifiers_, v7);

    uint64_t v8 = (void *)sub_24C881010();
    objc_msgSend(v2, sel_setPropertyKeys_, v8);

    id v9 = *(void **)(v3 + 16);
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_24C877C8C;
    uint64_t v10 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_24C8778AC;
    v0[13] = &block_descriptor_34;
    v0[14] = v10;
    objc_msgSend(v9, sel_performRequest_completion_, v2, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    if (qword_26B17CEB0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24C880FB0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26B17CF60);
    BOOL v12 = sub_24C880F90();
    os_log_type_t v13 = sub_24C881040();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v14 = 0;
      _os_log_impl(&dword_24C868000, v12, v13, "Failed to create fetch request", v14, 2u);
      MEMORY[0x2532FDAD0](v14, -1, -1);
    }

    int64_t v15 = (uint64_t (*)(void))v0[1];
    return v15(0);
  }
}

uint64_t sub_24C877C8C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    uint64_t v2 = sub_24C877ED0;
  }
  else {
    uint64_t v2 = sub_24C877D9C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C877D9C()
{
  uint64_t v1 = *(void **)(v0 + 160);
  uint64_t v2 = *(void **)(v0 + 120);
  id v3 = v2;

  if (v2)
  {
    self;
    uint64_t v4 = (void *)swift_dynamicCastObjCClass();
    uint64_t v5 = *(void **)(v0 + 160);
    if (v4)
    {
      id v6 = objc_msgSend(v4, sel_appsByBundleIdentifier);
      sub_24C87C83C(0, &qword_26B17CC98);
      uint64_t v7 = sub_24C880FC0();

      uint64_t v8 = sub_24C878114(v7);
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v8 = 0;
LABEL_7:
  id v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(v8);
}

uint64_t sub_24C877ED0()
{
  uint64_t v1 = (void *)v0[20];
  swift_willThrow();

  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[21];
  uint64_t v3 = sub_24C880FB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B17CF60);
  MEMORY[0x2532FD9C0](v2);
  MEMORY[0x2532FD9C0](v2);
  uint64_t v4 = sub_24C880F90();
  os_log_type_t v5 = sub_24C881040();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[21];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    MEMORY[0x2532FD9C0](v7);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v10;
    sub_24C881070();
    *id v9 = v10;
    MEMORY[0x2532FD9B0](v7);
    MEMORY[0x2532FD9B0](v7);
    _os_log_impl(&dword_24C868000, v4, v5, "Failed to fetch apps with error: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED0);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v9, -1, -1);
    MEMORY[0x2532FDAD0](v8, -1, -1);
  }
  else
  {
    MEMORY[0x2532FD9B0](v0[21]);
    MEMORY[0x2532FD9B0](v7);
  }
  BOOL v12 = (void *)v0[20];
  uint64_t v11 = v0[21];

  sub_24C87BF58();
  swift_allocError();
  *(void *)uint64_t v13 = v11;
  *(void *)(v13 + 8) = 0;
  *(unsigned char *)(v13 + 16) = 0;
  MEMORY[0x2532FD9C0](v11);
  swift_willThrow();

  MEMORY[0x2532FD9B0](v11);
  unint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24C878114(uint64_t a1)
{
  uint64_t result = sub_24C87E220(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  os_log_type_t v5 = (void *)sub_24C87E4A8(result, v3, 0, a1);
  id v6 = v5;
  return (uint64_t)v5;
}

uint64_t sub_24C878184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[21] = a3;
  v4[22] = v3;
  v4[19] = a1;
  v4[20] = a2;
  return MEMORY[0x270FA2498](sub_24C8781A8, 0, 0);
}

uint64_t sub_24C8781A8()
{
  unsigned __int8 v43 = v0;
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39DA8]), sel_init);
  v0[23] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void *)v0[19];
    sub_24C87C83C(0, &qword_2697F7CC8);
    id v4 = v2;
    os_log_type_t v5 = (void *)sub_24C881050();
    objc_msgSend(v4, sel_setInternal_, v5);

    uint64_t v6 = v3[3];
    uint64_t v7 = v3[5];
    __swift_project_boxed_opaque_existential_5Tm(v3, v6);
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    id v9 = v4;
    v8(v6, v7);
    uint64_t v10 = (void *)sub_24C880FD0();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setBundleIdentifier_, v10);

    uint64_t v11 = (void *)sub_24C880FD0();
    objc_msgSend(v9, sel_setSourceIdentifier_, v11);

    uint64_t v12 = v3[3];
    uint64_t v13 = v3[5];
    __swift_project_boxed_opaque_existential_5Tm(v3, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v12, v13);
    if (v14)
    {
      int64_t v15 = (void *)sub_24C880FD0();
      swift_bridgeObjectRelease();
    }
    else
    {
      int64_t v15 = 0;
    }
    uint64_t v25 = v0[21];
    objc_msgSend(v9, sel_setOriginator_, v15);

    id v26 = v9;
    if (v25) {
      uint64_t v27 = (void *)sub_24C880FD0();
    }
    else {
      uint64_t v27 = 0;
    }
    char v28 = (void *)v0[19];
    objc_msgSend(v9, sel_setPersonaIdentifier_, v27);

    uint64_t v29 = v3[3];
    uint64_t v30 = v3[7];
    __swift_project_boxed_opaque_existential_5Tm(v28, v29);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v30 + 8))(v42, v29, v30);
    uint64_t v31 = (void *)sub_24C881050();
    objc_msgSend(v9, sel_setRemovable_, v31);

    uint64_t v33 = v3[3];
    uint64_t v32 = v3[4];
    __swift_project_boxed_opaque_existential_5Tm(v28, v33);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v32 + 8))(v42, v33, v32);
    if (LOBYTE(v42[0]) == 2)
    {
      uint64_t v34 = 1;
    }
    else if (v42[0])
    {
      uint64_t v34 = 1;
    }
    else
    {
      uint64_t v34 = 5;
    }
    uint64_t v35 = v0[22];
    objc_msgSend(v9, sel_setManagementOptions_, v34);
    char v36 = *(void **)(v35 + 16);
    v0[2] = v0;
    v0[7] = v0 + 18;
    v0[3] = sub_24C878784;
    uint64_t v37 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_24C8778AC;
    v0[13] = &block_descriptor_32;
    v0[14] = v37;
    objc_msgSend(v36, sel_performRequest_completion_, v9, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    if (qword_26B17CEB0 != -1) {
      swift_once();
    }
    uint64_t v16 = v0[19];
    uint64_t v17 = sub_24C880FB0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B17CF60);
    sub_24C87BEF4(v16, (uint64_t)(v0 + 10));
    uint64_t v18 = sub_24C880F90();
    os_log_type_t v19 = sub_24C881040();
    if (os_log_type_enabled(v18, v19))
    {
      long long v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      v42[0] = v41;
      *(_DWORD *)long long v20 = 136315138;
      uint64_t v21 = v0[13];
      uint64_t v22 = v0[15];
      __swift_project_boxed_opaque_existential_5Tm(v0 + 10, v21);
      uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22);
      v0[18] = sub_24C87C0BC(v23, v24, v42);
      sub_24C881070();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_4((uint64_t)(v0 + 10));
      _os_log_impl(&dword_24C868000, v18, v19, "Unable to create DMFMDMv1StartManagingAppRequest for %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2532FDAD0](v41, -1, -1);
      MEMORY[0x2532FDAD0](v20, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_4((uint64_t)(v0 + 10));
    }

    sub_24C87BF58();
    swift_allocError();
    *(void *)uint64_t v38 = 0;
    *(void *)(v38 + 8) = 0;
    *(unsigned char *)(v38 + 16) = 1;
    swift_willThrow();
    unint64_t v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
}

uint64_t sub_24C878784()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 192) = v1;
  if (v1) {
    uint64_t v2 = sub_24C878908;
  }
  else {
    uint64_t v2 = sub_24C878894;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C878894()
{
  uint64_t v1 = (void *)v0[23];

  uint64_t v2 = (void *)v0[18];
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24C878908()
{
  uint64_t v1 = (void *)v0[23];
  swift_willThrow();

  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[24];
  uint64_t v3 = sub_24C880FB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B17CF60);
  MEMORY[0x2532FD9C0](v2);
  MEMORY[0x2532FD9C0](v2);
  uint64_t v4 = sub_24C880F90();
  os_log_type_t v5 = sub_24C881040();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[24];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    MEMORY[0x2532FD9C0](v7);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v10;
    sub_24C881070();
    *id v9 = v10;
    MEMORY[0x2532FD9B0](v7);
    MEMORY[0x2532FD9B0](v7);
    _os_log_impl(&dword_24C868000, v4, v5, "Failed to perform start managing request with error: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED0);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v9, -1, -1);
    MEMORY[0x2532FDAD0](v8, -1, -1);
  }
  else
  {
    MEMORY[0x2532FD9B0](v0[24]);
    MEMORY[0x2532FD9B0](v7);
  }
  uint64_t v12 = (void *)v0[23];
  uint64_t v11 = v0[24];

  sub_24C87BF58();
  swift_allocError();
  *(void *)uint64_t v13 = v11;
  *(void *)(v13 + 8) = 0;
  *(unsigned char *)(v13 + 16) = 1;
  MEMORY[0x2532FD9C0](v11);
  swift_willThrow();

  MEMORY[0x2532FD9B0](v11);
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24C878B54(uint64_t a1)
{
  *(void *)(v2 + 208) = a1;
  *(void *)(v2 + 216) = v1;
  return MEMORY[0x270FA2498](sub_24C878B74, 0, 0);
}

uint64_t sub_24C878B74()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  uint64_t v6 = v5;
  v0[28] = v5;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[29] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24C878C54;
  return sub_24C8739F8(v4, v6);
}

uint64_t sub_24C878C54(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 240) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24C879344;
  }
  else
  {
    swift_bridgeObjectRelease();
    *(unsigned char *)(v4 + 272) = a1;
    uint64_t v5 = sub_24C878D84;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24C878D84()
{
  if (*((unsigned char *)v0 + 272) == 2)
  {
    id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39E70]), sel_init);
    v0[31] = v1;
    if (v1)
    {
      uint64_t v2 = (void *)v0[26];
      uint64_t v3 = v2[3];
      uint64_t v4 = v2[5];
      __swift_project_boxed_opaque_existential_5Tm(v2, v3);
      uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
      id v6 = v1;
      v5(v3, v4);
      uint64_t v7 = (void *)sub_24C880FD0();
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_setBundleIdentifier_, v7);

      id v8 = v6;
      uint64_t v9 = (void *)sub_24C880FD0();
      objc_msgSend(v8, sel_setSourceIdentifier_, v9);
    }
    id v10 = objc_msgSend(self, sel_currentUserConnection);
    v0[32] = v10;
    if (v10)
    {
      uint64_t v11 = v10;
      v0[2] = v0;
      v0[7] = v0 + 23;
      v0[3] = sub_24C878FE4;
      uint64_t v12 = swift_continuation_init();
      v0[18] = MEMORY[0x263EF8330];
      v0[19] = 0x40000000;
      v0[20] = sub_24C8778AC;
      v0[21] = &block_descriptor_42;
      v0[22] = v12;
      objc_msgSend(v11, sel_performRequest_completion_, v1, v0 + 18);
      id v10 = v0 + 2;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA23F0](v10);
  }
  else
  {
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_24C878FE4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 264) = v1;
  if (v1) {
    uint64_t v2 = sub_24C8793A8;
  }
  else {
    uint64_t v2 = sub_24C8790F4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C8790F4()
{
  uint64_t v18 = v0;
  uint64_t v1 = *(void **)(v0 + 184);

  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = sub_24C880FB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B17CF60);
  sub_24C87BEF4(v2, v0 + 80);
  uint64_t v4 = sub_24C880F90();
  os_log_type_t v5 = sub_24C881030();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 256);
  if (v6)
  {
    uint64_t v16 = *(void **)(v0 + 248);
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)id v8 = 136446210;
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v10 = *(void *)(v0 + 120);
    __swift_project_boxed_opaque_existential_5Tm((void *)(v0 + 80), v9);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    *(void *)(v0 + 200) = sub_24C87C0BC(v11, v12, &v17);
    sub_24C881070();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4(v0 + 80);
    _os_log_impl(&dword_24C868000, v4, v5, "Removed DMF app data for: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v15, -1, -1);
    MEMORY[0x2532FDAD0](v8, -1, -1);
  }
  else
  {

    __swift_destroy_boxed_opaque_existential_4(v0 + 80);
  }
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_24C879344()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C8793A8()
{
  uint64_t v1 = (void *)v0[31];
  swift_willThrow();

  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[33];
  uint64_t v3 = sub_24C880FB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B17CF60);
  MEMORY[0x2532FD9C0](v2);
  MEMORY[0x2532FD9C0](v2);
  uint64_t v4 = sub_24C880F90();
  os_log_type_t v5 = sub_24C881040();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[33];
  if (v6)
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138412290;
    MEMORY[0x2532FD9C0](v7);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[24] = v10;
    sub_24C881070();
    *uint64_t v9 = v10;
    MEMORY[0x2532FD9B0](v7);
    MEMORY[0x2532FD9B0](v7);
    _os_log_impl(&dword_24C868000, v4, v5, "Failed to remove DMF app data: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED0);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v9, -1, -1);
    MEMORY[0x2532FDAD0](v8, -1, -1);
  }
  else
  {
    MEMORY[0x2532FD9B0](v0[33]);
    MEMORY[0x2532FD9B0](v7);
  }
  uint64_t v11 = (void *)v0[32];
  unint64_t v12 = (void *)v0[31];

  swift_willThrow();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_24C8795C0(uint64_t a1)
{
  *(void *)(v2 + 160) = a1;
  *(void *)(v2 + 168) = v1;
  return MEMORY[0x270FA2498](sub_24C8795E0, 0, 0);
}

uint64_t sub_24C8795E0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39E20]), sel_init);
  *(void *)(v0 + 176) = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (_OWORD *)(v0 + 80);
    uint64_t v4 = *(void **)(v0 + 160);
    uint64_t v5 = v4[3];
    uint64_t v6 = v4[5];
    __swift_project_boxed_opaque_existential_5Tm(v4, v5);
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 80);
    id v8 = v2;
    uint64_t v9 = v7(v5, v6);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_24C880FE0();
      if (*(void *)(v10 + 16) && (unint64_t v13 = sub_24C871EBC(v11, v12), (v14 & 1) != 0))
      {
        sub_24C87C34C(*(void *)(v10 + 56) + 32 * v13, v0 + 80);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 104))
        {
          if (swift_dynamicCast())
          {
            uint64_t v15 = (void *)sub_24C880FD0();
            swift_bridgeObjectRelease();
            goto LABEL_15;
          }
LABEL_14:
          uint64_t v15 = 0;
LABEL_15:
          uint64_t v19 = *(void **)(v0 + 160);
          objc_msgSend(v8, sel_setVPNUUIDString_, v15);

          uint64_t v20 = v4[3];
          uint64_t v21 = v4[5];
          __swift_project_boxed_opaque_existential_5Tm(v19, v20);
          uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 80))(v20, v21);
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = sub_24C880FE0();
            if (*(void *)(v23 + 16) && (unint64_t v26 = sub_24C871EBC(v24, v25), (v27 & 1) != 0))
            {
              sub_24C87C34C(*(void *)(v23 + 56) + 32 * v26, v0 + 80);
            }
            else
            {
              *uint64_t v3 = 0u;
              *(_OWORD *)(v0 + 96) = 0u;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (*(void *)(v0 + 104))
            {
              if (swift_dynamicCast())
              {
                char v28 = (void *)sub_24C880FD0();
                swift_bridgeObjectRelease();
                goto LABEL_26;
              }
LABEL_25:
              char v28 = 0;
LABEL_26:
              uint64_t v29 = *(void **)(v0 + 160);
              objc_msgSend(v8, sel_setCellularSliceUUIDString_, v28);

              uint64_t v30 = v4[3];
              uint64_t v31 = v4[5];
              __swift_project_boxed_opaque_existential_5Tm(v29, v30);
              uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 80))(v30, v31);
              if (v32)
              {
                uint64_t v33 = v32;
                uint64_t v34 = sub_24C880FE0();
                if (*(void *)(v33 + 16) && (unint64_t v36 = sub_24C871EBC(v34, v35), (v37 & 1) != 0))
                {
                  sub_24C87C34C(*(void *)(v33 + 56) + 32 * v36, v0 + 80);
                }
                else
                {
                  *uint64_t v3 = 0u;
                  *(_OWORD *)(v0 + 96) = 0u;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (*(void *)(v0 + 104))
                {
                  if (swift_dynamicCast())
                  {
                    uint64_t v38 = (void *)sub_24C880FD0();
                    swift_bridgeObjectRelease();
                    goto LABEL_37;
                  }
LABEL_36:
                  uint64_t v38 = 0;
LABEL_37:
                  unint64_t v39 = *(void **)(v0 + 160);
                  objc_msgSend(v8, sel_setContentFilterUUIDString_, v38);

                  uint64_t v40 = v4[3];
                  uint64_t v41 = v4[5];
                  __swift_project_boxed_opaque_existential_5Tm(v39, v40);
                  uint64_t v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 80))(v40, v41);
                  if (v42)
                  {
                    uint64_t v43 = v42;
                    uint64_t v44 = sub_24C880FE0();
                    if (*(void *)(v43 + 16) && (unint64_t v46 = sub_24C871EBC(v44, v45), (v47 & 1) != 0))
                    {
                      sub_24C87C34C(*(void *)(v43 + 56) + 32 * v46, v0 + 80);
                    }
                    else
                    {
                      *uint64_t v3 = 0u;
                      *(_OWORD *)(v0 + 96) = 0u;
                    }
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if (*(void *)(v0 + 104))
                    {
                      if (swift_dynamicCast())
                      {
                        unint64_t v48 = (void *)sub_24C880FD0();
                        swift_bridgeObjectRelease();
                        goto LABEL_48;
                      }
LABEL_47:
                      unint64_t v48 = 0;
LABEL_48:
                      uint64_t v49 = *(void **)(v0 + 160);
                      objc_msgSend(v8, sel_setDNSProxyUUIDString_, v48);

                      uint64_t v50 = v4[3];
                      uint64_t v51 = v4[5];
                      __swift_project_boxed_opaque_existential_5Tm(v49, v50);
                      uint64_t v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 80))(v50, v51);
                      if (v52)
                      {
                        uint64_t v53 = v52;
                        uint64_t v54 = sub_24C880FE0();
                        if (*(void *)(v53 + 16) && (unint64_t v56 = sub_24C871EBC(v54, v55), (v57 & 1) != 0))
                        {
                          sub_24C87C34C(*(void *)(v53 + 56) + 32 * v56, v0 + 80);
                        }
                        else
                        {
                          *uint64_t v3 = 0u;
                          *(_OWORD *)(v0 + 96) = 0u;
                        }
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        if (*(void *)(v0 + 104))
                        {
                          if (swift_dynamicCast())
                          {
                            v58 = (void *)sub_24C880FD0();
                            swift_bridgeObjectRelease();
LABEL_59:
                            uint64_t v59 = *(void **)(v0 + 160);
                            objc_msgSend(v8, sel_setRelayUUIDString_, v58, *(void *)(v0 + 168));

                            uint64_t v60 = v4[3];
                            os_log_type_t v61 = v8;
                            uint64_t v62 = v4[5];
                            __swift_project_boxed_opaque_existential_5Tm(v59, v60);
                            v63 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
                            id v64 = v61;
                            v63(v60, v62);
                            int64_t v65 = (void *)sub_24C880FD0();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v64, sel_setBundleIdentifier_, v65);

                            uint64_t v66 = (void *)sub_24C880FD0();
                            objc_msgSend(v64, sel_setSourceIdentifier_, v66);

                            uint64_t v67 = *(void **)(v69 + 16);
                            *(void *)(v0 + 16) = v0;
                            *(void *)(v0 + 56) = v0 + 144;
                            *(void *)(v0 + 24) = sub_24C879DCC;
                            uint64_t v68 = swift_continuation_init();
                            *(void *)(v0 + 80) = MEMORY[0x263EF8330];
                            *(void *)(v0 + 88) = 0x40000000;
                            *(void *)(v0 + 96) = sub_24C8778AC;
                            *(void *)(v0 + 104) = &block_descriptor_30;
                            *(void *)(v0 + 112) = v68;
                            objc_msgSend(v67, sel_performRequest_completion_, v64, v0 + 80);
                            return MEMORY[0x270FA23F0](v0 + 16);
                          }
LABEL_58:
                          v58 = 0;
                          goto LABEL_59;
                        }
                      }
                      else
                      {
                        *uint64_t v3 = 0u;
                        *(_OWORD *)(v0 + 96) = 0u;
                      }
                      sub_24C87C7DC(v0 + 80);
                      goto LABEL_58;
                    }
                  }
                  else
                  {
                    *uint64_t v3 = 0u;
                    *(_OWORD *)(v0 + 96) = 0u;
                  }
                  sub_24C87C7DC(v0 + 80);
                  goto LABEL_47;
                }
              }
              else
              {
                *uint64_t v3 = 0u;
                *(_OWORD *)(v0 + 96) = 0u;
              }
              sub_24C87C7DC(v0 + 80);
              goto LABEL_36;
            }
          }
          else
          {
            *uint64_t v3 = 0u;
            *(_OWORD *)(v0 + 96) = 0u;
          }
          sub_24C87C7DC(v0 + 80);
          goto LABEL_25;
        }
      }
      else
      {
        *uint64_t v3 = 0u;
        *(_OWORD *)(v0 + 96) = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      *uint64_t v3 = 0u;
      *(_OWORD *)(v0 + 96) = 0u;
    }
    sub_24C87C7DC(v0 + 80);
    goto LABEL_14;
  }
  sub_24C872C74();
  swift_allocError();
  *(void *)uint64_t v16 = 0xD00000000000001ELL;
  *(void *)(v16 + 8) = 0x800000024C882430;
  *(unsigned char *)(v16 + 16) = 1;
  swift_willThrow();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_24C879DCC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_24C879F50;
  }
  else {
    uint64_t v2 = sub_24C879EDC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C879EDC()
{
  uint64_t v1 = (void *)v0[22];

  uint64_t v2 = (void *)v0[18];
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24C879F50()
{
  uint64_t v23 = v0;
  uint64_t v1 = (void *)v0[22];
  swift_willThrow();

  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[20];
  uint64_t v4 = sub_24C880FB0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B17CF60);
  sub_24C87BEF4(v3, (uint64_t)(v0 + 10));
  MEMORY[0x2532FD9C0](v2);
  MEMORY[0x2532FD9C0](v2);
  uint64_t v5 = sub_24C880F90();
  os_log_type_t v6 = sub_24C881040();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = v0[23];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v10 = v0[13];
    uint64_t v11 = v0[15];
    __swift_project_boxed_opaque_existential_5Tm(v0 + 10, v10);
    uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v11);
    v0[18] = sub_24C87C0BC(v12, v13, &v22);
    sub_24C881070();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4((uint64_t)(v0 + 10));
    *(_WORD *)(v9 + 12) = 2112;
    MEMORY[0x2532FD9C0](v8);
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[18] = v14;
    sub_24C881070();
    *uint64_t v20 = v14;
    MEMORY[0x2532FD9B0](v8);
    MEMORY[0x2532FD9B0](v8);
    _os_log_impl(&dword_24C868000, v5, v6, "Failed to set UUID app attributes on app %s, error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED0);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v21, -1, -1);
    MEMORY[0x2532FDAD0](v9, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_4((uint64_t)(v0 + 10));
    MEMORY[0x2532FD9B0](v8);
    MEMORY[0x2532FD9B0](v8);
  }

  uint64_t v16 = (void *)v0[22];
  uint64_t v15 = v0[23];
  sub_24C87BF58();
  swift_allocError();
  *(void *)uint64_t v17 = 0xD000000000000013;
  *(void *)(v17 + 8) = 0x800000024C882450;
  *(unsigned char *)(v17 + 16) = 2;
  swift_willThrow();
  MEMORY[0x2532FD9B0](v15);

  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_24C87A284(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return MEMORY[0x270FA2498](sub_24C87A2A4, 0, 0);
}

uint64_t sub_24C87A2A4()
{
  uint64_t v1 = sub_24C880FE0();
  uint64_t v3 = v2;
  *(void *)(v0 + 72) = v2;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39E10]), sel_init);
  *(void *)(v0 + 80) = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    os_log_type_t v6 = (_OWORD *)(v0 + 16);
    BOOL v7 = *(void **)(v0 + 56);
    uint64_t v8 = v7[3];
    uint64_t v9 = v7[5];
    __swift_project_boxed_opaque_existential_5Tm(v7, v8);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
    id v22 = v5;
    uint64_t v11 = v10(v8, v9);
    if (v11)
    {
      uint64_t v12 = v11;
      if (*(void *)(v11 + 16))
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = v1;
        unint64_t v14 = sub_24C871EBC(v1, v3);
        if (v15)
        {
          sub_24C87C34C(*(void *)(v12 + 56) + 32 * v14, v0 + 16);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v16 = v22;
          if (*(void *)(v0 + 40))
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CD0);
            if (swift_dynamicCast())
            {
              uint64_t v17 = (void *)sub_24C881010();
              swift_bridgeObjectRelease();
LABEL_18:
              objc_msgSend(v16, sel_setAssociatedDomains_, v17);

              uint64_t v21 = swift_task_alloc();
              *(void *)(v0 + 88) = v21;
              *(void *)uint64_t v21 = v0;
              *(void *)(v21 + 8) = sub_24C87A5A4;
              *(_OWORD *)(v21 + 176) = *(_OWORD *)(v0 + 56);
              *(void *)(v21 + 160) = v13;
              *(void *)(v21 + 168) = v3;
              *(void *)(v21 + 152) = v16;
              return MEMORY[0x270FA2498](sub_24C87B7E8, 0, 0);
            }
LABEL_17:
            uint64_t v17 = 0;
            goto LABEL_18;
          }
LABEL_16:
          sub_24C87C7DC(v0 + 16);
          goto LABEL_17;
        }
        *os_log_type_t v6 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_15:
        uint64_t v16 = v22;
        goto LABEL_16;
      }
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
      swift_bridgeObjectRelease();
    }
    else
    {
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    uint64_t v13 = v1;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  sub_24C872C74();
  swift_allocError();
  *(void *)uint64_t v18 = 0xD000000000000021;
  *(void *)(v18 + 8) = 0x800000024C882400;
  *(unsigned char *)(v18 + 16) = 1;
  swift_willThrow();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_24C87A5A4()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_24C87A740;
  }
  else {
    uint64_t v2 = sub_24C87A6D8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C87A6D8()
{
  uint64_t v1 = *(void **)(v0 + 80);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24C87A740()
{
  uint64_t v1 = *(void **)(v0 + 80);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24C87A7A8(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_24C87A7C8, 0, 0);
}

uint64_t sub_24C87A7C8()
{
  uint64_t v1 = sub_24C880FE0();
  uint64_t v3 = v2;
  *(void *)(v0 + 64) = v2;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39E08]), sel_init);
  *(void *)(v0 + 72) = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    os_log_type_t v6 = (_OWORD *)(v0 + 16);
    BOOL v7 = *(void **)(v0 + 48);
    uint64_t v8 = v7[3];
    uint64_t v9 = v7[5];
    __swift_project_boxed_opaque_existential_5Tm(v7, v8);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
    id v22 = v5;
    uint64_t v11 = v10(v8, v9);
    if (v11)
    {
      uint64_t v12 = v11;
      if (*(void *)(v11 + 16))
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = v1;
        unint64_t v14 = sub_24C871EBC(v1, v3);
        if (v15)
        {
          sub_24C87C34C(*(void *)(v12 + 56) + 32 * v14, v0 + 16);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v16 = v22;
          if (*(void *)(v0 + 40))
          {
            if (swift_dynamicCast())
            {
              sub_24C87C83C(0, &qword_2697F7CC8);
              uint64_t v17 = (void *)sub_24C881050();
              objc_msgSend(v22, sel_setAssociatedDomainsEnableDirectDownloads_, v17);

LABEL_18:
              uint64_t v21 = swift_task_alloc();
              *(void *)(v0 + 80) = v21;
              *(void *)uint64_t v21 = v0;
              *(void *)(v21 + 8) = sub_24C87AAE0;
              *(_OWORD *)(v21 + 176) = *(_OWORD *)(v0 + 48);
              *(void *)(v21 + 160) = v13;
              *(void *)(v21 + 168) = v3;
              *(void *)(v21 + 152) = v16;
              return MEMORY[0x270FA2498](sub_24C87B7E8, 0, 0);
            }
LABEL_17:
            objc_msgSend(v16, sel_setAssociatedDomainsEnableDirectDownloads_, 0);
            goto LABEL_18;
          }
LABEL_16:
          sub_24C87C7DC(v0 + 16);
          goto LABEL_17;
        }
        *os_log_type_t v6 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_15:
        uint64_t v16 = v22;
        goto LABEL_16;
      }
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
      swift_bridgeObjectRelease();
    }
    else
    {
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    uint64_t v13 = v1;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  sub_24C872C74();
  swift_allocError();
  *(void *)uint64_t v18 = 0xD000000000000036;
  *(void *)(v18 + 8) = 0x800000024C8823C0;
  *(unsigned char *)(v18 + 16) = 1;
  swift_willThrow();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_24C87AAE0()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_24C87F0C0;
  }
  else {
    uint64_t v2 = sub_24C87F0BC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C87AC14(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_24C87AC34, 0, 0);
}

uint64_t sub_24C87AC34()
{
  uint64_t v1 = sub_24C880FE0();
  uint64_t v3 = v2;
  *(void *)(v0 + 64) = v2;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39E30]), sel_init);
  *(void *)(v0 + 72) = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    os_log_type_t v6 = (_OWORD *)(v0 + 16);
    BOOL v7 = *(void **)(v0 + 48);
    uint64_t v8 = v7[3];
    uint64_t v9 = v7[5];
    __swift_project_boxed_opaque_existential_5Tm(v7, v8);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
    id v22 = v5;
    uint64_t v11 = v10(v8, v9);
    if (v11)
    {
      uint64_t v12 = v11;
      if (*(void *)(v11 + 16))
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = v1;
        unint64_t v14 = sub_24C871EBC(v1, v3);
        if (v15)
        {
          sub_24C87C34C(*(void *)(v12 + 56) + 32 * v14, v0 + 16);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v16 = v22;
          if (*(void *)(v0 + 40))
          {
            if (swift_dynamicCast())
            {
              sub_24C87C83C(0, &qword_2697F7CC8);
              uint64_t v17 = (void *)sub_24C881050();
              objc_msgSend(v22, sel_setTapToPayScreenLock_, v17);

LABEL_18:
              uint64_t v21 = swift_task_alloc();
              *(void *)(v0 + 80) = v21;
              *(void *)uint64_t v21 = v0;
              *(void *)(v21 + 8) = sub_24C87AF4C;
              *(_OWORD *)(v21 + 176) = *(_OWORD *)(v0 + 48);
              *(void *)(v21 + 160) = v13;
              *(void *)(v21 + 168) = v3;
              *(void *)(v21 + 152) = v16;
              return MEMORY[0x270FA2498](sub_24C87B7E8, 0, 0);
            }
LABEL_17:
            objc_msgSend(v16, sel_setTapToPayScreenLock_, 0);
            goto LABEL_18;
          }
LABEL_16:
          sub_24C87C7DC(v0 + 16);
          goto LABEL_17;
        }
        *os_log_type_t v6 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_15:
        uint64_t v16 = v22;
        goto LABEL_16;
      }
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
      swift_bridgeObjectRelease();
    }
    else
    {
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    uint64_t v13 = v1;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  sub_24C872C74();
  swift_allocError();
  *(void *)uint64_t v18 = 0xD000000000000022;
  *(void *)(v18 + 8) = 0x800000024C882390;
  *(unsigned char *)(v18 + 16) = 1;
  swift_willThrow();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_24C87AF4C()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_24C87B0E8;
  }
  else {
    uint64_t v2 = sub_24C87B080;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C87B080()
{
  uint64_t v1 = *(void **)(v0 + 72);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24C87B0E8()
{
  uint64_t v1 = *(void **)(v0 + 72);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24C87B150(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_24C87B170, 0, 0);
}

uint64_t sub_24C87B170()
{
  uint64_t v1 = sub_24C880FE0();
  uint64_t v3 = v2;
  *(void *)(v0 + 64) = v2;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39DF0]), sel_init);
  *(void *)(v0 + 72) = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    os_log_type_t v6 = (_OWORD *)(v0 + 16);
    BOOL v7 = *(void **)(v0 + 48);
    uint64_t v8 = v7[3];
    uint64_t v9 = v7[5];
    __swift_project_boxed_opaque_existential_5Tm(v7, v8);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
    id v22 = v5;
    uint64_t v11 = v10(v8, v9);
    if (v11)
    {
      uint64_t v12 = v11;
      if (*(void *)(v11 + 16))
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = v1;
        unint64_t v14 = sub_24C871EBC(v1, v3);
        if (v15)
        {
          sub_24C87C34C(*(void *)(v12 + 56) + 32 * v14, v0 + 16);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v16 = v22;
          if (*(void *)(v0 + 40))
          {
            if (swift_dynamicCast())
            {
              sub_24C87C83C(0, &qword_2697F7CC8);
              uint64_t v17 = (void *)sub_24C881050();
              objc_msgSend(v22, sel_setAllowUserToHide_, v17);

LABEL_18:
              uint64_t v21 = swift_task_alloc();
              *(void *)(v0 + 80) = v21;
              *(void *)uint64_t v21 = v0;
              *(void *)(v21 + 8) = sub_24C87AAE0;
              *(_OWORD *)(v21 + 176) = *(_OWORD *)(v0 + 48);
              *(void *)(v21 + 160) = v13;
              *(void *)(v21 + 168) = v3;
              *(void *)(v21 + 152) = v16;
              return MEMORY[0x270FA2498](sub_24C87B7E8, 0, 0);
            }
LABEL_17:
            objc_msgSend(v16, sel_setAllowUserToHide_, 0);
            goto LABEL_18;
          }
LABEL_16:
          sub_24C87C7DC(v0 + 16);
          goto LABEL_17;
        }
        *os_log_type_t v6 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_15:
        uint64_t v16 = v22;
        goto LABEL_16;
      }
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
      swift_bridgeObjectRelease();
    }
    else
    {
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    uint64_t v13 = v1;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  sub_24C872C74();
  swift_allocError();
  *(void *)uint64_t v18 = 0xD00000000000001FLL;
  *(void *)(v18 + 8) = 0x800000024C882370;
  *(unsigned char *)(v18 + 16) = 1;
  swift_willThrow();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_24C87B488(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_24C87B4A8, 0, 0);
}

uint64_t sub_24C87B4A8()
{
  uint64_t v1 = sub_24C880FE0();
  uint64_t v3 = v2;
  *(void *)(v0 + 64) = v2;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F39DF8]), sel_init);
  *(void *)(v0 + 72) = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    os_log_type_t v6 = (_OWORD *)(v0 + 16);
    BOOL v7 = *(void **)(v0 + 48);
    uint64_t v8 = v7[3];
    uint64_t v9 = v7[5];
    __swift_project_boxed_opaque_existential_5Tm(v7, v8);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 80);
    id v22 = v5;
    uint64_t v11 = v10(v8, v9);
    if (v11)
    {
      uint64_t v12 = v11;
      if (*(void *)(v11 + 16))
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = v1;
        unint64_t v14 = sub_24C871EBC(v1, v3);
        if (v15)
        {
          sub_24C87C34C(*(void *)(v12 + 56) + 32 * v14, v0 + 16);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v16 = v22;
          if (*(void *)(v0 + 40))
          {
            if (swift_dynamicCast())
            {
              sub_24C87C83C(0, &qword_2697F7CC8);
              uint64_t v17 = (void *)sub_24C881050();
              objc_msgSend(v22, sel_setAllowUserToLock_, v17);

LABEL_18:
              uint64_t v21 = swift_task_alloc();
              *(void *)(v0 + 80) = v21;
              *(void *)uint64_t v21 = v0;
              *(void *)(v21 + 8) = sub_24C87AAE0;
              *(_OWORD *)(v21 + 176) = *(_OWORD *)(v0 + 48);
              *(void *)(v21 + 160) = v13;
              *(void *)(v21 + 168) = v3;
              *(void *)(v21 + 152) = v16;
              return MEMORY[0x270FA2498](sub_24C87B7E8, 0, 0);
            }
LABEL_17:
            objc_msgSend(v16, sel_setAllowUserToLock_, 0);
            goto LABEL_18;
          }
LABEL_16:
          sub_24C87C7DC(v0 + 16);
          goto LABEL_17;
        }
        *os_log_type_t v6 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_15:
        uint64_t v16 = v22;
        goto LABEL_16;
      }
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
      swift_bridgeObjectRelease();
    }
    else
    {
      *os_log_type_t v6 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    uint64_t v13 = v1;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  sub_24C872C74();
  swift_allocError();
  *(void *)uint64_t v18 = 0xD00000000000001FLL;
  *(void *)(v18 + 8) = 0x800000024C882350;
  *(unsigned char *)(v18 + 16) = 1;
  swift_willThrow();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_24C87B7C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[22] = a4;
  v5[23] = v4;
  v5[20] = a2;
  v5[21] = a3;
  v5[19] = a1;
  return MEMORY[0x270FA2498](sub_24C87B7E8, 0, 0);
}

uint64_t sub_24C87B7E8()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = v0[23];
  uint64_t v3 = (void *)v0[19];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[5];
  __swift_project_boxed_opaque_existential_5Tm(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  os_log_type_t v6 = (void *)sub_24C880FD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setBundleIdentifier_, v6);

  BOOL v7 = (void *)sub_24C880FD0();
  objc_msgSend(v3, sel_setSourceIdentifier_, v7);

  uint64_t v8 = *(void **)(v2 + 16);
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24C87B998;
  uint64_t v9 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24C8778AC;
  v0[13] = &block_descriptor;
  v0[14] = v9;
  objc_msgSend(v8, sel_performRequest_completion_, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24C87B998()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 192) = v1;
  if (v1) {
    uint64_t v2 = sub_24C87BB0C;
  }
  else {
    uint64_t v2 = sub_24C87BAA8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C87BAA8()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C87BB0C()
{
  char v27 = v0;
  swift_willThrow();
  if (qword_26B17CEB0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[22];
  uint64_t v3 = sub_24C880FB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B17CF60);
  sub_24C87BEF4(v2, (uint64_t)(v0 + 10));
  swift_bridgeObjectRetain();
  MEMORY[0x2532FD9C0](v1);
  swift_bridgeObjectRetain();
  MEMORY[0x2532FD9C0](v1);
  uint64_t v4 = sub_24C880F90();
  os_log_type_t v5 = sub_24C881040();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[24];
  unint64_t v8 = v0[21];
  if (v6)
  {
    uint64_t v9 = v0[20];
    os_log_type_t type = v5;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v26[0] = v25;
    *(_DWORD *)uint64_t v10 = 136315650;
    swift_bridgeObjectRetain();
    v0[18] = sub_24C87C0BC(v9, v8, v26);
    sub_24C881070();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    log = v4;
    uint64_t v11 = v0[13];
    uint64_t v12 = v0[15];
    __swift_project_boxed_opaque_existential_5Tm(v0 + 10, v11);
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
    v0[18] = sub_24C87C0BC(v13, v14, v26);
    sub_24C881070();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_4((uint64_t)(v0 + 10));
    *(_WORD *)(v10 + 22) = 2112;
    MEMORY[0x2532FD9C0](v7);
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[18] = v15;
    sub_24C881070();
    *uint64_t v24 = v15;
    MEMORY[0x2532FD9B0](v7);
    MEMORY[0x2532FD9B0](v7);
    uint64_t v4 = log;
    _os_log_impl(&dword_24C868000, log, type, "Failed to set app attribute %s on app %s, error: %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED0);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v24, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2532FDAD0](v25, -1, -1);
    MEMORY[0x2532FDAD0](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    __swift_destroy_boxed_opaque_existential_4((uint64_t)(v0 + 10));
    MEMORY[0x2532FD9B0](v7);
    MEMORY[0x2532FD9B0](v7);
  }

  uint64_t v16 = v0[24];
  uint64_t v18 = v0[20];
  uint64_t v17 = v0[21];
  sub_24C87BF58();
  swift_allocError();
  *(void *)uint64_t v19 = v18;
  *(void *)(v19 + 8) = v17;
  *(unsigned char *)(v19 + 16) = 2;
  swift_bridgeObjectRetain();
  swift_willThrow();
  MEMORY[0x2532FD9B0](v16);
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_24C87BE98()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for DMCAppsManager()
{
  return self;
}

uint64_t sub_24C87BEF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24C87BF58()
{
  unint64_t result = qword_26B17CEC8;
  if (!qword_26B17CEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17CEC8);
  }
  return result;
}

void *sub_24C87BFAC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCA0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_24C87EF28(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C87C0BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24C87C190(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24C87C34C((uint64_t)v12, *a3);
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
      sub_24C87C34C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_4((uint64_t)v12);
  return v7;
}

uint64_t sub_24C87C190(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24C881080();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24C87C3A8(a5, a6);
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
  uint64_t v8 = sub_24C8810E0();
  if (!v8)
  {
    sub_24C8810F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24C881130();
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

uint64_t sub_24C87C34C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24C87C3A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24C87C440(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24C87C620(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24C87C620(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24C87C440(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24C87C5B8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24C8810D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24C8810F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24C881000();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24C881130();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24C8810F0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24C87C5B8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24C87C620(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CB8);
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
  uint64_t result = sub_24C881130();
  __break(1u);
  return result;
}

uint64_t sub_24C87C774(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CC90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C87C7DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C87C83C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24C87C878(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24C8811B0();
  swift_bridgeObjectRetain();
  sub_24C880FF0();
  uint64_t v8 = sub_24C8811D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24C881140() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_24C881140() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24C87D668(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24C87CA28()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CE8);
  uint64_t v3 = sub_24C8810B0();
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
      sub_24C8811B0();
      sub_24C880FF0();
      uint64_t result = sub_24C8811D0();
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

uint64_t sub_24C87CD08(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if (v4 & 0x3Fu) <= 0xD || (swift_stdlib_isStackAllocationSafe())
  {
    MEMORY[0x270FA5388]();
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_24C87CE90((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, a1);
    swift_release();
  }
  else
  {
    int64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_24C87CE90((uint64_t)v8, v5, a2, a1);
    swift_release();
    MEMORY[0x2532FDAD0](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_24C87CE90(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  char v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_24C8811B0();
        swift_bridgeObjectRetain();
        sub_24C880FF0();
        uint64_t v20 = sub_24C8811D0();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      unint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_24C881140() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_24C881140() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    uint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_24C8811B0();
    swift_bridgeObjectRetain();
    sub_24C880FF0();
    uint64_t v47 = sub_24C8811D0();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_24C881140() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_24C87D3D0(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        uint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_24C881140() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_24C87D3D0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CE8);
  uint64_t result = sub_24C8810C0();
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
    sub_24C8811B0();
    swift_bridgeObjectRetain();
    sub_24C880FF0();
    uint64_t result = sub_24C8811D0();
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

uint64_t sub_24C87D668(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24C87CA28();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24C87D804();
      goto LABEL_22;
    }
    sub_24C87D9B8();
  }
  uint64_t v11 = *v4;
  sub_24C8811B0();
  sub_24C880FF0();
  uint64_t result = sub_24C8811D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24C881140(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24C881150();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24C881140();
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

void *sub_24C87D804()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C8810A0();
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

uint64_t sub_24C87D9B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7CE8);
  uint64_t v3 = sub_24C8810B0();
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24C8811B0();
    swift_bridgeObjectRetain();
    sub_24C880FF0();
    uint64_t result = sub_24C8811D0();
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

uint64_t sub_24C87DC68(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED8);
  char v36 = a2;
  uint64_t v6 = sub_24C881110();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24C8811B0();
    sub_24C880FF0();
    uint64_t result = sub_24C8811D0();
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
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_24C87DF80()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CED8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C881100();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_24C87E138(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCA0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_24C87E2A8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24C87F0B4();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_24C87E220(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  int64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
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

uint64_t sub_24C87E2A8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
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
    *char v5 = a4;
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
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
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

uint64_t sub_24C87E4A8(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 56) + 8 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_24C87E4F8(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  int64_t v4 = (void *)swift_task_alloc();
  v2[8] = v4;
  *int64_t v4 = v2;
  v4[1] = sub_24C87E5A8;
  v4[20] = a1;
  v4[21] = v1;
  return MEMORY[0x270FA2498](sub_24C8795E0, 0, 0);
}

uint64_t sub_24C87E5A8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 112) = v0;
    int64_t v4 = sub_24C87EE20;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 72) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C87E718;
    *(_OWORD *)(v5 + 56) = *(_OWORD *)(v2 + 48);
    int64_t v4 = sub_24C87A2A4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C87E718()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 112) = v0;
    int64_t v4 = sub_24C87EE20;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 80) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C87E888;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(v2 + 48);
    int64_t v4 = sub_24C87A7C8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C87E888()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 112) = v0;
    int64_t v4 = sub_24C87EE20;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 88) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C87E9F8;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(v2 + 48);
    int64_t v4 = sub_24C87AC34;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C87E9F8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 112) = v0;
    int64_t v4 = sub_24C87EE20;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 96) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C87EB68;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(v2 + 48);
    int64_t v4 = sub_24C87B170;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C87EB68()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 112) = v0;
    int64_t v4 = sub_24C87EE20;
  }
  else
  {
    uint64_t v5 = swift_task_alloc();
    *(void *)(v2 + 104) = v5;
    *(void *)uint64_t v5 = v3;
    *(void *)(v5 + 8) = sub_24C87ECD8;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(v2 + 48);
    int64_t v4 = sub_24C87B4A8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C87ECD8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 112) = v0;
    return MEMORY[0x270FA2498](sub_24C87EE20, 0, 0);
  }
  else
  {
    int64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_24C87EE20()
{
  *(void *)(v0 + 40) = *(void *)(v0 + 112);
  MEMORY[0x2532FD9C0]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17CCB0);
  if (swift_dynamicCast())
  {
    uint64_t v1 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    int v3 = *(unsigned __int8 *)(v0 + 32);
    if (v3 == 1)
    {
      MEMORY[0x2532FD9B0](*(void *)(v0 + 112));
      sub_24C87BF58();
      swift_allocError();
      *(void *)uint64_t v4 = v1;
      *(void *)(v4 + 8) = v2;
      *(unsigned char *)(v4 + 16) = 2;
      swift_willThrow();
    }
    else
    {
      sub_24C8731C4(*(void *)(v0 + 16), *(void *)(v0 + 24), v3);
    }
  }
  MEMORY[0x2532FD9B0](*(void *)(v0 + 40));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24C87EF28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24C881130();
  __break(1u);
  return result;
}

uint64_t sub_24C87F01C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24C881020();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24C87C878(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24C87F0B4()
{
  return swift_release();
}

uint64_t DMCAppsRemoveAction.hash(into:)()
{
  return sub_24C8811C0();
}

BOOL static DMCAppsRemoveAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DMCAppsRemoveAction.hashValue.getter()
{
  return sub_24C8811D0();
}

uint64_t _s7DMCApps0A13InstallActionO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5) {
        goto LABEL_22;
      }
      unint64_t v3 = 0;
      char v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1) {
        goto LABEL_22;
      }
      unint64_t v3 = 1;
      char v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2) {
        goto LABEL_22;
      }
      char v6 = 1;
      unint64_t v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3) {
        goto LABEL_22;
      }
      char v6 = 1;
      unint64_t v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4) {
        goto LABEL_22;
      }
      char v6 = 1;
      unint64_t v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5) {
        goto LABEL_22;
      }
      char v6 = 1;
      unint64_t v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6) {
        goto LABEL_22;
      }
      char v6 = 1;
      unint64_t v3 = 6;
      break;
    default:
      if (v5 < 7)
      {
LABEL_22:
        char v6 = 0;
      }
      else if (v2 == v4 && v3 == v5)
      {
        char v6 = 1;
      }
      else
      {
        char v6 = sub_24C881140();
      }
      sub_24C880B58(v4, v5);
      sub_24C880B58(v2, v3);
      break;
  }
  sub_24C880B6C(v2, v3);
  sub_24C880B6C(v4, v5);
  return v6 & 1;
}

uint64_t _s7DMCApps0A21OptionalInstallActionO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      unint64_t v3 = 0;
      char v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      unint64_t v3 = 1;
      char v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 2)
  {
    if (v5 >= 3)
    {
      if (v2 == v4 && v3 == v5) {
        char v6 = 1;
      }
      else {
        char v6 = sub_24C881140();
      }
      goto LABEL_12;
    }
LABEL_11:
    char v6 = 0;
LABEL_12:
    sub_24C880B30(v4, v5);
    sub_24C880B30(v2, v3);
    goto LABEL_13;
  }
  if (v5 != 2) {
    goto LABEL_11;
  }
  char v6 = 1;
  unint64_t v3 = 2;
LABEL_13:
  sub_24C880B44(v2, v3);
  sub_24C880B44(v4, v5);
  return v6 & 1;
}

unint64_t sub_24C87F3D4()
{
  unint64_t result = qword_2697F7CF0;
  if (!qword_2697F7CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7CF0);
  }
  return result;
}

uint64_t dispatch thunk of DMCAppStateReporting.willInstallApplication(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_24C880B8C;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DMCAppStateReporting.didInstallApplication(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_24C87F640;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_24C87F640(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of DMCAppStateReporting.updateApp(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_24C880B8C;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DMCAppStateReporting2.isManaged(bundleID:persona:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 16)
                                                                                     + **(int **)(a6 + 16));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_24C880B8C;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of DMCAppStateReporting3.shouldPromptForInstallConsent(for:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v8 = a2 & 1;
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_24C87FA78;
  return v11(a1, v8, a3, a4);
}

uint64_t sub_24C87FA78(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of DMCAppStateReporting4.organizationName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

unint64_t destroy for DMCAppsInstallAction(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DMCAppsInstallAction(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFF9 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483641);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 6;
  if (v4 >= 8) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DMCAppsInstallAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF9)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483641;
    if (a3 >= 0x7FFFFFF9) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF9) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 6;
    }
  }
  return result;
}

uint64_t sub_24C87FC64(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24C87FC7C(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsInstallAction()
{
  return &type metadata for DMCAppsInstallAction;
}

uint64_t _s7DMCApps20DMCAppsInstallActionOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *_s7DMCApps20DMCAppsInstallActionOwca_0(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7DMCApps20DMCAppsInstallActionOwta_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DMCAppsOptionalInstallAction(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DMCAppsOptionalInstallAction(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DMCAppsOptionalInstallAction()
{
  return &type metadata for DMCAppsOptionalInstallAction;
}

unsigned char *storeEnumTagSinglePayload for DMCAppsRemoveAction(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C87FF88);
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

ValueMetadata *type metadata accessor for DMCAppsRemoveAction()
{
  return &type metadata for DMCAppsRemoveAction;
}

uint64_t dispatch thunk of DMCAppStateReporting5.configurationApplied(_:appAlreadyPresent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 16) + **(int **)(a5 + 16));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_24C87342C;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of DMCAppStateReporting5.configurationRemoved(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_24C87342C;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DMCAppStateReporting5.optionalAppRequested(_:appAlreadyPresent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 32) + **(int **)(a5 + 32));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = sub_24C87342C;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of DMCAppStateReporting5.willDownload(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 40) + **(int **)(a3 + 40));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24C87342C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.willInstall(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 48) + **(int **)(a3 + 48));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24C87342C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.didInstall(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 56) + **(int **)(a3 + 56));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24C8717E8;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.willUpdate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 64) + **(int **)(a3 + 64));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24C87342C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.didUpdate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 72) + **(int **)(a3 + 72));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24C87342C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.installFailed(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 80) + **(int **)(a3 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24C87342C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.didUninstall(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 88) + **(int **)(a3 + 88));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24C87342C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of DMCAppStateReporting5.didRemoveConfiguration(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 96) + **(int **)(a3 + 96));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24C87342C;
  return v9(a1, a2, a3);
}

uint64_t sub_24C880B30(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24C880B44(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24C880B58(uint64_t a1, unint64_t a2)
{
  if (a2 >= 7) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24C880B6C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 7) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_24C880B90()
{
  v10[4] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_allocWithZone(MEMORY[0x263EFF950]);
  unint64_t v1 = (void *)sub_24C880F70();
  id v2 = objc_msgSend(v0, sel_initWithURL_, v1);

  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v3, sel_open);
    v10[0] = 0;
    if (objc_msgSend(self, sel_propertyListWithStream_options_format_error_, v3, 0, 0, v10))
    {
      id v4 = v10[0];
      sub_24C881090();
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7D80);
      if (swift_dynamicCast()) {
        id v0 = v9;
      }
      else {
        id v0 = (id)sub_24C876FC0(MEMORY[0x263F8EE78]);
      }
      objc_msgSend(v3, sel_close);
    }
    else
    {
      id v6 = v10[0];
      id v0 = (id)sub_24C880F50();

      swift_willThrow();
      sub_24C880DA0();
      swift_allocError();
      *uint64_t v7 = 1;
      swift_willThrow();
      MEMORY[0x2532FD9B0](v0);
      objc_msgSend(v3, sel_close);
    }
  }
  else
  {
    sub_24C880DA0();
    swift_allocError();
    *uint64_t v5 = 0;
    swift_willThrow();
  }
  return v0;
}

unint64_t sub_24C880DA0()
{
  unint64_t result = qword_2697F7D78;
  if (!qword_2697F7D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7D78);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PlistError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C880EC0);
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

ValueMetadata *type metadata accessor for PlistError()
{
  return &type metadata for PlistError;
}

unint64_t sub_24C880EFC()
{
  unint64_t result = qword_2697F7D88;
  if (!qword_2697F7D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7D88);
  }
  return result;
}

uint64_t sub_24C880F50()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24C880F60()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_24C880F70()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24C880F80()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24C880F90()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24C880FA0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24C880FB0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24C880FC0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24C880FD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C880FE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C880FF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24C881000()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24C881010()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24C881020()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24C881030()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24C881040()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24C881050()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_24C881060()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24C881070()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24C881080()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24C881090()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24C8810A0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24C8810B0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24C8810C0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24C8810D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24C8810E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24C8810F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24C881100()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24C881110()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24C881120()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24C881130()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24C881140()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24C881150()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24C881170()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24C881180()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24C881190()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24C8811A0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24C8811B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24C8811C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24C8811D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t MDMFilePath()
{
  return MEMORY[0x270F24FC8]();
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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