uint64_t sub_100003750@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char *v4;

  *a1 = swift_getKeyPath();
  sub_100003BE4(&qword_100010130);
  swift_storeEnumTagMultiPayload();
  sub_10000A248();
  swift_allocObject();
  swift_retain();
  v2 = sub_10000A1C8();
  result = type metadata accessor for ManagedAppCell();
  v4 = (char *)a1 + *(int *)(result + 20);
  *(void *)v4 = sub_100003C28;
  *((void *)v4 + 1) = v2;
  v4[16] = 0;
  return result;
}

uint64_t sub_1000037F8()
{
  uint64_t v0 = type metadata accessor for ManagedAppCell();
  uint64_t v1 = sub_100003AB0(&qword_100010128, (void (*)(uint64_t))type metadata accessor for ManagedAppCell);

  return MADViewServiceScene.init(content:)(sub_100003750, 0, v0, v1);
}

uint64_t sub_10000388C(uint64_t a1)
{
  unint64_t v2 = sub_100003A5C();

  return MADViewServiceExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003938()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

ValueMetadata *type metadata accessor for MADViewExtension()
{
  return &type metadata for MADViewExtension;
}

unint64_t sub_1000039A4()
{
  unint64_t result = qword_100010110;
  if (!qword_100010110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010110);
  }
  return result;
}

uint64_t sub_1000039F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003A14()
{
  return sub_100003AB0(&qword_100010118, (void (*)(uint64_t))&type metadata accessor for AppExtensionSceneConfiguration);
}

unint64_t sub_100003A5C()
{
  unint64_t result = qword_100010120;
  if (!qword_100010120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010120);
  }
  return result;
}

uint64_t sub_100003AB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003AF8()
{
  return sub_10000A338();
}

uint64_t sub_100003B1C(uint64_t a1)
{
  sub_10000A288();
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_10000A348();
}

uint64_t sub_100003BE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003C28()
{
  return j__swift_retain(v0);
}

unint64_t sub_100003C34()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    sub_100003C90(&qword_100010140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010138);
  }
  return result;
}

uint64_t sub_100003C90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

__n128 sub_100003CD8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003CE8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003D08(uint64_t result, int a2, int a3)
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

uint64_t sub_100003D44(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100003D78(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003D84(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003DA4(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100003DF8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100003E48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_100003E50()
{
  sub_100004C78(319, &qword_1000101F0, (uint64_t (*)(uint64_t))&type metadata accessor for AsyncImagePhase, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for State);
  if (v0 <= 0x3F)
  {
    sub_100004C78(319, &qword_1000101F8, (uint64_t (*)(uint64_t))&type metadata accessor for URLRequest, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_100003F94(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_10000A2D8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = sub_100003BE4(&qword_100010160);
    *(uint64_t *)((char *)v4 + *(int *)(v8 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 28));
    uint64_t v9 = a3[9];
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    uint64_t v12 = sub_10000A0C8();
    uint64_t v13 = *(void *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_retain();
    if (v14(v11, 1, v12))
    {
      uint64_t v15 = sub_100003BE4(qword_100010168);
      memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    uint64_t v17 = a3[10];
    uint64_t v18 = a3[11];
    v19 = *(void **)((char *)a2 + v17);
    *(uint64_t *)((char *)v4 + v17) = (uint64_t)v19;
    v20 = (uint64_t *)((char *)v4 + v18);
    v21 = (uint64_t *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    void *v20 = *v21;
    v20[1] = v22;
    id v23 = v19;
  }
  swift_retain();
  return v4;
}

uint64_t sub_100004188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A2D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_100003BE4(&qword_100010160);
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 36);
  uint64_t v6 = sub_10000A0C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }

  return swift_release();
}

uint64_t sub_1000042B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000A2D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = sub_100003BE4(&qword_100010160);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  uint64_t v8 = a3[9];
  uint64_t v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_10000A0C8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_retain();
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = sub_100003BE4(qword_100010168);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v15 = a3[10];
  uint64_t v16 = a3[11];
  uint64_t v17 = *(void **)(a2 + v15);
  *(void *)(a1 + v15) = v17;
  uint64_t v18 = (void *)(a1 + v16);
  v19 = (void *)(a2 + v16);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  id v21 = v17;
  swift_retain();
  return a1;
}

uint64_t sub_100004458(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000A2D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = sub_100003BE4(&qword_100010160);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_retain();
  swift_release();
  uint64_t v8 = a3[9];
  uint64_t v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_10000A0C8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_100003BE4(qword_100010168);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[10];
  uint64_t v18 = *(void **)(a2 + v17);
  v19 = *(void **)(a1 + v17);
  *(void *)(a1 + v17) = v18;
  id v20 = v18;

  uint64_t v21 = a3[11];
  uint64_t v22 = (void *)(a1 + v21);
  id v23 = (void *)(a2 + v21);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100004678(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000A2D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = sub_100003BE4(&qword_100010160);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  uint64_t v8 = a3[9];
  uint64_t v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_10000A0C8();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100003BE4(qword_100010168);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  return a1;
}

uint64_t sub_1000047FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000A2D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = sub_100003BE4(&qword_100010160);
  *(void *)(a1 + *(int *)(v7 + 28)) = *(void *)(a2 + *(int *)(v7 + 28));
  swift_release();
  uint64_t v8 = a3[9];
  uint64_t v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_10000A0C8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = sub_100003BE4(qword_100010168);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[10];
  uint64_t v18 = *(void **)(a1 + v17);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);

  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  swift_release();
  return a1;
}

uint64_t sub_100004A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004A18);
}

uint64_t sub_100004A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100003BE4(&qword_100010160);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100003BE4(qword_100010168);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 36);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 40));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_100004B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004B48);
}

uint64_t sub_100004B48(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100003BE4(&qword_100010160);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100003BE4(qword_100010168);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 36);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for CachedAsyncImage()
{
  return sub_1000065EC();
}

void sub_100004C78(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_100004CDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004D20@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v51 = a2;
  uint64_t v4 = sub_10000A4D8();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v48 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = *(void *)(a1 - 8);
  uint64_t v44 = *(void *)(v41 + 64);
  __chkstk_darwin(v5);
  v42 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100003BE4(qword_100010168);
  __chkstk_darwin(v47);
  uint64_t v40 = (uint64_t)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10000A2D8();
  uint64_t v9 = *(void *)(v39 - 8);
  uint64_t v10 = __chkstk_darwin(v39);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v46 = *(void *)(v13 - 8);
  __chkstk_darwin(v10);
  v37 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003C90(&qword_100010200);
  uint64_t v15 = sub_10000A2E8();
  uint64_t v45 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  v38 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v43 = (char *)&v36 - v18;
  v19 = *(void (**)(char *))(v2 + *(int *)(a1 + 44));
  sub_100003BE4(&qword_100010160);
  uint64_t v20 = v2;
  sub_10000A468();
  v19(v12);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v39);
  uint64_t v21 = v40;
  sub_100005F28(v2 + *(int *)(a1 + 36), v40);
  uint64_t v23 = v41;
  uint64_t v22 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v42, v20, a1);
  unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = *(void *)(a1 + 24);
  *(void *)(v25 + 16) = v13;
  *(void *)(v25 + 24) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))(v25 + v24, v22, a1);
  sub_100006318();
  v27 = v48;
  sub_10000A4C8();
  v28 = v38;
  v29 = v37;
  sub_10000A3F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v27, v50);
  sub_1000063E4(v21);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v29, v13);
  unint64_t v30 = sub_100006444();
  uint64_t v52 = v26;
  unint64_t v53 = v30;
  swift_getWitnessTable();
  uint64_t v31 = v45;
  v32 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  v33 = v43;
  v32(v43, v28, v15);
  v34 = *(void (**)(char *, uint64_t))(v31 + 8);
  v34(v28, v15);
  v32(v51, v33, v15);
  return ((uint64_t (*)(char *, uint64_t))v34)(v33, v15);
}

uint64_t sub_10000524C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  uint64_t v4 = sub_10000A2D8();
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  sub_100003BE4(qword_100010168);
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_10000A0C8();
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  sub_10000A4B8();
  v3[18] = sub_10000A4A8();
  uint64_t v7 = sub_10000A498();
  v3[19] = v7;
  v3[20] = v6;
  return _swift_task_switch(sub_1000053E0, v7, v6);
}

uint64_t sub_1000053E0()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = type metadata accessor for CachedAsyncImage();
  sub_100005F28(v4 + *(int *)(v5 + 36), v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v6 = *(void *)(v0 + 112);
    swift_release();
    sub_1000063E4(v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 128) + 32))(*(void *)(v0 + 136), *(void *)(v0 + 112), *(void *)(v0 + 120));
    *(_DWORD *)(v0 + 208) = *(_DWORD *)(v5 + 40);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_100005578;
    uint64_t v10 = *(void *)(v0 + 136);
    return NSURLSession.data(for:delegate:)(v10, 0);
  }
}

uint64_t sub_100005578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  uint64_t v6 = (void *)*v4;
  v6[22] = a1;
  v6[23] = a2;
  v6[24] = a3;
  v6[25] = v3;
  swift_task_dealloc();
  uint64_t v7 = v5[20];
  uint64_t v8 = v5[19];
  if (v3) {
    uint64_t v9 = sub_100005C20;
  }
  else {
    uint64_t v9 = sub_1000056C0;
  }
  return _swift_task_switch(v9, v8, v7);
}

uint64_t sub_1000056C0()
{
  uint64_t v45 = v0;
  uint64_t v2 = *(void *)(v0 + 176);
  unint64_t v1 = *(void *)(v0 + 184);
  swift_release();
  id v3 = objc_allocWithZone((Class)UIImage);
  sub_1000064E8(v2, v1);
  Class isa = sub_10000A0E8().super.isa;
  id v5 = [v3 initWithData:isa];
  sub_100006540(v2, v1);

  if (v5)
  {
    uint64_t v6 = *(int *)(v0 + 208);
    uint64_t v8 = *(void *)(v0 + 96);
    uint64_t v7 = *(uint64_t **)(v0 + 104);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v10 = *(void *)(v0 + 88);
    uint64_t v11 = *(void *)(v0 + 56);
    *uint64_t v7 = sub_10000A418();
    (*(void (**)(uint64_t *, void, uint64_t))(v10 + 104))(v7, enum case for AsyncImagePhase.success(_:), v9);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v10 + 16))(v8, v7, v9);
    swift_retain();
    sub_100003BE4(&qword_100010160);
    sub_10000A478();
    (*(void (**)(uint64_t *, uint64_t))(v10 + 8))(v7, v9);
    id v12 = [*(id *)(v11 + v6) configuration];
    id v13 = [v12 URLCache];

    unint64_t v14 = *(void *)(v0 + 184);
    uint64_t v15 = *(void **)(v0 + 192);
    uint64_t v16 = *(void *)(v0 + 176);
    uint64_t v18 = *(void *)(v0 + 128);
    uint64_t v17 = *(void *)(v0 + 136);
    if (v13)
    {
      uint64_t v43 = *(void *)(v0 + 120);
      id v19 = objc_allocWithZone((Class)NSCachedURLResponse);
      sub_1000064E8(v16, v14);
      id v20 = v15;
      Class v21 = sub_10000A0E8().super.isa;
      id v22 = [v19 initWithResponse:v20 data:v21];
      sub_100006540(v16, v14);

      Class v23 = sub_10000A0A8();
      [v13 storeCachedResponse:v22 forRequest:v23];

      sub_100006540(v16, v14);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v43);
    }
    else
    {
      (*(void (**)(void, void))(v18 + 8))(*(void *)(v0 + 136), *(void *)(v0 + 120));
      swift_release();

      sub_100006540(v16, v14);
    }
  }
  else
  {
    unint64_t v24 = *(void *)(v0 + 184);
    uint64_t v25 = *(void **)(v0 + 192);
    uint64_t v26 = *(void *)(v0 + 176);
    uint64_t v28 = *(void *)(v0 + 128);
    uint64_t v27 = *(void *)(v0 + 136);
    uint64_t v29 = *(void *)(v0 + 120);
    sub_100006598();
    uint64_t v30 = swift_allocError();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);

    sub_100006540(v26, v24);
    if (qword_1000100F0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_10000A158();
    sub_1000064B0(v31, (uint64_t)qword_1000107B8);
    swift_errorRetain();
    swift_errorRetain();
    v32 = sub_10000A138();
    os_log_type_t v33 = sub_10000A4F8();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)v34 = 136315138;
      swift_getErrorValue();
      uint64_t v35 = sub_10000A588();
      *(void *)(v0 + 48) = sub_1000092CC(v35, v36, &v44);
      sub_10000A528();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "CachedAsyncImageError: %s", v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v38 = *(void *)(v0 + 96);
    v37 = *(uint64_t **)(v0 + 104);
    uint64_t v39 = *(void *)(v0 + 80);
    uint64_t v40 = *(void *)(v0 + 88);
    uint64_t *v37 = v30;
    (*(void (**)(uint64_t *, void, uint64_t))(v40 + 104))(v37, enum case for AsyncImagePhase.failure(_:), v39);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v40 + 16))(v38, v37, v39);
    sub_100003BE4(&qword_100010160);
    sub_10000A478();
    (*(void (**)(uint64_t *, uint64_t))(v40 + 8))(v37, v39);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
  return v41();
}

uint64_t sub_100005C20()
{
  uint64_t v18 = v0;
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = v0[25];
  if (qword_1000100F0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000A158();
  sub_1000064B0(v5, (uint64_t)qword_1000107B8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v6 = sub_10000A138();
  os_log_type_t v7 = sub_10000A4F8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_10000A588();
    v0[6] = sub_1000092CC(v9, v10, &v17);
    sub_10000A528();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "CachedAsyncImageError: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v12 = v0[12];
  uint64_t v11 = (void *)v0[13];
  uint64_t v13 = v0[10];
  uint64_t v14 = v0[11];
  void *v11 = v4;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v11, enum case for AsyncImagePhase.failure(_:), v13);
  (*(void (**)(uint64_t, void *, uint64_t))(v14 + 16))(v12, v11, v13);
  sub_100003BE4(&qword_100010160);
  sub_10000A478();
  (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_100005F08()
{
  return sub_10000A3E8();
}

uint64_t sub_100005F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003BE4(qword_100010168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005F90()
{
  uint64_t v1 = type metadata accessor for CachedAsyncImage();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = sub_10000A2D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  sub_100003BE4(&qword_100010160);
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 36);
  uint64_t v7 = sub_10000A0C8();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }

  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000613C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(type metadata accessor for CachedAsyncImage() - 8);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100006224;
  return sub_10000524C(v5, v2, v3);
}

uint64_t sub_100006224()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100006318()
{
  unint64_t result = qword_100010218;
  if (!qword_100010218)
  {
    sub_100003C90(qword_100010168);
    sub_10000638C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010218);
  }
  return result;
}

unint64_t sub_10000638C()
{
  unint64_t result = qword_100010220;
  if (!qword_100010220)
  {
    sub_10000A0C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010220);
  }
  return result;
}

uint64_t sub_1000063E4(uint64_t a1)
{
  uint64_t v2 = sub_100003BE4(qword_100010168);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100006444()
{
  unint64_t result = qword_100010228;
  if (!qword_100010228)
  {
    sub_100003C90(&qword_100010200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010228);
  }
  return result;
}

uint64_t sub_1000064B0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000064E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100006540(uint64_t a1, unint64_t a2)
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

unint64_t sub_100006598()
{
  unint64_t result = qword_100010230;
  if (!qword_100010230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010230);
  }
  return result;
}

uint64_t sub_1000065EC()
{
  return swift_getGenericMetadata();
}

ValueMetadata *type metadata accessor for CachedAsyncImageError()
{
  return &type metadata for CachedAsyncImageError;
}

uint64_t sub_10000662C()
{
  return swift_getWitnessTable();
}

uint64_t sub_10000669C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v74 = a3;
  uint64_t v75 = a1;
  uint64_t v68 = a2;
  uint64_t v5 = sub_100003BE4(&qword_100010160);
  __chkstk_darwin(v5 - 8);
  v64 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000A0C8();
  uint64_t v69 = *(void *)(v7 - 8);
  uint64_t v70 = v7;
  __chkstk_darwin(v7);
  v72 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100003BE4(qword_100010168);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  v71 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v66 = (char *)&v60 - v12;
  uint64_t v13 = sub_100003BE4(&qword_100010398);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000A0D8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  v65 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  Class v21 = (char *)&v60 - v20;
  uint64_t v22 = sub_10000A2D8();
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (uint64_t *)((char *)&v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v26 = [self defaultSessionConfiguration];
  id v73 = [objc_allocWithZone((Class)NSURLCache) init];
  objc_msgSend(v26, "setURLCache:");
  uint64_t v27 = self;
  id v67 = v26;
  id v28 = [v27 sessionWithConfiguration:v26];
  uint64_t v29 = (int *)sub_100003BE4(&qword_100010330);
  *(void *)(a4 + v29[10]) = v28;
  uint64_t v30 = (uint64_t *)(a4 + v29[11]);
  uint64_t v31 = v74;
  *uint64_t v30 = v68;
  v30[1] = v31;
  v32 = *(void (**)(uint64_t *, void, uint64_t))(v23 + 104);
  uint64_t v63 = v23 + 104;
  v61 = v32;
  v32(v25, enum case for AsyncImagePhase.empty(_:), v22);
  swift_retain();
  v62 = v25;
  uint64_t v68 = v22;
  sub_10000A458();
  sub_100009AD0(v75, (uint64_t)v15, &qword_100010398);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    uint64_t v33 = v69;
    uint64_t v34 = v70;
    sub_100009B34((uint64_t)v15, &qword_100010398);
    if (qword_1000100F0 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_10000A158();
    sub_1000064B0(v35, (uint64_t)qword_1000107B8);
    unint64_t v36 = sub_10000A138();
    os_log_type_t v37 = sub_10000A518();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v39 = v33;
    uint64_t v40 = (uint64_t)v71;
    uint64_t v41 = v72;
    if (v38)
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "CachedAsyncImage URL is nil", v42, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(a4 + v29[9], 1, 1, v34);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v21, v15, v16);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v65, v21, v16);
    uint64_t v43 = (uint64_t)v66;
    sub_10000A0B8();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v16);
    uint64_t v39 = v69;
    uint64_t v34 = v70;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v69 + 56))(v43, 0, 1, v70);
    sub_100009BF8(v43, a4 + v29[9]);
    uint64_t v40 = (uint64_t)v71;
    uint64_t v41 = v72;
  }
  sub_100009AD0(a4 + v29[9], v40, qword_100010168);
  int v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v40, 1, v34);
  id v45 = v73;
  if (v44 == 1)
  {
    swift_release();

    sub_100009B34(v75, &qword_100010398);
    return sub_100009B34(v40, qword_100010168);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v41, v40, v34);
  Class v47 = sub_10000A0A8();
  id v48 = [v45 cachedResponseForRequest:v47];

  if (v48)
  {
    id v49 = [v48 data];
    uint64_t v50 = sub_10000A0F8();
    unint64_t v52 = v51;

    id v53 = objc_allocWithZone((Class)UIImage);
    sub_1000064E8(v50, v52);
    Class isa = sub_10000A0E8().super.isa;
    id v55 = [v53 initWithData:isa];
    sub_100006540(v50, v52);

    if (v55)
    {
      uint64_t v56 = sub_10000A418();
      sub_100006540(v50, v52);
      v57 = v61;
      v58 = v62;
      uint64_t *v62 = v56;
      v57(v58, enum case for AsyncImagePhase.success(_:), v68);
      swift_retain();
      uint64_t v59 = (uint64_t)v64;
      sub_10000A458();

      swift_release();
      swift_release();

      sub_100009B34(v75, &qword_100010398);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v34);
      return sub_100009B90(v59, a4);
    }

    swift_release();
    sub_100006540(v50, v52);
  }
  else
  {

    swift_release();
  }
  sub_100009B34(v75, &qword_100010398);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v41, v34);
}

uint64_t *sub_100006EE0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_100003BE4(&qword_100010130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10000A288();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *((void *)v11 + 1);
    char v14 = v11[16];
    sub_100007024();
    *(void *)uint64_t v10 = v12;
    *((void *)v10 + 1) = v13;
    v10[16] = v14;
  }
  return a1;
}

uint64_t sub_100007024()
{
  return swift_retain();
}

uint64_t sub_10000702C(uint64_t a1)
{
  sub_100003BE4(&qword_100010130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_10000A288();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }

  return sub_1000070D4();
}

uint64_t sub_1000070D4()
{
  return swift_release();
}

void *sub_1000070DC(void *a1, void *a2, uint64_t a3)
{
  sub_100003BE4(&qword_100010130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10000A288();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_100007024();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  return a1;
}

void *sub_1000071D0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100009B34((uint64_t)a1, &qword_100010130);
    sub_100003BE4(&qword_100010130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_10000A288();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_100007024();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  sub_1000070D4();
  return a1;
}

char *sub_1000072E8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100003BE4(&qword_100010130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_10000A288();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  v9[16] = v10[16];
  return a1;
}

char *sub_1000073CC(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100009B34((uint64_t)a1, &qword_100010130);
    uint64_t v6 = sub_100003BE4(&qword_100010130);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_10000A288();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  char v11 = v10[16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  v9[16] = v11;
  sub_1000070D4();
  return a1;
}

uint64_t sub_1000074D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000074E8);
}

uint64_t sub_1000074E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100003BE4(&qword_100010238);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_1000075AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000075C0);
}

uint64_t sub_1000075C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100003BE4(&qword_100010238);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 16) = -(char)a2;
  }
  return result;
}

uint64_t type metadata accessor for ManagedAppCell()
{
  uint64_t result = qword_100010298;
  if (!qword_100010298) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000076D0()
{
  sub_100007764();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100007764()
{
  if (!qword_1000102A8)
  {
    sub_10000A288();
    unint64_t v0 = sub_10000A298();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000102A8);
    }
  }
}

uint64_t sub_1000077BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000077D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v72 = a1;
  uint64_t v71 = sub_10000A288();
  uint64_t v70 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v69 = (uint64_t)&v48 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_10000A178();
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  v66 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_10000A278();
  uint64_t v61 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v60 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000A188();
  __chkstk_darwin(v4 - 8);
  id v48 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100003BE4(&qword_1000102D8);
  uint64_t v54 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  id v49 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100003BE4(&qword_1000102E0) - 8;
  __chkstk_darwin(v52);
  uint64_t v50 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100003BE4(&qword_1000102E8) - 8;
  __chkstk_darwin(v53);
  unint64_t v51 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100003BE4(&qword_1000102F0);
  __chkstk_darwin(v57);
  uint64_t v56 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100003BE4(&qword_1000102F8);
  uint64_t v64 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  v58 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100003BE4(&qword_100010300) - 8;
  __chkstk_darwin(v62);
  uint64_t v59 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ManagedAppCell();
  sub_10000A248();
  sub_100008B78();
  sub_10000A2A8();
  uint64_t v12 = sub_10000A1D8();
  uint64_t v14 = v13;
  swift_release();
  v89 = &type metadata for String;
  unint64_t v15 = sub_100008BD0();
  unint64_t v90 = v15;
  uint64_t v87 = v12;
  uint64_t v88 = v14;
  sub_10000A2A8();
  uint64_t v16 = sub_10000A228();
  uint64_t v18 = v17;
  swift_release();
  v85 = &type metadata for String;
  unint64_t v86 = v15;
  uint64_t v83 = v16;
  uint64_t v84 = v18;
  v81 = &type metadata for String;
  unint64_t v82 = v15;
  uint64_t v79 = 0;
  unint64_t v80 = 0xE000000000000000;
  v77 = &type metadata for String;
  unint64_t v78 = v15;
  uint64_t v75 = 0;
  unint64_t v76 = 0xE000000000000000;
  sub_10000A2A8();
  sub_10000A198();
  swift_release();
  sub_10000A2A8();
  sub_10000A1A8();
  swift_release();
  uint64_t v74 = v73;
  sub_100003BE4(&qword_100010318);
  sub_100008C2C();
  uint64_t v19 = v49;
  sub_10000A168();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_allocObject();
  sub_10000A2A8();
  swift_weakInit();
  swift_release();
  uint64_t v22 = v54;
  uint64_t v23 = (uint64_t)v50;
  uint64_t v24 = v55;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v50, v19, v55);
  uint64_t v25 = (uint64_t *)(v23 + *(int *)(v52 + 44));
  *uint64_t v25 = KeyPath;
  v25[1] = (uint64_t)sub_100008D6C;
  v25[2] = v21;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v24);
  uint64_t v26 = v61;
  uint64_t v27 = v60;
  uint64_t v28 = v63;
  (*(void (**)(char *, void, uint64_t))(v61 + 104))(v60, enum case for OfferView.Space.offerButtonParent(_:), v63);
  uint64_t v29 = (uint64_t)v51;
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(&v51[*(int *)(v53 + 44)], v27, v28);
  sub_100009AD0(v23, v29, &qword_1000102E0);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  sub_100009B34(v23, &qword_1000102E0);
  uint64_t v30 = sub_10000A2A8();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_100008D74;
  *(void *)(v31 + 24) = v30;
  uint64_t v32 = v56;
  sub_100009AD0(v29, v56, &qword_1000102E8);
  uint64_t v33 = (void *)(v32 + *(int *)(v57 + 36));
  void *v33 = sub_100008B48;
  v33[1] = 0;
  v33[2] = sub_100008D78;
  v33[3] = v31;
  sub_100009B34(v29, &qword_1000102E8);
  sub_10000A2A8();
  uint64_t v34 = v66;
  sub_10000A1F8();
  swift_release();
  sub_100008DA4();
  uint64_t v35 = v58;
  sub_10000A3B8();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v34, v68);
  sub_100009B34(v32, &qword_1000102F0);
  uint64_t v36 = swift_getKeyPath();
  uint64_t v37 = v64;
  uint64_t v38 = (uint64_t)v59;
  uint64_t v39 = v65;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v59, v35, v65);
  uint64_t v40 = v38 + *(int *)(v62 + 44);
  *(void *)uint64_t v40 = v36;
  *(unsigned char *)(v40 + 8) = 1;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v39);
  sub_10000A408();
  uint64_t v41 = v69;
  sub_100009000(v69);
  uint64_t v42 = sub_10000A1E8();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v41, v71);
  uint64_t v43 = swift_getKeyPath();
  uint64_t v87 = v42;
  swift_retain();
  uint64_t v44 = sub_10000A2B8();
  uint64_t v45 = v72;
  sub_100009AD0(v38, v72, &qword_100010300);
  swift_release();
  uint64_t v46 = (uint64_t *)(v45 + *(int *)(sub_100003BE4(&qword_100010388) + 36));
  *uint64_t v46 = v43;
  v46[1] = v44;
  return sub_100009B34(v38, &qword_100010300);
}

uint64_t sub_100008254@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v1 = sub_100003BE4(&qword_100010398);
  __chkstk_darwin(v1 - 8);
  uint64_t v12 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100003BE4(&qword_100010330);
  __chkstk_darwin(v13);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100003BE4(&qword_1000103A0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ManagedAppCell();
  sub_10000A248();
  sub_100008B78();
  sub_10000A2A8();
  char v8 = sub_10000A238();
  swift_release();
  if (v8)
  {
    swift_storeEnumTagMultiPayload();
    sub_100009E44(&qword_100010328, &qword_100010330);
    return sub_10000A398();
  }
  else
  {
    sub_10000A2A8();
    uint64_t v10 = (uint64_t)v12;
    sub_10000A1B8();
    swift_release();
    sub_10000669C(v10, (uint64_t)sub_100008510, 0, (uint64_t)v4);
    sub_100009AD0((uint64_t)v4, (uint64_t)v7, &qword_100010330);
    swift_storeEnumTagMultiPayload();
    sub_100009E44(&qword_100010328, &qword_100010330);
    sub_10000A398();
    return sub_100009B34((uint64_t)v4, &qword_100010330);
  }
}

uint64_t sub_100008510@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = sub_10000A128();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000A428();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000A2D8();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v14, v11);
  if (v15 == enum case for AsyncImagePhase.success(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
    uint64_t v16 = sub_10000A438();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v26 = v16;
    LOBYTE(v27) = 0;
    swift_retain();
    sub_10000A398();
    uint64_t v26 = v28;
    __int16 v27 = v29;
    swift_retain();
    sub_100003BE4(&qword_1000103A8);
    sub_100009C60();
    sub_10000A398();
    swift_release();
    swift_release();
  }
  else
  {
    if (v15 == enum case for AsyncImagePhase.failure(_:))
    {
      (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
      swift_errorRelease();
    }
    else if (v15 != enum case for AsyncImagePhase.empty(_:))
    {
      uint64_t v26 = 0;
      __int16 v27 = 256;
      sub_100003BE4(&qword_1000103A8);
      sub_100009C60();
      sub_10000A398();
      uint64_t v20 = v28;
      unsigned __int8 v21 = v29;
      char v22 = v30;
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      goto LABEL_10;
    }
    if (qword_100010100 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1000064B0(v3, (uint64_t)qword_1000107D0);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v17, v3);
    sub_10000A448();
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
    uint64_t v18 = sub_10000A438();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v26 = v18;
    LOBYTE(v27) = 1;
    swift_retain();
    sub_10000A398();
    uint64_t v26 = v28;
    __int16 v27 = v29;
    sub_100003BE4(&qword_1000103A8);
    sub_100009C60();
    sub_10000A398();
  }
  uint64_t result = swift_release();
  uint64_t v20 = v28;
  unsigned __int8 v21 = v29;
  char v22 = v30;
LABEL_10:
  uint64_t v23 = v25;
  *uint64_t v25 = v20;
  *((unsigned char *)v23 + 8) = v21;
  *((unsigned char *)v23 + 9) = v22;
  return result;
}

uint64_t sub_100008A5C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  return sub_10000A328();
}

uint64_t sub_100008AC8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10000A208();
    return swift_release();
  }
  return result;
}

uint64_t sub_100008B48@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10000A2C8();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

unint64_t sub_100008B78()
{
  unint64_t result = qword_100010308;
  if (!qword_100010308)
  {
    sub_10000A248();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010308);
  }
  return result;
}

unint64_t sub_100008BD0()
{
  unint64_t result = qword_100010310;
  if (!qword_100010310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010310);
  }
  return result;
}

uint64_t sub_100008C24@<X0>(uint64_t a1@<X8>)
{
  return sub_100008254(a1);
}

unint64_t sub_100008C2C()
{
  unint64_t result = qword_100010320;
  if (!qword_100010320)
  {
    sub_100003C90(&qword_100010318);
    sub_100009E44(&qword_100010328, &qword_100010330);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010320);
  }
  return result;
}

uint64_t sub_100008CCC@<X0>(uint64_t (**a1)(double *a1)@<X8>)
{
  uint64_t v2 = sub_10000A318();
  uint64_t v4 = v3;
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v2;
  *(void *)(result + 24) = v4;
  *a1 = sub_100009AA0;
  a1[1] = (uint64_t (*)(double *))result;
  return result;
}

uint64_t sub_100008D34()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008D6C()
{
  return sub_100008AC8();
}

uint64_t sub_100008D78(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

unint64_t sub_100008DA4()
{
  unint64_t result = qword_100010338;
  if (!qword_100010338)
  {
    sub_100003C90(&qword_1000102F0);
    sub_100008E44();
    sub_100009E44(&qword_100010378, &qword_100010380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010338);
  }
  return result;
}

unint64_t sub_100008E44()
{
  unint64_t result = qword_100010340;
  if (!qword_100010340)
  {
    sub_100003C90(&qword_1000102E8);
    sub_100008EE4();
    sub_100009E44(&qword_100010368, &qword_100010370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010340);
  }
  return result;
}

unint64_t sub_100008EE4()
{
  unint64_t result = qword_100010348;
  if (!qword_100010348)
  {
    sub_100003C90(&qword_1000102E0);
    sub_100009E44(&qword_100010350, &qword_1000102D8);
    sub_100009E44(&qword_100010358, &qword_100010360);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010348);
  }
  return result;
}

uint64_t sub_100008FA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000A2F8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100008FD8()
{
  return sub_10000A308();
}

uint64_t sub_100009000@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10000A388();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100003BE4(&qword_100010130);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009AD0(v2, (uint64_t)v10, &qword_100010130);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_10000A288();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_10000A508();
    uint64_t v14 = sub_10000A3A8();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v18[2] = sub_1000092CC(0x686353726F6C6F43, 0xEB00000000656D65, &v19);
      sub_10000A528();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10000A378();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1000092BC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000092CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000093A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000099CC((uint64_t)v12, *a3);
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
      sub_1000099CC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000997C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000093A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A538();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000955C(a5, a6);
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
  uint64_t v8 = sub_10000A558();
  if (!v8)
  {
    sub_10000A568();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A578();
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

uint64_t sub_10000955C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000095F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000097D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000097D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000095F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000976C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A548();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000A568();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A488();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A578();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000A568();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000976C(uint64_t a1, uint64_t a2)
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
  sub_100003BE4(&qword_100010390);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000097D4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003BE4(&qword_100010390);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_10000A578();
  __break(1u);
  return result;
}

uint64_t sub_100009924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A358();
  *a1 = result;
  return result;
}

uint64_t sub_100009950()
{
  return sub_10000A368();
}

uint64_t sub_10000997C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000099CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009A2C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009A64(double a1, double a2, double a3, double a4)
{
  size_t v5 = *(uint64_t (**)(void *))(v4 + 16);
  *(double *)int64_t v7 = a1;
  *(double *)&v7[1] = a2;
  *(double *)&v7[2] = a3;
  *(double *)&v7[3] = a4;
  return v5(v7);
}

uint64_t sub_100009AA0(double *a1)
{
  return (*(uint64_t (**)(double, double, double, double))(v1 + 16))(*a1, a1[1], a1[2], a1[3]);
}

uint64_t sub_100009AD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003BE4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009B34(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003BE4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003BE4(&qword_100010160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003BE4(qword_100010168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100009C60()
{
  unint64_t result = qword_1000103B0;
  if (!qword_1000103B0)
  {
    sub_100003C90(&qword_1000103A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103B0);
  }
  return result;
}

unint64_t sub_100009CD0()
{
  unint64_t result = qword_1000103B8;
  if (!qword_1000103B8)
  {
    sub_100003C90(&qword_100010388);
    sub_100009D70();
    sub_100009E44(&qword_1000103D8, &qword_1000103E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103B8);
  }
  return result;
}

unint64_t sub_100009D70()
{
  unint64_t result = qword_1000103C0;
  if (!qword_1000103C0)
  {
    sub_100003C90(&qword_100010300);
    sub_100003C90(&qword_1000102F0);
    sub_100008DA4();
    swift_getOpaqueTypeConformance2();
    sub_100009E44(&qword_1000103C8, &qword_1000103D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103C0);
  }
  return result;
}

uint64_t sub_100009E44(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003C90(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009E90()
{
  uint64_t v0 = sub_10000A158();
  sub_100009F10(v0, qword_1000107B8);
  sub_1000064B0(v0, (uint64_t)qword_1000107B8);
  return sub_10000A148();
}

uint64_t *sub_100009F10(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100009F74()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_100009FA8()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_1000103E8 = (uint64_t)result;
  return result;
}

uint64_t sub_10000A000()
{
  uint64_t v0 = sub_10000A128();
  sub_100009F10(v0, qword_1000107D0);
  sub_1000064B0(v0, (uint64_t)qword_1000107D0);
  if (qword_1000100F8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_1000103E8;
  return sub_10000A118();
}

Class sub_10000A0A8()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_10000A0B8()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t sub_10000A0C8()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_10000A0D8()
{
  return type metadata accessor for URL();
}

NSData sub_10000A0E8()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000A0F8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A108()
{
  return static AppExtension<>.main()();
}

uint64_t sub_10000A118()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10000A128()
{
  return type metadata accessor for ImageResource();
}

uint64_t sub_10000A138()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A148()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A158()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000A168()
{
  return ManagedContentView.init(primaryLabel:secondaryLabel:tertiaryLabel:quaternaryLabel:offerState:offerAction:icon:)();
}

uint64_t sub_10000A178()
{
  return type metadata accessor for ManagedContentStyle();
}

uint64_t sub_10000A188()
{
  return type metadata accessor for ManagedContentOfferState();
}

uint64_t sub_10000A198()
{
  return ManagedAppCellViewModel.offerState.getter();
}

uint64_t sub_10000A1A8()
{
  return ManagedAppCellViewModel.offerAction.getter();
}

uint64_t sub_10000A1B8()
{
  return ManagedAppCellViewModel.iconImageURL.getter();
}

uint64_t sub_10000A1C8()
{
  return ManagedAppCellViewModel.init(exportedObject:)();
}

uint64_t sub_10000A1D8()
{
  return ManagedAppCellViewModel.name.getter();
}

uint64_t sub_10000A1E8()
{
  return static ManagedAppCellViewModel.color(for:in:)();
}

uint64_t sub_10000A1F8()
{
  return ManagedAppCellViewModel.style.getter();
}

uint64_t sub_10000A208()
{
  return ManagedAppCellViewModel.report(buttonFrame:)();
}

uint64_t sub_10000A218()
{
  return ManagedAppCellViewModel.report(viewSize:)();
}

uint64_t sub_10000A228()
{
  return ManagedAppCellViewModel.subtitle.getter();
}

uint64_t sub_10000A238()
{
  return ManagedAppCellViewModel.isInitial.getter();
}

uint64_t sub_10000A248()
{
  return type metadata accessor for ManagedAppCellViewModel();
}

uint64_t sub_10000A278()
{
  return type metadata accessor for OfferView.Space();
}

uint64_t sub_10000A288()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_10000A298()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_10000A2A8()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_10000A2B8()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_10000A2C8()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_10000A2D8()
{
  return type metadata accessor for AsyncImagePhase();
}

uint64_t sub_10000A2E8()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_10000A2F8()
{
  return EnvironmentValues.isViewService.getter();
}

uint64_t sub_10000A308()
{
  return EnvironmentValues.isViewService.setter();
}

uint64_t sub_10000A318()
{
  return EnvironmentValues.reportOfferButtonFrame.getter();
}

uint64_t sub_10000A328()
{
  return EnvironmentValues.reportOfferButtonFrame.setter();
}

uint64_t sub_10000A338()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10000A348()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_10000A358()
{
  return EnvironmentValues.tint.getter();
}

uint64_t sub_10000A368()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_10000A378()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10000A388()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10000A398()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10000A3A8()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10000A3B8()
{
  return View.managedContentStyle(_:)();
}

uint64_t sub_10000A3C8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10000A3D8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10000A3E8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10000A3F8()
{
  return View.task<A>(id:priority:_:)();
}

uint64_t sub_10000A408()
{
  return static Color.accentColor.getter();
}

uint64_t sub_10000A418()
{
  return Image.init(uiImage:)();
}

uint64_t sub_10000A428()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_10000A438()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_10000A448()
{
  return Image.init(_:)();
}

uint64_t sub_10000A458()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_10000A468()
{
  return State.wrappedValue.getter();
}

uint64_t sub_10000A478()
{
  return State.wrappedValue.setter();
}

Swift::Int sub_10000A488()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A498()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000A4A8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000A4B8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000A4C8()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_10000A4D8()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000A4F8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A508()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10000A518()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000A528()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A538()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A548()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A558()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A568()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A578()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A588()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000A598()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10000A5A8()
{
  return Error._code.getter();
}

uint64_t sub_10000A5B8()
{
  return Error._domain.getter();
}

uint64_t sub_10000A5C8()
{
  return Error._userInfo.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}