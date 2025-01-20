__n128 initializeWithTake for PageControl(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

uint64_t sub_100003910@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v24 = sub_100005458(&qword_10006C190);
  uint64_t v2 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100005458(&qword_10006C198);
  __chkstk_darwin(v21);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100005458(&qword_10006C1A0);
  __chkstk_darwin(v23);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100005458(&qword_10006C1A8);
  __chkstk_darwin(v22);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v1;
  uint64_t v26 = v1;
  sub_100005458(&qword_10006C1B0);
  sub_100005458(&qword_10006C1B8);
  sub_100006138();
  sub_100006E54(&qword_10006C1E8, &qword_10006C1B8);
  sub_10004A260();
  type metadata accessor for ColorSpaceButton();
  sub_100005458(&qword_10006C0C8);
  sub_100049CC0();
  sub_10004A640();
  sub_100049E10();
  uint64_t v11 = v24;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v6, v4, v24);
  v12 = &v6[*(int *)(v21 + 36)];
  long long v13 = v33;
  *((_OWORD *)v12 + 4) = v32;
  *((_OWORD *)v12 + 5) = v13;
  *((_OWORD *)v12 + 6) = v34;
  long long v14 = v29;
  *(_OWORD *)v12 = v28;
  *((_OWORD *)v12 + 1) = v14;
  long long v15 = v31;
  *((_OWORD *)v12 + 2) = v30;
  *((_OWORD *)v12 + 3) = v15;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v11);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100006524((uint64_t)v6, (uint64_t)v8, &qword_10006C198);
  v17 = &v8[*(int *)(v23 + 36)];
  *(void *)v17 = KeyPath;
  v17[8] = 1;
  sub_100006588((uint64_t)v6, &qword_10006C198);
  sub_100006524((uint64_t)v8, (uint64_t)v10, &qword_10006C1A0);
  v18 = (uint64_t (**)())&v10[*(int *)(v22 + 36)];
  *v18 = sub_100004980;
  v18[1] = 0;
  sub_100006588((uint64_t)v8, &qword_10006C1A0);
  return sub_100006730((uint64_t)v10, v25, &qword_10006C1A8);
}

uint64_t sub_100003D70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorSpaceButton();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006794(a1, (uint64_t)v5);
  sub_10004A840();
  uint64_t v6 = sub_10004A830();
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  *(void *)(v8 + 24) = &protocol witness table for MainActor;
  sub_1000067FC((uint64_t)v5, v8 + v7);
  sub_100006794(a1, (uint64_t)v5);
  uint64_t v9 = sub_10004A830();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = &protocol witness table for MainActor;
  sub_1000067FC((uint64_t)v5, v10 + v7);
  sub_10004A590();
  uint64_t v28 = v24;
  uint64_t v29 = v25;
  char v30 = v26;
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v13 = sub_10004A700();
  NSString v14 = sub_10004A700();
  id v15 = [v12 localizedStringForKey:v13 value:0 table:v14];

  uint64_t v16 = sub_10004A740();
  uint64_t v18 = v17;

  uint64_t v24 = v16;
  uint64_t v25 = v18;
  sub_100006678();
  uint64_t v24 = sub_10004A2F0();
  uint64_t v25 = v19;
  char v26 = v20 & 1;
  uint64_t v27 = v21;
  sub_100005458(&qword_10006C220);
  sub_100006AC0();
  sub_100006B14();
  return sub_10004A540();
}

uint64_t sub_10000407C()
{
  return sub_10004A5E0();
}

uint64_t sub_100004150@<X0>(uint64_t a1@<X8>)
{
  sub_100018868();
  sub_100006678();
  uint64_t result = sub_10004A2F0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000041AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v53 = sub_100049DB0();
  uint64_t v3 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v5 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005458((uint64_t *)&unk_10006C1F0);
  uint64_t v57 = *(void *)(v6 - 8);
  uint64_t v58 = v6;
  __chkstk_darwin(v6);
  v54 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100005458(&qword_10006C1B0) - 8;
  __chkstk_darwin(v56);
  v55 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v52 = ObjCClassFromMetadata;
  uint64_t v10 = self;
  id v11 = [v10 bundleForClass:ObjCClassFromMetadata];
  NSString v12 = sub_10004A700();
  NSString v13 = sub_10004A700();
  id v14 = [v11 localizedStringForKey:v12 value:0 table:v13];

  sub_10004A740();
  sub_100005458(&qword_10006C200);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004C900;
  uint64_t v16 = *(void *)(a1 + 8);
  char v17 = *(unsigned char *)(a1 + 48);
  uint64_t v60 = *(void *)a1;
  uint64_t v61 = v16;
  long long v18 = *(_OWORD *)(a1 + 32);
  long long v62 = *(_OWORD *)(a1 + 16);
  long long v63 = v18;
  char v64 = v17;
  sub_100005458(&qword_10006C208);
  sub_10004A550();
  uint64_t v19 = sub_100018868();
  uint64_t v21 = v20;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 64) = sub_100006624();
  *(void *)(v15 + 32) = v19;
  *(void *)(v15 + 40) = v21;
  uint64_t v22 = sub_10004A710();
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v60 = v22;
  uint64_t v61 = v24;
  sub_100006678();
  uint64_t v25 = sub_10004A2F0();
  uint64_t v27 = v26;
  v51[0] = v26;
  uint64_t v29 = v28;
  v51[1] = v28;
  char v31 = v30 & 1;
  type metadata accessor for ColorSpaceButton();
  sub_100031790((uint64_t)v5);
  LOBYTE(v22) = sub_100049DA0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v53);
  if (v22) {
    char v32 = 1;
  }
  else {
    char v32 = 2;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v60 = v25;
  uint64_t v61 = v27;
  LOBYTE(v62) = v31;
  *((void *)&v62 + 1) = v29;
  *(void *)&long long v63 = KeyPath;
  BYTE8(v63) = v32;
  id v34 = [v10 bundleForClass:v52];
  NSString v35 = sub_10004A700();
  NSString v36 = sub_10004A700();
  id v37 = [v34 localizedStringForKey:v35 value:0 table:v36];

  uint64_t v38 = sub_10004A740();
  uint64_t v40 = v39;

  uint64_t v65 = v38;
  uint64_t v66 = v40;
  uint64_t v41 = sub_10004A2F0();
  uint64_t v43 = v42;
  LOBYTE(v36) = v44 & 1;
  sub_100005458(&qword_10006C1C8);
  sub_100006230();
  v45 = v54;
  sub_10004A3A0();
  sub_100006720(v41, v43, (char)v36);
  swift_bridgeObjectRelease();
  sub_100006720(v25, v51[0], v31);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v47 = v57;
  uint64_t v46 = v58;
  uint64_t v48 = (uint64_t)v55;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v55, v45, v58);
  v49 = (uint64_t (**)())(v48 + *(int *)(v56 + 44));
  *v49 = sub_100004980;
  v49[1] = 0;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v46);
  return sub_100006730(v48, v59, &qword_10006C1B0);
}

uint64_t sub_100004730@<X0>(unsigned char *a1@<X8>)
{
  sub_100005458(&qword_10006C208);
  uint64_t result = sub_10004A550();
  *a1 = v3;
  return result;
}

uint64_t sub_100004790(unsigned __int8 *a1)
{
  int v1 = *a1;
  sub_100005458(&qword_10006C208);
  uint64_t result = sub_10004A550();
  if (v1 != v3)
  {
    __chkstk_darwin(result);
    sub_10004A650();
    sub_100049D70();
    return swift_release();
  }
  return result;
}

uint64_t sub_10000486C(uint64_t a1, char a2)
{
  sub_100005458(&qword_10006C208);
  sub_10004A550();
  if (a2) {
    sub_100019138((uint64_t)v4);
  }
  else {
    sub_10001896C((uint64_t)v4);
  }
  return sub_10004A560();
}

uint64_t sub_100004960()
{
  return sub_10004A380();
}

uint64_t sub_100004980()
{
  return sub_100049CA0();
}

void sub_1000049A8(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1000049B0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1000049C4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1000049D8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1000049EC(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100004A1C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100004A48@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100004A6C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100004A80(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100004A94(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100004AA8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100004ABC(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100004AD0(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100004AE4(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100004AF8()
{
  return *v0 == 0;
}

uint64_t sub_100004B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100004B20(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_100004B34@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100004B40()
{
  swift_getWitnessTable();

  return sub_1000499E0();
}

uint64_t sub_100004BAC(uint64_t a1, uint64_t a2)
{
  return sub_100004E08(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100004BD0(uint64_t a1, id *a2)
{
  uint64_t result = sub_10004A720();
  *a2 = 0;
  return result;
}

uint64_t sub_100004C48(uint64_t a1, id *a2)
{
  char v3 = sub_10004A730();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004CC8@<X0>(void *a1@<X8>)
{
  sub_10004A740();
  NSString v2 = sub_10004A700();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

NSNumber sub_100004D0C()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_100004D14(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000499B0();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t sub_100004D68(uint64_t a1, uint64_t a2)
{
  char v3 = sub_1000499C0();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_100004DC0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000499D0();
  *a1 = v3;
  return result;
}

uint64_t sub_100004DE8(uint64_t a1, uint64_t a2)
{
  return sub_100004E08(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004E08(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10004A740();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004E4C()
{
  sub_10004A740();
  sub_10004A760();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004EA0()
{
  sub_10004A740();
  sub_10004ABF0();
  sub_10004A760();
  Swift::Int v0 = sub_10004AC20();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_100004F14(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100004F28@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100007294(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void sub_100004F68(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004F78()
{
  uint64_t v0 = sub_10004A740();
  uint64_t v2 = v1;
  if (v0 == sub_10004A740() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10004AB60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for UIKeyboardType(uint64_t a1)
{
}

uint64_t sub_10000502C()
{
  return sub_1000051C8(&qword_10006C0A8, type metadata accessor for CFString);
}

uint64_t sub_100005074()
{
  return sub_100049A00();
}

uint64_t sub_1000050C0()
{
  return sub_1000499F0();
}

Swift::Int sub_100005118()
{
  return sub_10004AC20();
}

uint64_t sub_100005180()
{
  return sub_1000051C8(&qword_10006C0B0, type metadata accessor for CFString);
}

uint64_t sub_1000051C8(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for SomeColor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100005258(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100005264(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005284(uint64_t result, int a2, int a3)
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

uint64_t sub_1000052C4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    long long v8 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    *(_OWORD *)(a1 + 32) = v8;
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    swift_retain();
    swift_retain();
    uint64_t v12 = sub_100005458(&qword_10006C0C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = *(int *)(a3 + 24);
    id v14 = (void *)(a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_100049DB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *id v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100005458(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000549C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100005458(&qword_10006C0C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100049DB0();
    long long v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1000055AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  swift_retain();
  swift_retain();
  uint64_t v11 = sub_100005458(&qword_10006C0C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  id v14 = (void *)(a2 + v12);
  sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100049DB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1000056E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100005458(&qword_10006C0C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_100006588(a1 + v10, &qword_10006C0D0);
    sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_100049DB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100005870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005458(&qword_10006C0C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100049DB0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1000059B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005458(&qword_10006C0C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_100006588(a1 + v11, &qword_10006C0D0);
    uint64_t v14 = sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_100049DB0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100005B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005B34);
}

uint64_t sub_100005B34(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100005458(&qword_10006C0C8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100005458(&qword_10006C0D8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_100005C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005C7C);
}

uint64_t sub_100005C7C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100005458(&qword_10006C0C8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100005458(&qword_10006C0D8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for ColorSpaceButton()
{
  uint64_t result = qword_10006C138;
  if (!qword_10006C138) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100005DFC()
{
  sub_100005ED0();
  if (v0 <= 0x3F)
  {
    sub_100005F80();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100005ED0()
{
  if (!qword_10006C148)
  {
    sub_100005F2C();
    unint64_t v0 = sub_100049CD0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C148);
    }
  }
}

unint64_t sub_100005F2C()
{
  unint64_t result = qword_10006C150;
  if (!qword_10006C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C150);
  }
  return result;
}

void sub_100005F80()
{
  if (!qword_10006C158)
  {
    sub_100049DB0();
    unint64_t v0 = sub_100049C50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C158);
    }
  }
}

uint64_t sub_100005FD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005FF8()
{
  sub_1000051C8(&qword_10006C330, type metadata accessor for AttributeName);
  sub_1000051C8(&qword_10006C338, type metadata accessor for AttributeName);

  return sub_10004AB00();
}

uint64_t sub_1000060B4@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10004A700();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000060FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10004A740();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006128()
{
  return sub_100003D70(*(void *)(v0 + 16));
}

uint64_t sub_100006130@<X0>(uint64_t a1@<X8>)
{
  return sub_1000041AC(*(void *)(v1 + 16), a1);
}

unint64_t sub_100006138()
{
  unint64_t result = qword_10006C1C0;
  if (!qword_10006C1C0)
  {
    sub_1000061E8(&qword_10006C1B0);
    sub_1000061E8(&qword_10006C1C8);
    sub_100006230();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C1C0);
  }
  return result;
}

uint64_t sub_1000061E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006230()
{
  unint64_t result = qword_10006C1D0;
  if (!qword_10006C1D0)
  {
    sub_1000061E8(&qword_10006C1C8);
    sub_100006E54(&qword_10006C1D8, &qword_10006C1E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C1D0);
  }
  return result;
}

uint64_t sub_1000062D0()
{
  sub_1000051C8(&qword_10006C320, type metadata accessor for TraitKey);
  sub_1000051C8(&qword_10006C328, type metadata accessor for TraitKey);

  return sub_10004AB00();
}

void *sub_10000638C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

double sub_10000639C@<D0>(void *a1@<X8>)
{
  double result = *v1;
  *a1 = *(void *)v1;
  return result;
}

uint64_t sub_1000063A8()
{
  return sub_10004AB00();
}

uint64_t sub_100006470()
{
  return Double.hashValue.getter(*v0);
}

void sub_100006478()
{
  if ((*v0 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *v0;
  }
  else {
    Swift::UInt64 v1 = 0;
  }
  sub_10004AC10(v1);
}

uint64_t sub_1000064AC()
{
  return sub_10004ABE0();
}

BOOL sub_1000064BC(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000064D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100049ED0();
  *a1 = result;
  return result;
}

uint64_t sub_1000064FC()
{
  return sub_100049EE0();
}

uint64_t sub_100006524(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005458(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006588(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005458(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000065E4()
{
  unint64_t result = qword_10006E910;
  if (!qword_10006E910)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006E910);
  }
  return result;
}

unint64_t sub_100006624()
{
  unint64_t result = qword_10006C210;
  if (!qword_10006C210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C210);
  }
  return result;
}

unint64_t sub_100006678()
{
  unint64_t result = qword_10006C218;
  if (!qword_10006C218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C218);
  }
  return result;
}

uint64_t sub_1000066CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100049EF0();
  *a1 = result;
  return result;
}

uint64_t sub_1000066F8()
{
  return sub_100049F00();
}

uint64_t sub_100006720(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100006730(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005458(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006794(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColorSpaceButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000067FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColorSpaceButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006860@<X0>(unsigned char *a1@<X8>)
{
  type metadata accessor for ColorSpaceButton();

  return sub_100004730(a1);
}

uint64_t sub_1000068D8()
{
  Swift::UInt64 v1 = (int *)(type metadata accessor for ColorSpaceButton() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  uint64_t v6 = sub_100005458(&qword_10006C0C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + v3 + v1[8];
  sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100049DB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100006A4C(unsigned __int8 *a1)
{
  type metadata accessor for ColorSpaceButton();

  return sub_100004790(a1);
}

unint64_t sub_100006AC0()
{
  unint64_t result = qword_10006C228;
  if (!qword_10006C228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C228);
  }
  return result;
}

unint64_t sub_100006B14()
{
  unint64_t result = qword_10006C230;
  if (!qword_10006C230)
  {
    sub_1000061E8(&qword_10006C220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C230);
  }
  return result;
}

uint64_t sub_100006B80()
{
  return sub_10000486C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void type metadata accessor for Weight(uint64_t a1)
{
}

void type metadata accessor for TraitKey(uint64_t a1)
{
}

void type metadata accessor for AttributeName(uint64_t a1)
{
}

void type metadata accessor for UIRectCorner(uint64_t a1)
{
}

uint64_t sub_100006BF0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006C10(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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

void sub_100006C4C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_100006C98()
{
  unint64_t result = qword_10006C270;
  if (!qword_10006C270)
  {
    sub_1000061E8(&qword_10006C1A8);
    sub_100006D14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C270);
  }
  return result;
}

unint64_t sub_100006D14()
{
  unint64_t result = qword_10006C278;
  if (!qword_10006C278)
  {
    sub_1000061E8(&qword_10006C1A0);
    sub_100006DB4();
    sub_100006E54(&qword_10006C290, &qword_10006C298);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C278);
  }
  return result;
}

unint64_t sub_100006DB4()
{
  unint64_t result = qword_10006C280;
  if (!qword_10006C280)
  {
    sub_1000061E8(&qword_10006C198);
    sub_100006E54(&qword_10006C288, &qword_10006C190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C280);
  }
  return result;
}

uint64_t sub_100006E54(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061E8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006E98()
{
  return sub_1000051C8(&qword_10006C2A0, type metadata accessor for UIRectCorner);
}

uint64_t sub_100006EE0()
{
  return sub_1000051C8(&qword_10006C2A8, type metadata accessor for UIRectCorner);
}

uint64_t sub_100006F28()
{
  return sub_1000051C8(&qword_10006C2B0, type metadata accessor for UIRectCorner);
}

uint64_t sub_100006F70()
{
  return sub_1000051C8(&qword_10006C2B8, type metadata accessor for UIRectCorner);
}

uint64_t sub_100006FB8()
{
  return sub_1000051C8(&qword_10006C2C0, type metadata accessor for AttributeName);
}

uint64_t sub_100007000()
{
  return sub_1000051C8(&qword_10006C2C8, type metadata accessor for AttributeName);
}

uint64_t sub_100007048()
{
  return sub_1000051C8(&qword_10006C2D0, type metadata accessor for TraitKey);
}

uint64_t sub_100007090()
{
  return sub_1000051C8(&qword_10006C2D8, type metadata accessor for TraitKey);
}

uint64_t sub_1000070D8()
{
  return sub_1000051C8(&qword_10006C2E0, type metadata accessor for TraitKey);
}

uint64_t sub_100007120()
{
  return sub_1000051C8(&qword_10006C2E8, type metadata accessor for Weight);
}

uint64_t sub_100007168()
{
  return sub_1000051C8(&qword_10006C2F0, type metadata accessor for Weight);
}

uint64_t sub_1000071B0()
{
  return sub_1000051C8(&qword_10006C2F8, type metadata accessor for Weight);
}

uint64_t sub_1000071F8()
{
  return sub_1000051C8(&qword_10006C300, type metadata accessor for AttributeName);
}

unint64_t sub_100007240()
{
  unint64_t result = qword_10006C318;
  if (!qword_10006C318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C318);
  }
  return result;
}

uint64_t sub_100007294(uint64_t a1)
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

uint64_t sub_1000072CC()
{
  return type metadata accessor for _UIColorPickerContentViewController();
}

uint64_t sub_100007304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v90 = a3;
  uint64_t v80 = sub_100049D30();
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v76 = v4;
  v77 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_10004A0E0();
  __chkstk_darwin(v75);
  v72 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100049C40();
  uint64_t v81 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  v78 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100005458(&qword_10006C4B8);
  uint64_t v84 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  v83 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005458(&qword_10006C4C0);
  uint64_t v87 = *(void *)(v8 - 8);
  uint64_t v88 = v8;
  __chkstk_darwin(v8);
  v85 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = (uint64_t (*)(void))sub_100049E00();
  __chkstk_darwin(v69);
  uint64_t v11 = (double *)((char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for ColorSwatchPickerView();
  uint64_t v13 = v12 - 8;
  uint64_t v14 = *(void *)(v12 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v12);
  uint64_t v16 = sub_100005458(&qword_10006C4C8);
  __chkstk_darwin(v16 - 8);
  long long v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_100005458(&qword_10006C4D0);
  __chkstk_darwin(v66);
  uint64_t v68 = (uint64_t)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100005458(&qword_10006C4D8);
  __chkstk_darwin(v67);
  v70 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100005458(&qword_10006C4E0);
  __chkstk_darwin(v94);
  uint64_t v95 = (uint64_t)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100005458(&qword_10006C4E8);
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  v71 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)long long v18 = sub_100049FD0();
  *((void *)v18 + 1) = 0;
  v18[16] = 0;
  sub_100005458(&qword_10006C4F0);
  uint64_t v23 = *(void *)(*(void *)(a2 + *(int *)(v13 + 32)) + 16);
  *(void *)&long long v97 = 0;
  *((void *)&v97 + 1) = v23;
  swift_getKeyPath();
  uint64_t v89 = a2;
  sub_10000BDE8(a2, (uint64_t)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  uint64_t v24 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v25 = (v24 + 16) & ~v24;
  uint64_t v91 = v24 | 7;
  uint64_t v92 = v25 + v15;
  uint64_t v26 = swift_allocObject();
  uint64_t v93 = v25;
  uint64_t v27 = v26 + v25;
  uint64_t v28 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BBB0((uint64_t)v28, v27);
  sub_100005458(&qword_10006C4F8);
  sub_100005458(&qword_10006C500);
  sub_10000BD18();
  sub_100006E54(&qword_10006C518, &qword_10006C500);
  sub_10004A5E0();
  uint64_t result = sub_100049D20();
  long double v31 = v30;
  if (qword_10006C048 != -1) {
    uint64_t result = swift_once();
  }
  if (*(void *)(qword_100072480 + 16))
  {
    fmod(v31, (double)(*(void *)(*(void *)(qword_100072480 + 32) + 16) >> 1));
    sub_10004A640();
    sub_100049D10();
    uint64_t v32 = v68;
    sub_100006524((uint64_t)v18, v68, &qword_10006C4C8);
    long long v33 = (_OWORD *)(v32 + *(int *)(v66 + 36));
    long long v34 = v98;
    *long long v33 = v97;
    v33[1] = v34;
    v33[2] = v99;
    sub_100006588((uint64_t)v18, &qword_10006C4C8);
    id v35 = [self currentDevice];
    id v36 = [v35 userInterfaceIdiom];

    if (v36 == (id)6) {
      double v37 = 16.0;
    }
    else {
      double v37 = 8.0;
    }
    uint64_t v38 = (char *)v11 + *((int *)v69 + 5);
    uint64_t v39 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v40 = sub_100049F90();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 104))(v38, v39, v40);
    *uint64_t v11 = v37;
    v11[1] = v37;
    uint64_t v41 = (uint64_t)v70;
    uint64_t v42 = (uint64_t)&v70[*(int *)(v67 + 36)];
    sub_10000BDE8((uint64_t)v11, v42, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v42 + *(int *)(sub_100005458(&qword_10006C520) + 36)) = 256;
    sub_100006524(v32, v41, &qword_10006C4D0);
    sub_10000BE50((uint64_t)v11);
    sub_100006588(v32, &qword_10006C4D0);
    uint64_t v43 = v89;
    uint64_t v44 = (uint64_t)v28;
    v69 = (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView;
    sub_10000BDE8(v89, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
    uint64_t v45 = swift_allocObject();
    sub_10000BBB0((uint64_t)v28, v45 + v93);
    uint64_t v46 = sub_10004A640();
    uint64_t v48 = v47;
    uint64_t v49 = v95;
    sub_100006524(v41, v95, &qword_10006C4D8);
    v50 = (void *)(v49 + *(int *)(v94 + 36));
    void *v50 = sub_10000BEB0;
    v50[1] = v45;
    v50[2] = v46;
    v50[3] = v48;
    sub_100006588(v41, &qword_10006C4D8);
    sub_10004A110();
    v51 = v78;
    sub_100049C20();
    sub_10000BDE8(v43, (uint64_t)v28, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
    uint64_t v52 = v79;
    uint64_t v53 = v77;
    uint64_t v54 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v77, v96, v80);
    unint64_t v55 = (v92 + *(unsigned __int8 *)(v52 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    uint64_t v56 = swift_allocObject();
    uint64_t v57 = v93;
    sub_10000BBB0(v44, v56 + v93);
    (*(void (**)(unint64_t, char *, uint64_t))(v52 + 32))(v56 + v55, v53, v54);
    sub_10000D2CC(&qword_10006C528, (void (*)(uint64_t))&type metadata accessor for DragGesture);
    sub_10000D2CC(&qword_10006C530, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
    uint64_t v58 = v83;
    uint64_t v59 = v82;
    sub_10004A600();
    swift_release();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v51, v59);
    sub_10000BDE8(v43, v44, v69);
    uint64_t v60 = swift_allocObject();
    sub_10000BBB0(v44, v60 + v57);
    sub_100006E54(&qword_10006C538, &qword_10006C4B8);
    long long v62 = v85;
    uint64_t v61 = v86;
    sub_10004A5F0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v58, v61);
    sub_100049C60();
    sub_10000C374();
    sub_100006E54(&qword_10006C578, &qword_10006C4C0);
    long long v63 = v71;
    uint64_t v64 = v88;
    uint64_t v65 = v95;
    sub_10004A3F0();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v62, v64);
    sub_100006588(v65, &qword_10006C4E0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v73 + 32))(v90, v63, v74);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100007F94@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5 = *a1;
  *(void *)a3 = sub_100049F80();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  sub_100005458(&qword_10006C588);
  return sub_100007FF0(a2, v5);
}

uint64_t sub_100007FF0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColorSwatchPickerView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t result = __chkstk_darwin(v4 - 8);
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + *(int *)(result + 32));
    if (*(void *)(v8 + 16) > a2)
    {
      uint64_t v9 = *(void *)(*(void *)(v8 + 8 * a2 + 32) + 16);
      v12[0] = 0;
      v12[1] = v9;
      swift_getKeyPath();
      sub_10000BDE8(a1, (uint64_t)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
      unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v11 = swift_allocObject();
      sub_10000BBB0((uint64_t)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
      *(void *)(v11 + ((v6 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
      sub_100005458(&qword_10006C4F8);
      sub_10000BD18();
      sub_10000C9FC();
      return sub_10004A5E0();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000081AC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v7 = *a1;
  char v8 = sub_100008DA8();
  uint64_t result = type metadata accessor for ColorSwatchPickerView();
  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a2 + *(int *)(result + 28));
  if (*(void *)(v10 + 16) <= a3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v11 = *(void *)(v10 + 8 * a3 + 32);
  if (v7 < *(void *)(v11 + 16))
  {
LABEL_11:
    uint64_t v13 = v11 + 40 * v7;
    char v14 = *(unsigned char *)(v13 + 64);
    long long v15 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)a4 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)(a4 + 16) = v15;
    *(unsigned char *)(a4 + 32) = v14;
    *(void *)(a4 + 40) = a3;
    *(void *)(a4 + 48) = v7;
    return result;
  }
  __break(1u);
LABEL_7:
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)(a2 + *(int *)(result + 24));
  if (*(void *)(v12 + 16) <= a3)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v11 = *(void *)(v12 + 8 * a3 + 32);
  if (v7 < *(void *)(v11 + 16)) {
    goto LABEL_11;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100008298@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for ColorSwatchPickerView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = *a1;
  sub_10000BDE8(a2, (uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  sub_10000BBB0((uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  *(void *)(v11 + ((v8 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *a3 = sub_10000C720;
  a3[1] = v11;
  return swift_bridgeObjectRetain();
}

double sub_1000083C4@<D0>(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  sub_10004A640();
  sub_100008504(a1, (uint64_t)v12);
  sub_10004A620();
  sub_10002BEA8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v12, 0.0, 1, INFINITY, 0);
  swift_release();
  long long v4 = v12[11];
  a2[10] = v12[10];
  a2[11] = v4;
  long long v5 = v12[13];
  a2[12] = v12[12];
  a2[13] = v5;
  long long v6 = v12[7];
  a2[6] = v12[6];
  a2[7] = v6;
  long long v7 = v12[9];
  a2[8] = v12[8];
  a2[9] = v7;
  long long v8 = v12[3];
  a2[2] = v12[2];
  a2[3] = v8;
  long long v9 = v12[5];
  a2[4] = v12[4];
  a2[5] = v9;
  double result = *(double *)v12;
  long long v11 = v12[1];
  *a2 = v12[0];
  a2[1] = v11;
  return result;
}

uint64_t sub_100008504@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ColorSwatchPickerView();
  if (*(void *)(v2 + *(int *)(v5 + 20)))
  {
    uint64_t v6 = v5;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    double v7 = 0.0;
    if (v36 == 2
      || (v38 = v34, v39 = v35, v40 = v36 & 1, sub_10001896C((uint64_t)v32), (uint64_t v8 = *(void *)(a1 + 16)) == 0))
    {
LABEL_13:
      uint64_t v14 = 0;
      CGFloat v15 = 0.0;
      CGFloat v16 = 0.0;
      CGFloat v17 = 0.0;
      CGFloat v18 = 0.0;
LABEL_14:
      v41.origin.x = v17;
      v41.origin.y = v18;
      v41.size.width = v15;
      v41.size.height = v16;
      CGRectGetWidth(v41);
      v42.origin.x = v17;
      v42.origin.y = v18;
      v42.size.width = v15;
      v42.size.height = v16;
      CGRectGetHeight(v42);
      sub_10004A640();
      sub_100049D10();
      uint64_t v19 = v34;
      char v20 = BYTE8(v34);
      uint64_t v21 = v35;
      char v22 = BYTE8(v35);
      uint64_t v23 = v36;
      uint64_t v24 = v37;
      v43.origin.x = v17;
      v43.origin.y = v18;
      v43.size.width = v15;
      v43.size.height = v16;
      CGFloat MinX = CGRectGetMinX(v43);
      v44.origin.x = v17;
      v44.origin.y = v18;
      v44.size.width = v15;
      v44.size.height = v16;
      CGFloat MinY = CGRectGetMinY(v44);
      uint64_t result = swift_allocObject();
      *(void *)(result + 16) = 0;
      *(void *)a2 = v14;
      *(void *)(a2 + 8) = v19;
      *(unsigned char *)(a2 + 16) = v20;
      *(void *)(a2 + 24) = v21;
      *(unsigned char *)(a2 + 32) = v22;
      *(void *)(a2 + 40) = v23;
      *(void *)(a2 + 48) = v24;
      *(CGFloat *)(a2 + 56) = MinX;
      *(CGFloat *)(a2 + 64) = MinY;
      *(double *)(a2 + 72) = v7;
      *(void *)(a2 + 80) = sub_10000C804;
      *(void *)(a2 + 88) = result;
      return result;
    }
    uint64_t v9 = a1 + 48;
    while (v33 != *(unsigned char *)(v9 + 16)
         || vabdd_f64(*(double *)(v9 - 16), v32[0]) >= 0.001
         || vabdd_f64(*(double *)(v9 - 8), v32[1]) >= 0.001
         || vabdd_f64(*(double *)v9, v32[2]) >= 0.001)
    {
      v9 += 64;
      if (!--v8) {
        goto LABEL_13;
      }
    }
    uint64_t v10 = *(void *)(v2 + *(int *)(v6 + 24));
    uint64_t v11 = *(void *)(v10 + 16);
    if (v11)
    {
      uint64_t v12 = *(void *)(v9 + 32);
      uint64_t v13 = *(void *)(v9 + 40);
      if (v12 | v13)
      {
        uint64_t v28 = v11 - 1;
        if (v28 == v12 && v13 == 0)
        {
          uint64_t v14 = 4;
        }
        else
        {
          uint64_t v30 = *(void *)(*(void *)(v10 + 32) + 16) - 1;
          if (v12 || v30 != v13)
          {
            if (v30 == v13 && v28 == v12) {
              uint64_t v14 = 8;
            }
            else {
              uint64_t v14 = 0;
            }
          }
          else
          {
            uint64_t v14 = 2;
          }
        }
      }
      else
      {
        uint64_t v14 = 1;
      }
      type metadata accessor for CGRect(0);
      swift_retain();
      sub_100049D40();
      swift_release();
      CGFloat v18 = *((double *)&v34 + 1);
      CGFloat v17 = *(double *)&v34;
      double v7 = 1.0;
      CGFloat v16 = *((double *)&v35 + 1);
      CGFloat v15 = *(double *)&v35;
      goto LABEL_14;
    }
    __break(1u);
  }
  type metadata accessor for ColorPickerState();
  sub_10000D2CC((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_100008874(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ColorSwatchPickerView() + 20));
  uint64_t v3 = *v2;
  if (!*v2) {
    goto LABEL_8;
  }
  long long v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v3;
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v3;
  swift_retain_n();
  sub_10004A590();
  sub_100005458(&qword_10006C208);
  sub_10004A550();
  swift_release();
  swift_release();
  char v6 = v15[32];
  sub_100049C30();
  double v8 = v7;
  double v10 = v9;
  sub_100049D20();
  sub_100008B04((uint64_t)v15, v8, v10, v11, v12);
  if (!*v2) {
    goto LABEL_8;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v14) = 1;
  swift_retain();
  sub_100049B70();
  if (*v2)
  {
    swift_retain();
    if (v6) {
      sub_100019138((uint64_t)&v14);
    }
    else {
      sub_10001896C((uint64_t)&v14);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_100049B70();
  }
  else
  {
LABEL_8:
    type metadata accessor for ColorPickerState();
    sub_10000D2CC((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100008B04@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t result = type metadata accessor for ColorSwatchPickerView();
  uint64_t v12 = *(void *)(v5 + *(int *)(result + 24));
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    __break(1u);
    goto LABEL_20;
  }
  double v14 = floor(a3 / (a5 / (double)v13));
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v15 = *(void *)(*(void *)(v12 + 32) + 16);
  uint64_t v16 = v13 - 1;
  if (v16 >= (uint64_t)v14) {
    uint64_t v16 = (uint64_t)v14;
  }
  double v17 = floor(a2 / (a4 / (double)v15));
  if ((~*(void *)&v17 & 0x7FF0000000000000) == 0) {
    goto LABEL_23;
  }
  if (v17 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v17 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v18 = result;
  unint64_t v19 = v16 & ~(v16 >> 63);
  uint64_t v20 = v15 - 1;
  if (v15 - 1 >= (uint64_t)v17) {
    uint64_t v20 = (uint64_t)v17;
  }
  unint64_t v21 = v20 & ~(v20 >> 63);
  uint64_t result = sub_100008DA8();
  if ((result & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v22 = *(void *)(v5 + *(int *)(v18 + 28));
  if (v19 >= *(void *)(v22 + 16))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v23 = *(void *)(v22 + 8 * v19 + 32);
  if (v21 < *(void *)(v23 + 16))
  {
LABEL_18:
    uint64_t v24 = v23 + 40 * v21;
    char v25 = *(unsigned char *)(v24 + 64);
    long long v26 = *(_OWORD *)(v24 + 48);
    *(_OWORD *)a1 = *(_OWORD *)(v24 + 32);
    *(_OWORD *)(a1 + 16) = v26;
    *(unsigned char *)(a1 + 32) = v25;
    return result;
  }
  __break(1u);
LABEL_16:
  if (v19 >= *(void *)(v12 + 16))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v23 = *(void *)(v12 + 32 + 8 * v19);
  if (v21 < *(void *)(v23 + 16)) {
    goto LABEL_18;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100008CC4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + *(int *)(type metadata accessor for ColorSwatchPickerView() + 20)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_100049B70();
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10000D2CC((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100008DA8()
{
  uint64_t v1 = sub_100005458(&qword_10006C580);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100049C10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  double v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v6);
  double v11 = &v18[-v10];
  __chkstk_darwin(v9);
  uint64_t v13 = &v18[-v12];
  if (*(void *)(v0 + *(int *)(type metadata accessor for ColorSwatchPickerView() + 20)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v18[15])
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049B60();
      swift_release();
      swift_release();
      swift_release();
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
      {
        sub_100006588((uint64_t)v3, &qword_10006C580);
        sub_1000317D0((uint64_t)v11);
        (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v8, enum case for ColorScheme.dark(_:), v4);
        char v14 = sub_100049C00();
        uint64_t v15 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
        v15(v8, v4);
        v15(v11, v4);
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v13, v3, v4);
        (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v11, enum case for ColorScheme.dark(_:), v4);
        char v14 = sub_100049C00();
        uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
        v16(v11, v4);
        v16(v13, v4);
      }
    }
    else
    {
      char v14 = 0;
    }
    return v14 & 1;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10000D2CC((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100009140@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v2 = sub_10004A410();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005458(&qword_10006C5A8);
  __chkstk_darwin(v6 - 8);
  double v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005458(&qword_10006C5B0);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v38 = (uint64_t)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v40 = *((unsigned __int8 *)v1 + 32);
  char v50 = v40;
  long long v12 = v1[1];
  long long v39 = *v1;
  long long v48 = v39;
  long long v49 = v12;
  uint64_t v13 = *((void *)v1 + 2);
  uint64_t v14 = *((void *)v1 + 3);
  uint64_t v15 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
  if (!(_BYTE)v40) {
    uint64_t v15 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v15, v2);
  uint64_t v16 = sub_10004A470();
  uint64_t v37 = v16;
  uint64_t v17 = sub_10004A530();
  uint64_t v18 = swift_allocObject();
  long long v19 = v1[1];
  *(_OWORD *)(v18 + 16) = *v1;
  *(_OWORD *)(v18 + 32) = v19;
  *(_OWORD *)(v18 + 48) = v1[2];
  *(void *)(v18 + 64) = *((void *)v1 + 6);
  uint64_t v44 = v16;
  uint64_t v45 = v17;
  uint64_t v46 = sub_10000CB88;
  uint64_t v47 = v18;
  sub_100018AB4();
  unint64_t v21 = v20;
  id v22 = [v20 _accessibilityNameWithLuma];

  uint64_t v23 = sub_10004A740();
  uint64_t v25 = v24;

  uint64_t v42 = v23;
  uint64_t v43 = v25;
  sub_100006678();
  uint64_t v26 = sub_10004A2F0();
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  sub_100005458(&qword_10006C5B8);
  sub_10000CB90();
  sub_10004A340();
  sub_100006720(v26, v28, v30);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for ColorPickerState();
  sub_10000D2CC((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v31 = sub_100049E70();
  uint64_t v33 = v32;
  uint64_t v34 = v38;
  sub_100006524((uint64_t)v8, v38, &qword_10006C5A8);
  uint64_t v35 = v34 + *(int *)(v10 + 44);
  *(void *)uint64_t v35 = v31;
  *(void *)(v35 + 8) = v33;
  *(_OWORD *)(v35 + 16) = v39;
  *(void *)(v35 + 32) = v13;
  *(void *)(v35 + 40) = v14;
  *(unsigned char *)(v35 + 48) = v40;
  sub_100006588((uint64_t)v8, &qword_10006C5A8);
  return sub_100006730(v34, v41, &qword_10006C5B0);
}

uint64_t sub_1000094E0@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t *a3@<X8>)
{
  sub_100005458(&qword_10006D9D0);
  uint64_t v6 = swift_allocObject();
  long long v7 = *a2;
  long long v8 = a2[1];
  *(_OWORD *)(v6 + 16) = xmmword_10004C900;
  *(_OWORD *)(v6 + 32) = v7;
  char v9 = *((unsigned char *)a2 + 32);
  *(_OWORD *)(v6 + 48) = v8;
  *(unsigned char *)(v6 + 64) = v9;
  *(void *)(v6 + 72) = a1;
  *(_OWORD *)(v6 + 80) = *(long long *)((char *)a2 + 40);
  *a3 = v6;

  return swift_retain();
}

uint64_t sub_10000956C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v29 = a3;
  uint64_t v4 = sub_100049FC0();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100005458(&qword_10006C5F8);
  uint64_t v7 = __chkstk_darwin(v28);
  uint64_t v23 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v26 = sub_100005458(&qword_10006C600);
  __chkstk_darwin(v26);
  long long v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005458(&qword_10006C608);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_10000D1A4(a1);
    sub_100049B60();
    swift_release();
    swift_release();
    sub_10000D1D0(a1);
    if (v33 == 2)
    {
      uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
      v17(v16, v27, v13);
      v17(v12, (uint64_t)v16, v13);
      swift_storeEnumTagMultiPayload();
      sub_10000D1FC();
      sub_100006E54(&qword_10006C618, &qword_10006C608);
      sub_10004A0D0();
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
    else
    {
      v33 &= 1u;
      sub_10001896C((uint64_t)v31);
      if (((v32 ^ *(unsigned __int8 *)(a1 + 48)) & 1) != 0
        || vabdd_f64(v31[0], *(double *)(a1 + 16)) >= 0.001
        || vabdd_f64(v31[1], *(double *)(a1 + 24)) >= 0.001
        || vabdd_f64(v31[2], *(double *)(a1 + 32)) >= 0.001
        || vabdd_f64(v31[3], *(double *)(a1 + 40)) >= 0.001)
      {
        char v30 = &_swiftEmptyArrayStorage;
        sub_10000D2CC(&qword_10006C620, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
        sub_100005458(&qword_10006C628);
        sub_100006E54(&qword_10006C630, &qword_10006C628);
        uint64_t v19 = v25;
        sub_10004A9C0();
      }
      else
      {
        sub_100049FA0();
        uint64_t v19 = v25;
      }
      uint64_t v20 = v24;
      sub_100006E54(&qword_10006C618, &qword_10006C608);
      uint64_t v21 = (uint64_t)v23;
      sub_10004A370();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v19);
      sub_100006730(v21, (uint64_t)v10, &qword_10006C5F8);
      sub_100006524((uint64_t)v10, (uint64_t)v12, &qword_10006C5F8);
      swift_storeEnumTagMultiPayload();
      sub_10000D1FC();
      sub_10004A0D0();
      return sub_100006588((uint64_t)v10, &qword_10006C5F8);
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10000D2CC((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100009AF0()
{
  return sub_100049D00();
}

uint64_t sub_100009B0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(v2 + 16);
  v5[0] = *(_OWORD *)v2;
  v5[1] = v3;
  v5[2] = *(_OWORD *)(v2 + 32);
  char v6 = *(unsigned char *)(v2 + 48);
  return sub_10000956C((uint64_t)v5, a1, a2);
}

void sub_100009B4C()
{
  qword_100072478 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100009B60(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_100025960((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100009C4C@<X0>(void *a1@<X8>)
{
  if (qword_10006C040 != -1) {
    swift_once();
  }
  *a1 = qword_100072478;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100009CB8(uint64_t a1, void (*a2)(uint64_t *__return_ptr))
{
  a2(&v3);
  return sub_100009B60(v3);
}

double sub_100009D04()
{
  sub_100005458((uint64_t *)&unk_10006D9C0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10004D1C0;
  sub_100005458((uint64_t *)&unk_10006D970);
  uint64_t v1 = swift_allocObject();
  __asm { FMOV            V0.2D, #1.0 }
  long long v17 = _Q0;
  *(_OWORD *)(v1 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v1 + 32) = _Q0;
  *(_OWORD *)(v1 + 48) = _Q0;
  *(unsigned char *)(v1 + 64) = 0;
  *(int64x2_t *)(v1 + 72) = vdupq_n_s64(0x3FED7D7D7D7D7D7DuLL);
  *(_OWORD *)(v1 + 88) = xmmword_10004D1E0;
  *(unsigned char *)(v1 + 104) = 0;
  *(int64x2_t *)(v1 + 112) = vdupq_n_s64(0x3FEADADADADADADBuLL);
  *(_OWORD *)(v1 + 128) = xmmword_10004D1F0;
  *(unsigned char *)(v1 + 144) = 0;
  *(int64x2_t *)(v1 + 152) = vdupq_n_s64(0x3FE8585858585858uLL);
  *(_OWORD *)(v1 + 168) = xmmword_10004D200;
  *(unsigned char *)(v1 + 184) = 0;
  *(int64x2_t *)(v1 + 192) = vdupq_n_s64(0x3FE5B5B5B5B5B5B6uLL);
  *(_OWORD *)(v1 + 208) = xmmword_10004D210;
  *(unsigned char *)(v1 + 224) = 0;
  *(int64x2_t *)(v1 + 232) = vdupq_n_s64(0x3FE3333333333333uLL);
  *(_OWORD *)(v1 + 248) = xmmword_10004D220;
  *(unsigned char *)(v1 + 264) = 0;
  *(int64x2_t *)(v1 + 272) = vdupq_n_s64(0x3FE0B0B0B0B0B0B1uLL);
  *(_OWORD *)(v1 + 288) = xmmword_10004D230;
  *(unsigned char *)(v1 + 304) = 0;
  *(void *)(v1 + 312) = 0x3FDC1C1C1C1C1C1CLL;
  *(int64x2_t *)(v1 + 320) = vdupq_n_s64(0x3FDC1C1C1C1C1C1CuLL);
  *(void *)(v1 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 344) = 0;
  *(int64x2_t *)(v1 + 352) = vdupq_n_s64(0x3FD7171717171717uLL);
  *(_OWORD *)(v1 + 368) = xmmword_10004D240;
  *(unsigned char *)(v1 + 384) = 0;
  *(void *)(v1 + 392) = 0x3FD1D1D1D1D1D1D2;
  *(int64x2_t *)(v1 + 400) = vdupq_n_s64(0x3FD1D1D1D1D1D1D2uLL);
  *(void *)(v1 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 424) = 0;
  *(int64x2_t *)(v1 + 432) = vdupq_n_s64(0x3FC999999999999AuLL);
  *(_OWORD *)(v1 + 448) = xmmword_10004D250;
  *(unsigned char *)(v1 + 464) = 0;
  *(void *)(v1 + 472) = 0;
  *(void *)(v1 + 480) = 0;
  *(void *)(v1 + 488) = 0;
  *(void *)(v1 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 504) = 0;
  *(void *)(v0 + 32) = v1;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v7 + 32) = xmmword_10004D260;
  *(_OWORD *)(v7 + 48) = xmmword_10004D270;
  *(unsigned char *)(v7 + 64) = 0;
  *(_OWORD *)(v7 + 72) = xmmword_10004D280;
  *(_OWORD *)(v7 + 88) = xmmword_10004D290;
  *(unsigned char *)(v7 + 104) = 0;
  *(_OWORD *)(v7 + 112) = xmmword_10004D2A0;
  *(_OWORD *)(v7 + 128) = xmmword_10004D2B0;
  *(unsigned char *)(v7 + 144) = 0;
  *(_OWORD *)(v7 + 152) = xmmword_10004D2C0;
  *(_OWORD *)(v7 + 168) = xmmword_10004D2D0;
  *(unsigned char *)(v7 + 184) = 0;
  *(_OWORD *)(v7 + 192) = xmmword_10004D2E0;
  *(_OWORD *)(v7 + 208) = xmmword_10004D2F0;
  *(unsigned char *)(v7 + 224) = 0;
  *(_OWORD *)(v7 + 232) = xmmword_10004D300;
  *(_OWORD *)(v7 + 248) = xmmword_10004D310;
  *(unsigned char *)(v7 + 264) = 0;
  *(_OWORD *)(v7 + 272) = xmmword_10004D320;
  *(_OWORD *)(v7 + 288) = xmmword_10004D330;
  *(unsigned char *)(v7 + 304) = 0;
  *(void *)(v7 + 312) = 0x3FD6161616161616;
  *(_OWORD *)(v7 + 320) = xmmword_10004D340;
  *(void *)(v7 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v7 + 344) = 0;
  *(_OWORD *)(v7 + 352) = xmmword_10004D350;
  *(_OWORD *)(v7 + 368) = xmmword_10004D330;
  *(unsigned char *)(v7 + 384) = 0;
  *(void *)(v7 + 392) = 0x3FD999999999999ALL;
  *(_OWORD *)(v7 + 400) = xmmword_10004D360;
  *(void *)(v7 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v7 + 424) = 0;
  *(_OWORD *)(v7 + 432) = xmmword_10004D370;
  *(_OWORD *)(v7 + 448) = xmmword_10004D380;
  *(unsigned char *)(v7 + 464) = 0;
  *(void *)(v7 + 472) = 0x3FC3131313131313;
  *(_OWORD *)(v7 + 480) = xmmword_10004D390;
  *(void *)(v7 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v7 + 504) = 0;
  *(void *)(v0 + 40) = v7;
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v8 + 32) = xmmword_10004D3A0;
  *(_OWORD *)(v8 + 48) = xmmword_10004D3B0;
  *(unsigned char *)(v8 + 64) = 0;
  *(_OWORD *)(v8 + 72) = xmmword_10004D3C0;
  *(_OWORD *)(v8 + 88) = xmmword_10004D3D0;
  *(unsigned char *)(v8 + 104) = 0;
  *(_OWORD *)(v8 + 112) = xmmword_10004D3E0;
  *(_OWORD *)(v8 + 128) = xmmword_10004D3F0;
  *(unsigned char *)(v8 + 144) = 0;
  *(_OWORD *)(v8 + 152) = xmmword_10004D400;
  *(_OWORD *)(v8 + 168) = xmmword_10004D410;
  *(unsigned char *)(v8 + 184) = 0;
  *(_OWORD *)(v8 + 192) = xmmword_10004D420;
  *(_OWORD *)(v8 + 208) = xmmword_10004D430;
  *(unsigned char *)(v8 + 224) = 0;
  *(_OWORD *)(v8 + 232) = xmmword_10004D440;
  *(_OWORD *)(v8 + 248) = xmmword_10004D330;
  *(unsigned char *)(v8 + 264) = 0;
  *(_OWORD *)(v8 + 272) = xmmword_10004D450;
  *(_OWORD *)(v8 + 288) = xmmword_10004D330;
  *(unsigned char *)(v8 + 304) = 0;
  *(void *)(v8 + 312) = 0x3FDE9E9E9E9E9E9FLL;
  *(_OWORD *)(v8 + 320) = xmmword_10004D460;
  *(void *)(v8 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v8 + 344) = 0;
  *(_OWORD *)(v8 + 352) = xmmword_10004D470;
  *(_OWORD *)(v8 + 368) = xmmword_10004D330;
  *(unsigned char *)(v8 + 384) = 0;
  *(void *)(v8 + 392) = 0x3FE1B1B1B1B1B1B2;
  *(_OWORD *)(v8 + 400) = xmmword_10004D480;
  *(void *)(v8 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v8 + 424) = 0;
  *(_OWORD *)(v8 + 432) = xmmword_10004D490;
  *(_OWORD *)(v8 + 448) = xmmword_10004D4A0;
  *(unsigned char *)(v8 + 464) = 0;
  *(void *)(v8 + 472) = 0x3FCC1C1C1C1C1C1CLL;
  *(_OWORD *)(v8 + 480) = xmmword_10004D4B0;
  *(void *)(v8 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v8 + 504) = 0;
  *(void *)(v0 + 48) = v8;
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v9 + 32) = xmmword_10004D4C0;
  *(_OWORD *)(v9 + 48) = xmmword_10004D4D0;
  *(unsigned char *)(v9 + 64) = 0;
  *(_OWORD *)(v9 + 72) = xmmword_10004D4E0;
  *(_OWORD *)(v9 + 88) = xmmword_10004D4F0;
  *(unsigned char *)(v9 + 104) = 0;
  *(_OWORD *)(v9 + 112) = xmmword_10004D500;
  *(_OWORD *)(v9 + 128) = xmmword_10004D510;
  *(unsigned char *)(v9 + 144) = 0;
  *(_OWORD *)(v9 + 152) = xmmword_10004D520;
  *(_OWORD *)(v9 + 168) = xmmword_10004D530;
  *(unsigned char *)(v9 + 184) = 0;
  *(_OWORD *)(v9 + 192) = xmmword_10004D540;
  *(_OWORD *)(v9 + 208) = xmmword_10004D2D0;
  *(unsigned char *)(v9 + 224) = 0;
  *(_OWORD *)(v9 + 232) = xmmword_10004D550;
  *(_OWORD *)(v9 + 248) = xmmword_10004D330;
  *(unsigned char *)(v9 + 264) = 0;
  *(_OWORD *)(v9 + 272) = xmmword_10004D560;
  *(_OWORD *)(v9 + 288) = xmmword_10004D330;
  *(unsigned char *)(v9 + 304) = 0;
  *(void *)(v9 + 312) = 0x3FE5353535353535;
  *(_OWORD *)(v9 + 320) = xmmword_10004D570;
  *(void *)(v9 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v9 + 344) = 0;
  *(_OWORD *)(v9 + 352) = xmmword_10004D580;
  *(_OWORD *)(v9 + 368) = xmmword_10004D310;
  *(unsigned char *)(v9 + 384) = 0;
  *(void *)(v9 + 392) = 0x3FE8989898989899;
  *(_OWORD *)(v9 + 400) = xmmword_10004D590;
  *(void *)(v9 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v9 + 424) = 0;
  *(_OWORD *)(v9 + 432) = xmmword_10004D5A0;
  *(_OWORD *)(v9 + 448) = xmmword_10004D5B0;
  *(unsigned char *)(v9 + 464) = 0;
  *(void *)(v9 + 472) = 0x3FD3939393939394;
  *(_OWORD *)(v9 + 480) = xmmword_10004D5C0;
  *(void *)(v9 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v9 + 504) = 0;
  *(void *)(v0 + 56) = v9;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v10 + 32) = xmmword_10004D5D0;
  *(_OWORD *)(v10 + 48) = xmmword_10004D5E0;
  *(unsigned char *)(v10 + 64) = 0;
  *(_OWORD *)(v10 + 72) = xmmword_10004D5F0;
  *(_OWORD *)(v10 + 88) = xmmword_10004D1F0;
  *(unsigned char *)(v10 + 104) = 0;
  *(_OWORD *)(v10 + 112) = xmmword_10004D600;
  *(_OWORD *)(v10 + 128) = xmmword_10004D610;
  *(unsigned char *)(v10 + 144) = 0;
  *(_OWORD *)(v10 + 152) = xmmword_10004D620;
  *(_OWORD *)(v10 + 168) = xmmword_10004D630;
  *(unsigned char *)(v10 + 184) = 0;
  *(_OWORD *)(v10 + 192) = xmmword_10004D640;
  *(_OWORD *)(v10 + 208) = xmmword_10004D650;
  *(unsigned char *)(v10 + 224) = 0;
  *(_OWORD *)(v10 + 232) = xmmword_10004D660;
  *(_OWORD *)(v10 + 248) = xmmword_10004D330;
  *(unsigned char *)(v10 + 264) = 0;
  *(_OWORD *)(v10 + 272) = xmmword_10004D670;
  *(_OWORD *)(v10 + 288) = xmmword_10004D330;
  *(unsigned char *)(v10 + 304) = 0;
  *(void *)(v10 + 312) = 0x3FEA7A7A7A7A7A7ALL;
  *(_OWORD *)(v10 + 320) = xmmword_10004D680;
  *(void *)(v10 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v10 + 344) = 0;
  *(_OWORD *)(v10 + 352) = xmmword_10004D690;
  *(_OWORD *)(v10 + 368) = xmmword_10004D310;
  *(unsigned char *)(v10 + 384) = 0;
  *(void *)(v10 + 392) = 0x3FEEBEBEBEBEBEBFLL;
  *(_OWORD *)(v10 + 400) = xmmword_10004D6A0;
  *(void *)(v10 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v10 + 424) = 0;
  *(_OWORD *)(v10 + 432) = xmmword_10004D6B0;
  *(_OWORD *)(v10 + 448) = xmmword_10004D6C0;
  *(unsigned char *)(v10 + 464) = 0;
  *(void *)(v10 + 472) = 0x3FD999999999999ALL;
  *(_OWORD *)(v10 + 480) = xmmword_10004D6D0;
  *(void *)(v10 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v10 + 504) = 0;
  *(void *)(v0 + 64) = v10;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v11 + 32) = xmmword_10004D6E0;
  *(_OWORD *)(v11 + 48) = xmmword_10004D6F0;
  *(unsigned char *)(v11 + 64) = 0;
  *(_OWORD *)(v11 + 72) = xmmword_10004D700;
  *(_OWORD *)(v11 + 88) = xmmword_10004D710;
  *(unsigned char *)(v11 + 104) = 0;
  *(_OWORD *)(v11 + 112) = xmmword_10004D720;
  *(_OWORD *)(v11 + 128) = xmmword_10004D730;
  *(unsigned char *)(v11 + 144) = 0;
  *(_OWORD *)(v11 + 152) = xmmword_10004D740;
  *(_OWORD *)(v11 + 168) = xmmword_10004D750;
  *(unsigned char *)(v11 + 184) = 0;
  *(_OWORD *)(v11 + 192) = xmmword_10004D760;
  *(_OWORD *)(v11 + 208) = xmmword_10004D770;
  *(unsigned char *)(v11 + 224) = 0;
  *(_OWORD *)(v11 + 232) = xmmword_10004D780;
  *(_OWORD *)(v11 + 248) = xmmword_10004D790;
  *(unsigned char *)(v11 + 264) = 0;
  *(_OWORD *)(v11 + 272) = xmmword_10004D7A0;
  *(_OWORD *)(v11 + 288) = xmmword_10004D330;
  *(unsigned char *)(v11 + 304) = 0;
  *(void *)(v11 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v11 + 320) = xmmword_10004D7B0;
  *(void *)(v11 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v11 + 344) = 0;
  *(_OWORD *)(v11 + 352) = xmmword_10004D7C0;
  *(_OWORD *)(v11 + 368) = xmmword_10004D330;
  *(unsigned char *)(v11 + 384) = 0;
  *(void *)(v11 + 392) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v11 + 400) = xmmword_10004D7D0;
  *(void *)(v11 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v11 + 424) = 0;
  *(_OWORD *)(v11 + 432) = xmmword_10004D7E0;
  *(_OWORD *)(v11 + 448) = xmmword_10004D7F0;
  *(unsigned char *)(v11 + 464) = 0;
  *(void *)(v11 + 472) = 0x3FDD9D9D9D9D9D9ELL;
  *(_OWORD *)(v11 + 480) = xmmword_10004D800;
  *(void *)(v11 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v11 + 504) = 0;
  *(void *)(v0 + 72) = v11;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v12 + 32) = xmmword_10004D810;
  *(_OWORD *)(v12 + 48) = xmmword_10004D820;
  *(unsigned char *)(v12 + 64) = 0;
  *(_OWORD *)(v12 + 72) = xmmword_10004D830;
  *(_OWORD *)(v12 + 88) = xmmword_10004D710;
  *(unsigned char *)(v12 + 104) = 0;
  *(_OWORD *)(v12 + 112) = xmmword_10004D840;
  *(_OWORD *)(v12 + 128) = xmmword_10004D1E0;
  *(unsigned char *)(v12 + 144) = 0;
  *(_OWORD *)(v12 + 152) = xmmword_10004D850;
  *(_OWORD *)(v12 + 168) = xmmword_10004D860;
  *(unsigned char *)(v12 + 184) = 0;
  *(_OWORD *)(v12 + 192) = xmmword_10004D870;
  *(_OWORD *)(v12 + 208) = xmmword_10004D880;
  *(unsigned char *)(v12 + 224) = 0;
  *(_OWORD *)(v12 + 232) = xmmword_10004D890;
  *(_OWORD *)(v12 + 248) = xmmword_10004D8A0;
  *(unsigned char *)(v12 + 264) = 0;
  *(_OWORD *)(v12 + 272) = xmmword_10004D8B0;
  *(_OWORD *)(v12 + 288) = xmmword_10004D8C0;
  *(unsigned char *)(v12 + 304) = 0;
  *(void *)(v12 + 312) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v12 + 320) = xmmword_10004D8D0;
  *(void *)(v12 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v12 + 344) = 0;
  *(_OWORD *)(v12 + 352) = xmmword_10004D8E0;
  *(_OWORD *)(v12 + 368) = xmmword_10004D8F0;
  *(unsigned char *)(v12 + 384) = 0;
  *(void *)(v12 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v12 + 400) = xmmword_10004D900;
  *(void *)(v12 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v12 + 424) = 0;
  *(_OWORD *)(v12 + 432) = xmmword_10004D910;
  *(_OWORD *)(v12 + 448) = xmmword_10004D3B0;
  *(unsigned char *)(v12 + 464) = 0;
  *(void *)(v12 + 472) = 0x3FE2D2D2D2D2D2D3;
  *(_OWORD *)(v12 + 480) = xmmword_10004D920;
  *(void *)(v12 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v12 + 504) = 0;
  *(void *)(v0 + 80) = v12;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v13 + 32) = xmmword_10004D930;
  *(_OWORD *)(v13 + 48) = xmmword_10004D820;
  *(unsigned char *)(v13 + 64) = 0;
  *(_OWORD *)(v13 + 72) = xmmword_10004D940;
  *(_OWORD *)(v13 + 88) = v17;
  *(unsigned char *)(v13 + 104) = 0;
  *(_OWORD *)(v13 + 112) = xmmword_10004D950;
  *(_OWORD *)(v13 + 128) = xmmword_10004D710;
  *(unsigned char *)(v13 + 144) = 0;
  *(_OWORD *)(v13 + 152) = xmmword_10004D960;
  *(_OWORD *)(v13 + 168) = xmmword_10004D710;
  *(unsigned char *)(v13 + 184) = 0;
  *(_OWORD *)(v13 + 192) = xmmword_10004D970;
  *(_OWORD *)(v13 + 208) = xmmword_10004D630;
  *(unsigned char *)(v13 + 224) = 0;
  *(_OWORD *)(v13 + 232) = xmmword_10004D980;
  *(_OWORD *)(v13 + 248) = xmmword_10004D990;
  *(unsigned char *)(v13 + 264) = 0;
  *(_OWORD *)(v13 + 272) = xmmword_10004D9A0;
  *(_OWORD *)(v13 + 288) = xmmword_10004D9B0;
  *(unsigned char *)(v13 + 304) = 0;
  *(void *)(v13 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v13 + 320) = xmmword_10004D9C0;
  *(void *)(v13 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v13 + 344) = 0;
  *(_OWORD *)(v13 + 352) = xmmword_10004D9D0;
  *(_OWORD *)(v13 + 368) = xmmword_10004D510;
  *(unsigned char *)(v13 + 384) = 0;
  *(void *)(v13 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v13 + 400) = xmmword_10004D9E0;
  *(void *)(v13 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v13 + 424) = 0;
  *(_OWORD *)(v13 + 432) = xmmword_10004D9F0;
  *(_OWORD *)(v13 + 448) = xmmword_10004D4D0;
  *(unsigned char *)(v13 + 464) = 0;
  *(void *)(v13 + 472) = 0x3FE6363636363636;
  *(_OWORD *)(v13 + 480) = xmmword_10004DA00;
  *(void *)(v13 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v13 + 504) = 0;
  *(void *)(v0 + 88) = v13;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v14 + 32) = xmmword_10004DA10;
  *(_OWORD *)(v14 + 48) = xmmword_10004DA20;
  *(unsigned char *)(v14 + 64) = 0;
  *(_OWORD *)(v14 + 72) = xmmword_10004DA30;
  *(_OWORD *)(v14 + 88) = v17;
  *(unsigned char *)(v14 + 104) = 0;
  *(_OWORD *)(v14 + 112) = xmmword_10004DA40;
  *(_OWORD *)(v14 + 128) = xmmword_10004D710;
  *(unsigned char *)(v14 + 144) = 0;
  *(_OWORD *)(v14 + 152) = xmmword_10004DA50;
  *(_OWORD *)(v14 + 168) = xmmword_10004D710;
  *(unsigned char *)(v14 + 184) = 0;
  *(_OWORD *)(v14 + 192) = xmmword_10004DA60;
  *(_OWORD *)(v14 + 208) = xmmword_10004DA70;
  *(unsigned char *)(v14 + 224) = 0;
  *(_OWORD *)(v14 + 232) = xmmword_10004DA80;
  *(_OWORD *)(v14 + 248) = xmmword_10004DA90;
  *(unsigned char *)(v14 + 264) = 0;
  *(_OWORD *)(v14 + 272) = xmmword_10004DAA0;
  *(_OWORD *)(v14 + 288) = xmmword_10004DAB0;
  *(unsigned char *)(v14 + 304) = 0;
  *(void *)(v14 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v14 + 320) = xmmword_10004DAC0;
  *(void *)(v14 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v14 + 344) = 0;
  *(_OWORD *)(v14 + 352) = xmmword_10004DAD0;
  *(_OWORD *)(v14 + 368) = xmmword_10004DAE0;
  *(unsigned char *)(v14 + 384) = 0;
  *(void *)(v14 + 392) = 0x3FF0000000000000;
  *(_OWORD *)(v14 + 400) = xmmword_10004DAF0;
  *(void *)(v14 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v14 + 424) = 0;
  *(_OWORD *)(v14 + 432) = xmmword_10004DB00;
  *(_OWORD *)(v14 + 448) = xmmword_10004DB10;
  *(unsigned char *)(v14 + 464) = 0;
  *(void *)(v14 + 472) = 0x3FE9B9B9B9B9B9BALL;
  *(_OWORD *)(v14 + 480) = xmmword_10004DB20;
  *(void *)(v14 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v14 + 504) = 0;
  *(void *)(v0 + 96) = v14;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10004D1D0;
  *(_OWORD *)(v15 + 32) = xmmword_10004DB30;
  *(_OWORD *)(v15 + 48) = v17;
  *(unsigned char *)(v15 + 64) = 0;
  *(_OWORD *)(v15 + 72) = xmmword_10004DB40;
  *(_OWORD *)(v15 + 88) = v17;
  *(unsigned char *)(v15 + 104) = 0;
  *(_OWORD *)(v15 + 112) = xmmword_10004DB50;
  *(_OWORD *)(v15 + 128) = xmmword_10004D710;
  *(unsigned char *)(v15 + 144) = 0;
  *(_OWORD *)(v15 + 152) = xmmword_10004DB60;
  *(_OWORD *)(v15 + 168) = v17;
  *(unsigned char *)(v15 + 184) = 0;
  *(_OWORD *)(v15 + 192) = xmmword_10004DB70;
  *(_OWORD *)(v15 + 208) = xmmword_10004DB80;
  *(unsigned char *)(v15 + 224) = 0;
  *(_OWORD *)(v15 + 232) = xmmword_10004DB90;
  *(_OWORD *)(v15 + 248) = xmmword_10004D6F0;
  *(unsigned char *)(v15 + 264) = 0;
  *(_OWORD *)(v15 + 272) = xmmword_10004DBA0;
  *(_OWORD *)(v15 + 288) = xmmword_10004D1F0;
  *(unsigned char *)(v15 + 304) = 0;
  *(void *)(v15 + 312) = 0x3FF0000000000000;
  *(_OWORD *)(v15 + 320) = xmmword_10004DBB0;
  *(void *)(v15 + 336) = 0x3FF0000000000000;
  *(unsigned char *)(v15 + 344) = 0;
  *(_OWORD *)(v15 + 352) = xmmword_10004DBC0;
  *(_OWORD *)(v15 + 368) = xmmword_10004DBD0;
  *(unsigned char *)(v15 + 384) = 0;
  *(void *)(v15 + 392) = 0x3FEFDFDFDFDFDFE0;
  *(_OWORD *)(v15 + 400) = xmmword_10004DBE0;
  *(void *)(v15 + 416) = 0x3FF0000000000000;
  *(unsigned char *)(v15 + 424) = 0;
  *(_OWORD *)(v15 + 432) = xmmword_10004DBF0;
  *(_OWORD *)(v15 + 448) = xmmword_10004DC00;
  *(unsigned char *)(v15 + 464) = 0;
  *(void *)(v15 + 472) = 0x3FEBFBFBFBFBFBFCLL;
  double result = 0.933333333;
  *(_OWORD *)(v15 + 480) = xmmword_10004DC10;
  *(void *)(v15 + 496) = 0x3FF0000000000000;
  *(unsigned char *)(v15 + 504) = 0;
  *(void *)(v0 + 104) = v15;
  qword_100072480 = v0;
  return result;
}

void sub_10000AB14()
{
  sub_10000AB34();
  qword_10006C400 = v0;
}

void sub_10000AB34()
{
  if (qword_10006C048 != -1) {
    goto LABEL_40;
  }
  while (1)
  {
    uint64_t v1 = (void *)qword_100072480;
    uint64_t v2 = *(void *)(qword_100072480 + 16);
    if (v2)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = swift_bridgeObjectRetain();
      uint64_t v0 = sub_10000AFE0(v3);
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        if (!v1[2]) {
          goto LABEL_43;
        }
        goto LABEL_5;
      }
    }
    else
    {
      __break(1u);
    }
    uint64_t v1 = sub_10002AF0C(v1);
    if (!v1[2])
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
LABEL_5:
    v1[4] = v0;
    swift_bridgeObjectRelease();
    if (v2 == 1) {
      break;
    }
    uint64_t v0 = v2 + 3;
    uint64_t v4 = 5;
    while (v0 != 3)
    {
      if ((unint64_t)(v0 - 4) >= *(void *)(qword_100072480 + 16)) {
        goto LABEL_38;
      }
      unint64_t v5 = v1[2];
      uint64_t v6 = swift_bridgeObjectRetain();
      if (v4 - 4 >= v5) {
        goto LABEL_39;
      }
      v1[v4] = v6;
      swift_bridgeObjectRelease();
      --v0;
      ++v4;
      if (v0 == 4) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    swift_once();
  }
LABEL_11:
  int64_t v7 = v1[2];
  if (!v7)
  {
    swift_bridgeObjectRelease();
    return;
  }
  int v40 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_100025DA8(0, v7, 0);
  uint64_t v8 = 0;
  int64_t v36 = v7;
  while (1)
  {
    uint64_t v37 = v8;
    uint64_t v9 = v1[v8 + 4];
    int64_t v10 = *(void *)(v9 + 16);
    if (v10) {
      break;
    }
    uint64_t v29 = _swiftEmptyArrayStorage;
LABEL_30:
    char v33 = v40;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100025DA8(0, v33[2] + 1, 1);
      char v33 = v40;
    }
    unint64_t v35 = v33[2];
    unint64_t v34 = v33[3];
    if (v35 >= v34 >> 1)
    {
      sub_100025DA8((void *)(v34 > 1), v35 + 1, 1);
      char v33 = v40;
    }
    ++v8;
    v33[2] = v35 + 1;
    v33[v35 + 4] = v29;
    if (v37 + 1 == v7)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  long long v39 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_100025DC8(0, v10, 0);
  uint64_t v11 = self;
  uint64_t v12 = (double *)(v9 + 64);
  while (1)
  {
    CGFloat v13 = *(v12 - 4);
    CGFloat v14 = *(v12 - 3);
    CGFloat v15 = *(v12 - 2);
    CGFloat v16 = *(v12 - 1);
    CFStringRef v17 = *(unsigned char *)v12 ? kCGColorSpaceDisplayP3 : kCGColorSpaceSRGB;
    uint64_t v18 = CGColorSpaceCreateWithName(v17);
    if (!v18) {
      break;
    }
    uint64_t v19 = v18;
    v38[0] = v13;
    v38[1] = v14;
    v38[2] = v15;
    v38[3] = v16;
    CGColorRef v20 = CGColorCreate(v18, v38);

    if (!v20) {
      goto LABEL_45;
    }
    id v21 = [objc_allocWithZone((Class)UIColor) initWithCGColor:v20];

    id v22 = [v11 _convertColorPickerColor:v21 fromUserInterfaceStyle:1 to:2];
    uint64_t v23 = (CGColor *)[v22 CGColor];
    uint64_t v24 = (void *)UISCreateCachedColorTransform();
    if (!v24) {
      goto LABEL_46;
    }
    id v25 = v24;
    uint64_t v26 = CGColorGetColorSpace(v23);
    if (!v26) {
      goto LABEL_47;
    }
    uint64_t v27 = v26;
    if (!sub_10004A860()) {
      goto LABEL_48;
    }
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    CGFloat Alpha = CGColorGetAlpha(v23);

    uint64_t v29 = v39;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100025DC8(0, v29[2] + 1, 1);
      uint64_t v29 = v39;
    }
    unint64_t v31 = v29[2];
    unint64_t v30 = v29[3];
    if (v31 >= v30 >> 1)
    {
      sub_100025DC8((char *)(v30 > 1), v31 + 1, 1);
      uint64_t v29 = v39;
    }
    v29[2] = v31 + 1;
    unsigned __int8 v32 = (CGFloat *)&v29[5 * v31];
    double v32[4] = 0.0;
    v32[5] = 0.0;
    v32[6] = 0.0;
    v32[7] = Alpha;
    *((unsigned char *)v32 + 64) = 0;
    v12 += 5;
    if (!--v10)
    {
      swift_bridgeObjectRelease();
      int64_t v7 = v36;
      goto LABEL_30;
    }
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
}

uint64_t sub_10000AFE0(uint64_t result)
{
  uint64_t v1 = result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 < 2) {
    return v1;
  }
  unint64_t v3 = 0;
  unint64_t v4 = v2 >> 1;
  unint64_t v5 = v2 - 1;
  uint64_t v6 = 40 * v2 - 8;
  for (uint64_t i = 32; ; i += 40)
  {
    if (v3 == v5) {
      goto LABEL_5;
    }
    unint64_t v10 = *(void *)(v1 + 16);
    if (v3 >= v10) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_12;
    }
    long long v17 = *(_OWORD *)(v1 + i + 16);
    long long v18 = *(_OWORD *)(v1 + i);
    char v11 = *(unsigned char *)(v1 + i + 32);
    uint64_t v12 = *(void *)(v1 + v6);
    uint64_t v13 = *(void *)(v1 + v6 + 8);
    uint64_t v14 = *(void *)(v1 + v6 + 16);
    uint64_t v15 = *(void *)(v1 + v6 + 24);
    char v16 = *(unsigned char *)(v1 + v6 + 32);
    double result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      double result = (uint64_t)sub_10002AF20(v1);
      uint64_t v1 = result;
    }
    uint64_t v8 = v1 + i;
    *(void *)uint64_t v8 = v12;
    *(void *)(v8 + 8) = v13;
    *(void *)(v8 + 16) = v14;
    *(void *)(v8 + 24) = v15;
    *(unsigned char *)(v8 + 32) = v16;
    uint64_t v9 = v1 + v6;
    *(_OWORD *)uint64_t v9 = v18;
    *(_OWORD *)(v9 + 16) = v17;
    *(unsigned char *)(v9 + 32) = v11;
LABEL_5:
    ++v3;
    --v5;
    v6 -= 40;
    if (v4 == v3) {
      return v1;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_10000B100@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_10000BDE8(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_10000BBB0((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_10000BC14;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_10000B200()
{
  uint64_t result = sub_100049C90();
  if ((result & 1) == 0)
  {
    swift_retain();
    return sub_100049CA0();
  }
  return result;
}

uint64_t *sub_10000B23C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100005458(&qword_10006C408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100049C10();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    char v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    *char v11 = v13;
    v11[1] = v14;
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10000B388(uint64_t a1)
{
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_100049C10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_10000B440(void *a1, void *a2, int *a3)
{
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100049C10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  *uint64_t v9 = v11;
  v9[1] = v12;
  *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10000B53C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100006588((uint64_t)a1, &qword_10006C408);
    sub_100005458(&qword_10006C408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100049C10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_10000B680(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100049C10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  return a1;
}

char *sub_10000B768(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100006588((uint64_t)a1, &qword_10006C408);
    uint64_t v6 = sub_100005458(&qword_10006C408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100049C10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000B89C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B8B0);
}

uint64_t sub_10000B8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005458(&qword_10006C410);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000B974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B988);
}

uint64_t sub_10000B988(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100005458(&qword_10006C410);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for ColorSwatchPickerView()
{
  uint64_t result = qword_10006C470;
  if (!qword_10006C470) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000BA94()
{
  sub_10000BB38();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000BB38()
{
  if (!qword_10006C480)
  {
    sub_100049C10();
    unint64_t v0 = sub_100049C50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006C480);
    }
  }
}

uint64_t sub_10000BB90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000BBB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ColorSwatchPickerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BC14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100007304(a1, v6, a2);
}

uint64_t sub_10000BC98@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100007F94(a1, v6, a2);
}

unint64_t sub_10000BD18()
{
  unint64_t result = qword_10006C508;
  if (!qword_10006C508)
  {
    sub_1000061E8(&qword_10006C4F8);
    sub_10000BD94();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C508);
  }
  return result;
}

unint64_t sub_10000BD94()
{
  unint64_t result = qword_10006C510;
  if (!qword_10006C510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C510);
  }
  return result;
}

uint64_t sub_10000BDE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000BE50(uint64_t a1)
{
  uint64_t v2 = sub_100049E00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000BEB0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100008298(a1, v6, a2);
}

uint64_t sub_10000BF30()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = sub_100049D30();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_100049C10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v0 + v3, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = (v3 + v4 + v7) & ~v7;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v10, v5);

  return _swift_deallocObject(v0, v10 + v8, v2 | v7 | 7);
}

uint64_t sub_10000C0F4(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_100049D30();

  return sub_100008874(a1, v1 + v4);
}

uint64_t sub_10000C1CC()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100049C10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000C304(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100008CC4(a1, v4);
}

unint64_t sub_10000C374()
{
  unint64_t result = qword_10006C540;
  if (!qword_10006C540)
  {
    sub_1000061E8(&qword_10006C4E0);
    sub_10000C414();
    sub_100006E54(&qword_10006C568, &qword_10006C570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C540);
  }
  return result;
}

unint64_t sub_10000C414()
{
  unint64_t result = qword_10006C548;
  if (!qword_10006C548)
  {
    sub_1000061E8(&qword_10006C4D8);
    sub_10000C4B4();
    sub_100006E54(&qword_10006C560, &qword_10006C520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C548);
  }
  return result;
}

unint64_t sub_10000C4B4()
{
  unint64_t result = qword_10006C550;
  if (!qword_10006C550)
  {
    sub_1000061E8(&qword_10006C4D0);
    sub_100006E54(&qword_10006C558, &qword_10006C4C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C550);
  }
  return result;
}

uint64_t sub_10000C560@<X0>(uint64_t a1@<X8>)
{
  return sub_1000139D8(a1);
}

uint64_t sub_10000C570()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000C5B0()
{
  return sub_100013AC8();
}

uint64_t sub_10000C5D4()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100049C10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

double sub_10000C720@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v4 = *(void *)(v1
                 + ((*(void *)(v3 + 64)
                   + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                   + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000083C4(v4, a1);
}

uint64_t sub_10000C7CC()
{
  swift_release();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C804()
{
  return sub_10000B200();
}

uint64_t sub_10000C80C()
{
  uint64_t v1 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100049C10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_10000C950@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorSwatchPickerView() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000081AC(a1, v2 + v6, v7, a2);
}

unint64_t sub_10000C9FC()
{
  unint64_t result = qword_10006C590;
  if (!qword_10006C590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C590);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorPreferenceKey()
{
  return &type metadata for ColorSwatchPickerView.ColorPreferenceKey;
}

__n128 initializeWithCopy for ColorSwatchPickerView.ColorCell(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.ColorCell(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.ColorCell(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorCell()
{
  return &type metadata for ColorSwatchPickerView.ColorCell;
}

uint64_t sub_10000CB20()
{
  return sub_100006E54(&qword_10006C598, &qword_10006C5A0);
}

uint64_t sub_10000CB5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CB78()
{
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10000CB88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000094E0(a1, (long long *)(v2 + 16), a2);
}

unint64_t sub_10000CB90()
{
  unint64_t result = qword_10006C5C0;
  if (!qword_10006C5C0)
  {
    sub_1000061E8(&qword_10006C5B8);
    sub_100006E54(&qword_10006C5C8, &qword_10006C5D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C5C0);
  }
  return result;
}

uint64_t destroy for ColorSwatchPickerView.AccessibilitySelectionState()
{
  return swift_release();
}

uint64_t initializeWithCopy for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 49)) {
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

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.AccessibilitySelectionState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.AccessibilitySelectionState()
{
  return &type metadata for ColorSwatchPickerView.AccessibilitySelectionState;
}

uint64_t destroy for ColorSwatchPickerView.ColorPreferenceData()
{
  return swift_release();
}

uint64_t initializeWithCopy for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSwatchPickerView.ColorPreferenceData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSwatchPickerView.ColorPreferenceData(uint64_t result, int a2, int a3)
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorSwatchPickerView.ColorPreferenceData()
{
  return &type metadata for ColorSwatchPickerView.ColorPreferenceData;
}

unint64_t sub_10000D00C()
{
  unint64_t result = qword_10006C5D8;
  if (!qword_10006C5D8)
  {
    sub_1000061E8(&qword_10006C5B0);
    sub_10000D088();
    sub_10000D134();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C5D8);
  }
  return result;
}

unint64_t sub_10000D088()
{
  unint64_t result = qword_10006C5E0;
  if (!qword_10006C5E0)
  {
    sub_1000061E8(&qword_10006C5A8);
    sub_10000CB90();
    sub_10000D2CC((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C5E0);
  }
  return result;
}

unint64_t sub_10000D134()
{
  unint64_t result = qword_10006C5F0;
  if (!qword_10006C5F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C5F0);
  }
  return result;
}

uint64_t sub_10000D188()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D1A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000D1D0(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000D1FC()
{
  unint64_t result = qword_10006C610;
  if (!qword_10006C610)
  {
    sub_1000061E8(&qword_10006C5F8);
    sub_100006E54(&qword_10006C618, &qword_10006C608);
    sub_10000D2CC((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C610);
  }
  return result;
}

uint64_t sub_10000D2CC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000D318()
{
  unint64_t result = qword_10006C638;
  if (!qword_10006C638)
  {
    sub_1000061E8(&qword_10006C640);
    sub_10000D38C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C638);
  }
  return result;
}

unint64_t sub_10000D38C()
{
  unint64_t result = qword_10006C648;
  if (!qword_10006C648)
  {
    sub_1000061E8(&qword_10006C650);
    sub_10000D1FC();
    sub_100006E54(&qword_10006C618, &qword_10006C608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C648);
  }
  return result;
}

uint64_t *sub_10000D434(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    unint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100049DB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *unint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10000D554(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100049DB0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_10000D60C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)((char *)a1 + v5);
  unint64_t v7 = (void *)((char *)a2 + v5);
  swift_retain();
  sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100049DB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    void *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_10000D6D4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    unint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_100006588((uint64_t)a1 + v6, &qword_10006C0D0);
    sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100049DB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *unint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_10000D7D0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100049DB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_10000D8A4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_100006588((uint64_t)a1 + v6, &qword_10006C0D0);
    uint64_t v9 = sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100049DB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10000D9A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D9BC);
}

uint64_t sub_10000D9BC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_100005458(&qword_10006C0D8);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_10000DA7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DA90);
}

void *sub_10000DA90(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_100005458(&qword_10006C0D8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for RGBAView()
{
  uint64_t result = qword_10006C6B0;
  if (!qword_10006C6B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000DB88()
{
  sub_100005F80();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10000DC20()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_10000DC3C(char a1)
{
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = self;
  int v5 = (SEL *)&selRef_clearColor;
  uint64_t v6 = &selRef_systemBackgroundColor;
  if ((a1 & 1) == 0) {
    uint64_t v6 = &selRef_systemGray5Color;
  }
  if (v3 != (id)6) {
    int v5 = (SEL *)v6;
  }
  id v7 = [v4 *v5];

  return v7;
}

uint64_t sub_10000DCEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005458(&qword_10006C6E8);
  __chkstk_darwin(v3 - 8);
  int v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)6) {
    uint64_t v8 = 0x4030000000000000;
  }
  else {
    uint64_t v8 = 0x4039000000000000;
  }
  *(void *)int v5 = sub_100049FD0();
  *((void *)v5 + 1) = v8;
  v5[16] = 0;
  uint64_t v9 = sub_100005458(&qword_10006C6F0);
  sub_10000DDF0(v1, (uint64_t)&v5[*(int *)(v9 + 44)]);
  return sub_100006730((uint64_t)v5, a1, &qword_10006C6E8);
}

uint64_t sub_10000DDF0@<X0>(void (*a1)(uint64_t a1@<X8>)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v3 = sub_100005458(&qword_10006C6F8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  id v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = sub_100005458(&qword_10006C700);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v25 - v14;
  __chkstk_darwin(v13);
  long long v17 = (char *)&v25 - v16;
  id v18 = [self currentDevice];
  id v19 = [v18 userInterfaceIdiom];

  if (v19 == (id)6) {
    uint64_t v20 = 0x4030000000000000;
  }
  else {
    uint64_t v20 = 0x4032000000000000;
  }
  *(void *)uint64_t v15 = sub_100049FD0();
  *((void *)v15 + 1) = v20;
  v15[16] = 0;
  uint64_t v21 = sub_100005458(&qword_10006C708);
  sub_10000E058((uint64_t)&v15[*(int *)(v21 + 44)]);
  sub_100006730((uint64_t)v15, (uint64_t)v17, &qword_10006C700);
  *(void *)uint64_t v8 = sub_100049FD0();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v22 = sub_100005458(&qword_10006C710);
  sub_10000E3A8(v26, (uint64_t)&v8[*(int *)(v22 + 44)]);
  sub_100006524((uint64_t)v17, (uint64_t)v12, &qword_10006C700);
  sub_100006524((uint64_t)v8, (uint64_t)v6, &qword_10006C6F8);
  sub_100006524((uint64_t)v12, a2, &qword_10006C700);
  uint64_t v23 = sub_100005458(&qword_10006C718);
  sub_100006524((uint64_t)v6, a2 + *(int *)(v23 + 48), &qword_10006C6F8);
  sub_100006588((uint64_t)v8, &qword_10006C6F8);
  sub_100006588((uint64_t)v17, &qword_10006C700);
  sub_100006588((uint64_t)v6, &qword_10006C6F8);
  return sub_100006588((uint64_t)v12, &qword_10006C700);
}

uint64_t sub_10000E058@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v1 = type metadata accessor for ColorSlider(0);
  uint64_t v2 = v1 - 8;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v40 = (uint64_t)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v39 = (uint64_t)&v38 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v38 = (uint64_t)&v38 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v38 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v38 - v15;
  type metadata accessor for ColorPickerState();
  sub_10000F70C();
  uint64_t v17 = sub_100049E70();
  uint64_t v19 = v18;
  *(void *)&v16[*(int *)(v2 + 32)] = swift_getKeyPath();
  sub_100005458(&qword_10006C0D0);
  swift_storeEnumTagMultiPayload();
  *uint64_t v16 = 0;
  *((void *)v16 + 1) = v17;
  *((void *)v16 + 2) = v19;
  uint64_t v20 = *(int *)(v2 + 36);
  sub_10004A220();
  *(void *)&v16[v20] = v21;
  uint64_t v22 = sub_100049E70();
  uint64_t v24 = v23;
  *(void *)&v14[*(int *)(v2 + 32)] = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *uint64_t v14 = 1;
  *((void *)v14 + 1) = v22;
  *((void *)v14 + 2) = v24;
  uint64_t v25 = *(int *)(v2 + 36);
  sub_10004A220();
  *(void *)&v14[v25] = v26;
  uint64_t v27 = sub_100049E70();
  uint64_t v29 = v28;
  *(void *)&v11[*(int *)(v2 + 32)] = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *uint64_t v11 = 2;
  *((void *)v11 + 1) = v27;
  *((void *)v11 + 2) = v29;
  uint64_t v30 = *(int *)(v2 + 36);
  sub_10004A220();
  *(void *)&v11[v30] = v31;
  uint64_t v32 = v38;
  sub_10000FC0C((uint64_t)v16, v38, type metadata accessor for ColorSlider);
  uint64_t v33 = v39;
  sub_10000FC0C((uint64_t)v14, v39, type metadata accessor for ColorSlider);
  uint64_t v34 = v40;
  sub_10000FC0C((uint64_t)v11, v40, type metadata accessor for ColorSlider);
  uint64_t v35 = v41;
  sub_10000FC0C(v32, v41, type metadata accessor for ColorSlider);
  uint64_t v36 = sub_100005458(&qword_10006C758);
  sub_10000FC0C(v33, v35 + *(int *)(v36 + 48), type metadata accessor for ColorSlider);
  sub_10000FC0C(v34, v35 + *(int *)(v36 + 64), type metadata accessor for ColorSlider);
  sub_10000FC74((uint64_t)v11, type metadata accessor for ColorSlider);
  sub_10000FC74((uint64_t)v14, type metadata accessor for ColorSlider);
  sub_10000FC74((uint64_t)v16, type metadata accessor for ColorSlider);
  sub_10000FC74(v34, type metadata accessor for ColorSlider);
  sub_10000FC74(v33, type metadata accessor for ColorSlider);
  return sub_10000FC74(v32, type metadata accessor for ColorSlider);
}

uint64_t sub_10000E3A8@<X0>(void (*a1)(uint64_t a1@<X8>)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005458(&qword_10006C720);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (uint64_t *)((char *)&v19 - v8);
  uint64_t v10 = sub_100049DB0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RGBAView();
  sub_100031790((uint64_t)v13);
  char v14 = sub_100049DA0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    uint64_t v20 = sub_100049FD0();
    uint64_t v21 = 0;
    char v22 = 1;
    sub_10000F6B8();
  }
  else
  {
    uint64_t v20 = sub_100049F80();
    uint64_t v21 = 0x4030000000000000;
    char v22 = 0;
    sub_10000F664();
  }
  *uint64_t v9 = sub_10004A660();
  uint64_t v15 = (uint64_t (*)())((char *)v9 + *(int *)(v4 + 44));
  swift_retain();
  sub_10000E5EC(a1, v15);
  sub_100006524((uint64_t)v9, (uint64_t)v7, &qword_10006C720);
  sub_100006524((uint64_t)v7, a2, &qword_10006C720);
  uint64_t v16 = *(int *)(sub_100005458(&qword_10006C730) + 48);
  swift_release();
  uint64_t v17 = a2 + v16;
  *(void *)uint64_t v17 = 0;
  *(unsigned char *)(v17 + 8) = 0;
  sub_100006588((uint64_t)v9, &qword_10006C720);
  return sub_100006588((uint64_t)v7, &qword_10006C720);
}

uint64_t sub_10000E5EC@<X0>(void (*a1)(uint64_t a1@<X8>)@<X0>, uint64_t (*a2)()@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v3 = type metadata accessor for RGBAView();
  uint64_t v84 = *(void *)(v3 - 8);
  __chkstk_darwin(v3 - 8);
  uint64_t v87 = v4;
  uint64_t v88 = (uint64_t)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ColorSpaceButton();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005458(&qword_10006C740);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v92 = (uint64_t)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v75 - v12;
  __chkstk_darwin(v11);
  uint64_t v93 = (uint64_t)&v75 - v14;
  v85 = a1;
  uint64_t v15 = *(void *)a1;
  if (*(void *)a1)
  {
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = v15;
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = v15;
    swift_retain_n();
    sub_10004A590();
    uint64_t v18 = v111;
    uint64_t v19 = v112;
    unsigned long long v91 = v113;
    unsigned long long v22 = v114;
    unint64_t v21 = v22 >> 64;
    unint64_t v20 = v22;
    char v23 = v115;
    *(void *)&v7[*(int *)(v5 + 24)] = swift_getKeyPath();
    sub_100005458(&qword_10006C0D0);
    swift_storeEnumTagMultiPayload();
    *(void *)uint64_t v7 = v18;
    *((void *)v7 + 1) = v19;
    *((_OWORD *)v7 + 1) = v91;
    *((_OWORD *)v7 + 2) = __PAIR128__(v21, v20);
    v7[48] = v23;
    uint64_t v111 = 0x4049000000000000;
    sub_100005F2C();
    sub_100049CB0();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    int v24 = v114;
    swift_release();
    LOBYTE(v18) = v24 == 2;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v26 = swift_allocObject();
    *(unsigned char *)(v26 + 16) = v18;
    sub_10000FC0C((uint64_t)v7, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ColorSpaceButton);
    uint64_t v27 = (uint64_t *)&v13[*(int *)(v8 + 36)];
    *uint64_t v27 = KeyPath;
    v27[1] = (uint64_t)sub_10000F850;
    v27[2] = v26;
    sub_10000FC74((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for ColorSpaceButton);
    sub_100006730((uint64_t)v13, v93, &qword_10006C740);
    uint64_t v28 = (void *)swift_allocObject();
    v28[2] = 0;
    v28[3] = 0;
    v28[4] = v15;
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = v15;
    swift_retain_n();
    sub_10004A590();
    uint64_t v90 = v112;
    *(void *)&unsigned long long v91 = v111;
    unsigned long long v30 = v113;
    unsigned long long v33 = v114;
    uint64_t v32 = v33 >> 64;
    uint64_t v31 = v33;
    int v89 = v115;
    uint64_t v34 = v85;
    uint64_t v35 = v88;
    sub_10000FC0C((uint64_t)v85, v88, (uint64_t (*)(void))type metadata accessor for RGBAView);
    unint64_t v36 = (*(unsigned __int8 *)(v84 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
    uint64_t v84 = swift_allocObject();
    sub_10000F988(v35, v84 + v36);
    uint64_t v37 = type metadata accessor for ColorPickerState();
    *(void *)&long long v81 = sub_10000F70C();
    *((void *)&v81 + 1) = v37;
    uint64_t v38 = sub_100049E70();
    uint64_t v87 = v39;
    uint64_t v88 = v38;
    LOBYTE(v96) = 0;
    sub_10004A4F0();
    int v83 = v111;
    uint64_t v82 = v112;
    uint64_t v40 = self;
    id v41 = [v40 defaultMetrics];
    uint64_t v42 = self;
    id v43 = [v42 currentDevice];
    id v44 = [v43 userInterfaceIdiom];

    double v45 = 100.0;
    if (v44 == (id)6) {
      double v45 = 88.0;
    }
    [v41 scaledValueForValue:v45];

    id v46 = [v40 defaultMetrics];
    id v47 = [v42 currentDevice];
    id v48 = [v47 userInterfaceIdiom];

    double v49 = 36.0;
    if (v48 == (id)6) {
      double v49 = 44.0;
    }
    [v46 scaledValueForValue:v49];

    sub_10004A640();
    sub_100049D10();
    if (*(void *)v34)
    {
      long long v81 = v140;
      uint64_t v50 = v138;
      uint64_t v79 = v138;
      uint64_t v51 = v136;
      unsigned __int8 v95 = v137;
      unsigned __int8 v94 = v139;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049B60();
      swift_release();
      swift_release();
      int v52 = v114;
      swift_release();
      sub_10000DC3C(v52 != 2);
      uint64_t v53 = sub_10004A400();
      uint64_t v78 = v53;
      int v54 = sub_10004A1D0();
      unsigned __int8 v55 = v95;
      int v76 = v54;
      int v77 = v95;
      unsigned __int8 v56 = v94;
      int v80 = v94;
      uint64_t v57 = v92;
      sub_100006524(v93, v92, &qword_10006C740);
      uint64_t v58 = v86;
      *(void *)uint64_t v86 = 0;
      *((unsigned char *)v58 + 8) = 0;
      uint64_t v59 = sub_100005458(&qword_10006C748);
      sub_100006524(v57, (uint64_t)v58 + *(int *)(v59 + 48), &qword_10006C740);
      uint64_t v60 = (char *)v58 + *(int *)(v59 + 64);
      *(void *)&long long v96 = v88;
      *((void *)&v96 + 1) = v87;
      *(void *)&long long v97 = v91;
      *((void *)&v97 + 1) = v90;
      unsigned long long v98 = v30;
      *(void *)&long long v99 = v31;
      *((void *)&v99 + 1) = v32;
      LOBYTE(v100) = v89;
      *(_WORD *)((char *)&v100 + 1) = 0;
      uint64_t v86 = sub_10000EF7C;
      *((void *)&v100 + 1) = 1;
      *(void *)&long long v101 = sub_10000EF7C;
      v85 = sub_10000F9EC;
      *((void *)&v101 + 1) = 0;
      *(void *)&long long v102 = sub_10000F9EC;
      uint64_t v61 = v84;
      *((void *)&v102 + 1) = v84;
      v103 = sub_10000F260;
      uint64_t v104 = 0;
      LOBYTE(v57) = v83;
      LOBYTE(v105) = v83;
      uint64_t v62 = v82;
      *((void *)&v105 + 1) = v82;
      *(void *)&long long v106 = v51;
      BYTE8(v106) = v55;
      *(void *)&long long v107 = v50;
      BYTE8(v107) = v56;
      long long v63 = v81;
      long long v108 = v81;
      *(void *)&long long v109 = v53;
      char v64 = v76;
      BYTE8(v109) = v76;
      uint64_t v110 = 0x4020000000000000;
      long long v65 = v102;
      long long v66 = v106;
      *((_OWORD *)v60 + 8) = v105;
      *((_OWORD *)v60 + 9) = v66;
      *((_OWORD *)v60 + 6) = v65;
      *((_OWORD *)v60 + 7) = (unint64_t)sub_10000F260;
      long long v67 = v107;
      long long v68 = v108;
      long long v69 = v109;
      *((void *)v60 + 26) = 0x4020000000000000;
      *((_OWORD *)v60 + 11) = v68;
      *((_OWORD *)v60 + 12) = v69;
      *((_OWORD *)v60 + 10) = v67;
      long long v70 = v97;
      *(_OWORD *)uint64_t v60 = v96;
      *((_OWORD *)v60 + 1) = v70;
      unsigned long long v71 = v98;
      long long v72 = v99;
      long long v73 = v101;
      *((_OWORD *)v60 + 4) = v100;
      *((_OWORD *)v60 + 5) = v73;
      *((_OWORD *)v60 + 2) = v71;
      *((_OWORD *)v60 + 3) = v72;
      sub_10000FA74((uint64_t)&v96);
      sub_100006588(v93, &qword_10006C740);
      uint64_t v111 = v88;
      uint64_t v112 = v87;
      *(void *)&unsigned long long v113 = v91;
      *((void *)&v113 + 1) = v90;
      unsigned long long v114 = v30;
      uint64_t v115 = v31;
      uint64_t v116 = v32;
      char v117 = v89;
      __int16 v118 = 0;
      uint64_t v119 = 1;
      v120 = v86;
      uint64_t v121 = 0;
      v122 = v85;
      uint64_t v123 = v61;
      v124 = sub_10000F260;
      uint64_t v125 = 0;
      char v126 = v57;
      uint64_t v127 = v62;
      uint64_t v128 = v51;
      char v129 = v77;
      uint64_t v130 = v79;
      char v131 = v80;
      long long v132 = v63;
      uint64_t v133 = v78;
      char v134 = v64;
      uint64_t v135 = 0x4020000000000000;
      sub_10000FB08((uint64_t)&v111);
      return sub_100006588(v92, &qword_10006C740);
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10000F70C();
    sub_100049E50();
    __break(1u);
  }
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_10000EF7C()
{
  return sub_100018B5C();
}

void sub_10000EFB8(uint64_t *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  if (*a1)
  {
    uint64_t v4 = (void *)swift_allocObject();
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = 0;
    _OWORD v5[3] = 0;
    v5[4] = v3;
    swift_retain_n();
    sub_10004A590();
    swift_getKeyPath();
    sub_100005458(&qword_10006C208);
    sub_10004A570();
    swift_release();
    swift_release();
    swift_release();
    long long v18 = v16;
    LOBYTE(v19) = v17;
    sub_100005458(&qword_10006C750);
    sub_10004A550();
    swift_release();
    swift_release();
    NSString v6 = sub_10004A700();
    uint64_t v7 = &kCGColorSpaceDisplayP3;
    if (!v15) {
      uint64_t v7 = &kCGColorSpaceSRGB;
    }
    CFStringRef v8 = *v7;
    *(void *)&long long v18 = 0;
    id v9 = [self hexValuedColor:v6 colorSpace:v8 error:&v18];

    id v10 = (id)v18;
    if (v9)
    {
      sub_100019828(v9, v15, (uint64_t)&v18);
      long long v11 = v18;
      long long v12 = v19;
      char v13 = v20;
    }
    else
    {
      uint64_t v14 = v10;
      sub_1000498F0();

      swift_willThrow();
      swift_errorRelease();
      long long v11 = 0uLL;
      char v13 = 2;
      long long v12 = 0uLL;
    }
    *(_OWORD *)a2 = v11;
    *(_OWORD *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 32) = v13;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10000F70C();
    sub_100049E50();
    __break(1u);
  }
}

uint64_t sub_10000F260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_10004A770();
  if (v6)
  {
    uint64_t v7 = v6;
    CFStringRef v8 = sub_10001CAD8(v6, 0);
    id v9 = sub_10001CA1C(v29, v8 + 4, v7, 0xD000000000000016, 0x80000001000513F0);
    swift_bridgeObjectRelease();
    if (v9 == (void *)v7) {
      goto LABEL_5;
    }
    __break(1u);
  }
  CFStringRef v8 = &_swiftEmptyArrayStorage;
LABEL_5:
  NSString v10 = sub_10004A700();
  NSString v11 = sub_10004A700();
  id v12 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", a3, a4, v11);

  uint64_t v13 = sub_10004A740();
  unint64_t v15 = v14;

  if (sub_10004A770() >= 7)
  {
LABEL_31:
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v16 = HIBYTE(v15) & 0xF;
    v29[0] = v13;
    v29[1] = v15;
    if ((v15 & 0x2000000000000000) == 0) {
      uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
    }
    v29[2] = 0;
    v29[3] = v16;
    uint64_t v17 = sub_10004A7A0();
    if (v18)
    {
      uint64_t v19 = v17;
      uint64_t v20 = v18;
      while (1)
      {
        uint64_t v22 = v8[2];
        if (!v22) {
          goto LABEL_30;
        }
        BOOL v23 = v8[4] == v19 && v20 == v8[5];
        if (!v23 && (sub_10004AB60() & 1) == 0)
        {
          if (v22 == 1) {
            goto LABEL_30;
          }
          if (v8[6] != v19 || v20 != v8[7])
          {
            uint64_t result = sub_10004AB60();
            if ((result & 1) == 0) {
              break;
            }
          }
        }
LABEL_10:
        swift_bridgeObjectRelease();
        uint64_t v19 = sub_10004A7A0();
        uint64_t v20 = v21;
        if (!v21) {
          goto LABEL_32;
        }
      }
      if (v22 == 2)
      {
LABEL_30:
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
      uint64_t v25 = v8 + 9;
      uint64_t v26 = 2;
      while (1)
      {
        uint64_t v27 = v26 + 1;
        if (__OFADD__(v26, 1)) {
          break;
        }
        if (*(v25 - 1) == v19 && v20 == *v25) {
          goto LABEL_10;
        }
        uint64_t result = sub_10004AB60();
        if (result) {
          goto LABEL_10;
        }
        v25 += 2;
        ++v26;
        if (v27 == v22) {
          goto LABEL_30;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_32:
      swift_release();
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return result;
}

uint64_t sub_10000F4DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100049E00();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  CFStringRef v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *v2;
  NSString v10 = (char *)v8 + *(int *)(v6 + 28);
  uint64_t v11 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v12 = sub_100049F90();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  void *v8 = v9;
  v8[1] = v9;
  uint64_t v13 = a2 + *(int *)(sub_100005458(&qword_10006C768) + 36);
  sub_10000FC0C((uint64_t)v8, v13, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v13 + *(int *)(sub_100005458(&qword_10006C520) + 36)) = 256;
  uint64_t v14 = sub_100005458(&qword_10006C770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(a2, a1, v14);
  return sub_10000FC74((uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
}

unint64_t sub_10000F664()
{
  unint64_t result = qword_10006C728;
  if (!qword_10006C728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C728);
  }
  return result;
}

unint64_t sub_10000F6B8()
{
  unint64_t result = qword_10006C738;
  if (!qword_10006C738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C738);
  }
  return result;
}

unint64_t sub_10000F70C()
{
  unint64_t result = qword_10006D860;
  if (!qword_10006D860)
  {
    type metadata accessor for ColorPickerState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D860);
  }
  return result;
}

uint64_t sub_10000F77C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100049F10();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000F7AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100049F10();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000F7DC()
{
  return sub_100049F20();
}

uint64_t sub_10000F804()
{
  return sub_100049F20();
}

unsigned char *sub_10000F82C(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_10000F840()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_10000F850(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_10000F870()
{
  uint64_t v1 = (int *)(type metadata accessor for RGBAView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100049DB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000F988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RGBAView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000F9EC(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for RGBAView() - 8);
  uint64_t v4 = (uint64_t *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  sub_10000EFB8(v4, a1);
}

uint64_t sub_10000FA74(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000FB08(uint64_t a1)
{
  return a1;
}

ValueMetadata *type metadata accessor for RGBAView.PlatformBasedShapeModifier()
{
  return &type metadata for RGBAView.PlatformBasedShapeModifier;
}

uint64_t sub_10000FBB4()
{
  return sub_100006E54(&qword_10006C760, &qword_10006C6E8);
}

uint64_t sub_10000FBF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000FC0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FC74(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000FCD8()
{
  unint64_t result = qword_10006C778;
  if (!qword_10006C778)
  {
    sub_1000061E8(&qword_10006C768);
    sub_100006E54(&qword_10006C780, &qword_10006C770);
    sub_100006E54(&qword_10006C560, &qword_10006C520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C778);
  }
  return result;
}

id sub_10000FDA4(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  id result = (id)swift_release();
  if (v4 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    [a1 setNumberOfPages:v3];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    return [a1 setCurrentPage:v3];
  }
  return result;
}

id sub_10000FFE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PageControl.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PageControl.Coordinator()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for PageControl(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for PageControl()
{
  return swift_release();
}

void *assignWithCopy for PageControl(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for PageControl(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PageControl(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PageControl(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)id result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for PageControl()
{
  return &type metadata for PageControl;
}

void *sub_100010190()
{
  return &protocol witness table for Never;
}

id sub_1000101A0(void *a1)
{
  return sub_10000FDA4(a1);
}

id sub_1000101B0@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = (objc_class *)type metadata accessor for PageControl.Coordinator();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  uint64_t v7 = &v6[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker11PageControl11Coordinator_parent];
  *(void *)uint64_t v7 = v4;
  *((void *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  id result = objc_msgSendSuper2(&v9, "init");
  *a1 = result;
  return result;
}

uint64_t sub_100010228()
{
  return sub_10004A040();
}

uint64_t sub_10001026C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000104E0();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000102D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000104E0();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100010334()
{
}

unint64_t sub_100010360()
{
  unint64_t result = qword_10006C7B8;
  if (!qword_10006C7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C7B8);
  }
  return result;
}

id sub_1000103CC()
{
  id v0 = [objc_allocWithZone((Class)UIPageControl) init];
  uint64_t v1 = self;
  id v2 = [v1 secondaryLabelColor];
  [v0 setPageIndicatorTintColor:v2];

  id v3 = [v1 labelColor];
  [v0 setCurrentPageIndicatorTintColor:v3];

  [v0 setHidesForSinglePage:1];
  sub_100005458(&qword_10006C7C0);
  sub_10004A150();
  [v0 addTarget:v5 action:"valueChanged:" forControlEvents:4096];

  return v0;
}

unint64_t sub_1000104E0()
{
  unint64_t result = qword_10006C7C8;
  if (!qword_10006C7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C7C8);
  }
  return result;
}

void sub_100010574()
{
  uint64_t v1 = v0;
  id v2 = (SEL *)&unk_10006A000;
  id v3 = [v0 layer];
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v5 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath;
  unint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath];
  if (v6) {
    id v7 = [v6 CGPath];
  }
  else {
    id v7 = 0;
  }
  [v4 setPath:v7];

  id v8 = [v1 layer];
  self;
  objc_super v9 = (void *)swift_dynamicCastObjCClassUnconditional();
  NSString v10 = *(void **)&v1[v5];
  if (v10) {
    [v10 lineWidth];
  }
  else {
    double v11 = 1.0;
  }
  [v9 setLineWidth:v11];

  id v12 = [v1 layer];
  self;
  uint64_t v13 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v14 = *(void **)&v1[v5];
  if (v14) {
    [v14 miterLimit];
  }
  else {
    double v15 = 10.0;
  }
  [v13 setMiterLimit:v15];

  id v16 = [v1 layer];
  self;
  uint64_t v17 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v18 = *(void **)&v1[v5];
  if (v18)
  {
    unsigned int v19 = [v18 lineCapStyle];
    uint64_t v20 = (id *)&kCALineCapSquare;
    uint64_t v21 = &kCALineCapRound;
    if (v19 != 1) {
      uint64_t v21 = &kCALineCapButt;
    }
    if (v19 != 2) {
      uint64_t v20 = (id *)v21;
    }
  }
  else
  {
    uint64_t v20 = (id *)&kCALineCapButt;
  }
  id v22 = *v20;
  [v17 setLineCap:v22];

  id v23 = [v1 layer];
  self;
  int v24 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v25 = *(void **)&v1[v5];
  if (v25)
  {
    unsigned int v26 = [v25 lineJoinStyle];
    uint64_t v27 = (id *)&kCALineJoinBevel;
    uint64_t v28 = &kCALineJoinRound;
    if (v26 != 1) {
      uint64_t v28 = &kCALineJoinMiter;
    }
    if (v26 != 2) {
      uint64_t v27 = (id *)v28;
    }
  }
  else
  {
    uint64_t v27 = (id *)&kCALineJoinMiter;
  }
  id v29 = *v27;
  [v24 setLineJoin:v29];

  id v30 = [v1 layer];
  self;
  uint64_t v31 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v32 = *(void **)&v1[v5];
  if (v32 && ([v32 usesEvenOddFillRule] & 1) != 0) {
    unsigned long long v33 = (id *)&kCAFillRuleEvenOdd;
  }
  else {
    unsigned long long v33 = (id *)&kCAFillRuleNonZero;
  }
  id v34 = *v33;
  [v31 setFillRule:v34];

  uint64_t v35 = *(void **)&v1[v5];
  if (v35)
  {
    uint64_t v52 = 0;
    id v36 = v35;
    [v36 getLineDash:0 count:&v52 phase:0];
    uint64_t v37 = v52;
    if (v52 >= 1)
    {
      double v51 = 0.0;
      uint64_t v38 = sub_10004A810();
      *(void *)(v38 + 16) = v37;
      bzero((void *)(v38 + 32), 8 * v37);
      [v36 getLineDash:v38 + 32 count:&v52 phase:&v51];
      id v39 = [v1 layer];
      self;
      uint64_t v40 = swift_dynamicCastObjCClassUnconditional();
      id v41 = (void *)v40;
      uint64_t v42 = *(void *)(v38 + 16);
      if (v42)
      {
        id v48 = (void *)v40;
        id v49 = v39;
        swift_bridgeObjectRetain();
        sub_10004AA50();
        uint64_t v43 = 0;
        do
        {
          uint64_t v44 = v43 + 1;
          [objc_allocWithZone((Class)NSNumber) initWithDouble:*(double *)(v38 + 8 * v43 + 32)];
          sub_10004AA30();
          sub_10004AA60();
          sub_10004AA70();
          sub_10004AA40();
          uint64_t v43 = v44;
        }
        while (v42 != v44);
        swift_bridgeObjectRelease_n();
        id v2 = (SEL *)&unk_10006A000;
        id v41 = v48;
        id v39 = v49;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      sub_100010D7C(0, &qword_10006C800);
      Class isa = sub_10004A7D0().super.isa;
      swift_bridgeObjectRelease();
      [v41 setLineDashPattern:isa];

      id v47 = [v1 v2[321]];
      self;
      [(id)swift_dynamicCastObjCClassUnconditional() setLineDashPhase:v51];
    }
  }
  else
  {
    id v45 = [v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setLineDashPattern:0];

    id v50 = [v1 layer];
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setLineDashPhase:0.0];
  }
}

id sub_100010D14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShapeView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ShapeView()
{
  return self;
}

uint64_t sub_100010D7C(uint64_t a1, unint64_t *a2)
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

ValueMetadata *type metadata accessor for ColorSwatchCrosshairView()
{
  return &type metadata for ColorSwatchCrosshairView;
}

uint64_t sub_100010DC8()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_100010DE4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  id v4 = [self systemBackgroundColor];
  uint64_t v5 = sub_10004A400();
  sub_100049C80();
  uint64_t v6 = sub_10004A640();
  uint64_t v8 = v7;
  sub_10004A430();
  uint64_t v9 = sub_10004A450();
  swift_release();
  *(_OWORD *)a1 = xmmword_10004E2D0;
  *(void *)(a1 + 16) = v3;
  double result = v12;
  *(void *)(a1 + 24) = v11;
  *(double *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v13;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v15;
  *(void *)(a1 + 64) = v5;
  *(_WORD *)(a1 + 72) = 256;
  *(void *)(a1 + 80) = v6;
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 104) = 0x4010000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for RoundedRectShape(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for RoundedRectShape(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for RoundedRectShape(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RoundedRectShape()
{
  return &type metadata for RoundedRectShape;
}

unint64_t sub_100010F74()
{
  unint64_t result = qword_10006C810;
  if (!qword_10006C810)
  {
    sub_1000061E8(&qword_10006C818);
    sub_100006E54(&qword_10006C820, &qword_10006C828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C810);
  }
  return result;
}

uint64_t sub_100011014()
{
  return sub_100006E54(&qword_10006C830, &qword_10006C838);
}

double sub_100011050@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_10004A2B0();
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  CGRectGetMinX(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CGRectGetMinY(v15);
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  CGRectGetMaxX(v16);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  CGRectGetMinY(v17);
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  CGRectGetMaxX(v18);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetMaxY(v19);
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  CGRectGetMinX(v20);
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  CGRectGetMaxY(v21);
  sub_10004A280();
  sub_10004A2A0();
  sub_10004A290();
  sub_10004A2A0();
  sub_10004A290();
  sub_10004A2A0();
  sub_10004A290();
  sub_10004A2A0();
  sub_10004A290();
  sub_10004A270();
  double result = *(double *)&v11;
  *(_OWORD *)a1 = v11;
  *(_OWORD *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 32) = v13;
  return result;
}

double sub_1000112C0@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_100011050((uint64_t)v8, a2, a3, a4, a5);
  double result = *(double *)v8;
  long long v7 = v8[1];
  *(_OWORD *)a1 = v8[0];
  *(_OWORD *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 32) = v9;
  return result;
}

uint64_t sub_100011314()
{
  return Shape.sizeThatFits(_:)();
}

void (*sub_100011330(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100049BD0();
  return sub_1000113A0;
}

void sub_1000113A0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_1000113EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100011608();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100011450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100011608();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000114B4(uint64_t a1)
{
  unint64_t v2 = sub_100011608();

  return Shape.body.getter(a1, v2);
}

unint64_t sub_100011504()
{
  unint64_t result = qword_10006C840;
  if (!qword_10006C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C840);
  }
  return result;
}

unint64_t sub_10001155C()
{
  unint64_t result = qword_10006C848;
  if (!qword_10006C848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C848);
  }
  return result;
}

unint64_t sub_1000115B4()
{
  unint64_t result = qword_10006C850;
  if (!qword_10006C850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C850);
  }
  return result;
}

unint64_t sub_100011608()
{
  unint64_t result = qword_10006C858;
  if (!qword_10006C858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C858);
  }
  return result;
}

uint64_t sub_10001165C()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SpectrumView.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for SpectrumView()
{
  return &type metadata for SpectrumView;
}

unint64_t sub_1000116CC()
{
  unint64_t result = qword_10006C918;
  if (!qword_10006C918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C918);
  }
  return result;
}

uint64_t sub_100011724@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SpectrumView.Coordinator();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *a1 = result;
  return result;
}

uint64_t sub_10001175C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001184C();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000117C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001184C();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100011824()
{
}

unint64_t sub_10001184C()
{
  unint64_t result = qword_10006C920;
  if (!qword_10006C920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C920);
  }
  return result;
}

id sub_1000118A0()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)MTKView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [v0 setOpaque:1];
  [v0 setPaused:1];
  [v0 setEnableSetNeedsDisplay:1];
  sub_100005458(&qword_10006C928);
  sub_10004A150();
  id v1 = [objc_allocWithZone((Class)SpectrumRenderer) initWithMetal:v0];
  unint64_t v2 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v1;
  swift_release();

  return v0;
}

double sub_100011980@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

double sub_100011A04@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_100011A88()
{
  return sub_100011DE4();
}

uint64_t sub_100011A9C()
{
  return sub_100011DE4();
}

uint64_t sub_100011AB0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011B24()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011B98()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011C0C()
{
  return sub_100011DE4();
}

uint64_t sub_100011C20()
{
  return sub_100011DE4();
}

uint64_t sub_100011C34()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011CA8()
{
  return sub_100011DE4();
}

uint64_t sub_100011CBC()
{
  return sub_100011DE4();
}

uint64_t sub_100011CD0()
{
  return sub_100011DE4();
}

uint64_t sub_100011CE4()
{
  return sub_100011DE4();
}

uint64_t sub_100011CF8()
{
  return sub_100011DE4();
}

uint64_t sub_100011D0C()
{
  return sub_100011DE4();
}

double sub_100011D20()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011D94()
{
  return sub_100011DE4();
}

uint64_t sub_100011DA8()
{
  uint64_t result = CUIGetDeviceArtworkDisplayGamut();
  byte_100072488 = result != 0;
  return result;
}

uint64_t sub_100011DD0()
{
  return sub_100011DE4();
}

uint64_t sub_100011DE4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100011E50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();

  return swift_release();
}

uint64_t sub_100011EC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005458(&qword_10006CFE0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100005458(&qword_10006CFE8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  NSString v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  long long v12 = &v17[-v11];
  uint64_t v13 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState____lazy_storage___finalColor;
  swift_beginAccess();
  sub_100006524(v13, (uint64_t)v12, &qword_10006CFE8);
  uint64_t v14 = sub_100005458((uint64_t *)&unk_10006CA78);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v15 + 32))(a1, v12, v14);
  }
  sub_100006588((uint64_t)v12, &qword_10006CFE8);
  swift_beginAccess();
  sub_100005458(&qword_10006CFD8);
  sub_100049B40();
  swift_endAccess();
  sub_100005458(&qword_10006CFF0);
  sub_100013B8C();
  sub_100049BA0();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16))(v10, a1, v14);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
  swift_beginAccess();
  sub_100013BE8((uint64_t)v10, v13);
  return swift_endAccess();
}

void sub_1000121BC(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(unsigned char *)(a1 + 32) == 2) {
    uint64_t v3 = 0;
  }
  else {
    sub_100018AB4();
  }
  *a2 = v3;
}

uint64_t sub_100012214()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  if ((v7 & 1) != 0
    || (swift_getKeyPath(), swift_getKeyPath(), sub_100049B60(), swift_release(), swift_release(), v6 == 1))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049B60();
    swift_release();
    swift_release();
    int v0 = v4;
  }
  else
  {
    int v0 = 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  if (v5) {
    return v0 != 0;
  }
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v0) {
    return 1;
  }
  return v3 != (id)6;
}

uint64_t sub_1000123D0(uint64_t a1)
{
  uint64_t v90 = a1;
  uint64_t v2 = sub_100005458(&qword_10006CFA8);
  uint64_t v88 = *(void *)(v2 - 8);
  uint64_t v89 = v2;
  __chkstk_darwin(v2);
  uint64_t v87 = (char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100005458(&qword_10006C580);
  uint64_t v4 = __chkstk_darwin(v86);
  uint64_t v85 = (uint64_t)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v84 = (char *)&v69 - v6;
  uint64_t v7 = sub_100005458(&qword_10006CFB0);
  uint64_t v82 = *(void *)(v7 - 8);
  uint64_t v83 = v7;
  __chkstk_darwin(v7);
  long long v81 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100005458(&qword_10006CFB8);
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v78 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_100005458(&qword_10006CFC0);
  uint64_t v76 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  uint64_t v75 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100005458(&qword_10006CFC8);
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  long long v72 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005458(&qword_10006E8C0);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_100005458(&qword_10006CFD0);
  uint64_t v16 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  CGRect v18 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100005458(&qword_10006CFD8);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v22 = (char *)&v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__selectedColor;
  long long v95 = 0u;
  long long v96 = 0u;
  char v97 = 2;
  sub_100005458(&qword_10006CA18);
  sub_100049B30();
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23, v22, v19);
  id v24 = [self blackColor];
  uint64_t v25 = (CGColor *)[v24 CGColor];
  unsigned int v26 = CGColorGetColorSpace(v25);

  if (v26)
  {
    char v27 = sub_100019954(v26);
    if (v27 != 2)
    {
      sub_100019828(v24, v27 & 1, (uint64_t)&v95);
      long long v70 = v95;
      long long v69 = v96;
      char v30 = v97;

      long long v29 = v69;
      long long v28 = v70;
      goto LABEL_8;
    }
  }
  if (qword_10006C058 != -1) {
    swift_once();
  }
  sub_100019828(v24, byte_100072488, (uint64_t)&v95);
  long long v28 = v95;
  long long v29 = v96;
  char v30 = v97;
LABEL_8:
  uint64_t v31 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__fallbackColor;
  long long v92 = v28;
  long long v93 = v29;
  char v94 = v30;
  sub_100049B30();
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(v31, v18, v71);
  uint64_t v32 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__allowsNoColor;
  LOBYTE(v92) = 0;
  sub_100049B30();
  unsigned long long v33 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v33(v32, v15, v12);
  uint64_t v34 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__isVolatile;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v34, v15, v12);
  uint64_t v35 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__selectedTab;
  LOBYTE(v92) = 0;
  id v36 = v72;
  sub_100049B30();
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 32))(v35, v36, v74);
  uint64_t v37 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__title;
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v39 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v40 = sub_10004A700();
  NSString v41 = sub_10004A700();
  id v42 = [v39 localizedStringForKey:v40 value:0 table:v41];

  uint64_t v43 = sub_10004A740();
  uint64_t v45 = v44;

  *(void *)&long long v92 = v43;
  *((void *)&v92 + 1) = v45;
  id v46 = v75;
  sub_100049B30();
  (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(v37, v46, v77);
  uint64_t v47 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__showsAlpha;
  LOBYTE(v92) = 1;
  sub_100049B30();
  v33(v47, v15, v12);
  uint64_t v48 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__showsEyedropper;
  LOBYTE(v92) = 1;
  sub_100049B30();
  v33(v48, v15, v12);
  uint64_t v49 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__suggestedColors;
  *(void *)&long long v92 = 0;
  sub_100005458(&qword_10006CA58);
  id v50 = v78;
  sub_100049B30();
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 32))(v49, v50, v80);
  uint64_t v51 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__eyedropperShowing;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v51, v15, v12);
  uint64_t v52 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__eyedropperIsFloating;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v52, v15, v12);
  uint64_t v53 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__useLandscapeLayout;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v53, v15, v12);
  uint64_t v54 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__isEmbedded;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v54, v15, v12);
  uint64_t v55 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__isPopover;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v55, v15, v12);
  uint64_t v56 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__isSheet;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v56, v15, v12);
  uint64_t v57 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__width;
  *(void *)&long long v92 = 0;
  uint64_t v58 = v81;
  sub_100049B30();
  (*(void (**)(uint64_t, char *, uint64_t))(v82 + 32))(v57, v58, v83);
  uint64_t v59 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__showsGridOnly;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v59, v15, v12);
  uint64_t v60 = (void *)(v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState_close);
  *uint64_t v60 = 0;
  v60[1] = 0;
  uint64_t v61 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__enableDarkGrid;
  LOBYTE(v92) = 0;
  sub_100049B30();
  v33(v61, v15, v12);
  uint64_t v62 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__overrideColorScheme;
  uint64_t v63 = sub_100049C10();
  uint64_t v64 = (uint64_t)v84;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v84, 1, 1, v63);
  sub_100006524(v64, v85, &qword_10006C580);
  long long v65 = v87;
  sub_100049B30();
  sub_100006588(v64, &qword_10006C580);
  (*(void (**)(uint64_t, char *, uint64_t))(v88 + 32))(v62, v65, v89);
  uint64_t v66 = v1 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState____lazy_storage___finalColor;
  uint64_t v67 = sub_100005458((uint64_t *)&unk_10006CA78);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v66, 1, 1, v67);
  swift_beginAccess();
  uint64_t v91 = v90;
  sub_100005458(&qword_10006CA40);
  sub_100049B30();
  swift_endAccess();
  return v1;
}

uint64_t sub_100013054()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__selectedColor;
  uint64_t v2 = sub_100005458(&qword_10006CFD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__fallbackColor;
  uint64_t v4 = sub_100005458(&qword_10006CFD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__allowsNoColor;
  uint64_t v6 = sub_100005458(&qword_10006E8C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__isVolatile, v6);
  uint64_t v8 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__selectedTab;
  uint64_t v9 = sub_100005458(&qword_10006CFC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__favoriteColors;
  uint64_t v11 = sub_100005458(&qword_10006D000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__title;
  uint64_t v13 = sub_100005458(&qword_10006CFC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__showsAlpha, v6);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__showsEyedropper, v6);
  uint64_t v14 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__suggestedColors;
  uint64_t v15 = sub_100005458(&qword_10006CFB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__eyedropperShowing, v6);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__eyedropperIsFloating, v6);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__useLandscapeLayout, v6);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__isEmbedded, v6);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__isPopover, v6);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__isSheet, v6);
  uint64_t v16 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__width;
  uint64_t v17 = sub_100005458(&qword_10006CFB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__showsGridOnly, v6);
  sub_100013CC0(*(void *)(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState_close));
  v7(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__enableDarkGrid, v6);
  uint64_t v18 = v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState__overrideColorScheme;
  uint64_t v19 = sub_100005458(&qword_10006CFA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  sub_100006588(v0 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState____lazy_storage___finalColor, &qword_10006CFE8);
  return v0;
}

uint64_t sub_100013470()
{
  sub_100013054();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000134C8()
{
  return type metadata accessor for ColorPickerState();
}

uint64_t type metadata accessor for ColorPickerState()
{
  uint64_t result = qword_10006CA00;
  if (!qword_10006CA00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001351C()
{
  sub_10001392C(319, &qword_10006CA10, &qword_10006CA18, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F)
  {
    sub_1000138E4(319, &qword_10006CA20);
    if (v1 <= 0x3F)
    {
      sub_1000138E4(319, &qword_10006CA28);
      if (v2 <= 0x3F)
      {
        sub_1000138E4(319, &qword_10006CA30);
        if (v3 <= 0x3F)
        {
          sub_10001392C(319, &qword_10006CA38, &qword_10006CA40, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
          if (v4 <= 0x3F)
          {
            sub_1000138E4(319, &qword_10006CA48);
            if (v5 <= 0x3F)
            {
              sub_10001392C(319, &qword_10006CA50, &qword_10006CA58, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
              if (v6 <= 0x3F)
              {
                sub_1000138E4(319, &qword_10006CA60);
                if (v7 <= 0x3F)
                {
                  sub_10001392C(319, &qword_10006CA68, &qword_10006C580, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Published);
                  if (v8 <= 0x3F)
                  {
                    sub_10001392C(319, &qword_10006CA70, (uint64_t *)&unk_10006CA78, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
                    if (v9 <= 0x3F) {
                      swift_updateClassMetadata2();
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_1000138E4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_100049B80();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_10001392C(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = sub_1000061E8(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void *sub_10001398C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100013998@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ColorPickerState();
  uint64_t result = sub_100049B20();
  *a1 = result;
  return result;
}

uint64_t sub_1000139D8@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  if (v12 == 2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049B60();
    swift_release();
    uint64_t result = swift_release();
    uint64_t v3 = v8;
    uint64_t v4 = v9;
    uint64_t v5 = v10;
    uint64_t v6 = v11;
    char v7 = v12;
  }
  else
  {
    uint64_t v3 = v8;
    uint64_t v4 = v9;
    char v7 = v12 & 1;
    uint64_t v5 = v10;
    uint64_t v6 = v11;
  }
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return result;
}

uint64_t sub_100013AC8()
{
  return sub_100049B70();
}

unint64_t sub_100013B8C()
{
  unint64_t result = qword_10006CFF8;
  if (!qword_10006CFF8)
  {
    sub_1000061E8(&qword_10006CFE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006CFF8);
  }
  return result;
}

uint64_t sub_100013BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005458(&qword_10006CFE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013CC0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100013CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100005458(&qword_10006D068);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005458(&qword_10006D070);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  char v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_100049F80();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v13 = sub_100005458(&qword_10006D078);
  sub_100013E8C(a1, a2, (uint64_t)&v8[*(int *)(v13 + 44)]);
  id v14 = [self currentDevice];
  [v14 userInterfaceIdiom];

  sub_10004A640();
  sub_100049D10();
  sub_100006524((uint64_t)v8, (uint64_t)v12, &qword_10006D068);
  uint64_t v15 = &v12[*(int *)(v10 + 44)];
  long long v16 = v18[1];
  *(_OWORD *)uint64_t v15 = v18[0];
  *((_OWORD *)v15 + 1) = v16;
  *((_OWORD *)v15 + 2) = v18[2];
  sub_100006588((uint64_t)v8, &qword_10006D068);
  return sub_100016D10((uint64_t)v12, a3);
}

uint64_t sub_100013E8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v66 = a3;
  uint64_t v5 = sub_100005458(&qword_10006D080);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v65 = (uint64_t)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = sub_100005458(&qword_10006D088);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v35 - v14;
  uint64_t v16 = sub_100005458(&qword_10006D090);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v35 - v20;
  uint64_t v56 = (uint64_t)&v35 - v20;
  sub_1000143FC(a1, a2, (uint64_t)&v35 - v20);
  sub_10004A640();
  sub_100049E10();
  uint64_t v63 = v83;
  uint64_t v64 = v81;
  uint64_t v62 = v85;
  uint64_t v61 = v87;
  uint64_t v59 = v91;
  uint64_t v60 = v89;
  uint64_t v57 = v94;
  uint64_t v58 = v93;
  char v80 = 1;
  char v79 = v82;
  char v78 = v84;
  char v77 = v86;
  unsigned __int8 v76 = v88;
  unsigned __int8 v75 = v90;
  unsigned __int8 v74 = v92;
  uint64_t v47 = v15;
  sub_1000146F8(a1, (uint64_t)v15);
  sub_10004A640();
  sub_100049E10();
  uint64_t v54 = v97;
  uint64_t v55 = v95;
  uint64_t v53 = v99;
  uint64_t v52 = v101;
  uint64_t v50 = v105;
  uint64_t v51 = v103;
  uint64_t v48 = v108;
  uint64_t v49 = v107;
  unsigned __int8 v73 = 1;
  unsigned __int8 v72 = v96;
  unsigned __int8 v71 = v98;
  unsigned __int8 v70 = v100;
  unsigned __int8 v69 = v102;
  unsigned __int8 v68 = v104;
  unsigned __int8 v67 = v106;
  id v22 = v9;
  id v46 = v9;
  sub_100014B3C(a1, a2, (uint64_t)v9);
  sub_100006524((uint64_t)v21, (uint64_t)v19, &qword_10006D090);
  LOBYTE(a1) = v80;
  LOBYTE(v21) = v79;
  char v23 = v78;
  LOBYTE(v9) = v77;
  int v36 = v76;
  int v37 = v75;
  int v38 = v74;
  sub_100006524((uint64_t)v15, (uint64_t)v13, &qword_10006D088);
  int v39 = v73;
  int v40 = v72;
  int v41 = v71;
  int v42 = v70;
  int v43 = v69;
  int v44 = v68;
  int v45 = v67;
  uint64_t v24 = (uint64_t)v22;
  uint64_t v25 = v65;
  sub_100006524(v24, v65, &qword_10006D080);
  uint64_t v26 = (uint64_t)v19;
  uint64_t v27 = (uint64_t)v19;
  uint64_t v28 = v66;
  sub_100006524(v26, v66, &qword_10006D090);
  long long v29 = (int *)sub_100005458(&qword_10006D098);
  uint64_t v30 = v28 + v29[12];
  *(void *)uint64_t v30 = 0;
  *(unsigned char *)(v30 + 8) = a1;
  *(void *)(v30 + 16) = v64;
  *(unsigned char *)(v30 + 24) = (_BYTE)v21;
  *(void *)(v30 + 32) = v63;
  *(unsigned char *)(v30 + 40) = v23;
  *(void *)(v30 + 48) = v62;
  *(unsigned char *)(v30 + 56) = (_BYTE)v9;
  *(void *)(v30 + 64) = v61;
  *(unsigned char *)(v30 + 72) = v36;
  *(void *)(v30 + 80) = v60;
  *(unsigned char *)(v30 + 88) = v37;
  *(void *)(v30 + 96) = v59;
  *(unsigned char *)(v30 + 104) = v38;
  uint64_t v31 = v57;
  *(void *)(v30 + 112) = v58;
  *(void *)(v30 + 120) = v31;
  sub_100006524((uint64_t)v13, v28 + v29[16], &qword_10006D088);
  uint64_t v32 = v28 + v29[20];
  *(void *)uint64_t v32 = 0;
  *(unsigned char *)(v32 + 8) = v39;
  *(void *)(v32 + 16) = v55;
  *(unsigned char *)(v32 + 24) = v40;
  *(void *)(v32 + 32) = v54;
  *(unsigned char *)(v32 + 40) = v41;
  *(void *)(v32 + 48) = v53;
  *(unsigned char *)(v32 + 56) = v42;
  *(void *)(v32 + 64) = v52;
  *(unsigned char *)(v32 + 72) = v43;
  *(void *)(v32 + 80) = v51;
  *(unsigned char *)(v32 + 88) = v44;
  *(void *)(v32 + 96) = v50;
  *(unsigned char *)(v32 + 104) = v45;
  uint64_t v33 = v48;
  *(void *)(v32 + 112) = v49;
  *(void *)(v32 + 120) = v33;
  sub_100006524(v25, v28 + v29[24], &qword_10006D080);
  sub_100006588((uint64_t)v46, &qword_10006D080);
  sub_100006588((uint64_t)v47, &qword_10006D088);
  sub_100006588(v56, &qword_10006D090);
  sub_100006588(v25, &qword_10006D080);
  sub_100006588((uint64_t)v13, &qword_10006D088);
  return sub_100006588(v27, &qword_10006D090);
}

uint64_t sub_1000143FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v19[1] = a3;
  uint64_t v5 = sub_100005458(&qword_10006D0B0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005458(&qword_10006D190);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005458(&qword_10006D0A0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [self currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  if (v15 == (id)6)
  {
    sub_100015D08(a1, a2, (uint64_t)v13);
    uint64_t v16 = &qword_10006D0A0;
    sub_100006524((uint64_t)v13, (uint64_t)v10, &qword_10006D0A0);
    swift_storeEnumTagMultiPayload();
    sub_100016F30(&qword_10006D110, &qword_10006D0A0, &qword_10006D118, (void (*)(void))sub_10001702C);
    sub_100016F30(&qword_10006D0B8, &qword_10006D0B0, &qword_10006D0C0, (void (*)(void))sub_100016D78);
    sub_10004A0D0();
    uint64_t v17 = (uint64_t)v13;
  }
  else
  {
    sub_10001516C(a1, a2, (uint64_t)v7);
    uint64_t v16 = &qword_10006D0B0;
    sub_100006524((uint64_t)v7, (uint64_t)v10, &qword_10006D0B0);
    swift_storeEnumTagMultiPayload();
    sub_100016F30(&qword_10006D110, &qword_10006D0A0, &qword_10006D118, (void (*)(void))sub_10001702C);
    sub_100016F30(&qword_10006D0B8, &qword_10006D0B0, &qword_10006D0C0, (void (*)(void))sub_100016D78);
    sub_10004A0D0();
    uint64_t v17 = (uint64_t)v7;
  }
  return sub_100006588(v17, v16);
}

uint64_t sub_1000146F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = sub_100005458(&qword_10006D0C8);
  __chkstk_darwin(v33);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005458(&qword_10006D168);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v34 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    sub_100006678();
    uint64_t v9 = sub_10004A2F0();
    uint64_t v11 = v10;
    char v13 = v12;
    id v14 = [self currentDevice];
    id v15 = [v14 userInterfaceIdiom];

    uint64_t v36 = v6;
    uint64_t v37 = a2;
    uint64_t v35 = v7;
    if (v15 == (id)6) {
      sub_10004A230();
    }
    else {
      sub_10004A250();
    }
    char v16 = v13 & 1;
    uint64_t v17 = sub_10004A2E0();
    uint64_t v19 = v18;
    char v21 = v20;
    uint64_t v23 = v22;
    swift_release();
    sub_100006720(v9, v11, v16);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v38 = v17;
    uint64_t v39 = v19;
    char v40 = v21 & 1;
    uint64_t v41 = v23;
    uint64_t v42 = KeyPath;
    uint64_t v43 = 1;
    char v44 = 0;
    uint64_t v25 = enum case for DynamicTypeSize.xxxLarge(_:);
    uint64_t v26 = sub_100049DB0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v5, v25, v26);
    sub_100017180(&qword_10006D158, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
    if (sub_10004A6F0())
    {
      sub_100005458(&qword_10006D170);
      sub_10001728C();
      sub_100006E54(&qword_10006D108, &qword_10006D0C8);
      uint64_t v27 = v34;
      sub_10004A390();
      sub_100006588((uint64_t)v5, &qword_10006D0C8);
      sub_100006720(v38, v39, v40);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v29 = v35;
      uint64_t v28 = v36;
      uint64_t v30 = v37;
      (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v37, v27, v36);
      *(void *)(v30 + *(int *)(sub_100005458(&qword_10006D088) + 36)) = 0x3FF0000000000000;
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v27, v28);
    }
    __break(1u);
  }
  type metadata accessor for ColorPickerState();
  sub_100017180((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_100014B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v19[1] = a3;
  uint64_t v5 = sub_100005458(&qword_10006D0A0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005458(&qword_10006D0A8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005458(&qword_10006D0B0);
  __chkstk_darwin(v11);
  char v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [self currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  if (v15 == (id)6)
  {
    sub_10001516C(a1, a2, (uint64_t)v13);
    char v16 = &qword_10006D0B0;
    sub_100006524((uint64_t)v13, (uint64_t)v10, &qword_10006D0B0);
    swift_storeEnumTagMultiPayload();
    sub_100016F30(&qword_10006D0B8, &qword_10006D0B0, &qword_10006D0C0, (void (*)(void))sub_100016D78);
    sub_100016F30(&qword_10006D110, &qword_10006D0A0, &qword_10006D118, (void (*)(void))sub_10001702C);
    sub_10004A0D0();
    uint64_t v17 = (uint64_t)v13;
  }
  else
  {
    sub_100015D08(a1, a2, (uint64_t)v7);
    char v16 = &qword_10006D0A0;
    sub_100006524((uint64_t)v7, (uint64_t)v10, &qword_10006D0A0);
    swift_storeEnumTagMultiPayload();
    sub_100016F30(&qword_10006D0B8, &qword_10006D0B0, &qword_10006D0C0, (void (*)(void))sub_100016D78);
    sub_100016F30(&qword_10006D110, &qword_10006D0A0, &qword_10006D118, (void (*)(void))sub_10001702C);
    sub_10004A0D0();
    uint64_t v17 = (uint64_t)v7;
  }
  return sub_100006588(v17, v16);
}

uint64_t sub_100014E38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v19[1] = a2;
  uint64_t v3 = sub_100005458(&qword_10006D1A8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005458(&qword_10006D1B0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005458(&qword_10006D1B8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [self currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  if (v14 == (id)6)
  {
    sub_10004A640();
    sub_100049D10();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, a1, v3);
    id v15 = &v12[*(int *)(v10 + 36)];
    long long v16 = v21;
    *(_OWORD *)id v15 = v20;
    *((_OWORD *)v15 + 1) = v16;
    *((_OWORD *)v15 + 2) = v22;
    sub_100006524((uint64_t)v12, (uint64_t)v9, &qword_10006D1B8);
    swift_storeEnumTagMultiPayload();
    sub_1000173FC();
    sub_100006E54(&qword_10006D1C8, &qword_10006D1A8);
    sub_10004A0D0();
    return sub_100006588((uint64_t)v12, &qword_10006D1B8);
  }
  else
  {
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v18(v6, a1, v3);
    v18(v9, (uint64_t)v6, v3);
    swift_storeEnumTagMultiPayload();
    sub_1000173FC();
    sub_100006E54(&qword_10006D1C8, &qword_10006D1A8);
    sub_10004A0D0();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_10001516C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v80[3] = a2;
  uint64_t v85 = a1;
  uint64_t v86 = a3;
  uint64_t v84 = sub_100005458(&qword_10006D0C8);
  __chkstk_darwin(v84);
  unsigned __int8 v100 = (char *)v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004A940();
  uint64_t v98 = *(void *)(v4 - 8);
  uint64_t v99 = v4;
  __chkstk_darwin(v4);
  unsigned __int8 v88 = (char *)v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_100005458(&qword_10006D100);
  uint64_t v6 = __chkstk_darwin(v95);
  uint64_t v89 = (char *)v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v93 = (char *)v80 - v8;
  uint64_t v94 = sub_100005458(&qword_10006D0F0) - 8;
  __chkstk_darwin(v94);
  uint64_t v92 = (uint64_t)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_100005458(&qword_10006D0E0) - 8;
  __chkstk_darwin(v97);
  uint64_t v96 = (uint64_t)v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_100005458(&qword_10006D0C0);
  __chkstk_darwin(v90);
  uint64_t v91 = (char *)v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_100005458(&qword_10006D148);
  uint64_t v82 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v81 = (char *)v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ColorPickerState();
  uint64_t v14 = sub_100017180((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  v80[2] = v13;
  v80[1] = v14;
  uint64_t v103 = sub_100049E70();
  uint64_t v104 = v15;
  sub_100010D7C(0, (unint64_t *)&qword_10006E910);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v17 = self;
  id v18 = [v17 bundleForClass:ObjCClassFromMetadata];
  NSString v19 = sub_10004A700();
  NSString v20 = sub_10004A700();
  id v21 = [v18 localizedStringForKey:v19 value:0 table:v20];

  uint64_t v22 = sub_10004A740();
  uint64_t v24 = v23;

  uint64_t v101 = v22;
  uint64_t v102 = v24;
  unint64_t v87 = sub_100006678();
  uint64_t v25 = sub_10004A2F0();
  uint64_t v27 = v26;
  char v29 = v28 & 1;
  sub_1000166F4();
  uint64_t v30 = (uint64_t)v89;
  sub_10004A340();
  sub_100006720(v25, v27, v29);
  swift_bridgeObjectRelease();
  swift_release();
  sub_100005458(&qword_10006D150);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_10004EB90;
  id v32 = [v17 bundleForClass:ObjCClassFromMetadata];
  NSString v33 = sub_10004A700();
  NSString v34 = sub_10004A700();
  id v35 = [v32 localizedStringForKey:v33 value:0 table:v34];

  uint64_t v36 = sub_10004A740();
  uint64_t v38 = v37;

  *(void *)(v31 + 32) = v36;
  *(void *)(v31 + 40) = v38;
  id v39 = [v17 bundleForClass:ObjCClassFromMetadata];
  NSString v40 = sub_10004A700();
  NSString v41 = sub_10004A700();
  id v42 = [v39 localizedStringForKey:v40 value:0 table:v41];

  uint64_t v43 = sub_10004A740();
  uint64_t v45 = v44;

  uint64_t v46 = (uint64_t)v91;
  *(void *)(v31 + 48) = v43;
  *(void *)(v31 + 56) = v45;
  uint64_t v47 = (uint64_t)v93;
  sub_100049DF0();
  swift_bridgeObjectRelease();
  sub_100006588(v30, &qword_10006D100);
  uint64_t v48 = v92;
  sub_100006524(v47, v92, &qword_10006D100);
  *(_WORD *)(v48 + *(int *)(v94 + 44)) = 257;
  sub_100006588(v47, &qword_10006D100);
  LOBYTE(v30) = sub_10004A1F0();
  uint64_t v49 = v88;
  sub_100015BA4();
  sub_10004A910();
  uint64_t v50 = v99;
  uint64_t v51 = *(void (**)(char *, uint64_t))(v98 + 8);
  v51(v49, v99);
  sub_100049BF0();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v60 = v96;
  sub_100006524(v48, v96, &qword_10006D0F0);
  uint64_t v61 = v60 + *(int *)(v97 + 44);
  *(unsigned char *)uint64_t v61 = v30;
  *(void *)(v61 + 8) = v53;
  *(void *)(v61 + 16) = v55;
  *(void *)(v61 + 24) = v57;
  *(void *)(v61 + 32) = v59;
  *(unsigned char *)(v61 + 40) = 0;
  sub_100006588(v48, &qword_10006D0F0);
  LOBYTE(v30) = sub_10004A210();
  sub_100015BA4();
  sub_10004A910();
  v51(v49, v50);
  uint64_t v62 = (uint64_t)v100;
  sub_100049BF0();
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v68 = v67;
  uint64_t v70 = v69;
  sub_100006524(v60, v46, &qword_10006D0E0);
  uint64_t v71 = v46 + *(int *)(v90 + 36);
  *(unsigned char *)uint64_t v71 = v30;
  *(void *)(v71 + 8) = v64;
  *(void *)(v71 + 16) = v66;
  *(void *)(v71 + 24) = v68;
  *(void *)(v71 + 32) = v70;
  *(unsigned char *)(v71 + 40) = 0;
  sub_100006588(v60, &qword_10006D0E0);
  uint64_t v72 = enum case for DynamicTypeSize.xLarge(_:);
  uint64_t v73 = sub_100049DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 104))(v62, v72, v73);
  sub_100017180(&qword_10006D158, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if ((sub_10004A6F0() & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  sub_100016D78();
  sub_100006E54(&qword_10006D108, &qword_10006D0C8);
  unsigned __int8 v74 = v81;
  sub_10004A390();
  sub_100006588(v62, &qword_10006D0C8);
  sub_100006588(v46, &qword_10006D0C0);
  if (!v85)
  {
LABEL_8:
    uint64_t result = sub_100049E50();
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  if ((_BYTE)v103) {
    double v75 = 1.0;
  }
  else {
    double v75 = 0.0;
  }
  uint64_t v76 = v82;
  uint64_t v77 = v86;
  uint64_t v78 = v83;
  (*(void (**)(uint64_t, char *, uint64_t))(v82 + 16))(v86, v74, v83);
  *(double *)(v77 + *(int *)(sub_100005458(&qword_10006D0B0) + 36)) = v75;
  return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v74, v78);
}

uint64_t sub_100015BA4()
{
  sub_10004A930();
  NSString v0 = sub_10004A700();
  id v1 = [self systemImageNamed:v0];

  sub_10004A920();
  unint64_t v2 = self;
  id v3 = [v2 configurationWithTextStyle:UIFontTextStyleBody];
  id v4 = [v2 configurationWithWeight:6];
  id v5 = [v3 configurationByApplyingConfiguration:v4];

  sub_10004A8F0();
  id v6 = [self clearColor];
  uint64_t v7 = (uint64_t (*)(uint64_t *, void))sub_10004A900();
  sub_100049A40();
  return v7(&v9, 0);
}

uint64_t sub_100015D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100005458(&qword_10006D0C8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005458(&qword_10006D160);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  v19[1] = a2;
  id v21 = sub_100017208;
  uint64_t v22 = v13;
  __int16 v23 = 257;
  uint64_t v14 = enum case for DynamicTypeSize.xLarge(_:);
  uint64_t v15 = sub_100049DB0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v8, v14, v15);
  sub_100017180(&qword_10006D158, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  swift_retain();
  if (sub_10004A6F0())
  {
    uint64_t v20 = a3;
    sub_100005458(&qword_10006D118);
    sub_10001702C();
    sub_100006E54(&qword_10006D108, &qword_10006D0C8);
    sub_10004A390();
    sub_100006588((uint64_t)v8, &qword_10006D0C8);
    swift_release();
    if (a1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049B60();
      swift_release();
      swift_release();
      if (v21)
      {
        swift_release();
        uint64_t v16 = v20;
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100049B60();
        swift_release();
        swift_release();
        swift_release();
        double v17 = 1.0;
        uint64_t v16 = v20;
        if (v21 != 1)
        {
LABEL_7:
          (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v16, v12, v9);
          *(double *)(v16 + *(int *)(sub_100005458(&qword_10006D0A0) + 36)) = v17;
          return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        }
      }
      double v17 = 0.0;
      goto LABEL_7;
    }
  }
  else
  {
    __break(1u);
  }
  type metadata accessor for ColorPickerState();
  sub_100017180((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_1000160F8(uint64_t result)
{
  if (result)
  {
    id v1 = *(void (**)(uint64_t))(result + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState_close);
    if (v1)
    {
      uint64_t v2 = swift_retain();
      v1(v2);
      return sub_100013CC0((uint64_t)v1);
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100017180((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000161C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100013CD0(*v1, v1[1], a1);
}

uint64_t sub_1000161C8(uint64_t a1)
{
  uint64_t v2 = sub_100005458(&qword_10006D050);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100049A30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v9 = [objc_allocWithZone((Class)UITargetedPreview) initWithView:a1];
  sub_100010D7C(0, &qword_10006D058);
  void *v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for UIPointerEffect.highlight(_:), v5);
  uint64_t v10 = sub_100049A20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  return sub_10004A890();
}

id sub_1000164FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EyeDropperView.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EyeDropperView.Coordinator()
{
  return self;
}

ValueMetadata *type metadata accessor for EyeDropperView()
{
  return &type metadata for EyeDropperView;
}

id sub_100016588@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = (objc_class *)type metadata accessor for EyeDropperView.Coordinator();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  uint64_t v7 = &v6[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPickerP33_F502A9797323031478A3FD99A72B3C9114EyeDropperView11Coordinator_parent];
  *(void *)uint64_t v7 = v3;
  *((void *)v7 + 1) = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  id result = objc_msgSendSuper2(&v9, "init");
  *a1 = result;
  return result;
}

uint64_t sub_100016600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000169D4();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100016664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000169D4();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000166C8()
{
}

unint64_t sub_1000166F4()
{
  unint64_t result = qword_10006D038;
  if (!qword_10006D038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D038);
  }
  return result;
}

uint64_t sub_100016748@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000167C8()
{
  return sub_100049B70();
}

void *sub_10001683C()
{
  uint64_t v0 = sub_10004A940();
  __chkstk_darwin(v0 - 8);
  sub_100010D7C(0, &qword_10006D040);
  sub_100015BA4();
  id v1 = (void *)sub_10004A950();
  sub_100005458(&qword_10006D048);
  sub_10004A150();
  [v1 addTarget:v3 action:"buttonPressed:" forControlEvents:1];

  sub_10004A150();
  [v1 addTarget:v3 action:"buttonUp:" forControlEvents:64];

  sub_10004A150();
  [v1 addTarget:v3 action:"buttonUp:" forControlEvents:128];

  [v1 setContentHorizontalAlignment:4];
  sub_10004A960();
  return v1;
}

unint64_t sub_1000169D4()
{
  unint64_t result = qword_10006D060;
  if (!qword_10006D060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D060);
  }
  return result;
}

uint64_t sub_100016A28()
{
  id v1 = (void *)(v0
                + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPickerP33_F502A9797323031478A3FD99A72B3C9114EyeDropperView11Coordinator_parent);
  if (!*(void *)(v0
                  + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPickerP33_F502A9797323031478A3FD99A72B3C9114EyeDropperView11Coordinator_parent))
    goto LABEL_6;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if ((v3 & 1) == 0) {
    return result;
  }
  if (!*v1)
  {
LABEL_6:
    type metadata accessor for ColorPickerState();
    sub_100017180((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_100049B70();
}

void *initializeBufferWithCopyOfBuffer for ColorPickerNavigationBar(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

void *assignWithCopy for ColorPickerTabPicker(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for ColorPickerNavigationBar(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorPickerTabPicker(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for ColorPickerTabPicker(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerNavigationBar()
{
  return &type metadata for ColorPickerNavigationBar;
}

uint64_t sub_100016CF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005458(&qword_10006D070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016D78()
{
  return sub_100016DD8(&qword_10006D0D0, &qword_10006D0C0, (void (*)(void))sub_100016DA8);
}

uint64_t sub_100016DA8()
{
  return sub_100016DD8(&qword_10006D0D8, &qword_10006D0E0, (void (*)(void))sub_100016E54);
}

uint64_t sub_100016DD8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061E8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016E54()
{
  return sub_100016DD8(&qword_10006D0E8, &qword_10006D0F0, (void (*)(void))sub_100016E84);
}

unint64_t sub_100016E84()
{
  unint64_t result = qword_10006D0F8;
  if (!qword_10006D0F8)
  {
    sub_1000061E8(&qword_10006D100);
    sub_1000166F4();
    sub_100017180((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D0F8);
  }
  return result;
}

uint64_t sub_100016F30(unint64_t *a1, uint64_t *a2, uint64_t *a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061E8(a2);
    sub_1000061E8(a3);
    sub_1000061E8(&qword_10006D0C8);
    a4();
    sub_100006E54(&qword_10006D108, &qword_10006D0C8);
    swift_getOpaqueTypeConformance2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001702C()
{
  return sub_100016DD8(&qword_10006D120, &qword_10006D118, (void (*)(void))sub_10001705C);
}

unint64_t sub_10001705C()
{
  unint64_t result = qword_10006D128;
  if (!qword_10006D128)
  {
    sub_1000061E8(&qword_10006D130);
    sub_1000170D8();
    sub_10001712C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D128);
  }
  return result;
}

unint64_t sub_1000170D8()
{
  unint64_t result = qword_10006D138;
  if (!qword_10006D138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D138);
  }
  return result;
}

unint64_t sub_10001712C()
{
  unint64_t result = qword_10006D140;
  if (!qword_10006D140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D140);
  }
  return result;
}

uint64_t sub_100017180(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000171D0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100017208()
{
  return sub_1000160F8(*(void *)(v0 + 16));
}

uint64_t sub_100017228@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100049F30();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10001725C()
{
  return sub_100049F40();
}

unint64_t sub_10001728C()
{
  unint64_t result = qword_10006D178;
  if (!qword_10006D178)
  {
    sub_1000061E8(&qword_10006D170);
    sub_100006E54(&qword_10006D180, &qword_10006D188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D178);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerNavigationBar.PlatformBasedFrameModifier()
{
  return &type metadata for ColorPickerNavigationBar.PlatformBasedFrameModifier;
}

unint64_t sub_100017340()
{
  unint64_t result = qword_10006D198;
  if (!qword_10006D198)
  {
    sub_1000061E8(&qword_10006D070);
    sub_100006E54(&qword_10006D1A0, &qword_10006D068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D198);
  }
  return result;
}

uint64_t sub_1000173E0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000173FC()
{
  unint64_t result = qword_10006D1C0;
  if (!qword_10006D1C0)
  {
    sub_1000061E8(&qword_10006D1B8);
    sub_100006E54(&qword_10006D1C8, &qword_10006D1A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1C0);
  }
  return result;
}

unint64_t sub_1000174A0()
{
  unint64_t result = qword_10006D1D0;
  if (!qword_10006D1D0)
  {
    sub_1000061E8(&qword_10006D1D8);
    sub_1000173FC();
    sub_100006E54(&qword_10006D1C8, &qword_10006D1A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D1D0);
  }
  return result;
}

uint64_t destroy for ColorWell()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ColorWell(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ColorWell(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithTake for ColorWell(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorWell(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ColorWell(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ColorWell()
{
  return &type metadata for ColorWell;
}

uint64_t sub_100017738()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100017754()
{
  uint64_t v1 = sub_100005458(&qword_10006D1E0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (uint64_t *)((char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_100005458(&qword_10006D1E8);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v3 = sub_10004A640();
  v3[1] = v7;
  uint64_t v8 = sub_100005458(&qword_10006D1F0);
  sub_1000178C4((long long *)v0, (uint64_t)v3 + *(int *)(v8 + 44));
  sub_100006524((uint64_t)v3, (uint64_t)v6, &qword_10006D1E0);
  sub_100006588((uint64_t)v3, &qword_10006D1E0);
  long long v9 = *(_OWORD *)(v0 + 16);
  v11[0] = *(_OWORD *)v0;
  v11[1] = v9;
  v11[2] = *(_OWORD *)(v0 + 32);
  char v12 = *(unsigned char *)(v0 + 48);
  sub_100005458(&qword_10006D1F8);
  sub_10004A550();
  sub_100006730((uint64_t)v13, (uint64_t)v11, &qword_10006CA18);
  sub_100017FC0((uint64_t)v11);
  return sub_100006588((uint64_t)v6, &qword_10006D1E8);
}

uint64_t sub_1000178C4@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v53 = sub_10004A410();
  uint64_t v52 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100005458(&qword_10006D210);
  __chkstk_darwin(v56);
  unint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100005458(&qword_10006D218);
  __chkstk_darwin(v57);
  uint64_t v55 = (uint64_t *)((char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_100049E00();
  __chkstk_darwin(v8);
  uint64_t v10 = (_OWORD *)((char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_100005458(&qword_10006D220);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005458(&qword_10006D228);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100005458(&qword_10006D230);
  uint64_t v17 = __chkstk_darwin(v51);
  NSString v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v54 = (uint64_t)&v51 - v20;
  long long v21 = a1[1];
  long long v59 = *a1;
  long long v60 = v21;
  long long v61 = a1[2];
  char v62 = *((unsigned char *)a1 + 48);
  sub_100005458(&qword_10006D1F8);
  sub_10004A550();
  char v22 = v63;
  if (v63 == 2)
  {
    id v23 = [self systemGray5Color];
    uint64_t v24 = sub_10004A400();
    uint64_t v25 = (char *)v10 + *(int *)(v8 + 20);
    uint64_t v26 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v27 = sub_100049F90();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
    __asm { FMOV            V0.2D, #1.5 }
    _OWORD *v10 = _Q0;
    sub_10004A640();
    sub_100049D10();
    sub_1000182B0((uint64_t)v10, (uint64_t)v13);
    NSString v33 = &v13[*(int *)(v11 + 36)];
    long long v34 = v60;
    *(_OWORD *)NSString v33 = v59;
    *((_OWORD *)v33 + 1) = v34;
    *((_OWORD *)v33 + 2) = v61;
    sub_10000BE50((uint64_t)v10);
    uint64_t v35 = sub_10004A420();
    uint64_t KeyPath = swift_getKeyPath();
    sub_100006524((uint64_t)v13, (uint64_t)v16, &qword_10006D220);
    uint64_t v37 = (uint64_t *)&v16[*(int *)(v14 + 36)];
    *uint64_t v37 = KeyPath;
    v37[1] = v35;
    sub_100006588((uint64_t)v13, &qword_10006D220);
    sub_10004A670();
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    sub_100006524((uint64_t)v16, (uint64_t)v19, &qword_10006D228);
    id v42 = &v19[*(int *)(v51 + 36)];
    *(void *)id v42 = 0x3FE921FB54442D18;
    *((void *)v42 + 1) = v39;
    *((void *)v42 + 2) = v41;
    sub_100006588((uint64_t)v16, &qword_10006D228);
    uint64_t v43 = v54;
    sub_100006730((uint64_t)v19, v54, &qword_10006D230);
    sub_100006524(v43, (uint64_t)v19, &qword_10006D230);
    uint64_t v44 = (uint64_t)v55;
    uint64_t *v55 = v24;
    uint64_t v45 = sub_100005458(&qword_10006D238);
    sub_100006524((uint64_t)v19, v44 + *(int *)(v45 + 48), &qword_10006D230);
    swift_retain_n();
    sub_100006588((uint64_t)v19, &qword_10006D230);
    swift_release();
    sub_100006524(v44, (uint64_t)v6, &qword_10006D218);
    swift_storeEnumTagMultiPayload();
    sub_100005458(&qword_10006D240);
    sub_100006E54(&qword_10006D248, &qword_10006D240);
    sub_100006E54(&qword_10006D250, &qword_10006D218);
    sub_10004A0D0();
    sub_100006588(v44, &qword_10006D218);
    sub_100006588(v43, &qword_10006D230);
  }
  else
  {
    uint64_t v46 = sub_10004A440();
    uint64_t v47 = sub_10004A430();
    uint64_t v48 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
    if (v22) {
      uint64_t v48 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
    }
    (*(void (**)(char *, void, uint64_t))(v52 + 104))(v4, *v48, v53);
    uint64_t v49 = sub_10004A470();
    swift_retain_n();
    swift_retain();
    swift_retain();
    swift_release();
    *(void *)unint64_t v6 = v46;
    *((void *)v6 + 1) = v47;
    *((_WORD *)v6 + 8) = 256;
    *((void *)v6 + 3) = v49;
    swift_storeEnumTagMultiPayload();
    sub_100005458(&qword_10006D240);
    sub_100006E54(&qword_10006D248, &qword_10006D240);
    sub_100006E54(&qword_10006D250, &qword_10006D218);
    sub_10004A0D0();
    swift_release();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_100017FC0(uint64_t a1)
{
  sub_100006730(a1, (uint64_t)v18, &qword_10006CA18);
  if (v19 == 2)
  {
    sub_1000065E4();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v2 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v3 = sub_10004A700();
    NSString v4 = sub_10004A700();
    id v5 = [v2 localizedStringForKey:v3 value:0 table:v4];

    uint64_t v6 = sub_10004A740();
    uint64_t v8 = v7;

    *(void *)&long long v20 = v6;
    *((void *)&v20 + 1) = v8;
  }
  else
  {
    long long v20 = v18[0];
    long long v21 = v18[1];
    char v22 = v19;
    sub_100018AB4();
    uint64_t v10 = v9;
    id v11 = [v9 _accessibilityNameWithLuma];

    sub_10004A740();
  }
  sub_100006678();
  uint64_t v12 = sub_10004A2F0();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_100005458(&qword_10006D1E8);
  sub_100018210();
  sub_10004A350();
  sub_100006720(v12, v14, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000181CC()
{
  return sub_100017754();
}

unint64_t sub_100018210()
{
  unint64_t result = qword_10006D200;
  if (!qword_10006D200)
  {
    sub_1000061E8(&qword_10006D1E8);
    sub_100006E54(&qword_10006D208, &qword_10006D1E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D200);
  }
  return result;
}

uint64_t sub_1000182B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100049E00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double sub_100018314@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  sub_10004A2B0();
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  CGRectGetMinX(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CGRectGetMaxY(v15);
  sub_10004A280();
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  CGRectGetMaxX(v16);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  CGRectGetMinY(v17);
  sub_10004A2A0();
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  CGRectGetMinX(v18);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetMinY(v19);
  sub_10004A2A0();
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  CGRectGetMinX(v20);
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  CGRectGetMaxY(v21);
  sub_10004A2A0();
  sub_10004A270();
  double result = *(double *)&v11;
  *(_OWORD *)a1 = v11;
  *(_OWORD *)(a1 + 16) = v12;
  *(unsigned char *)(a1 + 32) = v13;
  return result;
}

uint64_t sub_100018474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100018764();

  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000184D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100018764();

  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001853C(uint64_t a1)
{
  unint64_t v2 = sub_100018764();

  return Shape.body.getter(a1, v2);
}

ValueMetadata *type metadata accessor for Triangle()
{
  return &type metadata for Triangle;
}

unint64_t sub_1000185A4()
{
  unint64_t result = qword_10006D258;
  if (!qword_10006D258)
  {
    sub_1000061E8(&qword_10006D260);
    sub_100018210();
    sub_100018620();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D258);
  }
  return result;
}

unint64_t sub_100018620()
{
  unint64_t result = qword_10006C5E8;
  if (!qword_10006C5E8)
  {
    sub_10004A170();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006C5E8);
  }
  return result;
}

uint64_t sub_100018678()
{
  return sub_100006E54(&qword_10006D268, &qword_10006D270);
}

unint64_t sub_1000186B8()
{
  unint64_t result = qword_10006D278;
  if (!qword_10006D278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D278);
  }
  return result;
}

unint64_t sub_100018710()
{
  unint64_t result = qword_10006D280;
  if (!qword_10006D280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D280);
  }
  return result;
}

unint64_t sub_100018764()
{
  unint64_t result = qword_10006D288;
  if (!qword_10006D288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D288);
  }
  return result;
}

__n128 initializeWithCopy for SomeColor(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SomeColor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SomeColor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SomeColor()
{
  return &type metadata for SomeColor;
}

uint64_t sub_100018868()
{
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = sub_10004A700();
  NSString v3 = sub_10004A700();
  id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

  uint64_t v5 = sub_10004A740();
  return v5;
}

void sub_10001896C(uint64_t a1@<X8>)
{
  if ((*(unsigned char *)(v1 + 32) & 1) == 0)
  {
    double v3 = *(double *)v1;
    double v4 = *(double *)(v1 + 8);
    double v5 = *(double *)(v1 + 16);
    CGFloat Alpha = *(double *)(v1 + 24);
LABEL_7:
    *(double *)a1 = v3;
    *(double *)(a1 + 8) = v4;
    *(double *)(a1 + 16) = v5;
    *(CGFloat *)(a1 + 24) = Alpha;
    *(unsigned char *)(a1 + 32) = 0;
    return;
  }
  sub_100018AB4();
  uint64_t v8 = v7;
  uint64_t v9 = (CGColor *)[v7 CGColor];

  uint64_t v10 = (void *)UISCreateCachedColorTransform();
  if (!v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v11 = v10;
  long long v12 = CGColorGetColorSpace(v9);
  if (!v12)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  char v13 = v12;
  if (sub_10004A860())
  {
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    CGFloat Alpha = CGColorGetAlpha(v9);

    double v3 = sub_10001ABC0(0.0);
    double v4 = sub_10001ABC0(0.0);
    double v5 = sub_10001ABC0(0.0);
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
}

void sub_100018AB4()
{
  uint64_t v1 = (CFStringRef *)&kCGColorSpaceDisplayP3;
  if (!*(unsigned char *)(v0 + 32)) {
    uint64_t v1 = (CFStringRef *)&kCGColorSpaceSRGB;
  }
  NSString v2 = CGColorSpaceCreateWithName(*v1);
  if (v2)
  {
    double v3 = v2;
    long long v4 = *(_OWORD *)(v0 + 16);
    v6[0] = *(_OWORD *)v0;
    v6[1] = v4;
    CGColorRef v5 = CGColorCreate(v2, (const CGFloat *)v6);

    if (v5)
    {
      [objc_allocWithZone((Class)UIColor) initWithCGColor:v5];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100018B5C()
{
  sub_100005458(&qword_10006C200);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10004F100;
  float v2 = *v0 * 255.0;
  uint64_t v3 = lroundf(v2);
  *(void *)(v1 + 56) = &type metadata for Int;
  *(void *)(v1 + 64) = &protocol witness table for Int;
  *(void *)(v1 + 32) = v3;
  float v4 = v0[1] * 255.0;
  uint64_t v5 = lroundf(v4);
  *(void *)(v1 + 96) = &type metadata for Int;
  *(void *)(v1 + 104) = &protocol witness table for Int;
  *(void *)(v1 + 72) = v5;
  float v6 = v0[2] * 255.0;
  uint64_t v7 = lroundf(v6);
  *(void *)(v1 + 136) = &type metadata for Int;
  *(void *)(v1 + 144) = &protocol witness table for Int;
  *(void *)(v1 + 112) = v7;
  uint64_t v8 = sub_10004A750();
  uint64_t v10 = v9;
  sub_100005458(&qword_10006D338);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10004C900;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 32) = v8;
  *(void *)(v11 + 40) = v10;
  swift_bridgeObjectRetain();
  sub_10004ABD0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100018CAC()
{
  return 1;
}

void sub_100018CB8()
{
}

uint64_t sub_100018CE4()
{
  return 0x65756C6156776172;
}

uint64_t sub_100018CFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x65756C6156776172 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_10004AB60();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_100018D94()
{
  return 0;
}

void sub_100018DA0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100018DAC(uint64_t a1)
{
  unint64_t v2 = sub_10001A870();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100018DE8(uint64_t a1)
{
  unint64_t v2 = sub_10001A870();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_100018E24()
{
  return sub_10004AC20();
}

Swift::Int sub_100018E68()
{
  return sub_10004AC20();
}

uint64_t sub_100018EB8(void *a1)
{
  uint64_t v2 = sub_100005458(&qword_10006D310);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001A0D0(a1, a1[3]);
  sub_10001A870();
  sub_10004AC40();
  sub_10004A740();
  sub_10004AB40();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

BOOL sub_10001900C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100019024()
{
  Swift::UInt v1 = *v0;
  sub_10004ABF0();
  sub_10004AC00(v1);
  return sub_10004AC20();
}

void sub_10001906C()
{
  sub_10004AC00(*v0);
}

Swift::Int sub_100019098()
{
  Swift::UInt v1 = *v0;
  sub_10004ABF0();
  sub_10004AC00(v1);
  return sub_10004AC20();
}

uint64_t sub_1000190DC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100019A20(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_10001910C(void *a1)
{
  return sub_100018EB8(a1);
}

void sub_100019128(void *a1@<X8>)
{
  *a1 = &off_100062438;
}

void sub_100019138(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 32))
  {
    double v11 = *(double *)v1;
    double v12 = *(double *)(v1 + 8);
    double v13 = *(double *)(v1 + 16);
    CGFloat Alpha = *(double *)(v1 + 24);
    goto LABEL_7;
  }
  sub_100018AB4();
  uint64_t v4 = v3;
  char v5 = (CGColor *)[v3 CGColor];

  float v6 = (void *)UISCreateCachedColorTransform();
  if (!v6)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v7 = v6;
  uint64_t v8 = CGColorGetColorSpace(v5);
  if (!v8)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v9 = v8;
  if (sub_10004A860())
  {
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    CGFloat Alpha = CGColorGetAlpha(v5);

    double v11 = sub_10001ABC0(0.0);
    double v12 = sub_10001ABC0(0.0);
    double v13 = sub_10001ABC0(0.0);
LABEL_7:
    *(double *)a1 = v11;
    *(double *)(a1 + 8) = v12;
    *(double *)(a1 + 16) = v13;
    *(CGFloat *)(a1 + 24) = Alpha;
    *(unsigned char *)(a1 + 32) = 1;
    return;
  }
LABEL_10:
  __break(1u);
}

void sub_100019284()
{
  if ((*(void *)v0 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *(void *)v0;
  }
  else {
    Swift::UInt64 v1 = 0;
  }
  sub_10004AC10(v1);
  if ((*(void *)(v0 + 8) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v2 = *(void *)(v0 + 8);
  }
  else {
    Swift::UInt64 v2 = 0;
  }
  sub_10004AC10(v2);
  if ((*(void *)(v0 + 16) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v3 = *(void *)(v0 + 16);
  }
  else {
    Swift::UInt64 v3 = 0;
  }
  sub_10004AC10(v3);
  if ((*(void *)(v0 + 24) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = *(void *)(v0 + 24);
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  sub_10004AC10(v4);
  sub_10004AC00(*(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_1000192F0(void *a1)
{
  Swift::UInt64 v3 = v1;
  uint64_t v5 = sub_100005458(&qword_10006D2B8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001A0D0(a1, a1[3]);
  sub_10001A114();
  sub_10004AC40();
  uint64_t v11 = *v3;
  HIBYTE(v10) = 0;
  sub_10001A260();
  sub_10004AB50();
  if (!v2)
  {
    uint64_t v11 = v3[1];
    HIBYTE(v10) = 1;
    sub_10004AB50();
    uint64_t v11 = v3[2];
    HIBYTE(v10) = 2;
    sub_10004AB50();
    uint64_t v11 = v3[3];
    HIBYTE(v10) = 3;
    sub_10004AB50();
    LOBYTE(v11) = *((unsigned char *)v3 + 32);
    HIBYTE(v10) = 4;
    sub_10001A2B4();
    sub_10004AB50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

BOOL sub_100019538(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10001954C()
{
  uint64_t result = 114;
  switch(*v0)
  {
    case 1:
      uint64_t result = 103;
      break;
    case 2:
      uint64_t result = 98;
      break;
    case 3:
      uint64_t result = 97;
      break;
    case 4:
      uint64_t result = 0x617053726F6C6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000195C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100019C68(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000195E8(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1000195F4(uint64_t a1)
{
  unint64_t v2 = sub_10001A114();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100019630(uint64_t a1)
{
  unint64_t v2 = sub_10001A114();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_10001966C()
{
  return sub_10004AC20();
}

Swift::Int sub_1000196B0()
{
  return sub_10004AC20();
}

uint64_t sub_1000196EC(uint64_t a1, uint64_t a2)
{
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)a1, *(float64x2_t *)a2), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)(a2 + 16)))), 0xFuLL))))return (*(unsigned __int8 *)(a2 + 32) ^ *(unsigned __int8 *)(a1 + 32) ^ 1) & 1; {
  else
  }
    return 0;
}

double sub_100019738@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100019E28(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_100019780(void *a1)
{
  return sub_1000192F0(a1);
}

unint64_t sub_10001979C()
{
  unint64_t result = qword_10006D290;
  if (!qword_10006D290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D290);
  }
  return result;
}

unint64_t sub_1000197F0@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10001ADC0(*a1);
  *a2 = result;
  return result;
}

void sub_10001981C(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_100019828(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = (CGColor *)[a1 CGColor];
  char v7 = a2 & 1;
  uint64_t v8 = (void *)UISCreateCachedColorTransform();
  if (!v8)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v9 = v8;
  uint64_t v10 = CGColorGetColorSpace(v6);
  if (!v10)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v11 = v10;
  if (sub_10004A860())
  {
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    CGFloat Alpha = CGColorGetAlpha(v6);

    *(_OWORD *)a3 = 0uLL;
    *(void *)(a3 + 16) = 0;
    *(CGFloat *)(a3 + 24) = Alpha;
    *(unsigned char *)(a3 + 32) = v7;
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_100019954(CGColorSpace *a1)
{
  CFStringRef v1 = CGColorSpaceCopyName(a1);
  if (!v1) {
    return 2;
  }
  uint64_t v2 = (__CFString *)v1;
  type metadata accessor for CFString(0);
  sub_10001A308();
  Swift::UInt64 v3 = (id)kCGColorSpaceSRGB;
  char v4 = sub_1000499E0();

  if (v4)
  {

    return 0;
  }
  else
  {
    uint64_t v6 = (id)kCGColorSpaceDisplayP3;
    char v7 = sub_1000499E0();

    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100019A20(void *a1)
{
  uint64_t v3 = sub_100005458(&qword_10006D2F8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001A0D0(a1, a1[3]);
  sub_10001A870();
  sub_10004AC30();
  if (v1) {
    return sub_10001A168((uint64_t)a1);
  }
  sub_10004AB20();
  NSString v8 = sub_10004A700();
  swift_bridgeObjectRelease();
  type metadata accessor for CFString(0);
  sub_10001A308();
  id v9 = (id)kCGColorSpaceSRGB;
  id v16 = v8;
  int v10 = sub_1000499E0();

  int v15 = v10;
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = (id)kCGColorSpaceDisplayP3;
    id v12 = v16;
    char v13 = sub_1000499E0();

    if (v13) {
      goto LABEL_7;
    }
    sub_10001A8C4();
    swift_allocError();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_10001A168((uint64_t)a1);
  }

LABEL_7:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_10001A168((uint64_t)a1);
  return (v15 & 1) == 0;
}

uint64_t sub_100019C68(uint64_t a1, uint64_t a2)
{
  if (a1 == 114 && a2 == 0xE100000000000000 || (sub_10004AB60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 103 && a2 == 0xE100000000000000 || (sub_10004AB60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 98 && a2 == 0xE100000000000000 || (sub_10004AB60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 97 && a2 == 0xE100000000000000 || (sub_10004AB60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x617053726F6C6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_10004AB60();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_100019E28@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100005458(&qword_10006D298);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSString v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001A0D0(a1, a1[3]);
  sub_10001A114();
  sub_10004AC30();
  if (v2) {
    return sub_10001A168((uint64_t)a1);
  }
  char v16 = 0;
  sub_10001A1B8();
  sub_10004AB30();
  uint64_t v9 = v17;
  char v16 = 1;
  sub_10004AB30();
  uint64_t v10 = v17;
  char v16 = 2;
  sub_10004AB30();
  uint64_t v11 = v17;
  char v16 = 3;
  sub_10004AB30();
  uint64_t v12 = v17;
  char v16 = 4;
  sub_10001A20C();
  sub_10004AB30();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v13 = v17;
  uint64_t result = sub_10001A168((uint64_t)a1);
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v12;
  *(unsigned char *)(a2 + 32) = v13;
  return result;
}

void *sub_10001A0D0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10001A114()
{
  unint64_t result = qword_10006D2A0;
  if (!qword_10006D2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2A0);
  }
  return result;
}

uint64_t sub_10001A168(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10001A1B8()
{
  unint64_t result = qword_10006D2A8;
  if (!qword_10006D2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2A8);
  }
  return result;
}

unint64_t sub_10001A20C()
{
  unint64_t result = qword_10006D2B0;
  if (!qword_10006D2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2B0);
  }
  return result;
}

unint64_t sub_10001A260()
{
  unint64_t result = qword_10006D2C0;
  if (!qword_10006D2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2C0);
  }
  return result;
}

unint64_t sub_10001A2B4()
{
  unint64_t result = qword_10006D2C8;
  if (!qword_10006D2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2C8);
  }
  return result;
}

unint64_t sub_10001A308()
{
  unint64_t result = qword_10006E920;
  if (!qword_10006E920)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E920);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for SomeColor.ColorSpace(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SomeColor.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SomeColor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001A4C8);
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

uint64_t sub_10001A4F0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001A4F8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.CodingKeys()
{
  return &type metadata for SomeColor.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SomeColor.ColorSpace(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SomeColor.ColorSpace(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001A66CLL);
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

unsigned char *sub_10001A694(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace()
{
  return &type metadata for SomeColor.ColorSpace;
}

unint64_t sub_10001A6B4()
{
  unint64_t result = qword_10006D2D0;
  if (!qword_10006D2D0)
  {
    sub_1000061E8(&qword_10006C238);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2D0);
  }
  return result;
}

unint64_t sub_10001A714()
{
  unint64_t result = qword_10006D2D8;
  if (!qword_10006D2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2D8);
  }
  return result;
}

unint64_t sub_10001A76C()
{
  unint64_t result = qword_10006D2E0;
  if (!qword_10006D2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2E0);
  }
  return result;
}

unint64_t sub_10001A7C4()
{
  unint64_t result = qword_10006D2E8;
  if (!qword_10006D2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2E8);
  }
  return result;
}

unint64_t sub_10001A81C()
{
  unint64_t result = qword_10006D2F0;
  if (!qword_10006D2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D2F0);
  }
  return result;
}

unint64_t sub_10001A870()
{
  unint64_t result = qword_10006D300;
  if (!qword_10006D300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D300);
  }
  return result;
}

unint64_t sub_10001A8C4()
{
  unint64_t result = qword_10006D308;
  if (!qword_10006D308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D308);
  }
  return result;
}

uint64_t sub_10001A924()
{
  return 0;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace.CodingError()
{
  return &type metadata for SomeColor.ColorSpace.CodingError;
}

uint64_t _s27com_apple_UIKit_ColorPicker9SomeColorV10ColorSpaceO11CodingErrorOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s27com_apple_UIKit_ColorPicker9SomeColorV10ColorSpaceO11CodingErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10001AA28);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.ColorSpace.CodingKeys()
{
  return &type metadata for SomeColor.ColorSpace.CodingKeys;
}

unint64_t sub_10001AA64()
{
  unint64_t result = qword_10006D318;
  if (!qword_10006D318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D318);
  }
  return result;
}

unint64_t sub_10001AABC()
{
  unint64_t result = qword_10006D320;
  if (!qword_10006D320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D320);
  }
  return result;
}

unint64_t sub_10001AB14()
{
  unint64_t result = qword_10006D328;
  if (!qword_10006D328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D328);
  }
  return result;
}

unint64_t sub_10001AB6C()
{
  unint64_t result = qword_10006D330;
  if (!qword_10006D330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D330);
  }
  return result;
}

double sub_10001ABC0(double a1)
{
  return fmax(fmin(a1, 1.0), 0.0);
}

uint64_t getEnumTagSinglePayload for SomeColor.Component(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SomeColor.Component(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x10001AD30);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SomeColor.Component()
{
  return &type metadata for SomeColor.Component;
}

unint64_t sub_10001AD6C()
{
  unint64_t result = qword_10006D340;
  if (!qword_10006D340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D340);
  }
  return result;
}

unint64_t sub_10001ADC0(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_10001ADE0()
{
  uint64_t result = sub_10004A5A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10001AEA4(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for _CPUITextField()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  swift_getWitnessTable();
  sub_10004A160();
  sub_10004A150();
  [v4 setDelegate:v20];

  sub_10004A150();
  [v4 addTarget:v20 action:"textFieldValueChanged:" forControlEvents:0x20000];

  [v4 setAutocapitalizationType:3];
  [v4 setAutocorrectionType:1];
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 40));
  [v4 setKeyboardType:v5];
  [v4 setTextAlignment:1];
  [v4 setAdjustsFontForContentSizeCategory:1];
  [v4 setReturnKeyType:9];
  id v6 = sub_10001CBCC();
  BOOL v7 = self;
  id v8 = v4;
  id v9 = [v7 fontWithDescriptor:v6 size:0.0];
  [v8 setFont:v9];

  if (v5 == 8)
  {
    id v10 = [self currentDevice];
    id v11 = [v10 userInterfaceIdiom];

    if (!v11)
    {
      id v12 = [objc_allocWithZone((Class)UIToolbar) init];
      sub_100005458(&qword_10006D8C0);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_10004F660;
      *(void *)(v13 + 32) = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
      *(void *)(v13 + 40) = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v8 action:"resignFirstResponder"];
      CGRect v20 = (void *)v13;
      sub_10004A7F0();
      sub_100010D7C(0, &qword_10006D570);
      Class isa = sub_10004A7D0().super.isa;
      swift_bridgeObjectRelease();
      [v12 setItems:isa];

      [v12 sizeToFit];
      [v8 setInputAccessoryView:v12];
    }
  }
  sub_100010D7C(0, (unint64_t *)&unk_10006D560);
  sub_10004A150();
  id v15 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithDelegate:v20];

  [v8 addInteraction:v15];
  id v16 = [self currentDevice];
  id v17 = [v16 userInterfaceIdiom];

  if (v17 == (id)6)
  {
    id v18 = v8;
    [v18 setBorderStyle:3];
  }
  return v8;
}

void sub_10001B2B8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(a1);
  id v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v9);
  id v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = (char *)(v3 + *(int *)(v16 + 56));
  char v18 = *v17;
  uint64_t v19 = *((void *)v17 + 1);
  LOBYTE(v38) = v18;
  uint64_t v39 = v19;
  sub_100005458((uint64_t *)&unk_10006D550);
  sub_10004A500();
  char v20 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v4, a3);
  if (v20)
  {
    int v21 = v15[*(int *)(a3 + 32)];
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a3);
    if (v21 != 1) {
      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a3);
  }
  char v22 = *(uint64_t (**)(char *))(v4 + *(int *)(a3 + 44));
  sub_10004A5A0();
  sub_10004A550();
  uint64_t v23 = v22(v11);
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  id v26 = [a1 text];
  if (!v26) {
    goto LABEL_12;
  }
  uint64_t v27 = v26;
  uint64_t v28 = sub_10004A740();
  uint64_t v30 = v29;

  if (v23 == v28 && v25 == v30)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v32 = sub_10004AB60();
  swift_bridgeObjectRelease();
  if (v32)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_12:
    NSString v33 = sub_10004A700();
    swift_bridgeObjectRelease();
    [a1 setText:v33];

    swift_getWitnessTable();
    sub_10004A160();
    sub_10004A150();
    long long v34 = v38;
    sub_10001BE90(a1);
  }
LABEL_14:
  sub_10001CB50();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  int v35 = v40;
  swift_release();
  id v36 = sub_10001D148(v35 != 2);
  [a1 setTextColor:v36];
}

id sub_10001B660(int *a1)
{
  uint64_t v3 = sub_10004A5A0();
  uint64_t v26 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - v4;
  uint64_t v25 = type metadata accessor for CPTextField.Coordinator();
  uint64_t v6 = sub_10001CB50();
  int v24 = *(unsigned __int8 *)(v1 + a1[9]);
  uint64_t v7 = (char *)(v1 + a1[14]);
  char v8 = *v7;
  uint64_t v9 = *((void *)v7 + 1);
  char v27 = v8;
  uint64_t v28 = v9;
  swift_retain();
  sub_100005458((uint64_t *)&unk_10006D550);
  sub_10004A520();
  uint64_t v10 = v30;
  int v23 = v31;
  id v11 = (uint64_t *)(v1 + a1[11]);
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (uint64_t *)(v1 + a1[12]);
  uint64_t v15 = v14[1];
  uint64_t v21 = *v14;
  uint64_t v22 = v29;
  uint64_t v16 = (uint64_t *)(v1 + a1[13]);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10004A580();
  id v19 = sub_10001D4B0(v6, v24, v22, v10, v23, v12, v13, v21, v15, v18, v17, (uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v3);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v19;
}

uint64_t sub_10001B86C()
{
  return sub_10004A560();
}

id sub_10001B8E8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)((swift_isaMask & *v2) + 0x50);
  uint64_t v5 = sub_10004A970();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void *)(v4 - 8);
  __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v18 - v11;
  id result = [a1 text];
  if (result)
  {
    uint64_t v14 = result;
    uint64_t v19 = v6;
    uint64_t v15 = sub_10004A740();
    uint64_t v17 = v16;

    (*(void (**)(uint64_t, uint64_t))((char *)v2 + *(void *)((swift_isaMask & *v2) + 0x70)))(v15, v17);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, v4) == 1)
    {
      return (id)(*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v9, v5);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v9, v4);
      sub_10001D564((uint64_t)v12);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v4);
    }
  }
  return result;
}

void sub_10001BB38(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10001B8E8(v4);
}

uint64_t sub_10001BBA0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = [a1 text];
  if (!v10)
  {
    char v17 = 0;
    return v17 & 1;
  }
  uint64_t v11 = v10;
  uint64_t result = sub_10004A740();
  if (!__OFADD__(a2, a3))
  {
    uint64_t v14 = result;
    uint64_t v15 = v13;
    id v16 = [v11 length];

    if ((uint64_t)v16 >= a2 + a3) {
      char v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v5
    }
                                                                                            + *(void *)((swift_isaMask & *v5) + 0x78)))(v14, v15, a2, a3, a4, a5);
    else {
      char v17 = 0;
    }
    swift_bridgeObjectRelease();
    return v17 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001BCAC(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_10004A740();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a1;
  LOBYTE(a5) = sub_10001BBA0(v12, a4, a5, v9, v11);

  swift_bridgeObjectRelease();
  return a5 & 1;
}

void sub_10001BD3C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10001D728();
}

void sub_10001BD9C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10001D730();
}

uint64_t sub_10001BDFC(int a1, int a2, id a3)
{
  return 1;
}

void sub_10001BE28(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10001BE24(v4);
}

void sub_10001BE90(void *a1)
{
  if (*((unsigned char *)v1 + *(void *)((swift_isaMask & *v1) + 0x60)) != 1) {
    return;
  }
  id v3 = [a1 selectedTextRange];
  if (!v3) {
    return;
  }
  id v26 = v3;
  sub_100010D7C(0, &qword_10006D4B8);
  id v4 = [v26 start];
  id v5 = [v26 end];
  char v6 = sub_10004A8E0();

  if (v6)
  {
    id v7 = [a1 text];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = sub_10004A740();
      unint64_t v11 = v10;

      uint64_t v12 = sub_10001CE3C(v9, v11);
      uint64_t v14 = v13;
      char v16 = v15;
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        id v17 = [a1 beginningOfDocument];
        id v18 = [v26 start];
        id v19 = [a1 offsetFromPosition:v17 toPosition:v18];

        if ((uint64_t)v19 < v12)
        {
          id v20 = [a1 beginningOfDocument];
          id v21 = [a1 positionFromPosition:v20 offset:v12];

          if (!v21)
          {
            __break(1u);
            return;
          }
          goto LABEL_13;
        }
        BOOL v22 = __OFADD__(v12, v14);
        uint64_t v23 = v12 + v14;
        if (v22)
        {
          __break(1u);
          goto LABEL_18;
        }
        if (v23 < (uint64_t)v19)
        {
          id v24 = [a1 beginningOfDocument];
          id v21 = [a1 positionFromPosition:v24 offset:v23];

          if (v21)
          {
LABEL_13:
            id v25 = [a1 textRangeFromPosition:v21 toPosition:v21];
            [a1 setSelectedTextRange:v25];

            goto LABEL_14;
          }
LABEL_18:
          __break(1u);
          return;
        }
      }
    }
  }
LABEL_14:
}

uint64_t sub_10001C150()
{
  uint64_t v0 = sub_1000498E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1000498B0();
  swift_bridgeObjectRelease();
  char v4 = sub_100049890();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t sub_10001C254(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return 0;
  }
  uint64_t v6 = 0;
  for (uint64_t i = (uint64_t *)(a3 + 40); ; i += 2)
  {
    uint64_t v8 = *i;
    v11[0] = *(i - 1);
    v11[1] = v8;
    swift_bridgeObjectRetain();
    char v9 = a1(v11);
    swift_bridgeObjectRelease();
    if (v3 || (v9 & 1) != 0) {
      break;
    }
    if (v4 == ++v6) {
      return 0;
    }
  }
  return v6;
}

void sub_10001C328()
{
}

id sub_10001C350()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CPTextField.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001C3AC(void *a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_super v2 = (char *)a1 + *(void *)((swift_isaMask & *a1) + 0x88);
  uint64_t v3 = sub_10004A5A0();
  uint64_t v4 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

uint64_t type metadata accessor for CPTextField.Coordinator()
{
  return sub_10001D960();
}

id sub_10001C548@<X0>(int *a1@<X0>, void *a2@<X8>)
{
  id result = sub_10001B660(a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001C570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_10001C5EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, WitnessTable);
}

void sub_10001C668()
{
}

void sub_10001C768(void *a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for _CPUITextField();
  objc_msgSendSuper2(&v6, "buildMenuWithBuilder:", a1);
  sub_100010D7C(0, &qword_10006D4B8);
  id v3 = [a1 system];
  id v4 = [self contextSystem];
  char v5 = sub_10004A8E0();

  if (v5)
  {
    [a1 removeMenuForIdentifier:UIMenuLookup];
    [a1 removeMenuForIdentifier:UIMenuLearn];
    [a1 removeMenuForIdentifier:UIMenuAutoFill];
    [a1 removeMenuForIdentifier:UIMenuShare];
  }
}

id sub_10001C9C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _CPUITextField();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for _CPUITextField()
{
  return self;
}

void *sub_10001CA1C(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  char v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v12 = a4;
  unint64_t v13 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v14 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *char v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    _OWORD v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = sub_10004A7A0();
      if (!v11) {
        break;
      }
      ++v9;
      uint64_t *v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_10001CAD8(uint64_t a1, uint64_t a2)
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
  sub_100005458(&qword_10006D4C0);
  id v4 = (void *)swift_allocObject();
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_10001CB50()
{
  uint64_t result = *v0;
  if (!*v0)
  {
    type metadata accessor for ColorPickerState();
    sub_10001E8A4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

id sub_10001CBCC()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  uint64_t v2 = self;
  if (v1 == (id)6)
  {
    id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
    sub_100005458(&qword_10006D578);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10004C900;
    UIFontDescriptorAttributeName v5 = UIFontDescriptorTraitsAttribute;
    *(void *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    sub_100005458(&qword_10006D580);
    uint64_t v6 = swift_initStackObject();
    uint64_t v7 = v6;
    *(_OWORD *)(v6 + 16) = xmmword_10004C900;
    UIFontDescriptorTraitKey v8 = UIFontWeightTrait;
    *(void *)(v6 + 32) = UIFontWeightTrait;
    uint64_t v9 = &UIFontWeightSemibold;
  }
  else
  {
    id v3 = [v2 preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    sub_100005458(&qword_10006D578);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10004C900;
    UIFontDescriptorAttributeName v5 = UIFontDescriptorTraitsAttribute;
    *(void *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    sub_100005458(&qword_10006D580);
    uint64_t v6 = swift_initStackObject();
    uint64_t v7 = v6;
    *(_OWORD *)(v6 + 16) = xmmword_10004C900;
    UIFontDescriptorTraitKey v8 = UIFontWeightTrait;
    *(void *)(v6 + 32) = UIFontWeightTrait;
    uint64_t v9 = &UIFontWeightMedium;
  }
  *(UIFontWeight *)(v6 + 40) = *v9;
  uint64_t v10 = v5;
  uint64_t v11 = v8;
  unint64_t v12 = sub_10001EA94(v7);
  *(void *)(inited + 64) = sub_100005458(&qword_10006D588);
  *(void *)(inited + 40) = v12;
  sub_10001EBA0(inited);
  type metadata accessor for AttributeName(0);
  sub_10001E8A4(&qword_10006C330, type metadata accessor for AttributeName);
  Class isa = sub_10004A6D0().super.isa;
  swift_bridgeObjectRelease();
  id v14 = [v3 fontDescriptorByAddingAttributes:isa];

  return v14;
}

uint64_t sub_10001CE3C(uint64_t a1, unint64_t a2)
{
  uint64_t v28 = sub_1000498E0();
  uint64_t v4 = *(void *)(v28 - 8);
  uint64_t v5 = __chkstk_darwin(v28);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v24 - v8;
  sub_1000498C0();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10004A770();
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = sub_10001CAD8(v10, 0);
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_10001CA1C(&v29, v12 + 4, v11, a1, a2);
    uint64_t result = swift_bridgeObjectRelease();
    if (v13 != (void *)v11)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    uint64_t v15 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = swift_bridgeObjectRelease();
    unint64_t v12 = &_swiftEmptyArrayStorage;
  }
  __chkstk_darwin(v15);
  *(&v24 - 2) = (uint64_t)v9;
  uint64_t result = sub_10001C254((uint64_t (*)(void *))sub_10001D124, (uint64_t)(&v24 - 4), (uint64_t)v12);
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v28);
    swift_release();
    return 0;
  }
  uint64_t v17 = result;
  uint64_t v18 = result + 1;
  if (__OFADD__(result, 1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v19 = v12[2];
  if (v18 < v19)
  {
    int v26 = v16;
    uint64_t v27 = v4;
    id v20 = (uint64_t (**)(char *, uint64_t))(v4 + 8);
    uint64_t v25 = result;
    uint64_t v21 = (uint64_t)&v12[2 * result + 7];
    unint64_t v22 = result + 1;
    while ((v18 & 0x8000000000000000) == 0)
    {
      if (v22 >= v12[2]) {
        goto LABEL_21;
      }
      swift_bridgeObjectRetain();
      sub_1000498B0();
      swift_bridgeObjectRelease();
      char v23 = sub_100049890();
      uint64_t result = (*v20)(v7, v28);
      if ((v23 & 1) == 0)
      {
        uint64_t v18 = v22;
        goto LABEL_16;
      }
      ++v22;
      v21 += 16;
      if (v19 == v22)
      {
        uint64_t v18 = v19;
LABEL_16:
        uint64_t v4 = v27;
        uint64_t v17 = v25;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_17:
  uint64_t result = swift_release();
  if (!__OFSUB__(v18, v17))
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v28);
    return v17;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_10001D124()
{
  return sub_10001C150() & 1;
}

id sub_10001D148(char a1)
{
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  uint64_t v4 = self;
  uint64_t v5 = (SEL *)&selRef_whiteColor;
  uint64_t v6 = &selRef_labelColor;
  if ((a1 & 1) == 0) {
    uint64_t v6 = &selRef_tertiaryLabelColor;
  }
  if (v3 != (id)6) {
    uint64_t v5 = (SEL *)v6;
  }
  id v7 = [v4 *v5];

  return v7;
}

id sub_10001D1F8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15 = (void *)((char *)v12 + *(void *)((swift_isaMask & *v12) + 0x58));
  swift_beginAccess();
  type metadata accessor for ColorPickerState();
  sub_10001E8A4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  int v16 = v12;
  swift_retain();
  *uint64_t v15 = sub_100049D90();
  v15[1] = v17;
  swift_endAccess();
  *((unsigned char *)v16 + *(void *)((swift_isaMask & *v16) + 0x60)) = a2;
  uint64_t v18 = (char *)v16 + *(void *)((swift_isaMask & *v16) + 0x80);
  *(void *)uint64_t v18 = a3;
  *((void *)v18 + 1) = a4;
  unsigned char v18[16] = a5;
  uint64_t v19 = (void *)((char *)v16 + *(void *)((swift_isaMask & *v16) + 0x68));
  *uint64_t v19 = a6;
  v19[1] = a7;
  id v20 = (void *)((char *)v16 + *(void *)((swift_isaMask & *v16) + 0x70));
  *id v20 = a8;
  v20[1] = a9;
  uint64_t v21 = (void *)((char *)v16 + *(void *)((swift_isaMask & *v16) + 0x78));
  *uint64_t v21 = a10;
  v21[1] = a11;
  unint64_t v22 = (char *)v16 + *(void *)((swift_isaMask & *v16) + 0x88);
  uint64_t v23 = sub_10004A5A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v22, a12, v23);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  v30.receiver = v16;
  v30.super_class = (Class)type metadata accessor for CPTextField.Coordinator();
  return objc_msgSendSuper2(&v30, "init");
}

id sub_10001D4B0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v19 = objc_allocWithZone((Class)type metadata accessor for CPTextField.Coordinator());
  return sub_10001D1F8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_10001D564(uint64_t a1)
{
  uint64_t v3 = swift_isaMask & *(void *)v1;
  uint64_t v4 = *(void *)(v3 + 0x50);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(a1);
  id v7 = (char *)&v13 - v6;
  uint64_t v8 = sub_10004A5A0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - v10;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v13 - v10, &v1[*(void *)(v3 + 136)], v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_10004A560();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10001D728()
{
  return sub_10001B86C();
}

uint64_t sub_10001D730()
{
  sub_10001B86C();
  swift_beginAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v1 == 2)
  {
    swift_beginAccess();
    swift_beginAccess();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_100049B70();
  }
  return result;
}

void sub_10001D920()
{
}

uint64_t sub_10001D960()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10001D990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_10001D998()
{
  uint64_t result = sub_10004A5A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10001DA60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = v5;
  unint64_t v7 = v5 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v7 & (v5 + 16);
  uint64_t v9 = *(void *)(v4 + 64);
  int v10 = v5 & 0x100000;
  uint64_t v11 = *a2;
  *a1 = *a2;
  BOOL v12 = v6 <= 7 && v10 == 0;
  if (v12
    && (uint64_t v13 = ((v6 + 16) & ~v6) + v9,
        ((((((((((v13 + v8 + 9) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16 <= 0x18))
  {
    id v14 = a1;
    uint64_t v15 = ~v6;
    a1[1] = a2[1];
    int v16 = (void *)(v7 & ((unint64_t)a1 + 23));
    uint64_t v17 = (void *)(v7 & ((unint64_t)a2 + 23));
    *int v16 = *v17;
    uint64_t v18 = (void *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
    id v19 = (void *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v18 = *v19;
    uint64_t v20 = v6 + 8;
    unint64_t v39 = ((unint64_t)v18 + v20) & v15;
    unint64_t v21 = ((unint64_t)v19 + v20) & v15;
    unint64_t v22 = *(void (**)(unint64_t, unint64_t, uint64_t))(v4 + 16);
    uint64_t v23 = v3;
    swift_retain();
    swift_retain();
    swift_retain();
    v22(v39, v21, v23);
    uint64_t v24 = (char *)v16 + v13;
    *uint64_t v24 = *((unsigned char *)v17 + v13);
    v24[1] = *((unsigned char *)v17 + v13 + 1);
    uint64_t v25 = (void *)(((unint64_t)v16 + v13 + 9) & 0xFFFFFFFFFFFFFFF8);
    int v26 = (void *)(((unint64_t)v17 + v13 + 9) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v25 = *v26;
    uint64_t v27 = (void *)(((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v28 = (void *)(((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    objc_super v30 = (void *)(((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFFFF8);
    unsigned __int8 v31 = (void *)(((unint64_t)v28 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v32 = v31[1];
    *objc_super v30 = *v31;
    v30[1] = v32;
    NSString v33 = (void *)(((unint64_t)v30 + 23) & 0xFFFFFFFFFFFFFFF8);
    long long v34 = (void *)(((unint64_t)v31 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v35 = v34[1];
    *NSString v33 = *v34;
    v33[1] = v35;
    unint64_t v36 = ((unint64_t)v33 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v37 = ((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v36 = *(unsigned char *)v37;
    *(void *)(v36 + 8) = *(void *)(v37 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  else
  {
    id v14 = (uint64_t *)(v11 + v8);
  }
  swift_retain();
  return v14;
}

uint64_t sub_10001DCA4(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))((v6 + ((((a1 + (v6 | 7) + 16) & ~(v6 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v6, v4);
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_10001DDC4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v6 = *(void *)(v5 - 8) + 16;
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = (v7 | 7) + 16;
  uint64_t v9 = (void *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  int v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  BOOL v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  uint64_t v13 = ((unint64_t)v11 + v7 + 8) & ~v7;
  uint64_t v14 = ((unint64_t)v12 + v7 + 8) & ~v7;
  swift_retain();
  swift_retain();
  swift_retain();
  v32(v13, v14, v5);
  uint64_t v15 = *(void *)(v6 + 48) + ((v7 + 16) & ~v7);
  int v16 = (char *)v9 + v15;
  uint64_t v17 = (char *)v10 + v15;
  *int v16 = *v17;
  v16[1] = v17[1];
  uint64_t v18 = (void *)((unint64_t)(v16 + 9) & 0xFFFFFFFFFFFFFFF8);
  id v19 = (void *)((unint64_t)(v17 + 9) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v18 = *v19;
  uint64_t v20 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v21 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = (void *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  int v26 = (void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = (void *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v28 = v27[1];
  *int v26 = *v27;
  v26[1] = v28;
  unint64_t v29 = ((unint64_t)v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = ((unint64_t)v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v29 = *(unsigned char *)v30;
  *(void *)(v29 + 8) = *(void *)(v30 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_10001DF78(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 | 7) + 16;
  int v10 = (void *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  uint64_t v11 = (void *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  void *v10 = *v11;
  swift_retain();
  swift_release();
  BOOL v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v12 = *v13;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 24))(((unint64_t)v12 + v8 + 8) & ~v8, ((unint64_t)v13 + v8 + 8) & ~v8, v6);
  uint64_t v14 = *(void *)(v7 + 64) + ((v8 + 16) & ~v8);
  uint64_t v15 = (char *)v10 + v14;
  int v16 = (char *)v11 + v14;
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = (void *)((unint64_t)(v15 + 9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v18 = (void *)((unint64_t)(v16 + 9) & 0xFFFFFFFFFFFFFFF8);
  void *v17 = *v18;
  id v19 = (void *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = v20[1];
  *id v19 = *v20;
  v19[1] = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  swift_retain();
  swift_release();
  uint64_t v25 = (void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  int v26 = (void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  unint64_t v28 = ((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = ((unint64_t)v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v28 = *(unsigned char *)v29;
  *(void *)(v28 + 8) = *(void *)(v29 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_10001E178(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void (**)(unint64_t, unint64_t))(v4 + 32);
  uint64_t v6 = v4 + 32;
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = (v7 | 7) + 16;
  uint64_t v9 = (void *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  int v10 = (void *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  *uint64_t v9 = *v10;
  uint64_t v11 = (void *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  BOOL v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  v5(((unint64_t)v11 + v7 + 8) & ~v7, ((unint64_t)v12 + v7 + 8) & ~v7);
  uint64_t v13 = *(void *)(v6 + 32) + ((v7 + 16) & ~v7);
  uint64_t v14 = (char *)v9 + v13;
  uint64_t v15 = (char *)v10 + v13;
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  int v16 = (void *)((unint64_t)(v14 + 9) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)((unint64_t)(v15 + 9) & 0xFFFFFFFFFFFFFFF8);
  *int v16 = *v17;
  uint64_t v18 = (_OWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
  id v19 = (_OWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v18 = *v19;
  uint64_t v20 = (_OWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (_OWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v20 = *v21;
  uint64_t v22 = (_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (_OWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v22 = *v23;
  *(_OWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_10001E2B0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 | 7) + 16;
  int v10 = (void *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  uint64_t v11 = (void *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  void *v10 = *v11;
  swift_release();
  BOOL v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v12 = *v13;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 40))(((unint64_t)v12 + v8 + 8) & ~v8, ((unint64_t)v13 + v8 + 8) & ~v8, v6);
  uint64_t v14 = *(void *)(v7 + 64) + ((v8 + 16) & ~v8);
  uint64_t v15 = (char *)v10 + v14;
  int v16 = (char *)v11 + v14;
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = (void *)((unint64_t)(v15 + 9) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (unint64_t)(v16 + 9) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = *(void *)v18;
  v18 += 15;
  void *v17 = v19;
  uint64_t v20 = (_OWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 23;
  *uint64_t v20 = *(_OWORD *)(v18 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  uint64_t v22 = (_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  v21 &= 0xFFFFFFFFFFFFFFF8;
  *uint64_t v22 = *(_OWORD *)v21;
  swift_release();
  uint64_t v23 = (_OWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v24 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v25 = *(_OWORD *)v24;
  v24 += 23;
  *uint64_t v23 = v25;
  swift_release();
  unint64_t v26 = ((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v26 = *(unsigned char *)(v24 & 0xFFFFFFFFFFFFFFF8);
  *(void *)(v26 + 8) = *(void *)((v24 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  return a1;
}

uint64_t sub_10001E464(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = v6 | 7;
  if (v7 < a2)
  {
    unint64_t v9 = ((((((((((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)
                 + ((v6 + 16) & ~v6)
                 + ((v6 + 16) & ~v8)
                 + 9) & 0xFFFFFFFFFFFFFFF8)
               + 15) & 0xFFFFFFFFFFFFFFF8)
             + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 23) & 0xFFFFFFFFFFFFFFF8)
       + 16;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10001E600);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_22:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  unint64_t v18 = (unint64_t *)(((((unint64_t)a1 + v8 + 16) & ~v8) + 15) & 0xFFFFFFFFFFFFFFF8);
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v18 + v6 + 8) & ~v6);
  }
  unint64_t v19 = *v18;
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  return (v19 + 1);
}

void sub_10001E614(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((((((((((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
                + ((v9 + 16) & ~v9)
                + ((v9 + 16) & ~(v9 | 7))
                + 9) & 0xFFFFFFFFFFFFFFF8)
              + 15) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            unint64_t v18 = (void *)((((unint64_t)&a1[(v9 | 7) + 16] & ~(v9 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8);
            if ((v7 & 0x80000000) != 0)
            {
              uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(((unint64_t)v18 + v9 + 8) & ~v9);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v19 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v19 = a2 - 1;
              }
              *unint64_t v18 = v19;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
                 + ((v9 + 16) & ~v9)
                 + ((v9 + 16) & ~(v9 | 7))
                 + 9) & 0xFFFFFFF8)
               + 15) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v12 = v11 + 1;
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
               + ((v9 + 16) & ~v9)
               + ((v9 + 16) & ~(v9 | 7))
               + 9) & 0xFFFFFFF8)
             + 15) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
    int v16 = v15;
  else {
    int v16 = 1;
  }
  if (((((((((((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
               + ((v9 + 16) & ~v9)
               + ((v9 + 16) & ~(v9 | 7))
               + 9) & 0xFFFFFFF8)
             + 15) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8)
       + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x10001E848);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for CPTextField()
{
  return sub_10001D960();
}

uint64_t sub_10001E888()
{
  return swift_getWitnessTable();
}

uint64_t sub_10001E8A4(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_10001E8EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v17[0] = a1;
  v17[1] = a2;
  uint64_t v6 = sub_100005458(&qword_10006D898);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a3 + 16);
  unsigned int v11 = _swiftEmptyArrayStorage;
  if (v10)
  {
    uint64_t v19 = _swiftEmptyArrayStorage;
    sub_100025E08(0, v10, 0);
    unsigned int v11 = v19;
    for (uint64_t i = (_OWORD *)(a3 + 64); ; i += 3)
    {
      long long v13 = *(i - 1);
      v18[0] = *(i - 2);
      v18[1] = v13;
      _OWORD v18[2] = *i;
      ((void (*)(_OWORD *))v17[0])(v18);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v19 = v11;
      unint64_t v15 = v11[2];
      unint64_t v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_100025E08(v14 > 1, v15 + 1, 1);
        unsigned int v11 = v19;
      }
      void v11[2] = v15 + 1;
      sub_100006730((uint64_t)v9, (uint64_t)v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v15, &qword_10006D898);
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
  }
  return v11;
}

unint64_t sub_10001EA94(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005458(&qword_10006D9E8);
  id v2 = (void *)sub_10004AAD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_10002646C((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_10001EBA0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005458(&qword_10006D9D8);
  uint64_t v2 = sub_10004AAD0();
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
    sub_100006524(v6, (uint64_t)&v13, &qword_10006D9E0);
    uint64_t v7 = v13;
    unint64_t result = sub_10002646C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100028D7C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

uint64_t sub_10001EE94(long long *a1)
{
  uint64_t v3 = sub_100005458(&qword_10006D868);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (uint64_t)sub_100024DFC(a1, &v30);
  if (v31 >> 62 == 2)
  {
    v31 &= 0x3FFFFFFFFFFFFFFFuLL;
    long long v8 = *(_OWORD *)(v1
                   + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_parent
                   + 16);
    v32[0] = *(_OWORD *)(v1 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_parent);
    v32[1] = v8;
    v32[2] = *(_OWORD *)(v1
                       + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_parent
                       + 32);
    uint64_t v33 = *(void *)(v1
                    + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_parent
                    + 48);
    sub_100027EC8((uint64_t)v32);
    sub_10001F1D8(a1);
    uint64_t result = sub_1000282EC((uint64_t)v32);
    char v9 = *(void **)(v1 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource);
    if (v9)
    {
      id v10 = v9;
      sub_100049AD0();

      unint64_t v29 = 0;
      uint64_t v11 = sub_100049A70();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t v12 = *(void *)(v11 + 16);
      if (v12)
      {
        uint64_t v13 = (long long *)(v11 + 64);
        long long v14 = _swiftEmptyArrayStorage;
        do
        {
          if (*(void *)v13 >> 62 == 2)
          {
            long long v27 = *v13;
            long long v26 = *(v13 - 2);
            long long v25 = *(v13 - 1);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            unint64_t v29 = v14;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_100025DE8(0, v14[2] + 1, 1);
              long long v14 = v29;
            }
            unint64_t v16 = v14[2];
            unint64_t v15 = v14[3];
            long long v17 = v27;
            if (v16 >= v15 >> 1)
            {
              sub_100025DE8((char *)(v15 > 1), v16 + 1, 1);
              long long v17 = v27;
              long long v14 = v29;
            }
            v14[2] = v16 + 1;
            unint64_t v18 = &v14[6 * v16];
            long long v19 = v25;
            _OWORD v18[2] = v26;
            _OWORD v18[3] = v19;
            v18[4] = v17;
          }
          v13 += 3;
          --v12;
        }
        while (v12);
      }
      else
      {
        long long v14 = _swiftEmptyArrayStorage;
      }
      swift_bridgeObjectRelease();
      unint64_t v21 = sub_10001F368(a1, (uint64_t)v14);
      char v23 = v22;
      uint64_t result = swift_release();
      if ((v23 & 1) == 0)
      {
        swift_beginAccess();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        unint64_t v24 = (void (*)(unsigned char *, void))sub_100049B50();
        sub_1000297EC(v21, (uint64_t)&v29);
        v24(v28, 0);
        swift_release();
        swift_release();
        return swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

_OWORD *sub_10001F1D8(long long *a1)
{
  uint64_t result = sub_100024DFC(a1, v14);
  char v3 = v15;
  if (v15 >> 62 == 2)
  {
    v15 &= 0x3FFFFFFFFFFFFFFFuLL;
    uint64_t v4 = v16;
    v20[0] = v14[0];
    v20[1] = v14[1];
    char v21 = v3 & 1;
    long long v17 = *(_OWORD *)(v1 + 40);
    long long v12 = *(_OWORD *)(v1 + 40);
    sub_100005458(&qword_10006D940);
    sub_10004A500();
    uint64_t v5 = v19;
    if (*(void *)(v19 + 16) && (unint64_t v6 = sub_1000264FC((uint64_t)v20), (v7 & 1) != 0))
    {
      long long v8 = *(void **)(*(void *)(v5 + 56) + 8 * v6);
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v8 = &_swiftEmptySetSingleton;
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = (uint64_t)v8;
    uint64_t v19 = v17;
    sub_100006730((uint64_t)&v17 + 8, (uint64_t)v18, &qword_10006D9A0);
    sub_10002679C((uint64_t *)&v12, v4);
    uint64_t v9 = v13;
    long long v12 = v17;
    sub_10002884C((uint64_t)&v19);
    sub_10000D1A4((uint64_t)v18);
    sub_10004A500();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v12 = v11;
    sub_100026F20(v9, (uint64_t)v20, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    long long v12 = v17;
    sub_10004A510();
    sub_100028878((uint64_t)&v19);
    return (_OWORD *)sub_10000D1D0((uint64_t)v18);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001F368(long long *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a2 + 72);
    while (1)
    {
      unint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      switch(v7 >> 62)
      {
        case 1uLL:
          long long v15 = *(_OWORD *)(v5 - 5);
          sub_100024DFC(a1, &v20);
          if (v21 >> 62 != 1) {
            goto LABEL_4;
          }
          v21 &= 0x3FFFFFFFFFFFFFFFuLL;
          if ((void)v15 != (void)v20) {
            goto LABEL_4;
          }
          return v4;
        case 2uLL:
          float64x2_t v13 = *(float64x2_t *)(v5 - 3);
          float64x2_t v16 = *(float64x2_t *)(v5 - 5);
          sub_100024DFC(a1, v22);
          int v8 = v23;
          if (v23 >> 62 == 2)
          {
            v23 &= 0x3FFFFFFFFFFFFFFFuLL;
            BOOL v9 = (v7 & 1) == 0;
            if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v22[0], v16), (int32x4_t)vceqq_f64(v22[1], v13))), 0xFuLL))) & 1) != 0&& v6 == v24)
            {
              goto LABEL_3;
            }
          }
          goto LABEL_4;
        case 3uLL:
          if (v7 != 0xC000000000000000
            || vorrq_s8((int8x16_t)vdupq_lane_s64(*(v5 - 24), 0), *(int8x16_t *)(v5 - 40)).i64[1] | *(v5 - 5) | *(v5 - 2) | v6)
          {
            sub_100024DFC(a1, &v28);
            if (v31 >> 62 == 3
              && !v32
              && v31 == 0xC000000000000000
              && (void)v28 == 1
              && !(v29 | v30 | *((void *)&v28 + 1)))
            {
              return v4;
            }
          }
          else
          {
            sub_100024DFC(a1, v25);
            if (v26 >> 62 == 3 && v26 == 0xC000000000000000)
            {
              int8x16_t v10 = vorrq_s8(v25[0], v25[1]);
              if (!(*(void *)&vorr_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)) | v27)) {
                return v4;
              }
            }
          }
LABEL_4:
          ++v4;
          v5 += 6;
          if (v2 == v4) {
            return 0;
          }
          break;
        default:
          float64x2_t v12 = *(float64x2_t *)(v5 - 3);
          float64x2_t v14 = *(float64x2_t *)(v5 - 5);
          sub_100024DFC(a1, v17);
          int v8 = v18;
          if (v18 >> 62) {
            goto LABEL_4;
          }
          BOOL v9 = (v7 & 1) == 0;
          if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v17[0], v14), (int32x4_t)vceqq_f64(v17[1], v12))), 0xFuLL))) & 1) == 0|| v6 != v19)
          {
            goto LABEL_4;
          }
LABEL_3:
          if (((v9 ^ v8) & 1) == 0) {
            goto LABEL_4;
          }
          return v4;
      }
    }
  }
  return 0;
}

void sub_10001F600(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005458(&qword_10006D898);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100049980();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  float64x2_t v13 = (char *)&v29 - v12;
  if ([a1 state] == (id)1)
  {
    uint64_t v14 = OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_collectionView;
    [a1 locationInView:*(void *)(v2+ OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_collectionView)];
    long long v15 = *(void **)(v2 + v14);
    if (v15)
    {
      id v16 = objc_msgSend(v15, "indexPathForItemAtPoint:");
      if (v16)
      {
        long long v17 = v16;
        sub_100049960();

        unint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v18(v6, v11, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
        {
          v18(v13, v6, v7);
          uint64_t v19 = *(void **)(v2 + v14);
          if (v19)
          {
            id v20 = v19;
            Class isa = sub_100049950().super.isa;
            id v22 = [v20 cellForItemAtIndexPath:isa];

            if (v22)
            {
              type metadata accessor for FavoriteColorWellCell();
              uint64_t v23 = swift_dynamicCastClass();
              if (v23)
              {
                uint64_t v24 = *(void **)(v2
                               + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource);
                if (v24)
                {
                  long long v25 = (void *)v23;
                  id v26 = v24;
                  sub_100049AB0();

                  if (v30 >> 1 == 0xFFFFFFFF || v30 >> 62 != 2)
                  {
                    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);

                    return;
                  }
                  sub_100010D7C(0, &qword_10006D998);
                  objc_msgSend(v25, "center", 0, 0, 0, 0, 0);
                  uint64_t v27 = (void *)sub_10004A8D0();
                  id v28 = sub_1000348D0();
                  [v28 presentEditMenuWithConfiguration:v27];

                  goto LABEL_16;
                }
LABEL_20:
                __break(1u);
                return;
              }
            }
LABEL_16:
            (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
            return;
          }
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
      }
      sub_100006588((uint64_t)v6, &qword_10006D898);
      return;
    }
    __break(1u);
    goto LABEL_19;
  }
}

id sub_10001FA40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoriteColorPickerView.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FavoriteColorPickerView.Coordinator()
{
  return self;
}

uint64_t sub_10001FB54()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005458(&qword_10006D868);
  uint64_t v53 = *(void *)(v2 - 8);
  uint64_t v54 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (void *)sub_1000203A4();
  id v6 = objc_msgSend(objc_allocWithZone((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v5, 0.0, 0.0, 0.0, 0.0);

  sub_100005458(&qword_10006D870);
  sub_10004A150();
  uint64_t v7 = (void *)v55;
  [v6 setDelegate:(void)v55];

  uint64_t v8 = self;
  id v9 = v6;
  id v10 = [v8 clearColor];
  [v9 setBackgroundColor:v10];

  [v9 setAllowsMultipleSelection:1];
  [v9 setAllowsSelection:1];
  [v9 setAlwaysBounceVertical:0];
  [v9 setPrefetchingEnabled:0];
  type metadata accessor for AddColorCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v12 = sub_10004A700();
  [v9 registerClass:ObjCClassFromMetadata forCellWithReuseIdentifier:v12];

  type metadata accessor for FavoriteColorWellCell();
  uint64_t v13 = swift_getObjCClassFromMetadata();
  NSString v14 = sub_10004A700();
  [v9 registerClass:v13 forCellWithReuseIdentifier:v14];

  sub_100010D7C(0, (unint64_t *)&unk_10006D950);
  uint64_t v15 = swift_getObjCClassFromMetadata();
  NSString v16 = sub_10004A700();
  [v9 registerClass:v15 forCellWithReuseIdentifier:v16];

  type metadata accessor for RemoveColorCell();
  uint64_t v17 = swift_getObjCClassFromMetadata();
  NSString v18 = sub_10004A700();
  [v9 registerClass:v17 forCellWithReuseIdentifier:v18];

  sub_100010D7C(0, (unint64_t *)&qword_10006E910);
  uint64_t v19 = swift_getObjCClassFromMetadata();
  id v20 = self;
  id v21 = v9;
  id v22 = [v20 bundleForClass:v19];
  NSString v23 = sub_10004A700();
  NSString v24 = sub_10004A700();
  id v25 = [v22 localizedStringForKey:v23 value:0 table:v24];

  sub_10004A740();
  NSString v26 = sub_10004A700();
  swift_bridgeObjectRelease();
  [v21 setAccessibilityLabel:v26];

  sub_10004A150();
  id v27 = objc_allocWithZone((Class)UILongPressGestureRecognizer);
  id v28 = (void *)v55;
  id v29 = [v27 initWithTarget:(void)v55 action:"showDeleteCallout:"];

  [v21 addGestureRecognizer:v29];
  swift_allocObject();
  id v30 = v21;
  sub_10004A150();
  unint64_t v31 = (void *)v55;
  swift_unknownObjectWeakInit();

  id v32 = objc_allocWithZone((Class)sub_100005458(&qword_10006D960));
  uint64_t v33 = sub_100049AA0();
  if (*v1)
  {
    long long v34 = (void *)v33;
    uint64_t v35 = swift_retain();
    sub_100020FCC(v35, (uint64_t)v4);
    swift_release();
    sub_100049AC0();
    sub_10004A150();
    uint64_t v52 = v4;
    unint64_t v36 = v58;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    char v37 = v57;
    long long v38 = v56;
    unint64_t v39 = &v36[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_selectedColor];
    *(_OWORD *)unint64_t v39 = v55;
    *((_OWORD *)v39 + 1) = v38;
    v39[32] = v37;

    sub_10004A150();
    unsigned __int8 v40 = (char *)v55;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    *(void *)&v40[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedFavoriteColors] = v58;

    swift_bridgeObjectRelease();
    sub_10004A150();
    char v41 = (void *)v55;
    *(void *)(v55
              + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage) = v1[4];

    sub_10004A150();
    id v42 = (char *)v55;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    *(void *)&v42[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedSuggestedColors] = v58;

    swift_bridgeObjectRelease();
    sub_10004A150();
    uint64_t v43 = (void *)v55;
    uint64_t v44 = *(void **)(v55
                   + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource);
    *(void *)(v55 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource) = v34;
    id v45 = v34;

    sub_10004A150();
    uint64_t v46 = (void *)v55;
    uint64_t v47 = *(void **)(v55
                   + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_collectionView);
    *(void *)(v55 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_collectionView) = v30;
    id v48 = v30;

    sub_10004A150();
    uint64_t v49 = (unsigned char *)v55;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();

    swift_release();
    swift_release();
    swift_release();
    LOBYTE(v46) = (_BYTE)v58;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
    v49[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_useLandscapeLayout] = (_BYTE)v46;

    return (uint64_t)v48;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_1000285D8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000203A4()
{
  if (*v0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v1 = self;
    id v2 = [v1 currentDevice];
    id v3 = [v2 userInterfaceIdiom];

    double v4 = 30.0;
    if (LOBYTE(aBlock[0])) {
      double v4 = 28.0;
    }
    if (v3 == (id)6) {
      double v5 = 42.0;
    }
    else {
      double v5 = v4;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    id v6 = [v1 currentDevice];
    id v7 = [v6 userInterfaceIdiom];

    double v8 = 18.0;
    if (LOBYTE(aBlock[0])) {
      double v9 = 16.0;
    }
    else {
      double v9 = 18.0;
    }
    if (v7 == (id)6) {
      double v10 = 20.0;
    }
    else {
      double v10 = v9;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (LOBYTE(aBlock[0])) {
      double v8 = 16.0;
    }
    uint64_t v11 = self;
    id v12 = [v11 absoluteDimension:v5];
    id v13 = [v11 absoluteDimension:v5];
    NSString v14 = self;
    id v15 = [v14 sizeWithWidthDimension:v12 heightDimension:v13];

    id v16 = [self itemWithLayoutSize:v15];
    uint64_t v17 = self;
    id v18 = [v11 fractionalWidthDimension:1.0];
    id v19 = [v11 absoluteDimension:v5];
    id v20 = [v14 sizeWithWidthDimension:v18 heightDimension:v19];

    sub_100005458(&qword_10006D8C0);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_10004F8B0;
    *(void *)(v21 + 32) = v16;
    sub_10004A7F0();
    sub_100010D7C(0, &qword_10006D8C8);
    id v47 = v16;
    Class isa = sub_10004A7D0().super.isa;
    swift_bridgeObjectRelease();
    id v23 = [v17 horizontalGroupWithLayoutSize:v20 subitems:isa];

    NSString v24 = self;
    id v25 = [v24 fixedSpacing:v10];
    [v23 setInterItemSpacing:v25];

    id v26 = [v11 fractionalWidthDimension:1.0];
    id v27 = [v11 fractionalHeightDimension:1.0];
    id v28 = [v14 sizeWithWidthDimension:v26 heightDimension:v27];

    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_10004F8B0;
    *(void *)(v29 + 32) = v23;
    sub_10004A7F0();
    id v46 = v23;
    Class v30 = sub_10004A7D0().super.isa;
    swift_bridgeObjectRelease();
    id v31 = [v17 verticalGroupWithLayoutSize:v28 subitems:v30];

    id v32 = [v24 fixedSpacing:v8];
    [v31 setInterItemSpacing:v32];

    id v33 = [v11 fractionalWidthDimension:1.0];
    id v34 = [v11 fractionalHeightDimension:1.0];
    id v35 = [v14 sizeWithWidthDimension:v33 heightDimension:v34];

    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_10004F8B0;
    *(void *)(v36 + 32) = v31;
    aBlock[0] = v36;
    sub_10004A7F0();
    id v37 = v31;
    Class v38 = sub_10004A7D0().super.isa;
    swift_bridgeObjectRelease();
    id v39 = [v17 horizontalGroupWithLayoutSize:v35 subitems:v38];

    id v40 = [self sectionWithGroup:v39];
    [v40 setInterGroupSpacing:v10];
    [v40 setOrthogonalScrollingBehavior:4];
    uint64_t v41 = swift_allocObject();
    long long v42 = *(_OWORD *)(v48 + 16);
    *(_OWORD *)(v41 + 16) = *(_OWORD *)v48;
    *(_OWORD *)(v41 + 32) = v42;
    *(_OWORD *)(v41 + 48) = *(_OWORD *)(v48 + 32);
    *(void *)(v41 + 64) = *(void *)(v48 + 48);
    aBlock[4] = sub_100028628;
    aBlock[5] = v41;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100023ABC;
    aBlock[3] = &unk_100063770;
    uint64_t v43 = _Block_copy(aBlock);
    sub_100027EC8(v48);
    swift_release();
    [v40 setVisibleItemsInvalidationHandler:v43];
    _Block_release(v43);
    id v44 = [objc_allocWithZone((Class)UICollectionViewCompositionalLayout) initWithSection:v40];

    return (uint64_t)v44;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_1000285D8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

char *sub_100020B60(void *a1, uint64_t a2, long long *a3)
{
  sub_100024DFC(a3, v32);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0;
  }
  double v5 = (void *)Strong;
  sub_100024DFC(v32, &v37);
  char v6 = v40;
  switch(v40 >> 62)
  {
    case 1uLL:
      v40 &= 0x3FFFFFFFFFFFFFFFuLL;
      NSString v25 = sub_10004A700();
      Class isa = sub_100049950().super.isa;
      id v27 = [a1 dequeueReusableCellWithReuseIdentifier:v25 forIndexPath:isa];

      id v28 = self;
      double v10 = (char *)v27;
      id v14 = [v28 clearColor];
      [v10 setBackgroundColor:v14];

      goto LABEL_8;
    case 2uLL:
      v40 &= 0x3FFFFFFFFFFFFFFFuLL;
      uint64_t v33 = v37;
      long long v34 = v38;
      uint64_t v35 = v39;
      char v36 = v6 & 1;
      NSString v15 = sub_10004A700();
      Class v16 = sub_100049950().super.isa;
      id v17 = [a1 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v16];

      type metadata accessor for FavoriteColorWellCell();
      double v10 = (char *)swift_dynamicCastClassUnconditional();
      sub_100018AB4();
      uint64_t v18 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color;
      id v19 = *(void **)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color];
      *(void *)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color] = v20;
      id v21 = v20;

      [*(id *)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_colorView] setBackgroundColor:*(void *)&v10[v18]];
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = v5;
      sub_100024DFC(v32, (_OWORD *)(v22 + 24));
      id v23 = (uint64_t (**)())&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_onDelete];
      uint64_t v24 = *(void *)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_onDelete];
      *id v23 = sub_1000287BC;
      v23[1] = (uint64_t (*)())v22;
      sub_100013CC0(v24);
      break;
    case 3uLL:
      NSString v29 = sub_10004A700();
      Class v30 = sub_100049950().super.isa;
      double v10 = (char *)[a1 dequeueReusableCellWithReuseIdentifier:v29 forIndexPath:v30];

      break;
    default:
      v40 &= 0x3FFFFFFFFFFFFFFFuLL;
      uint64_t v33 = v37;
      long long v34 = v38;
      uint64_t v35 = v39;
      char v36 = v6 & 1;
      NSString v7 = sub_10004A700();
      Class v8 = sub_100049950().super.isa;
      id v9 = [a1 dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v8];

      type metadata accessor for FavoriteColorWellCell();
      double v10 = (char *)swift_dynamicCastClassUnconditional();
      sub_100018AB4();
      uint64_t v11 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color;
      id v12 = *(void **)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color];
      *(void *)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color] = v13;
      id v14 = v13;

      [*(id *)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_colorView] setBackgroundColor:*(void *)&v10[v11]];
LABEL_8:

      break;
  }
  return v10;
}

uint64_t sub_100020FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = v2;
  uint64_t v6 = sub_100005458(&qword_10006D868);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = sub_100027F1C((uint64_t)_swiftEmptyArrayStorage);
  sub_1000286F0();
  sub_100049A90();
  v11._rawValue = &off_100062460;
  sub_100049A60(v11);
  uint64_t v12 = *v3;
  if (!*v3) {
    goto LABEL_54;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  if (v68[0])
  {
    *(void *)&v68[0] = 0;
    BYTE8(v68[0]) = 1;
    sub_100049A50();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v58 = v7;
  long long v59 = v9;
  uint64_t v57 = v12;
  if (!*(void *)&v68[0]) {
    goto LABEL_16;
  }
  if (!*(void *)(*(void *)&v68[0] + 16))
  {
    swift_bridgeObjectRelease();
LABEL_16:
    uint64_t v54 = 0;
    goto LABEL_18;
  }
  *(void *)&long long v63 = a1;
  id v13 = sub_100023B70(*(uint64_t *)&v68[0]);
  uint64_t v54 = 0;
  swift_bridgeObjectRelease();
  *(void *)&v68[0] = 0;
  BYTE8(v68[0]) = 1;
  sub_100049A50();
  uint64_t v14 = v13[2];
  swift_bridgeObjectRelease();
  uint64_t v15 = v3[4];
  if (!v15)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v16 = v15 - v14 % v15;
  if (__OFSUB__(v15, v14 % v15))
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v16 < 0)
  {
LABEL_53:
    __break(1u);
LABEL_54:
    type metadata accessor for ColorPickerState();
    sub_1000285D8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
    return result;
  }
  uint64_t v17 = v6;
  if (v16)
  {
    uint64_t v18 = sub_100025C90(0, 1, 1, (char *)_swiftEmptyArrayStorage);
    uint64_t v19 = 0;
    uint64_t v20 = *((void *)v18 + 2);
    uint64_t v21 = 48 * v20;
    long long v22 = xmmword_10004F8C0;
    do
    {
      unint64_t v23 = *((void *)v18 + 3);
      if (v20 + v19 >= v23 >> 1)
      {
        long long v62 = v22;
        NSString v25 = sub_100025C90((char *)(v23 > 1), v20 + v19 + 1, 1, v18);
        long long v22 = v62;
        uint64_t v18 = v25;
      }
      *((void *)v18 + 2) = v20 + v19 + 1;
      uint64_t v24 = &v18[v21];
      *((void *)v24 + 4) = v19;
      *((void *)v24 + 5) = 0;
      *((void *)v24 + 6) = 0;
      *((void *)v24 + 7) = 0;
      *((_OWORD *)v24 + 4) = v22;
      v21 += 48;
      ++v19;
    }
    while (v16 != v19);
  }
  *(void *)&v68[0] = 0;
  BYTE8(v68[0]) = 1;
  uint64_t v6 = v17;
  sub_100049A50();
  swift_bridgeObjectRelease();
LABEL_18:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  uint64_t v26 = *(void *)&v68[0];
  uint64_t v61 = *(void *)(*(void *)&v68[0] + 16);
  if (v61)
  {
    uint64_t v55 = v6;
    uint64_t v56 = a2;
    unint64_t v27 = 0;
    long long v67 = *(_OWORD *)(v3 + 5);
    id v28 = (char *)_swiftEmptyArrayStorage;
    uint64_t v60 = *(void *)&v68[0] + 32;
    while (v27 < *(void *)(v26 + 16))
    {
      uint64_t v29 = v60 + 40 * v27;
      v68[0] = *(_OWORD *)v29;
      v68[1] = *(_OWORD *)(v29 + 16);
      uint64_t v30 = *(unsigned __int8 *)(v29 + 32);
      char v69 = *(unsigned char *)(v29 + 32);
      long long v31 = *(_OWORD *)v29;
      long long v62 = *(_OWORD *)(v29 + 16);
      long long v63 = v31;
      if (*(void *)(v10 + 16) && (unint64_t v32 = sub_1000264FC((uint64_t)v68), (v33 & 1) != 0))
      {
        uint64_t v34 = *(void *)(*(void *)(v10 + 56) + 8 * v32);
        uint64_t v35 = v34 + 1;
        if (__OFADD__(v34, 1)) {
          goto LABEL_50;
        }
      }
      else
      {
        uint64_t v35 = 0;
        if (__OFADD__(-1, 1)) {
          goto LABEL_50;
        }
      }
      ++v27;
      while (1)
      {
        long long v64 = v67;
        sub_100005458(&qword_10006D940);
        sub_10004A500();
        uint64_t v37 = v66;
        if (!*(void *)(v66 + 16)) {
          break;
        }
        unint64_t v38 = sub_1000264FC((uint64_t)v68);
        if ((v39 & 1) == 0) {
          break;
        }
        uint64_t v40 = *(void *)(*(void *)(v37 + 56) + 8 * v38);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (!*(void *)(v40 + 16)) {
          break;
        }
        uint64_t v41 = sub_10004ABE0();
        uint64_t v42 = -1 << *(unsigned char *)(v40 + 32);
        unint64_t v43 = v41 & ~v42;
        if (((*(void *)(v40 + 56 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43) & 1) == 0) {
          break;
        }
        uint64_t v44 = *(void *)(v40 + 48);
        if (*(void *)(v44 + 8 * v43) != v35)
        {
          uint64_t v45 = ~v42;
          do
          {
            unint64_t v43 = (v43 + 1) & v45;
            if (((*(void *)(v40 + 56 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43) & 1) == 0) {
              goto LABEL_38;
            }
          }
          while (*(void *)(v44 + 8 * v43) != v35);
        }
        swift_bridgeObjectRelease();
        if (__OFADD__(v35++, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
      }
LABEL_38:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v28 = sub_100025C90(0, *((void *)v28 + 2) + 1, 1, v28);
      }
      unint64_t v47 = *((void *)v28 + 2);
      unint64_t v46 = *((void *)v28 + 3);
      if (v47 >= v46 >> 1) {
        id v28 = sub_100025C90((char *)(v46 > 1), v47 + 1, 1, v28);
      }
      *((void *)v28 + 2) = v47 + 1;
      uint64_t v48 = &v28[48 * v47];
      long long v49 = v62;
      *((_OWORD *)v48 + 2) = v63;
      *((_OWORD *)v48 + 3) = v49;
      *((void *)v48 + 8) = v30 | 0x8000000000000000;
      *((void *)v48 + 9) = v35;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v64 = v10;
      sub_10002706C(v35, (uint64_t)v68, isUniquelyReferenced_nonNull_native);
      unint64_t v10 = v64;
      swift_bridgeObjectRelease();
      if (v27 == v61)
      {
        swift_bridgeObjectRelease();
        a2 = v56;
        uint64_t v6 = v55;
        goto LABEL_45;
      }
    }
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  swift_bridgeObjectRelease();
LABEL_45:
  *(void *)&long long v64 = 0;
  BYTE8(v64) = 1;
  uint64_t v51 = v59;
  sub_100049A50();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v52 = v58;
  if (v65 != 2)
  {
    *(void *)&long long v64 = 0;
    BYTE8(v64) = 1;
    sub_100049A50();
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v52 + 32))(a2, v51, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100021750(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10004A6A0();
  uint64_t v95 = *(void *)(v5 - 8);
  uint64_t v96 = v5;
  __chkstk_darwin(v5);
  uint64_t v93 = &v80[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v94 = sub_10004A6C0();
  uint64_t v7 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v91 = &v80[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v85 = sub_100049980();
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v83 = &v80[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100005458(&qword_10006D868);
  uint64_t v86 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unsigned __int8 v88 = &v80[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_100005458(&qword_10006D870);
  uint64_t v103 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v90 = &v80[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v101 = &v80[-v16];
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v98 = &v80[-v18];
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v97 = &v80[-v20];
  uint64_t v89 = v21;
  __chkstk_darwin(v19);
  unint64_t v23 = &v80[-v22];
  sub_10004A150();
  float64x2_t v102 = *(float64x2_t *)(v108
                        + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_selectedColor
                        + 16);
  float64x2_t v99 = *(float64x2_t *)(v108
                       + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_selectedColor);
  int v24 = *(unsigned __int8 *)(v108
                           + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_selectedColor
                           + 32);

  unsigned __int8 v100 = v2;
  if (!*v2) {
    goto LABEL_38;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  BOOL v25 = v106 == 2 && v24 == 2;
  if (v24 != 2 && v106 != 2) {
    BOOL v25 = (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v99, aBlock), (int32x4_t)vceqq_f64(v102, v105))), 0xFuLL))) & 1) != 0&& ((v106 ^ v24) & 1) == 0;
  }
  uint64_t v87 = v10;
  *(void *)&v99.f64[0] = a1;
  uint64_t v92 = v7;
  uint64_t v26 = v103;
  *(void *)&float64_t v27 = v103 + 16;
  id v28 = *(void (**)(void))(v103 + 16);
  ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v23, a2, v12);
  v102.f64[0] = v27;
  if (!v25)
  {
    uint64_t v30 = *(void (**)(unsigned char *, uint64_t))(v26 + 8);
    v30(v23, v12);
    uint64_t v34 = v97;
    ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v97, a2, v12);
    char v33 = v98;
    goto LABEL_14;
  }
  sub_10004A150();
  int v81 = *(unsigned __int8 *)(*(void *)&aBlock.f64[0]
                           + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_allowsNoColor);

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  int v29 = v108;
  uint64_t v30 = *(void (**)(unsigned char *, uint64_t))(v26 + 8);
  v30(v23, v12);
  uint64_t v31 = a2;
  unint64_t v32 = v97;
  uint64_t v82 = v31;
  v28(v97);
  if (v81 != v29)
  {
    char v33 = v98;
    uint64_t v34 = v32;
    a2 = v82;
LABEL_14:
    v30(v34, v12);
    ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v33, a2, v12);
LABEL_15:
    uint64_t v35 = (uint64_t)v88;
    char v36 = v101;
    v30(v33, v12);
    ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v36, a2, v12);
    uint64_t v37 = (uint64_t)v100;
LABEL_16:
    v30(v36, v12);
    float64_t v38 = v99.f64[0];
    goto LABEL_17;
  }
  sub_10004A150();
  float64_t v70 = aBlock.f64[0];
  uint64_t v71 = *(void *)(*(void *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedFavoriteColors);
  swift_bridgeObjectRetain();

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  int v81 = sub_100025878(v71, v108);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v30(v32, v12);
  char v33 = v98;
  a2 = v82;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v98, v82, v12);
  if ((v81 & 1) == 0) {
    goto LABEL_15;
  }
  sub_10004A150();
  v30(v33, v12);
  uint64_t v72 = *(void *)(*(void *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage);

  uint64_t v37 = (uint64_t)v100;
  uint64_t v73 = v100[4];
  ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v101, a2, v12);
  if (v72 != v73)
  {
    uint64_t v35 = (uint64_t)v88;
    char v36 = v101;
    goto LABEL_16;
  }
  uint64_t v98 = v28;
  unsigned __int8 v74 = v101;
  sub_10004A150();
  float64_t v75 = aBlock.f64[0];
  uint64_t v76 = *(void *)(*(void *)&aBlock.f64[0]
                  + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedSuggestedColors);
  swift_bridgeObjectRetain();

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v77 = v108;
  if (!v76)
  {
    v30(v74, v12);
    float64_t v38 = v99.f64[0];
    if (!v77)
    {
      id v28 = (void (*)(void))v98;
      goto LABEL_19;
    }
    goto LABEL_35;
  }
  uint64_t v78 = v76;
  float64_t v38 = v99.f64[0];
  if (!(void)v108)
  {
    v30(v101, v12);
LABEL_35:
    swift_bridgeObjectRelease();
    id v28 = (void (*)(void))v98;
    uint64_t v35 = (uint64_t)v88;
    goto LABEL_17;
  }
  char v79 = sub_100025878(v78, v108);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30(v101, v12);
  swift_bridgeObjectRelease_n();
  id v28 = (void (*)(void))v98;
  uint64_t v35 = (uint64_t)v88;
  if (v79) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v39 = swift_retain();
  sub_100020FCC(v39, v35);
  swift_release();
  sub_10004A150();
  float64_t v40 = aBlock.f64[0];
  uint64_t v41 = *(void **)(*(void *)&aBlock.f64[0]
                 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource);
  id v42 = v41;

  if (v41)
  {
    sub_10004A150();

    sub_100049AC0();
    sub_10004A150();
    unint64_t v43 = (char *)v108;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    char v44 = (char)v106;
    float64x2_t v45 = v105;
    unint64_t v46 = (float64x2_t *)&v43[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_selectedColor];
    *unint64_t v46 = aBlock;
    v46[1] = v45;
    LOBYTE(v46[2].f64[0]) = v44;

    sub_10004A150();
    float64_t v47 = aBlock.f64[0];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    *(unsigned char *)(*(void *)&v47
             + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_allowsNoColor) = v108;

    sub_10004A150();
    float64_t v48 = aBlock.f64[0];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    *(void *)(*(void *)&v48
              + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedFavoriteColors) = v108;

    swift_bridgeObjectRelease();
    sub_10004A150();
    float64_t v49 = aBlock.f64[0];
    *(void *)(*(void *)&aBlock.f64[0]
              + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage) = *(void *)(v37 + 32);

    sub_10004A150();
    float64_t v50 = aBlock.f64[0];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    *(void *)(*(void *)&v50
              + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedSuggestedColors) = v108;

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v35, v87);
LABEL_19:
    sub_10004A150();
    int v51 = *(unsigned __int8 *)(*(void *)&aBlock.f64[0]
                             + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_useLandscapeLayout);

    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v51 != v108)
    {
      uint64_t v52 = (void *)sub_1000203A4();
      [*(id *)&v38 setCollectionViewLayout:v52];

      sub_10004A150();
      float64_t v53 = aBlock.f64[0];
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049B60();
      swift_release();
      swift_release();
      swift_release();
      *(unsigned char *)(*(void *)&v53
               + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_useLandscapeLayout) = v108;
    }
    sub_1000227C4(*(void **)&v38, a2);
    sub_10004A150();
    float64_t v54 = aBlock.f64[0];
    *(unsigned char *)(*(void *)&aBlock.f64[0]
             + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_isEditing) = 0;

    long long v108 = *(_OWORD *)(v37 + 16);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    sub_100028374((uint64_t)&v108);
    if (LOBYTE(aBlock.f64[1])) {
      goto LABEL_24;
    }
    if ((unsigned __int128)(*(uint64_t *)&aBlock.f64[0] * (__int128)*(uint64_t *)(v37 + 32)) >> 64 == (uint64_t)(*(void *)&aBlock.f64[0] * *(void *)(v37 + 32)) >> 63)
    {
      uint64_t v55 = v83;
      sub_100049970();
      Class isa = sub_100049950().super.isa;
      (*(void (**)(unsigned char *, uint64_t))(v84 + 8))(v55, v85);
      [*(id *)&v38 scrollToItemAtIndexPath:isa atScrollPosition:16 animated:0];

LABEL_24:
      sub_100010D7C(0, &qword_10006D878);
      uint64_t v57 = (void *)sub_10004A8B0();
      uint64_t v58 = v90;
      ((void (*)(unsigned char *, uint64_t, uint64_t))v28)(v90, a2, v12);
      uint64_t v59 = v103;
      unint64_t v60 = (*(unsigned __int8 *)(v103 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
      unint64_t v61 = (v89 + v60 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v62 = swift_allocObject();
      (*(void (**)(unint64_t, unsigned char *, uint64_t))(v59 + 32))(v62 + v60, v58, v12);
      unint64_t v63 = v62 + v61;
      long long v64 = *(_OWORD *)(v37 + 16);
      *(_OWORD *)unint64_t v63 = *(_OWORD *)v37;
      *(_OWORD *)(v63 + 16) = v64;
      *(_OWORD *)(v63 + 32) = *(_OWORD *)(v37 + 32);
      *(void *)(v63 + 48) = *(void *)(v37 + 48);
      unsigned __int8 v106 = sub_100028464;
      uint64_t v107 = v62;
      *(void *)&aBlock.f64[0] = _NSConcreteStackBlock;
      *(void *)&aBlock.f64[1] = 1107296256;
      *(void *)&v105.f64[0] = sub_100023328;
      *(void *)&v105.f64[1] = &unk_100063720;
      char v65 = _Block_copy(&aBlock);
      sub_100027EC8(v37);
      swift_release();
      uint64_t v66 = v91;
      sub_10004A6B0();
      *(void *)&aBlock.f64[0] = _swiftEmptyArrayStorage;
      sub_1000285D8(&qword_10006D880, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100005458(&qword_10006D888);
      sub_10002850C();
      long long v67 = v93;
      uint64_t v68 = v96;
      sub_10004A9C0();
      sub_10004A8C0();
      _Block_release(v65);

      (*(void (**)(unsigned char *, uint64_t))(v95 + 8))(v67, v68);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v92 + 8))(v66, v94);
    }
    __break(1u);
  }
  __break(1u);
LABEL_38:
  type metadata accessor for ColorPickerState();
  sub_1000285D8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_1000227C4(void *a1, uint64_t a2)
{
  id v81 = a1;
  uint64_t v4 = sub_100049980();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v79 = (char *)v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005458(&qword_10006D898);
  uint64_t v73 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  char v80 = (char *)v71 - v11;
  uint64_t v12 = sub_100005458(&qword_10006D868);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    char v16 = v87;
    uint64_t v82 = v10;
    if (v87 == 2)
    {
      uint64_t v17 = (char *)&off_100062528;
      id v18 = v81;
      goto LABEL_23;
    }
    uint64_t v19 = v13;
    double v20 = *(double *)&v83;
    double v21 = v84;
    double v22 = v85;
    double v23 = v86;
    sub_100005458(&qword_10006D870);
    sub_10004A150();
    int v24 = v83;
    BOOL v25 = *(void **)&v83[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource];
    id v26 = v25;

    if (v25)
    {
      sub_100049AD0();

      uint64_t v27 = sub_100049A80();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v12);
      uint64_t v78 = v27;
      uint64_t v28 = *(void *)(v27 + 16);
      if (v28)
      {
        int v29 = (double *)(v78 + 64);
        float64_t v75 = (char *)_swiftEmptyArrayStorage;
        id v18 = v81;
        uint64_t v74 = v5;
        do
        {
          if (((*(void *)v29 >> 62) | 2) == 2 && ((v16 & 1) == 0) != (*(void *)v29 & 1))
          {
            double v32 = *(v29 - 4);
            if (vabdd_f64(v20, v32) < 0.001)
            {
              double v33 = *(v29 - 3);
              if (vabdd_f64(v21, v33) < 0.001)
              {
                uint64_t v34 = a2;
                double v35 = *(v29 - 2);
                if (vabdd_f64(v22, v35) < 0.001)
                {
                  double v36 = *(v29 - 1);
                  if (vabdd_f64(v23, v36) < 0.001)
                  {
                    long long v77 = *(_OWORD *)v29;
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                      float64_t v75 = sub_100025C90(0, *((void *)v75 + 2) + 1, 1, v75);
                    }
                    unint64_t v38 = *((void *)v75 + 2);
                    unint64_t v37 = *((void *)v75 + 3);
                    unint64_t v39 = v38 + 1;
                    long long v40 = v77;
                    if (v38 >= v37 >> 1)
                    {
                      unint64_t v76 = v38 + 1;
                      uint64_t v41 = sub_100025C90((char *)(v37 > 1), v38 + 1, 1, v75);
                      unint64_t v39 = v76;
                      long long v40 = v77;
                      float64_t v75 = v41;
                    }
                    uint64_t v30 = v75;
                    *((void *)v75 + 2) = v39;
                    uint64_t v31 = &v30[48 * v38];
                    *((double *)v31 + 4) = v32;
                    *((double *)v31 + 5) = v33;
                    *((double *)v31 + 6) = v35;
                    *((double *)v31 + 7) = v36;
                    *((_OWORD *)v31 + 4) = v40;
                    id v18 = v81;
                  }
                  uint64_t v5 = v74;
                }
                a2 = v34;
              }
            }
          }
          v29 += 6;
          --v28;
        }
        while (v28);
      }
      else
      {
        float64_t v75 = (char *)_swiftEmptyArrayStorage;
        id v18 = v81;
      }
      swift_bridgeObjectRelease();
      uint64_t v17 = v75;
LABEL_23:
      id v42 = [v18 indexPathsForSelectedItems];
      if (v42)
      {
        unint64_t v43 = v42;
        char v44 = (void *)sub_10004A7E0();
      }
      else
      {
        char v44 = _swiftEmptyArrayStorage;
      }
      __chkstk_darwin(v42);
      v71[-2] = a2;
      swift_bridgeObjectRetain();
      float64x2_t v45 = sub_10001E8EC((uint64_t)sub_1000285B8, (uint64_t)&v71[-4], (uint64_t)v17);
      swift_bridgeObjectRelease();
      unint64_t v46 = sub_10002341C((uint64_t)v44);
      char v47 = sub_100025464((uint64_t)v46, (uint64_t)v45);
      swift_bridgeObjectRelease();
      if ((v47 & 1) == 0)
      {
        uint64_t v72 = v45;
        float64_t v75 = v17;
        uint64_t v48 = v44[2];
        uint64_t v74 = v5;
        v71[2] = v44;
        if (v48)
        {
          uint64_t v50 = *(void *)(v5 + 16);
          uint64_t v49 = v5 + 16;
          *(void *)&long long v77 = v50;
          int v51 = (char *)v44
              + ((*(unsigned __int8 *)(v49 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 64));
          unint64_t v76 = *(void *)(v49 + 56);
          uint64_t v52 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 40);
          float64_t v53 = (unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 32);
          float64_t v54 = (void (**)(char *, char *, uint64_t))(v49 + 16);
          uint64_t v78 = v49;
          uint64_t v55 = (void (**)(char *, uint64_t))(v49 - 8);
          swift_bridgeObjectRetain();
          v71[1] = (v49 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
          uint64_t v56 = v80;
          while (1)
          {
            ((void (*)(char *, char *, uint64_t))v77)(v56, v51, v4);
            uint64_t v57 = *v52;
            (*v52)(v56, 0, 1, v4);
            if ((*v53)(v56, 1, v4) == 1) {
              break;
            }
            uint64_t v58 = v4;
            uint64_t v59 = v79;
            (*v54)(v79, v56, v58);
            Class isa = sub_100049950().super.isa;
            [v81 deselectItemAtIndexPath:isa animated:0];

            uint64_t v56 = v80;
            unint64_t v61 = v59;
            uint64_t v4 = v58;
            (*v55)(v61, v58);
            v51 += v76;
            if (!--v48) {
              goto LABEL_33;
            }
          }
        }
        else
        {
          uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
          swift_bridgeObjectRetain();
          uint64_t v56 = v80;
LABEL_33:
          v57(v56, 1, 1, v4);
        }
        swift_bridgeObjectRelease_n();
        uint64_t v62 = v72[2];
        if (!v62) {
          goto LABEL_41;
        }
        uint64_t v63 = (uint64_t)v72
            + ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80));
        uint64_t v64 = *(void *)(v73 + 72);
        char v65 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48);
        uint64_t v66 = (void (**)(uint64_t, uint64_t))(v74 + 8);
        swift_bridgeObjectRetain();
        id v68 = v81;
        uint64_t v67 = (uint64_t)v82;
        do
        {
          sub_100006524(v63, v67, &qword_10006D898);
          if ((*v65)(v67, 1, v4) == 1)
          {
            v69.super.Class isa = 0;
          }
          else
          {
            v69.super.Class isa = sub_100049950().super.isa;
            (*v66)(v67, v4);
          }
          [v68 selectItemAtIndexPath:v69.super.isa animated:0 scrollPosition:0];

          v63 += v64;
          --v62;
        }
        while (v62);
      }
      swift_bridgeObjectRelease();
LABEL_41:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  type metadata accessor for ColorPickerState();
  sub_1000285D8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

void sub_100023048(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100005458(&qword_10006D868);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005458(&qword_10006D870);
  sub_10004A150();
  uint64_t v7 = (void *)v16;
  uint64_t v8 = *(void **)(v16 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource);
  id v9 = v8;

  if (!v8) {
    goto LABEL_13;
  }
  sub_100049AD0();

  uint64_t v10 = sub_100049A80();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v11 = *(void *)(v10 + 16);
  swift_bridgeObjectRelease();
  double v12 = ceil((double)v11 / (double)*(uint64_t *)(a2 + 32));
  if ((~*(void *)&v12 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v12 >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v13 = (uint64_t)v12;
  long long v16 = *(_OWORD *)(a2 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  sub_100028374((uint64_t)&v16);
  if (v14 != v13)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v14 = v13;
    swift_retain();
    sub_100049B70();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  sub_100028374((uint64_t)&v16);
  if ((v15 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v14 = 0;
    char v15 = 1;
    swift_retain();
    sub_100049B70();
  }
}

uint64_t sub_100023328(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10002336C()
{
  sub_100005458(&qword_10006D870);
  sub_10004A150();
  id v0 = *(void **)&v2[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource];
  id v1 = v0;

  if (v0)
  {
    sub_100049AE0();
  }
  else
  {
    __break(1u);
  }
}

void *sub_10002341C(uint64_t a1)
{
  uint64_t v2 = sub_100049980();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100005458(&qword_10006D898);
  uint64_t v6 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = _swiftEmptyArrayStorage;
  if (v9)
  {
    double v20 = _swiftEmptyArrayStorage;
    sub_100025E08(0, v9, 0);
    double v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v17 = *(void *)(v11 + 56);
    id v18 = v12;
    do
    {
      v18(v5, v13, v2);
      swift_dynamicCast();
      uint64_t v10 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100025E08(0, v10[2] + 1, 1);
        uint64_t v10 = v20;
      }
      unint64_t v15 = v10[2];
      unint64_t v14 = v10[3];
      if (v15 >= v14 >> 1)
      {
        sub_100025E08(v14 > 1, v15 + 1, 1);
        uint64_t v10 = v20;
      }
      v10[2] = v15 + 1;
      sub_100006730((uint64_t)v8, (uint64_t)v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v15, &qword_10006D898);
      v13 += v17;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_100023678(double a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = sub_10004A6A0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004A6C0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(objc_msgSend(a3, "container"), "contentSize");
  double v16 = v15;
  uint64_t result = swift_unknownObjectRelease();
  double v18 = a1 / v16;
  if ((~COERCE__INT64(a1 / v16) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v18 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v18 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v24 = v11;
  uint64_t v25 = v8;
  uint64_t v19 = (uint64_t)v18;
  long long v27 = *(_OWORD *)(a4 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  uint64_t result = sub_100028374((uint64_t)&v27);
  if (aBlock[0] != v19)
  {
    sub_100010D7C(0, &qword_10006D878);
    double v20 = (void *)sub_10004A8B0();
    uint64_t v21 = swift_allocObject();
    long long v22 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)(v21 + 16) = *(_OWORD *)a4;
    *(_OWORD *)(v21 + 32) = v22;
    *(_OWORD *)(v21 + 48) = *(_OWORD *)(a4 + 32);
    *(void *)(v21 + 64) = *(void *)(a4 + 48);
    *(void *)(v21 + 72) = v19;
    aBlock[4] = sub_1000286E4;
    aBlock[5] = v21;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100023328;
    aBlock[3] = &unk_1000637C0;
    double v23 = _Block_copy(aBlock);
    sub_100027EC8(a4);
    swift_release();
    sub_10004A6B0();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_1000285D8(&qword_10006D880, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005458(&qword_10006D888);
    sub_10002850C();
    sub_10004A9C0();
    sub_10004A8C0();
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v24);
  }
  return result;
}

uint64_t sub_100023A48()
{
  return sub_100049B70();
}

uint64_t sub_100023ABC(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, double, double))(a1 + 32);
  sub_100005458(&qword_10006D930);
  uint64_t v9 = sub_10004A7E0();
  swift_retain();
  swift_unknownObjectRetain();
  v8(v9, a5, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void *sub_100023B70(uint64_t a1)
{
  sub_100025DE8(0, 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = _swiftEmptyArrayStorage[2];
    uint64_t v5 = 48 * v4 + 72;
    uint64_t v6 = (unsigned __int8 *)(a1 + 64);
    do
    {
      long long v7 = *((_OWORD *)v6 - 2);
      long long v8 = *((_OWORD *)v6 - 1);
      uint64_t v9 = *v6;
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      if (v4 + v3 >= v10 >> 1)
      {
        long long v13 = *((_OWORD *)v6 - 1);
        long long v14 = *((_OWORD *)v6 - 2);
        sub_100025DE8((char *)(v10 > 1), v4 + v3 + 1, 1);
        long long v8 = v13;
        long long v7 = v14;
      }
      _swiftEmptyArrayStorage[2] = v4 + v3 + 1;
      uint64_t v11 = (void *)((char *)_swiftEmptyArrayStorage + v5);
      *(v11 - 1) = v9;
      *uint64_t v11 = v3;
      *(_OWORD *)(v11 - 5) = v7;
      *(_OWORD *)(v11 - 3) = v8;
      v5 += 48;
      v6 += 40;
      ++v3;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100023C88()
{
  sub_100024DFC(v0, v3);
  uint64_t result = 0x692072656C6C6946;
  switch(v4 >> 62)
  {
    case 1uLL:
      return result;
    case 2uLL:
      v4 &= 0x3FFFFFFFFFFFFFFFuLL;
      goto LABEL_4;
    case 3uLL:
      int8x16_t v2 = vorrq_s8(v3[0], v3[1]);
      if (((v4 == 0xC000000000000000) & ((*(void *)&vorr_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)) | v5) == 0)) != 0)uint64_t result = 0x6F74747542646441; {
      else
      }
        uint64_t result = 0x754265766F6D6552;
      break;
    default:
      v4 &= 0x3FFFFFFFFFFFFFFFuLL;
      sub_10004A9F0(17);
      v6._countAndFlagsBits = 0x6574736567677553;
      v6._object = (void *)0xEF20726F6C6F4364;
      sub_10004A790(v6);
LABEL_4:
      sub_10004AA80();
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_100023E38()
{
  sub_100024DFC(v0, &v14);
  Swift::UInt64 v1 = v14;
  char v2 = v17;
  Swift::UInt v3 = v18;
  switch(v17 >> 62)
  {
    case 1uLL:
      v17 &= 0x3FFFFFFFFFFFFFFFuLL;
      Swift::UInt v7 = 1;
      Swift::UInt v3 = v14;
      goto LABEL_24;
    case 2uLL:
      v17 &= 0x3FFFFFFFFFFFFFFFuLL;
      Swift::UInt64 v4 = *((void *)&v14 + 1);
      Swift::UInt64 v5 = v15;
      Swift::UInt64 v6 = v16;
      Swift::UInt v7 = v2 & 1;
      Swift::UInt v8 = 2;
      goto LABEL_4;
    case 3uLL:
      if (v16 | v15 | *((void *)&v14 + 1) | (unint64_t)v14 | v18) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = v17 == 0xC000000000000000;
      }
      if (v13) {
        Swift::UInt v3 = 3;
      }
      else {
        Swift::UInt v3 = 4;
      }
      goto LABEL_25;
    default:
      v17 &= 0x3FFFFFFFFFFFFFFFuLL;
      Swift::UInt64 v4 = *((void *)&v14 + 1);
      Swift::UInt64 v5 = v15;
      Swift::UInt64 v6 = v16;
      Swift::UInt v7 = v2 & 1;
      Swift::UInt v8 = 0;
LABEL_4:
      sub_10004AC00(v8);
      if ((v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v9 = v1;
      }
      else {
        Swift::UInt64 v9 = 0;
      }
      sub_10004AC10(v9);
      if ((v4 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v10 = v4;
      }
      else {
        Swift::UInt64 v10 = 0;
      }
      sub_10004AC10(v10);
      if ((v5 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v11 = v5;
      }
      else {
        Swift::UInt64 v11 = 0;
      }
      sub_10004AC10(v11);
      if ((v6 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v12 = v6;
      }
      else {
        Swift::UInt64 v12 = 0;
      }
      sub_10004AC10(v12);
LABEL_24:
      sub_10004AC00(v7);
LABEL_25:
      sub_10004AC00(v3);
      return;
  }
}

Swift::Int sub_100023F80()
{
  sub_100024DFC(v0, v2);
  sub_10004ABF0();
  sub_100023E38();
  return sub_10004AC20();
}

void sub_100023FD0()
{
  sub_100024DFC(v0, v1);
  sub_100023E38();
}

Swift::Int sub_100024010()
{
  sub_100024DFC(v0, v2);
  sub_10004ABF0();
  sub_100023E38();
  return sub_10004AC20();
}

uint64_t sub_100024064()
{
  sub_100024DFC(v0, v2);
  return sub_100023C88();
}

BOOL sub_10002409C(long long *a1, long long *a2)
{
  sub_100024DFC(a1, v4);
  sub_100024DFC(a2, v5);
  return sub_100027CB4(v4, v5);
}

void sub_1000240E8()
{
  qword_100072498 = 0x4049000000000000;
}

uint64_t sub_1000240F8()
{
  return sub_100024120();
}

uint64_t sub_10002410C()
{
  return sub_100024120();
}

uint64_t sub_100024120()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10002418C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100024204()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView5Model__numberOfPages;
  uint64_t v2 = sub_100005458(&qword_10006D988);
  Swift::UInt v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView5Model__currentPage, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView5Model__pageControlPendingPage;
  uint64_t v5 = sub_100005458(&qword_10006D990);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v6, v7);
}

uint64_t sub_100024320()
{
  return type metadata accessor for FavoriteColorPickerView.Model();
}

uint64_t type metadata accessor for FavoriteColorPickerView.Model()
{
  uint64_t result = qword_10006D710;
  if (!qword_10006D710) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100024374()
{
  sub_100024440();
  if (v0 <= 0x3F)
  {
    sub_100024498();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100024440()
{
  if (!qword_10006D720)
  {
    unint64_t v0 = sub_100049B80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006D720);
    }
  }
}

void sub_100024498()
{
  if (!qword_10006D728)
  {
    sub_1000061E8((uint64_t *)&unk_10006D730);
    unint64_t v0 = sub_100049B80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006D728);
    }
  }
}

__n128 initializeWithCopy for FavoriteColorPickerView.ColorItem(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for FavoriteColorPickerView.ColorItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 32) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for FavoriteColorPickerView.ColorItem(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 40) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 48) = 1;
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
      double result = 0.0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 32) = 2 * -a2;
      *(void *)(a1 + 40) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1000245B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) >> 62;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_1000245CC(uint64_t result)
{
  *(void *)(result + 32) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_1000245DC(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[4] = result[4] & 1 | (a2 << 62);
  }
  else
  {
    *double result = (a2 - 3);
    result[1] = 0;
    result[2] = 0;
    result[3] = 0;
    *((_OWORD *)result + 2) = xmmword_10004F8D0;
  }
  return result;
}

ValueMetadata *type metadata accessor for FavoriteColorPickerView.ColorItem()
{
  return &type metadata for FavoriteColorPickerView.ColorItem;
}

uint64_t destroy for FavoriteColorPickerView()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for FavoriteColorPickerView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for FavoriteColorPickerView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for FavoriteColorPickerView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FavoriteColorPickerView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FavoriteColorPickerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FavoriteColorPickerView()
{
  return &type metadata for FavoriteColorPickerView;
}

uint64_t sub_100024890()
{
  uint64_t v1 = sub_100005458(&qword_10006D990);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005458(&qword_10006D988);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::UInt v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView5Model__numberOfPages;
  uint64_t v14 = 2;
  sub_100049B30();
  Swift::UInt64 v10 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v10(v9, v8, v5);
  uint64_t v11 = v0 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView5Model__currentPage;
  uint64_t v14 = 0;
  sub_100049B30();
  v10(v11, v8, v5);
  uint64_t v12 = v0 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView5Model__pageControlPendingPage;
  uint64_t v14 = 0;
  char v15 = 1;
  sub_100005458((uint64_t *)&unk_10006D730);
  sub_100049B30();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v12, v4, v1);
  return v0;
}

uint64_t sub_100024AA0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FavoriteColorPickerView.Model();
  uint64_t result = sub_100049B20();
  *a1 = result;
  return result;
}

uint64_t sub_100024AE0()
{
  return sub_10001FB54();
}

uint64_t sub_100024B24(uint64_t a1, uint64_t a2)
{
  return sub_100021750(a1, a2);
}

uint64_t sub_100024B68@<X0>(void *a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v7[0] = *(_OWORD *)v1;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 48);
  if (*(void *)&v7[0])
  {
    id v4 = objc_allocWithZone((Class)type metadata accessor for FavoriteColorPickerView.Coordinator());
    sub_100027EC8((uint64_t)v7);
    swift_retain();
    id v5 = sub_100028158((uint64_t)v7);
    swift_release();
    uint64_t result = sub_1000282EC((uint64_t)v7);
    *a1 = v5;
  }
  else
  {
    sub_100027EC8((uint64_t)v7);
    type metadata accessor for ColorPickerState();
    sub_1000285D8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100024C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000287F8();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100024CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000287F8();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100024D24()
{
}

unint64_t sub_100024D50()
{
  unint64_t result = qword_10006D850;
  if (!qword_10006D850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D850);
  }
  return result;
}

unint64_t sub_100024DA8()
{
  unint64_t result = qword_10006D858;
  if (!qword_10006D858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D858);
  }
  return result;
}

_OWORD *sub_100024DFC(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

double sub_100024E14@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_100024E9C()
{
  return sub_100049B70();
}

uint64_t sub_100024F30@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100024FB0()
{
  return sub_100049B70();
}

uint64_t sub_10002502C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000250AC()
{
  return sub_100049B70();
}

uint64_t sub_100025120@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000251A0()
{
  return sub_100049B70();
}

uint64_t sub_10002521C@<X0>(void *a1@<X8>)
{
  return sub_100025258(a1);
}

uint64_t sub_100025230()
{
  return sub_1000252E8();
}

uint64_t sub_100025244@<X0>(void *a1@<X8>)
{
  return sub_100025258(a1);
}

uint64_t sub_100025258@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000252D4()
{
  return sub_1000252E8();
}

uint64_t sub_1000252E8()
{
  return sub_100049B70();
}

uint64_t sub_100025358@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_1000253E0()
{
  return sub_100049B70();
}

uint64_t sub_100025464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100049980();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v32 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100005458(&qword_10006D8A8);
  __chkstk_darwin(v35);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005458(&qword_10006D898) - 8;
  uint64_t v10 = __chkstk_darwin(v9);
  double v36 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v15 || v37 == v38) {
    return 1;
  }
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v34 = *(void *)(v12 + 72);
  unint64_t v17 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  Swift::UInt v18 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v19 = (unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  uint64_t v30 = v17;
  uint64_t v31 = v18;
  uint64_t v20 = (uint64_t)v36;
  while (1)
  {
    uint64_t v21 = v37 + v16;
    sub_100006524(v38 + v16, (uint64_t)v14, &qword_10006D898);
    uint64_t v22 = (uint64_t)&v8[*(int *)(v35 + 48)];
    sub_100006524(v21, (uint64_t)v8, &qword_10006D898);
    sub_100006524((uint64_t)v14, v22, &qword_10006D898);
    double v23 = *v19;
    if ((*v19)(v8, 1, v4) != 1) {
      break;
    }
    if (v23((char *)v22, 1, v4) != 1) {
      goto LABEL_15;
    }
    sub_100006588((uint64_t)v8, &qword_10006D898);
    sub_100006588((uint64_t)v14, &qword_10006D898);
LABEL_7:
    v16 += v34;
    if (!--v15) {
      return 1;
    }
  }
  sub_100006524((uint64_t)v8, v20, &qword_10006D898);
  if (v23((char *)v22, 1, v4) != 1)
  {
    uint64_t v24 = v32;
    (*v30)(v32, v22, v4);
    sub_1000285D8(&qword_10006D8B0, (void (*)(uint64_t))&type metadata accessor for IndexPath);
    int v33 = sub_10004A6F0();
    uint64_t v25 = v19;
    id v26 = *v31;
    long long v27 = v24;
    uint64_t v20 = (uint64_t)v36;
    (*v31)(v27, v4);
    v26((char *)v20, v4);
    uint64_t v19 = v25;
    sub_100006588((uint64_t)v8, &qword_10006D898);
    sub_100006588((uint64_t)v14, &qword_10006D898);
    if ((v33 & 1) == 0) {
      return 0;
    }
    goto LABEL_7;
  }
  (*v31)((char *)v20, v4);
LABEL_15:
  sub_100006588((uint64_t)v8, &qword_10006D8A8);
  sub_100006588((uint64_t)v14, &qword_10006D898);
  return 0;
}

uint64_t sub_100025878(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  char v3 = 0;
  if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a2 + 32)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 48), *(float64x2_t *)(a2 + 48))))), 0xFuLL))) & 1) == 0&& ((*(unsigned __int8 *)(a1 + 64) ^ *(unsigned __int8 *)(a2 + 64)) & 1) == 0)
  {
    if (v2 == 1) {
      return 1;
    }
    uint64_t v5 = v2 - 2;
    uint64_t v6 = (float64x2_t *)(a2 + 104);
    uint64_t v7 = (float64x2_t *)(a1 + 104);
    do
    {
      uint64_t v8 = v5;
      char v9 = vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v7[-2], v6[-2]), (int32x4_t)vceqq_f64(v7[-1], v6[-1])))), 0xFuLL))) | LOBYTE(v7->f64[0]) ^ LOBYTE(v6->f64[0]);
      if (v9) {
        break;
      }
      --v5;
      uint64_t v6 = (float64x2_t *)((char *)v6 + 40);
      uint64_t v7 = (float64x2_t *)((char *)v7 + 40);
    }
    while (v8);
    char v3 = v9 ^ 1;
  }
  return v3 & 1;
}

char *sub_100025960(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458(&qword_10006D9D0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 31;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8]) {
      memmove(v13, v14, v8 << 6);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100025A64(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458((uint64_t *)&unk_10006D9C0);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100005458(&qword_10006CA40);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100025B88(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458((uint64_t *)&unk_10006D970);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 40 * v8;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100025C90(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458(&qword_10006D8A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 48 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100025DA8(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100025E48(a1, a2, a3, *v3);
  *char v3 = result;
  return result;
}

char *sub_100025DC8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100025F6C(a1, a2, a3, *v3);
  *char v3 = result;
  return result;
}

char *sub_100025DE8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100026074(a1, a2, a3, *v3);
  *char v3 = result;
  return result;
}

size_t sub_100025E08(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_10002618C(a1, a2, a3, (void *)*v3);
  *char v3 = result;
  return result;
}

char *sub_100025E28(char *a1, int64_t a2, char a3)
{
  size_t result = sub_100026368(a1, a2, a3, *v3);
  *char v3 = result;
  return result;
}

void *sub_100025E48(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458((uint64_t *)&unk_10006D9C0);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100005458(&qword_10006CA40);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_100025F6C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458((uint64_t *)&unk_10006D970);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 40 * v8;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_release();
  return v10;
}

char *sub_100026074(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458(&qword_10006D8A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 48 * v8);
  }
  swift_release();
  return v10;
}

size_t sub_10002618C(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005458(&qword_10006D8B8);
  uint64_t v10 = *(void *)(sub_100005458(&qword_10006D898) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100005458(&qword_10006D898) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_100026368(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458(&qword_10006D980);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

unint64_t sub_10002646C(uint64_t a1)
{
  sub_10004A740();
  sub_10004ABF0();
  sub_10004A760();
  Swift::Int v2 = sub_10004AC20();
  swift_bridgeObjectRelease();
  return sub_100026568(a1, v2);
}

unint64_t sub_1000264FC(uint64_t a1)
{
  sub_10004ABF0();
  sub_100019284();
  Swift::Int v2 = sub_10004AC20();

  return sub_1000266E0(a1, v2);
}

unint64_t sub_100026568(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_10004A740();
    uint64_t v8 = v7;
    if (v6 == sub_10004A740() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_10004AB60();
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
          uint64_t v13 = sub_10004A740();
          uint64_t v15 = v14;
          if (v13 == sub_10004A740() && v15 == v16) {
            break;
          }
          char v18 = sub_10004AB60();
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

unint64_t sub_1000266E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    do
    {
      uint64_t v7 = *(void *)(v2 + 48) + 40 * result;
      if (*(double *)v7 == *(double *)a1
        && *(double *)(v7 + 8) == *(double *)(a1 + 8)
        && *(double *)(v7 + 16) == *(double *)(a1 + 16)
        && *(double *)(v7 + 24) == *(double *)(a1 + 24)
        && *(unsigned __int8 *)(v7 + 32) == *(unsigned __int8 *)(a1 + 32))
      {
        break;
      }
      unint64_t result = (result + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

uint64_t sub_10002679C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_10004ABE0();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100027794(a2, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_100026898(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005458(&qword_10006D9A8);
  char v44 = a2;
  uint64_t result = sub_10004AAC0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    id v42 = (void *)(v5 + 64);
    uint64_t v43 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v41 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        int64_t v45 = v8;
        unint64_t v23 = v22 | (v8 << 6);
      }
      else
      {
        int64_t v24 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v42;
        if (v24 >= v41) {
          goto LABEL_45;
        }
        unint64_t v25 = v42[v24];
        int64_t v26 = v8 + 1;
        if (!v25)
        {
          int64_t v26 = v24 + 1;
          if (v24 + 1 >= v41) {
            goto LABEL_45;
          }
          unint64_t v25 = v42[v26];
          if (!v25)
          {
            int64_t v27 = v24 + 2;
            if (v27 >= v41)
            {
LABEL_45:
              if ((v44 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_52;
              }
              uint64_t v40 = 1 << *(unsigned char *)(v5 + 32);
              if (v40 >= 64) {
                bzero(v42, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *id v42 = -1 << v40;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v25 = v42[v27];
            if (!v25)
            {
              while (1)
              {
                int64_t v26 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  goto LABEL_54;
                }
                if (v26 >= v41) {
                  goto LABEL_45;
                }
                unint64_t v25 = v42[v26];
                ++v27;
                if (v25) {
                  goto LABEL_42;
                }
              }
            }
            int64_t v26 = v27;
          }
        }
LABEL_42:
        unint64_t v11 = (v25 - 1) & v25;
        int64_t v45 = v26;
        unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
      }
      uint64_t v32 = *(void *)(v5 + 56);
      uint64_t v33 = *(void *)(v5 + 48) + 40 * v23;
      Swift::UInt64 v34 = *(void *)v33;
      Swift::UInt64 v35 = *(void *)(v33 + 8);
      Swift::UInt64 v36 = *(void *)(v33 + 16);
      Swift::UInt64 v37 = *(void *)(v33 + 24);
      Swift::UInt v38 = *(unsigned __int8 *)(v33 + 32);
      uint64_t v39 = *(void *)(v32 + 8 * v23);
      if ((v44 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_10004ABF0();
      if ((v34 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v13 = v34;
      }
      else {
        Swift::UInt64 v13 = 0;
      }
      sub_10004AC10(v13);
      if ((v35 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v14 = v35;
      }
      else {
        Swift::UInt64 v14 = 0;
      }
      sub_10004AC10(v14);
      if ((v36 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v15 = v36;
      }
      else {
        Swift::UInt64 v15 = 0;
      }
      sub_10004AC10(v15);
      if ((v37 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v16 = v37;
      }
      else {
        Swift::UInt64 v16 = 0;
      }
      sub_10004AC10(v16);
      sub_10004AC00(v38);
      uint64_t result = sub_10004AC20();
      uint64_t v17 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v18 = result & ~v17;
      unint64_t v19 = v18 >> 6;
      if (((-1 << v18) & ~*(void *)(v12 + 8 * (v18 >> 6))) != 0)
      {
        unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v12 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v17) >> 6;
        do
        {
          if (++v19 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_53;
          }
          BOOL v30 = v19 == v29;
          if (v19 == v29) {
            unint64_t v19 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v12 + 8 * v19);
        }
        while (v31 == -1);
        unint64_t v20 = __clz(__rbit64(~v31)) + (v19 << 6);
      }
      *(void *)(v12 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      uint64_t v21 = *(void *)(v7 + 48) + 40 * v20;
      *(void *)uint64_t v21 = v34;
      *(void *)(v21 + 8) = v35;
      *(void *)(v21 + 16) = v36;
      *(void *)(v21 + 24) = v37;
      *(unsigned char *)(v21 + 32) = v38;
      *(void *)(*(void *)(v7 + 56) + 8 * v20) = v39;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v43;
      int64_t v8 = v45;
    }
  }
  uint64_t result = swift_release();
LABEL_52:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100026BE8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005458(&qword_10006D948);
  uint64_t result = sub_10004AAC0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v39 = a2;
    int64_t v8 = 0;
    int64_t v41 = (void *)(v5 + 64);
    uint64_t v42 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v40 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v41;
        if (v17 >= v40) {
          goto LABEL_43;
        }
        unint64_t v18 = v41[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v40) {
            goto LABEL_43;
          }
          unint64_t v18 = v41[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v40)
            {
LABEL_43:
              if ((v39 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_50;
              }
              uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
              if (v38 >= 64) {
                bzero(v41, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *int64_t v41 = -1 << v38;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v41[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_52;
                }
                if (v8 >= v40) {
                  goto LABEL_43;
                }
                unint64_t v18 = v41[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(v5 + 56);
      uint64_t v21 = *(void *)(v5 + 48) + 40 * v16;
      Swift::UInt v22 = *(unsigned __int8 *)(v21 + 32);
      Swift::UInt64 v23 = *(void *)(v21 + 16);
      Swift::UInt64 v24 = *(void *)(v21 + 24);
      Swift::UInt64 v26 = *(void *)v21;
      Swift::UInt64 v25 = *(void *)(v21 + 8);
      uint64_t v43 = *(void *)(v20 + 8 * v16);
      sub_10004ABF0();
      if ((v26 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v27 = v26;
      }
      else {
        Swift::UInt64 v27 = 0;
      }
      sub_10004AC10(v27);
      if ((v25 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v28 = v25;
      }
      else {
        Swift::UInt64 v28 = 0;
      }
      sub_10004AC10(v28);
      if ((v23 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v29 = v23;
      }
      else {
        Swift::UInt64 v29 = 0;
      }
      sub_10004AC10(v29);
      if ((v24 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v30 = v24;
      }
      else {
        Swift::UInt64 v30 = 0;
      }
      sub_10004AC10(v30);
      sub_10004AC00(v22);
      uint64_t result = sub_10004AC20();
      uint64_t v31 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v12 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v32) & ~*(void *)(v12 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_51;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v12 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v13 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v7 + 48) + 40 * v13;
      *(void *)uint64_t v14 = v26;
      *(void *)(v14 + 8) = v25;
      *(void *)(v14 + 16) = v23;
      *(void *)(v14 + 24) = v24;
      *(unsigned char *)(v14 + 32) = v22;
      uint64_t v5 = v42;
      *(void *)(*(void *)(v7 + 56) + 8 * v13) = v43;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_50:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100026F20(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1000264FC(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1000271AC();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = v16[6] + 40 * v10;
    long long v20 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)a2;
    *(_OWORD *)(v19 + 16) = v20;
    *(unsigned char *)(v19 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v21 = v16[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return result;
    }
    goto LABEL_14;
  }
  sub_100026898(result, a3 & 1);
  uint64_t result = sub_1000264FC(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_10004AB80();
  __break(1u);
  return result;
}

uint64_t sub_10002706C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1000264FC(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100027368();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v18 = v16[6] + 40 * v10;
    long long v19 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)a2;
    *(_OWORD *)(v18 + 16) = v19;
    *(unsigned char *)(v18 + 32) = *(unsigned char *)(a2 + 32);
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_100026BE8(result, a3 & 1);
  uint64_t result = sub_1000264FC(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_10004AB80();
  __break(1u);
  return result;
}

void *sub_1000271AC()
{
  uint64_t v1 = v0;
  sub_100005458(&qword_10006D9A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10004AAB0();
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 40 * v15;
    char v18 = *(unsigned char *)(v17 + 32);
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    long long v22 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v17;
    *(_OWORD *)(v21 + 16) = v22;
    *(unsigned char *)(v21 + 32) = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100027368()
{
  uint64_t v1 = v0;
  sub_100005458(&qword_10006D948);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10004AAB0();
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v26 = __clz(__rbit64(v24));
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = v26 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 40 * v15;
    char v18 = *(unsigned char *)(v17 + 32);
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    long long v22 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v17;
    *(_OWORD *)(v21 + 16) = v22;
    *(unsigned char *)(v21 + 32) = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100027510()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005458((uint64_t *)&unk_10006D9B0);
  uint64_t result = sub_10004A9E0();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    Swift::UInt64 v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
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
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  uint64_t *v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
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
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = sub_10004ABE0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100027794(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100027510();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_1000278B8();
      goto LABEL_14;
    }
    sub_100027A50();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_10004ABE0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_10004AB70();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_1000278B8()
{
  uint64_t v1 = v0;
  sub_100005458((uint64_t *)&unk_10006D9B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10004A9D0();
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100027A50()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005458((uint64_t *)&unk_10006D9B0);
  uint64_t result = sub_10004A9E0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
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
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
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
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
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
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = sub_10004ABE0();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
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
    if (v5 >= v10) {
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

BOOL sub_100027CB4(long long *a1, long long *a2)
{
  sub_100024DFC(a1, &v21);
  uint64_t v3 = v21;
  int v5 = v24;
  uint64_t v4 = v25;
  double v6 = *(double *)&v21;
  switch(v24 >> 62)
  {
    case 1uLL:
      v24 &= 0x3FFFFFFFFFFFFFFFuLL;
      sub_100024DFC(a2, &v17);
      if (v19 >> 62 != 1) {
        return 0;
      }
      return v3 == v17.i64[0];
    case 2uLL:
      v24 &= 0x3FFFFFFFFFFFFFFFuLL;
      double v7 = *((double *)&v21 + 1);
      double v8 = v22;
      double v9 = v23;
      sub_100024DFC(a2, &v17);
      int v10 = v19;
      if (v19 >> 62 != 2) {
        return 0;
      }
      goto LABEL_7;
    case 3uLL:
      if (v24 == 0xC000000000000000
        && (v25 | (unint64_t)v21 | *(void *)&v23 | *(void *)&v22 | *((void *)&v21 + 1)) == 0)
      {
        sub_100024DFC(a2, &v17);
        if (v19 >> 62 != 3) {
          return 0;
        }
        if (v19 != 0xC000000000000000) {
          return 0;
        }
        int8x16_t v16 = vorrq_s8(v17, v18);
        return !(*(void *)&vorr_s8(*(int8x8_t *)v16.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL)) | v20);
      }
      sub_100024DFC(a2, &v17);
      return v19 >> 62 == 3
          && !v20
          && v19 == 0xC000000000000000
          && v17.i64[0] == 1
          && !(v18.i64[0] | v18.i64[1] | v17.i64[1]);
    default:
      v24 &= 0x3FFFFFFFFFFFFFFFuLL;
      double v7 = *((double *)&v21 + 1);
      double v8 = v22;
      double v9 = v23;
      sub_100024DFC(a2, &v17);
      int v10 = v19;
      if (v19 >> 62) {
        return 0;
      }
LABEL_7:
      BOOL result = 0;
      if (*(double *)v17.i64 == v6
        && v7 == *(double *)&v17.i64[1]
        && v8 == *(double *)v18.i64
        && v9 == *(double *)&v18.i64[1]
        && ((v5 ^ v10) & 1) == 0)
      {
        return v4 == v20;
      }
      return result;
  }
}

uint64_t sub_100027EC8(uint64_t a1)
{
  return a1;
}

unint64_t sub_100027F1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100005458(&qword_10006D948);
    uint64_t v3 = (void *)sub_10004AAD0();
    for (uint64_t i = (void *)(a1 + 72); ; i += 6)
    {
      long long v5 = *(_OWORD *)(i - 3);
      long long v14 = *(_OWORD *)(i - 5);
      long long v15 = v5;
      char v16 = *((unsigned char *)i - 8);
      uint64_t v6 = *i;
      unint64_t result = sub_1000264FC((uint64_t)&v14);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = v3[6] + 40 * result;
      long long v10 = v15;
      *(_OWORD *)uint64_t v9 = v14;
      *(_OWORD *)(v9 + 16) = v10;
      *(unsigned char *)(v9 + 32) = v16;
      *(void *)(v3[7] + 8 * result) = v6;
      uint64_t v11 = v3[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12) {
        goto LABEL_10;
      }
      int8x16_t v3[2] = v13;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

unint64_t sub_100028020(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100005458(&qword_10006D9A8);
  uint64_t v3 = (void *)sub_10004AAD0();
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v18 = *(_OWORD *)(a1 + 32);
  long long v19 = v4;
  char v20 = *(unsigned char *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  unint64_t result = sub_1000264FC((uint64_t)&v18);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  char v8 = (long long *)(a1 + 80);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v19;
    *(_OWORD *)uint64_t v9 = v18;
    *(_OWORD *)(v9 + 16) = v10;
    *(unsigned char *)(v9 + 32) = v20;
    *(void *)(v3[7] + 8 * result) = v5;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    int8x16_t v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    long long v14 = v8 + 3;
    long long v15 = v8[1];
    long long v18 = *v8;
    long long v19 = v15;
    char v20 = *((unsigned char *)v8 + 32);
    uint64_t v16 = *((void *)v8 + 5);
    swift_bridgeObjectRetain();
    unint64_t result = sub_1000264FC((uint64_t)&v18);
    char v8 = v14;
    uint64_t v5 = v16;
    if (v17) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

id sub_100028158(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource] = 0;
  *(void *)&v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_collectionView] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_selectedColor];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v3[32] = 2;
  v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_allowsNoColor] = 0;
  *(void *)&v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedFavoriteColors] = _swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedSwatchesPerPage] = 0;
  *(void *)&v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_appliedSuggestedColors] = 0;
  v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_useLandscapeLayout] = 0;
  v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_isEditing] = 0;
  long long v4 = &v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_parent];
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)long long v4 = *(_OWORD *)a1;
  *((_OWORD *)v4 + 1) = v5;
  *((_OWORD *)v4 + 2) = *(_OWORD *)(a1 + 32);
  *((void *)v4 + 6) = *(void *)(a1 + 48);
  uint64_t v6 = (uint64_t *)&v1[OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator__colorPickerState];
  swift_beginAccess();
  char v7 = v1;
  sub_100027EC8(a1);
  type metadata accessor for ColorPickerState();
  sub_1000285D8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  swift_retain();
  uint64_t *v6 = sub_100049D90();
  v6[1] = v8;
  swift_endAccess();

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for FavoriteColorPickerView.Coordinator();
  return objc_msgSendSuper2(&v10, "init");
}

uint64_t sub_1000282EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100028374(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000283A0()
{
  uint64_t v1 = sub_100005458(&qword_10006D870);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 56;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

void sub_100028464()
{
  uint64_t v1 = *(void *)(sub_100005458(&qword_10006D870) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);

  sub_100023048(v0 + v2, v3);
}

uint64_t sub_1000284F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100028504()
{
  return swift_release();
}

unint64_t sub_10002850C()
{
  unint64_t result = qword_10006D890;
  if (!qword_10006D890)
  {
    sub_1000061E8(&qword_10006D888);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D890);
  }
  return result;
}

uint64_t sub_100028568@<X0>(void *a1@<X8>)
{
  return sub_100025258(a1);
}

uint64_t sub_100028590()
{
  return sub_1000252E8();
}

void sub_1000285B8()
{
}

uint64_t sub_1000285D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100028620()
{
  return sub_100028688(72);
}

uint64_t sub_100028628(uint64_t a1, void *a2, double a3)
{
  return sub_100023678(a3, a1, a2, v3 + 16);
}

uint64_t sub_100028630@<X0>(void *a1@<X8>)
{
  return sub_100025258(a1);
}

uint64_t sub_100028658()
{
  return sub_1000252E8();
}

uint64_t sub_100028680()
{
  return sub_100028688(80);
}

uint64_t sub_100028688(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_1000286E4()
{
  return sub_100023A48();
}

unint64_t sub_1000286F0()
{
  unint64_t result = qword_10006D938;
  if (!qword_10006D938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D938);
  }
  return result;
}

uint64_t sub_100028744()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

char *sub_10002877C(void *a1, uint64_t a2, long long *a3)
{
  return sub_100020B60(a1, a2, a3);
}

uint64_t sub_100028784()
{
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000287BC()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_isEditing) = 1;
  return sub_10001EE94((long long *)(v0 + 24));
}

unint64_t sub_1000287F8()
{
  unint64_t result = qword_10006D968;
  if (!qword_10006D968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D968);
  }
  return result;
}

uint64_t sub_10002884C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100028878(uint64_t a1)
{
  return a1;
}

void sub_1000288A4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource);
  if (!v1)
  {
    __break(1u);
    goto LABEL_17;
  }
  id v2 = v1;
  sub_100049AB0();

  if (v27 >> 1 == 0xFFFFFFFF)
  {
LABEL_17:
    __break(1u);
    JUMPOUT(0x100028D5CLL);
  }
  switch(v27 >> 62)
  {
    case 1uLL:
      return;
    case 3uLL:
      if (v27 != 0xC000000000000000
        || (unint64_t)v26 | *((void *)&v25 + 1) | (unint64_t)v25 | *((void *)&v26 + 1) | v28)
      {
        uint64_t v13 = v0
            + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator__colorPickerState;
        swift_beginAccess();
        uint64_t v14 = *(void *)(v13 + 8);
        long long v15 = (void *)swift_allocObject();
        v15[2] = 0;
        v15[3] = 0;
        v15[4] = v14;
        uint64_t v16 = (void *)swift_allocObject();
        v16[2] = 0;
        v16[3] = 0;
        v16[4] = v14;
        swift_retain_n();
        sub_10004A590();
        sub_100005458(&qword_10006C208);
        sub_10004A550();
        swift_release();
        swift_release();
        id v17 = [self blackColor];
        sub_100019828(v17, v24, (uint64_t)&v25);
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_100049B70();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        goto LABEL_14;
      }
      *(unsigned char *)(v0 + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_isEditing) = 1;
      swift_beginAccess();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049B60();
      swift_release();
      swift_release();
      swift_release();
      if (v27 != 2)
      {
        long long v22 = v26;
        long long v23 = v25;
        char v3 = v27 & 1;
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        uint64_t v4 = (void (*)(long long *, void))sub_100049B50();
        unint64_t v6 = v5;
        char v7 = *v5;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t *v6 = v7;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          char v7 = sub_100025B88(0, *((void *)v7 + 2) + 1, 1, v7);
          uint64_t *v6 = v7;
        }
        unint64_t v9 = *((void *)v7 + 2);
        unint64_t v10 = *((void *)v7 + 3);
        unint64_t v11 = v9 + 1;
        if (v9 >= v10 >> 1)
        {
          unint64_t v21 = v9 + 1;
          long long v18 = v7;
          unint64_t v19 = *((void *)v7 + 2);
          char v20 = sub_100025B88((char *)(v10 > 1), v9 + 1, 1, v18);
          unint64_t v9 = v19;
          unint64_t v11 = v21;
          char v7 = v20;
          uint64_t *v6 = v20;
        }
        *((void *)v7 + 2) = v11;
        BOOL v12 = &v7[40 * v9];
        *((_OWORD *)v12 + 2) = v23;
        *((_OWORD *)v12 + 3) = v22;
        v12[64] = v3;
        v4(&v25, 0);
        swift_release();
        swift_release();
        swift_release();
      }
      break;
    default:
      swift_beginAccess();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v27) = v27 & 1;
      swift_retain();
LABEL_14:
      sub_100049B70();
      break;
  }
}

_OWORD *sub_100028D7C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_100028D9C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_plusImageView;
  id v10 = objc_allocWithZone((Class)UIImageView);
  unint64_t v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  uint64_t v12 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_maskShapeView;
  type metadata accessor for ShapeView();
  *(void *)&v11[v12] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for AddColorCell();
  id v13 = objc_msgSendSuper2(&v15, "initWithFrame:", a1, a2, a3, a4);
  sub_100028FA4();

  return v13;
}

id sub_100028EAC(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_plusImageView;
  id v4 = objc_allocWithZone((Class)UIImageView);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_maskShapeView;
  type metadata accessor for ShapeView();
  *(void *)&v5[v6] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for AddColorCell();
  id v7 = objc_msgSendSuper2(&v11, "initWithCoder:", a1);
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    sub_100028FA4();
  }
  return v8;
}

void sub_100028FA4()
{
  uint64_t v1 = self;
  id v2 = [v1 currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  id v4 = [v0 contentView];
  id v5 = objc_allocWithZone((Class)UIColor);
  if (v3 == (id)6) {
    double v6 = 0.58;
  }
  else {
    double v6 = 0.85;
  }
  id v7 = [v5 initWithRed:v6 green:v6 blue:v6 alpha:1.0];
  [v4 setBackgroundColor:v7];

  id v8 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_plusImageView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [v0 contentView];
  [v9 addSubview:v8];

  id v10 = [v0 contentView];
  objc_super v11 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_maskShapeView];
  [v10 setMaskView:v11];

  id v12 = [self configurationWithPointSize:7 weight:2 scale:17.0];
  id v33 = [objc_allocWithZone((Class)UIColor) initWithRed:0.29 green:0.29 blue:0.29 alpha:1.0];
  id v13 = [v1 currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  if (v14 == (id)6)
  {
    id v15 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];

    id v33 = v15;
  }
  id v16 = v12;
  NSString v17 = sub_10004A700();
  id v18 = [self systemImageNamed:v17 withConfiguration:v16];

  if (v18)
  {
    id v19 = [v18 imageWithTintColor:v33 renderingMode:1];

    [v8 setImage:v19];
    id v20 = [self blackColor];
    id v21 = [v11 layer];
    self;
    long long v22 = (void *)swift_dynamicCastObjCClassUnconditional();
    if (v20) {
      id v23 = [v20 CGColor];
    }
    else {
      id v23 = 0;
    }
    objc_msgSend(v22, "setFillColor:", v23, v33);

    char v24 = self;
    sub_100005458(&qword_10006D8C0);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_10004F660;
    id v26 = [v0 centerXAnchor];
    id v27 = [v8 centerXAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];

    *(void *)(v25 + 32) = v28;
    id v29 = [v0 centerYAnchor];
    id v30 = [v8 centerYAnchor];
    id v31 = [v29 constraintEqualToAnchor:v30];

    *(void *)(v25 + 40) = v31;
    sub_10004A7F0();
    sub_100010D7C(0, &qword_10006DA88);
    Class isa = sub_10004A7D0().super.isa;
    swift_bridgeObjectRelease();
    [v24 activateConstraints:isa];
  }
  else
  {
    __break(1u);
  }
}

void sub_100029488()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for AddColorCell();
  objc_msgSendSuper2(&v7, "layoutSubviews");
  [v0 bounds];
  double Width = CGRectGetWidth(v8);
  [v0 bounds];
  double Height = CGRectGetHeight(v9);
  if (Height < Width) {
    double Width = Height;
  }
  id v3 = *(char **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_maskShapeView];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, Width, Width);
  id v4 = objc_msgSend(self, "bezierPathWithOvalInRect:", 0.0, 0.0, Width, Width);
  id v5 = *(void **)&v3[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath];
  *(void *)&v3[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath] = v4;
  id v6 = v4;

  sub_100010574();
}

id sub_100029648()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddColorCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AddColorCell()
{
  return self;
}

uint64_t sub_1000296EC()
{
  sub_100010D7C(0, (unint64_t *)&qword_10006E910);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = sub_10004A700();
  NSString v3 = sub_10004A700();
  id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

  uint64_t v5 = sub_10004A740();
  return v5;
}

uint64_t sub_1000297EC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10002AF20(v5);
    uint64_t v5 = result;
  }
  unint64_t v7 = *(void *)(v5 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    CGRect v9 = (_OWORD *)(v5 + 40 * a1);
    long long v10 = v9[2];
    v9 += 2;
    char v11 = *((unsigned char *)v9 + 32);
    long long v12 = v9[1];
    uint64_t result = (uint64_t)memmove(v9, (char *)v9 + 40, 40 * (v7 - 1 - a1));
    *(void *)(v5 + 16) = v8;
    *NSString v2 = v5;
    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 32) = v11;
  }
  return result;
}

id sub_1000298A0()
{
  id v1 = &v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker14FavoritesStore__favoriteColorsUserDefaultsKey];
  strcpy(&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker14FavoritesStore__favoriteColorsUserDefaultsKey], "FavoriteColors");
  v1[15] = -18;
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for FavoritesStore();
  id v2 = objc_msgSendSuper2(&v15, "init");
  NSString v3 = self;
  id v4 = v2;
  id v5 = [v3 standardUserDefaults];
  swift_bridgeObjectRetain();
  NSString v6 = sub_10004A700();
  swift_bridgeObjectRelease();
  id v7 = [v5 dataForKey:v6];

  if (v7)
  {
    uint64_t v8 = sub_100049910();
    unint64_t v10 = v9;

    sub_10002AEB4(v8, v10);
  }
  else
  {
    id v12 = [v3 standardUserDefaults];
    NSString v13 = sub_10004A700();
    id v11 = [v12 arrayForKey:v13];

    if (v11)
    {

      goto LABEL_6;
    }
    sub_10002AAE4();
  }
  id v11 = v4;
LABEL_6:

  return v4;
}

void *sub_100029A64(char a1)
{
  CGColorSpaceRef v2 = sub_10002A2FC();
  CGColorSpaceRef v3 = v2;
  if ((a1 & 1) == 0)
  {
    uint64_t v4 = *((void *)v2 + 2);
    if (v4)
    {
      id v5 = (char *)v2 + 64;
      do
      {
        if (*((double *)v5 - 1) == 1.0)
        {
          long long v12 = *((_OWORD *)v5 - 2);
          uint64_t v9 = *((void *)v5 - 2);
          char v10 = *v5;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_100025DC8(0, _swiftEmptyArrayStorage[2] + 1, 1);
          }
          unint64_t v7 = _swiftEmptyArrayStorage[2];
          unint64_t v6 = _swiftEmptyArrayStorage[3];
          if (v7 >= v6 >> 1) {
            sub_100025DC8((char *)(v6 > 1), v7 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v7 + 1;
          uint64_t v8 = &_swiftEmptyArrayStorage[5 * v7];
          *((_OWORD *)v8 + 2) = v12;
          v8[6] = v9;
          v8[7] = 0x3FF0000000000000;
          *((unsigned char *)v8 + 64) = v10;
        }
        v5 += 40;
        --v4;
      }
      while (v4);
    }
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_100029BA0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005458(&qword_10006DAF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    sub_100049880();
    swift_allocObject();
    sub_100049870();
    char v80 = (char *)a1;
    sub_100005458(&qword_10006CA40);
    sub_10002AF8C(&qword_10006DAC0, (void (*)(void))sub_10002AE60);
    uint64_t v10 = sub_100049860();
    unint64_t v12 = v11;
    swift_release();
    id v13 = [self standardUserDefaults];
    Class isa = sub_100049900().super.isa;
    NSString v15 = sub_10004A700();
    [v13 setValue:isa forKey:v15];

    return sub_10002AEB4(v10, v12);
  }
  uint64_t v67 = v7;
  NSString v17 = (char *)sub_10002A2FC();
  uint64_t v68 = v3;
  char v79 = sub_100029A64(0);
  char v80 = (char *)a1;
  uint64_t v18 = sub_100005458(&qword_10006CA40);
  sub_10002B0C0();
  sub_10001979C();
  v66[1] = v18;
  sub_10004A6E0();
  swift_bridgeObjectRelease();
  NSIndexPath v69 = v9;
  uint64_t v19 = sub_10004AAF0();
  uint64_t v20 = *(void *)(v19 + 16);
  if (!v20)
  {
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  v66[0] = v6;
  unint64_t v21 = 0;
  uint64_t v22 = v19 + 32;
  float64_t v70 = (float64x2_t *)(a1 + 64);
  uint64_t v71 = v19 + 32;
  uint64_t v23 = a1;
  uint64_t v73 = v19;
  uint64_t v74 = a1;
  uint64_t v72 = v20;
  while (1)
  {
    if (v21 >= *(void *)(v19 + 16))
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    uint64_t v24 = v22 + (v21 << 6);
    if (*(unsigned char *)(v24 + 57) != 1) {
      goto LABEL_7;
    }
    unint64_t v25 = *(void *)v24;
    if ((*(void *)v24 & 0x8000000000000000) != 0) {
      goto LABEL_49;
    }
    float64x2_t v26 = *(float64x2_t *)(v24 + 24);
    float64x2_t v75 = *(float64x2_t *)(v24 + 8);
    float64x2_t v76 = v26;
    uint64_t v27 = *(void *)(v24 + 40);
    if (v25 && ((v28 = *(void *)(v23 + 16), v28 >= v25) || (unint64_t v25 = *(void *)(v23 + 16), v28)))
    {
      swift_bridgeObjectRetain();
      id v29 = v70;
      id v30 = (char *)_swiftEmptyArrayStorage;
      float64x2_t v32 = v75;
      float64x2_t v31 = v76;
      do
      {
        float64x2_t v38 = v29[-2];
        if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v38, v32), (int32x4_t)vceqq_f64(v29[-1], v31))), 0xFuLL))))
        {
          int v39 = LOBYTE(v29->f64[0]);
          if (((v27 & 1) == 0) != v39)
          {
            float64x2_t v77 = v29[-1];
            float64x2_t v78 = v38;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            char v80 = v30;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_100025DC8(0, *((void *)v30 + 2) + 1, 1);
              id v30 = v80;
            }
            float64x2_t v34 = v77;
            float64x2_t v33 = v78;
            unint64_t v36 = *((void *)v30 + 2);
            unint64_t v35 = *((void *)v30 + 3);
            float64x2_t v32 = v75;
            float64x2_t v31 = v76;
            if (v36 >= v35 >> 1)
            {
              sub_100025DC8((char *)(v35 > 1), v36 + 1, 1);
              float64x2_t v34 = v77;
              float64x2_t v33 = v78;
              float64x2_t v32 = v75;
              float64x2_t v31 = v76;
              id v30 = v80;
            }
            *((void *)v30 + 2) = v36 + 1;
            uint64_t v37 = (float64x2_t *)&v30[40 * v36];
            v37[2] = v33;
            v37[3] = v34;
            LOBYTE(v37[4].f64[0]) = v39;
          }
        }
        id v29 = (float64x2_t *)((char *)v29 + 40);
        --v25;
      }
      while (v25);
      uint64_t v23 = v74;
      swift_bridgeObjectRelease();
    }
    else
    {
      id v30 = (char *)_swiftEmptyArrayStorage;
    }
    uint64_t v41 = *((void *)v30 + 2);
    swift_release();
    uint64_t v42 = *((void *)v17 + 2);
    if (v42) {
      break;
    }
LABEL_6:
    uint64_t v20 = v72;
    uint64_t v19 = v73;
    uint64_t v22 = v71;
LABEL_7:
    if (++v21 == v20)
    {
      swift_bridgeObjectRelease();
      uint64_t v6 = v66[0];
LABEL_38:
      uint64_t v48 = v6;
      uint64_t v49 = sub_10004AAE0();
      uint64_t v50 = *(void *)(v49 + 16);
      if (v50)
      {
        uint64_t v51 = v49 + 48;
        do
        {
          if ((*(unsigned char *)(v51 + 41) & 1) == 0)
          {
            uint64_t v53 = *(void *)(v51 + 24);
            uint64_t v55 = *(void *)(v51 + 8);
            uint64_t v54 = *(void *)(v51 + 16);
            uint64_t v57 = *(void *)(v51 - 8);
            uint64_t v56 = *(void *)v51;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              NSString v17 = sub_100025B88(0, *((void *)v17 + 2) + 1, 1, v17);
            }
            unint64_t v59 = *((void *)v17 + 2);
            unint64_t v58 = *((void *)v17 + 3);
            if (v59 >= v58 >> 1) {
              NSString v17 = sub_100025B88((char *)(v58 > 1), v59 + 1, 1, v17);
            }
            *((void *)v17 + 2) = v59 + 1;
            uint64_t v52 = &v17[40 * v59];
            *((void *)v52 + 4) = v57;
            *((void *)v52 + 5) = v56;
            *((void *)v52 + 6) = v55;
            *((void *)v52 + 7) = v54;
            v52[64] = v53 & 1;
          }
          v51 += 64;
          --v50;
        }
        while (v50);
      }
      swift_bridgeObjectRelease();
      sub_100049880();
      swift_allocObject();
      sub_100049870();
      char v80 = v17;
      sub_10002AF8C(&qword_10006DAC0, (void (*)(void))sub_10002AE60);
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_100049860();
      unint64_t v62 = v61;
      swift_bridgeObjectRelease_n();
      swift_release();
      id v63 = [self standardUserDefaults];
      Class v64 = sub_100049900().super.isa;
      NSString v65 = sub_10004A700();
      [v63 setValue:v64 forKey:v65];
      sub_10002AEB4(v60, v62);

      return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v69, v48);
    }
  }
  unint64_t v43 = 0;
  uint64_t v44 = 72;
  while (1)
  {
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&v17[v44 - 40], v75), (int32x4_t)vceqq_f64(*(float64x2_t *)&v17[v44 - 24], v76))), 0xFuLL))) & 1) == 0|| ((((v27 & 1) == 0) ^ v17[v44 - 8]) & 1) == 0)
    {
      goto LABEL_27;
    }
    if (!v41) {
      break;
    }
    --v41;
LABEL_27:
    ++v43;
    v44 += 40;
    if (v42 == v43) {
      goto LABEL_5;
    }
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    NSString v17 = sub_10002AF20((uint64_t)v17);
  }
  unint64_t v45 = *((void *)v17 + 2);
  unint64_t v46 = v45 - v43;
  if (v45 > v43)
  {
    unint64_t v47 = v45 - 1;
    memmove(&v17[v44 - 40], &v17[v44], 40 * v46 - 40);
    *((void *)v17 + 2) = v47;
LABEL_5:
    uint64_t v23 = v74;
    goto LABEL_6;
  }
LABEL_50:
  __break(1u);
  swift_unexpectedError();
  __break(1u);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

CGColorSpaceRef sub_10002A2FC()
{
  uint64_t v0 = self;
  id v1 = [v0 standardUserDefaults];
  NSString v2 = sub_10004A700();
  id v3 = [v1 dataForKey:v2];

  if (v3)
  {
    uint64_t v4 = sub_100049910();
    unint64_t v6 = v5;

    sub_100049850();
    swift_allocObject();
    sub_100049840();
    sub_100005458(&qword_10006CA40);
    sub_10002AF8C(&qword_10006DAE0, (void (*)(void))sub_10002AFFC);
    sub_100049830();
    swift_release();
    sub_10002AEB4(v4, v6);
    return (CGColorSpaceRef)v48[0];
  }
  id v7 = [v0 standardUserDefaults];
  NSString v8 = sub_10004A700();
  id v9 = [v7 arrayForKey:v8];

  if (!v9) {
    return (CGColorSpaceRef)_swiftEmptyArrayStorage;
  }
  uint64_t v10 = sub_10004A7E0();

  unint64_t v11 = sub_10002A994(v10);
  swift_bridgeObjectRelease();
  NSString v17 = _swiftEmptyArrayStorage;
  if (!v11) {
    return (CGColorSpaceRef)v17;
  }
  v48[0] = _swiftEmptyArrayStorage;
  uint64_t v12 = v11[2];
  if (v12)
  {
    sub_100010D7C(0, &qword_10006DAD0);
    sub_100010D7C(0, &qword_10006DAD8);
    swift_bridgeObjectRetain();
    id v13 = v11 + 5;
    do
    {
      uint64_t v14 = *(v13 - 1);
      unint64_t v15 = *v13;
      sub_10002AF34(v14, *v13);
      uint64_t v16 = sub_10004A8A0();
      sub_10002AEB4(v14, v15);
      if (v16)
      {
        sub_10004A7C0();
        if (*(void *)((v48[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v48[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10004A800();
        }
        sub_10004A820();
        sub_10004A7F0();
      }
      v13 += 2;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    unint64_t v18 = v48[0];
  }
  else
  {
    unint64_t v18 = (unint64_t)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_10004AAA0();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
  uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v19)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    return (CGColorSpaceRef)_swiftEmptyArrayStorage;
  }
LABEL_16:
  CGColorSpaceRef result = (CGColorSpaceRef)sub_100025DC8(0, v19 & ~(v19 >> 63), 0);
  if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t v21 = 0;
    NSString v17 = _swiftEmptyArrayStorage;
    unint64_t v46 = v18 & 0xC000000000000001;
    unint64_t v45 = (__CFString *)kCGColorSpaceDisplayP3;
    while (1)
    {
      if (v46) {
        id v22 = (id)sub_10004AA10();
      }
      else {
        id v22 = *(id *)(v18 + 8 * v21 + 32);
      }
      uint64_t v23 = v22;
      uint64_t v24 = (CGColor *)objc_msgSend(v22, "CGColor", v45);
      unint64_t v25 = CGColorGetColorSpace(v24);

      if (!v25) {
        goto LABEL_28;
      }
      unint64_t v47 = v17;
      uint64_t v26 = v19;
      uint64_t v27 = (void *)v18;
      CFStringRef v28 = CGColorSpaceCopyName(v25);
      if (!v28) {
        goto LABEL_27;
      }
      id v29 = (__CFString *)v28;
      type metadata accessor for CFString(0);
      sub_10001A308();
      id v30 = (id)kCGColorSpaceSRGB;
      char v31 = sub_1000499E0();

      if (v31)
      {
      }
      else
      {
        float64x2_t v32 = v45;
        char v33 = sub_1000499E0();

        if ((v33 & 1) == 0)
        {
LABEL_27:

          unint64_t v18 = (unint64_t)v27;
          uint64_t v19 = v26;
          NSString v17 = v47;
LABEL_28:
          if (qword_10006C058 != -1) {
            swift_once();
          }
          char v38 = byte_100072488;
          int v39 = (CGColor *)[v23 CGColor];
          CGColorSpaceRef result = (CGColorSpaceRef)UISCreateCachedColorTransform();
          if (!result) {
            goto LABEL_43;
          }
          int64_t v40 = result;
          CGColorSpaceRef result = CGColorGetColorSpace(v39);
          if (!result) {
            goto LABEL_44;
          }
          CGColorSpaceRef v41 = result;
          CGColorSpaceRef result = (CGColorSpaceRef)sub_10004A860();
          if (!result) {
            goto LABEL_45;
          }
          CGColorTransformConvertColorComponents();

          swift_bridgeObjectRelease();
          uint64_t v34 = 0;
          uint64_t v35 = 0;
          uint64_t v37 = 0;
          CGFloat Alpha = CGColorGetAlpha(v39);

          goto LABEL_34;
        }
      }
      sub_100019828(v23, (v31 & 1) == 0, (uint64_t)v48);
      uint64_t v34 = v48[0];
      uint64_t v35 = v48[1];
      uint64_t v37 = v48[2];
      CGFloat Alpha = *(double *)&v48[3];
      char v38 = v49;

      unint64_t v18 = (unint64_t)v27;
      uint64_t v19 = v26;
      NSString v17 = v47;
LABEL_34:
      unint64_t v43 = v17[2];
      unint64_t v42 = v17[3];
      if (v43 >= v42 >> 1) {
        sub_100025DC8((char *)(v42 > 1), v43 + 1, 1);
      }
      ++v21;
      float64x2_t v17[2] = v43 + 1;
      uint64_t v44 = (CGFloat *)&v17[5 * v43];
      *((void *)v44 + 4) = v34;
      *((void *)v44 + 5) = v35;
      *((void *)v44 + 6) = v37;
      v44[7] = Alpha;
      *((unsigned char *)v44 + 64) = v38;
      if (v19 == v21)
      {
        swift_bridgeObjectRelease();
        return (CGColorSpaceRef)v17;
      }
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

void *sub_10002A994(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v10 = _swiftEmptyArrayStorage;
  sub_100025E28(0, v2, 0);
  id v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_10002B050(i, (uint64_t)v9);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100025E28(0, v3[2] + 1, 1);
        id v3 = v10;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_100025E28((char *)(v5 > 1), v6 + 1, 1);
        id v3 = v10;
      }
      int8x16_t v3[2] = v6 + 1;
      *(_OWORD *)&v3[2 * v6 + 4] = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    sub_10002B0AC(0, 0xF000000000000000);
    return 0;
  }
  return v3;
}

uint64_t sub_10002AAE4()
{
  if (qword_10006C058 != -1) {
    swift_once();
  }
  int v0 = byte_100072488;
  sub_100005458((uint64_t *)&unk_10006D970);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10004FDA0;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = 0x3FF0000000000000;
  double v2 = 0.156862745;
  if (!v0) {
    double v2 = 0.0;
  }
  double v3 = 0.380392157;
  if (v0) {
    double v3 = 0.37254902;
  }
  double v4 = 0.992156863;
  if (v0) {
    double v4 = 0.956862745;
  }
  double v5 = 0.2;
  if (v0) {
    double v5 = 0.392156863;
  }
  double v6 = 0.780392157;
  if (v0) {
    double v6 = 0.768627451;
  }
  double v7 = 0.349019608;
  if (v0) {
    double v7 = 0.4;
  }
  double v8 = 0.968627451;
  double v9 = 1.0;
  if (!v0) {
    double v8 = 1.0;
  }
  double v10 = 0.8;
  if (v0) {
    double v10 = 0.807843137;
  }
  double v11 = 0.00392156863;
  if (v0)
  {
    double v11 = 0.274509804;
    double v9 = 0.921568627;
  }
  double v12 = 0.22745098;
  if (v0) {
    double v12 = 0.301960784;
  }
  double v13 = 0.184313725;
  if (v0) {
    double v13 = 0.239215686;
  }
  *(unsigned char *)(v1 + 64) = v0;
  *(double *)(v1 + 72) = v2;
  *(double *)(v1 + 80) = v3;
  *(double *)(v1 + 88) = v4;
  *(void *)(v1 + 96) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 104) = v0;
  *(double *)(v1 + 112) = v5;
  *(double *)(v1 + 120) = v6;
  *(double *)(v1 + 128) = v7;
  *(void *)(v1 + 136) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 144) = v0;
  *(double *)(v1 + 152) = v8;
  *(double *)(v1 + 160) = v10;
  *(double *)(v1 + 168) = v11;
  *(void *)(v1 + 176) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 184) = v0;
  *(double *)(v1 + 192) = v9;
  *(double *)(v1 + 200) = v12;
  *(double *)(v1 + 208) = v13;
  *(void *)(v1 + 216) = 0x3FF0000000000000;
  *(unsigned char *)(v1 + 224) = v0;
  sub_100049880();
  swift_allocObject();
  sub_100049870();
  sub_100005458(&qword_10006CA40);
  sub_10002AF8C(&qword_10006DAC0, (void (*)(void))sub_10002AE60);
  uint64_t v14 = sub_100049860();
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  swift_release();
  id v17 = [self standardUserDefaults];
  Class isa = sub_100049900().super.isa;
  NSString v19 = sub_10004A700();
  [v17 setValue:isa forKey:v19];

  return sub_10002AEB4(v14, v16);
}

id sub_10002ADF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoritesStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FavoritesStore()
{
  return self;
}

unint64_t sub_10002AE60()
{
  unint64_t result = qword_10006DAC8;
  if (!qword_10006DAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DAC8);
  }
  return result;
}

uint64_t sub_10002AEB4(uint64_t a1, unint64_t a2)
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

void *sub_10002AF0C(void *a1)
{
  return sub_100025A64(0, a1[2], 0, a1);
}

char *sub_10002AF20(uint64_t a1)
{
  return sub_100025B88(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10002AF34(uint64_t a1, unint64_t a2)
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

uint64_t sub_10002AF8C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061E8(&qword_10006CA40);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002AFFC()
{
  unint64_t result = qword_10006DAE8;
  if (!qword_10006DAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DAE8);
  }
  return result;
}

uint64_t sub_10002B050(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002B0AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10002AEB4(a1, a2);
  }
  return a1;
}

unint64_t sub_10002B0C0()
{
  unint64_t result = qword_10006DAF8;
  if (!qword_10006DAF8)
  {
    sub_1000061E8(&qword_10006CA40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DAF8);
  }
  return result;
}

id sub_10002B11C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_colorView;
  id v10 = objc_allocWithZone((Class)UIView);
  double v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  uint64_t v12 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_maskShapeView;
  type metadata accessor for ShapeView();
  *(void *)&v11[v12] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v13 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_barView;
  *(void *)&v11[v13] = [objc_allocWithZone((Class)UIView) init];

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for RemoveColorCell();
  id v14 = objc_msgSendSuper2(&v16, "initWithFrame:", a1, a2, a3, a4);
  sub_10002B364();

  return v14;
}

id sub_10002B248(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_colorView;
  id v4 = objc_allocWithZone((Class)UIView);
  double v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_maskShapeView;
  type metadata accessor for ShapeView();
  *(void *)&v5[v6] = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v7 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_barView;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)UIView) init];

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for RemoveColorCell();
  id v8 = objc_msgSendSuper2(&v12, "initWithCoder:", a1);
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    sub_10002B364();
  }
  return v9;
}

void sub_10002B364()
{
  id v1 = [v0 contentView];
  objc_super v2 = self;
  id v3 = [v2 whiteColor];
  [v1 setBackgroundColor:v3];

  id v4 = [v0 contentView];
  double v5 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_colorView];
  [v4 addSubview:v5];

  id v6 = [v0 contentView];
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_maskShapeView];
  [v6 setMaskView:v7];

  id v8 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_barView];
  id v9 = [v2 systemRedColor];
  [v8 setBackgroundColor:v9];

  id v10 = [v8 layer];
  [v10 setCornerRadius:1.5];

  id v11 = [v8 layer];
  [v11 setCornerCurve:kCACornerCurveContinuous];

  [v8 setClipsToBounds:1];
  id v12 = [v0 contentView];
  [v12 addSubview:v8];

  id v13 = [v2 systemGray5Color];
  [v5 setBackgroundColor:v13];

  id v14 = [v2 blackColor];
  id v15 = [v7 layer];
  self;
  objc_super v16 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v14) {
    id v17 = [v14 CGColor];
  }
  else {
    id v17 = 0;
  }
  [v16 setFillColor:v17];

  [v0 setIsAccessibilityElement:1];
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v19 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v20 = sub_10004A700();
  NSString v21 = sub_10004A700();
  id v22 = [v19 localizedStringForKey:v20 value:0 table:v21];

  sub_10004A740();
  id v23 = sub_10004A700();
  swift_bridgeObjectRelease();
  [v0 setAccessibilityLabel:v23];
}

void sub_10002B7F4()
{
  id v1 = v0;
  v33.receiver = v0;
  v33.super_class = (Class)type metadata accessor for RemoveColorCell();
  objc_msgSendSuper2(&v33, "layoutSubviews");
  objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_colorView];
  [v1 bounds];
  objc_msgSend(v2, "setFrame:");
  id v3 = *(char **)&v1[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_maskShapeView];
  [v1 bounds];
  objc_msgSend(v3, "setFrame:");
  [v1 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = self;
  id v13 = objc_msgSend(v12, "bezierPathWithOvalInRect:", v5, v7, v9, v11);
  if ([v1 isSelected])
  {
    [v1 bounds];
    CGRect v35 = CGRectInset(v34, 3.0, 3.0);
    double x = v35.origin.x;
    double y = v35.origin.y;
    double width = v35.size.width;
    double height = v35.size.height;
    [v1 bounds];
    CGRect v37 = CGRectInset(v36, 6.0, 6.0);
    double v18 = v37.origin.x;
    double v19 = v37.origin.y;
    double v20 = v37.size.width;
    double v21 = v37.size.height;
    id v22 = objc_msgSend(v12, "bezierPathWithOvalInRect:", x, y, width, height);
    id v23 = [v22 bezierPathByReversingPath];

    [v13 appendPath:v23];
    id v24 = objc_msgSend(v12, "bezierPathWithOvalInRect:", v18, v19, v20, v21);
    [v13 appendPath:v24];
  }
  unint64_t v25 = *(void **)&v3[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath];
  *(void *)&v3[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath] = v13;
  id v26 = v13;

  sub_100010574();
  unsigned int v27 = [v1 isSelected];
  [v1 bounds];
  double v28 = CGRectGetHeight(v38);
  double v29 = -8.0;
  if (v27) {
    double v29 = -18.0;
  }
  id v30 = *(void **)&v1[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_barView];
  *(_OWORD *)&v32.a = 0x3FF0000000000000uLL;
  double v31 = v28 + v29;
  v32.c = 0.0;
  v32.d = 1.0;
  *(_OWORD *)&v32.tdouble x = 0uLL;
  [v30 setTransform:&v32];
  objc_msgSend(v30, "setBounds:", 0.0, 0.0, 3.0, v31);
  [v1 center];
  objc_msgSend(v30, "setCenter:");
  CGAffineTransformMakeRotation(&v32, 0.785398163);
  [v30 setTransform:&v32];
}

UIAccessibilityTraits sub_10002BB94()
{
  if (![v0 isSelected]) {
    return UIAccessibilityTraitButton;
  }
  UIAccessibilityTraits result = UIAccessibilityTraitSelected;
  if (!UIAccessibilityTraitSelected)
  {
    if (!UIAccessibilityTraitButton) {
      return 0;
    }
    return UIAccessibilityTraitButton | UIAccessibilityTraitSelected;
  }
  if ((UIAccessibilityTraitButton & ~UIAccessibilityTraitSelected) != 0) {
    return UIAccessibilityTraitButton | UIAccessibilityTraitSelected;
  }
  return result;
}

id sub_10002BC14()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoveColorCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoveColorCell()
{
  return self;
}

ValueMetadata *type metadata accessor for ColorPickerView()
{
  return &type metadata for ColorPickerView;
}

uint64_t getEnumTagSinglePayload for Tab(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Tab(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *UIAccessibilityTraits result = a2 + 2;
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
        JUMPOUT(0x10002BE34);
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
          *UIAccessibilityTraits result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Tab()
{
  return &type metadata for Tab;
}

uint64_t sub_10002BE6C()
{
  return sub_100006E54(&qword_10006DB40, &qword_10006DB48);
}

uint64_t sub_10002BEA8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10004A880();
    id v23 = (void *)sub_10004A1B0();
    sub_100049A10();
  }
  sub_100049E10();
  long long v24 = v13[5];
  a9[4] = v13[4];
  a9[5] = v24;
  long long v25 = v13[6];
  long long v26 = v13[1];
  *a9 = *v13;
  a9[1] = v26;
  long long v27 = v13[3];
  a9[2] = v13[2];
  a9[3] = v27;
  a9[6] = v25;
  a9[7] = v29;
  a9[8] = v30;
  a9[9] = v31;
  a9[12] = v34;
  a9[13] = v35;
  a9[10] = v32;
  a9[11] = v33;

  return sub_100033684((uint64_t)v13);
}

__n128 sub_10002C06C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10004A880();
    id v23 = (void *)sub_10004A1B0();
    sub_100049A10();
  }
  sub_100049E10();
  sub_100006524(v13, a9, &qword_10006DB68);
  long long v24 = (_OWORD *)(a9 + *(int *)(sub_100005458(&qword_10006DB70) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *long long v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_10002C22C(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6D75727463657053;
    }
    else {
      uint64_t v3 = 0x73726564696C53;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE800000000000000;
    }
    else {
      unint64_t v4 = 0xE700000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6D75727463657053;
      }
      else {
        uint64_t v6 = 0x73726564696C53;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE800000000000000;
      }
      else {
        unint64_t v7 = 0xE700000000000000;
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
    uint64_t v3 = 1684632135;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1684632135)
  {
LABEL_21:
    char v8 = sub_10004AB60();
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

uint64_t sub_10002C338()
{
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = sub_10004A700();
  NSString v3 = sub_10004A700();
  id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

  uint64_t v5 = sub_10004A740();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_10002C474(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10002C22C(*a1, *a2);
}

Swift::Int sub_10002C480()
{
  return sub_10004AC20();
}

uint64_t sub_10002C51C()
{
  sub_10004A760();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10002C5A4()
{
  return sub_10004AC20();
}

uint64_t sub_10002C63C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100032450(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10002C66C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE800000000000000;
  uint64_t v5 = 0x6D75727463657053;
  if (v2 != 1)
  {
    uint64_t v5 = 0x73726564696C53;
    unint64_t v4 = 0xE700000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1684632135;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_10002C6C4(void *a1@<X8>)
{
  *a1 = &off_1000625E0;
}

unint64_t sub_10002C6D8()
{
  unint64_t result = qword_10006DB50;
  if (!qword_10006DB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DB50);
  }
  return result;
}

uint64_t sub_10002C72C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10002C748@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005458(&qword_10006DB58);
  __chkstk_darwin(v4 - 8);
  BOOL v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100005458(&qword_10006DB60);
  __chkstk_darwin(v40);
  char v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100005458(&qword_10006DB68);
  __chkstk_darwin(v41);
  double v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005458(&qword_10006DB70);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005458(&qword_10006DB78);
  __chkstk_darwin(v14);
  objc_super v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)BOOL v6 = sub_100049FD0();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v17 = sub_100005458(&qword_10006DB80);
  sub_10002CCAC((uint64_t *)&v6[*(int *)(v17 + 44)]);
  swift_retain();
  char v18 = sub_100012214();
  swift_release();
  uint64_t v42 = v14;
  if ((v18 & 1) == 0)
  {
    char v23 = sub_10004A1D0();
    goto LABEL_9;
  }
  uint64_t v39 = a2;
  unsigned __int8 v19 = sub_10004A1F0();
  unsigned __int8 v20 = sub_10004A1E0();
  unsigned __int8 v21 = sub_10004A210();
  char v22 = sub_10004A200();
  sub_10004A200();
  if (sub_10004A200() != v19) {
    char v22 = sub_10004A200();
  }
  sub_10004A200();
  if (sub_10004A200() != v20) {
    char v22 = sub_10004A200();
  }
  a2 = v39;
  sub_10004A200();
  if (sub_10004A200() != v21)
  {
    char v23 = sub_10004A200();
LABEL_9:
    char v22 = v23;
  }
  id v24 = [self currentDevice];
  id v25 = [v24 userInterfaceIdiom];

  if (v25 != (id)6)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
  }
  sub_100049BF0();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  sub_100006524((uint64_t)v6, (uint64_t)v8, &qword_10006DB58);
  long long v34 = &v8[*(int *)(v40 + 36)];
  *long long v34 = v22;
  *((void *)v34 + 1) = v27;
  *((void *)v34 + 2) = v29;
  *((void *)v34 + 3) = v31;
  *((void *)v34 + 4) = v33;
  v34[40] = 0;
  sub_100006588((uint64_t)v6, &qword_10006DB58);
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  swift_retain();
  uint64_t v35 = sub_100049B10();
  sub_100006524((uint64_t)v8, (uint64_t)v10, &qword_10006DB60);
  CGRect v36 = (uint64_t *)&v10[*(int *)(v41 + 36)];
  *CGRect v36 = v35;
  v36[1] = a1;
  sub_100006588((uint64_t)v8, &qword_10006DB60);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  double v37 = v43;
  sub_10004A640();
  sub_10002C06C(0.0, 1, v37, 0, 0.0, 1, 0.0, 1, (uint64_t)v13, 0.0, 1, 0.0, 1);
  sub_100006588((uint64_t)v10, &qword_10006DB68);
  LOBYTE(v37) = sub_10004A1D0();
  sub_100006524((uint64_t)v13, (uint64_t)v16, &qword_10006DB70);
  v16[*(int *)(v42 + 36)] = LOBYTE(v37);
  sub_100006588((uint64_t)v13, &qword_10006DB70);
  return sub_100006730((uint64_t)v16, a2, &qword_10006DB78);
}

uint64_t sub_10002CCAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = type metadata accessor for ColorPickerContent();
  uint64_t v2 = __chkstk_darwin(v1);
  long long v34 = (uint64_t *)((char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - v4;
  swift_retain();
  char v6 = sub_100012214();
  swift_release();
  if (v6)
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t v35 = sub_100049E70();
    uint64_t v39 = v7;
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v35 = 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  if (v40)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v36 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 1;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t v32 = sub_100049E70();
    uint64_t v8 = v12;
    unsigned __int8 v13 = sub_10004A1E0();
    id v14 = [self currentDevice];
    id v15 = [v14 userInterfaceIdiom];

    if (v15 != (id)6)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049B60();
      swift_release();
      swift_release();
      swift_release();
    }
    sub_100049BF0();
    uint64_t v37 = v16;
    uint64_t v38 = v17;
    uint64_t v36 = v18;
    uint64_t v10 = v19;
    uint64_t v9 = v13;
    uint64_t v11 = v32;
  }
  uint64_t v32 = v9;
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v20 = sub_100049E70();
  uint64_t v21 = (uint64_t)v34;
  *long long v34 = v20;
  *(void *)(v21 + 8) = v22;
  char v23 = (uint64_t *)(v21 + *(int *)(v1 + 20));
  *char v23 = swift_getKeyPath();
  sub_100005458(&qword_10006C0D0);
  swift_storeEnumTagMultiPayload();
  uint64_t v31 = v5;
  sub_100032F1C(v21, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  sub_100033760((uint64_t)v5, v21, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  uint64_t v24 = v35;
  id v25 = v33;
  *uint64_t v33 = v35;
  uint64_t v26 = v24;
  v25[1] = v39;
  int8x16_t v25[2] = v11;
  v25[3] = v8;
  v25[4] = v9;
  uint64_t v27 = v38;
  v25[5] = v37;
  v25[6] = v27;
  v25[7] = v36;
  v25[8] = v10;
  *((unsigned char *)v25 + 72) = 0;
  uint64_t v28 = sub_100005458(&qword_10006DB88);
  sub_100033760(v21, (uint64_t)v25 + *(int *)(v28 + 64), (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  uint64_t v29 = (char *)v25 + *(int *)(v28 + 80);
  *(void *)uint64_t v29 = 0;
  v29[8] = 0;
  sub_100031FD4(v26);
  sub_100031FD4(v11);
  sub_1000337C8((uint64_t)v31, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  sub_1000337C8(v21, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
  sub_100031FE4(v11);
  return sub_100031FE4(v26);
}

uint64_t sub_10002D144@<X0>(uint64_t a1@<X8>)
{
  return sub_10002C748(*(void *)(v1 + 8), a1);
}

uint64_t sub_10002D14C@<X0>(uint64_t a1@<X8>)
{
  v21[1] = a1;
  uint64_t v1 = sub_10004A100();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005458(&qword_10006DD98);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  sub_100049E40();
  swift_getKeyPath();
  sub_100049E60();
  swift_release();
  swift_release();
  uint64_t v26 = v29;
  uint64_t v27 = v30;
  char v28 = v31;
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v11 = sub_10004A700();
  NSString v12 = sub_10004A700();
  id v13 = [v10 localizedStringForKey:v11 value:0 table:v12];

  uint64_t v14 = sub_10004A740();
  uint64_t v16 = v15;

  uint64_t v22 = v14;
  uint64_t v23 = v16;
  sub_100006678();
  uint64_t v22 = sub_10004A2F0();
  uint64_t v23 = v17;
  char v24 = v18 & 1;
  uint64_t v25 = v19;
  sub_100005458(&qword_10006DDA0);
  sub_10003305C();
  sub_1000330B0();
  sub_10004A540();
  sub_10004A0F0();
  sub_100006E54(&qword_10006DDB8, &qword_10006DD98);
  sub_10004A320();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10002D50C()
{
  return sub_10004A5E0();
}

uint64_t sub_10002D5E0@<X0>(uint64_t a1@<X8>)
{
  sub_10002C338();
  sub_100006678();
  uint64_t result = sub_10004A2F0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_10002D63C@<X0>(uint64_t a1@<X8>)
{
  return sub_10002D14C(a1);
}

uint64_t sub_10002D644@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v2 = sub_100005458(&qword_10006DC58);
  __chkstk_darwin(v2);
  char v4 = (uint64_t *)((char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100005458(&qword_10006DC60);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005458(&qword_10006DC68);
  __chkstk_darwin(v8);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v15)
    {
      sub_10002D90C((uint64_t)v10);
      NSString v11 = &qword_10006DC68;
      sub_100006524((uint64_t)v10, (uint64_t)v7, &qword_10006DC68);
      swift_storeEnumTagMultiPayload();
      sub_100032940();
      sub_100032AE0();
      sub_10004A0D0();
      uint64_t v12 = (uint64_t)v10;
    }
    else
    {
      uint64_t *v4 = sub_10002DCC4();
      sub_10002DE84(v1, (uint64_t)v4 + *(int *)(v2 + 44));
      NSString v11 = &qword_10006DC58;
      sub_100006524((uint64_t)v4, (uint64_t)v7, &qword_10006DC58);
      swift_storeEnumTagMultiPayload();
      sub_100032940();
      sub_100032AE0();
      sub_10004A0D0();
      uint64_t v12 = (uint64_t)v4;
    }
    return sub_100006588(v12, v11);
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_10002D90C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v1 = sub_100049DD0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)type metadata accessor for ColorSwatchPickerView();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  id v10 = (char *)&v26 - v9;
  uint64_t v26 = sub_100005458(&qword_10006DC80);
  __chkstk_darwin(v26);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t *v8 = swift_getKeyPath();
  sub_100005458(&qword_10006C408);
  swift_storeEnumTagMultiPayload();
  id v13 = (uint64_t *)((char *)v8 + v5[5]);
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  *id v13 = sub_100049E70();
  v13[1] = v14;
  uint64_t v15 = v5[6];
  if (qword_10006C048 != -1) {
    swift_once();
  }
  *(uint64_t *)((char *)v8 + v15) = qword_100072480;
  uint64_t v16 = v5[7];
  uint64_t v17 = qword_10006C050;
  swift_bridgeObjectRetain();
  if (v17 != -1) {
    swift_once();
  }
  *(uint64_t *)((char *)v8 + v16) = qword_10006C400;
  sub_100032F1C((uint64_t)v8, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  swift_bridgeObjectRetain();
  sub_10002F438();
  uint64_t v19 = v18;
  sub_100033760((uint64_t)v10, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  *(void *)&v12[*(int *)(v26 + 36)] = v19;
  sub_1000337C8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ColorSwatchPickerView);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for LayoutDirection.leftToRight(_:), v1);
  uint64_t v21 = sub_100005458(&qword_10006DC68);
  uint64_t v22 = v27;
  uint64_t v23 = (uint64_t *)(v27 + *(int *)(v21 + 36));
  uint64_t v24 = sub_100005458(&qword_10006DCA0);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)v23 + *(int *)(v24 + 28), v4, v1);
  *uint64_t v23 = KeyPath;
  sub_100006524((uint64_t)v12, v22, &qword_10006DC80);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_100006588((uint64_t)v12, &qword_10006DC80);
}

uint64_t sub_10002DCC4()
{
  if (*v0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v4)
    {
      sub_100049F70();
      id v1 = [self currentDevice];
      [v1 userInterfaceIdiom];

      sub_10000F664();
    }
    else
    {
      id v2 = [self currentDevice];
      [v2 userInterfaceIdiom];

      sub_100049FD0();
      sub_10000F6B8();
    }
    return sub_10004A660();
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_10002DE84@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005458(&qword_10006DCD0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005458(&qword_10006DCD8);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)&v19 - v12;
  sub_10002E0B4(a1, (uint64_t)v6);
  sub_100006524((uint64_t)v6, (uint64_t)v11, &qword_10006DCD0);
  *(_WORD *)&v11[*(int *)(v8 + 44)] = 256;
  sub_100006588((uint64_t)v6, &qword_10006DCD0);
  sub_100006730((uint64_t)v11, (uint64_t)v13, &qword_10006DCD8);
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v14 = sub_100049E70();
  uint64_t v16 = v15;
  sub_100006524((uint64_t)v13, (uint64_t)v11, &qword_10006DCD8);
  sub_100006524((uint64_t)v11, a2, &qword_10006DCD8);
  uint64_t v17 = a2 + *(int *)(sub_100005458(&qword_10006DCE0) + 48);
  *(void *)uint64_t v17 = v14;
  *(void *)(v17 + 8) = v16;
  *(void *)(v17 + 16) = sub_10002FE30;
  *(void *)(v17 + 24) = 0;
  *(unsigned char *)(v17 + 32) = 0;
  swift_retain();
  sub_100032C6C();
  sub_100006588((uint64_t)v13, &qword_10006DCD8);
  swift_release();
  sub_100032C74();
  return sub_100006588((uint64_t)v11, &qword_10006DCD8);
}

uint64_t sub_10002E0B4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v55 = sub_100005458(&qword_10006DCE8);
  __chkstk_darwin(v55);
  uint64_t v4 = (void *)((char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100005458(&qword_10006DCF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for RGBAView();
  uint64_t v8 = __chkstk_darwin(v54);
  double v43 = (void *)((char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  uint64_t v45 = (uint64_t)v41 - v10;
  uint64_t v48 = sub_100005458(&qword_10006DCF8);
  __chkstk_darwin(v48);
  uint64_t v44 = (_OWORD *)((char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v50 = sub_100005458(&qword_10006DD00);
  __chkstk_darwin(v50);
  uint64_t v52 = (uint64_t)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100005458(&qword_10006DD08);
  __chkstk_darwin(v47);
  uint64_t v14 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100005458(&qword_10006DD10);
  __chkstk_darwin(v51);
  char v49 = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100005458(&qword_10006DC68);
  __chkstk_darwin(v46);
  uint64_t v42 = (uint64_t)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005458(&qword_10006DD18);
  __chkstk_darwin(v17);
  uint64_t v53 = (char *)v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100049DB0();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ColorPickerContent();
  sub_10003180C(&qword_10006C0D0, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, (uint64_t)v22);
  char v23 = sub_100049DA0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  if ((v23 & 1) == 0)
  {
    uint64_t *v4 = sub_10004A630();
    v4[1] = v29;
    uint64_t v30 = sub_100005458(&qword_10006DD20);
    sub_10002EEAC((uint64_t)v4 + *(int *)(v30 + 44));
    sub_100006524((uint64_t)v4, (uint64_t)v7, &qword_10006DCE8);
    swift_storeEnumTagMultiPayload();
    sub_100032C7C();
    sub_100006E54(&qword_10006DD60, &qword_10006DCE8);
    sub_10004A0D0();
    uint64_t v31 = (uint64_t)v4;
    uint64_t v32 = &qword_10006DCE8;
    return sub_100006588(v31, v32);
  }
  v41[1] = v5;
  if (*a1)
  {
    uint64_t v24 = v7;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v57)
    {
      uint64_t v25 = (uint64_t)v7;
      if (v57 == 1)
      {
        uint64_t v26 = v44;
        sub_10002EA54(v44);
        sub_100006524((uint64_t)v26, (uint64_t)v14, &qword_10006DCF8);
        swift_storeEnumTagMultiPayload();
        sub_100032940();
        sub_100032DA4();
        uint64_t v27 = (uint64_t)v49;
        sub_10004A0D0();
        sub_100006524(v27, v52, &qword_10006DD10);
        swift_storeEnumTagMultiPayload();
        sub_100032D28();
        sub_100033CB4(&qword_10006DD58, (void (*)(uint64_t))type metadata accessor for RGBAView);
        uint64_t v28 = (uint64_t)v53;
        sub_10004A0D0();
        sub_100006588(v27, &qword_10006DD10);
        sub_100006588((uint64_t)v26, &qword_10006DCF8);
      }
      else
      {
        type metadata accessor for ColorPickerState();
        sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
        uint64_t v35 = sub_100049E70();
        uint64_t v36 = (uint64_t)v43;
        *double v43 = v35;
        *(void *)(v36 + 8) = v37;
        uint64_t v38 = (uint64_t *)(v36 + *(int *)(v54 + 20));
        *uint64_t v38 = swift_getKeyPath();
        sub_100005458(&qword_10006C0D0);
        swift_storeEnumTagMultiPayload();
        uint64_t v39 = v45;
        sub_100032F1C(v36, v45, (uint64_t (*)(void))type metadata accessor for RGBAView);
        sub_100033760(v39, v52, (uint64_t (*)(void))type metadata accessor for RGBAView);
        swift_storeEnumTagMultiPayload();
        sub_100032D28();
        sub_100033CB4(&qword_10006DD58, (void (*)(uint64_t))type metadata accessor for RGBAView);
        uint64_t v28 = (uint64_t)v53;
        sub_10004A0D0();
        sub_1000337C8(v39, (uint64_t (*)(void))type metadata accessor for RGBAView);
      }
    }
    else
    {
      uint64_t v33 = v42;
      sub_10002D90C(v42);
      sub_100006524(v33, (uint64_t)v14, &qword_10006DC68);
      swift_storeEnumTagMultiPayload();
      sub_100032940();
      sub_100032DA4();
      uint64_t v34 = (uint64_t)v49;
      sub_10004A0D0();
      sub_100006524(v34, v52, &qword_10006DD10);
      swift_storeEnumTagMultiPayload();
      sub_100032D28();
      sub_100033CB4(&qword_10006DD58, (void (*)(uint64_t))type metadata accessor for RGBAView);
      uint64_t v28 = (uint64_t)v53;
      sub_10004A0D0();
      sub_100006588(v34, &qword_10006DD10);
      sub_100006588(v33, &qword_10006DC68);
      uint64_t v25 = (uint64_t)v24;
    }
    sub_100006524(v28, v25, &qword_10006DD18);
    swift_storeEnumTagMultiPayload();
    sub_100032C7C();
    sub_100006E54(&qword_10006DD60, &qword_10006DCE8);
    sub_10004A0D0();
    uint64_t v31 = v28;
    uint64_t v32 = &qword_10006DD18;
    return sub_100006588(v31, v32);
  }
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_10002EA54@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v34 = sub_100005458(&qword_10006DCA0);
  __chkstk_darwin(v34);
  uint64_t v4 = (uint64_t *)&v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v36 = sub_100049DD0();
  uint64_t v5 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v35 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v33 = v1;
  uint64_t v7 = *v1;
  if (*v1)
  {
    uint64_t v8 = (void *)swift_allocObject();
    _OWORD v8[2] = 0;
    v8[3] = 0;
    v8[4] = v7;
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v7;
    swift_retain_n();
    sub_10004A590();
    uint64_t v31 = *((void *)&v47 + 1);
    uint64_t v32 = v47;
    long long v30 = v48;
    long long v10 = v49;
    int v29 = v50;
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t v11 = sub_100049E70();
    uint64_t v13 = v12;
    long long v37 = 0uLL;
    LOBYTE(v38) = 1;
    sub_100005458(&qword_10006DD68);
    sub_10004A4F0();
    long long v14 = v47;
    char v15 = v48;
    uint64_t v16 = *((void *)&v48 + 1);
    long long v37 = 0u;
    long long v38 = 0u;
    LOBYTE(v39) = 2;
    sub_100005458(&qword_10006CA18);
    sub_10004A4F0();
    long long v37 = v14;
    LOBYTE(v38) = v15;
    *((void *)&v38 + 1) = v16;
    long long v39 = v47;
    long long v40 = v48;
    LOBYTE(v41) = v49;
    *((void *)&v41 + 1) = *((void *)&v49 + 1);
    *(void *)&long long v42 = v32;
    *((void *)&v42 + 1) = v31;
    long long v43 = v30;
    long long v44 = v10;
    LOBYTE(v45) = v29;
    *((void *)&v45 + 1) = v11;
    uint64_t v46 = v13;
    sub_10002F438();
    long long v53 = v43;
    long long v54 = v44;
    long long v55 = v45;
    *(void *)&long long v56 = v46;
    long long v49 = v39;
    long long v50 = v40;
    long long v51 = v41;
    long long v52 = v42;
    long long v47 = v37;
    long long v48 = v38;
    *((void *)&v56 + 1) = v17;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v20 = v35;
    uint64_t v19 = v36;
    (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v35, enum case for LayoutDirection.leftToRight(_:), v36);
    (*(void (**)(char *, unsigned char *, uint64_t))(v5 + 16))((char *)v4 + *(int *)(v34 + 28), v20, v19);
    uint64_t *v4 = KeyPath;
    uint64_t v21 = sub_100005458(&qword_10006DCF8);
    sub_100006524((uint64_t)v4, (uint64_t)a1 + *(int *)(v21 + 36), &qword_10006DCA0);
    long long v22 = v54;
    a1[6] = v53;
    a1[7] = v22;
    long long v23 = v56;
    a1[8] = v55;
    a1[9] = v23;
    long long v24 = v50;
    a1[2] = v49;
    a1[3] = v24;
    long long v25 = v52;
    a1[4] = v51;
    a1[5] = v25;
    long long v26 = v48;
    *a1 = v47;
    a1[1] = v26;
    sub_100032F8C((uint64_t)&v47);
    sub_100006588((uint64_t)v4, &qword_10006DCA0);
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v20, v19);
    return sub_100032FF4((uint64_t)&v37);
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_10002EEAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v55 = type metadata accessor for RGBAView() - 8;
  uint64_t v1 = __chkstk_darwin(v55);
  long long v54 = (uint64_t *)((char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v1);
  uint64_t v57 = (uint64_t)&v49 - v3;
  uint64_t v59 = sub_100005458(&qword_10006DD70) - 8;
  uint64_t v4 = __chkstk_darwin(v59);
  uint64_t v56 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v58 = (uint64_t)&v49 - v6;
  uint64_t v7 = sub_100005458(&qword_10006DCF8);
  __chkstk_darwin(v7 - 8);
  long long v52 = (_OWORD *)((char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v50 = sub_100005458(&qword_10006DD78) - 8;
  uint64_t v9 = __chkstk_darwin(v50);
  uint64_t v51 = (uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v53 = (uint64_t)&v49 - v11;
  uint64_t v12 = sub_100005458(&qword_10006DC68);
  __chkstk_darwin(v12 - 8);
  long long v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005458(&qword_10006DD80);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v49 - v20;
  sub_10002D90C((uint64_t)v14);
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v22 = sub_100049E70();
  uint64_t v24 = v23;
  sub_100006524((uint64_t)v14, (uint64_t)v19, &qword_10006DC68);
  long long v25 = &v19[*(int *)(v16 + 44)];
  *(void *)long long v25 = v22;
  *((void *)v25 + 1) = v24;
  v25[16] = 0;
  sub_100006588((uint64_t)v14, &qword_10006DC68);
  uint64_t v26 = (uint64_t)v21;
  sub_100006730((uint64_t)v19, (uint64_t)v21, &qword_10006DD80);
  uint64_t v27 = v52;
  sub_10002EA54(v52);
  uint64_t v28 = sub_100049E70();
  uint64_t v30 = v29;
  uint64_t v31 = v51;
  sub_100006524((uint64_t)v27, v51, &qword_10006DCF8);
  uint64_t v32 = v31 + *(int *)(v50 + 44);
  *(void *)uint64_t v32 = v28;
  *(void *)(v32 + 8) = v30;
  *(unsigned char *)(v32 + 16) = 1;
  sub_100006588((uint64_t)v27, &qword_10006DCF8);
  uint64_t v33 = v53;
  sub_100006730(v31, v53, &qword_10006DD78);
  uint64_t v34 = sub_100049E70();
  uint64_t v36 = (uint64_t)v54;
  uint64_t v35 = v55;
  uint64_t *v54 = v34;
  *(void *)(v36 + 8) = v37;
  long long v38 = (uint64_t *)(v36 + *(int *)(v35 + 28));
  *long long v38 = swift_getKeyPath();
  sub_100005458(&qword_10006C0D0);
  swift_storeEnumTagMultiPayload();
  uint64_t v39 = v57;
  sub_100032F1C(v36, v57, (uint64_t (*)(void))type metadata accessor for RGBAView);
  uint64_t v40 = sub_100049E70();
  uint64_t v42 = v41;
  uint64_t v43 = v56;
  sub_100033760(v39, v56, (uint64_t (*)(void))type metadata accessor for RGBAView);
  uint64_t v44 = v43 + *(int *)(v59 + 44);
  *(void *)uint64_t v44 = v40;
  *(void *)(v44 + 8) = v42;
  *(unsigned char *)(v44 + 16) = 2;
  sub_1000337C8(v39, (uint64_t (*)(void))type metadata accessor for RGBAView);
  uint64_t v45 = v58;
  sub_100006730(v43, v58, &qword_10006DD70);
  sub_100006524(v26, (uint64_t)v19, &qword_10006DD80);
  sub_100006524(v33, v31, &qword_10006DD78);
  sub_100006524(v45, v43, &qword_10006DD70);
  uint64_t v46 = v60;
  sub_100006524((uint64_t)v19, v60, &qword_10006DD80);
  uint64_t v47 = sub_100005458(&qword_10006DD88);
  sub_100006524(v31, v46 + *(int *)(v47 + 48), &qword_10006DD78);
  sub_100006524(v43, v46 + *(int *)(v47 + 64), &qword_10006DD70);
  sub_100006588(v45, &qword_10006DD70);
  sub_100006588(v33, &qword_10006DD78);
  sub_100006588(v26, &qword_10006DD80);
  sub_100006588(v43, &qword_10006DD70);
  sub_100006588(v31, &qword_10006DD78);
  return sub_100006588((uint64_t)v19, &qword_10006DD80);
}

uint64_t sub_10002F438()
{
  uint64_t v1 = type metadata accessor for ColorPickerContent();
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*v0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    char v4 = v6[15];
    sub_100033760((uint64_t)v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
    if ((v4 & 1) == 0) {
      return sub_1000337C8((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
    }
    if (*v3)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049B60();
      swift_release();
      swift_release();
      swift_release();
      return sub_1000337C8((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ColorPickerContent);
    }
  }
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_10002F640()
{
  return sub_100049EC0();
}

uint64_t sub_10002F664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100031DAC(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

uint64_t sub_10002F690@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W3>, uint64_t a4@<X8>)
{
  int v32 = a3;
  uint64_t v34 = a1;
  uint64_t v35 = a4;
  uint64_t v33 = sub_100005458(&qword_10006DED8);
  __chkstk_darwin(v33);
  uint64_t v6 = &v31[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100005458(&qword_10006DEE0);
  __chkstk_darwin(v7);
  uint64_t v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100005458(&qword_10006DEE8);
  __chkstk_darwin(v10);
  uint64_t v12 = &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_100005458(&qword_10006DEF0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = &v31[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    unint64_t v16 = 0xE800000000000000;
    uint64_t v17 = 0x6D75727463657053;
    if (v36 != 1)
    {
      uint64_t v17 = 0x73726564696C53;
      unint64_t v16 = 0xE700000000000000;
    }
    if (v36) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 1684632135;
    }
    if (v36) {
      unint64_t v19 = v16;
    }
    else {
      unint64_t v19 = 0xE400000000000000;
    }
    if ((_BYTE)v32)
    {
      if (v32 == 1)
      {
        unint64_t v20 = 0xE800000000000000;
        if (v18 != 0x6D75727463657053) {
          goto LABEL_19;
        }
      }
      else
      {
        unint64_t v20 = 0xE700000000000000;
        if (v18 != 0x73726564696C53) {
          goto LABEL_19;
        }
      }
    }
    else
    {
      unint64_t v20 = 0xE400000000000000;
      if (v18 != 1684632135) {
        goto LABEL_19;
      }
    }
    if (v19 == v20)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v21 = v35;
      goto LABEL_20;
    }
LABEL_19:
    char v22 = sub_10004AB60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = v35;
    if ((v22 & 1) == 0)
    {
      char v24 = 0;
      double v23 = 0.0;
      goto LABEL_22;
    }
LABEL_20:
    double v23 = 1.0;
    char v24 = 1;
LABEL_22:
    uint64_t v25 = v34;
    uint64_t v26 = sub_100005458(&qword_10006DEF8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v6, v25, v26);
    *(double *)&v6[*(int *)(v33 + 36)] = v23;
    sub_100006524((uint64_t)v6, (uint64_t)v9, &qword_10006DED8);
    v9[*(int *)(v7 + 36)] = v24;
    sub_100006588((uint64_t)v6, &qword_10006DED8);
    LOBYTE(v25) = v24 ^ 1;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v28 = swift_allocObject();
    *(unsigned char *)(v28 + 16) = v25;
    sub_100006524((uint64_t)v9, (uint64_t)v12, &qword_10006DEE0);
    uint64_t v29 = (uint64_t *)&v12[*(int *)(v10 + 36)];
    *uint64_t v29 = KeyPath;
    v29[1] = (uint64_t)sub_100034254;
    v29[2] = v28;
    sub_100006588((uint64_t)v9, &qword_10006DEE0);
    sub_10003425C();
    sub_10004A3B0();
    sub_100006588((uint64_t)v12, &qword_10006DEE8);
    return sub_100006730((uint64_t)v15, v21, &qword_10006DEF0);
  }
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_10002FB10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002F690(a1, *(void *)v2, *(unsigned __int8 *)(v2 + 16), a2);
}

uint64_t sub_10002FB1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  v19[0] = a1;
  v19[1] = a2;
  uint64_t v4 = sub_100005458(&qword_10006DDD8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005458(&qword_10006DDE0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005458(&qword_10006DDE8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [self currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  unint64_t v16 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  if (v15 == (id)6)
  {
    v16(v13, (char *)v19[0], v10);
    v16(v9, v13, v10);
    swift_storeEnumTagMultiPayload();
    sub_100006E54(&qword_10006DDF0, &qword_10006DDE8);
    sub_1000336B0();
    sub_10004A0D0();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    v16(v6, (char *)v19[0], v10);
    uint64_t v18 = &v6[*(int *)(v4 + 36)];
    *(double *)uint64_t v18 = a3;
    *((_WORD *)v18 + 4) = 0;
    sub_100006524((uint64_t)v6, (uint64_t)v9, &qword_10006DDD8);
    swift_storeEnumTagMultiPayload();
    sub_100006E54(&qword_10006DDF0, &qword_10006DDE8);
    sub_1000336B0();
    sub_10004A0D0();
    return sub_100006588((uint64_t)v6, &qword_10006DDD8);
  }
}

uint64_t sub_10002FE24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002FB1C(a1, a2, *v2);
}

uint64_t sub_10002FE30()
{
  return sub_100024890();
}

uint64_t sub_10002FE68@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = sub_100005458(&qword_10006DE08);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v43 - v6;
  uint64_t v8 = sub_100005458(&qword_10006DE10);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v43 - v12;
  uint64_t v14 = type metadata accessor for ColorSlider(0);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v19 = (char *)&v43 - v18;
  uint64_t v20 = sub_100005458(&qword_10006DE18);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  double v23 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v44 = (uint64_t)&v43 - v24;
  uint64_t v45 = a1;
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v48)
    {
      type metadata accessor for ColorPickerState();
      sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
      uint64_t v25 = sub_100049E70();
      uint64_t v27 = v26;
      *(void *)&v19[*(int *)(v14 + 24)] = swift_getKeyPath();
      sub_100005458(&qword_10006C0D0);
      swift_storeEnumTagMultiPayload();
      *unint64_t v19 = 3;
      *((void *)v19 + 1) = v25;
      *((void *)v19 + 2) = v27;
      uint64_t v28 = *(int *)(v14 + 28);
      sub_10004A220();
      *(void *)&v19[v28] = v29;
      id v30 = [self currentDevice];
      id v31 = [v30 userInterfaceIdiom];

      if (v31 == (id)6)
      {
        uint64_t v32 = sub_10004A5D0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v13, 1, 1, v32);
      }
      else
      {
        sub_10004A5C0();
        uint64_t v37 = sub_10004A5D0();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v13, 0, 1, v37);
      }
      uint64_t v36 = v46;
      uint64_t v35 = (uint64_t)v47;
      sub_100033760((uint64_t)v19, (uint64_t)v17, type metadata accessor for ColorSlider);
      sub_100006524((uint64_t)v13, (uint64_t)v11, &qword_10006DE10);
      sub_100033760((uint64_t)v17, (uint64_t)v23, type metadata accessor for ColorSlider);
      uint64_t v38 = sub_100005458(&qword_10006DE38);
      sub_100006524((uint64_t)v11, (uint64_t)&v23[*(int *)(v38 + 48)], &qword_10006DE10);
      sub_100006588((uint64_t)v13, &qword_10006DE10);
      sub_1000337C8((uint64_t)v19, type metadata accessor for ColorSlider);
      sub_100006588((uint64_t)v11, &qword_10006DE10);
      sub_1000337C8((uint64_t)v17, type metadata accessor for ColorSlider);
      uint64_t v39 = sub_100005458(&qword_10006DE20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v23, 0, 1, v39);
      uint64_t v34 = v44;
      sub_100006730((uint64_t)v23, v44, &qword_10006DE18);
    }
    else
    {
      uint64_t v33 = sub_100005458(&qword_10006DE20);
      uint64_t v34 = v44;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v44, 1, 1, v33);
      uint64_t v36 = v46;
      uint64_t v35 = (uint64_t)v47;
    }
    *(void *)uint64_t v7 = sub_100049F70();
    *((void *)v7 + 1) = 0x4030000000000000;
    v7[16] = 0;
    uint64_t v40 = sub_100005458(&qword_10006DE28);
    sub_100030490(v45, &v7[*(int *)(v40 + 44)]);
    sub_100006524(v34, (uint64_t)v23, &qword_10006DE18);
    sub_100006524((uint64_t)v7, v35, &qword_10006DE08);
    sub_100006524((uint64_t)v23, v36, &qword_10006DE18);
    uint64_t v41 = sub_100005458(&qword_10006DE30);
    sub_100006524(v35, v36 + *(int *)(v41 + 48), &qword_10006DE08);
    sub_100006588((uint64_t)v7, &qword_10006DE08);
    sub_100006588(v34, &qword_10006DE18);
    sub_100006588(v35, &qword_10006DE08);
    return sub_100006588((uint64_t)v23, &qword_10006DE18);
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100030490@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v111 = a2;
  uint64_t v108 = sub_100049E30();
  uint64_t v102 = *(void *)(v108 - 8);
  uint64_t v103 = v108 - 8;
  *(void *)&long long v104 = v102;
  __chkstk_darwin(v108 - 8);
  uint64_t v107 = &v82[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v88 = sub_100005458(&qword_10006C520) - 8;
  __chkstk_darwin(v88);
  char v87 = &v82[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v113 = sub_100049E00() - 8;
  uint64_t v5 = __chkstk_darwin(v113);
  unsigned __int8 v106 = (double *)&v82[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v8 = (double *)&v82[-v7];
  uint64_t v9 = sub_100005458(&qword_10006DE40);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = &v82[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v90 = sub_100005458(&qword_10006DE48);
  __chkstk_darwin(v90);
  uint64_t v89 = &v82[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_100005458(&qword_10006DE50);
  __chkstk_darwin(v14 - 8);
  uint64_t v98 = &v82[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v101 = sub_100005458(&qword_10006DE58);
  __chkstk_darwin(v101);
  float64x2_t v99 = &v82[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v110 = sub_100005458(&qword_10006DE60);
  uint64_t v109 = *(void *)(v110 - 8);
  uint64_t v17 = __chkstk_darwin(v110);
  unsigned long long v114 = &v82[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __chkstk_darwin(v17);
  float64x2_t v105 = &v82[-v20];
  __chkstk_darwin(v19);
  uint64_t v112 = &v82[-v21];
  unsigned __int8 v100 = a1;
  uint64_t v22 = *a1;
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  sub_100049E40();
  swift_getKeyPath();
  sub_100049E60();
  swift_release();
  swift_release();
  uint64_t v23 = v115;
  uint64_t v24 = v116;
  long long v86 = v117;
  double v85 = v118;
  uint64_t v84 = v119;
  int v83 = v120;
  id v97 = self;
  id v25 = [v97 currentDevice];
  id v26 = [v25 userInterfaceIdiom];

  double v27 = 10.0;
  if (v26 == (id)6) {
    double v28 = 22.0;
  }
  else {
    double v28 = 10.0;
  }
  uint64_t v29 = (char *)v8 + *(int *)(v113 + 28);
  uint64_t v30 = enum case for RoundedCornerStyle.continuous(_:);
  unsigned int v94 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v93 = sub_100049F90();
  uint64_t v31 = *(void *)(v93 - 8);
  uint64_t v92 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 104);
  uint64_t v95 = v31 + 104;
  v92(v29, v30, v93);
  double *v8 = v28;
  v8[1] = v28;
  uint64_t v32 = v87;
  uint64_t v91 = &type metadata accessor for RoundedRectangle;
  sub_100033760((uint64_t)v8, (uint64_t)v87, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)&v32[*(int *)(v88 + 44)] = 256;
  sub_100006524((uint64_t)v32, (uint64_t)&v12[*(int *)(v10 + 44)], &qword_10006C520);
  *(void *)uint64_t v12 = v23;
  *((void *)v12 + 1) = v24;
  *((_OWORD *)v12 + 1) = v86;
  uint64_t v33 = v84;
  *((void *)v12 + 4) = v85;
  *((void *)v12 + 5) = v33;
  v12[48] = v83;
  swift_retain();
  swift_retain();
  sub_100006588((uint64_t)v32, &qword_10006C520);
  sub_1000337C8((uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  swift_release();
  swift_release();
  uint64_t v96 = v22;
  sub_100033828(v22);
  sub_100033828(v22);
  sub_10004A640();
  sub_100049D10();
  uint64_t v34 = v89;
  sub_100006524((uint64_t)v12, (uint64_t)v89, &qword_10006DE40);
  uint64_t v35 = &v34[*(int *)(v90 + 36)];
  long long v36 = v124;
  *uint64_t v35 = v123;
  v35[1] = v36;
  v35[2] = v125;
  sub_100006588((uint64_t)v12, &qword_10006DE40);
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v38 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v39 = sub_10004A700();
  NSString v40 = sub_10004A700();
  id v41 = [v38 localizedStringForKey:v39 value:0 table:v40];

  uint64_t v42 = sub_10004A740();
  uint64_t v44 = v43;

  uint64_t v115 = v42;
  uint64_t v116 = v44;
  sub_100006678();
  uint64_t v45 = sub_10004A2F0();
  uint64_t v47 = v46;
  char v49 = v48 & 1;
  sub_10003274C(&qword_10006DE68, &qword_10006DE48, (void (*)(void))sub_1000339B8);
  uint64_t v50 = (uint64_t)v98;
  sub_10004A340();
  sub_100006720(v45, v47, v49);
  swift_bridgeObjectRelease();
  sub_100006588((uint64_t)v34, &qword_10006DE48);
  sub_100005458(&qword_10006DE80);
  uint64_t v51 = v104;
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_10004C900;
  sub_100049E20();
  uint64_t v115 = v52;
  sub_100033CB4(&qword_10006DE88, (void (*)(uint64_t))&type metadata accessor for ContentShapeKinds);
  sub_100005458(&qword_10006DE90);
  sub_100006E54(&qword_10006DE98, &qword_10006DE90);
  uint64_t v53 = v107;
  uint64_t v54 = v108;
  sub_10004A9C0();
  id v55 = [v97 currentDevice];
  id v56 = [v55 userInterfaceIdiom];

  if (v56 == (id)6) {
    double v27 = 22.0;
  }
  uint64_t v57 = v106;
  v92((char *)v106 + *(int *)(v113 + 28), v94, v93);
  *uint64_t v57 = v27;
  v57[1] = v27;
  uint64_t v58 = (uint64_t)v99;
  uint64_t v59 = (uint64_t)&v99[*(int *)(v101 + 36)];
  uint64_t v60 = v91;
  sub_100033760((uint64_t)v57, v59, (uint64_t (*)(void))v91);
  uint64_t v61 = sub_100005458(&qword_10006DEA0);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v51 + 16))(v59 + *(int *)(v61 + 40), v53, v54);
  *(unsigned char *)(v59 + *(int *)(v61 + 36)) = 0;
  sub_100006524(v50, v58, &qword_10006DE50);
  sub_1000337C8((uint64_t)v57, (uint64_t (*)(void))v60);
  (*(void (**)(unsigned char *, uint64_t))(v51 + 8))(v53, v54);
  sub_100006588(v50, &qword_10006DE50);
  unint64_t v62 = v100;
  long long v126 = *((_OWORD *)v100 + 1);
  char v127 = *((unsigned char *)v100 + 32);
  uint64_t v63 = swift_allocObject();
  long long v64 = *((_OWORD *)v62 + 1);
  *(_OWORD *)(v63 + 16) = *(_OWORD *)v62;
  *(_OWORD *)(v63 + 32) = v64;
  *(unsigned char *)(v63 + 48) = *((unsigned char *)v62 + 32);
  swift_retain();
  sub_100033AB8((uint64_t)&v126);
  sub_100033AEC();
  NSString v65 = v105;
  sub_10004A3E0();
  swift_release();
  sub_100006588(v58, &qword_10006DE58);
  uint64_t v66 = v109;
  uint64_t v67 = v112;
  uint64_t v68 = v65;
  uint64_t v69 = v110;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v109 + 32))(v112, v68, v110);
  uint64_t v113 = sub_100049FD0();
  sub_100031308((long long *)v62, (uint64_t)&v115);
  uint64_t v108 = v115;
  uint64_t v70 = v116;
  uint64_t v107 = (unsigned char *)v117;
  LODWORD(v106) = BYTE8(v117);
  float64x2_t v105 = v118;
  char v71 = v119;
  long long v104 = v120;
  uint64_t v73 = v121;
  uint64_t v72 = v122;
  uint64_t v74 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v66 + 16);
  float64x2_t v75 = v114;
  float64x2_t v76 = v67;
  uint64_t v77 = v69;
  v74(v114, v76, v69);
  float64x2_t v78 = v111;
  v74(v111, v75, v77);
  char v79 = &v78[*(int *)(sub_100005458(&qword_10006DEC0) + 48)];
  *(void *)char v79 = v113;
  *((void *)v79 + 1) = 0;
  v79[16] = 1;
  *((void *)v79 + 3) = v108;
  *((void *)v79 + 4) = v70;
  *((void *)v79 + 5) = v107;
  v79[48] = (_BYTE)v106;
  *((void *)v79 + 7) = v105;
  v79[64] = v71;
  *(_OWORD *)(v79 + 72) = v104;
  *((void *)v79 + 11) = v73;
  *((void *)v79 + 12) = v72;
  char v80 = *(void (**)(unsigned char *, uint64_t))(v66 + 8);
  swift_retain();
  swift_retain();
  v80(v112, v77);
  swift_release();
  swift_release();
  return ((uint64_t (*)(unsigned char *, uint64_t))v80)(v114, v77);
}

uint64_t sub_1000311B4(void *a1)
{
  if (*a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v5 == 2) {
      id v1 = [self clearColor];
    }
    else {
      sub_100018AB4();
    }
    uint64_t v2 = v1;
    id v3 = [objc_allocWithZone((Class)NSItemProvider) initWithObject:v1];

    return (uint64_t)v3;
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100031308@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  long long v16 = *a1;
  uint64_t v4 = swift_allocObject();
  long long v5 = a1[1];
  *(_OWORD *)(v4 + 16) = *a1;
  *(_OWORD *)(v4 + 32) = v5;
  *(unsigned char *)(v4 + 48) = *((unsigned char *)a1 + 32);
  uint64_t v6 = v16;
  sub_10000D1A4((uint64_t)&v16);
  sub_100032C6C();
  sub_100033828(v6);
  sub_10004A640();
  sub_100049D10();
  type metadata accessor for FavoriteColorPickerView.Model();
  sub_100033CB4(&qword_10006DEC8, (void (*)(uint64_t))type metadata accessor for FavoriteColorPickerView.Model);
  sub_100049C70();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = 0;
  uint64_t v8 = 0;
  if (v9 >= 2)
  {
    sub_100049C70();
    uint64_t result = sub_100049D90();
  }
  *(void *)a2 = sub_100033CAC;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v10;
  *(unsigned char *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v15;
  *(void *)(a2 + 64) = result;
  *(void *)(a2 + 72) = v8;
  return result;
}

uint64_t sub_100031530@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for FavoriteColorPickerView.Model();
  sub_100033CB4(&qword_10006DEC8, (void (*)(uint64_t))type metadata accessor for FavoriteColorPickerView.Model);
  sub_100049C70();
  sub_100049D20();
  uint64_t v4 = *a1;
  uint64_t v19 = sub_100033D04(*a1, v5);
  type metadata accessor for ColorPickerState();
  sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t v18 = sub_100049E70();
  uint64_t v7 = v6;
  uint64_t v8 = sub_100049D90();
  uint64_t v10 = v9;
  sub_100028020((uint64_t)_swiftEmptyArrayStorage);
  sub_100005458(&qword_10006DED0);
  sub_10004A4F0();
  char v11 = sub_10004A1C0();
  sub_100049D20();
  sub_100033FB4(v4, v12);
  uint64_t result = sub_100049BF0();
  *(void *)a2 = v18;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v19;
  *(void *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v21;
  *(unsigned char *)(a2 + 56) = v11;
  *(void *)(a2 + 64) = v14;
  *(void *)(a2 + 72) = v15;
  *(void *)(a2 + 80) = v16;
  *(void *)(a2 + 88) = v17;
  *(unsigned char *)(a2 + 96) = 0;
  return result;
}

uint64_t sub_1000316E0@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v9[0] = *(_OWORD *)v1;
  v9[1] = v3;
  LOBYTE(v10) = *(unsigned char *)(v1 + 32);
  id v4 = objc_msgSend(self, "currentDevice", v9[0], v3, v10);
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)6) {
    uint64_t v6 = 0x4038000000000000;
  }
  else {
    uint64_t v6 = 0x4036000000000000;
  }
  *(void *)a1 = sub_100049FD0();
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v7 = sub_100005458(&qword_10006DE00);
  return sub_10002FE68((uint64_t *)v9, a1 + *(int *)(v7 + 44));
}

uint64_t sub_100031790@<X0>(uint64_t a1@<X8>)
{
  return sub_10003180C(&qword_10006C0D0, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_1000317D0@<X0>(uint64_t a1@<X8>)
{
  return sub_10003180C(&qword_10006C408, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_10003180C@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v23 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_100049F60();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005458(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006524(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_10004A880();
    uint64_t v21 = sub_10004A1B0();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_100031FF4(a3, v23, &v24);
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100049F50();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_100031A94@<X0>(uint64_t a1@<X8>)
{
  return sub_10003180C((uint64_t *)&unk_10006DF60, (uint64_t (*)(void))&type metadata accessor for LayoutDirection, 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t sub_100031AD4@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100031AE8()
{
  return sub_100031C9C();
}

double sub_100031AFC@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100031B7C()
{
  return sub_100049B70();
}

uint64_t sub_100031BF8@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100031C0C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100031C88()
{
  return sub_100031C9C();
}

uint64_t sub_100031C9C()
{
  return sub_100049B70();
}

uint64_t sub_100031D0C()
{
  return sub_100049E90();
}

uint64_t sub_100031D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100031DAC(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(char *))&EnvironmentValues.dynamicTypeSize.setter);
}

uint64_t sub_100031D5C()
{
  return sub_100049E80();
}

uint64_t sub_100031D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100031DAC(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100031DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_100031E7C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100031EA4()
{
  return sub_100031C9C();
}

uint64_t type metadata accessor for ColorPickerContent()
{
  uint64_t result = qword_10006DBE8;
  if (!qword_10006DBE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100031F20@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100031F48()
{
  return sub_100031C9C();
}

uint64_t sub_100031F70()
{
  return sub_100049E90();
}

uint64_t sub_100031F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100031DAC(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(char *))&EnvironmentValues.dynamicTypeSize.setter);
}

uint64_t sub_100031FD4(uint64_t result)
{
  if (result != 1) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100031FE4(uint64_t result)
{
  if (result != 1) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100031FF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_1000320C8(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002B050((uint64_t)v12, *a3);
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
      sub_10002B050((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001A168((uint64_t)v12);
  return v7;
}

unint64_t sub_1000320C8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_1000321C8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_10004AA20();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

char *sub_1000321C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_100032260(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100032364(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100032364((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_100032260(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_1000322FC(v2, 0);
      unint64_t result = (void *)sub_10004AA00();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_10004A7B0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000322FC(uint64_t a1, uint64_t a2)
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
  sub_100005458(&qword_10006DD90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  long long v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100032364(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100005458(&qword_10006DD90);
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
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100032450(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100062578;
  v6._object = a2;
  unint64_t v4 = sub_10004AB10(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_10003249C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000324B0);
}

uint64_t sub_1000324B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_100005458(&qword_10006C0D8);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_100032570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100032584);
}

void *sub_100032584(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_100005458(&qword_10006C0D8);
    int64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100032630()
{
  sub_100005F80();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for ColorPickerTabPicker()
{
  return &type metadata for ColorPickerTabPicker;
}

uint64_t sub_1000326D8()
{
  return sub_10003274C(&qword_10006DC20, &qword_10006DB78, (void (*)(void))sub_10003271C);
}

uint64_t sub_10003271C()
{
  return sub_10003274C(&qword_10006DC28, &qword_10006DB70, (void (*)(void))sub_1000327C8);
}

uint64_t sub_10003274C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061E8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000327C8()
{
  unint64_t result = qword_10006DC30;
  if (!qword_10006DC30)
  {
    sub_1000061E8(&qword_10006DB68);
    sub_100032868();
    sub_100006E54(&qword_10006DC48, &qword_10006DC50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC30);
  }
  return result;
}

unint64_t sub_100032868()
{
  unint64_t result = qword_10006DC38;
  if (!qword_10006DC38)
  {
    sub_1000061E8(&qword_10006DB60);
    sub_100006E54(&qword_10006DC40, &qword_10006DB58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC38);
  }
  return result;
}

uint64_t sub_100032908()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100032924()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100032940()
{
  unint64_t result = qword_10006DC70;
  if (!qword_10006DC70)
  {
    sub_1000061E8(&qword_10006DC68);
    sub_1000329E0();
    sub_100006E54(&qword_10006DC98, &qword_10006DCA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC70);
  }
  return result;
}

unint64_t sub_1000329E0()
{
  unint64_t result = qword_10006DC78;
  if (!qword_10006DC78)
  {
    sub_1000061E8(&qword_10006DC80);
    sub_100033CB4(&qword_10006DC88, (void (*)(uint64_t))type metadata accessor for ColorSwatchPickerView);
    sub_100032A8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC78);
  }
  return result;
}

unint64_t sub_100032A8C()
{
  unint64_t result = qword_10006DC90;
  if (!qword_10006DC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DC90);
  }
  return result;
}

unint64_t sub_100032AE0()
{
  unint64_t result = qword_10006DCA8;
  if (!qword_10006DCA8)
  {
    sub_1000061E8(&qword_10006DC58);
    sub_100006E54(&qword_10006DCB0, &qword_10006DCB8);
    sub_100006E54(&qword_10006DCC0, &qword_10006DCC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DCA8);
  }
  return result;
}

uint64_t sub_100032BA4()
{
  return sub_100049E80();
}

uint64_t sub_100032BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100031DAC(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100032C08()
{
  return sub_100049EC0();
}

uint64_t sub_100032C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100031DAC(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

uint64_t sub_100032C6C()
{
  return swift_retain();
}

uint64_t sub_100032C74()
{
  return swift_release();
}

unint64_t sub_100032C7C()
{
  unint64_t result = qword_10006DD28;
  if (!qword_10006DD28)
  {
    sub_1000061E8(&qword_10006DD18);
    sub_100032D28();
    sub_100033CB4(&qword_10006DD58, (void (*)(uint64_t))type metadata accessor for RGBAView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DD28);
  }
  return result;
}

unint64_t sub_100032D28()
{
  unint64_t result = qword_10006DD30;
  if (!qword_10006DD30)
  {
    sub_1000061E8(&qword_10006DD10);
    sub_100032940();
    sub_100032DA4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DD30);
  }
  return result;
}

unint64_t sub_100032DA4()
{
  unint64_t result = qword_10006DD38;
  if (!qword_10006DD38)
  {
    sub_1000061E8(&qword_10006DCF8);
    sub_100032E44();
    sub_100006E54(&qword_10006DC98, &qword_10006DCA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DD38);
  }
  return result;
}

unint64_t sub_100032E44()
{
  unint64_t result = qword_10006DD40;
  if (!qword_10006DD40)
  {
    sub_1000061E8(&qword_10006DD48);
    sub_100032EC0();
    sub_100032A8C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DD40);
  }
  return result;
}

unint64_t sub_100032EC0()
{
  unint64_t result = qword_10006DD50;
  if (!qword_10006DD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DD50);
  }
  return result;
}

uint64_t sub_100032F1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100032F8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100032FF4(uint64_t a1)
{
  return a1;
}

unint64_t sub_10003305C()
{
  unint64_t result = qword_10006DDA8;
  if (!qword_10006DDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DDA8);
  }
  return result;
}

unint64_t sub_1000330B0()
{
  unint64_t result = qword_10006DDB0;
  if (!qword_10006DDB0)
  {
    sub_1000061E8(&qword_10006DDA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DDB0);
  }
  return result;
}

uint64_t destroy for FooterView()
{
  swift_release();

  return sub_100032C74();
}

uint64_t initializeWithCopy for FooterView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_100032C6C();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for FooterView(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = v2[1];
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  sub_100032C6C();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  sub_100032C74();
  return a1;
}

uint64_t assignWithTake for FooterView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  sub_100032C74();
  return a1;
}

uint64_t getEnumTagSinglePayload for FooterView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 33)) {
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

uint64_t storeEnumTagSinglePayload for FooterView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FooterView()
{
  return &type metadata for FooterView;
}

uint64_t sub_100033354(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ColorPickerContent.Visibility(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for ColorPickerContent.Visibility(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ColorPickerContent.Visibility(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorPickerContent.Visibility(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17)) {
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

uint64_t storeEnumTagSinglePayload for ColorPickerContent.Visibility(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorPickerContent.Visibility()
{
  return &type metadata for ColorPickerContent.Visibility;
}

ValueMetadata *type metadata accessor for ColorPickerContent.PlatformBasedAspectRatio()
{
  return &type metadata for ColorPickerContent.PlatformBasedAspectRatio;
}

unint64_t sub_100033514()
{
  unint64_t result = qword_10006DDC8;
  if (!qword_10006DDC8)
  {
    sub_1000061E8(&qword_10006DDD0);
    sub_100032940();
    sub_100032AE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DDC8);
  }
  return result;
}

uint64_t sub_100033590()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100033630()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003364C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100033668()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100033684(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000336B0()
{
  unint64_t result = qword_10006DDF8;
  if (!qword_10006DDF8)
  {
    sub_1000061E8(&qword_10006DDD8);
    sub_100006E54(&qword_10006DDF0, &qword_10006DDE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DDF8);
  }
  return result;
}

uint64_t sub_100033760(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000337C8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100033828(uint64_t a1)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v1 = self;
    id v2 = [v1 currentDevice];
    [v2 userInterfaceIdiom];

    id v3 = [v1 currentDevice];
    [v3 userInterfaceIdiom];
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    sub_100049E50();
    __break(1u);
  }
}

unint64_t sub_1000339B8()
{
  unint64_t result = qword_10006DE70;
  if (!qword_10006DE70)
  {
    sub_1000061E8(&qword_10006DE40);
    sub_100033A58();
    sub_100006E54(&qword_10006C560, &qword_10006C520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DE70);
  }
  return result;
}

unint64_t sub_100033A58()
{
  unint64_t result = qword_10006DE78;
  if (!qword_10006DE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DE78);
  }
  return result;
}

uint64_t sub_100033AB0()
{
  return sub_1000311B4((void *)(v0 + 16));
}

uint64_t sub_100033AB8(uint64_t a1)
{
  return a1;
}

unint64_t sub_100033AEC()
{
  unint64_t result = qword_10006DEA8;
  if (!qword_10006DEA8)
  {
    sub_1000061E8(&qword_10006DE58);
    sub_100033B8C();
    sub_100006E54(&qword_10006DEB8, &qword_10006DEA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DEA8);
  }
  return result;
}

unint64_t sub_100033B8C()
{
  unint64_t result = qword_10006DEB0;
  if (!qword_10006DEB0)
  {
    sub_1000061E8(&qword_10006DE50);
    sub_10003274C(&qword_10006DE68, &qword_10006DE48, (void (*)(void))sub_1000339B8);
    sub_100033CB4((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DEB0);
  }
  return result;
}

uint64_t sub_100033C68()
{
  swift_release();
  sub_100032C74();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_100033CAC@<X0>(uint64_t a1@<X8>)
{
  return sub_100031530((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_100033CB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100033D04(uint64_t a1, double a2)
{
  if (!a1) {
    goto LABEL_27;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  id v3 = self;
  id v4 = [v3 currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  double v6 = 30.0;
  if (v16) {
    double v6 = 28.0;
  }
  if (v5 == (id)6) {
    double v7 = 42.0;
  }
  else {
    double v7 = v6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  id v8 = [v3 currentDevice];
  id v9 = [v8 userInterfaceIdiom];

  double v10 = 18.0;
  if (v15) {
    double v10 = 16.0;
  }
  if (v9 == (id)6) {
    double v11 = 20.0;
  }
  else {
    double v11 = v10;
  }
  if (qword_10006C060 != -1) {
    swift_once();
  }
  double v12 = *(double *)&qword_100072498;
  if (*(double *)&qword_100072498 < a2) {
    double v12 = a2;
  }
  double v13 = (v11 + v12) / (v7 + v11);
  if ((~*(void *)&v13 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v13 >= 9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((uint64_t)v13 + 0x4000000000000000 < 0)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
    return result;
  }
  if (2 * (uint64_t)v13 >= 16) {
    return 16;
  }
  else {
    return 2 * (uint64_t)v13;
  }
}

uint64_t sub_100033FB4(uint64_t a1, double a2)
{
  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    id v4 = self;
    id v5 = [v4 currentDevice];
    [v5 userInterfaceIdiom];

    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    id v6 = [v4 currentDevice];
    [v6 userInterfaceIdiom];

    uint64_t result = sub_100033D04(a1, a2);
    if (qword_10006C060 != -1) {
      return swift_once();
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100033CB4((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100034244()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_100034254(unsigned char *a1)
{
  return sub_10000F82C(a1, *(unsigned char *)(v1 + 16));
}

unint64_t sub_10003425C()
{
  unint64_t result = qword_10006DF00;
  if (!qword_10006DF00)
  {
    sub_1000061E8(&qword_10006DEE8);
    sub_1000342FC();
    sub_100006E54(&qword_10006DF28, &qword_10006DF30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DF00);
  }
  return result;
}

unint64_t sub_1000342FC()
{
  unint64_t result = qword_10006DF08;
  if (!qword_10006DF08)
  {
    sub_1000061E8(&qword_10006DEE0);
    sub_100034378();
    sub_100034418();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DF08);
  }
  return result;
}

unint64_t sub_100034378()
{
  unint64_t result = qword_10006DF10;
  if (!qword_10006DF10)
  {
    sub_1000061E8(&qword_10006DED8);
    sub_100006E54(&qword_10006DF18, &qword_10006DEF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DF10);
  }
  return result;
}

unint64_t sub_100034418()
{
  unint64_t result = qword_10006DF20;
  if (!qword_10006DF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DF20);
  }
  return result;
}

unint64_t sub_100034470()
{
  unint64_t result = qword_10006DF38;
  if (!qword_10006DF38)
  {
    sub_1000061E8(&qword_10006DF40);
    sub_100006E54(&qword_10006DDF0, &qword_10006DDE8);
    sub_1000336B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DF38);
  }
  return result;
}

uint64_t sub_100034510()
{
  return sub_100006E54(&qword_10006DF48, &qword_10006DF50);
}

unint64_t sub_100034550()
{
  unint64_t result = qword_10006DF58;
  if (!qword_10006DF58)
  {
    sub_1000061E8(&qword_10006DEF0);
    sub_10003425C();
    sub_100033CB4((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006DF58);
  }
  return result;
}

id sub_100034600(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color;
  double v10 = self;
  double v11 = v4;
  *(void *)&v4[v9] = [v10 blackColor];
  double v12 = &v11[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_onDelete];
  *(void *)double v12 = 0;
  *((void *)v12 + 1) = 0;
  *(void *)&v11[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell____lazy_storage___deleteInteraction] = 0;
  uint64_t v13 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_colorView;
  *(void *)&v11[v13] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v14 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_blackHalfView;
  type metadata accessor for ShapeView();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  *(void *)&v11[v14] = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v16 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_maskShapeView;
  *(void *)&v11[v16] = [objc_allocWithZone(ObjCClassFromMetadata) init];

  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  id v17 = objc_msgSendSuper2(&v19, "initWithFrame:", a1, a2, a3, a4);
  sub_100034948();

  return v17;
}

id sub_100034770(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color;
  id v4 = self;
  id v5 = v1;
  *(void *)&v1[v3] = [v4 blackColor];
  id v6 = &v5[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_onDelete];
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&v5[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell____lazy_storage___deleteInteraction] = 0;
  uint64_t v7 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_colorView;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v8 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_blackHalfView;
  type metadata accessor for ShapeView();
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  *(void *)&v5[v8] = [objc_allocWithZone(ObjCClassFromMetadata) init];
  uint64_t v10 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_maskShapeView;
  *(void *)&v5[v10] = [objc_allocWithZone(ObjCClassFromMetadata) init];

  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  id v11 = objc_msgSendSuper2(&v15, "initWithCoder:", a1);
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    sub_100034948();
  }
  return v12;
}

id sub_1000348D0()
{
  uint64_t v1 = OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell____lazy_storage___deleteInteraction;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell____lazy_storage___deleteInteraction);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell____lazy_storage___deleteInteraction);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIEditMenuInteraction) initWithDelegate:v0];
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_100034948()
{
  id v1 = [v0 contentView];
  id v2 = self;
  id v3 = [v2 whiteColor];
  [v1 setBackgroundColor:v3];

  id v4 = [v0 contentView];
  id v5 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_blackHalfView];
  [v4 addSubview:v5];

  id v6 = [v0 contentView];
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_colorView];
  [v6 addSubview:v7];

  id v8 = [v0 contentView];
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_maskShapeView];
  [v8 setMaskView:v9];

  [v7 setBackgroundColor:*(void *)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_color]];
  id v10 = [v2 blackColor];
  id v11 = [v5 layer];
  self;
  id v12 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v10) {
    id v13 = [v10 CGColor];
  }
  else {
    id v13 = 0;
  }
  [v12 setFillColor:v13];

  id v14 = [v2 blackColor];
  id v15 = [v9 layer];
  self;
  uint64_t v16 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (v14) {
    id v17 = [v14 CGColor];
  }
  else {
    id v17 = 0;
  }
  [v16 setFillColor:v17];

  id v18 = sub_1000348D0();
  [v0 addInteraction:v18];
}

void sub_100034CD4()
{
  id v1 = v0;
  v35.receiver = v0;
  v35.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  objc_msgSendSuper2(&v35, "layoutSubviews");
  [v0 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_colorView], "setFrame:");
  id v10 = *(char **)&v0[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_blackHalfView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
  id v11 = *(char **)&v1[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker21FavoriteColorWellCell_maskShapeView];
  objc_msgSend(v11, "setFrame:", v3, v5, v7, v9);
  id v12 = [objc_allocWithZone((Class)UIBezierPath) init];
  v36.origin.double x = v3;
  v36.origin.double y = v5;
  v36.size.double width = v7;
  v36.size.double height = v9;
  double MinX = CGRectGetMinX(v36);
  v37.origin.double x = v3;
  v37.origin.double y = v5;
  v37.size.double width = v7;
  v37.size.double height = v9;
  objc_msgSend(v12, "moveToPoint:", MinX, CGRectGetMinY(v37));
  v38.origin.double x = v3;
  v38.origin.double y = v5;
  v38.size.double width = v7;
  v38.size.double height = v9;
  double v14 = CGRectGetMinX(v38);
  v39.origin.double x = v3;
  v39.origin.double y = v5;
  v39.size.double width = v7;
  v39.size.double height = v9;
  objc_msgSend(v12, "addLineToPoint:", v14, CGRectGetMinY(v39));
  v40.origin.double x = v3;
  v40.origin.double y = v5;
  v40.size.double width = v7;
  v40.size.double height = v9;
  double v15 = CGRectGetMinX(v40);
  v41.origin.double x = v3;
  v41.origin.double y = v5;
  v41.size.double width = v7;
  v41.size.double height = v9;
  objc_msgSend(v12, "addLineToPoint:", v15, CGRectGetMaxY(v41));
  v42.origin.double x = v3;
  v42.origin.double y = v5;
  v42.size.double width = v7;
  v42.size.double height = v9;
  double MaxX = CGRectGetMaxX(v42);
  v43.origin.double x = v3;
  v43.origin.double y = v5;
  v43.size.double width = v7;
  v43.size.double height = v9;
  objc_msgSend(v12, "addLineToPoint:", MaxX, CGRectGetMinY(v43));
  v44.origin.double x = v3;
  v44.origin.double y = v5;
  v44.size.double width = v7;
  v44.size.double height = v9;
  double v17 = CGRectGetMinX(v44);
  v45.origin.double x = v3;
  v45.origin.double y = v5;
  v45.size.double width = v7;
  v45.size.double height = v9;
  objc_msgSend(v12, "addLineToPoint:", v17, CGRectGetMinY(v45));
  [v12 closePath];
  id v18 = *(void **)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath];
  *(void *)&v10[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath] = v12;
  id v19 = v12;

  sub_100010574();
  os_log_type_t v20 = self;
  id v21 = objc_msgSend(v20, "bezierPathWithOvalInRect:", v3, v5, v7, v9);
  if ([v1 isSelected])
  {
    v46.origin.double x = v3;
    v46.origin.double y = v5;
    v46.size.double width = v7;
    v46.size.double height = v9;
    CGRect v47 = CGRectInset(v46, 3.0, 3.0);
    double x = v47.origin.x;
    double y = v47.origin.y;
    double width = v47.size.width;
    double height = v47.size.height;
    v47.origin.double x = v3;
    v47.origin.double y = v5;
    v47.size.double width = v7;
    v47.size.double height = v9;
    CGRect v48 = CGRectInset(v47, 6.0, 6.0);
    double v26 = v48.origin.x;
    double v27 = v48.origin.y;
    double v28 = v48.size.width;
    double v29 = v48.size.height;
    id v30 = objc_msgSend(v20, "bezierPathWithOvalInRect:", x, y, width, height);
    id v31 = [v30 bezierPathByReversingPath];

    [v21 appendPath:v31];
    id v32 = objc_msgSend(v20, "bezierPathWithOvalInRect:", v26, v27, v28, v29);
    [v21 appendPath:v32];
  }
  uint64_t v33 = *(void **)&v11[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath];
  *(void *)&v11[OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath] = v21;
  id v34 = v21;

  sub_100010574();
}

id sub_1000353C4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FavoriteColorWellCell()
{
  return self;
}

uint64_t sub_1000354AC(uint64_t a1)
{
  uint64_t v2 = sub_100005458(&qword_10006E028);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003550C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10003551C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100035554()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000355D8()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for SystemCloseButton.Coordinator()
{
  return self;
}

void *assignWithCopy for SystemCloseButton(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SystemCloseButton(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemCloseButton(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemCloseButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemCloseButton()
{
  return &type metadata for SystemCloseButton;
}

uint64_t sub_100035740@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  type metadata accessor for SystemCloseButton.Coordinator();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a1 = v5;

  return swift_retain();
}

uint64_t sub_100035798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100035888();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000357FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100035888();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100035860()
{
}

unint64_t sub_100035888()
{
  unint64_t result = qword_10006E0F0;
  if (!qword_10006E0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E0F0);
  }
  return result;
}

id sub_1000358DC()
{
  uint64_t v0 = sub_100005458(&qword_10006E0F8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = [self buttonWithType:7];
  sub_100005458(&qword_10006E100);
  sub_10004A150();
  [v3 addTarget:v10[1] action:"primaryAction" forControlEvents:0x2000];
  swift_release();
  id v4 = [self currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)6)
  {
    sub_100035A84();
    id v6 = v3;
    sub_100049AF0();
    uint64_t v7 = sub_100049B00();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 0, 1, v7);
    double v8 = (void *)sub_10004A870();
    [v6 setHoverStyle:v8];
  }
  return v3;
}

unint64_t sub_100035A84()
{
  unint64_t result = qword_10006E108;
  if (!qword_10006E108)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006E108);
  }
  return result;
}

uint64_t *sub_100035AC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  id v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    uint64_t *v4 = *a2;
    id v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = *(int *)(a3 + 24);
    double v9 = (uint64_t *)((char *)a1 + v8);
    id v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_100049DB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *double v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
  }
  return v4;
}

uint64_t sub_100035C00(uint64_t a1, uint64_t a2)
{
  return sub_10003F044(a1, a2, &qword_10006C0D0, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_100035C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  double v9 = (void *)(a2 + v7);
  swift_retain();
  sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100049DB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_100035D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_100006588(a1 + v6, &qword_10006C0D0);
    sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100049DB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_100035E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100049DB0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_100035F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_100006588(a1 + v6, &qword_10006C0D0);
    uint64_t v9 = sub_100005458(&qword_10006C0D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100049DB0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_10003603C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100036050);
}

uint64_t sub_100036050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_100005458(&qword_10006C0D8);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_100036110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100036124);
}

uint64_t sub_100036124(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_100005458(&qword_10006C0D8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ColorSlider(uint64_t a1)
{
  return sub_10003E7C0(a1, qword_10006E180);
}

void sub_1000361F0()
{
  sub_10003F70C(319, (unint64_t *)&qword_10006C158, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1000362B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000362D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v50 = a1;
  uint64_t v49 = sub_10004A140();
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  CGRect v44 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CPSlider(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_100005458(&qword_10006E2F0);
  __chkstk_darwin(v45);
  uint64_t v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100005458(&qword_10006E2F8);
  uint64_t v46 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005458(&qword_10006E300);
  __chkstk_darwin(v12 - 8);
  CGRect v43 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003CF30((uint64_t)v2, (uint64_t)v7, type metadata accessor for CPSlider);
  uint64_t v14 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  v41[1] = v15 + v6;
  v41[0] = v14 | 7;
  uint64_t v16 = swift_allocObject();
  uint64_t v42 = v15;
  sub_10003CA58((uint64_t)v7, v16 + v15, type metadata accessor for CPSlider);
  id v17 = [self currentDevice];
  [v17 userInterfaceIdiom];

  sub_10004A640();
  sub_100049D10();
  uint64_t v58 = sub_10003DE74;
  unint64_t v59 = v16;
  uint64_t v60 = v65;
  char v61 = v66;
  uint64_t v62 = v67;
  char v63 = v68;
  long long v64 = v69;
  if (*(unsigned __int8 *)v2 >= 3u)
  {
    id v18 = &type metadata for PercentageSliderControlStyle;
    id v19 = &off_100063F70;
    id v56 = &type metadata for PercentageSliderControlStyle;
    uint64_t v57 = &off_100063F70;
    os_log_type_t v20 = (void *)swift_allocObject();
    _OWORD v20[2] = sub_100038C3C;
    v20[3] = 0;
    v20[4] = sub_100038D10;
    v20[5] = 0;
    id v21 = sub_100039094;
  }
  else
  {
    id v18 = &type metadata for IntegerSliderControlStyle;
    id v19 = &off_100063F50;
    id v56 = &type metadata for IntegerSliderControlStyle;
    uint64_t v57 = &off_100063F50;
    os_log_type_t v20 = (void *)swift_allocObject();
    _OWORD v20[2] = sub_100039514;
    v20[3] = 0;
    v20[4] = sub_1000395FC;
    v20[5] = 0;
    id v21 = sub_1000396EC;
  }
  v20[6] = v21;
  v20[7] = 0;
  v55[0] = v20;
  sub_10001A0D0(v55, (uint64_t)v18);
  uint64_t v22 = (uint64_t (*)(uint64_t, double))((uint64_t (__cdecl *)())v19[1])();
  uint64_t v23 = v2[2];
  uint64_t v24 = v2[3];
  uint64_t v51 = v2[1];
  uint64_t v52 = v23;
  uint64_t v53 = v24;
  sub_100005458(&qword_10006E308);
  uint64_t v25 = sub_10004A550();
  uint64_t v26 = v22(v25, v54);
  uint64_t v28 = v27;
  swift_release();
  uint64_t v51 = v26;
  uint64_t v52 = v28;
  sub_100006678();
  uint64_t v29 = sub_10004A2F0();
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  sub_10001A168((uint64_t)v55);
  sub_100005458(&qword_10006E310);
  sub_10003DEA0();
  sub_10004A350();
  sub_100006720(v29, v31, v33);
  swift_bridgeObjectRelease();
  swift_release();
  id v34 = v44;
  sub_10004A130();
  unint64_t v35 = sub_10003DF40();
  CGRect v36 = (uint64_t (*)(uint64_t))v45;
  sub_10004A3C0();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v49);
  sub_100006588((uint64_t)v9, &qword_10006E2F0);
  sub_10003CF30((uint64_t)v2, (uint64_t)v7, type metadata accessor for CPSlider);
  uint64_t v37 = swift_allocObject();
  sub_10003CA58((uint64_t)v7, v37 + v42, type metadata accessor for CPSlider);
  uint64_t v58 = v36;
  unint64_t v59 = v35;
  swift_getOpaqueTypeConformance2();
  uint64_t v38 = (uint64_t)v43;
  uint64_t v39 = v48;
  sub_10004A3D0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v11, v39);
  return sub_100006730(v38, v50, &qword_10006E300);
}

uint64_t sub_1000369D4@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v5 = type metadata accessor for CPSlider(0);
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = *(void *)(v44 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v43 = (uint64_t)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100049D30();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = sub_10004A0E0();
  __chkstk_darwin(v10);
  uint64_t v11 = sub_100049C40();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v47 = v11;
  uint64_t v48 = v12;
  __chkstk_darwin(v11);
  CGRect v41 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100005458(&qword_10006C4B8);
  uint64_t v51 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v42 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005458(&qword_10006C4C0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v52 = v15;
  uint64_t v53 = v16;
  __chkstk_darwin(v15);
  uint64_t v46 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100005458(&qword_10006E338);
  __chkstk_darwin(v50);
  id v19 = (uint64_t *)((char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  *id v19 = sub_10004A640();
  v19[1] = v20;
  uint64_t v21 = (uint64_t)v19 + *(int *)(sub_100005458(&qword_10006E340) + 44);
  CGRect v40 = a2;
  sub_100037078(a2, a1, v21);
  sub_10004A110();
  sub_100049C20();
  uint64_t v22 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1;
  uint64_t v24 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v22, v23, v7);
  uint64_t v39 = type metadata accessor for CPSlider;
  uint64_t v25 = v43;
  sub_10003CF30((uint64_t)a2, v43, type metadata accessor for CPSlider);
  unint64_t v26 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v27 = *(unsigned __int8 *)(v44 + 80);
  unint64_t v28 = (v9 + v27 + v26) & ~v27;
  uint64_t v44 = v27 | 7;
  uint64_t v29 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v29 + v26, v22, v24);
  uint64_t v30 = v25;
  sub_10003CA58(v25, v29 + v28, type metadata accessor for CPSlider);
  sub_10003D114(&qword_10006C528, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_10003D114(&qword_10006C530, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  uint64_t v31 = v41;
  char v32 = v42;
  uint64_t v33 = v47;
  sub_10004A600();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v31, v33);
  sub_10003CF30((uint64_t)v40, v30, v39);
  uint64_t v34 = swift_allocObject();
  sub_10003CA58(v30, v34 + ((v27 + 16) & ~v27), type metadata accessor for CPSlider);
  sub_100006E54(&qword_10006C538, &qword_10006C4B8);
  unint64_t v35 = v46;
  uint64_t v36 = v49;
  sub_10004A5F0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v36);
  sub_100049C60();
  sub_100006E54(&qword_10006E348, &qword_10006E338);
  sub_100006E54(&qword_10006C578, &qword_10006C4C0);
  uint64_t v37 = v52;
  sub_10004A3F0();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v37);
  return sub_100006588((uint64_t)v19, &qword_10006E338);
}

uint64_t sub_100037078@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v92[1] = a2;
  uint64_t v98 = a1;
  uint64_t v110 = a3;
  uint64_t v93 = type metadata accessor for PositionModifier(0);
  __chkstk_darwin(v93);
  uint64_t v95 = (void *)((char *)v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v97 = sub_100005458(&qword_10006E350);
  __chkstk_darwin(v97);
  uint64_t v96 = (char *)v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_100005458(&qword_10006E358);
  uint64_t v106 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  unsigned int v94 = (char *)v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005458(&qword_10006E360);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v109 = (uint64_t)v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v107 = (uint64_t)v92 - v10;
  uint64_t v11 = sub_100005458(&qword_10006E368);
  __chkstk_darwin(v11 - 8);
  uint64_t v104 = (uint64_t)v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10004A5B0();
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  unsigned __int8 v100 = (char *)v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v92 - v16;
  uint64_t v18 = sub_100005458(&qword_10006E370);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (void *)((char *)v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = sub_100005458(&qword_10006E378);
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)v92 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100005458(&qword_10006E380);
  uint64_t v25 = v24 - 8;
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)v92 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_100005458(&qword_10006E388);
  __chkstk_darwin(v102);
  uint64_t v101 = (char *)v92 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100005458(&qword_10006E390);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  uint64_t v105 = (uint64_t)v92 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v103 = (char *)v92 - v33;
  __chkstk_darwin(v32);
  unint64_t v35 = (char *)v92 - v34;
  *uint64_t v20 = sub_10004A640();
  v20[1] = v36;
  uint64_t v37 = sub_100005458(&qword_10006E398);
  sub_100037B94(a1, (uint64_t)v20 + *(int *)(v37 + 44));
  sub_100006524((uint64_t)v20, (uint64_t)v23, &qword_10006E370);
  sub_100006588((uint64_t)v20, &qword_10006E370);
  uint64_t v38 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v39 = sub_100049F90();
  CGRect v40 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104);
  v40(v17, v38, v39);
  uint64_t v41 = *(int *)(v25 + 44);
  uint64_t v42 = (uint64_t)v27;
  float64x2_t v99 = v27;
  uint64_t v43 = (uint64_t)&v27[v41];
  sub_10003CF30((uint64_t)v17, v43, (uint64_t (*)(void))&type metadata accessor for Capsule);
  *(_WORD *)(v43 + *(int *)(sub_100005458(&qword_10006E3A0) + 36)) = 256;
  sub_100006524((uint64_t)v23, v42, &qword_10006E378);
  sub_10003D164((uint64_t)v17, (uint64_t (*)(void))&type metadata accessor for Capsule);
  sub_100006588((uint64_t)v23, &qword_10006E378);
  uint64_t v44 = v100;
  v40(v100, v38, v39);
  uint64_t v45 = v98;
  LODWORD(v38) = *v98;
  uint64_t v46 = self;
  uint64_t v47 = &selRef_systemGrayColor;
  if (v38 != 3) {
    uint64_t v47 = &selRef_clearColor;
  }
  id v48 = [v46 *v47];
  sub_10004A400();
  uint64_t v49 = sub_10004A450();
  swift_release();
  id v50 = [self currentTraitCollection];
  [v50 displayScale];

  sub_100049C80();
  uint64_t v51 = (uint64_t)v44;
  uint64_t v52 = (uint64_t)v44;
  uint64_t v53 = v104;
  sub_10003CF30(v52, v104, (uint64_t (*)(void))&type metadata accessor for Capsule);
  uint64_t v54 = v53 + *(int *)(sub_100005458(&qword_10006E3A8) + 36);
  long long v55 = v120;
  *(_OWORD *)uint64_t v54 = v119;
  *(_OWORD *)(v54 + 16) = v55;
  *(void *)(v54 + 32) = v121;
  uint64_t v56 = sub_100005458(&qword_10006E3B0);
  *(void *)(v53 + *(int *)(v56 + 52)) = v49;
  *(_WORD *)(v53 + *(int *)(v56 + 56)) = 256;
  uint64_t v57 = sub_10004A640();
  uint64_t v59 = v58;
  uint64_t v60 = (uint64_t *)(v53 + *(int *)(sub_100005458(&qword_10006E3B8) + 36));
  *uint64_t v60 = v57;
  v60[1] = v59;
  sub_10003D164(v51, (uint64_t (*)(void))&type metadata accessor for Capsule);
  uint64_t v61 = sub_10004A640();
  uint64_t v63 = v62;
  uint64_t v64 = (uint64_t)v101;
  uint64_t v65 = (uint64_t)&v101[*(int *)(v102 + 36)];
  sub_100006524(v53, v65, &qword_10006E368);
  char v66 = (uint64_t *)(v65 + *(int *)(sub_100005458(&qword_10006E3C0) + 36));
  *char v66 = v61;
  v66[1] = v63;
  uint64_t v67 = (uint64_t)v99;
  sub_100006524((uint64_t)v99, v64, &qword_10006E380);
  sub_100006588(v53, &qword_10006E368);
  sub_100006588(v67, &qword_10006E380);
  sub_10003E4C0();
  uint64_t v68 = (uint64_t)v103;
  sub_10004A360();
  sub_100006588(v64, &qword_10006E388);
  sub_100006730(v68, (uint64_t)v35, &qword_10006E390);
  if (*(void *)((char *)v45 + *(int *)(type metadata accessor for CPSlider(0) + 32)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v118 == 2)
    {
      uint64_t v69 = 1;
      uint64_t v70 = v107;
    }
    else
    {
      uint64_t v71 = v114;
      uint64_t v72 = v115;
      uint64_t v73 = v116;
      uint64_t v74 = v117;
      char v75 = v118 & 1;
      uint64_t v76 = v45[2];
      uint64_t v77 = v45[3];
      uint64_t v111 = v45[1];
      uint64_t v112 = v76;
      uint64_t v113 = v77;
      sub_100005458(&qword_10006E308);
      sub_10004A580();
      uint64_t v78 = v114;
      uint64_t v79 = v115;
      uint64_t v80 = v116;
      sub_100049D20();
      id v81 = v95;
      *uint64_t v95 = v78;
      v81[1] = v79;
      v81[2] = v80;
      v81[3] = v82;
      v81[4] = v83;
      uint64_t v84 = (void *)((char *)v81 + *(int *)(v93 + 24));
      *uint64_t v84 = swift_getKeyPath();
      sub_100005458((uint64_t *)&unk_10006DF60);
      swift_storeEnumTagMultiPayload();
      uint64_t v85 = (uint64_t)v96;
      sub_10003CF30((uint64_t)v81, (uint64_t)&v96[*(int *)(v97 + 36)], type metadata accessor for PositionModifier);
      *(void *)uint64_t v85 = v71;
      *(void *)(v85 + 8) = v72;
      *(void *)(v85 + 16) = v73;
      *(void *)(v85 + 24) = v74;
      *(unsigned char *)(v85 + 32) = v75;
      sub_10003D164((uint64_t)v81, type metadata accessor for PositionModifier);
      sub_10004A670();
      sub_10003E6A0();
      uint64_t v86 = (uint64_t)v94;
      sub_10004A330();
      sub_100006588(v85, &qword_10006E350);
      uint64_t v70 = v107;
      sub_100006730(v86, v107, &qword_10006E358);
      uint64_t v69 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v106 + 56))(v70, v69, 1, v108);
    uint64_t v87 = v105;
    sub_100006524((uint64_t)v35, v105, &qword_10006E390);
    uint64_t v88 = v109;
    sub_100006524(v70, v109, &qword_10006E360);
    uint64_t v89 = v110;
    sub_100006524(v87, v110, &qword_10006E390);
    uint64_t v90 = sub_100005458(&qword_10006E3F8);
    sub_100006524(v88, v89 + *(int *)(v90 + 48), &qword_10006E360);
    sub_100006588(v70, &qword_10006E360);
    sub_100006588((uint64_t)v35, &qword_10006E390);
    sub_100006588(v88, &qword_10006E360);
    return sub_100006588(v87, &qword_10006E390);
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_10003D114((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100037B94@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = sub_10004A410();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  *(void *)&long long v35 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v35 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = type metadata accessor for OpacityBackground(0);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (void *)((char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_100005458(&qword_10006E418);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v35 - v20;
  if (*a1 == 3)
  {
    *uint64_t v15 = 0x4028000000000000;
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v11, enum case for Color.RGBColorSpace.displayP3(_:), v3);
    v15[1] = sub_10004A470();
    uint64_t v22 = (void *)((char *)v15 + *(int *)(v12 + 24));
    *uint64_t v22 = swift_getKeyPath();
    sub_100005458(&qword_10006C408);
    swift_storeEnumTagMultiPayload();
    sub_10003CA58((uint64_t)v15, (uint64_t)v21, type metadata accessor for OpacityBackground);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v21, 0, 1, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))((char *)&v35 - v20, 1, 1, v12);
  }
  sub_100005458(&qword_10006E420);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_10004EB90;
  sub_100038004((uint64_t)&v37);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  unsigned int v25 = enum case for Color.RGBColorSpace.displayP3(_:);
  unsigned int v26 = enum case for Color.RGBColorSpace.sRGB(_:);
  if (v38) {
    uint64_t v27 = enum case for Color.RGBColorSpace.displayP3(_:);
  }
  else {
    uint64_t v27 = enum case for Color.RGBColorSpace.sRGB(_:);
  }
  v24(v9, v27, v3);
  *(void *)(v23 + 32) = sub_10004A470();
  sub_10003826C((uint64_t)&v39);
  if (v40) {
    uint64_t v28 = v25;
  }
  else {
    uint64_t v28 = v26;
  }
  v24((char *)v35, v28, v3);
  *(void *)(v23 + 40) = sub_10004A470();
  uint64_t v41 = v23;
  sub_10004A7F0();
  sub_10004A610();
  sub_10004A680();
  sub_10004A690();
  sub_100049D80();
  sub_100006524((uint64_t)v21, (uint64_t)v19, &qword_10006E418);
  uint64_t v29 = v41;
  long long v35 = v42;
  uint64_t v30 = v43;
  uint64_t v31 = v44;
  uint64_t v32 = v36;
  sub_100006524((uint64_t)v19, v36, &qword_10006E418);
  uint64_t v33 = v32 + *(int *)(sub_100005458(&qword_10006E428) + 48);
  *(void *)uint64_t v33 = v29;
  *(_OWORD *)(v33 + 8) = v35;
  *(void *)(v33 + 24) = v30;
  *(void *)(v33 + 32) = v31;
  swift_bridgeObjectRetain();
  sub_100006588((uint64_t)v21, &qword_10006E418);
  swift_bridgeObjectRelease();
  return sub_100006588((uint64_t)v19, &qword_10006E418);
}

void sub_100038004(uint64_t a1@<X8>)
{
  if (!*(void *)&v1[*(int *)(type metadata accessor for CPSlider(0) + 32)])
  {
    type metadata accessor for ColorPickerState();
    sub_10003D114((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    sub_100049E50();
    __break(1u);
    JUMPOUT(0x10003825CLL);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  if (v17 != 2)
  {
    uint64_t v8 = v13;
    uint64_t v7 = v14;
    char v11 = v17 & 1;
    double v10 = 1.0;
    uint64_t v9 = v15;
    goto LABEL_11;
  }
  id v3 = [self blackColor];
  uint64_t v4 = (CGColor *)[v3 CGColor];
  uint64_t v5 = CGColorGetColorSpace(v4);

  if (v5)
  {
    char v6 = sub_100019954(v5);
    if (v6 != 2)
    {
      sub_100019828(v3, v6 & 1, (uint64_t)&v13);
      uint64_t v8 = v13;
      uint64_t v7 = v14;
      uint64_t v9 = v15;
      double v10 = v16;
      char v11 = v17;

      goto LABEL_11;
    }
  }
  if (qword_10006C058 != -1) {
    swift_once();
  }
  sub_100019828(v3, byte_100072488, (uint64_t)&v13);
  uint64_t v8 = v13;
  uint64_t v7 = v14;
  uint64_t v9 = v15;
  double v10 = v16;
  char v11 = v17;
LABEL_11:
  uint64_t v12 = 0;
  switch(*v1)
  {
    case 1:
      uint64_t v7 = 0;
      goto LABEL_15;
    case 2:
      uint64_t v9 = 0;
      goto LABEL_15;
    case 3:
      double v10 = 0.0;
LABEL_15:
      uint64_t v12 = v8;
      break;
    default:
      break;
  }
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v9;
  *(double *)(a1 + 24) = v10;
  *(unsigned char *)(a1 + 32) = v11;
}

void sub_10003826C(uint64_t a1@<X8>)
{
  if (!*(void *)&v1[*(int *)(type metadata accessor for CPSlider(0) + 32)])
  {
    type metadata accessor for ColorPickerState();
    sub_10003D114((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    sub_100049E50();
    __break(1u);
    JUMPOUT(0x1000384C4);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  if (v17 != 2)
  {
    double v8 = v13;
    double v7 = v14;
    char v11 = v17 & 1;
    double v10 = 1.0;
    double v9 = v15;
    goto LABEL_11;
  }
  id v3 = [self blackColor];
  uint64_t v4 = (CGColor *)[v3 CGColor];
  uint64_t v5 = CGColorGetColorSpace(v4);

  if (v5)
  {
    char v6 = sub_100019954(v5);
    if (v6 != 2)
    {
      sub_100019828(v3, v6 & 1, (uint64_t)&v13);
      double v8 = v13;
      double v7 = v14;
      double v9 = v15;
      double v10 = v16;
      char v11 = v17;

      goto LABEL_11;
    }
  }
  if (qword_10006C058 != -1) {
    swift_once();
  }
  sub_100019828(v3, byte_100072488, (uint64_t)&v13);
  double v8 = v13;
  double v7 = v14;
  double v9 = v15;
  double v10 = v16;
  char v11 = v17;
LABEL_11:
  double v12 = 1.0;
  switch(*v1)
  {
    case 1:
      double v7 = 1.0;
      goto LABEL_15;
    case 2:
      double v9 = 1.0;
      goto LABEL_15;
    case 3:
      double v10 = 1.0;
LABEL_15:
      double v12 = v8;
      break;
    default:
      break;
  }
  *(double *)a1 = v12;
  *(double *)(a1 + 8) = v7;
  *(double *)(a1 + 16) = v9;
  *(double *)(a1 + 24) = v10;
  *(unsigned char *)(a1 + 32) = v11;
}

uint64_t sub_1000384D4()
{
  return sub_10004A560();
}

uint64_t sub_1000385F8()
{
  return sub_10004A560();
}

uint64_t sub_10003864C(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_10004A180();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for AccessibilityAdjustmentDirection.increment(_:))
  {
    uint64_t v9 = a2[1];
    uint64_t v10 = a2[2];
    uint64_t v11 = a2[3];
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v11;
    sub_100005458(&qword_10006E308);
    sub_10004A550();
    double v12 = fmin(v17 + 0.1, 1.0);
LABEL_6:
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v11;
    double v17 = v12;
    return sub_10004A560();
  }
  if (v8 == enum case for AccessibilityAdjustmentDirection.decrement(_:))
  {
    uint64_t v9 = a2[1];
    uint64_t v10 = a2[2];
    uint64_t v11 = a2[3];
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v11;
    sub_100005458(&qword_10006E308);
    sub_10004A550();
    double v12 = v17 + -0.1;
    if (v17 + -0.1 < 0.0) {
      double v12 = 0.0;
    }
    goto LABEL_6;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

double sub_100038830()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100049DD0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  int v8 = (char *)v14 - v7;
  type metadata accessor for PositionModifier(0);
  sub_100031A94((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for LayoutDirection.rightToLeft(_:), v2);
  char v9 = sub_100049DC0();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  uint64_t v11 = v1[1];
  uint64_t v12 = v1[2];
  v14[0] = *v1;
  v14[1] = v11;
  _OWORD v14[2] = v12;
  sub_100005458(&qword_10006E308);
  sub_10004A550();
  if (v9) {
    return 1.0 - v15;
  }
  else {
    return v15;
  }
}

uint64_t sub_1000389E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = *(double *)(v2 + 32);
  double v6 = v5 * 0.5;
  double v7 = v5 * 0.5 + sub_100038830() * (*(double *)(v2 + 24) - v5);
  uint64_t v8 = sub_100005458(&qword_10006E578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  uint64_t result = sub_100005458(&qword_10006E580);
  uint64_t v10 = (double *)(a2 + *(int *)(result + 36));
  double *v10 = v7;
  v10[1] = v6;
  return result;
}

id sub_100038A90()
{
  id result = sub_100038AB0();
  qword_10006E110 = (uint64_t)result;
  return result;
}

id sub_100038AB0()
{
  uint64_t v0 = sub_100049940();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  sub_100049930();
  Class isa = sub_100049920().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  [v4 setLocale:isa];

  [v4 setAllowsFloats:0];
  [v4 setNumberStyle:3];
  [v4 setMinimumFractionDigits:0];
  [v4 setMaximumFractionDigits:0];
  return v4;
}

id sub_100038C08()
{
  id result = [objc_allocWithZone((Class)NSNumberFormatter) init];
  qword_10006E118 = (uint64_t)result;
  return result;
}

uint64_t sub_100038C3C(double a1)
{
  id v1 = [objc_allocWithZone((Class)NSNumber) initWithDouble:a1];
  if (qword_10006C068 != -1) {
    swift_once();
  }
  id v2 = [(id)qword_10006E110 stringFromNumber:v1];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_10004A740();
  }
  else
  {

    return 0;
  }
  return v4;
}

uint64_t sub_100038D10(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1000498E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v33 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  double v13 = (char *)&v32 - v12;
  __chkstk_darwin(v11);
  double v15 = (char *)&v32 - v14;
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  uint64_t v16 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v16 = a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v34 = a1;
  unint64_t v35 = a2;
  uint64_t v36 = 0;
  uint64_t v37 = v16;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_10004A7A0();
  if (v18)
  {
    uint64_t v19 = v17;
    uint64_t v20 = v18;
    uint64_t v21 = (void (**)(char *, char *, uint64_t))(v5 + 16);
    uint64_t v22 = (void (**)(char *, uint64_t))(v5 + 8);
    do
    {
      sub_1000498B0();
      sub_1000498C0();
      (*v21)(v33, v15, v4);
      sub_10003D114(&qword_10006E218, (void (*)(uint64_t))&type metadata accessor for CharacterSet);
      sub_10004A9A0();
      sub_10003D114(&qword_10006E220, (void (*)(uint64_t))&type metadata accessor for CharacterSet);
      char v24 = sub_10004A6F0();
      unsigned int v25 = *v22;
      (*v22)(v10, v4);
      v25(v13, v4);
      v25(v15, v4);
      if (v24)
      {
        v40._countAndFlagsBits = v19;
        v40._object = v20;
        sub_10004A780(v40);
      }
      swift_bridgeObjectRelease();
      uint64_t v19 = sub_10004A7A0();
      uint64_t v20 = v23;
    }
    while (v23);
  }
  swift_bridgeObjectRelease();
  if (qword_10006C070 != -1) {
    swift_once();
  }
  unsigned int v26 = (void *)qword_10006E118;
  NSString v27 = sub_10004A700();
  swift_bridgeObjectRelease();
  id v28 = [v26 numberFromString:v27];

  if (!v28) {
    return 0;
  }
  id v29 = [v28 integerValue];

  double v30 = (double)(uint64_t)v29 / 100.0;
  if (v30 < 0.0) {
    double v30 = 0.0;
  }
  return fmin(v30, 1.0);
}

uint64_t sub_100039094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((sub_100039168(a1, a2) & 1) == 0) {
    return 1;
  }
  NSString v6 = sub_10004A700();
  NSString v7 = sub_10004A700();
  id v8 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", a3, a4, v7);

  uint64_t v9 = sub_10004A740();
  uint64_t v11 = v10;

  LOBYTE(v8) = sub_100039168(v9, v11);
  swift_bridgeObjectRelease();
  return v8 & 1;
}

id sub_100039168(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v2 = sub_1000498E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  NSString v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v21 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  double v15 = (char *)&v21 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v21 - v16;
  sub_1000498C0();
  sub_1000498A0();
  if (qword_10006C068 != -1) {
    swift_once();
  }
  id result = objc_msgSend((id)qword_10006E110, "percentSymbol", v21, v22);
  if (result)
  {
    uint64_t v19 = result;
    sub_10004A740();

    sub_1000498B0();
    swift_bridgeObjectRelease();
    sub_1000498D0();
    sub_1000498D0();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
    v20(v6, v2);
    sub_1000498B0();
    LOBYTE(v19) = sub_100049890();
    v20(v6, v2);
    v20(v9, v2);
    v20(v12, v2);
    v20(v15, v2);
    v20(v17, v2);
    return (id)(v19 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000393F4()
{
  uint64_t v0 = sub_100049940();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  sub_100049930();
  Class isa = sub_100049920().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  [v4 setLocale:isa];

  id result = [v4 setAllowsFloats:0];
  qword_10006E120 = (uint64_t)v4;
  return result;
}

uint64_t sub_100039514(double a1)
{
  double v1 = round(a1 * 255.0);
  if (qword_10006C078 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_10006E120;
  id v3 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v1];
  id v4 = [v2 stringFromNumber:v3];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_10004A740();

  return v5;
}

uint64_t sub_1000395FC()
{
  if (qword_10006C078 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10006E120;
  NSString v1 = sub_10004A700();
  id v2 = [v0 numberFromString:v1];

  if (!v2) {
    return 0;
  }
  id v3 = [v2 integerValue];

  double v4 = fmin((double)(uint64_t)v3 / 255.0, 1.0);
  if (v4 < 0.0) {
    double v4 = 0.0;
  }
  return *(void *)&v4;
}

BOOL sub_1000396EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_1000498E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v20 - v11;
  NSString v13 = sub_10004A700();
  NSString v14 = sub_10004A700();
  id v15 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", a3, a4, v14);

  sub_10004A740();
  sub_1000498B0();
  sub_1000498C0();
  if (sub_100049890())
  {
    uint64_t v16 = sub_10004A770();
    swift_bridgeObjectRelease();

    uint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    v17(v10, v6);
    v17(v12, v6);
    return v16 < 4;
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
    v19(v10, v6);
    v19(v12, v6);
    return 0;
  }
}

uint64_t sub_1000398F0()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t sub_100039920()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t sub_100039950()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t sub_100039980@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100005458(&qword_10006E1C0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100049FE0();
  id v7 = [self currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  uint64_t v9 = 0x4014000000000000;
  if (v8 == (id)6) {
    uint64_t v9 = 0x4020000000000000;
  }
  *(void *)uint64_t v5 = v6;
  *((void *)v5 + 1) = v9;
  v5[16] = 0;
  uint64_t v10 = sub_100005458(&qword_10006E1C8);
  sub_100039A90(v1, (uint64_t)&v5[*(int *)(v10 + 44)]);
  return sub_100006730((uint64_t)v5, a1, &qword_10006E1C0);
}

uint64_t sub_100039A90@<X0>(uint64_t (*a1)(double *a1)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = a2;
  uint64_t v76 = sub_100005458(&qword_10006E1D0);
  __chkstk_darwin(v76);
  uint64_t v78 = (void *)((char *)v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_100005458(&qword_10006E1D8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v80 = (char *)v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v79 = (uint64_t)v71 - v7;
  uint64_t v8 = sub_100049DB0();
  uint64_t v73 = *(void *)(v8 - 8);
  uint64_t v74 = v8;
  __chkstk_darwin(v8);
  uint64_t v72 = (uint64_t)v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005458(&qword_10006E1E0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v77 = (uint64_t)v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v71[0] = (char *)v71 - v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v71 - v15;
  uint64_t v17 = self;
  id v18 = [v17 currentDevice];
  id v19 = [v18 userInterfaceIdiom];

  uint64_t v82 = a1;
  uint64_t v20 = sub_10003B258();
  uint64_t v22 = v20;
  uint64_t v23 = v21;
  if (v19 != (id)6)
  {
    uint64_t v83 = v20;
    uint64_t v84 = v21;
    sub_100006678();
    uint64_t v22 = sub_10004A980();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v23 = v25;
  }
  uint64_t v83 = v22;
  uint64_t v84 = v23;
  v71[1] = sub_100006678();
  uint64_t v26 = sub_10004A2F0();
  uint64_t v28 = v27;
  char v30 = v29;
  id v31 = [v17 currentDevice];
  id v32 = [v31 userInterfaceIdiom];

  char v75 = v16;
  if (v32 == (id)6) {
    sub_10004A250();
  }
  else {
    sub_10004A240();
  }
  uint64_t v33 = sub_10004A2E0();
  uint64_t v35 = v34;
  char v37 = v36;
  swift_release();
  sub_100006720(v26, v28, v30 & 1);
  swift_bridgeObjectRelease();
  type metadata accessor for ColorSlider(0);
  uint64_t v38 = sub_10004A2C0();
  uint64_t v40 = v39;
  char v42 = v41;
  sub_100006720(v33, v35, v37 & 1);
  swift_bridgeObjectRelease();
  id v43 = [v17 currentDevice];
  id v44 = [v43 userInterfaceIdiom];

  if (v44 == (id)6) {
    sub_10004A440();
  }
  else {
    sub_10004A460();
  }
  char v45 = v42 & 1;
  uint64_t v46 = sub_10004A2D0();
  uint64_t v48 = v47;
  char v50 = v49;
  uint64_t v52 = v51;
  swift_release();
  sub_100006720(v38, v40, v45);
  swift_bridgeObjectRelease();
  uint64_t v83 = v46;
  uint64_t v84 = v48;
  char v85 = v50 & 1;
  uint64_t v86 = v52;
  uint64_t v53 = v71[0];
  sub_10004A360();
  sub_100006720(v46, v48, v50 & 1);
  swift_bridgeObjectRelease();
  uint64_t v54 = (uint64_t)v75;
  sub_100006730(v53, (uint64_t)v75, &qword_10006E1E0);
  uint64_t v55 = v72;
  sub_100031790(v72);
  LOBYTE(v53) = sub_100049DA0();
  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v55, v74);
  if (v53)
  {
    uint64_t v83 = sub_100049FD0();
    uint64_t v84 = 0;
    char v85 = 1;
    sub_10000F6B8();
  }
  else
  {
    uint64_t v83 = sub_100049F80();
    uint64_t v84 = 0x4030000000000000;
    char v85 = 0;
    sub_10000F664();
  }
  uint64_t v56 = sub_10004A660();
  uint64_t v57 = (uint64_t)v78;
  uint64_t *v78 = v56;
  uint64_t v58 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>))(v57 + *(int *)(v76 + 44));
  swift_retain();
  sub_10003A12C(v82, v58);
  uint64_t v83 = sub_10003B258();
  uint64_t v84 = v59;
  uint64_t v60 = sub_10004A2F0();
  uint64_t v62 = v61;
  char v64 = v63 & 1;
  sub_10003C834();
  uint64_t v65 = (uint64_t)v80;
  sub_10004A340();
  sub_100006720(v60, v62, v64);
  swift_bridgeObjectRelease();
  sub_100006588(v57, &qword_10006E1D0);
  uint64_t v66 = v79;
  sub_100006730(v65, v79, &qword_10006E1D8);
  uint64_t v67 = v77;
  sub_100006524(v54, v77, &qword_10006E1E0);
  sub_100006524(v66, v65, &qword_10006E1D8);
  uint64_t v68 = v81;
  sub_100006524(v67, v81, &qword_10006E1E0);
  uint64_t v69 = sub_100005458(&qword_10006E200);
  sub_100006524(v65, v68 + *(int *)(v69 + 48), &qword_10006E1D8);
  swift_release();
  sub_100006588(v66, &qword_10006E1D8);
  sub_100006588(v54, &qword_10006E1E0);
  sub_100006588(v65, &qword_10006E1D8);
  return sub_100006588(v67, &qword_10006E1E0);
}

uint64_t sub_10003A12C@<X0>(uint64_t (*a1)(double *a1)@<X0>, uint64_t (*a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v3 = type metadata accessor for ColorSlider(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for CPSlider(0) - 8;
  uint64_t v7 = __chkstk_darwin(v88);
  uint64_t v9 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v93 = (uint64_t)&v74 - v10;
  unsigned int v94 = a1;
  LODWORD(v87) = *(unsigned __int8 *)a1;
  *((void *)&v91 + 1) = type metadata accessor for ColorSlider;
  sub_10003CF30((uint64_t)a1, (uint64_t)v6, type metadata accessor for ColorSlider);
  *(void *)&long long v91 = sub_10004A840();
  uint64_t v11 = sub_10004A830();
  uint64_t v89 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v90 = v5;
  uint64_t v12 = (v89 + 32) & ~v89;
  uint64_t v86 = v12 + v5;
  uint64_t v83 = v89 | 7;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = &protocol witness table for MainActor;
  uint64_t v81 = type metadata accessor for ColorSlider;
  uint64_t v82 = v12;
  sub_10003CA58((uint64_t)v6, v13 + v12, type metadata accessor for ColorSlider);
  sub_10003CF30((uint64_t)v94, (uint64_t)v6, *((uint64_t (**)(void))&v91 + 1));
  uint64_t v14 = sub_10004A830();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = &protocol witness table for MainActor;
  uint64_t v16 = (uint64_t)v6;
  sub_10003CA58((uint64_t)v6, v15 + v12, type metadata accessor for ColorSlider);
  sub_10004A590();
  uint64_t v17 = *((void *)&v109 + 1);
  uint64_t v85 = v109;
  uint64_t v18 = v110;
  id v19 = v94;
  uint64_t v20 = type metadata accessor for ColorPickerState();
  uint64_t v21 = sub_10003D114((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  sub_100049E40();
  swift_getKeyPath();
  sub_100049E60();
  swift_release();
  swift_release();
  long long v22 = v109;
  char v23 = v110;
  *uint64_t v9 = v87;
  *((void *)v9 + 1) = v85;
  *((void *)v9 + 2) = v17;
  *((void *)v9 + 3) = v18;
  *((_OWORD *)v9 + 2) = v22;
  v9[48] = v23;
  uint64_t v24 = v88;
  uint64_t v25 = (uint64_t *)&v9[*(int *)(v88 + 36)];
  *uint64_t v25 = swift_getKeyPath();
  sub_100005458((uint64_t *)&unk_10006DF60);
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = (uint64_t *)&v9[*(int *)(v24 + 40)];
  uint64_t v85 = v20;
  uint64_t v87 = v21;
  *uint64_t v26 = sub_100049E70();
  v26[1] = v27;
  uint64_t v92 = v9;
  sub_10003CA58((uint64_t)v9, v93, type metadata accessor for CPSlider);
  uint64_t v28 = v16;
  char v29 = (uint64_t (*)(void))*((void *)&v91 + 1);
  sub_10003CF30((uint64_t)v19, v16, *((uint64_t (**)(void))&v91 + 1));
  uint64_t v30 = sub_10004A830();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  *(void *)(v31 + 24) = &protocol witness table for MainActor;
  uint64_t v33 = v81;
  uint64_t v32 = v82;
  sub_10003CA58(v28, v31 + v82, v81);
  sub_10003CF30((uint64_t)v94, v28, v29);
  uint64_t v34 = sub_10004A830();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v34;
  *(void *)(v35 + 24) = &protocol witness table for MainActor;
  uint64_t v36 = v35 + v32;
  uint64_t v37 = v28;
  sub_10003CA58(v28, v36, v33);
  sub_10004A590();
  long long v91 = v109;
  uint64_t v38 = v110;
  if (*(unsigned __int8 *)v94 >= 3u)
  {
    *((void *)&v98 + 1) = &type metadata for PercentageSliderControlStyle;
    *(void *)&long long v99 = &off_100063F70;
    uint64_t v39 = (void *)swift_allocObject();
    v39[2] = sub_100038C3C;
    v39[3] = 0;
    v39[4] = sub_100038D10;
    v39[5] = 0;
    uint64_t v40 = sub_100039094;
  }
  else
  {
    *((void *)&v98 + 1) = &type metadata for IntegerSliderControlStyle;
    *(void *)&long long v99 = &off_100063F50;
    uint64_t v39 = (void *)swift_allocObject();
    v39[2] = sub_100039514;
    v39[3] = 0;
    v39[4] = sub_1000395FC;
    v39[5] = 0;
    uint64_t v40 = sub_1000396EC;
  }
  v39[6] = v40;
  v39[7] = 0;
  uint64_t v41 = v89;
  *(void *)&long long v97 = v39;
  sub_100005458(&qword_10006E208);
  LODWORD(v88) = swift_dynamicCast();
  if (v88)
  {
    swift_release();
    swift_release();
    swift_release();
  }
  char v42 = v94;
  sub_10003CF30((uint64_t)v94, v37, type metadata accessor for ColorSlider);
  uint64_t v43 = (v41 + 16) & ~v41;
  uint64_t v90 = swift_allocObject();
  sub_10003CA58(v37, v90 + v43, type metadata accessor for ColorSlider);
  sub_10003CF30((uint64_t)v42, v37, type metadata accessor for ColorSlider);
  uint64_t v89 = swift_allocObject();
  sub_10003CA58(v37, v89 + v43, type metadata accessor for ColorSlider);
  sub_10003CF30((uint64_t)v42, v37, type metadata accessor for ColorSlider);
  uint64_t v83 = swift_allocObject();
  sub_10003CA58(v37, v83 + v43, type metadata accessor for ColorSlider);
  uint64_t v44 = sub_100049E70();
  uint64_t v86 = v45;
  LOBYTE(v97) = 0;
  sub_10004A4F0();
  LODWORD(v82) = v109;
  uint64_t v81 = (uint64_t (*)(uint64_t))*((void *)&v109 + 1);
  sub_10003B0BC();
  id v46 = [self defaultMetrics];
  id v47 = [self currentDevice];
  id v48 = [v47 userInterfaceIdiom];

  double v49 = 36.0;
  if (v48 == (id)6) {
    double v49 = 44.0;
  }
  [v46 scaledValueForValue:v49];

  sub_10004A640();
  sub_100049D10();
  if (*((void *)v42 + 1))
  {
    uint64_t v87 = v136;
    uint64_t v79 = v134;
    uint64_t v80 = v137;
    uint64_t v85 = v132;
    unsigned __int8 v96 = v133;
    unsigned __int8 v95 = v135;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    int v50 = v111;
    swift_release();
    sub_10000DC3C(v50 != 2);
    uint64_t v51 = sub_10004A400();
    int v52 = sub_10004A1D0();
    unsigned __int8 v53 = v96;
    int v76 = v52;
    int v77 = v96;
    unsigned __int8 v54 = v95;
    int v78 = v95;
    uint64_t v55 = (uint64_t)v92;
    sub_10003CF30(v93, (uint64_t)v92, type metadata accessor for CPSlider);
    uint64_t v56 = v84;
    sub_10003CF30(v55, (uint64_t)v84, type metadata accessor for CPSlider);
    uint64_t v57 = (_OWORD *)((char *)v56 + *(int *)(sub_100005458(&qword_10006E210) + 48));
    *(void *)&long long v97 = v44;
    *((void *)&v97 + 1) = v86;
    long long v98 = v91;
    *(void *)&long long v99 = v38;
    BYTE8(v99) = 1;
    BYTE9(v99) = v88;
    unsigned int v94 = sub_10003CBE8;
    *(void *)&long long v100 = 8;
    *((void *)&v100 + 1) = sub_10003CBE8;
    uint64_t v75 = v44;
    uint64_t v84 = sub_10003CDBC;
    *(void *)&long long v101 = v90;
    *((void *)&v101 + 1) = sub_10003CDBC;
    *(void *)&long long v102 = v89;
    *((void *)&v102 + 1) = sub_10003CE78;
    uint64_t v58 = v83;
    *(void *)&long long v103 = v83;
    char v59 = v82;
    BYTE8(v103) = v82;
    uint64_t v60 = v81;
    *(void *)&long long v104 = v81;
    *((void *)&v104 + 1) = v85;
    LOBYTE(v105) = v53;
    uint64_t v61 = v79;
    uint64_t v62 = v80;
    *((void *)&v105 + 1) = v79;
    LOBYTE(v106) = v54;
    *((void *)&v106 + 1) = v87;
    *(void *)&long long v107 = v80;
    *((void *)&v107 + 1) = v51;
    char v63 = v76;
    LOBYTE(v108) = v76;
    *((void *)&v108 + 1) = 0x4020000000000000;
    long long v64 = v101;
    long long v65 = v102;
    long long v66 = v104;
    v57[6] = v103;
    v57[7] = v66;
    v57[4] = v64;
    v57[5] = v65;
    long long v67 = v97;
    long long v68 = v98;
    long long v69 = v100;
    v57[2] = v99;
    v57[3] = v69;
    *uint64_t v57 = v67;
    v57[1] = v68;
    long long v70 = v105;
    long long v71 = v106;
    long long v72 = v108;
    v57[10] = v107;
    v57[11] = v72;
    v57[8] = v70;
    v57[9] = v71;
    sub_10003CF98((uint64_t)&v97);
    sub_10003D164(v93, type metadata accessor for CPSlider);
    *(void *)&long long v109 = v75;
    *((void *)&v109 + 1) = v86;
    long long v110 = v91;
    uint64_t v111 = v38;
    char v112 = 1;
    char v113 = v88;
    uint64_t v114 = 8;
    uint64_t v115 = v94;
    uint64_t v116 = v90;
    uint64_t v117 = v84;
    uint64_t v118 = v89;
    long long v119 = sub_10003CE78;
    uint64_t v120 = v58;
    char v121 = v59;
    uint64_t v122 = v60;
    uint64_t v123 = v85;
    char v124 = v77;
    uint64_t v125 = v61;
    char v126 = v78;
    uint64_t v127 = v87;
    uint64_t v128 = v62;
    uint64_t v129 = v51;
    char v130 = v63;
    uint64_t v131 = 0x4020000000000000;
    sub_10003D02C((uint64_t)&v109);
    return sub_10003D164((uint64_t)v92, type metadata accessor for CPSlider);
  }
  else
  {
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_10003AC30(double *a1, unsigned __int8 *a2)
{
  double v2 = *a1;
  if (*a2 >= 3u)
  {
    uint64_t v3 = &type metadata for PercentageSliderControlStyle;
    uint64_t v4 = &off_100063F70;
    uint64_t v11 = &type metadata for PercentageSliderControlStyle;
    uint64_t v12 = &off_100063F70;
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = sub_100038C3C;
    long long v5[3] = 0;
    v5[4] = sub_100038D10;
    v5[5] = 0;
    uint64_t v6 = sub_100039094;
  }
  else
  {
    uint64_t v3 = &type metadata for IntegerSliderControlStyle;
    uint64_t v4 = &off_100063F50;
    uint64_t v11 = &type metadata for IntegerSliderControlStyle;
    uint64_t v12 = &off_100063F50;
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = sub_100039514;
    long long v5[3] = 0;
    v5[4] = sub_1000395FC;
    v5[5] = 0;
    uint64_t v6 = sub_1000396EC;
  }
  v5[6] = v6;
  v5[7] = 0;
  v10[0] = v5;
  sub_10001A0D0(v10, (uint64_t)v3);
  uint64_t v7 = (uint64_t (*)(double))((uint64_t (__cdecl *)())v4[1])();
  uint64_t v8 = v7(v2);
  swift_release();
  sub_10001A168((uint64_t)v10);
  return v8;
}

uint64_t sub_10003AD9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  if (*a3 >= 3u)
  {
    uint64_t v7 = &type metadata for PercentageSliderControlStyle;
    uint64_t v8 = &off_100063F70;
    uint64_t v17 = &type metadata for PercentageSliderControlStyle;
    uint64_t v18 = &off_100063F70;
    uint64_t v9 = (void *)swift_allocObject();
    _OWORD v9[2] = sub_100038C3C;
    v9[3] = 0;
    v9[4] = sub_100038D10;
    v9[5] = 0;
    uint64_t v10 = sub_100039094;
  }
  else
  {
    uint64_t v7 = &type metadata for IntegerSliderControlStyle;
    uint64_t v8 = &off_100063F50;
    uint64_t v17 = &type metadata for IntegerSliderControlStyle;
    uint64_t v18 = &off_100063F50;
    uint64_t v9 = (void *)swift_allocObject();
    _OWORD v9[2] = sub_100039514;
    v9[3] = 0;
    v9[4] = sub_1000395FC;
    v9[5] = 0;
    uint64_t v10 = sub_1000396EC;
  }
  v9[6] = v10;
  v9[7] = 0;
  v16[0] = v9;
  sub_10001A0D0(v16, (uint64_t)v7);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((uint64_t (__cdecl *)())v8[2])();
  uint64_t v12 = v11(a1, a2);
  char v14 = v13;
  swift_release();
  *(void *)a4 = v12;
  *(unsigned char *)(a4 + 8) = v14 & 1;
  return sub_10001A168((uint64_t)v16);
}

uint64_t sub_10003AF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7)
{
  if (*a7 >= 3u)
  {
    char v13 = &type metadata for PercentageSliderControlStyle;
    char v14 = &off_100063F70;
    uint64_t v21 = &type metadata for PercentageSliderControlStyle;
    long long v22 = &off_100063F70;
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = sub_100038C3C;
    v15[3] = 0;
    v15[4] = sub_100038D10;
    v15[5] = 0;
    uint64_t v16 = sub_100039094;
  }
  else
  {
    char v13 = &type metadata for IntegerSliderControlStyle;
    char v14 = &off_100063F50;
    uint64_t v21 = &type metadata for IntegerSliderControlStyle;
    long long v22 = &off_100063F50;
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = sub_100039514;
    v15[3] = 0;
    v15[4] = sub_1000395FC;
    v15[5] = 0;
    uint64_t v16 = sub_1000396EC;
  }
  v15[6] = v16;
  v15[7] = 0;
  v20[0] = v15;
  sub_10001A0D0(v20, (uint64_t)v13);
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((uint64_t (__cdecl *)())v14[3])();
  char v18 = v17(a1, a2, a3, a4, a5, a6);
  swift_release();
  sub_10001A168((uint64_t)v20);
  return v18 & 1;
}

void sub_10003B0BC()
{
  id v1 = [self currentDevice];
  id v2 = [v1 userInterfaceIdiom];

  id v3 = [self defaultMetrics];
  if (v2 == (id)6)
  {
    [v3 scaledValueForValue:88.0];
LABEL_7:

    return;
  }
  if (*(void *)(v0 + 8))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    double v4 = 76.0;
    if (v5) {
      double v4 = 70.0;
    }
    [v3 scaledValueForValue:v4];
    goto LABEL_7;
  }
  type metadata accessor for ColorPickerState();
  sub_10003D114((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  sub_100049E50();
  __break(1u);
}

uint64_t sub_10003B258()
{
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = sub_10004A700();
  NSString v3 = sub_10004A700();
  id v4 = [v1 localizedStringForKey:v2 value:0 table:v3];

  uint64_t v5 = sub_10004A740();
  return v5;
}

uint64_t sub_10003B450@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ColorSlider(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 8)) {
    goto LABEL_10;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v14;
  uint64_t v8 = v15;
  uint64_t v9 = v16;
  uint64_t v10 = v17;
  int v11 = v18;
  sub_10003CF30(a1, (uint64_t)v6, type metadata accessor for ColorSlider);
  if (v11 != 2) {
    goto LABEL_5;
  }
  if (!*((void *)v6 + 1))
  {
LABEL_10:
    type metadata accessor for ColorPickerState();
    sub_10003D114((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    sub_100049E50();
    __break(1u);
    JUMPOUT(0x10003B688);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v14;
  uint64_t v8 = v15;
  uint64_t v9 = v16;
  uint64_t v10 = v17;
LABEL_5:
  uint64_t result = sub_10003D164((uint64_t)v6, type metadata accessor for ColorSlider);
  switch(*(unsigned char *)a1)
  {
    case 1:
      uint64_t v7 = v8;
      break;
    case 2:
      uint64_t v7 = v9;
      break;
    case 3:
      uint64_t v7 = v10;
      break;
    default:
      break;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_10003B698(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for ColorSlider(0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a4 + 8)) {
    goto LABEL_13;
  }
  uint64_t v9 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B60();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v11 = v18;
  uint64_t v10 = v19;
  uint64_t v13 = v20;
  uint64_t v12 = v21;
  int v14 = v22;
  sub_10003CF30(a4, (uint64_t)v8, type metadata accessor for ColorSlider);
  if (v14 == 2)
  {
    if (*((void *)v8 + 1))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100049B60();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v11 = v18;
      uint64_t v10 = v19;
      uint64_t v13 = v20;
      uint64_t v12 = v21;
      unsigned __int8 v15 = v22;
      goto LABEL_6;
    }
LABEL_13:
    type metadata accessor for ColorPickerState();
    sub_10003D114((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    sub_100049E50();
    __break(1u);
    JUMPOUT(0x10003B938);
  }
  unsigned __int8 v15 = v14 & 1;
LABEL_6:
  sub_10003D164((uint64_t)v8, type metadata accessor for ColorSlider);
  if (!*(void *)(a4 + 8)) {
    goto LABEL_13;
  }
  switch(*(unsigned char *)a4)
  {
    case 1:
      uint64_t v10 = v9;
      goto LABEL_11;
    case 2:
      uint64_t v13 = v9;
      goto LABEL_11;
    case 3:
      uint64_t v12 = v9;
LABEL_11:
      uint64_t v9 = v11;
      break;
    default:
      break;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  uint64_t v20 = v13;
  uint64_t v21 = v12;
  unsigned __int8 v22 = v15;
  swift_retain();
  return sub_100049B70();
}

uint64_t sub_10003B948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100049E00();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *v2;
  uint64_t v10 = (char *)v8 + *(int *)(v6 + 28);
  uint64_t v11 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v12 = sub_100049F90();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  void *v8 = v9;
  v8[1] = v9;
  uint64_t v13 = a2 + *(int *)(sub_100005458(&qword_10006E2E0) + 36);
  sub_10003CF30((uint64_t)v8, v13, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v13 + *(int *)(sub_100005458(&qword_10006C520) + 36)) = 256;
  uint64_t v14 = sub_100005458(&qword_10006E2E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(a2, a1, v14);
  return sub_10003D164((uint64_t)v8, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
}

uint64_t sub_10003BAD0@<X0>(uint64_t a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_100049FD0();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v6 = sub_100005458(&qword_10006E588);
  return sub_10003BB2C(a2, a1, a3 + *(int *)(v6 + 44));
}

uint64_t sub_10003BB2C@<X0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v5 = sub_100049D30();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = type metadata accessor for OpacityBackground(0);
  uint64_t v24 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v24 + 64);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100005458(&qword_10006E590);
  uint64_t v11 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v13 = (char *)&KeyPath - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_100049D20();
  double v16 = v15 / *a1;
  if ((~*(void *)&v16 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v16 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v16 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v17 = (uint64_t)v16;
  if ((uint64_t)v16 <= 2) {
    uint64_t v17 = 2;
  }
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    goto LABEL_12;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t v27 = 0;
    uint64_t v28 = v19;
    uint64_t KeyPath = swift_getKeyPath();
    sub_10003CF30((uint64_t)a1, (uint64_t)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&KeyPath - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v5);
    unint64_t v20 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    unint64_t v21 = (v9 + *(unsigned __int8 *)(v6 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v22 = swift_allocObject();
    sub_10003CA58((uint64_t)v10, v22 + v20, type metadata accessor for OpacityBackground);
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v22 + v21, (char *)&KeyPath - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    sub_100005458(&qword_10006C4F8);
    sub_100005458(&qword_10006E598);
    sub_10000BD18();
    sub_100006E54(&qword_10006E5A0, &qword_10006E598);
    sub_10004A5E0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(v26, v13, v25);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_10003BEC8@<X0>(uint64_t *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  *(void *)a3 = sub_100049F80();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v6 = sub_100005458(&qword_10006E5A8);
  return sub_10003BF2C(a2, v5, a3 + *(int *)(v6 + 44));
}

uint64_t sub_10003BF2C@<X0>(double *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OpacityBackground(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = sub_100005458(&qword_10006E5B0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_100049D20();
  double v15 = v14 / *a1;
  if ((~*(void *)&v15 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v15 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v15 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v16 = (uint64_t)v15;
  if ((uint64_t)v15 <= 2) {
    uint64_t v16 = 2;
  }
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    goto LABEL_12;
  }
  if ((v18 & 0x8000000000000000) == 0)
  {
    v21[0] = 0;
    v21[1] = v18;
    swift_getKeyPath();
    sub_10003CF30((uint64_t)a1, (uint64_t)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
    unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v20 = swift_allocObject();
    sub_10003CA58((uint64_t)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, type metadata accessor for OpacityBackground);
    *(void *)(v20 + ((v8 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
    sub_100005458(&qword_10006C4F8);
    sub_100005458(&qword_10006E5B8);
    sub_10000BD18();
    sub_10003FE9C();
    sub_10004A5E0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v12, v9);
  }
LABEL_13:
  __break(1u);
  return result;
}

double sub_10003C1F0@<D0>(void *a1@<X0>, char a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v4 = sub_10003C290(a2, *a1);
  sub_10004A640();
  sub_100049D10();
  *(void *)a3 = v4;
  *(_WORD *)(a3 + 8) = 256;
  *(void *)(a3 + 16) = v6;
  *(unsigned char *)(a3 + 24) = v7;
  *(void *)(a3 + 32) = v8;
  *(unsigned char *)(a3 + 40) = v9;
  double result = *(double *)&v10;
  *(_OWORD *)(a3 + 48) = v10;
  return result;
}

uint64_t sub_10003C290(char a1, char a2)
{
  uint64_t v4 = sub_100049C10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  long long v10 = (char *)&v14 - v9;
  type metadata accessor for OpacityBackground(0);
  sub_1000317D0((uint64_t)v10);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for ColorScheme.dark(_:), v4);
  char v11 = sub_100049C00();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  if (v11)
  {
    uint64_t result = sub_10004A430();
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t result = sub_10004A440();
    if (a2)
    {
LABEL_3:
      if ((a1 & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  if (a1) {
    return result;
  }
LABEL_4:
  swift_release();
  return swift_retain();
}

uint64_t sub_10003C41C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v16[0] = a1;
  v16[1] = a2;
  uint64_t v2 = sub_100005458(&qword_10006E618);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005458(&qword_10006E620);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005458(&qword_10006E628);
  __chkstk_darwin(v9);
  char v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [self currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  if (v13 == (id)6)
  {
    v14(v11, (char *)v16[0], v2);
    *(void *)&v11[*(int *)(v9 + 36)] = 0x3FC999999999999ALL;
    sub_100006524((uint64_t)v11, (uint64_t)v8, &qword_10006E628);
    swift_storeEnumTagMultiPayload();
    sub_100040158();
    sub_100006E54(&qword_10006E638, &qword_10006E618);
    sub_10004A0D0();
    return sub_100006588((uint64_t)v11, &qword_10006E628);
  }
  else
  {
    v14(v5, (char *)v16[0], v2);
    v14(v8, v5, v2);
    swift_storeEnumTagMultiPayload();
    sub_100040158();
    sub_100006E54(&qword_10006E638, &qword_10006E618);
    sub_10004A0D0();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_10003C720@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(a1 - 8);
  sub_10003CF30(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for OpacityBackground);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_10003CA58((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for OpacityBackground);
  *a2 = sub_10003F978;
  a2[1] = (uint64_t (*)(uint64_t))v7;
  return result;
}

unint64_t sub_10003C834()
{
  unint64_t result = qword_10006E1E8;
  if (!qword_10006E1E8)
  {
    sub_1000061E8(&qword_10006E1D0);
    sub_100006E54(&qword_10006DCB0, &qword_10006DCB8);
    sub_100006E54(&qword_10006E1F0, &qword_10006E1F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E1E8);
  }
  return result;
}

uint64_t type metadata accessor for CPSlider(uint64_t a1)
{
  return sub_10003E7C0(a1, (uint64_t *)&unk_10006E288);
}

uint64_t sub_10003C924()
{
  id v1 = (int *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[8];
  sub_100005458(&qword_10006C0D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100049DB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003CA58(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003CAC4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10003B450(v4, a1);
}

uint64_t sub_10003CB3C(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10003B698(a1, v4, v5, v6);
}

uint64_t sub_10003CBB4()
{
  return sub_10003CC8C(type metadata accessor for ColorSlider, &qword_10006C0D0, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_10003CBE8(double *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v4 = (unsigned __int8 *)(v1
                         + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  return sub_10003AC30(a1, v4);
}

uint64_t sub_10003CC58()
{
  return sub_10003CC8C(type metadata accessor for ColorSlider, &qword_10006C0D0, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_10003CC8C(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = (int *)(a1(0) - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v7 + 16) & ~v7;
  uint64_t v9 = *(void *)(*(void *)v6 + 64);
  swift_release();
  uint64_t v10 = v3 + v8 + v6[8];
  sub_100005458(a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = a3(0);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v3, v8 + v9, v7 | 7);
}

uint64_t sub_10003CDBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v8 = (unsigned __int8 *)(v3
                         + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)));

  return sub_10003AD9C(a1, a2, v8, a3);
}

uint64_t sub_10003CE44()
{
  return sub_10003CC8C(type metadata accessor for ColorSlider, &qword_10006C0D0, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize);
}

uint64_t sub_10003CE78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *(void *)(type metadata accessor for ColorSlider(0) - 8);
  uint64_t v14 = (unsigned __int8 *)(v6
                          + ((*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)));

  return sub_10003AF1C(a1, a2, a3, a4, a5, a6, v14);
}

uint64_t sub_10003CF30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003CF98(uint64_t a1)
{
  return a1;
}

uint64_t sub_10003D02C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10003D0C4()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10003D114(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003D164(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for IntegerSliderControlStyle()
{
  return &type metadata for IntegerSliderControlStyle;
}

uint64_t _s27com_apple_UIKit_ColorPicker25IntegerSliderControlStyleVwxx_0()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t _s27com_apple_UIKit_ColorPicker25IntegerSliderControlStyleVwcp_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *_s27com_apple_UIKit_ColorPicker25IntegerSliderControlStyleVwca_0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *_s27com_apple_UIKit_ColorPicker25IntegerSliderControlStyleVwta_0(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t _s27com_apple_UIKit_ColorPicker25IntegerSliderControlStyleVwet_0(uint64_t *a1, int a2)
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

uint64_t sub_10003D3B4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PercentageSliderControlStyle()
{
  return &type metadata for PercentageSliderControlStyle;
}

ValueMetadata *type metadata accessor for ColorSlider.PlatformBasedShapeModifier()
{
  return &type metadata for ColorSlider.PlatformBasedShapeModifier;
}

void *sub_10003D420(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v7;
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v8;
    uint64_t v9 = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = (void *)(a1 + v10);
    id v12 = (uint64_t *)((char *)a2 + v10);
    *(void *)(a1 + 40) = v9;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100005458((uint64_t *)&unk_10006DF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_100049DD0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 32);
    uint64_t v16 = (void *)((char *)v4 + v15);
    BOOL v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    *uint64_t v16 = v18;
    v16[1] = v19;
  }
  swift_retain();
  return v4;
}

uint64_t sub_10003D59C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  sub_100005458((uint64_t *)&unk_10006DF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100049DD0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10003D66C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *(void *)(a1 + 40) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100005458((uint64_t *)&unk_10006DF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100049DD0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    void *v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 32);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  *uint64_t v14 = v16;
  v14[1] = v17;
  swift_retain();
  return a1;
}

uint64_t sub_10003D79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_100006588(a1 + v6, (uint64_t *)&unk_10006DF60);
    sub_100005458((uint64_t *)&unk_10006DF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100049DD0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  swift_retain();
  swift_release();
  *(void *)(v11 + 8) = *(void *)(v12 + 8);
  return a1;
}

uint64_t sub_10003D924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100005458((uint64_t *)&unk_10006DF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100049DD0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_10003DA34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_100006588(a1 + v6, (uint64_t *)&unk_10006DF60);
    uint64_t v9 = sub_100005458((uint64_t *)&unk_10006DF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100049DD0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (void *)(a2 + v11);
  *(void *)(a1 + v11) = *v13;
  swift_release();
  *(void *)(v12 + 8) = v13[1];
  return a1;
}

uint64_t sub_10003DBA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003DBB8);
}

uint64_t sub_10003DBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100005458(&qword_10006E228);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_10003DC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003DC80);
}

uint64_t sub_10003DC80(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005458(&qword_10006E228);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10003DD2C()
{
  sub_10003F70C(319, (unint64_t *)&unk_10006E298, (void (*)(uint64_t))&type metadata accessor for LayoutDirection);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_10003DDFC()
{
  return sub_100006E54(&qword_10006E2D8, &qword_10006E1C0);
}

uint64_t sub_10003DE38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003DE54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003DE74(uint64_t a1)
{
  return sub_10003F9A4(a1, type metadata accessor for CPSlider, (uint64_t (*)(uint64_t, uint64_t))sub_1000369D4);
}

unint64_t sub_10003DEA0()
{
  unint64_t result = qword_10006E318;
  if (!qword_10006E318)
  {
    sub_1000061E8(&qword_10006E310);
    sub_100006E54(&qword_10006E320, &qword_10006E328);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E318);
  }
  return result;
}

unint64_t sub_10003DF40()
{
  unint64_t result = qword_10006E330;
  if (!qword_10006E330)
  {
    sub_1000061E8(&qword_10006E2F0);
    sub_10003DEA0();
    sub_10003D114((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E330);
  }
  return result;
}

uint64_t sub_10003DFF0()
{
  uint64_t v1 = type metadata accessor for CPSlider(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  sub_100005458((uint64_t *)&unk_10006DF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100049DD0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10003E140(uint64_t a1)
{
  return sub_10003E41C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_10003864C);
}

uint64_t sub_10003E158()
{
  uint64_t v1 = sub_100049D30();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for CPSlider(0);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v10 = v0 + v8 + *(int *)(v6 + 28);
  sub_100005458((uint64_t *)&unk_10006DF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100049DD0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v8 + v9, v3 | v7 | 7);
}

uint64_t sub_10003E32C()
{
  sub_100049D30();
  type metadata accessor for CPSlider(0);

  return sub_1000384D4();
}

uint64_t sub_10003E404(uint64_t a1)
{
  return sub_10003E41C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1000385F8);
}

uint64_t sub_10003E41C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for CPSlider(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

uint64_t type metadata accessor for PositionModifier(uint64_t a1)
{
  return sub_10003E7C0(a1, qword_10006E488);
}

unint64_t sub_10003E4C0()
{
  unint64_t result = qword_10006E3C8;
  if (!qword_10006E3C8)
  {
    sub_1000061E8(&qword_10006E388);
    sub_10003E560();
    sub_100006E54(&qword_10006E3F0, &qword_10006E3C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E3C8);
  }
  return result;
}

unint64_t sub_10003E560()
{
  unint64_t result = qword_10006E3D0;
  if (!qword_10006E3D0)
  {
    sub_1000061E8(&qword_10006E380);
    sub_10003E600();
    sub_100006E54(&qword_10006E3E8, &qword_10006E3A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E3D0);
  }
  return result;
}

unint64_t sub_10003E600()
{
  unint64_t result = qword_10006E3D8;
  if (!qword_10006E3D8)
  {
    sub_1000061E8(&qword_10006E378);
    sub_100006E54(&qword_10006E3E0, &qword_10006E370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E3D8);
  }
  return result;
}

unint64_t sub_10003E6A0()
{
  unint64_t result = qword_10006E400;
  if (!qword_10006E400)
  {
    sub_1000061E8(&qword_10006E350);
    sub_10003E74C();
    sub_10003D114(&qword_10006E410, (void (*)(uint64_t))type metadata accessor for PositionModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E400);
  }
  return result;
}

unint64_t sub_10003E74C()
{
  unint64_t result = qword_10006E408;
  if (!qword_10006E408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E408);
  }
  return result;
}

uint64_t type metadata accessor for OpacityBackground(uint64_t a1)
{
  return sub_10003E7C0(a1, qword_10006E520);
}

uint64_t sub_10003E7C0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003E800(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    swift_retain();
    swift_retain();
    sub_100005458((uint64_t *)&unk_10006DF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100049DD0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10003E930(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  sub_100005458((uint64_t *)&unk_10006DF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100049DD0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10003E9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  swift_retain();
  swift_retain();
  sub_100005458((uint64_t *)&unk_10006DF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100049DD0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    void *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_10003EAD0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_100006588((uint64_t)a1 + v6, (uint64_t *)&unk_10006DF60);
    sub_100005458((uint64_t *)&unk_10006DF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100049DD0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10003EBF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_100005458((uint64_t *)&unk_10006DF60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100049DD0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_10003ECD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_100006588(a1 + v6, (uint64_t *)&unk_10006DF60);
    uint64_t v9 = sub_100005458((uint64_t *)&unk_10006DF60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100049DD0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003EDF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003EE08);
}

uint64_t sub_10003EE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10003F4CC(a1, a2, a3, &qword_10006E228);
}

uint64_t sub_10003EE14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003EE28);
}

uint64_t sub_10003EE28(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005458(&qword_10006E228);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10003EED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *sub_10003EF04(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    sub_100005458(&qword_10006C408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100049C10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10003F024(uint64_t a1, uint64_t a2)
{
  return sub_10003F044(a1, a2, &qword_10006C408, (uint64_t (*)(void))&type metadata accessor for ColorScheme);
}

uint64_t sub_10003F044(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  swift_release();
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  sub_100005458(a3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = a4(0);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  else
  {
    return swift_release();
  }
}

void *sub_10003F110(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (void *)((char *)a2 + v5);
  swift_retain();
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100049C10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    void *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_10003F1D8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_100006588((uint64_t)a1 + v6, &qword_10006C408);
    sub_100005458(&qword_10006C408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100049C10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_10003F2D4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_100049C10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_10003F3A8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_100006588((uint64_t)a1 + v6, &qword_10006C408);
    uint64_t v9 = sub_100005458(&qword_10006C408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100049C10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10003F4AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003F4C0);
}

uint64_t sub_10003F4C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10003F4CC(a1, a2, a3, &qword_10006C410);
}

uint64_t sub_10003F4CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v5 = *(void *)(a1 + 8);
    if (v5 >= 0xFFFFFFFF) {
      LODWORD(v5) = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_100005458(a4);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_10003F57C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003F590);
}

uint64_t sub_10003F590(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005458(&qword_10006C410);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10003F63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_10003F674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, void (*a7)(uint64_t))
{
  sub_10003F70C(319, a6, a7);
  if (v7 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10003F70C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100049C50();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_10003F764()
{
  unint64_t result = qword_10006E560;
  if (!qword_10006E560)
  {
    sub_1000061E8(&qword_10006E2E0);
    sub_100006E54(&qword_10006E568, &qword_10006E2E8);
    sub_100006E54(&qword_10006C560, &qword_10006C520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E560);
  }
  return result;
}

unint64_t sub_10003F82C()
{
  unint64_t result = qword_10006E570;
  if (!qword_10006E570)
  {
    sub_1000061E8(&qword_10006E300);
    sub_1000061E8(&qword_10006E2F0);
    sub_10003DF40();
    swift_getOpaqueTypeConformance2();
    sub_10003D114((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E570);
  }
  return result;
}

uint64_t sub_10003F90C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003F928()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003F944()
{
  return sub_10003CC8C(type metadata accessor for OpacityBackground, &qword_10006C408, (uint64_t (*)(void))&type metadata accessor for ColorScheme);
}

uint64_t sub_10003F978(uint64_t a1)
{
  return sub_10003F9A4(a1, type metadata accessor for OpacityBackground, (uint64_t (*)(uint64_t, uint64_t))sub_10003BAD0);
}

uint64_t sub_10003F9A4(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

uint64_t sub_10003FA3C()
{
  uint64_t v1 = (int *)(type metadata accessor for OpacityBackground(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_100049D30();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  swift_release();
  uint64_t v9 = v0 + v3 + v1[8];
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100049C10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v2 | v7 | 7;
  uint64_t v12 = (v3 + v4 + v7) & ~v7;
  uint64_t v13 = v12 + v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v12, v5);

  return _swift_deallocObject(v0, v13, v11);
}

uint64_t sub_10003FBE8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for OpacityBackground(0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_100049D30();

  return sub_10003BEC8(a1, (double *)(v2 + v6), a2);
}

uint64_t sub_10003FCCC()
{
  uint64_t v1 = (int *)(type metadata accessor for OpacityBackground(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + v1[8];
  sub_100005458(&qword_10006C408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100049C10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

double sub_10003FDF0@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for OpacityBackground(0) - 8);
  uint64_t v6 = *(void *)(v2
                 + ((*(void *)(v5 + 64)
                   + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
                   + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10003C1F0(a1, v6, a2);
}

unint64_t sub_10003FE9C()
{
  unint64_t result = qword_10006E5C0;
  if (!qword_10006E5C0)
  {
    sub_1000061E8(&qword_10006E5B8);
    sub_100006E54(&qword_10006E5C8, &qword_10006E5D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E5C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpacityBackground.PlatformBasedOpacityModifier()
{
  return &type metadata for OpacityBackground.PlatformBasedOpacityModifier;
}

unint64_t sub_10003FF50()
{
  unint64_t result = qword_10006E5D8;
  if (!qword_10006E5D8)
  {
    sub_1000061E8(&qword_10006E580);
    sub_100006E54(&qword_10006E5E0, &qword_10006E578);
    sub_10003FFF0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E5D8);
  }
  return result;
}

unint64_t sub_10003FFF0()
{
  unint64_t result = qword_10006E5E8;
  if (!qword_10006E5E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E5E8);
  }
  return result;
}

unint64_t sub_100040048()
{
  unint64_t result = qword_10006E5F0;
  if (!qword_10006E5F0)
  {
    sub_1000061E8(&qword_10006E5F8);
    sub_100006E54(&qword_10006E600, &qword_10006E608);
    sub_1000400E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E5F0);
  }
  return result;
}

unint64_t sub_1000400E8()
{
  unint64_t result = qword_10006E610;
  if (!qword_10006E610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E610);
  }
  return result;
}

uint64_t sub_10004013C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100040158()
{
  unint64_t result = qword_10006E630;
  if (!qword_10006E630)
  {
    sub_1000061E8(&qword_10006E628);
    sub_100006E54(&qword_10006E638, &qword_10006E618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E630);
  }
  return result;
}

unint64_t sub_1000401FC()
{
  unint64_t result = qword_10006E640;
  if (!qword_10006E640)
  {
    sub_1000061E8(&qword_10006E648);
    sub_100040158();
    sub_100006E54(&qword_10006E638, &qword_10006E618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E640);
  }
  return result;
}

uint64_t destroy for Spectrum()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for Spectrum(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  long long v3 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v4;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  uint64_t v6 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Spectrum(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  swift_retain();
  swift_release();
  long long v5 = a2[2];
  long long v6 = a2[3];
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(void *)(a1 + 72) = *((void *)a2 + 9);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *((void *)a2 + 11);
  swift_retain();
  swift_release();
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(void *)(a1 + 104) = *((void *)a2 + 13);
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(void *)(a1 + 120) = *((void *)a2 + 15);
  *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
  *(void *)(a1 + 136) = *((void *)a2 + 17);
  swift_retain();
  swift_release();
  *(void *)(a1 + 144) = *((void *)a2 + 18);
  return a1;
}

__n128 initializeWithTake for Spectrum(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for Spectrum(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for Spectrum(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 152)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Spectrum(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
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
      *(unsigned char *)(result + 152) = 1;
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
      *(void *)(result + 88) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Spectrum()
{
  return &type metadata for Spectrum;
}

uint64_t sub_100040634()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100040650@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v3 = sub_100049FC0();
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3);
  long long v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10004A140();
  uint64_t v6 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  long long v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100005458(&qword_10006E6A0);
  uint64_t v9 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100005458(&qword_10006E6A8);
  uint64_t v12 = __chkstk_darwin(v56);
  int v50 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v55 = (char *)&v49 - v14;
  uint64_t v15 = swift_allocObject();
  long long v16 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v15 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v15 + 128) = v16;
  *(_OWORD *)(v15 + 144) = *(_OWORD *)(v1 + 128);
  *(void *)(v15 + 160) = *(void *)(v1 + 144);
  long long v17 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v15 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v15 + 64) = v17;
  long long v18 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v15 + 96) = v18;
  long long v19 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v15 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v15 + 32) = v19;
  *(void *)&long long v58 = sub_100042590;
  *((void *)&v58 + 1) = v15;
  sub_100032F8C(v1);
  sub_10004A120();
  uint64_t v20 = sub_100005458(&qword_10006E6B0);
  uint64_t v21 = sub_100006E54(&qword_10006E6B8, &qword_10006E6B0);
  sub_10004A3C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v51);
  swift_release();
  sub_100049FB0();
  *(void *)&long long v58 = v20;
  *((void *)&v58 + 1) = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v52;
  sub_10004A370();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v5, v54);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  sub_1000065E4();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v24 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v25 = sub_10004A700();
  NSString v26 = sub_10004A700();
  id v27 = [v24 localizedStringForKey:v25 value:0 table:v26];

  uint64_t v28 = sub_10004A740();
  uint64_t v30 = v29;

  *(void *)&long long v58 = v28;
  *((void *)&v58 + 1) = v30;
  sub_100006678();
  uint64_t v31 = sub_10004A2F0();
  uint64_t v33 = v32;
  LOBYTE(v5) = v34 & 1;
  uint64_t v35 = (uint64_t)v55;
  uint64_t v36 = (uint64_t)v50;
  sub_100049DE0();
  sub_100006720(v31, v33, (char)v5);
  swift_bridgeObjectRelease();
  sub_100006588(v36, &qword_10006E6A8);
  long long v37 = *(_OWORD *)(v2 + 96);
  long long v58 = *(_OWORD *)(v2 + 80);
  long long v59 = v37;
  long long v60 = *(_OWORD *)(v2 + 112);
  char v61 = *(unsigned char *)(v2 + 128);
  sub_100005458(&qword_10006C208);
  sub_10004A550();
  sub_100018AB4();
  uint64_t v39 = v38;
  id v40 = [v38 _accessibilityNameWithLuma];

  uint64_t v41 = sub_10004A740();
  uint64_t v43 = v42;

  *(void *)&long long v58 = v41;
  *((void *)&v58 + 1) = v43;
  uint64_t v44 = sub_10004A2F0();
  uint64_t v46 = v45;
  LOBYTE(v43) = v47 & 1;
  sub_100042598();
  sub_10004A350();
  sub_100006720(v44, v46, v43);
  swift_bridgeObjectRelease();
  return sub_100006588(v35, &qword_10006E6A8);
}

uint64_t sub_100040BF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = sub_10004A620();
  a3[1] = v6;
  uint64_t v7 = sub_100005458(&qword_10006E6C8);
  return sub_100040C50(a2, a1, (unsigned char *)a3 + *(int *)(v7 + 44));
}

uint64_t sub_100040C50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v102 = a1;
  long long v101 = a3;
  uint64_t v99 = sub_100005458(&qword_10006E6D0);
  uint64_t v98 = *(void *)(v99 - 8);
  uint64_t v3 = __chkstk_darwin(v99);
  uint64_t v93 = &v88[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  uint64_t v92 = &v88[-v5];
  uint64_t v6 = sub_100005458(&qword_10006E6D8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  long long v100 = &v88[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  long long v104 = &v88[-v9];
  uint64_t v103 = sub_100005458(&qword_10006C4C0);
  uint64_t v106 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  uint64_t v11 = &v88[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_100005458(&qword_10006C520);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = &v88[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = sub_100049E00();
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  long long v19 = (double *)&v88[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unsigned __int8 v96 = (unsigned char *)sub_100005458(&qword_10006E6E0);
  __chkstk_darwin(v96);
  uint64_t v21 = &v88[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v22 = sub_100005458(&qword_10006E6E8);
  uint64_t v94 = *(void *)(v22 - 8);
  uint64_t v23 = __chkstk_darwin(v22);
  long long v97 = &v88[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = __chkstk_darwin(v23);
  *(void *)&long long v95 = &v88[-v26];
  __chkstk_darwin(v25);
  uint64_t v28 = &v88[-v27];
  id v90 = self;
  id v29 = [v90 currentDevice];
  id v30 = [v29 userInterfaceIdiom];

  BOOL v31 = v30 == (id)6;
  uint64_t v32 = v22;
  if (v31) {
    double v33 = 16.0;
  }
  else {
    double v33 = 8.0;
  }
  char v34 = (char *)v19 + *(int *)(v17 + 28);
  uint64_t v35 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v36 = sub_100049F90();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(v34, v35, v36);
  *long long v19 = v33;
  v19[1] = v33;
  sub_1000182B0((uint64_t)v19, (uint64_t)v15);
  uint64_t v37 = *(int *)(v13 + 44);
  uint64_t v38 = v102;
  *(_WORD *)&v15[v37] = 256;
  sub_100006524((uint64_t)v15, (uint64_t)v21, &qword_10006C520);
  sub_100006588((uint64_t)v15, &qword_10006C520);
  uint64_t v39 = (uint64_t)v19;
  uint64_t v40 = v94;
  sub_10000BE50(v39);
  sub_1000416F0(v105, (uint64_t)v11);
  sub_100049C60();
  sub_10004280C();
  uint64_t v41 = sub_100006E54(&qword_10006C578, &qword_10006C4C0);
  uint64_t v42 = v95;
  uint64_t v43 = v103;
  uint64_t v91 = v41;
  sub_10004A3F0();
  uint64_t v44 = *(void (**)(unsigned char *, uint64_t))(v106 + 8);
  unsigned __int8 v96 = v11;
  v106 += 8;
  v44(v11, v43);
  sub_100006588((uint64_t)v21, &qword_10006E6E0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v40 + 32))(v28, v42, v32);
  if (*(void *)(v38 + 136))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if ((_BYTE)v107 && v107 == 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v45 = sub_10004AB60();
      swift_bridgeObjectRelease();
      if ((v45 & 1) == 0) {
        goto LABEL_11;
      }
    }
    sub_100049D20();
    *(double *)&uint64_t v48 = COERCE_DOUBLE(sub_100041B3C(v46, v47));
    if ((v50 & 1) == 0)
    {
      double v51 = *(double *)&v48;
      double v52 = v49;
      long long v53 = *(_OWORD *)(v38 + 96);
      long long v107 = *(_OWORD *)(v38 + 80);
      long long v54 = *(_OWORD *)(v38 + 112);
      long long v108 = v53;
      long long v109 = v54;
      char v110 = *(unsigned char *)(v38 + 128);
      sub_100005458(&qword_10006C208);
      sub_10004A550();
      long long v95 = v117;
      uint64_t v55 = v118;
      uint64_t v56 = v119;
      int v89 = v120;
      id v57 = v90;
      id v58 = [v90 currentDevice];
      [v58 userInterfaceIdiom];

      id v59 = [v57 currentDevice];
      [v59 userInterfaceIdiom];

      sub_10004A640();
      sub_100049D10();
      uint64_t v60 = v117;
      LOBYTE(v57) = BYTE8(v117);
      uint64_t v61 = v105;
      uint64_t v62 = v118;
      id v90 = v44;
      char v63 = v28;
      uint64_t v64 = v32;
      char v65 = v119;
      uint64_t v66 = v40;
      uint64_t v67 = v120;
      uint64_t v68 = v121;
      sub_100049D20();
      double v70 = sub_1000428B4(v51, v52, v69);
      long long v107 = v95;
      *(void *)&long long v108 = v55;
      *((void *)&v108 + 1) = v56;
      LOBYTE(v109) = v89;
      *((void *)&v109 + 1) = v60;
      char v110 = (char)v57;
      uint64_t v111 = v62;
      char v112 = v65;
      uint64_t v32 = v64;
      uint64_t v28 = v63;
      uint64_t v113 = v67;
      uint64_t v114 = v68;
      uint64_t v40 = v66;
      double v115 = v70;
      uint64_t v116 = v71;
      uint64_t v72 = (uint64_t)v96;
      sub_1000416F0(v61, (uint64_t)v96);
      sub_100049C60();
      sub_100005458(&qword_10006E700);
      sub_1000429E4(&qword_10006E708, &qword_10006E700, (void (*)(void))sub_1000429B4);
      uint64_t v73 = v93;
      uint64_t v74 = v103;
      sub_10004A3F0();
      ((void (*)(uint64_t, uint64_t))v90)(v72, v74);
      uint64_t v75 = v98;
      int v76 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v98 + 32);
      int v77 = v92;
      uint64_t v78 = v99;
      v76(v92, v73, v99);
      v76(v104, v77, v78);
      uint64_t v79 = 0;
LABEL_12:
      uint64_t v80 = (uint64_t)v104;
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v75 + 56))(v104, v79, 1, v78);
      uint64_t v81 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v40 + 16);
      uint64_t v82 = v97;
      v81(v97, v28, v32);
      uint64_t v83 = v100;
      sub_100006524(v80, (uint64_t)v100, &qword_10006E6D8);
      uint64_t v84 = v101;
      v81(v101, v82, v32);
      uint64_t v85 = sub_100005458(&qword_10006E6F8);
      sub_100006524((uint64_t)v83, (uint64_t)&v84[*(int *)(v85 + 48)], &qword_10006E6D8);
      sub_100006588(v80, &qword_10006E6D8);
      uint64_t v86 = *(void (**)(unsigned char *, uint64_t))(v40 + 8);
      v86(v28, v32);
      sub_100006588((uint64_t)v83, &qword_10006E6D8);
      return ((uint64_t (*)(unsigned char *, uint64_t))v86)(v82, v32);
    }
LABEL_11:
    uint64_t v79 = 1;
    uint64_t v78 = v99;
    uint64_t v75 = v98;
    goto LABEL_12;
  }
  type metadata accessor for ColorPickerState();
  sub_100042BC8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

uint64_t sub_1000416F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v30 = a1;
  uint64_t v34 = a2;
  uint64_t v4 = sub_100049D30();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = sub_10004A0E0();
  __chkstk_darwin(v7);
  uint64_t v31 = sub_100049C40();
  uint64_t v8 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005458(&qword_10006C4B8);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  uint64_t v33 = v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004A110();
  sub_100049C20();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v30, v4);
  unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 168) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = swift_allocObject();
  long long v17 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(v16 + 112) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(v16 + 128) = v17;
  *(_OWORD *)(v16 + 144) = *(_OWORD *)(v3 + 128);
  *(void *)(v16 + 160) = *(void *)(v3 + 144);
  long long v18 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v16 + 64) = v18;
  long long v19 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(v16 + 96) = v19;
  long long v20 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v3;
  *(_OWORD *)(v16 + 32) = v20;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v16 + v15, (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_100032F8C(v3);
  sub_100042BC8(&qword_10006C528, (void (*)(uint64_t))&type metadata accessor for DragGesture);
  sub_100042BC8(&qword_10006C530, (void (*)(uint64_t))&type metadata accessor for DragGesture.Value);
  uint64_t v21 = v31;
  sub_10004A600();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v21);
  uint64_t v22 = swift_allocObject();
  long long v23 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(v22 + 112) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(v22 + 128) = v23;
  *(_OWORD *)(v22 + 144) = *(_OWORD *)(v3 + 128);
  *(void *)(v22 + 160) = *(void *)(v3 + 144);
  long long v24 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v22 + 64) = v24;
  long long v25 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(v22 + 80) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(v22 + 96) = v25;
  long long v26 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)v3;
  *(_OWORD *)(v22 + 32) = v26;
  sub_100032F8C(v3);
  sub_100006E54(&qword_10006C538, &qword_10006C4B8);
  uint64_t v27 = v32;
  sub_10004A5F0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v14, v27);
}

uint64_t sub_100041B3C(double a1, double a2)
{
  if (*((void *)v2 + 17))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100049B60();
    swift_release();
    swift_release();
    swift_release();
    if (v26 == 2) {
      goto LABEL_3;
    }
    long long v6 = v2[1];
    long long v30 = *v2;
    long long v31 = v6;
    sub_100005458(&qword_10006E720);
    sub_10004A500();
    if ((LOBYTE(v34) & 1) == 0)
    {
      double v5 = v32;
      sub_100005458(&qword_10006E728);
      sub_10004A500();
      if (v35 != 2)
      {
        sub_100005458(&qword_10006C208);
        sub_10004A550();
        if (((v35 & 1) == 0) != v35
          && vabdd_f64(v32, v32) < 0.001
          && vabdd_f64(v33, v33) < 0.001
          && vabdd_f64(v34, v34) < 0.001)
        {
          return *(void *)&v5;
        }
      }
    }
    sub_100005458(&qword_10006C208);
    sub_10004A550();
    sub_10001896C((uint64_t)v27);
    uint64_t v7 = self;
    objc_msgSend(v7, "positionForColor:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v27[0]), v27[1]).i64);
    double v9 = (v8 + 1.0) * 0.5 * a1;
    id v11 = objc_msgSend(v7, "colorAtLocation:", fmax(fmin(v9 / a1 + v9 / a1 + -1.0, 1.0), -1.0), fmax(fmin(-((a2 - (v10 + 1.0) * 0.5 * a2) / a2 + (a2 - (v10 + 1.0) * 0.5 * a2) / a2 + -1.0), 1.0), -1.0));
    uint64_t v12 = (CGColor *)[v11 CGColor];
    uint64_t v13 = CGColorGetColorSpace(v12);

    if (v13)
    {
      char v14 = sub_100019954(v13);
      if (v14 != 2)
      {
        sub_100019828(v11, v14 & 1, (uint64_t)&v28);
        float64x2_t v22 = v28;
        double v15 = v29;

LABEL_17:
        sub_10004A550();
        float64x2_t v16 = vsubq_f64(v23, v22);
        if (sqrt(vaddvq_f64(vmulq_f64(v16, v16)) + (v24 - v15) * (v24 - v15)) < 0.55)
        {

          double v5 = v9;
          return *(void *)&v5;
        }
        sub_10004A500();
        sub_10004A550();
        if (qword_10006C080 != -1) {
          swift_once();
        }
        if (v25 == byte_10006E670
          && vabdd_f64(v23.f64[0], *(double *)&qword_10006E650) < 0.001
          && vabdd_f64(v23.f64[1], *(double *)&qword_10006E658) < 0.001
          && vabdd_f64(v24, *(double *)&qword_10006E660) < 0.001)
        {

          double v5 = 0.0;
          return *(void *)&v5;
        }
        sub_10004A550();
        if (qword_10006C088 != -1) {
          swift_once();
        }
        double v19 = *(double *)&qword_10006E678;
        double v18 = unk_10006E680;
        double v20 = *(double *)&qword_10006E688;
        int v21 = byte_10006E698;

        if (v25 == v21
          && vabdd_f64(v23.f64[0], v19) < 0.001
          && vabdd_f64(v23.f64[1], v18) < 0.001
          && vabdd_f64(v24, v20) < 0.001)
        {
          double v5 = 1.79769313e308;
          return *(void *)&v5;
        }
LABEL_3:
        double v5 = 0.0;
        return *(void *)&v5;
      }
    }
    if (qword_10006C058 != -1) {
      swift_once();
    }
    sub_100019828(v11, byte_100072488, (uint64_t)&v28);
    float64x2_t v22 = v28;
    double v15 = v29;
    goto LABEL_17;
  }
  type metadata accessor for ColorPickerState();
  sub_100042BC8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  uint64_t result = sub_100049E50();
  __break(1u);
  return result;
}

void sub_100042120(uint64_t a1, long long *a2)
{
  if (*((void *)a2 + 17))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v25) = 1;
    swift_retain();
    sub_100049B70();
    sub_100049C30();
    long long v3 = a2[1];
    long long v25 = *a2;
    long long v26 = v3;
    sub_100005458(&qword_10006E720);
    sub_10004A510();
    long long v4 = a2[6];
    long long v25 = a2[5];
    long long v26 = v4;
    long long v27 = a2[7];
    char v28 = *((unsigned char *)a2 + 128);
    sub_100005458(&qword_10006C208);
    sub_10004A550();
    double v6 = v29;
    double v5 = v30;
    double v8 = v31;
    uint64_t v7 = v32;
    int v9 = v33;
    sub_100049C30();
    double v11 = v10;
    double v13 = v12;
    sub_100049D20();
    id v16 = objc_msgSend(self, "colorAtLocation:", fmax(fmin(v11 / v14 + v11 / v14 + -1.0, 1.0), -1.0), fmax(fmin(-(v13 / v15 + v13 / v15 + -1.0), 1.0), -1.0));
    sub_100019828(v16, v33, (uint64_t)&v21);
    double v29 = v21;
    double v30 = v22;
    double v31 = v23;
    uint64_t v32 = v7;
    unsigned __int8 v33 = v24;
    if (v9 != v24 || vabdd_f64(v21, v6) >= 0.001 || vabdd_f64(v22, v5) >= 0.001 || vabdd_f64(v23, v8) >= 0.001)
    {
      UIAccessibilityNotifications v17 = UIAccessibilityAnnouncementNotification;
      sub_100018AB4();
      double v19 = v18;
      NSString v20 = [v18 _accessibilityNameWithLuma];

      if (!v20)
      {
        sub_10004A740();
        NSString v20 = sub_10004A700();
        swift_bridgeObjectRelease();
      }
      UIAccessibilityPostNotification(v17, v20);

      sub_100005458(&qword_10006E728);
      sub_10004A510();
      sub_10004A560();
    }
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100042BC8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    sub_100049E50();
    __break(1u);
  }
}

uint64_t sub_100042460(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 136))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_100049B70();
  }
  else
  {
    type metadata accessor for ColorPickerState();
    sub_100042BC8((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
    uint64_t result = sub_100049E50();
    __break(1u);
  }
  return result;
}

uint64_t sub_100042530@<X0>(uint64_t a1@<X8>)
{
  return sub_100040650(a1);
}

uint64_t sub_100042590@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100040BF8(a1, v2 + 16, a2);
}

unint64_t sub_100042598()
{
  unint64_t result = qword_10006E6C0;
  if (!qword_10006E6C0)
  {
    sub_1000061E8(&qword_10006E6A8);
    sub_1000061E8(&qword_10006E6B0);
    sub_100006E54(&qword_10006E6B8, &qword_10006E6B0);
    swift_getOpaqueTypeConformance2();
    sub_100042BC8((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E6C0);
  }
  return result;
}

void sub_1000426A4(uint64_t a1)
{
}

void sub_1000426C0(uint64_t a1)
{
}

void sub_1000426DC(uint64_t a1, SEL *a2, _OWORD *a3, _OWORD *a4, unsigned char *a5)
{
  id v8 = [self *a2];
  int v9 = (CGColor *)[v8 CGColor];
  double v10 = CGColorGetColorSpace(v9);

  if (v10)
  {
    char v11 = sub_100019954(v10);
    if (v11 != 2)
    {
      sub_100019828(v8, v11 & 1, (uint64_t)&v17);
      long long v15 = v18;
      long long v16 = v17;
      char v14 = v19;

      long long v13 = v15;
      long long v12 = v16;
      goto LABEL_8;
    }
  }
  if (qword_10006C058 != -1) {
    swift_once();
  }
  sub_100019828(v8, byte_100072488, (uint64_t)&v17);
  long long v12 = v17;
  long long v13 = v18;
  char v14 = v19;
LABEL_8:
  *a3 = v12;
  *a4 = v13;
  *a5 = v14;
}

unint64_t sub_10004280C()
{
  unint64_t result = qword_10006E6F0;
  if (!qword_10006E6F0)
  {
    sub_1000061E8(&qword_10006E6E0);
    sub_1000116CC();
    sub_100006E54(&qword_10006C560, &qword_10006C520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E6F0);
  }
  return result;
}

double sub_1000428B4(double a1, double a2, double a3)
{
  if (a1 < 0.0) {
    a1 = 0.0;
  }
  if (a1 <= a3) {
    double v3 = a1;
  }
  else {
    double v3 = a3;
  }
  long long v4 = self;
  id v5 = [v4 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)6) {
    double v7 = 22.0;
  }
  else {
    double v7 = 16.5;
  }
  double v8 = v3 - v7;
  id v9 = [v4 currentDevice];
  [v9 userInterfaceIdiom];

  return v8;
}

uint64_t sub_1000429B4()
{
  return sub_1000429E4(&qword_10006E710, &qword_10006E718, (void (*)(void))sub_10003E74C);
}

uint64_t sub_1000429E4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061E8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100042A68()
{
  uint64_t v1 = sub_100049D30();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 168) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100042B54(uint64_t a1)
{
  sub_100049D30();

  sub_100042120(a1, (long long *)(v1 + 16));
}

uint64_t sub_100042BC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100042C14()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 168, 7);
}

uint64_t sub_100042C6C(uint64_t a1)
{
  return sub_100042460(a1, v1 + 16);
}

unint64_t sub_100042C80()
{
  unint64_t result = qword_10006E730;
  if (!qword_10006E730)
  {
    sub_1000061E8(&qword_10006E738);
    sub_100042598();
    sub_100042BC8((unint64_t *)&qword_10006C5E8, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E730);
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorLens()
{
  return &type metadata for ColorLens;
}

uint64_t sub_100042D3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100042D58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10004A410();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004A640();
  uint64_t v28 = v8;
  uint64_t v29 = v7;
  sub_100042F40(v1, (uint64_t)&v31);
  uint64_t v9 = v32;
  uint64_t v10 = v33;
  char v11 = v34;
  long long v26 = v35;
  long long v27 = v31;
  uint64_t v12 = v36;
  uint64_t v25 = v37;
  char v13 = v38;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Color.RGBColorSpace.sRGBLinear(_:), v3);
  uint64_t v14 = sub_10004A480();
  id v15 = [self currentDevice];
  [v15 userInterfaceIdiom];

  char v30 = v13;
  LOBYTE(v15) = sub_10004A1D0();
  uint64_t result = sub_100049BF0();
  char v17 = v30;
  uint64_t v18 = v28;
  *(void *)a1 = v29;
  *(void *)(a1 + 8) = v18;
  *(_OWORD *)(a1 + 16) = v27;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = v10;
  *(unsigned char *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 56) = v26;
  uint64_t v19 = v25;
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = v19;
  *(unsigned char *)(a1 + 88) = v17;
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 104) = 0x4000000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = (_BYTE)v15;
  *(void *)(a1 + 136) = v20;
  *(void *)(a1 + 144) = v21;
  *(void *)(a1 + 152) = v22;
  *(void *)(a1 + 160) = v23;
  *(_WORD *)(a1 + 168) = 0;
  return result;
}

uint64_t sub_100042F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10004A410();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [self systemBackgroundColor];
  uint64_t v9 = sub_10004A400();
  uint64_t KeyPath = swift_getKeyPath();
  char v11 = (unsigned int *)&enum case for Color.RGBColorSpace.sRGB(_:);
  if (*(unsigned char *)(a1 + 32)) {
    char v11 = (unsigned int *)&enum case for Color.RGBColorSpace.displayP3(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v11, v4);
  uint64_t v12 = sub_10004A470();
  uint64_t v13 = swift_getKeyPath();
  id v14 = [self currentDevice];
  [v14 userInterfaceIdiom];

  LOBYTE(v14) = sub_10004A1D0();
  sub_100049BF0();
  *(void *)a2 = KeyPath;
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v12;
  *(unsigned char *)(a2 + 32) = (_BYTE)v14;
  *(void *)(a2 + 40) = v15;
  *(void *)(a2 + 48) = v16;
  *(void *)(a2 + 56) = v17;
  *(void *)(a2 + 64) = v18;
  *(unsigned char *)(a2 + 72) = 0;
  swift_retain();
  return swift_release();
}

uint64_t sub_100043128@<X0>(uint64_t a1@<X8>)
{
  return sub_100042D58(a1);
}

uint64_t sub_100043164@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100049EA0();
  *a1 = result;
  return result;
}

uint64_t sub_100043190@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100049EA0();
  *a1 = result;
  return result;
}

uint64_t sub_1000431BC()
{
  return sub_100049EB0();
}

uint64_t sub_1000431E8()
{
  return sub_100049EB0();
}

unint64_t sub_100043218()
{
  unint64_t result = qword_10006E740;
  if (!qword_10006E740)
  {
    sub_1000061E8(&qword_10006E748);
    sub_1000432F0(&qword_10006E750, &qword_10006E758, (void (*)(void))sub_1000432C0);
    sub_100034418();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E740);
  }
  return result;
}

uint64_t sub_1000432C0()
{
  return sub_1000432F0(&qword_10006E760, &qword_10006E768, (void (*)(void))sub_10004336C);
}

uint64_t sub_1000432F0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000061E8(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10004336C()
{
  unint64_t result = qword_10006E770;
  if (!qword_10006E770)
  {
    sub_1000061E8(&qword_10006E778);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006E770);
  }
  return result;
}

uint64_t type metadata accessor for _UIColorPickerContentViewController()
{
  uint64_t result = qword_10006E7D8;
  if (!qword_10006E7D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100043414()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10004349C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10004351C()
{
  return sub_100049B70();
}

uint64_t sub_100043590@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_1000435A4()
{
  return sub_100031C9C();
}

char *sub_1000435B8()
{
  uint64_t v1 = sub_100005458(&qword_10006E888);
  uint64_t v82 = *(void *)(v1 - 8);
  uint64_t v83 = v1;
  __chkstk_darwin(v1);
  uint64_t v81 = (char *)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005458(&qword_10006E890);
  uint64_t v79 = *(void *)(v3 - 8);
  uint64_t v80 = v3;
  __chkstk_darwin(v3);
  uint64_t v78 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005458(&qword_10006E898);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v84 = v5;
  uint64_t v85 = v6;
  __chkstk_darwin(v5);
  id v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005458((uint64_t *)&unk_10006E8A0);
  uint64_t v73 = *(void *)(v9 - 8);
  uint64_t v74 = v9;
  __chkstk_darwin(v9);
  char v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005458((uint64_t *)&unk_10006CA78);
  uint64_t v71 = *(void *)(v12 - 8);
  uint64_t v72 = v12;
  __chkstk_darwin(v12);
  id v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005458((uint64_t *)&unk_10006E8B0);
  uint64_t v75 = *(void *)(v15 - 8);
  int v76 = (void *)v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10004A1A0();
  __chkstk_darwin(v18 - 8);
  uint64_t v19 = &v0[qword_10006E780];
  *(void *)uint64_t v19 = 0x64657463656C6573;
  *((void *)v19 + 1) = 0xEB00000000626154;
  uint64_t v20 = qword_10006E788;
  id v21 = objc_allocWithZone((Class)type metadata accessor for FavoritesStore());
  uint64_t v22 = v0;
  *(void *)&v0[v20] = [v21 init];
  uint64_t v23 = qword_10006E790;
  type metadata accessor for ColorPickerState();
  swift_allocObject();
  *(void *)&v22[v23] = sub_1000123D0((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v22[qword_10006E798] = 0;
  *(void *)&v22[qword_10006E7A0] = 0;
  *(void *)&v22[qword_10006E7A8] = 0;
  *(void *)&v22[qword_10006E7B0] = 0;
  *(void *)&v22[qword_10006E7B8] = 0;
  *(void *)&v22[qword_10006E7C0] = 0;
  *(void *)&v22[qword_10006E7C8] = 0;
  v22[qword_10006E7D0] = 0;
  sub_10004749C((unint64_t *)&qword_10006D860, (void (*)(uint64_t))type metadata accessor for ColorPickerState);
  swift_retain();
  uint64_t v24 = sub_100049D90();
  uint64_t v26 = v25;

  uint64_t v86 = (void *)v24;
  uint64_t v87 = v26;
  uint64_t v77 = v26;
  swift_retain();
  id v27 = (id)sub_10004A010();
  sub_10004A190();
  sub_100049FF0();
  uint64_t result = (char *)[v27 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v29 = result;
  id v30 = [result layer];

  [v30 setHitTestsAsOpaque:1];
  long long v31 = (char *)v27;
  sub_10004A000();

  uint64_t result = (char *)[v31 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v32 = result;
  [result _setSafeAreaInsetsFrozen:1];

  uint64_t v33 = qword_10006E790;
  char v34 = *(void **)&v31[qword_10006E788];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  id v35 = v34;
  sub_100049B60();
  swift_release();
  swift_release();
  uint64_t v36 = sub_100029A64((char)v86);

  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v86 = v36;
  sub_100049B70();
  sub_100011EC8((uint64_t)v14);
  swift_beginAccess();
  sub_100005458(&qword_10006E8C0);
  sub_100049B40();
  swift_endAccess();
  uint64_t v37 = sub_100006E54(&qword_10006E8C8, &qword_10006E898);
  uint64_t v38 = v84;
  uint64_t v70 = v37;
  sub_100049BB0();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v85 + 8);
  v85 += 8;
  double v69 = v39;
  v39(v8, v38);
  sub_100006E54(&qword_10006E8D0, (uint64_t *)&unk_10006CA78);
  sub_100006E54(&qword_10006E8D8, (uint64_t *)&unk_10006E8A0);
  uint64_t v40 = v72;
  uint64_t v41 = v74;
  sub_100049B90();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v11, v41);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v14, v40);
  uint64_t v42 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = sub_10004703C;
  *(void *)(v43 + 24) = v42;
  sub_100006E54((unint64_t *)&unk_10006E8E0, (uint64_t *)&unk_10006E8B0);
  uint64_t v44 = v76;
  uint64_t v45 = sub_100049BC0();
  swift_release();
  (*(void (**)(char *, void *))(v75 + 8))(v17, v44);
  *(void *)&v31[qword_10006E798] = v45;
  swift_release();
  id v46 = [self standardUserDefaults];
  swift_bridgeObjectRetain();
  NSString v47 = sub_10004A700();
  swift_bridgeObjectRelease();
  id v48 = [v46 stringForKey:v47];

  if (v48)
  {
    uint64_t v49 = sub_10004A740();
    double v51 = v50;

    v52._rawValue = &off_100062578;
    v88._countAndFlagsBits = v49;
    v88._object = v51;
    unint64_t v53 = sub_10004AB10(v52, v88);
    swift_bridgeObjectRelease();
    if (v53 <= 2)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v86) = v53;
      swift_retain();
      sub_100049B70();
    }
  }
  swift_beginAccess();
  sub_100005458(&qword_10006CFC8);
  long long v54 = v78;
  sub_100049B40();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  int v76 = &protocol conformance descriptor for Published<A>.Publisher;
  sub_100006E54((unint64_t *)&unk_10006E8F0, &qword_10006E890);
  uint64_t v55 = v80;
  uint64_t v56 = sub_100049BC0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v54, v55);
  *(void *)&v31[qword_10006E7C0] = v56;
  swift_release();
  swift_beginAccess();
  sub_100049B40();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v57 = v84;
  uint64_t v58 = sub_100049BC0();
  swift_release();
  id v59 = v69;
  v69(v8, v57);
  *(void *)&v31[qword_10006E7B0] = v58;
  swift_release();
  swift_beginAccess();
  sub_100049B40();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v60 = sub_100049BC0();
  swift_release();
  v59(v8, v57);
  *(void *)&v31[qword_10006E7B8] = v60;
  swift_release();
  swift_beginAccess();
  sub_100005458(&qword_10006D000);
  uint64_t v61 = v81;
  sub_100049B40();
  swift_endAccess();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100006E54((unint64_t *)&unk_10006E900, &qword_10006E888);
  uint64_t v62 = v83;
  uint64_t v63 = sub_100049BC0();
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v82 + 8))(v61, v62);
  *(void *)&v31[qword_10006E7A8] = v63;
  swift_release();
  uint64_t v64 = *(void *)&v31[v33];
  uint64_t v65 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v66 = (void (**)())(v64 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState_close);
  uint64_t v67 = *(void *)(v64 + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker16ColorPickerState_close);
  *uint64_t v66 = sub_1000470D0;
  v66[1] = (void (*)())v65;
  sub_100013CC0(v67);
  return v31;
}

void sub_1000442FC(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    if ((*((unsigned char *)Strong + qword_10006E7D0) & 1) == 0)
    {
      id v6 = [Strong parentViewController];
      if (v6)
      {
        uint64_t v7 = v6;
        self;
        id v8 = (void *)swift_dynamicCastObjCClass();
        if (!v8) {
      }
        }
      else
      {
        id v8 = 0;
      }
      [v8 _pickerDidSelectColor:a1 isVolatile:a2 & 1];
    }
  }
}

void sub_1000443DC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = [self standardUserDefaults];
    NSString v3 = sub_10004A700();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    NSString v4 = sub_10004A700();
    swift_bridgeObjectRelease();
    [v2 setValue:v3 forKey:v4];
  }
}

void sub_100044518(unsigned __int8 *a1)
{
  int v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v3 = Strong;
    if (v1 && (id v4 = [Strong parentViewController]) != 0)
    {
      uint64_t v5 = v4;
      self;
      uint64_t v6 = swift_dynamicCastObjCClass();
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        uint64_t v8 = swift_allocObject();
        *(void *)(v8 + 16) = v3;
        uint64_t v18 = sub_100047118;
        uint64_t v19 = v8;
        float64x2_t aBlock = _NSConcreteStackBlock;
        uint64_t v15 = 1107296256;
        uint64_t v16 = sub_100044BD4;
        uint64_t v17 = &unk_1000642C8;
        uint64_t v9 = _Block_copy(&aBlock);
        id v10 = v3;
        swift_release();
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 16) = v10;
        uint64_t v18 = sub_100047138;
        uint64_t v19 = v11;
        float64x2_t aBlock = _NSConcreteStackBlock;
        uint64_t v15 = 1107296256;
        uint64_t v16 = sub_100023328;
        uint64_t v17 = &unk_100064318;
        uint64_t v12 = _Block_copy(&aBlock);
        id v13 = v10;
        swift_release();
        [v7 _pickerDidShowEyedropperWithSelectionBlock:v9 dismissBlock:v12];

        _Block_release(v12);
        _Block_release(v9);
      }
      else
      {
      }
    }
    else
    {
      uint64_t v5 = v3;
    }
  }
}

uint64_t sub_10004471C(void *a1, void *a2)
{
  uint64_t v4 = sub_10004A6A0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10004A6C0();
  uint64_t v8 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010D7C(0, &qword_10006D878);
  uint64_t v11 = (void *)sub_10004A8B0();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_1000471D8;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100023328;
  aBlock[3] = &unk_1000643B8;
  id v13 = _Block_copy(aBlock);
  id v14 = a2;
  id v15 = a1;
  swift_release();
  sub_10004A6B0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10004749C(&qword_10006D880, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005458(&qword_10006D888);
  sub_100006E54((unint64_t *)&qword_10006D890, &qword_10006D888);
  sub_10004A9C0();
  sub_10004A8C0();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v18);
}

uint64_t sub_100044A04()
{
  return swift_release();
}

uint64_t sub_100044A70(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSString v3 = (CGColor *)[v2 CGColor];
  uint64_t v4 = CGColorGetColorSpace(v3);

  if (v4)
  {
    char v5 = sub_100019954(v4);
    if (v5 != 2)
    {
      sub_100019828(v2, v5 & 1, (uint64_t)&v7);

      goto LABEL_8;
    }
  }
  if (qword_10006C058 != -1) {
    swift_once();
  }
  sub_100019828(v2, byte_100072488, (uint64_t)&v7);
LABEL_8:
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_100049B70();
}

void sub_100044BD4(uint64_t a1, void *a2)
{
  NSString v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100044C3C(void *a1)
{
  uint64_t v2 = sub_10004A6A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10004A6C0();
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010D7C(0, &qword_10006D878);
  uint64_t v9 = (void *)sub_10004A8B0();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  aBlock[4] = sub_100047140;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100023328;
  aBlock[3] = &unk_100064368;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = a1;
  swift_release();
  sub_10004A6B0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10004749C(&qword_10006D880, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005458(&qword_10006D888);
  sub_100006E54((unint64_t *)&qword_10006D890, &qword_10006D888);
  sub_10004A9C0();
  sub_10004A8C0();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v15);
}

uint64_t sub_100044F1C()
{
  return sub_100049B70();
}

void sub_100044F94(unsigned __int8 *a1)
{
  int v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    if (v1)
    {
      id v4 = [Strong parentViewController];
      if (v4)
      {
        char v5 = v4;
        self;
        uint64_t v6 = (void *)swift_dynamicCastObjCClass();
        if (!v6) {
      }
        }
      else
      {
        uint64_t v6 = 0;
      }
      [v6 _pickerDidFloatEyeDropper];
    }
  }
}

void sub_100045054(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    id v4 = *(void **)(Strong + qword_10006E788);
    swift_getKeyPath();
    swift_getKeyPath();
    id v5 = v4;
    sub_100049B60();
    swift_release();
    swift_release();
    sub_100029BA0(v1, v6);
  }
}

void sub_100045130()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    id v2 = [Strong parentViewController];
    if (v2)
    {
      uint64_t v3 = v2;
      self;
      id v4 = (void *)swift_dynamicCastObjCClass();
      if (!v4) {
    }
      }
    else
    {
      id v4 = 0;
    }
    [v4 _pickerDidFinish];
  }
}

char *sub_1000451E4()
{
  return sub_1000435B8();
}

void sub_100045208(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_100046E60();
}

void sub_100045230(void *a1, uint64_t a2, uint64_t a3)
{
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController();
  id v4 = v7.receiver;
  objc_msgSendSuper2(&v7, "viewWillAppear:", a3);
  id v5 = objc_msgSend(v4, "view", v7.receiver, v7.super_class);
  if (v5)
  {
    char v6 = v5;
    [v5 setBackgroundColor:0];
  }
  else
  {
    __break(1u);
  }
}

void sub_1000452CC(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController();
  id v4 = v5.receiver;
  objc_msgSendSuper2(&v5, "viewDidDisappear:", a3);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100049B70();
}

uint64_t sub_10004537C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = qword_10006E7D0;
  *(unsigned char *)(v1 + qword_10006E7D0) = 1;
  if (a1)
  {
    id v4 = a1;
    NSString v5 = sub_10004A700();
    type metadata accessor for CFString(0);
    sub_10004749C((unint64_t *)&qword_10006E920, type metadata accessor for CFString);
    char v6 = (id)kCGColorSpaceSRGB;
    char v7 = sub_1000499E0();

    if (v7)
    {

      char v8 = 0;
    }
    else
    {
      uint64_t v9 = (id)kCGColorSpaceDisplayP3;
      char v10 = sub_1000499E0();

      if (v10)
      {
        char v8 = 1;
      }
      else
      {
        if (qword_10006C058 != -1) {
          swift_once();
        }
        char v8 = byte_100072488;
      }
    }
    id v11 = v4;
    sub_100019828(v11, v8, (uint64_t)&v13);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049B60();

    swift_release();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t result = sub_100049B70();
  *(unsigned char *)(v2 + v3) = 0;
  return result;
}

uint64_t sub_1000455EC(void *a1, uint64_t a2, void *a3)
{
  sub_10004A740();
  id v5 = a3;
  id v6 = a1;
  sub_10004537C(a3);

  return swift_bridgeObjectRelease();
}

CGColorSpaceRef sub_10004566C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005458(&qword_10006C580);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  char v7 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v75 - v8;
  char v10 = *(void **)(v1 + qword_10006E7C8);
  *(void *)(v2 + qword_10006E7C8) = a1;
  id v11 = a1;

  uint64_t v12 = *(void *)(v2 + qword_10006E790);
  LOBYTE(a1) = [v11 _shouldUseDarkGridInDarkMode];
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v86) = (_BYTE)a1;
  swift_retain();
  sub_100049B70();
  id v13 = [v11 title];
  if (!v13)
  {
    sub_100010D7C(0, (unint64_t *)&qword_10006E910);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v15 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v16 = sub_10004A700();
    NSString v17 = sub_10004A700();
    id v13 = [v15 localizedStringForKey:v16 value:0 table:v17];
  }
  uint64_t v18 = sub_10004A740();
  uint64_t v20 = v19;

  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&long long v86 = v18;
  *((void *)&v86 + 1) = v20;
  swift_retain();
  sub_100049B70();
  unsigned __int8 v21 = [v11 _allowsNoColor];
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v86) = v21;
  swift_retain();
  sub_100049B70();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  if (v86) {
    goto LABEL_13;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  if (v88 != 2) {
    goto LABEL_13;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  long long v86 = v84[0];
  long long v87 = v84[1];
  char v88 = v85;
  sub_100018AB4();
  uint64_t v23 = v22;
  uint64_t v24 = (CGColor *)[v22 CGColor];
  uint64_t v25 = CGColorGetColorSpace(v24);

  if (v25)
  {
    uint64_t v26 = (__CFString *)CGColorSpaceCopyName(v25);

    if (v26) {
      goto LABEL_12;
    }
  }
  if (qword_10006C058 != -1) {
    goto LABEL_65;
  }
  while (1)
  {
    if (byte_100072488) {
      id v27 = (id *)&kCGColorSpaceDisplayP3;
    }
    else {
      id v27 = (id *)&kCGColorSpaceSRGB;
    }
    uint64_t v26 = (__CFString *)*v27;
LABEL_12:
    sub_10004A740();
    uint64_t v28 = v23;
    sub_10004537C(v23);

    swift_bridgeObjectRelease();
LABEL_13:
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049B60();
    swift_release();
    swift_release();
    int v29 = LOBYTE(v84[0]);
    if (v29 != [v11 showsAlpha])
    {
      unsigned __int8 v30 = [v11 showsAlpha];
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v84[0]) = v30;
      swift_retain();
      sub_100049B70();
      long long v31 = sub_100029A64((char)[v11 showsAlpha]);
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)&v84[0] = v31;
      swift_retain();
      sub_100049B70();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049B60();
    swift_release();
    swift_release();
    int v32 = LOBYTE(v84[0]);
    if (v32 != [v11 _showsEyedropper])
    {
      unsigned __int8 v33 = [v11 _showsEyedropper];
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v84[0]) = v33;
      swift_retain();
      sub_100049B70();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100049B60();
    swift_release();
    swift_release();
    int v34 = LOBYTE(v84[0]);
    if (v34 != [v11 _showsGridOnly])
    {
      unsigned __int8 v35 = [v11 _showsGridOnly];
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v84[0]) = v35;
      swift_retain();
      sub_100049B70();
    }
    id v36 = [v11 _suggestedColors];
    if (!v36)
    {
      uint64_t v41 = 0;
      goto LABEL_37;
    }
    uint64_t v37 = v36;
    sub_100010D7C(0, &qword_10006DAD8);
    unint64_t v38 = sub_10004A7E0();

    if (v38 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_10004AAA0();
      swift_bridgeObjectRelease();
      if (!v39)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        uint64_t v41 = _swiftEmptyArrayStorage;
LABEL_37:
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100049B60();
        swift_release();
        swift_release();
        if (*(void *)&v84[0])
        {
          if (v41)
          {
            char v57 = sub_100025878(*(uint64_t *)&v84[0], (uint64_t)v41);
            swift_bridgeObjectRelease();
            if (v57)
            {
              swift_bridgeObjectRelease();
              goto LABEL_45;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
LABEL_44:
          swift_getKeyPath();
          swift_getKeyPath();
          *(void *)&v84[0] = v41;
          swift_retain();
          sub_100049B70();
        }
        else if (v41)
        {
          goto LABEL_44;
        }
LABEL_45:
        if ([v11 _userInterfaceStyleForGrid])
        {
          if ([v11 _userInterfaceStyleForGrid] == (id)2)
          {
            uint64_t v58 = (unsigned int *)&enum case for ColorScheme.dark(_:);
            goto LABEL_51;
          }
          if ([v11 _userInterfaceStyleForGrid] == (id)1)
          {
            uint64_t v58 = (unsigned int *)&enum case for ColorScheme.light(_:);
LABEL_51:
            uint64_t v60 = *v58;
            uint64_t v61 = sub_100049C10();
            uint64_t v62 = *(void *)(v61 - 8);
            (*(void (**)(char *, uint64_t, uint64_t))(v62 + 104))(v9, v60, v61);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v9, 0, 1, v61);
LABEL_52:
            swift_getKeyPath();
            swift_getKeyPath();
            sub_1000473D4((uint64_t)v9, (uint64_t)v7);
            swift_retain();
            sub_100049B70();
            sub_10004743C((uint64_t)v9);
          }
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100049B60();
          swift_release();
          swift_release();
          int v63 = LOBYTE(v84[0]);
          if (v63 != [v11 _isEmbedded])
          {
            unsigned __int8 v64 = [v11 _isEmbedded];
            swift_getKeyPath();
            swift_getKeyPath();
            LOBYTE(v84[0]) = v64;
            swift_retain();
            sub_100049B70();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100049B60();
          swift_release();
          swift_release();
          int v65 = LOBYTE(v84[0]);
          if (v65 != [v11 _isInPopoverPresentation])
          {
            unsigned __int8 v66 = [v11 _isInPopoverPresentation];
            swift_getKeyPath();
            swift_getKeyPath();
            LOBYTE(v84[0]) = v66;
            swift_retain();
            sub_100049B70();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100049B60();
          swift_release();
          swift_release();
          int v67 = LOBYTE(v84[0]);
          if (v67 != [v11 _useLandscapeLayout])
          {
            unsigned __int8 v68 = [v11 _useLandscapeLayout];
            swift_getKeyPath();
            swift_getKeyPath();
            LOBYTE(v84[0]) = v68;
            swift_retain();
            sub_100049B70();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100049B60();
          swift_release();
          swift_release();
          double v69 = *(double *)v84;
          [v11 _preferredWidth];
          if (v69 != v70)
          {
            [v11 _preferredWidth];
            uint64_t v72 = v71;
            swift_getKeyPath();
            swift_getKeyPath();
            *(void *)&v84[0] = v72;
            swift_retain();
            sub_100049B70();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100049B60();
          swift_release();
          swift_release();
          int v73 = LOBYTE(v84[0]);
          CGColorSpaceRef result = (CGColorSpaceRef)[v11 _isInSheetPresentation];
          if (v73 != result)
          {
            unsigned __int8 v74 = [v11 _isInSheetPresentation];
            swift_getKeyPath();
            swift_getKeyPath();
            LOBYTE(v84[0]) = v74;
            swift_retain();
            return (CGColorSpaceRef)sub_100049B70();
          }
          return result;
        }
        uint64_t v59 = sub_100049C10();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v9, 1, 1, v59);
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v39 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v39) {
        goto LABEL_36;
      }
    }
    *(void *)&v84[0] = _swiftEmptyArrayStorage;
    uint64_t v23 = v84;
    sub_100025DC8(0, v39 & ~(v39 >> 63), 0);
    if ((v39 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_65:
    swift_once();
  }
  uint64_t v75 = v9;
  int v76 = v7;
  id v77 = v11;
  uint64_t v78 = v12;
  uint64_t v40 = 0;
  uint64_t v41 = *(void **)&v84[0];
  unint64_t v80 = v38 & 0xC000000000000001;
  CFStringRef v79 = kCGColorSpaceSRGB;
  while (1)
  {
    id v42 = v80 ? (id)sub_10004AA10() : *(id *)(v38 + 8 * v40 + 32);
    uint64_t v43 = v42;
    uint64_t v44 = v39;
    unint64_t v45 = v38;
    id v46 = (CGColor *)objc_msgSend(v42, "CGColor", v75, v76, v77, v78, v79);
    CGColorSpaceRef result = (CGColorSpaceRef)UISCreateCachedColorTransform();
    uint64_t v82 = 0;
    uint64_t v83 = 0;
    uint64_t v81 = 0;
    if (!result) {
      break;
    }
    id v48 = result;
    CGColorSpaceRef result = CGColorGetColorSpace(v46);
    if (!result) {
      goto LABEL_68;
    }
    CGColorSpaceRef v49 = result;
    CGColorSpaceRef result = (CGColorSpaceRef)sub_10004A860();
    if (!result)
    {
      __break(1u);
      break;
    }
    CGColorTransformConvertColorComponents();

    swift_bridgeObjectRelease();
    uint64_t v50 = v81;
    uint64_t v51 = v82;
    uint64_t v52 = v83;
    CGFloat Alpha = CGColorGetAlpha(v46);

    *(void *)&v84[0] = v41;
    unint64_t v55 = v41[2];
    unint64_t v54 = v41[3];
    if (v55 >= v54 >> 1)
    {
      sub_100025DC8((char *)(v54 > 1), v55 + 1, 1);
      uint64_t v41 = *(void **)&v84[0];
    }
    ++v40;
    void v41[2] = v55 + 1;
    uint64_t v56 = (CGFloat *)&v41[5 * v55];
    *((void *)v56 + 4) = v50;
    *((void *)v56 + 5) = v51;
    *((void *)v56 + 6) = v52;
    v56[7] = Alpha;
    *((unsigned char *)v56 + 64) = 0;
    uint64_t v39 = v44;
    unint64_t v38 = v45;
    if (v44 == v40)
    {
      swift_bridgeObjectRelease();
      id v11 = v77;
      char v7 = v76;
      uint64_t v9 = v75;
      goto LABEL_37;
    }
  }
  __break(1u);
LABEL_68:
  __break(1u);
  return result;
}

void sub_1000465B0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10004566C(v4);
}

void sub_10004661C(void *a1, int a2, void *aBlock)
{
  id v4 = _Block_copy(aBlock);
  id v5 = (void (*)(void *))v4[2];
  id v6 = a1;
  v5(v4);
  _Block_release(v4);
}

void sub_10004668C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 parentViewController];
  if (v2)
  {
    uint64_t v3 = v2;
    self;
    id v2 = (id)swift_dynamicCastObjCClass();
    if (!v2)
    {

      id v2 = 0;
    }
  }
  id v4 = v2;
  [v2 _pickerDidFinish];
}

uint64_t sub_100046720()
{
  return 1;
}

void sub_100046728()
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v1 = *(void **)(v0 + qword_10006E7C8);
}

id sub_1000467EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _UIColorPickerContentViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100046824(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_super v2 = *(void **)(a1 + qword_10006E7C8);
}

void sub_1000468F4()
{
}

void sub_100046924()
{
}

uint64_t sub_100046954()
{
  return type metadata accessor for _UIColorPickerContentViewController();
}

uint64_t sub_10004695C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046984()
{
  return sub_100031C9C();
}

double sub_1000469AC@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_100046A34()
{
  return sub_100049B70();
}

uint64_t sub_100046AC8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_100046B48()
{
  return sub_100049B70();
}

uint64_t sub_100046BCC@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046BE0()
{
  return sub_100031C9C();
}

uint64_t sub_100046BF4@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046C08()
{
  return sub_100031C9C();
}

uint64_t sub_100046C1C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046C30()
{
  return sub_100031C9C();
}

uint64_t sub_100046C44@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046C58()
{
  return sub_100031C9C();
}

uint64_t sub_100046C6C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046C80()
{
  return sub_100031C9C();
}

uint64_t sub_100046C94@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046CA8()
{
  return sub_100031C9C();
}

uint64_t sub_100046CBC@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046CD0()
{
  return sub_100031C9C();
}

uint64_t sub_100046CE4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049B60();
  swift_release();

  return swift_release();
}

uint64_t sub_100046D60(uint64_t a1)
{
  uint64_t v2 = sub_100005458(&qword_10006C580);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  char v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v7 = (char *)&v9 - v6;
  sub_1000473D4(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000473D4((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_100049B70();
  return sub_10004743C((uint64_t)v7);
}

void sub_100046E60()
{
  id v1 = v0;
  uint64_t v2 = &v0[qword_10006E780];
  *uint64_t v2 = 0x64657463656C6573;
  v2[1] = 0xEB00000000626154;
  uint64_t v3 = qword_10006E788;
  *(void *)&v1[v3] = [objc_allocWithZone((Class)type metadata accessor for FavoritesStore()) init];
  uint64_t v4 = qword_10006E790;
  type metadata accessor for ColorPickerState();
  swift_allocObject();
  *(void *)&v1[v4] = sub_1000123D0((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v1[qword_10006E798] = 0;
  *(void *)&v1[qword_10006E7A0] = 0;
  *(void *)&v1[qword_10006E7A8] = 0;
  *(void *)&v1[qword_10006E7B0] = 0;
  *(void *)&v1[qword_10006E7B8] = 0;
  *(void *)&v1[qword_10006E7C0] = 0;
  *(void *)&v1[qword_10006E7C8] = 0;
  v1[qword_10006E7D0] = 0;

  sub_10004AA90();
  __break(1u);
}

uint64_t sub_100046FAC@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100046FD4()
{
  return sub_100031C9C();
}

uint64_t sub_100047004()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10004703C(uint64_t a1, char a2)
{
}

uint64_t sub_100047044()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004707C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

void sub_1000470B0()
{
}

void sub_1000470B8(unsigned __int8 *a1)
{
}

void sub_1000470C0(unsigned __int8 *a1)
{
}

void sub_1000470C8(uint64_t *a1)
{
}

void sub_1000470D0()
{
}

uint64_t sub_1000470E0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100047118(void *a1)
{
  return sub_10004471C(a1, *(void **)(v1 + 16));
}

uint64_t sub_100047120(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100047130()
{
  return swift_release();
}

uint64_t sub_100047138()
{
  return sub_100044C3C(*(void **)(v0 + 16));
}

uint64_t sub_100047140()
{
  return sub_100044F1C();
}

uint64_t sub_100047148@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100047170()
{
  return sub_100031C9C();
}

uint64_t sub_100047198()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000471D8()
{
  return sub_100044A04();
}

uint64_t sub_1000471E0()
{
  return sub_100044A70(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100047204@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_10004722C()
{
  return sub_100031C9C();
}

uint64_t sub_10004726C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100047294()
{
  return sub_100031C9C();
}

uint64_t sub_1000472CC@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_1000472F4()
{
  return sub_100031C9C();
}

uint64_t sub_10004731C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_100047344()
{
  return sub_100031C9C();
}

uint64_t sub_10004737C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100031C0C(a1);
}

uint64_t sub_1000473A4()
{
  return sub_100031C9C();
}

uint64_t sub_1000473D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005458(&qword_10006C580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004743C(uint64_t a1)
{
  uint64_t v2 = sub_100005458(&qword_10006C580);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004749C(unint64_t *a1, void (*a2)(uint64_t))
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

float sub_100047A48(float *a1, float a2)
{
  float v2 = a1[1];
  float v3 = *a1 * 3.0;
  float v4 = (float)((float)(a1[2] - *a1) * 3.0) - v3;
  float v5 = (float)(1.0 - v3) - v4;
  int v6 = 8;
  float v7 = a2;
  while (1)
  {
    float v8 = v7 * (float)(v3 + (float)(v7 * (float)(v4 + (float)(v5 * v7))));
    if (vabds_f32(v8, a2) < 0.00001) {
      break;
    }
    float v9 = v3 + (float)(v7 * (float)((float)(v4 + v4) + (float)((float)(v5 * 3.0) * v7)));
    if (fabsf(v9) >= 0.000001)
    {
      float v7 = v7 - (float)((float)(v8 - a2) / v9);
      if (--v6) {
        continue;
      }
    }
    float v7 = 0.0;
    if (a2 >= 0.0)
    {
      float v7 = 1.0;
      if (a2 <= 1.0)
      {
        float v10 = 0.0;
        float v11 = 1.0;
        int v12 = -1025;
        float v7 = a2;
        do
        {
          if (__CFADD__(v12++, 1)) {
            break;
          }
          float v14 = v7 * (float)(v3 + (float)(v7 * (float)(v4 + (float)(v5 * v7))));
          if (vabds_f32(v14, a2) < 0.00001) {
            break;
          }
          if ((float)(v14 - a2) >= 0.0) {
            float v11 = v7;
          }
          else {
            float v10 = v7;
          }
          float v7 = (float)(v11 - v10) * 0.5 + v10;
        }
        while (v10 < v11);
      }
    }
    break;
  }
  float v15 = (float)((float)(a1[3] - v2) * 3.0) - (float)(v2 * 3.0);
  return v7
       * (float)((float)(v2 * 3.0)
               + (float)(v7 * (float)(v15 + (float)((float)((float)(1.0 - (float)(v2 * 3.0)) - v15) * v7))));
}

float sub_100047BA0(float *a1, float a2)
{
  float v2 = *a1;
  float v3 = a1[1];
  float v4 = v3 * 3.0;
  float v5 = (float)((float)(a1[3] - v3) * 3.0) - (float)(v3 * 3.0);
  float v6 = (float)(1.0 - v4) - v5;
  int v7 = 8;
  float v8 = a2;
  while (1)
  {
    float v9 = v8 * (float)(v4 + (float)(v8 * (float)(v5 + (float)(v6 * v8))));
    if (vabds_f32(v9, a2) < 0.00001) {
      break;
    }
    float v10 = v4 + (float)(v8 * (float)((float)(v5 + v5) + (float)((float)(v6 * 3.0) * v8)));
    if (fabsf(v10) >= 0.000001)
    {
      float v8 = v8 - (float)((float)(v9 - a2) / v10);
      if (--v7) {
        continue;
      }
    }
    float v8 = 0.0;
    if (a2 >= 0.0)
    {
      float v8 = 1.0;
      if (a2 <= 1.0)
      {
        float v11 = 0.0;
        float v12 = 1.0;
        int v13 = -1025;
        float v8 = a2;
        do
        {
          if (__CFADD__(v13++, 1)) {
            break;
          }
          float v15 = v8 * (float)(v4 + (float)(v8 * (float)(v5 + (float)(v6 * v8))));
          if (vabds_f32(v15, a2) < 0.00001) {
            break;
          }
          if ((float)(v15 - a2) >= 0.0) {
            float v12 = v8;
          }
          else {
            float v11 = v8;
          }
          float v8 = (float)(v12 - v11) * 0.5 + v11;
        }
        while (v11 < v12);
      }
    }
    break;
  }
  float v16 = (float)((float)(a1[2] - v2) * 3.0) - (float)(v2 * 3.0);
  return v8
       * (float)((float)(v2 * 3.0)
               + (float)(v8 * (float)(v16 + (float)((float)((float)(1.0 - (float)(v2 * 3.0)) - v16) * v8))));
}

__n64 sub_100047CF8(double a1)
{
  float v1 = 0.5 - *((float *)&a1 + 1) * 0.5;
  if (v1 >= 0.16667)
  {
    double v3 = v1;
    if (v1 >= 0.33333)
    {
      if (v3 >= 0.500000015)
      {
        if (v1 >= 0.66667)
        {
          double v8 = v3 * 6.0;
          if (v3 >= 0.833333358)
          {
            float v10 = 1.0 - (v8 + -5.0);
            sub_100047A48(flt_100051350, v10);
            return (__n64)COERCE_UNSIGNED_INT(1.0);
          }
          else
          {
            float v9 = v8 + -4.0;
            result.n64_f32[0] = sub_100047A48(flt_100051350, v9);
            result.n64_u32[1] = 0;
          }
        }
        else
        {
          float v6 = 1.0 - (v3 * 6.0 + -3.0);
          float v7 = sub_100047A48(flt_100051350, v6);
          result.n64_u32[0] = 0;
          result.n64_f32[1] = v7;
        }
      }
      else
      {
        float v5 = v3 * 6.0 + -2.0;
        sub_100047A48(flt_100051350, v5);
        result.n64_u32[0] = 0;
        result.n64_u32[1] = 1.0;
      }
    }
    else
    {
      float v4 = 1.0 - (v3 * 6.0 + -1.0);
      result.n64_f32[0] = sub_100047A48(flt_100051350, v4);
      result.n64_u32[1] = 1.0;
    }
  }
  else
  {
    return (__n64)__PAIR64__(COERCE_UNSIGNED_INT(sub_100047A48(flt_100051350, v1 * 6.0)), 1.0);
  }
  return result;
}

float sub_100047EC8(__n128 a1)
{
  if (a1.n128_f32[0] >= a1.n128_f32[1] && a1.n128_f32[0] >= a1.n128_f32[2])
  {
    float v4 = (float)(a1.n128_f32[1] - a1.n128_f32[2]) / (float)(a1.n128_f32[0] - fminf(a1.n128_f32[1], a1.n128_f32[2]));
    goto LABEL_17;
  }
  if (a1.n128_f32[1] >= a1.n128_f32[0] && a1.n128_f32[1] >= a1.n128_f32[2])
  {
    float v5 = (float)(a1.n128_f32[2] - a1.n128_f32[0]) / (float)(a1.n128_f32[1] - fminf(a1.n128_f32[0], a1.n128_f32[2]));
    float v6 = 2.0;
LABEL_16:
    float v4 = v5 + v6;
LABEL_17:
    while (v4 < 0.0)
      float v4 = v4 + 6.0;
    return v4 * 60.0;
  }
  float v4 = 0.0;
  if (a1.n128_f32[2] >= a1.n128_f32[0] && a1.n128_f32[2] >= a1.n128_f32[1])
  {
    float v5 = (float)(a1.n128_f32[0] - a1.n128_f32[1]) / (float)(a1.n128_f32[2] - fminf(a1.n128_f32[0], a1.n128_f32[1]));
    float v6 = 4.0;
    goto LABEL_16;
  }
  return v4 * 60.0;
}

float sub_100047F64(__n128 a1)
{
  float v1 = sub_100047EC8(a1);
  *(void *)&long long v2 = 0;
  int v3 = 100;
  float v4 = 0.5;
  while (1)
  {
    long long v10 = v2;
    v5.n128_u64[0] = sub_100047CF8(*(double *)&v2).n64_u64[0];
    float v6 = sub_100047EC8(v5);
    if (vabds_f32(v1, v6) < 0.001) {
      break;
    }
    long long v7 = v10;
    if (v1 >= v6) {
      float v8 = -v4;
    }
    else {
      float v8 = v4;
    }
    *((float *)&v7 + 1) = *((float *)&v10 + 1) + v8;
    float v4 = v4 * 0.5;
    --v3;
    long long v2 = v7;
    if (!v3) {
      return *((float *)&v2 + 1);
    }
  }
  DWORD1(v2) = DWORD1(v10);
  return *((float *)&v2 + 1);
}

void sub_1000482FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000486CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004873C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10004959C(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 eyedropperDidSelectColor:a2];
    int v3 = *(void **)(a1 + 32);
  }

  return _[v3 eyedropperDidDismiss];
}

uint64_t sub_100049830()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_100049840()
{
  return JSONDecoder.init()();
}

uint64_t sub_100049850()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100049860()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_100049870()
{
  return JSONEncoder.init()();
}

uint64_t sub_100049880()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100049890()
{
  return CharacterSet.isSuperset(of:)();
}

uint64_t sub_1000498A0()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t sub_1000498B0()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_1000498C0()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t sub_1000498D0()
{
  return CharacterSet.union(_:)();
}

uint64_t sub_1000498E0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000498F0()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_100049900()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100049910()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSLocale sub_100049920()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_100049930()
{
  return static Locale.current.getter();
}

uint64_t sub_100049940()
{
  return type metadata accessor for Locale();
}

NSIndexPath sub_100049950()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_100049960()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100049970()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_100049980()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_100049990()
{
  return static Selector.== infix(_:_:)();
}

uint64_t sub_1000499B0()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000499C0()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000499D0()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000499E0()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_1000499F0()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_100049A00()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_100049A10()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100049A20()
{
  return type metadata accessor for UIPointerShape();
}

uint64_t sub_100049A30()
{
  return type metadata accessor for UIPointerEffect();
}

uint64_t sub_100049A40()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t sub_100049A50()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

void sub_100049A60(Swift::OpaquePointer a1)
{
}

uint64_t sub_100049A70()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
}

uint64_t sub_100049A80()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers.getter();
}

uint64_t sub_100049A90()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t sub_100049AA0()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_100049AB0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t sub_100049AC0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_100049AD0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t sub_100049AE0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
}

uint64_t sub_100049AF0()
{
  return static UIShape.circle.getter();
}

uint64_t sub_100049B00()
{
  return type metadata accessor for UIShape();
}

uint64_t sub_100049B10()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_100049B20()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100049B30()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100049B40()
{
  return Published.projectedValue.getter();
}

uint64_t sub_100049B50()
{
  return static Published.subscript.modify();
}

uint64_t sub_100049B60()
{
  return static Published.subscript.getter();
}

uint64_t sub_100049B70()
{
  return static Published.subscript.setter();
}

uint64_t sub_100049B80()
{
  return type metadata accessor for Published();
}

uint64_t sub_100049B90()
{
  return Publisher.combineLatest<A>(_:)();
}

uint64_t sub_100049BA0()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_100049BB0()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t sub_100049BC0()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_100049BD0()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_100049BE0()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_100049BF0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100049C00()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_100049C10()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100049C20()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t sub_100049C30()
{
  return DragGesture.Value.location.getter();
}

uint64_t sub_100049C40()
{
  return type metadata accessor for DragGesture();
}

uint64_t sub_100049C50()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100049C60()
{
  return static GestureMask.all.getter();
}

uint64_t sub_100049C70()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_100049C80()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_100049C90()
{
  return Transaction.disablesAnimations.getter();
}

uint64_t sub_100049CA0()
{
  return Transaction.animation.setter();
}

uint64_t sub_100049CB0()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t sub_100049CC0()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t sub_100049CD0()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t sub_100049CE0()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_100049CF0()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_100049D00()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_100049D10()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100049D20()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100049D30()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t sub_100049D40()
{
  return GeometryProxy.subscript.getter();
}

uint64_t sub_100049D50()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_100049D60()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_100049D70()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_100049D80()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_100049D90()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_100049DA0()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_100049DB0()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100049DC0()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t sub_100049DD0()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_100049DE0()
{
  return ModifiedContent<>.accessibility(label:)();
}

uint64_t sub_100049DF0()
{
  return ModifiedContent<>.accessibilityInputLabels<A>(_:)();
}

uint64_t sub_100049E00()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100049E10()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100049E20()
{
  return static ContentShapeKinds.dragPreview.getter();
}

uint64_t sub_100049E30()
{
  return type metadata accessor for ContentShapeKinds();
}

uint64_t sub_100049E40()
{
  return EnvironmentObject.projectedValue.getter();
}

uint64_t sub_100049E50()
{
  return EnvironmentObject.error()();
}

uint64_t sub_100049E60()
{
  return EnvironmentObject.Wrapper.subscript.getter();
}

uint64_t sub_100049E70()
{
  return EnvironmentObject.init()();
}

uint64_t sub_100049E80()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100049E90()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_100049EA0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_100049EB0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100049EC0()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100049ED0()
{
  return EnvironmentValues.menuTitleVisibility.getter();
}

uint64_t sub_100049EE0()
{
  return EnvironmentValues.menuTitleVisibility.setter();
}

uint64_t sub_100049EF0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100049F00()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100049F10()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_100049F20()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100049F30()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100049F40()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100049F50()
{
  return EnvironmentValues.init()();
}

uint64_t sub_100049F60()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100049F70()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_100049F80()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100049F90()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100049FA0()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t sub_100049FB0()
{
  return static AccessibilityTraits.allowsDirectInteraction.getter();
}

uint64_t sub_100049FC0()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_100049FD0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100049FE0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100049FF0()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t sub_10004A000()
{
  return UIHostingController.safeAreaRegions.setter();
}

uint64_t sub_10004A010()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_10004A020()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t sub_10004A030()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t sub_10004A040()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_10004A060()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t sub_10004A070()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_10004A080()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t sub_10004A090()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t sub_10004A0A0()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t sub_10004A0B0()
{
  return UIViewRepresentable.body.getter();
}

uint64_t sub_10004A0D0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10004A0E0()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t sub_10004A0F0()
{
  return SegmentedPickerStyle.init()();
}

uint64_t sub_10004A100()
{
  return type metadata accessor for SegmentedPickerStyle();
}

uint64_t sub_10004A110()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t sub_10004A120()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t sub_10004A130()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_10004A140()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_10004A150()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t sub_10004A160()
{
  return type metadata accessor for UIViewRepresentableContext();
}

uint64_t sub_10004A170()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_10004A180()
{
  return type metadata accessor for AccessibilityAdjustmentDirection();
}

uint64_t sub_10004A190()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t sub_10004A1A0()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t sub_10004A1B0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10004A1C0()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_10004A1D0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10004A1E0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10004A1F0()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_10004A200()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_10004A210()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_10004A220()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_10004A230()
{
  return static Font.title2.getter();
}

uint64_t sub_10004A240()
{
  return static Font.footnote.getter();
}

uint64_t sub_10004A250()
{
  return static Font.headline.getter();
}

uint64_t sub_10004A260()
{
  return Menu.init(content:label:)();
}

void sub_10004A270()
{
}

uint64_t sub_10004A280()
{
  return Path.move(to:)();
}

uint64_t sub_10004A290()
{
  return Path.addArc(tangent1End:tangent2End:radius:transform:)();
}

uint64_t sub_10004A2A0()
{
  return Path.addLine(to:)();
}

uint64_t sub_10004A2B0()
{
  return Path.init()();
}

uint64_t sub_10004A2C0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_10004A2D0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_10004A2E0()
{
  return Text.font(_:)();
}

uint64_t sub_10004A2F0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10004A300()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10004A310()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10004A320()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_10004A330()
{
  return View.accessibility(activationPoint:)();
}

uint64_t sub_10004A340()
{
  return View.accessibility(label:)();
}

uint64_t sub_10004A350()
{
  return View.accessibility(value:)();
}

uint64_t sub_10004A360()
{
  return View.accessibility(hidden:)();
}

uint64_t sub_10004A370()
{
  return View.accessibility(addTraits:)();
}

uint64_t sub_10004A380()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10004A390()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_10004A3A0()
{
  return View.overrideMenuTitle(_:)();
}

uint64_t sub_10004A3B0()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_10004A3C0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_10004A3D0()
{
  return View.accessibilityAdjustableAction(_:)();
}

uint64_t sub_10004A3E0()
{
  return View.onDrag(_:)();
}

uint64_t sub_10004A3F0()
{
  return View.gesture<A>(_:including:)();
}

uint64_t sub_10004A400()
{
  return Color.init(uiColor:)();
}

uint64_t sub_10004A410()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_10004A420()
{
  return static Color.red.getter();
}

uint64_t sub_10004A430()
{
  return static Color.black.getter();
}

uint64_t sub_10004A440()
{
  return static Color.white.getter();
}

uint64_t sub_10004A450()
{
  return Color.opacity(_:)();
}

uint64_t sub_10004A460()
{
  return static Color.secondary.getter();
}

uint64_t sub_10004A470()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_10004A480()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_10004A4B0()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t sub_10004A4D0()
{
  return static Shape.role.getter();
}

uint64_t sub_10004A4F0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_10004A500()
{
  return State.wrappedValue.getter();
}

uint64_t sub_10004A510()
{
  return State.wrappedValue.setter();
}

uint64_t sub_10004A520()
{
  return State.projectedValue.getter();
}

uint64_t sub_10004A530()
{
  return static Anchor.Source<A>.bounds.getter();
}

uint64_t sub_10004A540()
{
  return Picker.init(selection:label:content:)();
}

uint64_t sub_10004A550()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_10004A560()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_10004A570()
{
  return Binding.subscript.getter();
}

uint64_t sub_10004A580()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_10004A590()
{
  return Binding.init(get:set:)();
}

uint64_t sub_10004A5A0()
{
  return type metadata accessor for Binding();
}

uint64_t sub_10004A5B0()
{
  return type metadata accessor for Capsule();
}

uint64_t sub_10004A5C0()
{
  return Divider.init()();
}

uint64_t sub_10004A5D0()
{
  return type metadata accessor for Divider();
}

uint64_t sub_10004A5E0()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_10004A5F0()
{
  return Gesture.onEnded(_:)();
}

uint64_t sub_10004A600()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t sub_10004A610()
{
  return Gradient.init(colors:)();
}

uint64_t sub_10004A620()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_10004A630()
{
  return static Alignment.top.getter();
}

uint64_t sub_10004A640()
{
  return static Alignment.center.getter();
}

uint64_t sub_10004A650()
{
  return static Animation.default.getter();
}

uint64_t sub_10004A660()
{
  return AnyLayout.init<A>(_:)();
}

uint64_t sub_10004A670()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_10004A680()
{
  return static UnitPoint.leading.getter();
}

uint64_t sub_10004A690()
{
  return static UnitPoint.trailing.getter();
}

uint64_t sub_10004A6A0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10004A6B0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10004A6C0()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_10004A6D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10004A6E0()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t sub_10004A6F0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10004A700()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10004A710()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_10004A720()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10004A730()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10004A740()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004A750()
{
  return String.init(format:_:)();
}

uint64_t sub_10004A760()
{
  return String.hash(into:)();
}

uint64_t sub_10004A770()
{
  return String.count.getter();
}

void sub_10004A780(Swift::String a1)
{
}

void sub_10004A790(Swift::String a1)
{
}

uint64_t sub_10004A7A0()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_10004A7B0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10004A7C0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10004A7D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10004A7E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10004A7F0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10004A800()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10004A810()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10004A820()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10004A830()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10004A840()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10004A860()
{
  return CGColorRef.components.getter();
}

uint64_t sub_10004A870()
{
  return UIHoverStyle.init(shape:)();
}

uint64_t sub_10004A880()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10004A890()
{
  return UIPointerStyle.init(effect:shape:)();
}

uint64_t sub_10004A8A0()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_10004A8B0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10004A8C0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10004A8D0()
{
  return UIEditMenuConfiguration.init(identifier:sourcePoint:)();
}

uint64_t sub_10004A8E0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10004A8F0()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t sub_10004A900()
{
  return UIButton.Configuration.background.modify();
}

uint64_t sub_10004A910()
{
  return UIButton.Configuration.contentInsets.getter();
}

uint64_t sub_10004A920()
{
  return UIButton.Configuration.image.setter();
}

uint64_t sub_10004A930()
{
  return static UIButton.Configuration.plain()();
}

uint64_t sub_10004A940()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_10004A950()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t sub_10004A960()
{
  return UIButton.pointerStyleProvider.setter();
}

uint64_t sub_10004A970()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10004A980()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_10004A990()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10004A9A0()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t sub_10004A9C0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10004A9D0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10004A9E0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_10004A9F0(Swift::Int a1)
{
}

uint64_t sub_10004AA00()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10004AA10()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10004AA20()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10004AA30()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10004AA40()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10004AA50()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10004AA60()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10004AA70()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10004AA80()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10004AA90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10004AAA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10004AAB0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10004AAC0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10004AAD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10004AAE0()
{
  return CollectionDifference.insertions.getter();
}

uint64_t sub_10004AAF0()
{
  return CollectionDifference.removals.getter();
}

uint64_t sub_10004AB00()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int sub_10004AB10(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10004AB20()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10004AB30()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10004AB40()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10004AB50()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_10004AB60()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10004AB70()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10004AB80()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10004AB90()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10004ABA0()
{
  return Error._code.getter();
}

uint64_t sub_10004ABB0()
{
  return Error._domain.getter();
}

uint64_t sub_10004ABC0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10004ABD0()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_10004ABE0()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_10004ABF0()
{
  return Hasher.init(_seed:)();
}

void sub_10004AC00(Swift::UInt a1)
{
}

void sub_10004AC10(Swift::UInt64 a1)
{
}

Swift::Int sub_10004AC20()
{
  return Hasher._finalize()();
}

uint64_t sub_10004AC30()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10004AC40()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  return _CGColorGetAlpha(color);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return _CGColorGetColorSpace(color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return _CGColorSpaceCopyName(space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return _CGColorSpaceGetName(space);
}

uint64_t CGColorTransformConvertColorComponents()
{
  return _CGColorTransformConvertColorComponents();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CUIGetDeviceArtworkDisplayGamut()
{
  return _CUIGetDeviceArtworkDisplayGamut();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UISCreateCachedColorTransform()
{
  return _UISCreateCachedColorTransform();
}

uint64_t UISizeRoundToViewScale()
{
  return _UISizeRoundToViewScale();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uint64_t lroundf(float a1)
{
  return _lroundf(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return _[a1 _commonInit];
}

id objc_msgSend__delegate(void *a1, const char *a2, ...)
{
  return _[a1 _delegate];
}

id objc_msgSend__isEmbedded(void *a1, const char *a2, ...)
{
  return _[a1 _isEmbedded];
}

id objc_msgSend__isInPopoverPresentation(void *a1, const char *a2, ...)
{
  return _[a1 _isInPopoverPresentation];
}

id objc_msgSend__pickerDidDismissEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 _pickerDidDismissEyedropper];
}

id objc_msgSend__pickerDidFinish(void *a1, const char *a2, ...)
{
  return _[a1 _pickerDidFinish];
}

id objc_msgSend__pickerDidFloatEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 _pickerDidFloatEyedropper];
}

id objc_msgSend__pickerDidSelectColor_colorSpace_isVolatile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pickerDidSelectColor:colorSpace:isVolatile:");
}

id objc_msgSend__pickerDidShowEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 _pickerDidShowEyedropper];
}

id objc_msgSend__preferredWidth(void *a1, const char *a2, ...)
{
  return _[a1 _preferredWidth];
}

id objc_msgSend__setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setConfiguration:");
}

id objc_msgSend__setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDelegate:");
}

id objc_msgSend__setInitialBuildingResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInitialBuildingResponder:");
}

id objc_msgSend__setTouchInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTouchInsets:");
}

id objc_msgSend__updateContentViewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _updateContentViewConfiguration];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return _[a1 colorAttachments];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return _[a1 colorPixelFormat];
}

id objc_msgSend_colorWithDisplayP3Red_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithDisplayP3Red:green:blue:alpha:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return _[a1 commandBuffer];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_currentDrawable(void *a1, const char *a2, ...)
{
  return _[a1 currentDrawable];
}

id objc_msgSend_currentRenderPassDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 currentRenderPassDescriptor];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_drawPrimitives_vertexStart_vertexCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawPrimitives:vertexStart:vertexCount:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return _[a1 endEncoding];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eyedropperDidSelectColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eyedropperDidSelectColor:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initializeVertexBuffer(void *a1, const char *a2, ...)
{
  return _[a1 initializeVertexBuffer];
}

id objc_msgSend_invokeEyedropper(void *a1, const char *a2, ...)
{
  return _[a1 invokeEyedropper];
}

id objc_msgSend_keyboardLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 keyboardLayoutGuide];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_mainSystem(void *a1, const char *a2, ...)
{
  return _[a1 mainSystem];
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithTitle:image:identifier:options:children:");
}

id objc_msgSend_newBufferWithBytes_length_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBufferWithBytes:length:options:");
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return _[a1 newCommandQueue];
}

id objc_msgSend_newDefaultLibrary(void *a1, const char *a2, ...)
{
  return _[a1 newDefaultLibrary];
}

id objc_msgSend_newFunctionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newFunctionWithName:");
}

id objc_msgSend_newRenderPipelineStateWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRenderPipelineStateWithDescriptor:error:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_presentDrawable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentDrawable:");
}

id objc_msgSend_renderCommandEncoderWithDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderCommandEncoderWithDescriptor:");
}

id objc_msgSend_replaceMenuForIdentifier_withMenu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceMenuForIdentifier:withMenu:");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setCaptureObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaptureObject:");
}

id objc_msgSend_setClearColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClearColor:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setFloatEyedropperOnStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFloatEyedropperOnStart:");
}

id objc_msgSend_setFragmentFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFragmentFunction:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHitTestsAsOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestsAsOpaque:");
}

id objc_msgSend_setPixelFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPixelFormat:");
}

id objc_msgSend_setRenderPipelineState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderPipelineState:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setVertexBuffer_offset_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVertexBuffer:offset:atIndex:");
}

id objc_msgSend_setVertexFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVertexFunction:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_set_preferredWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preferredWidth:");
}

id objc_msgSend_setupRenderPipeline(void *a1, const char *a2, ...)
{
  return _[a1 setupRenderPipeline];
}

id objc_msgSend_sharedCaptureManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedCaptureManager];
}

id objc_msgSend_showSamplerWithSelectionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSamplerWithSelectionHandler:");
}

id objc_msgSend_startCaptureWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCaptureWithDescriptor:error:");
}

id objc_msgSend_stopCapture(void *a1, const char *a2, ...)
{
  return _[a1 stopCapture];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _[a1 system];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}