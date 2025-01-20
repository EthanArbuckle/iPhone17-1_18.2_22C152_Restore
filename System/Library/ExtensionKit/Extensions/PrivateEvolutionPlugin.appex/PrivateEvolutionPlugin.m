void type metadata accessor for ECMessageBodyStringAccumulatorOptions(uint64_t a1)
{
  sub_100005B48(a1, &qword_100044480);
}

uint64_t sub_100003448(char *a1, char *a2)
{
  return sub_100015D24(*a1, *a2);
}

Swift::Int sub_100003454()
{
  return sub_1000034A8();
}

uint64_t sub_100003460()
{
  sub_100036870();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000034A0()
{
  return sub_1000034A8();
}

Swift::Int sub_1000034A8()
{
  return sub_100036ED0();
}

uint64_t sub_100003504@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000049A4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100003534(void *a1@<X8>)
{
  *a1 = qword_1000380D8[*v1];
  a1[1] = 0xE300000000000000;
}

void sub_100003550(void *a1@<X8>)
{
  *a1 = &off_1000414D8;
}

uint64_t sub_100003560()
{
  return sub_100036930();
}

uint64_t sub_1000035C0()
{
  return sub_100036920();
}

BOOL sub_100003610(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100003628()
{
  sub_100036EC0(*v0);
}

uint64_t sub_100003658()
{
  uint64_t v1 = 0x756F487472617473;
  if (*v0 != 1) {
    uint64_t v1 = 0x72756F48646E65;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x737961446B656577;
  }
}

uint64_t sub_1000036B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000049F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000036E0()
{
  return 0;
}

void sub_1000036EC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1000036F8(uint64_t a1)
{
  unint64_t v2 = sub_100006808();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003734(uint64_t a1)
{
  unint64_t v2 = sub_100006808();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100003770(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100006780(&qword_1000445D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000067C4(a1, a1[3]);
  sub_100006808();
  sub_100036EF0();
  sub_100006B90(v3, (uint64_t)v12, &qword_1000445D8);
  sub_100006B90((uint64_t)v12, (uint64_t)v11, &qword_1000445D8);
  v10[15] = 0;
  sub_100006780(&qword_100044528);
  sub_100006900(&qword_1000445E0, (void (*)(void))sub_100006970);
  sub_100036D70();
  if (!v2)
  {
    v11[0] = 1;
    sub_100036D60();
    v11[0] = 2;
    sub_100036D60();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_100003974@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100004B54(a1, (uint64_t)v6);
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

uint64_t sub_1000039BC(void *a1)
{
  return sub_100003770(a1);
}

uint64_t sub_1000039F8(char a1)
{
  uint64_t result = 0x737961447473616CLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x617373654D78616DLL;
      break;
    case 2:
      uint64_t result = 0x74676E654C78616DLL;
      break;
    case 3:
      uint64_t v3 = 0x7265746C6966;
      goto LABEL_6;
    case 4:
      uint64_t v3 = 0x656C676E6973;
LABEL_6:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x654D000000000000;
      break;
    case 5:
      uint64_t result = 0x5470756E61656C63;
      break;
    case 6:
      uint64_t result = 0x676E696C706D6173;
      break;
    case 7:
      uint64_t result = 0x72437265746C6966;
      break;
    case 8:
      uint64_t result = 0xD000000000000015;
      break;
    case 9:
      uint64_t result = 0xD000000000000018;
      break;
    case 10:
      uint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100003B88(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100006780(&qword_100044610);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000067C4(a1, a1[3]);
  sub_100006A18();
  sub_100036EF0();
  v11[0] = 0;
  sub_100036DA0();
  if (!v2)
  {
    v11[0] = 1;
    sub_100036DA0();
    v11[0] = 2;
    sub_100036DA0();
    v11[0] = 3;
    sub_100036D50();
    v11[0] = 4;
    sub_100036D50();
    v11[0] = 5;
    sub_100036D50();
    v11[0] = 6;
    sub_100036D60();
    sub_100006B90(v3 + 48, (uint64_t)v12, &qword_100044618);
    sub_100006B90((uint64_t)v12, (uint64_t)v11, &qword_100044618);
    v10[15] = 7;
    sub_100006BF4();
    sub_100036D70();
    v11[0] = 8;
    sub_100036D40();
    v11[0] = 9;
    sub_100036D50();
    v11[0] = 10;
    sub_100036D40();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int sub_100003E8C()
{
  Swift::UInt v1 = *v0;
  sub_100036EB0();
  sub_100036EC0(v1);
  return sub_100036ED0();
}

Swift::Int sub_100003ED4()
{
  Swift::UInt v1 = *v0;
  sub_100036EB0();
  sub_100036EC0(v1);
  return sub_100036ED0();
}

uint64_t sub_100003F18()
{
  return sub_1000039F8(*v0);
}

uint64_t sub_100003F20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100004DC8(a1, a2);
  *a3 = result;
  return result;
}

void sub_100003F48(unsigned char *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_100003F54(uint64_t a1)
{
  unint64_t v2 = sub_100006A18();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003F90(uint64_t a1)
{
  unint64_t v2 = sub_100006A18();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_100003FCC@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_1000052D8(a1, v9);
  if (!v2)
  {
    long long v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    long long v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    long long v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    double result = *(double *)&v10;
    long long v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

uint64_t sub_100004020(void *a1)
{
  return sub_100003B88(a1);
}

uint64_t sub_10000406C(uint64_t a1, uint64_t a2)
{
  return sub_10000480C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

void sub_100004090(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100004098@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1000040AC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1000040C0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1000040D4(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100004104@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100004130@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100004154(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100004168(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_10000417C(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100004190@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1000041A4(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1000041B8(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1000041CC(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1000041E0()
{
  return *v0 == 0;
}

uint64_t sub_1000041F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100004208(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_10000421C(uint64_t a1, id *a2)
{
  uint64_t result = sub_1000367A0();
  *a2 = 0;
  return result;
}

uint64_t sub_100004294(uint64_t a1, id *a2)
{
  char v3 = sub_1000367B0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004314@<X0>(void *a1@<X8>)
{
  sub_1000367C0();
  NSString v2 = sub_100036790();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_100004360(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100004374@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100005AD4(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_1000043B4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000043C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000367C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000043F4(uint64_t a1)
{
  uint64_t v2 = sub_10000455C(&qword_100044580, type metadata accessor for ECMessageHeaderKey);
  uint64_t v3 = sub_10000455C(&qword_100044588, type metadata accessor for ECMessageHeaderKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void *sub_1000044B0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000044C0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000044CC()
{
  return sub_10000455C(&qword_100044488, type metadata accessor for ECMessageBodyStringAccumulatorOptions);
}

uint64_t sub_100004514()
{
  return sub_10000455C(&qword_100044490, type metadata accessor for ECMessageBodyStringAccumulatorOptions);
}

uint64_t sub_10000455C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000045A4()
{
  return sub_10000455C(&qword_100044498, type metadata accessor for ECMessageBodyStringAccumulatorOptions);
}

uint64_t sub_1000045EC()
{
  return sub_10000455C(&qword_1000444A0, type metadata accessor for ECMessageBodyStringAccumulatorOptions);
}

uint64_t sub_100004634(uint64_t a1)
{
  uint64_t v2 = sub_10000455C((unint64_t *)&qword_1000445A0, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v3 = sub_10000455C(&qword_1000445A8, type metadata accessor for DocumentReadingOptionKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000046F0@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100036790();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004738(uint64_t a1)
{
  uint64_t v2 = sub_10000455C(&qword_100044590, type metadata accessor for DocumentType);
  uint64_t v3 = sub_10000455C(&qword_100044598, type metadata accessor for DocumentType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000047F4(uint64_t a1, uint64_t a2)
{
  return sub_10000480C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000480C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1000367C0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100004850()
{
  sub_1000367C0();
  sub_100036870();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000048A4()
{
  sub_1000367C0();
  sub_100036EB0();
  sub_100036870();
  Swift::Int v0 = sub_100036ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004918()
{
  uint64_t v0 = sub_1000367C0();
  uint64_t v2 = v1;
  if (v0 == sub_1000367C0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100036E10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1000049A4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100041410;
  v6._object = a2;
  unint64_t v4 = sub_100036C90(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000049F0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x737961446B656577 && a2 == 0xE800000000000000;
  if (v2 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F487472617473 && a2 == 0xE900000000000072 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72756F48646E65 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100036E10();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100004B54@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100006780(&qword_1000445B0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  long long v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067C4(a1, a1[3]);
  sub_100006808();
  sub_100036EE0();
  if (v2)
  {
    sub_10000685C((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100006780(&qword_100044528);
    char v21 = 0;
    sub_100006900(&qword_1000445C0, (void (*)(void))sub_1000068AC);
    sub_100036CD0();
    uint64_t v9 = v22;
    char v20 = 1;
    uint64_t v10 = sub_100036CC0();
    int v18 = v11;
    char v19 = 2;
    uint64_t v12 = sub_100036CC0();
    long long v13 = v8;
    char v15 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v5);
    uint64_t result = sub_10000685C((uint64_t)a1);
    *(void *)a2 = v9;
    *(void *)(a2 + 8) = v10;
    *(unsigned char *)(a2 + 16) = v18 & 1;
    *(void *)(a2 + 24) = v12;
    *(unsigned char *)(a2 + 32) = v15 & 1;
  }
  return result;
}

uint64_t sub_100004DC8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x737961447473616CLL && a2 == 0xE800000000000000;
  if (v2 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617373654D78616DLL && a2 == 0xEB00000000736567 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74676E654C78616DLL && a2 == 0xE900000000000068 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x654D7265746C6966 && a2 == 0xEE00736567617373 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x654D656C676E6973 && a2 == 0xEE00736567617373 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x5470756E61656C63 && a2 == 0xEB00000000747865 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x676E696C706D6173 && a2 == 0xEC000000657A6953 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x72437265746C6966 && a2 == 0xEE00616972657469 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001000397D0 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000001000397F0 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000100039810)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    char v6 = sub_100036E10();
    swift_bridgeObjectRelease();
    if (v6) {
      return 10;
    }
    else {
      return 11;
    }
  }
}

uint64_t sub_1000052D8@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v45 = sub_100006780(&qword_1000445F8);
  uint64_t v5 = *(void *)(v45 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v79 = 1;
  sub_1000067C4(a1, a1[3]);
  sub_100006A18();
  sub_100036EE0();
  v46 = a1;
  if (v2)
  {
    uint64_t v82 = v2;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v45 = 0;
    long long v50 = 0uLL;
    uint64_t v10 = 0;
    char v11 = 0;
    char v12 = 0;
    LOBYTE(v13) = 0;
    uint64_t v14 = 7;
    uint64_t v15 = 128;
    uint64_t v16 = 2048;
    unsigned long long v49 = 1uLL;
LABEL_4:
    sub_10000685C((uint64_t)v46);
    uint64_t v60 = v14;
    uint64_t v61 = v15;
    *(void *)&long long v62 = v16;
    BYTE8(v62) = v13;
    BYTE9(v62) = v12;
    BYTE10(v62) = v11;
    *(_DWORD *)((char *)&v62 + 11) = v80;
    HIBYTE(v62) = v81;
    uint64_t v63 = v10;
    char v64 = v79;
    *(_DWORD *)v65 = *(_DWORD *)v78;
    *(_DWORD *)&v65[3] = *(_DWORD *)&v78[3];
    unsigned long long v66 = v49;
    long long v67 = v50;
    char v68 = BYTE4(v47);
    *(_DWORD *)v69 = *(_DWORD *)v77;
    *(_DWORD *)&v69[3] = *(_DWORD *)&v77[3];
    uint64_t v70 = v48;
    uint64_t v71 = v45;
    char v72 = v47;
    *(_DWORD *)v73 = *(_DWORD *)v76;
    *(_DWORD *)&v73[3] = *(_DWORD *)&v76[3];
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    return sub_100006A6C((uint64_t)&v60);
  }
  uint64_t v8 = v5;
  LOBYTE(v60) = 0;
  uint64_t v9 = v45;
  uint64_t v44 = sub_100036D00();
  LOBYTE(v60) = 1;
  uint64_t v43 = sub_100036D00();
  LOBYTE(v60) = 2;
  uint64_t v42 = sub_100036D00();
  LOBYTE(v60) = 3;
  int v13 = sub_100036CB0();
  LOBYTE(v60) = 4;
  int v41 = sub_100036CB0();
  LOBYTE(v60) = 5;
  int v40 = sub_100036CB0();
  LOBYTE(v60) = 6;
  uint64_t v18 = sub_100036CC0();
  uint64_t v82 = 0;
  int v20 = v19;
  uint64_t v39 = v18;
  char v79 = v19 & 1;
  LOBYTE(v51) = 7;
  sub_100006AD4();
  uint64_t v21 = v82;
  sub_100036CD0();
  if (v21)
  {
    uint64_t v82 = v21;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v9);
    char v12 = v41;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v45 = 0;
    long long v50 = 0uLL;
    unsigned long long v49 = 1uLL;
    uint64_t v15 = v43;
    uint64_t v14 = v44;
    uint64_t v16 = v42;
LABEL_10:
    char v11 = v40;
    uint64_t v10 = v39;
    goto LABEL_4;
  }
  int v38 = v20;
  uint64_t v22 = v60;
  int v23 = v63;
  LOBYTE(v60) = 8;
  unsigned long long v49 = __PAIR128__(v61, v22);
  long long v50 = v62;
  sub_100006B28(v22);
  uint64_t v48 = sub_100036CA0();
  uint64_t v82 = 0;
  HIDWORD(v47) = v23;
  LOBYTE(v60) = 9;
  uint64_t v25 = v24;
  swift_bridgeObjectRetain();
  uint64_t v26 = v82;
  LODWORD(v47) = sub_100036CB0();
  uint64_t v82 = v26;
  if (v26)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v45);
    uint64_t v45 = v25;
    swift_bridgeObjectRelease();
    sub_100006AC4(v49);
    LODWORD(v47) = 0;
    uint64_t v15 = v43;
    uint64_t v14 = v44;
    uint64_t v16 = v42;
    char v12 = v41;
    goto LABEL_10;
  }
  char v59 = 10;
  uint64_t v37 = sub_100036CA0();
  uint64_t v82 = 0;
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v45);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&long long v51 = v44;
  *((void *)&v51 + 1) = v43;
  *(void *)&long long v52 = v42;
  HIDWORD(v36) = v13;
  BYTE8(v52) = v13;
  BYTE9(v52) = v41;
  BYTE10(v52) = v40;
  *(void *)&long long v53 = v39;
  BYTE8(v53) = v38 & 1;
  unsigned long long v29 = v49;
  unsigned long long v54 = v49;
  long long v30 = v50;
  long long v55 = v50;
  LOBYTE(v56) = BYTE4(v47);
  *((void *)&v56 + 1) = v48;
  *(void *)&long long v57 = v25;
  BYTE8(v57) = v47;
  *(void *)&long long v58 = v37;
  *((void *)&v58 + 1) = v28;
  sub_100006B38((uint64_t)&v51);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v31 = BYTE4(v47);
  sub_100006AC4(v29);
  sub_10000685C((uint64_t)v46);
  uint64_t v60 = v44;
  uint64_t v61 = v43;
  *(void *)&long long v62 = v42;
  BYTE8(v62) = BYTE4(v36);
  BYTE9(v62) = v41;
  BYTE10(v62) = v40;
  uint64_t v63 = v39;
  char v64 = v79;
  unsigned long long v66 = v29;
  long long v67 = v30;
  char v68 = v31;
  uint64_t v70 = v48;
  uint64_t v71 = v25;
  char v72 = v47;
  uint64_t v74 = v37;
  uint64_t v75 = v28;
  uint64_t result = sub_100006A6C((uint64_t)&v60);
  long long v32 = v56;
  a2[4] = v55;
  a2[5] = v32;
  long long v33 = v58;
  a2[6] = v57;
  a2[7] = v33;
  long long v34 = v52;
  *a2 = v51;
  a2[1] = v34;
  unsigned long long v35 = v54;
  a2[2] = v53;
  a2[3] = v35;
  return result;
}

uint64_t sub_100005AD4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v4 = (uint64_t *)(a1 + 32);
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

void type metadata accessor for ECMessageHeaderKey(uint64_t a1)
{
}

void type metadata accessor for DocumentType(uint64_t a1)
{
}

void type metadata accessor for DocumentReadingOptionKey(uint64_t a1)
{
}

void sub_100005B48(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for FilterCriteria(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FilterCriteria()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FilterCriteria(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FilterCriteria(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  return a1;
}

__n128 initializeWithTake for FilterCriteria(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FilterCriteria(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for FilterCriteria(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FilterCriteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FilterCriteria()
{
  return &type metadata for FilterCriteria;
}

unsigned char *initializeBufferWithCopyOfBuffer for WeekDay(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WeekDay(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WeekDay(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x100005F18);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WeekDay()
{
  return &type metadata for WeekDay;
}

uint64_t destroy for ExtractEmailParameters(uint64_t a1)
{
  if (*(void *)(a1 + 48) != 1) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ExtractEmailParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 48);
  if (v4 == 1)
  {
    long long v5 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v5;
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  }
  else
  {
    uint64_t v6 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = v6;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    swift_bridgeObjectRetain();
  }
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v8 = *(void *)(a2 + 112);
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ExtractEmailParameters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = a1 + 48;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v8 = (long long *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 48);
  if (v6 == 1)
  {
    if (v7 == 1)
    {
      long long v9 = *v8;
      long long v10 = *(_OWORD *)(a2 + 64);
      *(unsigned char *)(v5 + 32) = *(unsigned char *)(a2 + 80);
      *(_OWORD *)uint64_t v5 = v9;
      *(_OWORD *)(v5 + 16) = v10;
    }
    else
    {
      *(void *)(a1 + 48) = v7;
      uint64_t v13 = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      *(void *)(a1 + 56) = v13;
      uint64_t v14 = *(void *)(a2 + 72);
      *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
      *(void *)(a1 + 72) = v14;
      swift_bridgeObjectRetain();
    }
  }
  else if (v7 == 1)
  {
    sub_1000061DC(v5);
    char v11 = *((unsigned char *)v8 + 32);
    long long v12 = v8[1];
    *(_OWORD *)uint64_t v5 = *v8;
    *(_OWORD *)(v5 + 16) = v12;
    *(unsigned char *)(v5 + 32) = v11;
  }
  else
  {
    *(void *)(a1 + 48) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)(a2 + 56);
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *(void *)(a1 + 56) = v15;
    uint64_t v16 = *(void *)(a2 + 72);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    *(void *)(a1 + 72) = v16;
  }
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000061DC(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for ExtractEmailParameters(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for ExtractEmailParameters(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = a1 + 48;
  uint64_t v6 = a2 + 48;
  uint64_t v5 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48) != 1)
  {
    if (v5 != 1)
    {
      *(void *)(a1 + 48) = v5;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
      goto LABEL_6;
    }
    sub_1000061DC(v4);
  }
  long long v7 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v6;
  *(_OWORD *)(v4 + 16) = v7;
  *(unsigned char *)(v4 + 32) = *(unsigned char *)(v6 + 32);
LABEL_6:
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtractEmailParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 96);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtractEmailParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 128) = 0;
    }
    if (a2) {
      *(void *)(result + 96) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractEmailParameters()
{
  return &type metadata for ExtractEmailParameters;
}

unint64_t sub_1000063FC()
{
  unint64_t result = qword_100044520;
  if (!qword_100044520)
  {
    sub_100006458(&qword_100044528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044520);
  }
  return result;
}

uint64_t sub_100006458(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000064A4()
{
  unint64_t result = qword_100044530;
  if (!qword_100044530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044530);
  }
  return result;
}

uint64_t sub_1000064F8()
{
  return sub_10000455C(&qword_100044538, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_100006540()
{
  return sub_10000455C(&qword_100044540, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_100006588()
{
  return sub_10000455C(&qword_100044548, type metadata accessor for DocumentType);
}

uint64_t sub_1000065D0()
{
  return sub_10000455C(&qword_100044550, type metadata accessor for DocumentType);
}

uint64_t sub_100006618()
{
  return sub_10000455C(&qword_100044558, type metadata accessor for DocumentType);
}

uint64_t sub_100006660()
{
  return sub_10000455C(&qword_100044560, type metadata accessor for ECMessageHeaderKey);
}

uint64_t sub_1000066A8()
{
  return sub_10000455C(&qword_100044568, type metadata accessor for ECMessageHeaderKey);
}

uint64_t sub_1000066F0()
{
  return sub_10000455C(&qword_100044570, type metadata accessor for ECMessageHeaderKey);
}

uint64_t sub_100006738()
{
  return sub_10000455C(&qword_100044578, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_100006780(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_1000067C4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100006808()
{
  unint64_t result = qword_1000445B8;
  if (!qword_1000445B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445B8);
  }
  return result;
}

uint64_t sub_10000685C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_1000068AC()
{
  unint64_t result = qword_1000445C8;
  if (!qword_1000445C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445C8);
  }
  return result;
}

uint64_t sub_100006900(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006458(&qword_100044528);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100006970()
{
  unint64_t result = qword_1000445E8;
  if (!qword_1000445E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445E8);
  }
  return result;
}

unint64_t sub_1000069C4()
{
  unint64_t result = qword_1000445F0;
  if (!qword_1000445F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445F0);
  }
  return result;
}

unint64_t sub_100006A18()
{
  unint64_t result = qword_100044600;
  if (!qword_100044600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044600);
  }
  return result;
}

uint64_t sub_100006A6C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006AC4(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100006AD4()
{
  unint64_t result = qword_100044608;
  if (!qword_100044608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044608);
  }
  return result;
}

uint64_t sub_100006B28(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100006B38(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006B90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006780(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100006BF4()
{
  unint64_t result = qword_100044620;
  if (!qword_100044620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044620);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ExtractEmailParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExtractEmailParameters.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x100006DA4);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractEmailParameters.CodingKeys()
{
  return &type metadata for ExtractEmailParameters.CodingKeys;
}

uint64_t getEnumTagSinglePayload for FilterCriteria.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FilterCriteria.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100006F38);
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

uint64_t sub_100006F60(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100006F68(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FilterCriteria.CodingKeys()
{
  return &type metadata for FilterCriteria.CodingKeys;
}

unint64_t sub_100006F84()
{
  unint64_t result = qword_100044628;
  if (!qword_100044628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044628);
  }
  return result;
}

unint64_t sub_100006FDC()
{
  unint64_t result = qword_100044630;
  if (!qword_100044630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044630);
  }
  return result;
}

unint64_t sub_100007034()
{
  unint64_t result = qword_100044638;
  if (!qword_100044638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044638);
  }
  return result;
}

unint64_t sub_10000708C()
{
  unint64_t result = qword_100044640;
  if (!qword_100044640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044640);
  }
  return result;
}

unint64_t sub_1000070E4()
{
  unint64_t result = qword_100044648;
  if (!qword_100044648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044648);
  }
  return result;
}

unint64_t sub_10000713C()
{
  unint64_t result = qword_100044650;
  if (!qword_100044650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044650);
  }
  return result;
}

uint64_t sub_1000071B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v49 = a1;
  uint64_t v15 = sub_100036590();
  uint64_t v54 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  long long v50 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  int v19 = (char *)&v41 - v18;
  uint64_t result = sub_1000075D8(a4, a5, a6, a7, a8, 0, 0);
  if (!result) {
    return result;
  }
  uint64_t v21 = result;
  uint64_t v53 = *(void *)(result + 16);
  if (!v53)
  {
    swift_bridgeObjectRelease();
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v22 = 0;
  unint64_t v48 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  unint64_t v52 = result + v48;
  uint64_t v56 = v54 + 16;
  long long v51 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
  uint64_t v47 = (void (**)(char *, char *, uint64_t))(v54 + 32);
  uint64_t v42 = a3 + 9;
  long long v55 = (char *)_swiftEmptyArrayStorage;
  uint64_t v46 = a2;
  while (1)
  {
    if (v22 >= *(void *)(v21 + 16))
    {
      __break(1u);
      goto LABEL_48;
    }
    uint64_t v23 = *(void *)(v54 + 72);
    uint64_t v24 = *(void (**)(char *, unint64_t, uint64_t))(v54 + 16);
    v24(v19, v52 + v23 * v22, v15);
    if (a2)
    {
      uint64_t v25 = sub_100036540();
      if (!v26) {
        goto LABEL_5;
      }
      if (v25 == v49 && v26 == a2)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v27 = sub_100036E10();
        swift_bridgeObjectRelease();
        if ((v27 & 1) == 0) {
          goto LABEL_5;
        }
      }
    }
    if (!a3) {
      goto LABEL_25;
    }
    uint64_t v28 = sub_100036520();
    uint64_t v30 = v29 ? v28 : 0;
    unint64_t v31 = v29 ? v29 : 0xE000000000000000;
    long long v32 = a3;
    uint64_t v33 = a3[2];
    if (v33)
    {
      if (v32[4] == v30 && v32[5] == v31 || (sub_100036E10() & 1) != 0)
      {
LABEL_24:
        swift_bridgeObjectRelease();
        a3 = v32;
        a2 = v46;
LABEL_25:
        v24(v50, (unint64_t)v19, v15);
        unint64_t v34 = (unint64_t)v55;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v34 = sub_10000A8F4(0, *(void *)(v34 + 16) + 1, 1, v34);
        }
        unint64_t v36 = *(void *)(v34 + 16);
        unint64_t v35 = *(void *)(v34 + 24);
        long long v55 = (char *)v34;
        if (v36 >= v35 >> 1) {
          long long v55 = (char *)sub_10000A8F4(v35 > 1, v36 + 1, 1, (unint64_t)v55);
        }
        uint64_t v37 = v55;
        *((void *)v55 + 2) = v36 + 1;
        (*v47)(&v37[v48 + v36 * v23], v50, v15);
        goto LABEL_5;
      }
      if (v33 != 1)
      {
        if (v32[6] == v30 && v32[7] == v31) {
          goto LABEL_24;
        }
        uint64_t result = sub_100036E10();
        if (result) {
          goto LABEL_24;
        }
        if (v33 != 2) {
          break;
        }
      }
    }
LABEL_4:
    swift_bridgeObjectRelease();
    a3 = v32;
    a2 = v46;
LABEL_5:
    ++v22;
    uint64_t result = (*v51)(v19, v15);
    if (v22 == v53)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v55;
    }
  }
  int v38 = v42;
  uint64_t v39 = 2;
  while (!__OFADD__(v39, 1))
  {
    if (*(v38 - 1) == v30 && *v38 == v31) {
      goto LABEL_24;
    }
    uint64_t v44 = v39;
    uint64_t v45 = v38;
    uint64_t v43 = v39 + 1;
    uint64_t result = sub_100036E10();
    if (result) {
      goto LABEL_24;
    }
    int v38 = v45 + 2;
    uint64_t v39 = v44 + 1;
    if (v43 == v33) {
      goto LABEL_4;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_1000075D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = sub_100006780(&qword_100044658);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = &v28[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  uint64_t v17 = &v28[-v16];
  sub_100007C00();
  sub_100007C40(a1, (uint64_t)v17);
  sub_100007C40(a2, (uint64_t)v15);
  if ((a7 | a6) < 0)
  {
    __break(1u);
    swift_once();
    uint64_t v20 = sub_1000365C0();
    sub_100007D00(v20, (uint64_t)qword_1000488A0);
    uint64_t v21 = sub_1000365A0();
    os_log_type_t v22 = sub_100036AA0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to access Biome storage.", v23, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
    return 0;
  }
  else
  {
    id v18 = sub_1000078E4((uint64_t)v17, (uint64_t)v15, a6, a7, a3 & 1);
    sub_100036500();
    sub_100007CA8();
    id v19 = v18;
    sub_100036510();

    sub_100007D38(&v29, (uint64_t)v30);
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = _swiftEmptyArrayStorage;
    uint64_t v25 = (uint64_t *)(v24 + 16);
    sub_1000067C4(v30, v30[3]);
    swift_retain();
    sub_1000365D0();
    swift_release();
    swift_release();

    swift_beginAccess();
    uint64_t v26 = *v25;
    swift_bridgeObjectRetain();
    swift_release();
    sub_10000685C((uint64_t)v30);
  }
  return v26;
}

id sub_1000078E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_100036250();
  uint64_t v10 = *(void *)(v9 - 8);
  char v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  Class isa = 0;
  if (v11(a1, 1, v9) != 1)
  {
    Class isa = sub_100036210().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    Class v13 = 0;
  }
  else
  {
    Class v13 = sub_100036210().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithStartDate:isa endDate:v13 maxEvents:a3 lastN:a4 reversed:a5 & 1];

  return v14;
}

uint64_t sub_100007A64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100036590();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = (unint64_t *)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  swift_beginAccess();
  unint64_t v9 = *(void *)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v9 = sub_10000A8F4(0, *(void *)(v9 + 16) + 1, 1, v9);
    unint64_t *v8 = v9;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    unint64_t v9 = sub_10000A8F4(v11 > 1, v12 + 1, 1, v9);
    unint64_t *v8 = v9;
  }
  *(void *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v12, v7, v4);
  return swift_endAccess();
}

unint64_t sub_100007C00()
{
  unint64_t result = qword_100044660;
  if (!qword_100044660)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100044660);
  }
  return result;
}

uint64_t sub_100007C40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_100044658);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100007CA8()
{
  unint64_t result = qword_100044668;
  if (!qword_100044668)
  {
    sub_100036500();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044668);
  }
  return result;
}

uint64_t sub_100007D00(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007D38(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100007D50()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007D88(uint64_t a1)
{
  return sub_100007A64(a1, v1);
}

uint64_t Embedder.embeddingModel.getter()
{
  return sub_100036820();
}

uint64_t MADTextEmbedder.init()(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100007E04, 0, 0);
}

uint64_t sub_100007E04()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = [self service];
  v1[1] = 0;
  v1[2] = 0;
  void *v1 = v2;
  long long v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t MADTextEmbedder.init(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_100007EAC, 0, 0);
}

uint64_t sub_100007EAC()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  long long v3 = (void *)v0[2];
  *long long v3 = [self service];
  v3[1] = v1;
  v3[2] = v2;
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t MADTextEmbedder.embed(text:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  *(void *)(v3 + 56) = *(void *)v2;
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(v2 + 8);
  return _swift_task_switch(sub_100007F6C, 0, 0);
}

uint64_t sub_100007F6C()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 40);
  *(void *)(v0 + 16) = *(void *)(v0 + 56);
  *(_OWORD *)(v0 + 24) = *(_OWORD *)(v0 + 64);
  sub_100006780(&qword_100044688);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 80) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_100038110;
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 88) = v4;
  *(void *)uint64_t v4 = v0;
  *(void *)(v4 + 8) = sub_100008078;
  uint64_t v5 = *(void *)(v0 + 16);
  *(void *)(v4 + 24) = v3;
  *(void *)(v4 + 32) = v5;
  *(_OWORD *)(v4 + 40) = *(_OWORD *)(v0 + 24);
  return _swift_task_switch(sub_100008250, 0, 0);
}

uint64_t sub_100008078(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100008198, 0, 0);
}

void sub_100008198()
{
  uint64_t v1 = *(void *)(v0 + 96);
  if (v1)
  {
    if (!*(void *)(v1 + 16))
    {
      __break(1u);
      return;
    }
    uint64_t v2 = *(void *)(v1 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void (**)(uint64_t))(v0 + 8);
  v3(v2);
}

uint64_t MADTextEmbedder.embed(texts:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(v1 + 1);
  return _swift_task_switch(sub_100008250, 0, 0);
}

uint64_t sub_100008250()
{
  uint64_t v1 = *(void *)(v0 + 48);
  long long v7 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = v7;
  *(void *)(v3 + 32) = v1;
  *(void *)(v3 + 40) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  uint64_t v5 = sub_100006780(&qword_100044698);
  *uint64_t v4 = v0;
  v4[1] = sub_100008378;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0x6574286465626D65, 0xED0000293A737478, sub_10000891C, v3, v5);
}

uint64_t sub_100008378()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_100008490, 0, 0);
}

uint64_t sub_100008490()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (!v1)
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1000365C0();
    sub_100007D00(v2, (uint64_t)qword_1000488A0);
    uint64_t v3 = sub_1000365A0();
    os_log_type_t v4 = sub_100036AA0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed at generating embeddings.", v5, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v1);
}

void sub_1000085B0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v24 = a2;
  uint64_t v6 = sub_100006780(&qword_100044720);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin();
  id v9 = [objc_allocWithZone((Class)MADTextEmbeddingRequest) init];
  [v9 setExtendedContextLength:1];
  if (a4)
  {
    uint64_t v11 = sub_100036840();
    uint64_t v12 = v10;
    if (v11 == 3425357 && v10 == 0xE300000000000000 || (sub_100036E10() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v13 = 4;
LABEL_11:
      [v9 setVersion:v13];
      goto LABEL_12;
    }
    if (v11 == 3490893 && v12 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_10:
      uint64_t v13 = 5;
      goto LABEL_11;
    }
    char v14 = sub_100036E10();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_10;
    }
  }
LABEL_12:
  sub_100006780(&qword_100044728);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100038120;
  *(void *)(v15 + 32) = v9;
  aBlock[0] = v15;
  sub_100036980();
  sub_10000C980(0, &qword_100044730);
  id v16 = v9;
  Class isa = sub_100036950().super.isa;
  swift_bridgeObjectRelease();
  Class v18 = sub_100036950().super.isa;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v20 + v19, (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)(v20 + ((v8 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = v16;
  aBlock[4] = sub_10000C8B8;
  aBlock[5] = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009348;
  aBlock[3] = &unk_1000420A8;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = v16;
  swift_release();
  [v24 performRequests:isa text:v18 identifier:0 completionHandler:v21];
  _Block_release(v21);
}

void sub_10000891C(uint64_t a1)
{
  sub_1000085B0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100008928(int a1, uint64_t a2, int a3, id a4)
{
  if (!a2)
  {
    if (a1 == -1 || (id v9 = [a4 embeddingResults]) == 0)
    {
      if (qword_100044478 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_1000365C0();
      sub_100007D00(v22, (uint64_t)qword_1000488A0);
      uint64_t v23 = sub_1000365A0();
      os_log_type_t v24 = sub_100036AA0();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "No results returned by MAD service.", v25, 2u);
        swift_slowDealloc();
      }

      uint64_t v32 = 0;
      goto LABEL_37;
    }
    uint64_t v10 = v9;
    sub_10000C980(0, &qword_100044738);
    unint64_t v11 = sub_100036960();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_100036C30();
      uint64_t v12 = result;
      if (result) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v12)
      {
LABEL_10:
        if (v12 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v14 = 0;
        uint64_t v15 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if ((v11 & 0xC000000000000001) != 0) {
            id v16 = (id)sub_100036BF0();
          }
          else {
            id v16 = *(id *)(v11 + 8 * v14 + 32);
          }
          uint64_t v17 = v16;
          uint64_t v18 = sub_100008ECC();
          if (v18)
          {
            uint64_t v19 = v18;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v15 = sub_10000A918(0, *((void *)v15 + 2) + 1, 1, v15);
            }
            unint64_t v21 = *((void *)v15 + 2);
            unint64_t v20 = *((void *)v15 + 3);
            if (v21 >= v20 >> 1) {
              uint64_t v15 = sub_10000A918((char *)(v20 > 1), v21 + 1, 1, v15);
            }
            *((void *)v15 + 2) = v21 + 1;
            *(void *)&v15[8 * v21 + 32] = v19;
          }
          ++v14;
        }
        while (v12 != v14);
        goto LABEL_31;
      }
    }
    uint64_t v15 = (char *)&_swiftEmptyArrayStorage;
LABEL_31:
    swift_bridgeObjectRelease();
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1000365C0();
    sub_100007D00(v26, (uint64_t)qword_1000488A0);
    swift_bridgeObjectRetain();
    char v27 = sub_1000365A0();
    os_log_type_t v28 = sub_100036A90();
    if (os_log_type_enabled(v27, v28))
    {
      long long v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)long long v29 = 136315138;
      uint64_t v30 = sub_100036970();
      sub_10000B1D4(v30, v31, &v32);
      sub_100036B00();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Found result: %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v32 = (uint64_t)v15;
LABEL_37:
    sub_100006780(&qword_100044720);
    return sub_1000369D0();
  }
  swift_errorRetain();
  if (qword_100044478 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000365C0();
  sub_100007D00(v4, (uint64_t)qword_1000488A0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_1000365A0();
  os_log_type_t v6 = sub_100036AA0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v32 = _swift_stdlib_bridgeErrorToNSError();
    sub_100036B00();
    void *v8 = v32;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed at calling MAD service: %@", v7, 0xCu);
    sub_100006780(&qword_100044740);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v32 = 0;
  sub_100006780(&qword_100044720);
  sub_1000369D0();
  return swift_errorRelease();
}

uint64_t sub_100008ECC()
{
  id v1 = [v0 embedding];
  id v2 = [v1 data];

  uint64_t v3 = sub_100036200();
  unint64_t v5 = v4;

  id v6 = [v0 embedding];
  unint64_t v7 = (unint64_t)[v6 type];

  if ((v7 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_100036C20();
    __break(1u);
    return result;
  }
  id v8 = [v0 embedding];
  id v9 = [v8 count];

  if (qword_100044478 != -1) {
    goto LABEL_33;
  }
  while (1)
  {
    uint64_t v10 = sub_1000365C0();
    sub_100007D00(v10, (uint64_t)qword_1000488A0);
    unint64_t v11 = sub_1000365A0();
    os_log_type_t v12 = sub_100036A90();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 134217984;
      sub_100036B00();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Embedding type: %lu", v13, 0xCu);
      swift_slowDealloc();
    }

    if (v7 == 2)
    {
      id v16 = (int32x4_t *)sub_100009824(v3, v5);
      uint64_t v25 = v16[1].i64[0];
      if (!v25) {
        goto LABEL_30;
      }
      goto LABEL_21;
    }
    if (v7 != 1) {
      break;
    }
    unint64_t v7 = (unint64_t)sub_100009674(v3, v5);
    int64_t v14 = *(void *)(v7 + 16);
    if (v14)
    {
      sub_1000245C8(0, v14, 0);
      uint64_t v15 = 0;
      id v16 = (int32x4_t *)&_swiftEmptyArrayStorage;
      unint64_t v17 = *((void *)&_swiftEmptyArrayStorage + 2);
      do
      {
        _H8 = *(_WORD *)(v7 + 2 * v15 + 32);
        unint64_t v19 = *((void *)&_swiftEmptyArrayStorage + 3);
        if (v17 >= v19 >> 1) {
          sub_1000245C8(v19 > 1, v17 + 1, 1);
        }
        ++v15;
        __asm { FCVT            S0, H8 }
        *((void *)&_swiftEmptyArrayStorage + 2) = v17 + 1;
        *((_DWORD *)&_swiftEmptyArrayStorage + v17++ + 8) = _S0;
      }
      while (v14 != v15);
      swift_bridgeObjectRelease();
      uint64_t v25 = *((void *)&_swiftEmptyArrayStorage + 2);
      if (!v25) {
        goto LABEL_30;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      id v16 = (int32x4_t *)&_swiftEmptyArrayStorage;
      uint64_t v25 = *((void *)&_swiftEmptyArrayStorage + 2);
      if (!v25) {
        goto LABEL_30;
      }
    }
LABEL_21:
    if ((~v16[2].i32[0] & 0x7F800000) == 0)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      long long v29 = sub_1000365A0();
      os_log_type_t v30 = sub_100036AA0();
      if (os_log_type_enabled(v29, v30))
      {
        unint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Found embedding with nan values. Return zeros embedding.", v31, 2u);
        swift_slowDealloc();
      }

      id v16 = sub_1000099D8((unint64_t)v9, 0);
LABEL_30:
      sub_10000C9BC(v3, v5);
      return (uint64_t)v16;
    }
    if (v25 == 1) {
      goto LABEL_30;
    }
    uint64_t v32 = 9;
    while (1)
    {
      uint64_t v33 = v32 - 7;
      if (__OFADD__(v32 - 8, 1)) {
        break;
      }
      if ((~v16->i32[v32] & 0x7F800000) == 0) {
        goto LABEL_22;
      }
      ++v32;
      if (v33 == v25) {
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_33:
    swift_once();
  }
  uint64_t v26 = sub_1000365A0();
  os_log_type_t v27 = sub_100036AA0();
  if (os_log_type_enabled(v26, v27))
  {
    os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Embedding type not supported.", v28, 2u);
    swift_slowDealloc();
  }
  sub_10000C9BC(v3, v5);

  return 0;
}

void sub_100009348(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1000093C0()
{
  return sub_100036820();
}

uint64_t sub_1000093F8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + 8) = sub_1000094C0;
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 56) = *(void *)v2;
  *(_OWORD *)(v6 + 64) = *(_OWORD *)(v2 + 8);
  return _swift_task_switch(sub_100007F6C, 0, 0);
}

uint64_t sub_1000094C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_1000095BC(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_10000CA6C;
  uint64_t v5 = *v1;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = v5;
  *(_OWORD *)(v4 + 40) = *(_OWORD *)(v1 + 1);
  return _swift_task_switch(sub_100008250, 0, 0);
}

void *sub_100009674(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (HIDWORD(a1) - a1);
      char v6 = SHIDWORD(a1) < (int)a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_16;
      }
      uint64_t v7 = (int)v7;
LABEL_7:
      if (v7 >= 0) {
        uint64_t v11 = v7;
      }
      else {
        uint64_t v11 = v7 + 1;
      }
      if (v7 <= -2) {
        goto LABEL_20;
      }
      uint64_t v5 = v11 >> 1;
      if (v7 < 2)
      {
LABEL_3:
        sub_10000CA14(a1, a2);
        uint64_t v5 = 0;
        uint64_t v2 = &_swiftEmptyArrayStorage;
      }
      else
      {
LABEL_12:
        sub_10000CA14(a1, a2);
        uint64_t v2 = (void *)sub_1000369A0();
        v2[2] = v5;
      }
      v13[1] = v5;
      uint64_t v14 = 0;
      v13[0] = (uint64_t)(v2 + 4);
      sub_10000BE78(v13, &v14, a1, a2);
      uint64_t v7 = v14;
      char v6 = v5 < v14;
      if (v5 < v14)
      {
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
        if (v6)
        {
          __break(1u);
LABEL_20:
          sub_100036C20();
          __break(1u);
        }
        v2[2] = v7;
        swift_bridgeObjectRelease();
        __break(1u);
        JUMPOUT(0x100009814);
      }
      v2[2] = v14;
      sub_10000C9BC(a1, a2);
      return v2;
    case 2uLL:
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      char v6 = (v7 < 0) ^ v10;
      if (!v10) {
        goto LABEL_7;
      }
      goto LABEL_17;
    case 3uLL:
      goto LABEL_3;
    default:
      uint64_t v5 = (a2 >> 49) & 0x7F;
      if (BYTE6(a2) < 2uLL) {
        goto LABEL_3;
      }
      goto LABEL_12;
  }
}

void *sub_100009824(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (HIDWORD(a1) - a1);
      char v6 = SHIDWORD(a1) < (int)a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_15;
      }
      uint64_t v7 = (int)v7;
LABEL_7:
      uint64_t v11 = v7 + 3;
      if (v7 >= 0) {
        uint64_t v11 = v7;
      }
      if (v7 <= -4) {
        goto LABEL_19;
      }
      uint64_t v5 = v11 >> 2;
      if (v7 < 4)
      {
LABEL_3:
        sub_10000CA14(a1, a2);
        uint64_t v5 = 0;
        uint64_t v2 = &_swiftEmptyArrayStorage;
      }
      else
      {
LABEL_11:
        sub_10000CA14(a1, a2);
        uint64_t v2 = (void *)sub_1000369A0();
        v2[2] = v5;
      }
      v13[1] = v5;
      uint64_t v14 = 0;
      v13[0] = (uint64_t)(v2 + 4);
      sub_10000BFD0(v13, &v14, a1, a2);
      uint64_t v7 = v14;
      char v6 = v5 < v14;
      if (v5 < v14)
      {
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        if (v6)
        {
          __break(1u);
LABEL_19:
          sub_100036C20();
          __break(1u);
        }
        v2[2] = v7;
        swift_bridgeObjectRelease();
        __break(1u);
        JUMPOUT(0x1000099C8);
      }
      v2[2] = v14;
      sub_10000C9BC(a1, a2);
      return v2;
    case 2uLL:
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      char v6 = (v7 < 0) ^ v10;
      if (!v10) {
        goto LABEL_7;
      }
      goto LABEL_16;
    case 3uLL:
      goto LABEL_3;
    default:
      uint64_t v5 = (a2 >> 50) & 0x3F;
      if (BYTE6(a2) < 4uLL) {
        goto LABEL_3;
      }
      goto LABEL_11;
  }
}

int32x4_t *sub_1000099D8(unint64_t a1, int32x2_t a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t result = (int32x4_t *)sub_100036C20();
    __break(1u);
    return result;
  }
  if (!a1) {
    return (int32x4_t *)&_swiftEmptyArrayStorage;
  }
  uint64_t result = (int32x4_t *)sub_1000369A0();
  result[1].i64[0] = a1;
  i32 = result[2].i32;
  if (a1 < 8)
  {
    unint64_t v5 = 0;
    __int32 v6 = a2.i32[0];
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *i32++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF8;
  i32 += a1 & 0xFFFFFFFFFFFFFFF8;
  __int32 v6 = a2.i32[0];
  int32x4_t v7 = vdupq_lane_s32(a2, 0);
  uint64_t v8 = result + 3;
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v8[-1] = v7;
    int32x4_t *v8 = v7;
    v8 += 2;
    v9 -= 8;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

uint64_t EmbedderName.init(rawValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_100041500;
  v8._object = a2;
  Swift::Int v6 = sub_100036C90(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

_UNKNOWN **static EmbedderName.allCases.getter()
{
  return &off_100041538;
}

uint64_t EmbedderName.rawValue.getter()
{
  return 0x457478655444414DLL;
}

uint64_t sub_100009B54()
{
  return 1;
}

Swift::Int sub_100009B5C()
{
  return sub_100036ED0();
}

uint64_t sub_100009BBC()
{
  return sub_100036870();
}

Swift::Int sub_100009BE0()
{
  return sub_100036ED0();
}

uint64_t sub_100009C3C@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100041560;
  v7._object = v3;
  Swift::Int v5 = sub_100036C90(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100009C90(void *a1@<X8>)
{
  *a1 = 0x457478655444414DLL;
  a1[1] = 0xEF7265646465626DLL;
}

void sub_100009CB8(void *a1@<X8>)
{
  *a1 = &off_100041598;
}

uint64_t sub_100009CC8()
{
  return sub_100036930();
}

uint64_t sub_100009D28()
{
  return sub_100036920();
}

uint64_t generateEmbeddingsFromTexts(textItems:embeddingModelName:embeddingModelVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[27] = a4;
  v5[28] = a5;
  v5[25] = a2;
  v5[26] = a3;
  v5[24] = a1;
  uint64_t v6 = sub_100036590();
  v5[29] = v6;
  v5[30] = *(void *)(v6 - 8);
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  return _swift_task_switch(sub_100009E50, 0, 0);
}

uint64_t sub_100009E50()
{
  uint64_t v33 = v0;
  if (qword_100044478 != -1) {
    swift_once();
  }
  id v1 = (_OWORD *)(v0 + 16);
  uint64_t v2 = sub_1000365C0();
  *(void *)(v0 + 264) = sub_100007D00(v2, (uint64_t)qword_1000488A0);
  uint64_t v3 = sub_1000365A0();
  os_log_type_t v4 = sub_100036A80();
  if (os_log_type_enabled(v3, v4))
  {
    Swift::Int v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::Int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Generating embeddings", v5, 2u);
    swift_slowDealloc();
  }
  uint64_t v7 = *(void *)(v0 + 200);
  uint64_t v6 = *(void *)(v0 + 208);

  *(void *)(v0 + 48) = 0;
  _OWORD *v1 = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  if (v7 == 0x457478655444414DLL && v6 == 0xEF7265646465626DLL || (sub_100036E10() & 1) != 0)
  {
    uint64_t v9 = *(void *)(v0 + 216);
    uint64_t v8 = *(void *)(v0 + 224);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 136) = [self service];
    *(void *)(v0 + 144) = v9;
    *(void *)(v0 + 160) = &type metadata for MADTextEmbedder;
    *(void *)(v0 + 168) = &protocol witness table for MADTextEmbedder;
    *(void *)(v0 + 152) = v8;
    sub_10000B10C(v0 + 16);
    sub_10000B2A8(v0 + 136, v0 + 16);
  }
  else
  {
    sub_10000B10C(v0 + 16);
    _OWORD *v1 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(void *)(v0 + 48) = 0;
  }
  sub_10000B16C(v0 + 16, v0 + 96);
  if (*(void *)(v0 + 120))
  {
    uint64_t v10 = *(void *)(v0 + 192);
    sub_100007D38((long long *)(v0 + 96), v0 + 56);
    uint64_t v11 = *(void *)(v10 + 16);
    *(void *)(v0 + 272) = v11;
    if (v11)
    {
      os_log_type_t v12 = *(void **)(v0 + 192);
      *(void *)(v0 + 280) = 0;
      *(void *)(v0 + 288) = _swiftEmptyArrayStorage;
      *(void *)(v0 + 296) = v12[4];
      uint64_t v13 = v12[6];
      *(void *)(v0 + 304) = v13;
      uint64_t v14 = v12[5];
      uint64_t v15 = *(void *)(v0 + 80);
      uint64_t v16 = *(void *)(v0 + 88);
      swift_bridgeObjectRetain();
      sub_1000067C4((void *)(v0 + 56), v15);
      os_log_type_t v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 16) + **(int **)(v16 + 16));
      swift_bridgeObjectRetain_n();
      unint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v17;
      *unint64_t v17 = v0;
      v17[1] = sub_10000A3C4;
      return v30(v14, v13, v15, v16);
    }
    sub_10000B10C(v0 + 16);
    sub_10000685C(v0 + 56);
    os_log_type_t v27 = _swiftEmptyArrayStorage;
  }
  else
  {
    unint64_t v19 = *(void *)(v0 + 224);
    sub_10000B10C(v0 + 96);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v20 = sub_1000365A0();
    os_log_type_t v21 = sub_100036AA0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v29 = *(void *)(v0 + 224);
      unint64_t v22 = *(void *)(v0 + 208);
      uint64_t v31 = *(void *)(v0 + 216);
      uint64_t v23 = *(void *)(v0 + 200);
      uint64_t v24 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 176) = sub_10000B1D4(v23, v22, &v32);
      sub_100036B00();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v24 + 12) = 2080;
      if (v29) {
        uint64_t v25 = v31;
      }
      else {
        uint64_t v25 = 7104878;
      }
      if (v29) {
        unint64_t v26 = v19;
      }
      else {
        unint64_t v26 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      *(void *)(v0 + 184) = sub_10000B1D4(v25, v26, &v32);
      sub_100036B00();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to create embedder with name %s, version: %s.", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_10000B10C(v0 + 16);
    os_log_type_t v27 = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v28 = *(uint64_t (**)(void *))(v0 + 8);
  return v28(v27);
}

uint64_t sub_10000A3C4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 320) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000A4E4, 0, 0);
}

uint64_t sub_10000A4E4()
{
  if (!v0[40])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v17 = sub_1000365A0();
    os_log_type_t v18 = sub_100036AA0();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to generate embedding from text.", v19, 2u);
      swift_slowDealloc();
    }

    sub_10000B10C((uint64_t)(v0 + 2));
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v4 = v0[29];
  uint64_t v3 = v0[30];
  sub_100036580();
  sub_100036530();
  swift_bridgeObjectRelease();
  sub_100036570();
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  sub_1000067C4(v0 + 7, v5);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  sub_100036550();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v8 = v0[36];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    unint64_t v8 = sub_10000AC58(0, *(void *)(v8 + 16) + 1, 1, v0[36], &qword_100044718, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding);
  }
  unint64_t v10 = *(void *)(v8 + 16);
  unint64_t v9 = *(void *)(v8 + 24);
  if (v10 >= v9 >> 1) {
    unint64_t v8 = sub_10000AC58(v9 > 1, v10 + 1, 1, v8, &qword_100044718, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding);
  }
  uint64_t v11 = v0[34];
  uint64_t v12 = v0[31];
  uint64_t v13 = v0[32];
  uint64_t v14 = v0[29];
  uint64_t v15 = v0[30];
  uint64_t v16 = v0[35] + 1;
  *(void *)(v8 + 16) = v10 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 32))(v8+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v10, v12, v14);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  if (v16 == v11)
  {
    swift_bridgeObjectRelease();
    sub_10000B10C((uint64_t)(v0 + 2));
LABEL_11:
    sub_10000685C((uint64_t)(v0 + 7));
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v20 = (uint64_t (*)(unint64_t))v0[1];
    return v20(v8);
  }
  uint64_t v22 = v0[35] + 1;
  v0[35] = v22;
  v0[36] = v8;
  uint64_t v23 = (void *)(v0[24] + 24 * v22);
  v0[37] = v23[4];
  uint64_t v24 = v23[6];
  v0[38] = v24;
  uint64_t v25 = v23[5];
  uint64_t v26 = v0[10];
  uint64_t v27 = v0[11];
  sub_1000067C4(v0 + 7, v26);
  uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 + 16) + **(int **)(v27 + 16));
  swift_bridgeObjectRetain_n();
  os_log_type_t v28 = (void *)swift_task_alloc();
  v0[39] = v28;
  *os_log_type_t v28 = v0;
  v28[1] = sub_10000A3C4;
  return v29(v25, v24, v26, v27);
}

uint64_t sub_10000A8F4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10000AC58(a1, a2, a3, a4, &qword_100044718, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding);
}

char *sub_10000A918(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006780(&qword_100044748);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000C134(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000AA28(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006780(&qword_100044700);
      unint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
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
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000C334(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_10000AB24(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006780(&qword_100044688);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000C240(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000AC34(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10000AC58(a1, a2, a3, a4, &qword_100044710, (uint64_t (*)(void))type metadata accessor for ExtractedMessage, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
}

uint64_t sub_10000AC58(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    os_log_type_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100006780(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  os_log_type_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100036C20();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000C41C(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_10000AED8(void *result, int64_t a2, char a3, void *a4)
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
      sub_100006780(&qword_100044708);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10000C578(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10000AFFC(void *result, int64_t a2, char a3, void *a4)
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
      sub_100006780(&qword_1000446E8);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= (void *)((char *)a4 + 4 * v8 + 32)) {
          memmove(v13, a4 + 4, 4 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10000C670(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B10C(uint64_t a1)
{
  uint64_t v2 = sub_100006780(&qword_1000446A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B16C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_1000446A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B1D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B8F4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000C7B4((uint64_t)v12, *a3);
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
      sub_10000C7B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000685C((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B2A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_1000446A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B314()
{
  unint64_t result = qword_1000446C0;
  if (!qword_1000446C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446C0);
  }
  return result;
}

unint64_t sub_10000B36C()
{
  unint64_t result = qword_1000446C8;
  if (!qword_1000446C8)
  {
    sub_100006458(&qword_1000446D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446C8);
  }
  return result;
}

uint64_t dispatch thunk of Embedder.embeddingModel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Embedder.embed(text:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_10000CA6C;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of Embedder.embed(texts:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000CA6C;
  return v9(a1, a2, a3);
}

uint64_t destroy for MADTextEmbedder(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *_s22PrivateEvolutionPlugin15MADTextEmbedderVwCP_0(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MADTextEmbedder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for MADTextEmbedder(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MADTextEmbedder(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MADTextEmbedder(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MADTextEmbedder(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MADTextEmbedder()
{
  return &type metadata for MADTextEmbedder;
}

uint64_t getEnumTagSinglePayload for EmbedderName(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for EmbedderName(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10000B8B4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B8DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for EmbedderName()
{
  return &type metadata for EmbedderName;
}

uint64_t sub_10000B8F4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100036B10();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000BAB0(a5, a6);
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
  uint64_t v8 = sub_100036C00();
  if (!v8)
  {
    sub_100036C20();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100036C70();
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

uint64_t sub_10000BAB0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000BB48(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000BD28(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000BD28(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000BB48(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000BCC0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100036BE0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100036C20();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000368C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100036C70();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100036C20();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000BCC0(uint64_t a1, uint64_t a2)
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
  sub_100006780(&qword_100044700);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000BD28(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006780(&qword_100044700);
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
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_10000BE78(uint64_t *a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = *a1;
  uint64_t v6 = a1[1];
  unint64_t v7 = a4 >> 62;
  uint64_t v9 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a3) - a3;
      if (__OFSUB__(HIDWORD(a3), a3)) {
        goto LABEL_30;
      }
      uint64_t v10 = (int)v10;
LABEL_6:
      if (v10 < 1) {
        goto LABEL_18;
      }
      if (v7)
      {
        if (v7 == 1) {
          uint64_t v14 = (int)a3;
        }
        else {
          uint64_t v14 = *(void *)(a3 + 16);
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      if (v6 + 0x4000000000000000 < 0) {
        goto LABEL_27;
      }
      uint64_t v15 = 2 * v6;
      if (v10 < 2 * v6) {
        uint64_t v15 = v10;
      }
      uint64_t v16 = v14 + v15;
      if (__OFADD__(v14, v15)) {
        goto LABEL_28;
      }
      if (v16 < v14) {
        goto LABEL_29;
      }
      if (v14 == v16)
      {
LABEL_18:
        uint64_t v9 = 0;
      }
      else
      {
        if (!result)
        {
LABEL_33:
          __break(1u);
          JUMPOUT(0x10000BFC0);
        }
        uint64_t result = sub_1000361E0();
        uint64_t v9 = v16 - v14;
        if (__OFSUB__(v16, v14))
        {
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
      }
LABEL_21:
      if (v9 >= 0) {
        uint64_t v17 = v9;
      }
      else {
        uint64_t v17 = v9 + 1;
      }
      BOOL v13 = __OFADD__(*a2, v17 >> 1);
      uint64_t v18 = *a2 + (v17 >> 1);
      if (v13)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      *a2 = v18;
      return result;
    case 2uLL:
      uint64_t v12 = *(void *)(a3 + 16);
      uint64_t v11 = *(void *)(a3 + 24);
      BOOL v13 = __OFSUB__(v11, v12);
      uint64_t v10 = v11 - v12;
      if (!v13) {
        goto LABEL_6;
      }
      goto LABEL_31;
    case 3uLL:
      goto LABEL_21;
    default:
      uint64_t v10 = BYTE6(a4);
      goto LABEL_6;
  }
}

uint64_t sub_10000BFD0(uint64_t *a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t result = *a1;
  uint64_t v6 = a1[1];
  unint64_t v7 = a4 >> 62;
  uint64_t v9 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      LODWORD(v10) = HIDWORD(a3) - a3;
      if (__OFSUB__(HIDWORD(a3), a3)) {
        goto LABEL_27;
      }
      uint64_t v10 = (int)v10;
LABEL_6:
      if (v10 < 1) {
        goto LABEL_18;
      }
      if (v7)
      {
        if (v7 == 1) {
          uint64_t v14 = (int)a3;
        }
        else {
          uint64_t v14 = *(void *)(a3 + 16);
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      if ((unint64_t)(v6 - 0x2000000000000000) >> 62 != 3) {
        goto LABEL_24;
      }
      uint64_t v15 = 4 * v6;
      if (v10 < 4 * v6) {
        uint64_t v15 = v10;
      }
      uint64_t v16 = v14 + v15;
      if (__OFADD__(v14, v15)) {
        goto LABEL_25;
      }
      if (v16 < v14) {
        goto LABEL_26;
      }
      if (v14 == v16)
      {
LABEL_18:
        uint64_t v9 = 0;
      }
      else
      {
        if (!result)
        {
LABEL_30:
          __break(1u);
          JUMPOUT(0x10000C124);
        }
        uint64_t result = sub_1000361E0();
        uint64_t v9 = v16 - v14;
        if (__OFSUB__(v16, v14))
        {
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
      }
LABEL_21:
      if (__OFADD__(*a2, v9 / 4))
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      *a2 += v9 / 4;
      return result;
    case 2uLL:
      uint64_t v12 = *(void *)(a3 + 16);
      uint64_t v11 = *(void *)(a3 + 24);
      BOOL v13 = __OFSUB__(v11, v12);
      uint64_t v10 = v11 - v12;
      if (!v13) {
        goto LABEL_6;
      }
      goto LABEL_28;
    case 3uLL:
      goto LABEL_21;
    default:
      uint64_t v10 = BYTE6(a4);
      goto LABEL_6;
  }
}

uint64_t sub_10000C134(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100006780(&qword_100044750);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_10000C240(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

char *sub_10000C334(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_10000C41C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_10000C578(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

char *sub_10000C670(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_100036C70();
  __break(1u);
  return result;
}

unint64_t sub_10000C760()
{
  unint64_t result = qword_1000446F0;
  if (!qword_1000446F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446F0);
  }
  return result;
}

uint64_t sub_10000C7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000C810()
{
  uint64_t v1 = sub_100006780(&qword_100044720);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10000C8B8(int a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100006780(&qword_100044720) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100008928(a1, a2, (int)v2 + (int)v6, v7);
}

uint64_t sub_10000C968(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000C978()
{
  return swift_release();
}

uint64_t sub_10000C980(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000C9BC(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000CA14(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000CA70(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = _swiftEmptyArrayStorage;
  if (!v3) {
    return (uint64_t)v4;
  }
  uint64_t v5 = a1;
  unint64_t v35 = _swiftEmptyArrayStorage;
  sub_100024608(0, v3, 0);
  uint64_t v4 = _swiftEmptyArrayStorage;
  uint64_t v7 = sub_1000144B4(v5);
  uint64_t v8 = 0;
  uint64_t v9 = v5 + 64;
  uint64_t v28 = v5 + 80;
  int64_t v29 = v3;
  int v30 = v6;
  uint64_t v31 = v5 + 64;
  while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(unsigned char *)(v5 + 32))
  {
    unint64_t v13 = (unint64_t)v7 >> 6;
    if ((*(void *)(v9 + 8 * ((unint64_t)v7 >> 6)) & (1 << v7)) == 0) {
      goto LABEL_24;
    }
    if (*(_DWORD *)(v5 + 36) != v6) {
      goto LABEL_25;
    }
    uint64_t v32 = v8;
    uint64_t v14 = v5;
    uint64_t v15 = *(void *)(*(void *)(v5 + 48) + 8 * v7);
    uint64_t v16 = *(void **)(*(void *)(v5 + 56) + 8 * v7);
    v34._rawValue = v16;
    swift_bridgeObjectRetain_n();
    sub_100013004(&v34);
    if (v2) {
      goto LABEL_29;
    }
    rawValue = v34._rawValue;
    Swift::String v18 = joinMessages(_:)(v34);
    uint64_t v33 = v16[2];
    swift_bridgeObjectRelease();
    unint64_t v35 = v4;
    unint64_t v20 = v4[2];
    unint64_t v19 = v4[3];
    if (v20 >= v19 >> 1)
    {
      sub_100024608(v19 > 1, v20 + 1, 1);
      uint64_t v4 = v35;
    }
    v4[2] = v20 + 1;
    uint64_t v21 = &v4[5 * v20];
    v21[4] = v15;
    v21[5] = v33;
    v21[6] = rawValue;
    *(Swift::String *)(v21 + 7) = v18;
    int64_t v10 = 1 << *(unsigned char *)(v14 + 32);
    if (v7 >= v10) {
      goto LABEL_26;
    }
    uint64_t v9 = v31;
    uint64_t v22 = *(void *)(v31 + 8 * v13);
    if ((v22 & (1 << v7)) == 0) {
      goto LABEL_27;
    }
    uint64_t v5 = v14;
    int v6 = v30;
    if (*(_DWORD *)(v14 + 36) != v30) {
      goto LABEL_28;
    }
    unint64_t v23 = v22 & (-2 << (v7 & 0x3F));
    if (v23)
    {
      int64_t v10 = __clz(__rbit64(v23)) | v7 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v11 = v32;
      uint64_t v2 = 0;
      int64_t v12 = v29;
    }
    else
    {
      unint64_t v24 = v13 + 1;
      unint64_t v25 = (unint64_t)(v10 + 63) >> 6;
      uint64_t v11 = v32;
      uint64_t v2 = 0;
      int64_t v12 = v29;
      if (v13 + 1 < v25)
      {
        unint64_t v26 = *(void *)(v31 + 8 * v24);
        if (v26)
        {
LABEL_21:
          int64_t v10 = __clz(__rbit64(v26)) + (v24 << 6);
        }
        else
        {
          while (v25 - 2 != v13)
          {
            unint64_t v26 = *(void *)(v28 + 8 * v13++);
            if (v26)
            {
              unint64_t v24 = v13 + 1;
              goto LABEL_21;
            }
          }
        }
      }
    }
    uint64_t v8 = v11 + 1;
    uint64_t v7 = v10;
    if (v8 == v12) {
      return (uint64_t)v4;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t MessageCleanupParameters.cleanup.getter()
{
  return *v0;
}

uint64_t MessageCleanupParameters.useMorpheus.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t MessageCleanupParameters.morpheusProgram.getter()
{
  return swift_retain();
}

uint64_t MessageCleanupParameters.init(cleanup:useMorpheus:morpheusProgram:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  char v5 = result;
  if ((a2 & 1) == 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (!a3)
  {
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  sub_100036610();
  uint64_t v7 = sub_100036600();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_6:
  *(unsigned char *)a4 = v5 & 1;
  *(unsigned char *)(a4 + 1) = a2 & 1;
  *(void *)(a4 + 8) = v7;
  return result;
}

uint64_t MessageExtractor.init(lastDays:maxMessages:maxLength:cleanupParameters:earliestDate:customPredicateFormat:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  char v13 = *a4;
  char v14 = a4[1];
  uint64_t v22 = *((void *)a4 + 1);
  uint64_t v15 = (int *)type metadata accessor for MessageExtractor();
  *(void *)((char *)a8 + v15[13]) = 0;
  *(void *)((char *)a8 + v15[14]) = &_swiftEmptyArrayStorage;
  *a8 = [objc_allocWithZone((Class)EMDaemonInterface) init];
  id v16 = objc_allocWithZone((Class)EMContentRequestOptions);
  aBlock[4] = sub_10001164C;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011650;
  aBlock[3] = &unk_1000420D0;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = [v16 initWithBuilder:v17];
  _Block_release(v17);
  swift_release();
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
  }
  else
  {
    a8[1] = v18;
    a8[2] = 49;
    a8[3] = a2;
    *(void *)((char *)a8 + v15[10]) = a3;
    a8[4] = a1;
    uint64_t result = sub_1000116BC(a5, (uint64_t)a8 + v15[9]);
    unint64_t v20 = (char *)a8 + v15[12];
    *unint64_t v20 = v13;
    v20[1] = v14;
    *((void *)v20 + 1) = v22;
    uint64_t v21 = (void *)((char *)a8 + v15[11]);
    *uint64_t v21 = a6;
    v21[1] = a7;
  }
  return result;
}

uint64_t type metadata accessor for MessageExtractor()
{
  uint64_t result = qword_100044810;
  if (!qword_100044810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000CFC0(void *a1)
{
  [a1 setRequestedRepresentation:EMContentRepresentationTypeHTML];
  [a1 setNetworkUsage:1];
  [a1 setRequestAllHeaders:0];
  sub_100006780(&qword_100044910);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100038110;
  int64_t v3 = (void *)ECMessageHeaderKeyAutoSubmitted;
  *(void *)(v2 + 32) = ECMessageHeaderKeyAutoSubmitted;
  type metadata accessor for ECMessageHeaderKey(0);
  id v4 = v3;
  Class isa = sub_100036950().super.isa;
  swift_bridgeObjectRelease();
  [a1 setRequestedHeaderKeys:isa];
}

uint64_t MessageExtractor.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  return sub_10001453C(v1, a1, (uint64_t (*)(void))type metadata accessor for MessageExtractor);
}

uint64_t MessageExtractor.isDataAccessible()()
{
  *(void *)(v1 + 120) = v0;
  return _swift_task_switch(sub_10000D10C, 0, 0);
}

uint64_t sub_10000D10C()
{
  id v1 = [**(id **)(v0 + 120) messageRepository];
  *(void *)(v0 + 128) = v1;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 136;
  *(void *)(v0 + 24) = sub_10000D22C;
  uint64_t v2 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_10000D374;
  *(void *)(v0 + 104) = &unk_1000420F8;
  *(void *)(v0 + 112) = v2;
  [v1 isDataAccessible:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_10000D22C()
{
  return _swift_task_switch(sub_10000D30C, 0, 0);
}

uint64_t sub_10000D30C()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 136);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10000D374(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t sub_10000D398()
{
  v1[21] = v0;
  uint64_t v2 = sub_1000362D0();
  v1[22] = v2;
  v1[23] = *(void *)(v2 - 8);
  v1[24] = swift_task_alloc();
  uint64_t v3 = sub_1000362F0();
  v1[25] = v3;
  v1[26] = *(void *)(v3 - 8);
  v1[27] = swift_task_alloc();
  sub_100006780(&qword_100044658);
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  uint64_t v4 = sub_100036250();
  v1[30] = v4;
  v1[31] = *(void *)(v4 - 8);
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  return _swift_task_switch(sub_10000D584, 0, 0);
}

uint64_t sub_10000D584()
{
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[23];
  uint64_t v2 = (void *)v0[24];
  uint64_t v4 = v0[22];
  id v5 = [self currentCalendar];
  sub_100036290();

  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v2, enum case for Calendar.Component.day(_:), v4);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = -v6;
  if (__OFSUB__(0, v6))
  {
    __break(1u);
LABEL_23:
    swift_once();
    goto LABEL_16;
  }
  uint64_t v8 = v0[35];
  uint64_t v10 = v0[30];
  uint64_t v9 = v0[31];
  uint64_t v11 = v0[29];
  uint64_t v13 = v0[26];
  uint64_t v12 = v0[27];
  uint64_t v14 = v0[24];
  uint64_t v15 = v0[23];
  uint64_t v65 = v0[22];
  uint64_t v67 = v0[25];
  sub_100036240();
  sub_1000362A0();
  id v16 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v0[37] = v16;
  v0[38] = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v63 = v16;
  v16(v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v65);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v67);
  uint64_t v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v17(v11, 1, v10) == 1)
  {
    sub_100015804(v0[29], &qword_100044658);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v18 = (uint64_t (*)(void))v0[1];
    return v18(0);
  }
  uint64_t v20 = v0[36];
  uint64_t v21 = v0[34];
  uint64_t v22 = v0[30];
  uint64_t v23 = v0[31];
  uint64_t v24 = v0[28];
  uint64_t v25 = v0[21];
  long long v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32);
  v62(v20, v0[29], v22);
  uint64_t v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v61(v21, v20, v22);
  uint64_t v26 = type metadata accessor for MessageExtractor();
  sub_100015640(v25 + *(int *)(v26 + 36), v24, &qword_100044658);
  if (v17(v24, 1, v22) == 1)
  {
    sub_100015804(v0[28], &qword_100044658);
  }
  else
  {
    uint64_t v27 = v26;
    uint64_t v28 = v0[36];
    uint64_t v29 = v0[33];
    uint64_t v30 = v0[34];
    uint64_t v31 = v0[32];
    uint64_t v32 = v0[30];
    v62(v29, v0[28], v32);
    sub_1000156A4(&qword_1000448D8, (void (*)(uint64_t))&type metadata accessor for Date);
    if (sub_100036770()) {
      uint64_t v33 = v29;
    }
    else {
      uint64_t v33 = v28;
    }
    v61(v31, v33, v32);
    v63(v29, v32);
    v63(v30, v32);
    uint64_t v26 = v27;
    v62(v30, v31, v32);
  }
  uint64_t v34 = v0[21];
  uint64_t v2 = self;
  Class isa = sub_100036210().super.isa;
  id v36 = [v2 predicateForMessagesNewerThanDate:isa];
  v0[39] = v36;

  if (*(void *)(v34 + *(int *)(v26 + 44) + 8))
  {
    sub_10000C980(0, &qword_1000448D0);
    uint64_t v37 = (void *)sub_100036A70();
    sub_100006780(&qword_100044728);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_1000382F0;
    *(void *)(v38 + 32) = v36;
    *(void *)(v38 + 40) = v37;
    sub_100036980();
    id v39 = v36;
    id v40 = v37;
    Class v41 = sub_100036950().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v7 = (uint64_t)[self andPredicateWithSubpredicates:v41];
  }
  else
  {
    uint64_t v7 = (uint64_t)v36;
  }
  v0[18] = v7;
  if (qword_100044478 != -1) {
    goto LABEL_23;
  }
LABEL_16:
  uint64_t v42 = sub_1000365C0();
  sub_100007D00(v42, (uint64_t)qword_1000488A0);
  id v43 = (id)v7;
  uint64_t v44 = sub_1000365A0();
  os_log_type_t v45 = sub_100036A80();
  if (os_log_type_enabled(v44, v45))
  {
    unsigned long long v66 = v2;
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    char v64 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 138412290;
    v0[20] = v43;
    id v47 = v43;
    sub_100036B00();
    *char v64 = v43;

    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Predicate to query Email Daemon: %@", v46, 0xCu);
    sub_100006780(&qword_100044740);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v66;
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v48 = v0[21];
  id v49 = [v2 sortDescriptorForDateAscending:0];
  v0[40] = v49;
  sub_10000C980(0, &qword_1000448C0);
  swift_beginAccess();
  long long v50 = (void *)v0[18];
  sub_100006780(&qword_100044728);
  uint64_t v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_100038120;
  *(void *)(v51 + 32) = v49;
  sub_100036980();
  id v52 = objc_allocWithZone((Class)EMQuery);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_10000C980(0, &qword_1000448C8);
  id v54 = v50;
  id v55 = v49;
  Class v56 = sub_100036950().super.isa;
  swift_bridgeObjectRelease();
  id v57 = [v52 initWithTargetClass:ObjCClassFromMetadata predicate:v54 sortDescriptors:v56];
  v0[41] = v57;

  id v58 = [*(id *)v48 messageRepository];
  v0[42] = v58;
  uint64_t v59 = *(void *)(v48 + 24);
  v0[2] = v0;
  v0[7] = v0 + 19;
  v0[3] = sub_10000DE04;
  uint64_t v60 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000E170;
  v0[13] = &unk_1000421B0;
  v0[14] = v60;
  [v58 performQuery:v57 limit:v59 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000DE04()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 344) = v1;
  if (v1) {
    uint64_t v2 = sub_10000E038;
  }
  else {
    uint64_t v2 = sub_10000DF14;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000DF14()
{
  uint64_t v1 = *(void **)(v0 + 336);
  uint64_t v3 = *(void **)(v0 + 312);
  uint64_t v2 = *(void **)(v0 + 320);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 288);
  uint64_t v6 = *(void *)(v0 + 272);
  uint64_t v7 = *(void *)(v0 + 240);

  v4(v6, v7);
  v4(v5, v7);
  uint64_t v8 = *(void *)(v0 + 152);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(v8);
}

uint64_t sub_10000E038()
{
  uint64_t v2 = *(void **)(v0 + 320);
  uint64_t v1 = *(void **)(v0 + 328);
  uint64_t v3 = *(void **)(v0 + 312);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
  uint64_t v9 = *(void *)(v0 + 288);
  uint64_t v10 = *(void **)(v0 + 336);
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 240);
  swift_willThrow();

  swift_errorRelease();
  v4(v5, v6);
  v4(v9, v6);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7(0);
}

uint64_t sub_10000E170(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006780(&qword_100044890);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10000C980(0, &qword_1000448E0);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_100036960();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10000E24C(void *a1)
{
  sub_100006780(&qword_1000448E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038300;
  *(void *)(inited + 32) = 0x65786F426C69616DLL;
  *(void *)(inited + 40) = 0xE900000000000073;
  id v3 = [a1 mailboxes];
  sub_10000C980(0, &qword_1000448F0);
  unint64_t v4 = sub_100036960();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100036C30();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v8 = &_swiftEmptyArrayStorage;
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5) {
    goto LABEL_13;
  }
LABEL_3:
  *(void *)&long long v33 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_1000245E8(0, v5 & ~(v5 >> 63), 0);
  if (v5 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v31 = a1;
  uint64_t v7 = 0;
  uint64_t v8 = (void *)v33;
  do
  {
    if ((v4 & 0xC000000000000001) != 0) {
      id v9 = (id)sub_100036BF0();
    }
    else {
      id v9 = *(id *)(v4 + 8 * v7 + 32);
    }
    uint64_t v10 = v9;
    id v11 = [v9 type];

    *(void *)&long long v33 = v8;
    unint64_t v13 = v8[2];
    unint64_t v12 = v8[3];
    if (v13 >= v12 >> 1)
    {
      sub_1000245E8(v12 > 1, v13 + 1, 1);
      uint64_t v8 = (void *)v33;
    }
    ++v7;
    v8[2] = v13 + 1;
    v8[v13 + 4] = v11;
  }
  while (v5 != v7);
  swift_bridgeObjectRelease();
  a1 = v31;
LABEL_14:
  uint64_t v14 = sub_100006780(&qword_1000448F8);
  *(void *)(inited + 48) = v8;
  *(void *)(inited + 72) = v14;
  *(void *)(inited + 80) = 0x616D6D7553736168;
  *(void *)(inited + 88) = 0xEA00000000007972;
  id v15 = [a1 summary];
  id v16 = v15;
  if (v15) {

  }
  *(unsigned char *)(inited + 96) = v16 != 0;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(void *)(inited + 128) = 0x7263736275736E75;
  *(void *)(inited + 136) = 0xEF65707954656269;
  *(void *)(inited + 144) = [a1 unsubscribeType];
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 176) = 0xD000000000000013;
  *(void *)(inited + 184) = 0x8000000100039CB0;
  id v17 = [a1 generatedSummary];
  id v18 = v17;
  if (v17) {

  }
  *(void *)(inited + 216) = &type metadata for Bool;
  *(unsigned char *)(inited + 192) = v18 != 0;
  unint64_t v19 = sub_10000E72C(inited);
  id v20 = [a1 category];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v34 = &type metadata for UInt;
    *(void *)&long long v33 = [v20 type];
    sub_1000155C8(&v33, v32);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100012458(v32, 0x79726F6765746163, 0xEC00000065707954, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    id v23 = [v21 subtype];
    uint64_t v34 = &type metadata for UInt;
    *(void *)&long long v33 = v23;
    sub_1000155C8(&v33, v32);
    char v24 = swift_isUniquelyReferenced_nonNull_native();
    sub_100012458(v32, 0x79726F6765746163, 0xEF65707974627553, v24);
    swift_bridgeObjectRelease();
    unsigned __int8 v25 = [v21 isHighImpact];
    uint64_t v34 = &type metadata for Bool;
    LOBYTE(v33) = v25;
    sub_1000155C8(&v33, v32);
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_100012458(v32, 0x6D49686769487369, 0xEC00000074636170, v26);

    swift_bridgeObjectRelease();
  }
  id v27 = [a1 generatedSummary];
  if (v27)
  {
    uint64_t v28 = v27;
    unsigned __int8 v29 = [v27 urgent];
    uint64_t v34 = &type metadata for Bool;
    LOBYTE(v33) = v29;
    sub_1000155C8(&v33, v32);
    char v30 = swift_isUniquelyReferenced_nonNull_native();
    sub_100012458(v32, 0x746E656772557369, 0xE800000000000000, v30);

    swift_bridgeObjectRelease();
  }
  return v19;
}

unint64_t sub_10000E72C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006780(&qword_100044880);
  uint64_t v2 = sub_100036C60();
  id v3 = (void *)v2;
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
    sub_100015640(v6, (uint64_t)&v15, &qword_100044888);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001172C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000155C8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10000E864(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006780(&qword_100044898);
  uint64_t v2 = sub_100036C60();
  id v3 = (void *)v2;
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
    sub_100015640(v6, (uint64_t)&v13, &qword_1000448A0);
    uint64_t v7 = v13;
    unint64_t result = sub_1000117A4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1000155C8(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10000E994(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006780(&qword_1000448B8);
  uint64_t v2 = (void *)sub_100036C60();
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
    unint64_t result = sub_10001172C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_10000EAA8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006780(&qword_100044878);
  uint64_t v2 = (void *)sub_100036C60();
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
    unint64_t result = sub_10001172C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
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

uint64_t MessageExtractor.next()(uint64_t a1)
{
  *(void *)(v2 + 208) = a1;
  *(void *)(v2 + 216) = v1;
  return _swift_task_switch(sub_10000EBE4, 0, 0);
}

uint64_t sub_10000EBE4()
{
  sub_1000369F0();
  id v1 = [**(id **)(v0 + 216) messageRepository];
  *(void *)(v0 + 224) = v1;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 284;
  *(void *)(v0 + 24) = sub_10000ED50;
  uint64_t v2 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_10000D374;
  *(void *)(v0 + 104) = &unk_100042110;
  *(void *)(v0 + 112) = v2;
  [v1 isDataAccessible:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_10000ED50()
{
  return _swift_task_switch(sub_10000EE30, 0, 0);
}

uint64_t sub_10000EE30()
{
  int v1 = *(unsigned __int8 *)(v0 + 284);

  if (v1 != 1)
  {
LABEL_16:
    uint64_t v22 = type metadata accessor for ExtractedMessage();
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(*(void *)(v0 + 208), 1, 1);
    id v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v3 = type metadata accessor for MessageExtractor();
  *(void *)(v0 + 232) = v3;
  uint64_t v11 = *(int *)(v3 + 52);
  *(_DWORD *)(v0 + 280) = v11;
  uint64_t v12 = *(void *)(v2 + v11);
  if (v12)
  {
    unint64_t v13 = *(void *)(v2 + *(int *)(v3 + 56));
    if (v13 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_100036C30();
      uint64_t v3 = swift_bridgeObjectRelease();
      if (v12 < v21)
      {
LABEL_5:
        if ((v13 & 0xC000000000000001) == 0)
        {
          if (v12 < 0)
          {
            __break(1u);
          }
          else if ((unint64_t)v12 < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v14 = *(id *)(v13 + 8 * v12 + 32);
            goto LABEL_9;
          }
          __break(1u);
          return withCheckedContinuation<A>(isolation:function:_:)(v3, v4, v5, v6, v7, v8, v9, v10);
        }
        id v14 = (id)sub_100036BF0();
LABEL_9:
        id v15 = v14;
        *(void *)(v0 + 256) = v14;
        uint64_t v16 = *(void *)(v0 + 216);
        uint64_t v17 = swift_task_alloc();
        *(void *)(v0 + 264) = v17;
        *(void *)(v17 + 16) = v15;
        *(void *)(v17 + 24) = v16;
        id v18 = (void *)swift_task_alloc();
        *(void *)(v0 + 272) = v18;
        uint64_t v10 = sub_100006780(&qword_100044768);
        *id v18 = v0;
        v18[1] = sub_10000F570;
        uint64_t v8 = sub_100011724;
        uint64_t v3 = v0 + 120;
        uint64_t v4 = 0;
        uint64_t v5 = 0;
        uint64_t v6 = 0x29287478656ELL;
        unint64_t v7 = 0xE600000000000000;
        uint64_t v9 = v17;
        return withCheckedContinuation<A>(isolation:function:_:)(v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    else if (v12 < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
  unint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v19;
  *unint64_t v19 = v0;
  v19[1] = sub_10000F0DC;
  return sub_10000D398();
}

uint64_t sub_10000F0DC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 248) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000F1DC, 0, 0);
}

uint64_t sub_10000F1DC()
{
  uint64_t v1 = *(void *)(v0 + 248);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 216);
    uint64_t v3 = *(int *)(*(void *)(v0 + 232) + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v2 + v3) = v1;
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1000365C0();
    sub_100007D00(v4, (uint64_t)qword_1000488A0);
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000365A0();
    os_log_type_t v6 = sub_100036A80();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = *(void *)(v0 + 248);
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 134217984;
      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_100036C30();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      *(void *)(v0 + 168) = v9;
      sub_100036B00();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Queried %ld messages.", v8, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v18 = *(void *)(v0 + 216);
    uint64_t v19 = *(void *)(v18 + *(int *)(v0 + 280));
    unint64_t v20 = *(void *)(v18 + *(int *)(*(void *)(v0 + 232) + 56));
    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_100036C30();
      uint64_t v10 = swift_bridgeObjectRelease();
      if (v19 < v26)
      {
LABEL_11:
        if ((v20 & 0xC000000000000001) == 0)
        {
          if (v19 < 0)
          {
            __break(1u);
          }
          else if ((unint64_t)v19 < *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v21 = *(id *)(v20 + 8 * v19 + 32);
            goto LABEL_15;
          }
          __break(1u);
          return withCheckedContinuation<A>(isolation:function:_:)(v10, v11, v12, v13, v14, v15, v16, v17);
        }
        id v21 = (id)sub_100036BF0();
LABEL_15:
        id v22 = v21;
        *(void *)(v0 + 256) = v21;
        uint64_t v23 = *(void *)(v0 + 216);
        uint64_t v24 = swift_task_alloc();
        *(void *)(v0 + 264) = v24;
        *(void *)(v24 + 16) = v22;
        *(void *)(v24 + 24) = v23;
        unsigned __int8 v25 = (void *)swift_task_alloc();
        *(void *)(v0 + 272) = v25;
        uint64_t v17 = sub_100006780(&qword_100044768);
        *unsigned __int8 v25 = v0;
        v25[1] = sub_10000F570;
        id v15 = sub_100011724;
        uint64_t v10 = v0 + 120;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0x29287478656ELL;
        unint64_t v14 = 0xE600000000000000;
        uint64_t v16 = v24;
        return withCheckedContinuation<A>(isolation:function:_:)(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else if (v19 < *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_11;
    }
  }
  uint64_t v27 = type metadata accessor for ExtractedMessage();
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(*(void *)(v0 + 208), 1, 1);
  uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_10000F570()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_10000F688, 0, 0);
}

uint64_t sub_10000F688()
{
  uint64_t v77 = v0;
  if (!*(void *)(v0 + 128))
  {
    if (qword_100044478 == -1)
    {
LABEL_5:
      uint64_t v7 = sub_1000365C0();
      sub_100007D00(v7, (uint64_t)qword_1000488A0);
      uint64_t v8 = sub_1000365A0();
      os_log_type_t v9 = sub_100036AA0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to extract message content. Terminated extraction loop.", v10, 2u);
        swift_slowDealloc();
        uint64_t v11 = *(NSObject **)(v0 + 256);
      }
      else
      {
        uint64_t v11 = v8;
        uint64_t v8 = *(NSObject **)(v0 + 256);
      }

      uint64_t v44 = (int *)type metadata accessor for ExtractedMessage();
      uint64_t v45 = 1;
      goto LABEL_32;
    }
LABEL_36:
    swift_once();
    goto LABEL_5;
  }
  uint64_t v70 = *(void *)(v0 + 144);
  uint64_t v71 = *(void *)(v0 + 136);
  unint64_t v1 = 0xE90000000000003ELL;
  uint64_t v2 = 0x6E776F6E6B6E753CLL;
  id v3 = [*(id *)(v0 + 256) senderAddress];
  if (v3)
  {
    id v4 = [v3 stringValue];
    swift_unknownObjectRelease();
    uint64_t v5 = sub_1000367C0();
    unint64_t v67 = v6;
    uint64_t v68 = v5;
  }
  else
  {
    uint64_t v68 = 0x6E776F6E6B6E753CLL;
    unint64_t v67 = 0xE90000000000003ELL;
  }
  id v12 = [*(id *)(v0 + 256) subject];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = [v12 subjectString];

    uint64_t v2 = sub_1000367C0();
    unint64_t v1 = v15;
  }
  uint64_t v69 = v2;
  unint64_t v74 = v1;
  uint64_t v16 = *(void **)(v0 + 256);
  uint64_t v17 = *(int *)(v0 + 280);
  uint64_t v18 = *(void *)(v0 + 232);
  uint64_t v19 = *(void *)(v0 + 216);
  unint64_t v20 = self;
  NSString v21 = sub_100036790();
  swift_bridgeObjectRelease();
  id v22 = [v20 snippetFromHTMLBody:v21 options:*(void *)(v19 + 16) maxLength:*(void *)(v19 + *(int *)(v18 + 40)) preservingQuotedForwardedContent:0];

  uint64_t v23 = sub_1000367C0();
  uint64_t v25 = v24;

  uint64_t v26 = v19 + *(int *)(v18 + 48);
  char v27 = *(unsigned char *)(v26 + 1);
  uint64_t v28 = *(void *)(v26 + 8);
  LOBYTE(v76[0]) = *(unsigned char *)v26;
  BYTE1(v76[0]) = v27;
  v76[1] = v28;
  swift_retain();
  uint64_t v65 = v23;
  unint64_t v72 = v25;
  uint64_t v73 = sub_100020D28(v23, v25, (uint64_t)v76);
  unint64_t v75 = v29;
  swift_release();
  uint64_t v30 = *(void *)(v19 + v17);
  sub_10000E24C(v16);
  if (qword_100044478 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_1000365C0();
  sub_100007D00(v31, (uint64_t)qword_1000488A0);
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_1000365A0();
  os_log_type_t v33 = sub_100036A80();
  uint64_t v66 = v30;
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    v76[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 134218242;
    *(void *)(v0 + 192) = v30;
    sub_100036B00();
    *(_WORD *)(v34 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_100036710();
    unint64_t v37 = v36;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 200) = sub_10000B1D4(v35, v37, v76);
    sub_100036B00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Message metadata %ld:%s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  unint64_t v38 = v74;
  if (*(unsigned char *)v26 == 1)
  {
    uint64_t v39 = HIBYTE(v75) & 0xF;
    uint64_t v40 = v73;
    if ((v75 & 0x2000000000000000) == 0) {
      uint64_t v39 = v73 & 0xFFFFFFFFFFFFLL;
    }
    if (v39)
    {
      swift_bridgeObjectRetain();
      Class v41 = sub_1000365A0();
      os_log_type_t v42 = sub_100036A90();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = swift_slowAlloc();
        v76[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v43 = 134218242;
        *(void *)(v0 + 176) = v66;
        sub_100036B00();
        *(_WORD *)(v43 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 184) = sub_10000B1D4(v65, v72, v76);
        sub_100036B00();
        unint64_t v38 = v74;
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Parsed body %ld: %s", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      swift_bridgeObjectRetain_n();
      uint64_t v46 = sub_1000365A0();
      os_log_type_t v47 = sub_100036A90();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = swift_slowAlloc();
        v76[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v48 = 134218242;
        *(void *)(v0 + 160) = v66;
        sub_100036B00();
        *(_WORD *)(v48 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 152) = sub_10000B1D4(v73, v75, v76);
        sub_100036B00();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Cleaned body %ld: %s", (uint8_t *)v48, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v40 = v73;
  }
  uint64_t v49 = *(int *)(v0 + 280);
  uint64_t v50 = *(void *)(v0 + 216);
  uint64_t v51 = *(void *)(v50 + v49);
  BOOL v52 = __OFADD__(v51, 1);
  uint64_t v53 = v51 + 1;
  if (v52)
  {
    __break(1u);
    goto LABEL_36;
  }
  id v54 = *(void **)(v0 + 256);
  uint64_t v55 = *(void *)(v0 + 208);
  *(void *)(v50 + v49) = v53;
  id v56 = [v54 date];
  sub_100036230();

  id v57 = [v54 conversationID];
  uint64_t v44 = (int *)type metadata accessor for ExtractedMessage();
  uint64_t v45 = 0;
  id v58 = (uint64_t *)(v55 + v44[5]);
  *id v58 = v68;
  v58[1] = v67;
  uint64_t v59 = (void *)(v55 + v44[6]);
  *uint64_t v59 = 25965;
  v59[1] = 0xE200000000000000;
  uint64_t v60 = (uint64_t *)(v55 + v44[7]);
  *uint64_t v60 = v69;
  v60[1] = v38;
  uint64_t v61 = (uint64_t *)(v55 + v44[8]);
  *uint64_t v61 = v40;
  v61[1] = v75;
  *(void *)(v55 + v44[9]) = v57;
  long long v62 = (void *)(v55 + v44[10]);
  *long long v62 = v71;
  v62[1] = v70;
LABEL_32:
  (*(void (**)(void, uint64_t, uint64_t))(*((void *)v44 - 1) + 56))(*(void *)(v0 + 208), v45, 1);
  uint64_t v63 = *(uint64_t (**)(void))(v0 + 8);
  return v63();
}

void sub_10000FF4C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100006780(&qword_100044900);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  os_log_type_t v9 = *(void **)(a3 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_100015780;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000104B8;
  aBlock[3] = &unk_1000421F0;
  id v12 = _Block_copy(aBlock);
  id v13 = v9;
  swift_release();
  id v14 = [a2 requestRepresentationWithOptions:v13 completionHandler:v12];
  _Block_release(v12);
}

void sub_100010120(void *a1)
{
  uint64_t v2 = sub_100036810();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100006780(&qword_100044908);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = &v25[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_100036190();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  id v12 = &v25[-v11];
  if (!a1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    sub_100006780(&qword_100044900);
    sub_1000369D0();
    return;
  }
  id v13 = a1;
  id v14 = [v13 contentURL];
  if (v14)
  {
    unint64_t v15 = v14;
    sub_100036170();

    uint64_t v16 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32);
    v16(v5, v10, v6);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v16(v12, v5, v6);
      sub_1000367F0();
      uint64_t v17 = sub_100036780();
      uint64_t v19 = v18;
      id v20 = [v13 requestedHeaders];
      NSString v21 = v20;
      if (v20)
      {
        id v22 = [v20 firstHeaderForKey:ECMessageHeaderKeyAutoSubmitted];

        if (v22)
        {
          NSString v21 = (void *)sub_1000367C0();
          uint64_t v24 = v23;

LABEL_14:
          *(void *)&long long v26 = v17;
          *((void *)&v26 + 1) = v19;
          *(void *)&long long v27 = v21;
          *((void *)&v27 + 1) = v24;
          sub_100006780(&qword_100044900);
          sub_1000369D0();

          (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
          return;
        }
        NSString v21 = 0;
      }
      uint64_t v24 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  sub_100015804((uint64_t)v5, &qword_100044908);
  long long v26 = 0u;
  long long v27 = 0u;
  sub_100006780(&qword_100044900);
  sub_1000369D0();
}

void sub_1000104B8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100010544@<X0>(uint64_t a1@<X8>)
{
  return sub_1000155D8(v1, a1, (uint64_t (*)(void))type metadata accessor for MessageExtractor);
}

uint64_t sub_100010578(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100010624;
  v4[26] = a1;
  v4[27] = v1;
  return _swift_task_switch(sub_10000EBE4, 0, 0);
}

uint64_t sub_100010624()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100010718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[3] = a2;
  id v7 = (void *)swift_task_alloc();
  v5[6] = v7;
  *id v7 = v5;
  v7[1] = sub_1000107CC;
  v7[26] = a1;
  v7[27] = v4;
  return _swift_task_switch(sub_10000EBE4, 0, 0);
}

uint64_t sub_1000107CC()
{
  uint64_t v2 = (void *)*v1;
  v2[7] = v0;
  swift_task_dealloc();
  if (v0)
  {
    if (v2[3])
    {
      swift_getObjectType();
      uint64_t v3 = sub_1000369C0();
      uint64_t v5 = v4;
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v5 = 0;
    }
    return _swift_task_switch(sub_10001093C, v3, v5);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v2[1];
    return v6();
  }
}

uint64_t sub_10001093C()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = (void *)v0[5];
  v0[2] = v1;
  sub_100006780(&qword_100044890);
  swift_willThrowTypedImpl();
  *uint64_t v2 = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

Swift::String __swiftcall joinMessages(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = type metadata accessor for ExtractedMessage();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&rawValue - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)_swiftEmptyArrayStorage;
  id v7 = (void *)sub_10000E994((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v8 = *((void *)a1._rawValue + 2);
  if (!v8)
  {
LABEL_30:
    uint64_t v55 = (uint64_t)v6;
    sub_100006780(&qword_100044778);
    sub_100014664(&qword_100044780, &qword_100044778);
    uint64_t v43 = sub_100036760();
    uint64_t v45 = v44;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v46 = v43;
    os_log_type_t v47 = v45;
    goto LABEL_34;
  }
  uint64_t v9 = (char *)a1._rawValue
     + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v10 = *(void *)(v3 + 72);
  rawValue = a1._rawValue;
  uint64_t v50 = v10;
  swift_bridgeObjectRetain();
  uint64_t v51 = v5;
  uint64_t v52 = v2;
  while (1)
  {
    sub_10001453C((uint64_t)v9, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
    uint64_t v11 = &v5[*(int *)(v2 + 20)];
    uint64_t v12 = *(void *)v11;
    unint64_t v13 = *((void *)v11 + 1);
    uint64_t v14 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000) == 0) {
      uint64_t v14 = v12 & 0xFFFFFFFFFFFFLL;
    }
    if (v14)
    {
      uint64_t v15 = sub_100036830();
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v17 = 0xE700000000000000;
      uint64_t v15 = 0x6E776F6E6B6E75;
    }
    uint64_t v18 = v7[2];
    uint64_t v53 = v6;
    if (v18)
    {
      swift_bridgeObjectRetain();
      unint64_t v19 = sub_10001172C(v15, v17);
      if (v20)
      {
        uint64_t v21 = *(void *)(v7[7] + 8 * v19);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v21 = v7[2];
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v55 = (uint64_t)v7;
    unint64_t v24 = sub_10001172C(v15, v17);
    uint64_t v25 = v7[2];
    BOOL v26 = (v23 & 1) == 0;
    uint64_t v27 = v25 + v26;
    if (__OFADD__(v25, v26)) {
      break;
    }
    char v28 = v23;
    if (v7[3] >= v27)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        id v7 = (void *)v55;
        if (v23) {
          goto LABEL_20;
        }
      }
      else
      {
        sub_100012AF8();
        id v7 = (void *)v55;
        if (v28) {
          goto LABEL_20;
        }
      }
    }
    else
    {
      sub_100011B7C(v27, isUniquelyReferenced_nonNull_native);
      unint64_t v29 = sub_10001172C(v15, v17);
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_33;
      }
      unint64_t v24 = v29;
      id v7 = (void *)v55;
      if (v28)
      {
LABEL_20:
        *(void *)(v7[7] + 8 * v24) = v21;
        goto LABEL_24;
      }
    }
    v7[(v24 >> 6) + 8] |= 1 << v24;
    uint64_t v31 = (uint64_t *)(v7[6] + 16 * v24);
    *uint64_t v31 = v15;
    v31[1] = v17;
    *(void *)(v7[7] + 8 * v24) = v21;
    uint64_t v32 = v7[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_32;
    }
    v7[2] = v34;
    swift_bridgeObjectRetain();
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v54 = v21;
    uint64_t v55 = 0x207265646E6553;
    unint64_t v56 = 0xE700000000000000;
    v57._countAndFlagsBits = sub_100036DF0();
    sub_1000368A0(v57);
    swift_bridgeObjectRelease();
    v58._countAndFlagsBits = 8250;
    v58._object = (void *)0xE200000000000000;
    sub_1000368A0(v58);
    uint64_t v5 = v51;
    uint64_t v2 = v52;
    uint64_t v35 = (uint64_t *)&v51[*(int *)(v52 + 32)];
    uint64_t v36 = *v35;
    unint64_t v37 = (void *)v35[1];
    swift_bridgeObjectRetain();
    v59._countAndFlagsBits = v36;
    v59._object = v37;
    sub_1000368A0(v59);
    swift_bridgeObjectRelease();
    uint64_t v38 = v55;
    unint64_t v39 = v56;
    uint64_t v6 = v53;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v6 = sub_10000AB24(0, *((void *)v6 + 2) + 1, 1, v6);
    }
    unint64_t v41 = *((void *)v6 + 2);
    unint64_t v40 = *((void *)v6 + 3);
    if (v41 >= v40 >> 1) {
      uint64_t v6 = sub_10000AB24((char *)(v40 > 1), v41 + 1, 1, v6);
    }
    *((void *)v6 + 2) = v41 + 1;
    os_log_type_t v42 = &v6[16 * v41];
    *((void *)v42 + 4) = v38;
    *((void *)v42 + 5) = v39;
    sub_1000145A4((uint64_t)v5);
    v9 += v50;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  uint64_t v46 = sub_100036E40();
  __break(1u);
LABEL_34:
  result._object = v47;
  result._countAndFlagsBits = v46;
  return result;
}

uint64_t groupAndSortMessages(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExtractedMessage();
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v9 = (char *)v39 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v42 = *(int *)(v6 + 36);
    unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v39[1] = a1;
    unint64_t v40 = v11;
    uint64_t v12 = a1 + v11;
    uint64_t v13 = *(void *)(v7 + 72);
    swift_bridgeObjectRetain();
    uint64_t v14 = 0;
    uint64_t v15 = &_swiftEmptyDictionarySingleton;
    unint64_t v41 = v5;
    while (1)
    {
      sub_10001453C(v12, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      uint64_t v16 = *(void *)&v9[v42];
      sub_1000155D8((uint64_t)v9, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      sub_100014600((uint64_t)v14);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v43 = v15;
      unint64_t v19 = sub_100011838(v16);
      uint64_t v20 = v15[2];
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21)) {
        break;
      }
      char v23 = v18;
      if (v15[3] >= v22)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100012CA8();
          uint64_t v15 = v43;
        }
      }
      else
      {
        sub_100011E88(v22, isUniquelyReferenced_nonNull_native);
        uint64_t v15 = v43;
        unint64_t v24 = sub_100011838(v16);
        if ((v23 & 1) != (v25 & 1)) {
          goto LABEL_26;
        }
        unint64_t v19 = v24;
      }
      swift_bridgeObjectRelease();
      if (v23)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v15[(v19 >> 6) + 8] |= 1 << v19;
        *(void *)(v15[6] + 8 * v19) = v16;
        *(void *)(v15[7] + 8 * v19) = _swiftEmptyArrayStorage;
        uint64_t v26 = v15[2];
        uint64_t v27 = v26 + 1;
        BOOL v28 = __OFADD__(v26, 1);
        swift_bridgeObjectRetain();
        if (v28) {
          goto LABEL_25;
        }
        v15[2] = v27;
      }
      uint64_t v29 = v15[7];
      swift_bridgeObjectRelease();
      unint64_t v30 = *(void *)(v29 + 8 * v19);
      char v31 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v29 + 8 * v19) = v30;
      if ((v31 & 1) == 0)
      {
        unint64_t v30 = sub_10000AC34(0, *(void *)(v30 + 16) + 1, 1, v30);
        *(void *)(v29 + 8 * v19) = v30;
      }
      unint64_t v33 = *(void *)(v30 + 16);
      unint64_t v32 = *(void *)(v30 + 24);
      if (v33 >= v32 >> 1)
      {
        unint64_t v30 = sub_10000AC34(v32 > 1, v33 + 1, 1, v30);
        *(void *)(v29 + 8 * v19) = v30;
      }
      *(void *)(v30 + 16) = v33 + 1;
      uint64_t v34 = v30 + v40 + v33 * v13;
      uint64_t v5 = v41;
      sub_1000155D8((uint64_t)v41, v34, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      v12 += v13;
      uint64_t v14 = sub_1000111D0;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v35 = sub_1000111D0;
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    uint64_t result = sub_100036E40();
    __break(1u);
  }
  else
  {
    uint64_t v35 = 0;
LABEL_23:
    uint64_t v36 = swift_bridgeObjectRetain();
    uint64_t v37 = sub_10000CA70(v36);
    swift_bridgeObjectRelease_n();
    sub_100014600((uint64_t)v35);
    return v37;
  }
  return result;
}

void sub_1000111D0(void *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
}

uint64_t filterBySender(_:)()
{
  uint64_t v0 = sub_100006780(&qword_100044788);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100036360();
  type metadata accessor for ExtractedMessage();
  v7[1] = sub_100036830();
  v7[2] = v4;
  sub_100014610();
  sub_100014664((unint64_t *)&qword_100044798, &qword_100044788);
  char v5 = sub_100036750();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5 & 1;
}

void *convertSingleMessagesToConversations(_:)(uint64_t a1)
{
  uint64_t v26 = type metadata accessor for ExtractedMessage();
  __chkstk_darwin(v26);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v6 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = (v6 + 32) & ~v6;
  uint64_t v8 = a1 + v7;
  uint64_t v24 = *(void *)(v2 + 72);
  uint64_t v25 = v7;
  uint64_t v23 = v24 + v7;
  uint64_t v22 = v6 | 7;
  v20[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v9 = _swiftEmptyArrayStorage;
  long long v21 = xmmword_100038110;
  do
  {
    sub_10001453C(v8, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
    uint64_t v10 = v26;
    uint64_t v11 = *(void *)&v4[*(int *)(v26 + 36)];
    sub_100006780(&qword_100044710);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = v21;
    sub_10001453C((uint64_t)v4, v12 + v25, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
    uint64_t v13 = &v4[*(int *)(v10 + 32)];
    uint64_t v14 = *(void *)v13;
    uint64_t v15 = *((void *)v13 + 1);
    swift_bridgeObjectRetain();
    sub_1000145A4((uint64_t)v4);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = sub_10000AED8(0, v9[2] + 1, 1, v9);
    }
    unint64_t v17 = v9[2];
    unint64_t v16 = v9[3];
    if (v17 >= v16 >> 1) {
      uint64_t v9 = sub_10000AED8((void *)(v16 > 1), v17 + 1, 1, v9);
    }
    _OWORD v9[2] = v17 + 1;
    char v18 = &v9[5 * v17];
    v18[4] = v11;
    v18[5] = 1;
    v18[6] = v12;
    v18[7] = v14;
    v18[8] = v15;
    v8 += v24;
    --v5;
  }
  while (v5);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_100011650(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_1000116A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000116B4()
{
  return swift_release();
}

uint64_t sub_1000116BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_100044658);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100011724(uint64_t a1)
{
  sub_10000FF4C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_10001172C(uint64_t a1, uint64_t a2)
{
  sub_100036EB0();
  sub_100036870();
  Swift::Int v4 = sub_100036ED0();

  return sub_100012618(a1, a2, v4);
}

unint64_t sub_1000117A4(uint64_t a1)
{
  sub_1000367C0();
  sub_100036EB0();
  sub_100036870();
  Swift::Int v2 = sub_100036ED0();
  swift_bridgeObjectRelease();

  return sub_1000126FC(a1, v2);
}

unint64_t sub_100011838(uint64_t a1)
{
  uint64_t v2 = sub_100036EA0();

  return sub_100012874(a1, v2);
}

uint64_t sub_10001187C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006780(&qword_100044880);
  uint64_t v6 = sub_100036C50();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      long long v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1000155C8(v24, v35);
      }
      else
      {
        sub_10000C7B4((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_100036EB0();
      sub_100036870();
      uint64_t result = sub_100036ED0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1000155C8(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100011B7C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006780(&qword_1000448B8);
  char v37 = a2;
  uint64_t v6 = sub_100036C50();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_100036EB0();
    sub_100036870();
    uint64_t result = sub_100036ED0();
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
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
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

uint64_t sub_100011E88(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006780(&qword_1000448A8);
  uint64_t result = sub_100036C50();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_100036EA0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100012140(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006780(&qword_100044878);
  char v36 = a2;
  uint64_t v6 = sub_100036C50();
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
    unint64_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100036EB0();
    sub_100036870();
    uint64_t result = sub_100036ED0();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_100012458(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10001172C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100012910();
      goto LABEL_7;
    }
    sub_10001187C(v15, a4 & 1);
    unint64_t v21 = sub_10001172C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_100036E40();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10000685C((uint64_t)v19);
    return sub_1000155C8(a1, v19);
  }
LABEL_13:
  sub_1000125AC(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1000125AC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1000155C8(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_100012618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100036E10() & 1) == 0)
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
      while (!v14 && (sub_100036E10() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000126FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1000367C0();
    uint64_t v8 = v7;
    if (v6 == sub_1000367C0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_100036E10();
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
          uint64_t v13 = sub_1000367C0();
          uint64_t v15 = v14;
          if (v13 == sub_1000367C0() && v15 == v16) {
            break;
          }
          char v18 = sub_100036E10();
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

unint64_t sub_100012874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_100012910()
{
  uint64_t v1 = v0;
  sub_100006780(&qword_100044880);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100036C40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  char v25 = v1;
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10000C7B4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_1000155C8(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_100012AF8()
{
  uint64_t v1 = v0;
  sub_100006780(&qword_1000448B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100036C40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_100012CA8()
{
  uint64_t v1 = v0;
  sub_100006780(&qword_1000448A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100036C40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100012E4C()
{
  uint64_t v1 = v0;
  sub_100006780(&qword_100044878);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100036C40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

Swift::Int sub_100013004(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for ExtractedMessage() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_100026FEC(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_1000130AC(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_1000130AC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for ExtractedMessage();
  uint64_t v132 = *(void *)(v4 - 8);
  uint64_t v133 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v129 = (uint64_t)&v124 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v139 = (uint64_t)&v124 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v136 = (uint64_t)&v124 - v10;
  __chkstk_darwin(v9);
  uint64_t v135 = (uint64_t)&v124 - v11;
  Swift::Int v12 = a1[1];
  Swift::Int result = sub_100036DE0(v12);
  if (result >= v12)
  {
    if (v12 < 0) {
      goto LABEL_142;
    }
    if (v12) {
      return sub_100013B1C(0, v12, 1, a1);
    }
    return result;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_150;
  }
  Swift::Int v125 = result;
  if (v12 < 2)
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
    unint64_t v131 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v132 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v132 + 80));
    if (v12 != 1)
    {
      unint64_t v21 = _swiftEmptyArrayStorage[2];
      uint64_t v20 = (char *)_swiftEmptyArrayStorage;
LABEL_107:
      v117 = v20;
      v124 = v18;
      if (v21 >= 2)
      {
        uint64_t v118 = *a1;
        do
        {
          unint64_t v119 = v21 - 2;
          if (v21 < 2) {
            goto LABEL_137;
          }
          if (!v118) {
            goto LABEL_149;
          }
          uint64_t v120 = *(void *)&v117[16 * v119 + 32];
          uint64_t v121 = *(void *)&v117[16 * v21 + 24];
          sub_100013DBC(v118 + *(void *)(v132 + 72) * v120, v118 + *(void *)(v132 + 72) * *(void *)&v117[16 * v21 + 16], v118 + *(void *)(v132 + 72) * v121, v131);
          if (v2) {
            break;
          }
          if (v121 < v120) {
            goto LABEL_138;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v117 = sub_1000144A0((uint64_t)v117);
          }
          if (v119 >= *((void *)v117 + 2)) {
            goto LABEL_139;
          }
          v122 = &v117[16 * v119 + 32];
          *(void *)v122 = v120;
          *((void *)v122 + 1) = v121;
          unint64_t v123 = *((void *)v117 + 2);
          if (v21 > v123) {
            goto LABEL_140;
          }
          memmove(&v117[16 * v21 + 16], &v117[16 * v21 + 32], 16 * (v123 - v21));
          *((void *)v117 + 2) = v123 - 1;
          unint64_t v21 = v123 - 1;
        }
        while (v123 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      v124[2] = 0;
      return swift_bridgeObjectRelease();
    }
    v124 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v15 = v14 >> 1;
    uint64_t v16 = sub_1000369A0();
    *(void *)(v16 + 16) = v15;
    uint64_t v17 = *(unsigned __int8 *)(v132 + 80);
    v124 = (void *)v16;
    unint64_t v131 = v16 + ((v17 + 32) & ~v17);
  }
  Swift::Int v19 = 0;
  uint64_t v20 = (char *)_swiftEmptyArrayStorage;
  v138 = a1;
  while (1)
  {
    Swift::Int v22 = v19;
    Swift::Int v23 = v19 + 1;
    Swift::Int v130 = v19;
    if (v19 + 1 >= v12)
    {
      Swift::Int v39 = v19 + 1;
      goto LABEL_59;
    }
    uint64_t v127 = v2;
    uint64_t v24 = *a1;
    uint64_t v25 = *a1 + *(void *)(v132 + 72) * v23;
    uint64_t v140 = *(void *)(v132 + 72);
    uint64_t v26 = v140;
    uint64_t v27 = v135;
    sub_10001453C(v25, v135, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
    uint64_t v28 = v24 + v26 * v22;
    uint64_t v29 = v136;
    sub_10001453C(v28, v136, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
    LODWORD(v137) = sub_100036220();
    sub_1000145A4(v29);
    sub_1000145A4(v27);
    uint64_t v30 = v140;
    uint64_t v134 = v24;
    if (v22 + 2 >= v12)
    {
      Swift::Int v33 = v22 + 2;
      if ((v137 & 1) == 0) {
        goto LABEL_38;
      }
    }
    else
    {
      v126 = v20;
      uint64_t v31 = v140 * v23;
      uint64_t v32 = v24;
      Swift::Int v33 = v22 + 2;
      uint64_t v34 = v140 * (v22 + 2);
      do
      {
        Swift::Int v35 = v12;
        uint64_t v36 = v135;
        sub_10001453C(v32 + v34, v135, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
        uint64_t v37 = v136;
        sub_10001453C(v32 + v31, v136, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
        int v38 = sub_100036220();
        sub_1000145A4(v37);
        sub_1000145A4(v36);
        if ((v137 ^ v38))
        {
          uint64_t v20 = v126;
          Swift::Int v22 = v130;
          Swift::Int v12 = v35;
          uint64_t v30 = v140;
          if ((v137 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_25;
        }
        uint64_t v30 = v140;
        v32 += v140;
        ++v33;
        Swift::Int v12 = v35;
      }
      while (v35 != v33);
      Swift::Int v33 = v35;
      uint64_t v20 = v126;
      Swift::Int v22 = v130;
      if ((v137 & 1) == 0)
      {
LABEL_38:
        Swift::Int v39 = v33;
        goto LABEL_39;
      }
    }
LABEL_25:
    if (v33 < v22) {
      goto LABEL_143;
    }
    Swift::Int v39 = v33;
    if (v22 < v33) {
      break;
    }
LABEL_39:
    uint64_t v2 = v127;
    if (v39 < v12) {
      goto LABEL_42;
    }
LABEL_59:
    if (v39 < v22) {
      goto LABEL_136;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v137 = v39;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v20 = sub_100014264(0, *((void *)v20 + 2) + 1, 1, v20);
    }
    unint64_t v66 = *((void *)v20 + 2);
    unint64_t v65 = *((void *)v20 + 3);
    unint64_t v21 = v66 + 1;
    if (v66 >= v65 >> 1) {
      uint64_t v20 = sub_100014264((char *)(v65 > 1), v66 + 1, 1, v20);
    }
    *((void *)v20 + 2) = v21;
    unint64_t v67 = v20 + 32;
    uint64_t v68 = &v20[16 * v66 + 32];
    Swift::Int v69 = v137;
    *(void *)uint64_t v68 = v22;
    *((void *)v68 + 1) = v69;
    if (v66)
    {
      while (1)
      {
        unint64_t v70 = v21 - 1;
        if (v21 >= 4)
        {
          unint64_t v75 = &v67[16 * v21];
          uint64_t v76 = *((void *)v75 - 8);
          uint64_t v77 = *((void *)v75 - 7);
          BOOL v81 = __OFSUB__(v77, v76);
          uint64_t v78 = v77 - v76;
          if (v81) {
            goto LABEL_125;
          }
          uint64_t v80 = *((void *)v75 - 6);
          uint64_t v79 = *((void *)v75 - 5);
          BOOL v81 = __OFSUB__(v79, v80);
          uint64_t v73 = v79 - v80;
          char v74 = v81;
          if (v81) {
            goto LABEL_126;
          }
          unint64_t v82 = v21 - 2;
          v83 = &v67[16 * v21 - 32];
          uint64_t v85 = *(void *)v83;
          uint64_t v84 = *((void *)v83 + 1);
          BOOL v81 = __OFSUB__(v84, v85);
          uint64_t v86 = v84 - v85;
          if (v81) {
            goto LABEL_128;
          }
          BOOL v81 = __OFADD__(v73, v86);
          uint64_t v87 = v73 + v86;
          if (v81) {
            goto LABEL_131;
          }
          if (v87 >= v78)
          {
            v105 = &v67[16 * v70];
            uint64_t v107 = *(void *)v105;
            uint64_t v106 = *((void *)v105 + 1);
            BOOL v81 = __OFSUB__(v106, v107);
            uint64_t v108 = v106 - v107;
            if (v81) {
              goto LABEL_135;
            }
            BOOL v98 = v73 < v108;
            goto LABEL_96;
          }
        }
        else
        {
          if (v21 != 3)
          {
            uint64_t v99 = *((void *)v20 + 4);
            uint64_t v100 = *((void *)v20 + 5);
            BOOL v81 = __OFSUB__(v100, v99);
            uint64_t v92 = v100 - v99;
            char v93 = v81;
            goto LABEL_90;
          }
          uint64_t v72 = *((void *)v20 + 4);
          uint64_t v71 = *((void *)v20 + 5);
          BOOL v81 = __OFSUB__(v71, v72);
          uint64_t v73 = v71 - v72;
          char v74 = v81;
        }
        if (v74) {
          goto LABEL_127;
        }
        unint64_t v82 = v21 - 2;
        v88 = &v67[16 * v21 - 32];
        uint64_t v90 = *(void *)v88;
        uint64_t v89 = *((void *)v88 + 1);
        BOOL v91 = __OFSUB__(v89, v90);
        uint64_t v92 = v89 - v90;
        char v93 = v91;
        if (v91) {
          goto LABEL_130;
        }
        v94 = &v67[16 * v70];
        uint64_t v96 = *(void *)v94;
        uint64_t v95 = *((void *)v94 + 1);
        BOOL v81 = __OFSUB__(v95, v96);
        uint64_t v97 = v95 - v96;
        if (v81) {
          goto LABEL_133;
        }
        if (__OFADD__(v92, v97)) {
          goto LABEL_134;
        }
        if (v92 + v97 >= v73)
        {
          BOOL v98 = v73 < v97;
LABEL_96:
          if (v98) {
            unint64_t v70 = v82;
          }
          goto LABEL_98;
        }
LABEL_90:
        if (v93) {
          goto LABEL_129;
        }
        v101 = &v67[16 * v70];
        uint64_t v103 = *(void *)v101;
        uint64_t v102 = *((void *)v101 + 1);
        BOOL v81 = __OFSUB__(v102, v103);
        uint64_t v104 = v102 - v103;
        if (v81) {
          goto LABEL_132;
        }
        if (v104 < v92) {
          goto LABEL_15;
        }
LABEL_98:
        unint64_t v109 = v70 - 1;
        if (v70 - 1 >= v21)
        {
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
          goto LABEL_145;
        }
        uint64_t v110 = *a1;
        if (!*a1) {
          goto LABEL_147;
        }
        v111 = v20;
        v112 = &v67[16 * v109];
        uint64_t v113 = *(void *)v112;
        v114 = &v67[16 * v70];
        uint64_t v115 = *((void *)v114 + 1);
        sub_100013DBC(v110 + *(void *)(v132 + 72) * *(void *)v112, v110 + *(void *)(v132 + 72) * *(void *)v114, v110 + *(void *)(v132 + 72) * v115, v131);
        if (v2) {
          goto LABEL_118;
        }
        if (v115 < v113) {
          goto LABEL_122;
        }
        if (v70 > *((void *)v111 + 2)) {
          goto LABEL_123;
        }
        *(void *)v112 = v113;
        *(void *)&v67[16 * v109 + 8] = v115;
        unint64_t v116 = *((void *)v111 + 2);
        if (v70 >= v116) {
          goto LABEL_124;
        }
        uint64_t v20 = v111;
        unint64_t v21 = v116 - 1;
        memmove(&v67[16 * v70], v114 + 16, 16 * (v116 - 1 - v70));
        *((void *)v111 + 2) = v116 - 1;
        a1 = v138;
        if (v116 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v21 = 1;
LABEL_15:
    Swift::Int v12 = a1[1];
    Swift::Int v19 = v137;
    if (v137 >= v12)
    {
      uint64_t v18 = v124;
      goto LABEL_107;
    }
  }
  Swift::Int v137 = v12;
  v126 = v20;
  uint64_t v40 = 0;
  uint64_t v41 = v30 * (v33 - 1);
  Swift::Int v42 = v22;
  uint64_t v43 = v33 * v30;
  Swift::Int v44 = v42;
  uint64_t v45 = v42 * v30;
  do
  {
    if (v44 != v39 + v40 - 1)
    {
      uint64_t v46 = v134;
      if (!v134) {
        goto LABEL_148;
      }
      unint64_t v47 = v134 + v45;
      sub_1000155D8(v134 + v45, v129, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      if (v45 < v41 || v47 >= v46 + v43)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v45 != v41)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      sub_1000155D8(v129, v46 + v41, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      Swift::Int v39 = v33;
      uint64_t v30 = v140;
    }
    ++v44;
    --v40;
    v41 -= v30;
    v43 -= v30;
    v45 += v30;
  }
  while (v44 < v39 + v40);
  Swift::Int v12 = v137;
  a1 = v138;
  uint64_t v20 = v126;
  uint64_t v2 = v127;
  Swift::Int v22 = v130;
  if (v39 >= v137) {
    goto LABEL_59;
  }
LABEL_42:
  if (__OFSUB__(v39, v22)) {
    goto LABEL_141;
  }
  if (v39 - v22 >= v125) {
    goto LABEL_59;
  }
  if (__OFADD__(v22, v125)) {
    goto LABEL_144;
  }
  if (v22 + v125 >= v12) {
    Swift::Int v48 = v12;
  }
  else {
    Swift::Int v48 = v22 + v125;
  }
  if (v48 >= v22)
  {
    if (v39 != v48)
    {
      v126 = v20;
      uint64_t v127 = v2;
      uint64_t v49 = *(void *)(v132 + 72);
      uint64_t v140 = v49 * (v39 - 1);
      uint64_t v134 = v49;
      Swift::Int v50 = v39 * v49;
      Swift::Int v128 = v48;
      do
      {
        uint64_t v52 = 0;
        Swift::Int v53 = v22;
        Swift::Int v137 = v39;
        while (1)
        {
          uint64_t v54 = v138;
          uint64_t v55 = *v138;
          Swift::Int v56 = v50;
          uint64_t v57 = v50 + v52 + *v138;
          uint64_t v58 = v135;
          sub_10001453C(v57, v135, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
          uint64_t v59 = v140 + v52 + v55;
          uint64_t v60 = v136;
          sub_10001453C(v59, v136, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
          char v61 = sub_100036220();
          sub_1000145A4(v60);
          sub_1000145A4(v58);
          if ((v61 & 1) == 0) {
            break;
          }
          uint64_t v62 = *v54;
          if (!*v54) {
            goto LABEL_146;
          }
          Swift::Int v50 = v56;
          uint64_t v63 = v62 + v140 + v52;
          sub_1000155D8(v62 + v56 + v52, v139, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
          swift_arrayInitWithTakeFrontToBack();
          sub_1000155D8(v139, v63, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
          v52 -= v134;
          ++v53;
          Swift::Int v51 = v137;
          if (v137 == v53) {
            goto LABEL_52;
          }
        }
        Swift::Int v51 = v137;
        Swift::Int v50 = v56;
LABEL_52:
        Swift::Int v39 = v51 + 1;
        v140 += v134;
        v50 += v134;
        Swift::Int v22 = v130;
      }
      while (v39 != v128);
      Swift::Int v39 = v128;
      uint64_t v20 = v126;
      uint64_t v2 = v127;
      a1 = v138;
    }
    goto LABEL_59;
  }
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  Swift::Int result = sub_100036C20();
  __break(1u);
  return result;
}

uint64_t sub_100013B1C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v27 = a1;
  uint64_t v28 = type metadata accessor for ExtractedMessage();
  uint64_t v7 = __chkstk_darwin(v28);
  uint64_t v31 = (uint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v15 = (char *)&v25 - v14;
  uint64_t v30 = a3;
  uint64_t v26 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v33 = v16 * (v30 - 1);
    uint64_t v29 = v16;
    uint64_t v32 = v16 * v30;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v27;
    while (1)
    {
      Swift::Int v19 = a4;
      uint64_t v20 = *a4;
      sub_10001453C(v32 + v17 + v20, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      uint64_t v21 = v33 + v17 + v20;
      a4 = v19;
      sub_10001453C(v21, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      char v22 = sub_100036220();
      sub_1000145A4((uint64_t)v11);
      uint64_t result = sub_1000145A4((uint64_t)v15);
      if ((v22 & 1) == 0)
      {
LABEL_4:
        v33 += v29;
        v32 += v29;
        if (++v30 == v26) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v23 = *v19;
      if (!*v19) {
        break;
      }
      uint64_t v24 = v23 + v33 + v17;
      sub_1000155D8(v23 + v32 + v17, v31, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_1000155D8(v31, v24, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      v17 -= v29;
      ++v18;
      a4 = v19;
      if (v30 == v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100013DBC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v36 = type metadata accessor for ExtractedMessage();
  uint64_t v8 = __chkstk_darwin(v36);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  Swift::Int v12 = (char *)&v34 - v11;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_61;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_62;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v39 = a1;
  unint64_t v38 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      uint64_t v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v26 = a4 + v19;
      unint64_t v37 = a4 + v19;
      unint64_t v39 = a2;
      unint64_t v35 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        uint64_t v28 = -v14;
        do
        {
          unint64_t v29 = a3 + v28;
          sub_10001453C(v26 + v28, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
          unint64_t v30 = a2 + v28;
          sub_10001453C(a2 + v28, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
          char v31 = sub_100036220();
          sub_1000145A4((uint64_t)v10);
          sub_1000145A4((uint64_t)v12);
          if (v31)
          {
            if (a3 < a2 || v29 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v39 += v28;
          }
          else
          {
            unint64_t v32 = v37;
            v37 += v28;
            if (a3 < v32 || v29 >= v32)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v32)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v30 = a2;
          }
          unint64_t v26 = v37;
          if (v37 <= a4) {
            break;
          }
          a2 = v30;
          a3 += v28;
        }
        while (v30 > v35);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v20 = a4 + v18;
    unint64_t v37 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_10001453C(a2, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
        sub_10001453C(a4, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
        char v22 = sub_100036220();
        sub_1000145A4((uint64_t)v10);
        sub_1000145A4((uint64_t)v12);
        unint64_t v23 = v39;
        if (v22)
        {
          unint64_t v24 = a2 + v14;
          if (v39 < a2 || v39 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v25 = v38 + v14;
          if (v39 < v38 || v39 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 != v38)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v38 = v25;
          unint64_t v24 = a2;
        }
        unint64_t v39 = v23 + v14;
        a4 = v38;
        if (v38 >= v20) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
LABEL_59:
    sub_100014360(&v39, &v38, (uint64_t *)&v37);
    return 1;
  }
LABEL_63:
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

char *sub_100014264(char *result, int64_t a2, char a3, char *a4)
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
    sub_100006780(&qword_1000448B0);
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
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100014360(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for ExtractedMessage();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_100036C70();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1000144A0(uint64_t a1)
{
  return sub_100014264(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000144B4(uint64_t a1)
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
  uint64_t v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_10001453C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000145A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ExtractedMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014600(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_100014610()
{
  unint64_t result = qword_100044790;
  if (!qword_100044790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044790);
  }
  return result;
}

uint64_t sub_100014664(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006458(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000146A8()
{
  return sub_1000156A4(qword_1000447A0, (void (*)(uint64_t))type metadata accessor for MessageExtractor);
}

void *sub_1000146F0()
{
  return &protocol self-conformance witness table for Error;
}

uint64_t destroy for MessageCleanupParameters()
{
  return swift_release();
}

uint64_t _s22PrivateEvolutionPlugin24MessageCleanupParametersVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MessageCleanupParameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for MessageCleanupParameters(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for MessageCleanupParameters(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageCleanupParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageCleanupParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageCleanupParameters()
{
  return &type metadata for MessageCleanupParameters;
}

char *initializeBufferWithCopyOfBuffer for MessageExtractor(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  int v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    unint64_t v8 = a2[1];
    *((void *)a1 + 1) = v8;
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    *((void *)a1 + 4) = a2[4];
    uint64_t v9 = a3[9];
    __dst = &a1[v9];
    unint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = sub_100036250();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    uint64_t v14 = v4;
    int64_t v15 = v8;
    if (v13(v10, 1, v11))
    {
      uint64_t v16 = sub_100006780(&qword_100044658);
      memcpy(__dst, v10, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v17 = a3[11];
    *(void *)&v7[a3[10]] = *(char **)((char *)a2 + a3[10]);
    uint64_t v18 = &v7[v17];
    uint64_t v19 = (char **)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *(void *)uint64_t v18 = *v19;
    *((void *)v18 + 1) = v20;
    uint64_t v21 = a3[12];
    uint64_t v22 = a3[13];
    unint64_t v23 = &v7[v21];
    uint64_t v24 = (uint64_t)a2 + v21;
    *(_WORD *)unint64_t v23 = *(_WORD *)v24;
    *((void *)v23 + 1) = *(void *)(v24 + 8);
    *(void *)&v7[v22] = *(char **)((char *)a2 + v22);
    *(void *)&v7[a3[14]] = *(char **)((char *)a2 + a3[14]);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for MessageExtractor(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_100036250();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MessageExtractor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  unint64_t v7 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = a3[9];
  __dst = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  uint64_t v10 = sub_100036250();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v6;
  id v14 = v7;
  if (v12(v9, 1, v10))
  {
    uint64_t v15 = sub_100006780(&qword_100044658);
    memcpy(__dst, v9, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v16 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[12];
  uint64_t v21 = a3[13];
  uint64_t v22 = a1 + v20;
  uint64_t v23 = a2 + v20;
  *(_WORD *)uint64_t v22 = *(_WORD *)v23;
  *(void *)(v22 + 8) = *(void *)(v23 + 8);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MessageExtractor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  unint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  uint64_t v9 = *(void **)(a2 + 8);
  uint64_t v10 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v9;
  id v11 = v9;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v12 = a3[9];
  id v13 = (void *)(a1 + v12);
  id v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_100036250();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_100006780(&qword_100044658);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_7:
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  uint64_t v21 = a3[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[12];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  *(unsigned char *)uint64_t v25 = *(unsigned char *)v26;
  *(unsigned char *)(v25 + 1) = *(unsigned char *)(v26 + 1);
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MessageExtractor(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = a3[9];
  id v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100036250();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100006780(&qword_100044658);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  uint64_t v14 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  return a1;
}

uint64_t assignWithTake for MessageExtractor(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = a3[9];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_100036250();
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
    uint64_t v16 = sub_100006780(&qword_100044658);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  int v18 = (void *)(a1 + v17);
  int v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *int v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[12];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(unsigned char *)uint64_t v23 = *(unsigned char *)v24;
  *(unsigned char *)(v23 + 1) = *(unsigned char *)(v24 + 1);
  *(void *)(v23 + 8) = *(void *)(v24 + 8);
  swift_release();
  uint64_t v25 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v25) = *(void *)(a2 + v25);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageExtractor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100015330);
}

uint64_t sub_100015330(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100006780(&qword_100044658);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MessageExtractor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000153F8);
}

void *sub_1000153F8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *__n128 result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100006780(&qword_100044658);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 36);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1000154A4()
{
  sub_100015570();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100015570()
{
  if (!qword_100044820)
  {
    sub_100036250();
    unint64_t v0 = sub_100036AC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100044820);
    }
  }
}

_OWORD *sub_1000155C8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000155D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100015640(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006780(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000156A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000156EC()
{
  uint64_t v1 = sub_100006780(&qword_100044900);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100015780(void *a1)
{
  sub_100006780(&qword_100044900);

  sub_100010120(a1);
}

uint64_t sub_100015804(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006780(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100015868(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_100036F30();
  __chkstk_darwin();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1 & 0xFFFFFFFFFFFFLL;
  uint64_t v22 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v8 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v8) {
    return 0;
  }
  uint64_t v19 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v20 = a2 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v9 = (void (**)(char *, uint64_t))(v5 + 8);
  swift_bridgeObjectRetain();
  char v10 = 0;
  uint64_t v11 = 0;
  do
  {
    if ((a2 & 0x1000000000000000) != 0)
    {
      sub_100036BD0();
    }
    else
    {
      if ((a2 & 0x2000000000000000) != 0)
      {
        uint64_t v23 = a1;
        uint64_t v24 = v20;
      }
      else if ((a1 & 0x1000000000000000) == 0)
      {
        sub_100036C00();
      }
      sub_100036C10();
    }
    uint64_t v13 = v12;
    if ((v10 & 1) == 0 || (sub_100036F40(), char v14 = sub_100036F10(), (*v9)(v7, v4), (v14 & 1) == 0))
    {
      v11 += v13;
      sub_100036F40();
      char v10 = sub_100036F20();
      int v15 = *v9;
      (*v9)(v7, v4);
      if ((v10 & 1) == 0) {
        continue;
      }
      sub_100036F40();
      char v16 = sub_100036F00();
      v15(v7, v4);
      if ((v16 & 1) == 0) {
        continue;
      }
    }
    uint64_t v17 = 1;
    goto LABEL_19;
  }
  while (v11 < v8);
  uint64_t v17 = 0;
LABEL_19:
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_100015A80(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE900000000000064;
  unint64_t v3 = 0x656C6C65636E6163;
  uint64_t v4 = a1;
  unint64_t v5 = 0x656C6C65636E6163;
  unint64_t v6 = 0xE900000000000064;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x7075727265746E69;
      unint64_t v6 = 0xEB00000000646574;
      break;
    case 2:
      uint64_t v7 = "failedToParseConfig";
      goto LABEL_11;
    case 3:
      unint64_t v5 = 0xD000000000000016;
      uint64_t v8 = "emailDataNotAccessible";
      goto LABEL_9;
    case 4:
      unint64_t v5 = 0xD000000000000012;
      uint64_t v8 = "extractedEmptyData";
      goto LABEL_9;
    case 5:
      unint64_t v5 = 0x6F5464656C696166;
      unint64_t v6 = 0xEF74636172747845;
      break;
    case 6:
      unint64_t v5 = 0xD000000000000011;
      uint64_t v8 = "invalidSourceType";
      goto LABEL_9;
    case 7:
      unint64_t v5 = 0xD000000000000015;
      uint64_t v8 = "notEnoughDataToSample";
LABEL_9:
      unint64_t v6 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    case 8:
      uint64_t v7 = "notImplementedError";
LABEL_11:
      unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000013;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEB00000000646574;
      if (v5 == 0x7075727265746E69) {
        goto LABEL_24;
      }
      goto LABEL_28;
    case 2:
      uint64_t v9 = "failedToParseConfig";
      goto LABEL_27;
    case 3:
      unint64_t v3 = 0xD000000000000016;
      char v10 = "emailDataNotAccessible";
      goto LABEL_22;
    case 4:
      unint64_t v3 = 0xD000000000000012;
      char v10 = "extractedEmptyData";
      goto LABEL_22;
    case 5:
      unint64_t v2 = 0xEF74636172747845;
      if (v5 != 0x6F5464656C696166) {
        goto LABEL_28;
      }
      goto LABEL_24;
    case 6:
      unint64_t v3 = 0xD000000000000011;
      char v10 = "invalidSourceType";
      goto LABEL_22;
    case 7:
      unint64_t v3 = 0xD000000000000015;
      char v10 = "notEnoughDataToSample";
LABEL_22:
      unint64_t v2 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      goto LABEL_23;
    case 8:
      uint64_t v9 = "notImplementedError";
LABEL_27:
      unint64_t v2 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      if (v5 != 0xD000000000000013) {
        goto LABEL_28;
      }
      goto LABEL_24;
    default:
LABEL_23:
      if (v5 != v3) {
        goto LABEL_28;
      }
LABEL_24:
      if (v6 == v2) {
        char v11 = 1;
      }
      else {
LABEL_28:
      }
        char v11 = sub_100036E10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11 & 1;
  }
}

uint64_t sub_100015D24(char a1, char a2)
{
  if (qword_100038470[a1] == qword_100038470[a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_100036E10();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_100015D8C(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  uint64_t v6 = qword_100038470[a1];
  while (1)
  {
    if (qword_100038470[*(char *)(a2 + v5 + 32)] == v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      return 1;
    }
    char v7 = sub_100036E10();
    swift_bridgeObjectRelease_n();
    if (v7) {
      break;
    }
    if (v2 == ++v5)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_100015E60(uint64_t a1, uint64_t a2)
{
  v3[38] = a2;
  v3[39] = v2;
  v3[37] = a1;
  uint64_t v4 = sub_100036250();
  v3[40] = v4;
  v3[41] = *(void *)(v4 - 8);
  v3[42] = swift_task_alloc();
  uint64_t v5 = sub_100006780(&qword_100044788);
  v3[43] = v5;
  v3[44] = *(void *)(v5 - 8);
  v3[45] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ExtractedMessage();
  v3[46] = v6;
  v3[47] = *(void *)(v6 - 8);
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  uint64_t v7 = sub_1000369E0();
  v3[50] = v7;
  v3[51] = *(void *)(v7 - 8);
  v3[52] = swift_task_alloc();
  sub_100006780(&qword_100044920);
  v3[53] = swift_task_alloc();
  sub_100006780(&qword_100044658);
  v3[54] = swift_task_alloc();
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  v3[58] = type metadata accessor for MessageExtractor();
  v3[59] = swift_task_alloc();
  v3[60] = swift_task_alloc();
  return _swift_task_switch(sub_100016114, 0, 0);
}

uint64_t sub_100016114()
{
  uint64_t v1 = 0;
  uint64_t v2 = v0[39];
  char v3 = *(unsigned char *)(v2 + 26);
  char v4 = *(unsigned char *)(v2 + 104);
  if ((v4 & 1) != 0 && *(void *)(v2 + 120))
  {
    sub_100036610();
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_100036600();
    swift_bridgeObjectRelease();
  }
  v0[61] = v1;
  uint64_t v5 = (void *)v0[60];
  uint64_t v6 = v0[57];
  uint64_t v7 = v0[58];
  uint64_t v8 = (uint64_t *)v0[39];
  uint64_t v9 = *v8;
  uint64_t v28 = v8[1];
  uint64_t v29 = v8[2];
  uint64_t v10 = type metadata accessor for EmailExtractor();
  sub_100007C40((uint64_t)v8 + *(int *)(v10 + 20), v6);
  uint64_t v11 = v8[12];
  uint64_t v30 = v8[11];
  *(void *)((char *)v5 + *(int *)(v7 + 52)) = 0;
  *(void *)((char *)v5 + *(int *)(v7 + 56)) = _swiftEmptyArrayStorage;
  id v12 = objc_allocWithZone((Class)EMDaemonInterface);
  swift_bridgeObjectRetain();
  swift_retain();
  *uint64_t v5 = [v12 init];
  id v13 = objc_allocWithZone((Class)EMContentRequestOptions);
  v0[14] = sub_10001164C;
  v0[15] = 0;
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 1107296256;
  v0[12] = sub_100011650;
  v0[13] = &unk_100042218;
  char v14 = _Block_copy(v0 + 10);
  id v15 = [v13 initWithBuilder:v14];
  _Block_release(v14);
  swift_release();
  uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    char v17 = v3 & 1;
    uint64_t v18 = v9;
    uint64_t v19 = v0[60];
    uint64_t v20 = v11;
    uint64_t v21 = v0[57];
    uint64_t v22 = (int *)v0[58];
    *(void *)(v19 + 8) = v15;
    *(void *)(v19 + 16) = 49;
    *(void *)(v19 + 24) = v28;
    *(void *)(v19 + v22[10]) = v29;
    *(void *)(v19 + 32) = v18;
    sub_1000116BC(v21, v19 + v22[9]);
    uint64_t v23 = v19 + v22[12];
    *(unsigned char *)uint64_t v23 = v17;
    *(unsigned char *)(v23 + 1) = v4 & 1;
    *(void *)(v23 + 8) = v1;
    uint64_t v24 = (void *)(v19 + v22[11]);
    *uint64_t v24 = v30;
    v24[1] = v20;
    id v25 = [*(id *)v19 messageRepository];
    v0[62] = v25;
    v0[2] = v0;
    v0[7] = v0 + 74;
    v0[3] = sub_100016470;
    uint64_t v26 = swift_continuation_init();
    v0[16] = _NSConcreteStackBlock;
    v0[17] = 0x40000000;
    v0[18] = sub_10000D374;
    v0[19] = &unk_100042240;
    v0[20] = v26;
    [v25 isDataAccessible:v0 + 16];
    uint64_t isEscapingClosureAtFileLocation = (uint64_t)(v0 + 2);
  }
  return _swift_continuation_await(isEscapingClosureAtFileLocation);
}

uint64_t sub_100016470()
{
  return _swift_task_switch(sub_100016550, 0, 0);
}

uint64_t sub_100016550()
{
  int v1 = *(unsigned __int8 *)(v0 + 592);

  if (v1 == 1)
  {
    uint64_t v2 = *(void *)(v0 + 472);
    uint64_t v3 = *(void *)(v0 + 480);
    uint64_t v4 = *(void *)(v0 + 448);
    uint64_t v5 = *(void *)(v0 + 320);
    uint64_t v6 = *(void *)(v0 + 328);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
    *(void *)(v0 + 504) = v7;
    *(void *)(v0 + 512) = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v7(v4, 1, 1, v5);
    sub_10001453C(v3, v2, (uint64_t (*)(void))type metadata accessor for MessageExtractor);
    *(_OWORD *)(v0 + 520) = 0u;
    *(_OWORD *)(v0 + 536) = 0u;
    *(void *)(v0 + 560) = _swiftEmptyArrayStorage;
    *(void *)(v0 + 552) = 0;
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 568) = v8;
    void *v8 = v0;
    v8[1] = sub_100016858;
    uint64_t v9 = *(void *)(v0 + 424);
    return MessageExtractor.next()(v9);
  }
  else
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000365C0();
    sub_100007D00(v11, (uint64_t)qword_1000488A0);
    id v12 = sub_1000365A0();
    os_log_type_t v13 = sub_100036A80();
    if (os_log_type_enabled(v12, v13))
    {
      char v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Email interface: data not accessible.", v14, 2u);
      swift_slowDealloc();
    }
    uint64_t v15 = *(void *)(v0 + 480);
    uint64_t v16 = *(void *)(v0 + 320);
    uint64_t v17 = *(void *)(v0 + 328);
    uint64_t v18 = *(void *)(v0 + 296);
    uint64_t v19 = *(unsigned char **)(v0 + 304);

    swift_release();
    sub_100019048(v15, (uint64_t (*)(void))type metadata accessor for MessageExtractor);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v18, 1, 1, v16);
    *uint64_t v19 = 3;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20(0);
  }
}

uint64_t sub_100016858()
{
  *(void *)(*(void *)v1 + 576) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100017B50;
  }
  else {
    uint64_t v2 = sub_10001696C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001696C()
{
  uint64_t v2 = v0;
  uint64_t v3 = v0[53];
  uint64_t v4 = v0[46];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0[47] + 48))(v3, 1, v4) != 1)
  {
    uint64_t v46 = v0[49];
    sub_100018FE4(v3, v46);
    unint64_t v47 = (uint64_t *)(v46 + *(int *)(v4 + 32));
    uint64_t v49 = *v47;
    unint64_t v48 = v47[1];
    uint64_t v50 = v49 & 0xFFFFFFFFFFFFLL;
    if ((v48 & 0x2000000000000000) != 0) {
      uint64_t v51 = HIBYTE(v48) & 0xF;
    }
    else {
      uint64_t v51 = v50;
    }
    if (!v51)
    {
      uint64_t v71 = v0[69];
      sub_100019048(v0[49], (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      uint64_t v72 = v71 + 1;
      if (__OFADD__(v71, 1))
      {
        __break(1u);
        goto LABEL_122;
      }
      uint64_t v3 = v0[70];
LABEL_116:
      v2[70] = v3;
      v2[69] = v72;
      v146 = (void *)swift_task_alloc();
      v2[71] = v146;
      void *v146 = v2;
      v146[1] = sub_100016858;
      uint64_t v147 = v2[53];
      return MessageExtractor.next()(v147);
    }
    if ((*(unsigned char *)(v0[39] + 24) & 1) == 0) {
      goto LABEL_93;
    }
    if (*(void *)(v0[49] + *(int *)(v0[46] + 40) + 8))
    {
      uint64_t v52 = 0x6E65672D6F747561;
      if (sub_100036830() == 0x6E65672D6F747561 && v53 == 0xEE00646574617265)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v52 = sub_100036E10();
        swift_bridgeObjectRelease();
        if ((v52 & 1) == 0) {
          goto LABEL_42;
        }
      }
      int64_t v97 = v0[67];
      sub_100019048(v0[49], (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      int64_t v108 = v97 + 1;
      if (__OFADD__(v97, 1))
      {
        __break(1u);
LABEL_124:
        __break(1u);
        goto LABEL_125;
      }
      uint64_t v3 = v0[70];
      uint64_t v72 = v0[69];
      uint64_t v109 = v0[68];
      goto LABEL_114;
    }
LABEL_42:
    uint64_t v55 = v0[72];
    sub_100036360();
    if (v55)
    {
      if (qword_100044478 != -1) {
        swift_once();
      }
      uint64_t v56 = sub_1000365C0();
      sub_100007D00(v56, (uint64_t)qword_1000488A0);
      uint64_t v57 = sub_1000365A0();
      os_log_type_t v58 = sub_100036AA0();
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v59 = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, v58, "Error when filtering message sender.", v59, 2u);
        swift_slowDealloc();
      }
      swift_errorRelease();
    }
    else
    {
      uint64_t v110 = v0[45];
      uint64_t v111 = v0[43];
      uint64_t v112 = v0[44];
      v2[21] = sub_100036830();
      v2[22] = v113;
      sub_100014610();
      sub_1000190A8();
      char v114 = sub_100036750();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v110, v111);
      if (v114)
      {
        uint64_t v115 = v2[68];
        uint64_t result = sub_100019048(v2[49], (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
        uint64_t v109 = v115 + 1;
        if (!__OFADD__(v115, 1))
        {
          uint64_t v3 = v2[70];
          uint64_t v72 = v2[69];
LABEL_115:
          v2[68] = v109;
          goto LABEL_116;
        }
        goto LABEL_128;
      }
    }
LABEL_93:
    uint64_t v116 = v2[39];
    uint64_t v117 = *(void *)(v116 + 48);
    uint64_t v118 = *(void *)(v116 + 56);
    uint64_t v120 = *(void *)(v116 + 64);
    uint64_t v119 = *(void *)(v116 + 72);
    char v121 = *(unsigned char *)(v116 + 80);
    if (!v117) {
      goto LABEL_98;
    }
    if (v117 == 1) {
      goto LABEL_99;
    }
    if ((sub_1000180D4(v2[49], v117) & 1) == 0)
    {
      uint64_t v143 = v2[66];
      uint64_t result = sub_100019048(v2[49], (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      uint64_t v144 = v143 + 1;
      if (!__OFADD__(v143, 1))
      {
        uint64_t v3 = v2[70];
        uint64_t v72 = v2[69];
        uint64_t v109 = v2[68];
        int64_t v108 = v2[67];
LABEL_113:
        v2[66] = v144;
LABEL_114:
        v2[67] = v108;
        goto LABEL_115;
      }
      __break(1u);
    }
    else
    {
LABEL_98:
      if ((v120 & 1) != 0 || (v121 & 1) != 0 || sub_1000188D8(v2[49], v118, v119))
      {
LABEL_99:
        sub_10001453C(v2[49], v2[48], (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v3 = v2[70];
        if (isUniquelyReferenced_nonNull_native)
        {
LABEL_100:
          unint64_t v124 = *(void *)(v3 + 16);
          unint64_t v123 = *(void *)(v3 + 24);
          if (v124 >= v123 >> 1) {
            uint64_t v3 = sub_10000AC34(v123 > 1, v124 + 1, 1, v3);
          }
          uint64_t v126 = v2[55];
          uint64_t v125 = v2[56];
          uint64_t v128 = v2[47];
          uint64_t v127 = v2[48];
          uint64_t v130 = v2[40];
          uint64_t v129 = v2[41];
          *(void *)(v3 + 16) = v124 + 1;
          sub_100018FE4(v127, v3+ ((*(unsigned __int8 *)(v128 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v128 + 80))+ *(void *)(v128 + 72) * v124);
          sub_100007C40(v125, v126);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v129 + 48))(v126, 1, v130) == 1)
          {
            unint64_t v131 = v2 + 57;
            uint64_t v132 = v2[57];
            uint64_t v133 = v2[55];
            uint64_t v134 = v2[49];
            uint64_t v136 = v2[40];
            uint64_t v135 = v2[41];
            sub_100018F84(v2[56]);
            sub_100018F84(v133);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v135 + 16))(v132, v134, v136);
            sub_100019048(v134, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
          }
          else
          {
            uint64_t v137 = v2[41];
            (*(void (**)(void, void, void))(v137 + 32))(v2[42], v2[55], v2[40]);
            sub_100019104(&qword_1000448D8, (void (*)(uint64_t))&type metadata accessor for Date);
            unint64_t v131 = v2 + 54;
            if (sub_100036770()) {
              uint64_t v138 = v2[49];
            }
            else {
              uint64_t v138 = v2[42];
            }
            (*(void (**)(void, uint64_t, void))(v137 + 16))(v2[54], v138, v2[40]);
            uint64_t v139 = v2[56];
            uint64_t v140 = v2[49];
            (*(void (**)(void, void))(v2[41] + 8))(v2[42], v2[40]);
            sub_100019048(v140, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
            sub_100018F84(v139);
          }
          uint64_t v141 = *v131;
          uint64_t v142 = v2[56];
          ((void (*)(uint64_t, void, uint64_t, void))v2[63])(*v131, 0, 1, v2[40]);
          sub_1000116BC(v141, v142);
          uint64_t v72 = v2[69];
          goto LABEL_116;
        }
LABEL_122:
        uint64_t v3 = sub_10000AC34(0, *(void *)(v3 + 16) + 1, 1, v3);
        goto LABEL_100;
      }
      uint64_t v145 = v2[65];
      uint64_t result = sub_100019048(v2[49], (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      if (!__OFADD__(v145, 1))
      {
        uint64_t v3 = v2[70];
        uint64_t v72 = v2[69];
        uint64_t v109 = v2[68];
        int64_t v108 = v2[67];
        uint64_t v144 = v2[66];
        v2[65] = v145 + 1;
        goto LABEL_113;
      }
    }
    __break(1u);
LABEL_128:
    __break(1u);
    return result;
  }
  sub_100019048(v0[59], (uint64_t (*)(void))type metadata accessor for MessageExtractor);
  if (qword_100044478 != -1) {
    goto LABEL_120;
  }
  while (1)
  {
    uint64_t v5 = sub_1000365C0();
    sub_100007D00(v5, (uint64_t)qword_1000488A0);
    uint64_t v6 = sub_1000365A0();
    os_log_type_t v7 = sub_100036A80();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = v2[69];
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 134217984;
      v2[36] = v8;
      sub_100036B00();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Filtered %ld empty body messages.", v9, 0xCu);
      swift_slowDealloc();
    }
    uint64_t v10 = v2[39];

    if (*(unsigned char *)(v10 + 24))
    {
      uint64_t v11 = sub_1000365A0();
      os_log_type_t v12 = sub_100036A80();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = v2[67];
        char v14 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)char v14 = 134217984;
        v2[35] = v13;
        sub_100036B00();
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Filtered %ld auto-generated messages", v14, 0xCu);
        swift_slowDealloc();
      }

      uint64_t v15 = sub_1000365A0();
      os_log_type_t v16 = sub_100036A80();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = v2[68];
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 134217984;
        v2[34] = v17;
        sub_100036B00();
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Filtered %ld group or no-reply apple messages", v18, 0xCu);
        swift_slowDealloc();
      }
    }
    if ((uint64_t)v2[66] >= 1)
    {
      uint64_t v19 = sub_1000365A0();
      os_log_type_t v20 = sub_100036A80();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = v2[66];
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 134217984;
        v2[33] = v21;
        sub_100036B00();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Filtered %ld messages by week days.", v22, 0xCu);
        swift_slowDealloc();
      }
    }
    if ((uint64_t)v2[65] >= 1)
    {
      uint64_t v23 = sub_1000365A0();
      os_log_type_t v24 = sub_100036A80();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = v2[65];
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 134217984;
        v2[32] = v25;
        sub_100036B00();
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Filtered %ld messages by hours.", v26, 0xCu);
        swift_slowDealloc();
      }
    }
    v148 = v2 + 31;
    char v27 = *(unsigned char *)(v2[39] + 25);
    uint64_t v28 = swift_bridgeObjectRetain();
    if (v27) {
      break;
    }
    uint64_t v29 = groupAndSortMessages(_:)(v28);
    swift_bridgeObjectRelease();
    uint64_t v30 = *(void *)(v29 + 16);
    uint64_t v31 = v2;
    uint64_t v32 = v2[39];
    if (!v30)
    {
      uint64_t v2 = 0;
      unint64_t v35 = _swiftEmptyArrayStorage;
LABEL_58:
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v32 + 24))
      {
        uint64_t v73 = sub_1000365A0();
        os_log_type_t v74 = sub_100036A80();
        if (os_log_type_enabled(v73, v74))
        {
          unint64_t v75 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)unint64_t v75 = 134217984;
          void *v148 = v2;
          sub_100036B00();
          _os_log_impl((void *)&_mh_execute_header, v73, v74, "Filtered %ld conversations with a single message.", v75, 0xCu);
          swift_slowDealloc();
        }
      }
      uint64_t v2 = v31;
      int64_t v60 = v35[2];
      if (!v60) {
        goto LABEL_63;
      }
      goto LABEL_49;
    }
    uint64_t v2 = 0;
    char v33 = *(unsigned char *)(v32 + 24);
    uint64_t v34 = (void *)(v29 + 64);
    unint64_t v35 = _swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v38 = *(v34 - 2);
      uint64_t v37 = *(v34 - 1);
      uint64_t v39 = *v34;
      if ((v33 & 1) == 0 || *(void *)(v38 + 16) > 1uLL)
      {
        long long v149 = *((_OWORD *)v34 - 2);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v35 = sub_10000AED8(0, v35[2] + 1, 1, v35);
        }
        unint64_t v41 = v35[2];
        unint64_t v40 = v35[3];
        Swift::Int v42 = v35;
        long long v43 = v149;
        if (v41 >= v40 >> 1)
        {
          uint64_t v45 = sub_10000AED8((void *)(v40 > 1), v41 + 1, 1, v35);
          long long v43 = v149;
          Swift::Int v42 = v45;
        }
        v42[2] = v41 + 1;
        unint64_t v35 = v42;
        Swift::Int v44 = &v42[5 * v41];
        *((_OWORD *)v44 + 2) = v43;
        v44[6] = v38;
        v44[7] = v37;
        v44[8] = v39;
        goto LABEL_23;
      }
      BOOL v36 = __OFADD__(v2, 1);
      uint64_t v2 = (void *)((char *)v2 + 1);
      if (v36) {
        break;
      }
LABEL_23:
      v34 += 5;
      if (!--v30)
      {
        uint64_t v32 = v31[39];
        goto LABEL_58;
      }
    }
    __break(1u);
LABEL_120:
    swift_once();
  }
  unint64_t v35 = convertSingleMessagesToConversations(_:)(v28);
  swift_bridgeObjectRelease();
  int64_t v60 = v35[2];
  if (!v60)
  {
LABEL_63:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v61 = _swiftEmptyArrayStorage;
    goto LABEL_64;
  }
LABEL_49:
  v150 = v2;
  swift_bridgeObjectRetain();
  sub_100024628(0, v60, 0);
  char v61 = _swiftEmptyArrayStorage;
  unint64_t v62 = _swiftEmptyArrayStorage[2];
  uint64_t v63 = 24 * v62 + 32;
  char v64 = v35 + 8;
  do
  {
    uint64_t v65 = *(v64 - 4);
    uint64_t v66 = *(v64 - 1);
    uint64_t v67 = *v64;
    int64_t v68 = v62 + 1;
    unint64_t v69 = _swiftEmptyArrayStorage[3];
    swift_bridgeObjectRetain();
    if (v62 >= v69 >> 1) {
      sub_100024628(v69 > 1, v68, 1);
    }
    _swiftEmptyArrayStorage[2] = v68;
    unint64_t v70 = (void *)((char *)_swiftEmptyArrayStorage + v63);
    *unint64_t v70 = v65;
    v70[1] = v66;
    v70[2] = v67;
    v63 += 24;
    v64 += 5;
    ++v62;
    --v60;
  }
  while (v60);
  uint64_t v2 = v150;
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
LABEL_64:
  uint64_t v76 = v2[39];
  if (*(unsigned char *)(v76 + 40))
  {
    uint64_t v77 = v2[56];
    uint64_t v78 = v2[37];
    uint64_t v79 = (unsigned char *)v2[38];
    sub_100019048(v2[60], (uint64_t (*)(void))type metadata accessor for MessageExtractor);
    swift_release();
    uint64_t v80 = v77;
    uint64_t v81 = v78;
    goto LABEL_83;
  }
  int64_t v82 = *(void *)(v76 + 32);
  int64_t v83 = _swiftEmptyArrayStorage[2];
  swift_bridgeObjectRetain();
  uint64_t v84 = sub_1000365A0();
  if (v83 < v82)
  {
    os_log_type_t v85 = sub_100036AA0();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = v2 + 30;
      uint64_t v87 = v2 + 29;
      v88 = v2;
      uint64_t v89 = swift_slowAlloc();
      *(_DWORD *)uint64_t v89 = 134218240;
      swift_bridgeObjectRelease();
      *uint64_t v87 = v83;
      sub_100036B00();
      swift_bridgeObjectRelease();
      *(_WORD *)(v89 + 12) = 2048;
      *uint64_t v86 = v82;
      sub_100036B00();
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Extracted items %ld less than required sample size %ld.", (uint8_t *)v89, 0x16u);
      uint64_t v2 = v88;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_release();
    uint64_t v92 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v2[63];
    uint64_t v93 = v2[60];
    uint64_t v94 = v2[40];
    uint64_t v95 = v2[37];
    uint64_t v96 = (unsigned char *)v2[38];
    sub_100018F84(v2[56]);
    sub_100019048(v93, (uint64_t (*)(void))type metadata accessor for MessageExtractor);
    v92(v95, 1, 1, v94);
    char v61 = 0;
    *uint64_t v96 = 7;
    goto LABEL_84;
  }
  os_log_type_t v90 = sub_100036A80();
  if (os_log_type_enabled(v84, v90))
  {
    uint64_t v91 = swift_slowAlloc();
    *(_DWORD *)uint64_t v91 = 134218240;
    v2[27] = v83;
    sub_100036B00();
    swift_bridgeObjectRelease();
    *(_WORD *)(v91 + 12) = 2048;
    v2[28] = v82;
    sub_100036B00();
    _os_log_impl((void *)&_mh_execute_header, v84, v90, "Subsampling from %ld to %ld items.", (uint8_t *)v91, 0x16u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  sub_1000254A0();
  int64_t v97 = sub_1000237C8(v82, (uint64_t)_swiftEmptyArrayStorage);
  uint64_t v52 = v98;
  uint64_t v46 = v99;
  unint64_t v1 = v100;
  if ((v100 & 1) == 0)
  {
LABEL_75:
    char v61 = sub_100024FE8(v97, v52, v46, v1);
    swift_release();
    goto LABEL_82;
  }
  sub_100036E20();
  swift_unknownObjectRetain_n();
  v101 = (void *)swift_dynamicCastClass();
  if (!v101)
  {
    swift_unknownObjectRelease();
    v101 = _swiftEmptyArrayStorage;
  }
  uint64_t v102 = v101[2];
  swift_release();
  if (__OFSUB__(v1 >> 1, v46)) {
    goto LABEL_124;
  }
  if (v102 != (v1 >> 1) - v46)
  {
LABEL_125:
    swift_unknownObjectRelease();
    goto LABEL_75;
  }
  char v61 = (void *)swift_dynamicCastClass();
  swift_release();
  if (!v61)
  {
    swift_unknownObjectRelease();
    char v61 = _swiftEmptyArrayStorage;
  }
LABEL_82:
  uint64_t v103 = v2[60];
  uint64_t v104 = v2[56];
  uint64_t v105 = v2[37];
  uint64_t v79 = (unsigned char *)v2[38];
  swift_unknownObjectRelease();
  sub_100019048(v103, (uint64_t (*)(void))type metadata accessor for MessageExtractor);
  uint64_t v80 = v104;
  uint64_t v81 = v105;
LABEL_83:
  sub_1000116BC(v80, v81);
  *uint64_t v79 = 9;
LABEL_84:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v106 = (uint64_t (*)(void *))v2[1];
  return v106(v61);
}

uint64_t sub_100017B50()
{
  v0[23] = v0[72];
  v0[73] = sub_100006780(&qword_100044890);
  swift_willThrowTypedImpl();
  return _swift_task_switch(sub_100017BE0, 0, 0);
}

uint64_t sub_100017BE0()
{
  uint64_t v1 = v0[72];
  sub_100019048(v0[59], (uint64_t (*)(void))type metadata accessor for MessageExtractor);
  v0[24] = v1;
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1000365C0();
    sub_100007D00(v2, (uint64_t)qword_1000488A0);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000365A0();
    os_log_type_t v4 = sub_100036A80();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v6 = v0[70];
    if (v5)
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 134217984;
      uint64_t v8 = *(void *)(v6 + 16);
      swift_bridgeObjectRelease();
      v0[26] = v8;
      sub_100036B00();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Task cancelled at extraction loop. Extracted %ld messages.", v7, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_release();
    char v14 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[63];
    uint64_t v15 = v0[60];
    uint64_t v17 = v0[51];
    uint64_t v16 = v0[52];
    uint64_t v18 = v0[50];
    uint64_t v19 = v0[40];
    uint64_t v20 = v0[37];
    uint64_t v21 = (unsigned char *)v0[38];
    sub_100018F84(v0[56]);
    sub_100019048(v15, (uint64_t (*)(void))type metadata accessor for MessageExtractor);
    v14(v20, 1, 1, v19);
    *uint64_t v21 = 5;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_errorRelease();
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1000365C0();
    sub_100007D00(v9, (uint64_t)qword_1000488A0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = sub_1000365A0();
    os_log_type_t v11 = sub_100036AA0();
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v12 = 138412290;
      swift_errorRetain();
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      v0[25] = v13;
      sub_100036B00();
      *uint64_t v30 = v13;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error at extraction loop: %@.", v12, 0xCu);
      sub_100006780(&qword_100044740);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v22 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[63];
    uint64_t v23 = v0[60];
    uint64_t v24 = v0[56];
    uint64_t v25 = v0[40];
    uint64_t v26 = v0[37];
    char v27 = (unsigned char *)v0[38];
    swift_errorRelease();
    swift_release();
    sub_100018F84(v24);
    sub_100019048(v23, (uint64_t (*)(void))type metadata accessor for MessageExtractor);
    v22(v26, 1, 1, v25);
    *char v27 = 5;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = (uint64_t (*)(void))v0[1];
  return v28(0);
}

uint64_t sub_1000180D4(uint64_t a1, uint64_t a2)
{
  uint64_t v71 = a2;
  uint64_t v72 = a1;
  uint64_t v2 = type metadata accessor for ExtractedMessage();
  __chkstk_darwin(v2 - 8);
  unint64_t v70 = (char *)v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100036310();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100036280();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_1000362F0();
  uint64_t v12 = *(void *)(v73 - 8);
  uint64_t v13 = __chkstk_darwin(v73);
  unint64_t v69 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v61 - v15;
  sub_1000362B0();
  id v17 = [objc_allocWithZone((Class)NSDateFormatter) init];
  sub_100036260();
  Class isa = sub_100036270().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  [v17 setLocale:isa];

  sub_1000362C0();
  Class v19 = sub_100036300().super.isa;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v66 = v7;
  uint64_t v67 = v5 + 8;
  uint64_t v21 = v72;
  uint64_t v68 = v4;
  uint64_t v65 = v20;
  v20(v7, v4);
  [v17 setTimeZone:v19];

  NSString v22 = sub_100036790();
  [v17 setDateFormat:v22];

  Class v23 = sub_100036210().super.isa;
  id v24 = [v17 stringFromDate:v23];

  uint64_t v25 = sub_1000367C0();
  char v27 = v26;

  char v28 = sub_1000049A4(v25, v27);
  if (v28 == 7)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v73);

    char v29 = 0;
  }
  else
  {
    char v30 = v28;
    id v64 = v17;
    uint64_t v31 = (uint64_t)v16;
    uint64_t v32 = v12;
    uint64_t v33 = v73;
    char v29 = sub_100015D8C(v28, v71);
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1000365C0();
    sub_100007D00(v34, (uint64_t)qword_1000488A0);
    uint64_t v35 = (uint64_t)v70;
    sub_10001453C(v21, (uint64_t)v70, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
    BOOL v36 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v69, v31, v33);
    swift_bridgeObjectRetain_n();
    uint64_t v37 = sub_1000365A0();
    os_log_type_t v38 = sub_100036A90();
    int v39 = v38;
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v40 = swift_slowAlloc();
      int v63 = v39;
      uint64_t v41 = v40;
      uint64_t v72 = swift_slowAlloc();
      uint64_t v75 = v72;
      *(_DWORD *)uint64_t v41 = 136316162;
      v61[0] = v41 + 4;
      sub_100036250();
      sub_100019104(&qword_100044928, (void (*)(uint64_t))&type metadata accessor for Date);
      os_log_t v62 = v37;
      uint64_t v42 = sub_100036DF0();
      uint64_t v74 = sub_10000B1D4(v42, v43, &v75);
      v61[1] = &v75;
      sub_100036B00();
      swift_bridgeObjectRelease();
      sub_100019048(v35, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      *(_WORD *)(v41 + 12) = 2080;
      v61[0] = v41 + 14;
      Swift::Int v44 = v66;
      sub_1000362C0();
      sub_100019104(&qword_100044930, (void (*)(uint64_t))&type metadata accessor for TimeZone);
      unint64_t v70 = (char *)v31;
      uint64_t v45 = v32;
      uint64_t v46 = v68;
      uint64_t v47 = sub_100036DF0();
      char v48 = v29;
      uint64_t v49 = v33;
      unint64_t v51 = v50;
      v65(v44, v46);
      uint64_t v74 = sub_10000B1D4(v47, v51, &v75);
      sub_100036B00();
      swift_bridgeObjectRelease();
      uint64_t v52 = *(void (**)(char *, uint64_t))(v45 + 8);
      uint64_t v53 = v49;
      uint64_t v54 = v49;
      char v29 = v48;
      v52(v36, v53);
      *(_WORD *)(v41 + 22) = 2080;
      uint64_t v74 = sub_10000B1D4(qword_100038470[v30], 0xE300000000000000, &v75);
      sub_100036B00();
      *(_WORD *)(v41 + 32) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v55 = sub_100036970();
      unint64_t v57 = v56;
      swift_bridgeObjectRelease();
      uint64_t v74 = sub_10000B1D4(v55, v57, &v75);
      sub_100036B00();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 42) = 1024;
      LODWORD(v74) = v48 & 1;
      sub_100036B00();
      os_log_t v58 = v62;
      _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v63, "WeekDays filter | message date: %s, timezone: %s, local week day: %s, week days: %s, is in: %{BOOL}d", (uint8_t *)v41, 0x30u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v52(v70, v54);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v59 = *(void (**)(char *, uint64_t))(v32 + 8);
      v59(v36, v33);
      sub_100019048(v35, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
      v59((char *)v31, v33);
    }
  }
  return v29 & 1;
}

BOOL sub_1000188D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v56 = a2;
  uint64_t v57 = a3;
  uint64_t v4 = sub_100036310();
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v54 = v4;
  __chkstk_darwin(v4);
  uint64_t v52 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ExtractedMessage();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000362D0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000362F0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  id v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  Class v19 = (char *)&v46 - v18;
  sub_1000362B0();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Calendar.Component.hour(_:), v9);
  uint64_t v20 = a1;
  uint64_t v21 = sub_1000362E0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v51 = v21;
  BOOL v23 = v21 >= v56 && v21 <= v57;
  BOOL v55 = v23;
  if (qword_100044478 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1000365C0();
  sub_100007D00(v24, (uint64_t)qword_1000488A0);
  sub_10001453C(v20, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  uint64_t v25 = sub_1000365A0();
  os_log_type_t v26 = sub_100036A90();
  int v27 = v26;
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v46 = v13;
    int v49 = v27;
    uint64_t v29 = v28;
    uint64_t v50 = swift_slowAlloc();
    uint64_t v59 = v50;
    *(_DWORD *)uint64_t v29 = 136316418;
    sub_100036250();
    sub_100019104(&qword_100044928, (void (*)(uint64_t))&type metadata accessor for Date);
    os_log_t v48 = v25;
    uint64_t v30 = sub_100036DF0();
    uint64_t v58 = sub_10000B1D4(v30, v31, &v59);
    sub_100036B00();
    swift_bridgeObjectRelease();
    sub_100019048((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
    *(_WORD *)(v29 + 12) = 2080;
    uint64_t v47 = v19;
    uint64_t v32 = v52;
    uint64_t v33 = v17;
    sub_1000362C0();
    sub_100019104(&qword_100044930, (void (*)(uint64_t))&type metadata accessor for TimeZone);
    uint64_t v34 = v54;
    uint64_t v35 = sub_100036DF0();
    unint64_t v37 = v36;
    BOOL v38 = v55;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v32, v34);
    uint64_t v58 = sub_10000B1D4(v35, v37, &v59);
    sub_100036B00();
    swift_bridgeObjectRelease();
    int v39 = *(void (**)(char *, uint64_t))(v14 + 8);
    uint64_t v40 = v33;
    uint64_t v41 = v46;
    v39(v40, v46);
    *(_WORD *)(v29 + 22) = 2048;
    uint64_t v58 = v51;
    sub_100036B00();
    *(_WORD *)(v29 + 32) = 2048;
    uint64_t v58 = v56;
    sub_100036B00();
    *(_WORD *)(v29 + 42) = 2048;
    uint64_t v58 = v57;
    sub_100036B00();
    *(_WORD *)(v29 + 52) = 1024;
    LODWORD(v58) = v38;
    sub_100036B00();
    os_log_t v42 = v48;
    _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v49, "BetweenHours filter | message date: %s, timezone: %s, local hour: %ld,  start hour: %ld, end hour: %ld, is in: %{BOOL}d", (uint8_t *)v29, 0x3Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v43 = v47;
    uint64_t v44 = v41;
  }
  else
  {

    int v39 = *(void (**)(char *, uint64_t))(v14 + 8);
    v39(v17, v13);
    sub_100019048((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
    unint64_t v43 = v19;
    uint64_t v44 = v13;
  }
  v39(v43, v44);
  return v55;
}

uint64_t type metadata accessor for EmailExtractor()
{
  uint64_t result = qword_100044990;
  if (!qword_100044990) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100018F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100018F7C()
{
  return swift_release();
}

uint64_t sub_100018F84(uint64_t a1)
{
  uint64_t v2 = sub_100006780(&qword_100044658);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100018FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExtractedMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100019048(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000190A8()
{
  unint64_t result = qword_100044798;
  if (!qword_100044798)
  {
    sub_100006458(&qword_100044788);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044798);
  }
  return result;
}

uint64_t sub_100019104(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001914C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    *(_WORD *)(a1 + 25) = *(_WORD *)((char *)a2 + 25);
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v7 = a2[6];
    if (v7 == 1)
    {
      long long v8 = *((_OWORD *)a2 + 4);
      *(_OWORD *)(v4 + 48) = *((_OWORD *)a2 + 3);
      *(_OWORD *)(v4 + 64) = v8;
      *(unsigned char *)(v4 + 80) = *((unsigned char *)a2 + 80);
    }
    else
    {
      uint64_t v10 = a2[7];
      *(void *)(v4 + 48) = v7;
      *(void *)(v4 + 56) = v10;
      *(unsigned char *)(v4 + 64) = *((unsigned char *)a2 + 64);
      *(void *)(v4 + 72) = a2[9];
      *(unsigned char *)(v4 + 80) = *((unsigned char *)a2 + 80);
      swift_bridgeObjectRetain();
    }
    uint64_t v11 = a2[12];
    *(void *)(v4 + 88) = a2[11];
    *(void *)(v4 + 96) = v11;
    *(unsigned char *)(v4 + 104) = *((unsigned char *)a2 + 104);
    uint64_t v12 = a2[14];
    uint64_t v13 = a2[15];
    uint64_t v14 = *(int *)(a3 + 20);
    uint64_t v15 = (void *)(v4 + v14);
    uint64_t v16 = (char *)a2 + v14;
    *(void *)(v4 + 112) = v12;
    *(void *)(v4 + 120) = v13;
    uint64_t v17 = sub_100036250();
    uint64_t v18 = *(void *)(v17 - 8);
    Class v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v19(v16, 1, v17))
    {
      uint64_t v20 = sub_100006780(&qword_100044658);
      memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t sub_100019364(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48) != 1) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100036250();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_10001944C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 48);
  if (v6 == 1)
  {
    long long v7 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v7;
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v6;
    *(void *)(a1 + 56) = v8;
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    swift_bridgeObjectRetain();
  }
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v10 = *(void *)(a2 + 112);
  uint64_t v11 = *(void *)(a2 + 120);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  *(void *)(a1 + 112) = v10;
  *(void *)(a1 + 120) = v11;
  uint64_t v15 = sub_100036250();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17(v14, 1, v15))
  {
    uint64_t v18 = sub_100006780(&qword_100044658);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

uint64_t sub_100019614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(unsigned char *)(a1 + 26) = *(unsigned char *)(a2 + 26);
  uint64_t v6 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = a1 + 48;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v10 = (long long *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 48);
  if (v8 == 1)
  {
    if (v9 == 1)
    {
      long long v11 = *v10;
      long long v12 = *(_OWORD *)(a2 + 64);
      *(unsigned char *)(v7 + 32) = *(unsigned char *)(a2 + 80);
      *(_OWORD *)uint64_t v7 = v11;
      *(_OWORD *)(v7 + 16) = v12;
    }
    else
    {
      *(void *)(a1 + 48) = v9;
      uint64_t v15 = *(void *)(a2 + 56);
      *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
      *(void *)(a1 + 56) = v15;
      uint64_t v16 = *(void *)(a2 + 72);
      *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
      *(void *)(a1 + 72) = v16;
      swift_bridgeObjectRetain();
    }
  }
  else if (v9 == 1)
  {
    sub_1000061DC(v7);
    char v13 = *((unsigned char *)v10 + 32);
    long long v14 = v10[1];
    *(_OWORD *)uint64_t v7 = *v10;
    *(_OWORD *)(v7 + 16) = v14;
    *(unsigned char *)(v7 + 32) = v13;
  }
  else
  {
    *(void *)(a1 + 48) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void *)(a2 + 56);
    *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
    *(void *)(a1 + 56) = v17;
    uint64_t v18 = *(void *)(a2 + 72);
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    *(void *)(a1 + 72) = v18;
  }
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = *(int *)(a3 + 20);
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = sub_100036250();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v23 + 24))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_13;
  }
  if (v26)
  {
LABEL_13:
    uint64_t v27 = sub_100006780(&qword_100044658);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

_OWORD *sub_1000198C8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  long long v5 = a2[7];
  a1[6] = a2[6];
  a1[7] = v5;
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v11 = sub_100036250();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100006780(&qword_100044658);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t sub_1000199F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = a1 + 48;
  uint64_t v8 = a2 + 48;
  uint64_t v7 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48) == 1) {
    goto LABEL_4;
  }
  if (v7 == 1)
  {
    sub_1000061DC(v6);
LABEL_4:
    long long v9 = *(_OWORD *)(v8 + 16);
    *(_OWORD *)uint64_t v6 = *(_OWORD *)v8;
    *(_OWORD *)(v6 + 16) = v9;
    *(unsigned char *)(v6 + 32) = *(unsigned char *)(v8 + 32);
    goto LABEL_6;
  }
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
LABEL_6:
  uint64_t v10 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  long long v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_100036250();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_11;
  }
  if (v19)
  {
LABEL_11:
    uint64_t v20 = sub_100006780(&qword_100044658);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_100019C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019C3C);
}

uint64_t sub_100019C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 96);
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
    uint64_t v9 = sub_100006780(&qword_100044658);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_100019CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019D10);
}

uint64_t sub_100019D10(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 96) = a2;
  }
  else
  {
    uint64_t v7 = sub_100006780(&qword_100044658);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100019DBC()
{
  sub_100015570();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

id sub_100019E54()
{
  uint64_t v3 = *v0;
  uint64_t v2 = v0[1];
  id v4 = objc_allocWithZone((Class)NSRegularExpression);
  swift_bridgeObjectRetain();
  id result = sub_10001D250(v3, v2, 0);
  if (v1)
  {
    swift_errorRelease();
    return 0;
  }
  return result;
}

uint64_t sub_100019EC4@<X0>(uint64_t *a1@<X8>)
{
  a1[3] = sub_100006780(&qword_100044788);
  a1[4] = sub_100014664((unint64_t *)&qword_100044798, &qword_100044788);
  sub_10001DA8C(a1);
  swift_bridgeObjectRetain();
  uint64_t result = sub_100036360();
  if (v1) {
    return sub_10001DAF0((uint64_t)a1);
  }
  return result;
}

uint64_t sub_100019F74()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id sub_100019FA4()
{
  uint64_t v1 = sub_100036810();
  __chkstk_darwin(v1 - 8);
  sub_1000367F0();
  uint64_t v2 = sub_1000367E0();
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  id v6 = objc_allocWithZone((Class)NSRegularExpression);
  id result = sub_10001D250(v4, v5, 0);
  if (v0)
  {
    swift_errorRelease();
    return 0;
  }
  return result;
}

uint64_t sub_10001A088@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100036810();
  __chkstk_darwin(v3 - 8);
  sub_1000367F0();
  uint64_t result = sub_1000367E0();
  if (v5)
  {
    *(void *)(a1 + 24) = sub_100006780(&qword_100044788);
    *(void *)(a1 + 32) = sub_100014664((unint64_t *)&qword_100044798, &qword_100044788);
    sub_10001DA8C((uint64_t *)a1);
    uint64_t result = sub_100036360();
    if (v1) {
      return sub_10001DAF0(a1);
    }
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10001A1A8()
{
  uint64_t v0 = sub_100036810();
  __chkstk_darwin(v0 - 8);
  sub_1000367F0();
  return sub_1000367E0();
}

double NSRegularExpression.attribute(for:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_100036660();
  __chkstk_darwin(v7 - 8);
  if (a1 == 0x6C6C61646E6966 && a2 == 0xE700000000000000 || (sub_100036E10() & 1) != 0)
  {
    sub_100036650();
    *(void *)(swift_allocObject() + 16) = v3;
    id v8 = v3;
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v9 = sub_100036640();
    swift_allocObject();
  }
  else
  {
    if ((a1 != 0x686372616573 || a2 != 0xE600000000000000) && (sub_100036E10() & 1) == 0)
    {
      double result = 0.0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      return result;
    }
    sub_100006780(&qword_1000449C8);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1000384B0;
    *(void *)(v12 + 56) = &type metadata for Int;
    *(void *)(v12 + 32) = 0;
    *(_OWORD *)(v12 + 64) = 0u;
    *(_OWORD *)(v12 + 80) = 0u;
    sub_100036650();
    *(void *)(swift_allocObject() + 16) = v3;
    id v13 = v3;
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v9 = sub_100036640();
    swift_allocObject();
  }
  uint64_t v10 = sub_100036630();
  *(void *)(a3 + 24) = v9;
  *(void *)a3 = v10;
  return result;
}

uint64_t sub_10001A50C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v6 = sub_10001172C(0x676E69727473, 0xE600000000000000), (v7 & 1) != 0)
    && (sub_10000C7B4(*(void *)(a1 + 56) + 32 * v6, (uint64_t)v21), (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v8 = HIBYTE(v20) & 0xF;
    if ((v20 & 0x2000000000000000) == 0) {
      uint64_t v8 = v19;
    }
    uint64_t v9 = 7;
    if (((v20 >> 60) & ((v19 & 0x800000000000000) == 0)) != 0) {
      uint64_t v9 = 11;
    }
    v21[0] = 15;
    v21[1] = v9 | (v8 << 16);
    swift_bridgeObjectRetain();
    sub_100006780(&qword_100044AF0);
    sub_100014664(&qword_100044AF8, &qword_100044AF0);
    sub_10001DB44();
    uint64_t v10 = sub_100036AB0();
    uint64_t v12 = v11;
    NSString v13 = sub_100036790();
    id v14 = objc_msgSend(a2, "matchesInString:options:range:", v13, 0, v10, v12);

    sub_10000C980(0, (unint64_t *)&qword_100044AE8);
    unint64_t v15 = sub_100036960();

    swift_bridgeObjectRetain();
    uint64_t v16 = sub_10001D688(v15, v19, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t result = sub_100006780(&qword_100044778);
    a3[3] = result;
    *a3 = v16;
  }
  else
  {
    sub_10001DA38();
    swift_allocError();
    *int v18 = 10;
    return swift_willThrow();
  }
  return result;
}

void *sub_10001A750@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (!*(void *)(a1 + 16)) {
    goto LABEL_12;
  }
  unint64_t v6 = sub_10001172C(0x676E69727473, 0xE600000000000000);
  if ((v7 & 1) == 0) {
    goto LABEL_12;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v6, (uint64_t)v21);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_12;
  }
  if (!*(void *)(a1 + 16)
    || (unint64_t v8 = sub_10001172C(7565168, 0xE300000000000000), (v9 & 1) == 0)
    || (sub_10000C7B4(*(void *)(a1 + 56) + 32 * v8, (uint64_t)v21), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_10001DA38();
    swift_allocError();
    *NSString v13 = 17;
    return (void *)swift_willThrow();
  }
  if (*(void *)(a1 + 16)
    && (unint64_t v10 = sub_10001172C(0x736F70646E65, 0xE600000000000000), (v11 & 1) != 0)
    && (sub_10000C7B4(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v21), swift_dynamicCast()))
  {
    uint64_t v12 = v19;
  }
  else
  {
    uint64_t v12 = sub_100036880();
  }
  if (v19 < 0 || (uint64_t v15 = v12 - v19, v12 <= v19) || sub_100036880() < v12)
  {
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    NSString v16 = sub_100036790();
    id v17 = objc_msgSend(a2, "firstMatchInString:options:range:", v16, 0, v19, v15);

    if (v17)
    {
      uint64_t v18 = type metadata accessor for RegexMatch();
      uint64_t result = (void *)swift_allocObject();
      result[2] = v17;
      result[3] = v19;
      result[4] = v20;
      *(void *)(a3 + 24) = v18;
      *(void *)a3 = result;
    }
    else
    {
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      return (void *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

Swift::Bool __swiftcall NSRegularExpression.has(attribute:)(Swift::String attribute)
{
  uint64_t object = (uint64_t)attribute._object;
  uint64_t countAndFlagsBits = attribute._countAndFlagsBits;
  Swift::Int v3 = sub_10001D844((uint64_t)&off_1000416B8);
  swift_arrayDestroy();
  LOBYTE(object) = sub_10001AA18(countAndFlagsBits, object, v3);
  swift_bridgeObjectRelease();
  return object & 1;
}

uint64_t sub_10001AA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_100036EB0();
    sub_100036870();
    Swift::Int v6 = sub_100036ED0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      char v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_100036E10() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          NSString v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_100036E10() & 1) != 0) {
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

uint64_t sub_10001AB50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_100036EB0();
    sub_100036730();
    Swift::Int v6 = sub_100036ED0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      char v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_100036E10() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          NSString v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_100036E10() & 1) != 0) {
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

uint64_t sub_10001AC88@<X0>(uint64_t *a1@<X8>)
{
  id v4 = [*v1 pattern];
  sub_1000367C0();

  a1[3] = sub_100006780(&qword_100044788);
  a1[4] = sub_100014664((unint64_t *)&qword_100044798, &qword_100044788);
  sub_10001DA8C(a1);
  uint64_t result = sub_100036360();
  if (v2) {
    return sub_10001DAF0((uint64_t)a1);
  }
  return result;
}

void *sub_10001AD54()
{
  uint64_t v1 = *v0;
  id v2 = v1;
  return v1;
}

double sub_10001AD84@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return NSRegularExpression.attribute(for:)(a1, a2, a3);
}

uint64_t sub_10001ADA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001B1F8(a1, a2, a3, a4, (uint64_t)&off_1000416B8);
}

uint64_t sub_10001ADBC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  a2[3] = a1;
  a2[4] = swift_getWitnessTable();
  uint64_t v5 = sub_10001DA8C(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(v5, v2, a1);
}

uint64_t sub_10001AE4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001ADBC(a1, a2);
}

double sub_10001AE64@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100036660();
  __chkstk_darwin(v6 - 8);
  if (a1 == 0x70756F7267 && a2 == 0xE500000000000000 || (sub_100036E10() & 1) != 0)
  {
    sub_100036650();
    swift_retain();
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v7 = sub_100036640();
    swift_allocObject();
    uint64_t v8 = sub_100036630();
    *(void *)(a3 + 24) = v7;
    *(void *)a3 = v8;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10001AFE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v6 = sub_10001172C(7890025, 0xE300000000000000), (v7 & 1) != 0)
    && (sub_10000C7B4(*(void *)(a1 + 56) + 32 * v6, (uint64_t)v15), (swift_dynamicCast() & 1) != 0)
    && ([*(id *)(a2 + 16) rangeAtIndex:v15[5]],
        swift_bridgeObjectRetain(),
        sub_100036A60(),
        char v9 = v8,
        swift_bridgeObjectRelease(),
        (v9 & 1) == 0))
  {
    swift_bridgeObjectRetain();
    sub_100036910();
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_100036850();
    uint64_t v12 = v11;
    uint64_t result = swift_bridgeObjectRelease();
    a3[3] = (uint64_t)&type metadata for String;
    *a3 = v10;
    a3[1] = v12;
  }
  else
  {
    sub_10001DA38();
    swift_allocError();
    *uint64_t v14 = 11;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_10001B180()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 40, 7);
}

double sub_10001B1C0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10001AE64(a1, a2, a3);
}

uint64_t sub_10001B1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001B1F8(a1, a2, a3, a4, (uint64_t)&off_100041728);
}

uint64_t sub_10001B1F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  Swift::Int v7 = sub_10001D844(a5);
  swift_arrayDestroy();
  char v8 = sub_10001AA18(a1, a2, v7);
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t static MorpheusPEExtension.registerCleanups()()
{
  uint64_t v1 = sub_100036660();
  __chkstk_darwin(v1 - 8);
  sub_100036610();
  sub_100036650();
  sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
  sub_100036640();
  swift_allocObject();
  sub_100036630();
  sub_1000365E0();
  uint64_t result = swift_release();
  if (!v0)
  {
    sub_100036650();
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    swift_allocObject();
    sub_100036630();
    sub_1000365E0();
    swift_release();
    sub_100036650();
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    swift_allocObject();
    sub_100036630();
    sub_1000365E0();
    swift_release();
    sub_100036650();
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    swift_allocObject();
    sub_100036630();
    sub_1000365E0();
    return swift_release();
  }
  return result;
}

unint64_t sub_10001B654@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001B6D8(a1, (uint64_t (*)())sub_10001EF74, a2);
}

unint64_t sub_10001B680@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001B6D8(a1, sub_10001F2F0, a2);
}

unint64_t sub_10001B6AC@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001B6D8(a1, (uint64_t (*)())sub_10001F4A8, a2);
}

unint64_t sub_10001B6D8@<X0>(unint64_t result@<X0>, uint64_t (*a2)()@<X1>, uint64_t *a3@<X8>)
{
  if (*(void *)(result + 16)
    && (v5 = result, uint64_t result = sub_10001172C(1954047348, 0xE400000000000000), (v6 & 1) != 0)
    && (sub_10000C7B4(*(void *)(v5 + 56) + 32 * result, (uint64_t)v10), uint64_t result = swift_dynamicCast(), (result & 1) != 0))
  {
    uint64_t v7 = a2();
    unint64_t v9 = v8;
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0xE000000000000000;
  }
  a3[3] = (uint64_t)&type metadata for String;
  *a3 = v7;
  a3[1] = v9;
  return result;
}

unint64_t sub_10001B7B0@<X0>(unint64_t result@<X0>, unint64_t *a2@<X8>)
{
  if (*(void *)(result + 16)
    && (v3 = result, uint64_t result = sub_10001172C(1954047348, 0xE400000000000000), (v4 & 1) != 0)
    && (sub_10000C7B4(*(void *)(v3 + 56) + 32 * result, (uint64_t)v12), uint64_t result = swift_dynamicCast(), (result & 1) != 0))
  {
    unint64_t v6 = v10;
    unint64_t v5 = v11;
    v12[0] = v10;
    v12[1] = v11;
    sub_10001DB44();
    uint64_t result = sub_100036B40();
    a2[3] = (unint64_t)&type metadata for String;
    if (v7)
    {
      unint64_t v8 = result;
      unint64_t v9 = v7;
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v6 = v8;
      unint64_t v5 = v9;
    }
  }
  else
  {
    unint64_t v6 = 0;
    a2[3] = (unint64_t)&type metadata for String;
    unint64_t v5 = 0xE000000000000000;
  }
  *a2 = v6;
  a2[1] = v5;
  return result;
}

uint64_t static MorpheusPEExtension.registerRegex()()
{
  uint64_t v1 = sub_100036660();
  __chkstk_darwin(v1 - 8);
  sub_100036610();
  sub_100036650();
  sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
  sub_100036640();
  swift_allocObject();
  sub_100036630();
  sub_1000365E0();
  uint64_t result = swift_release();
  if (!v0)
  {
    sub_100036650();
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    swift_allocObject();
    sub_100036630();
    sub_1000365E0();
    swift_release();
    sub_100036650();
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    swift_allocObject();
    sub_100036630();
    sub_1000365E0();
    swift_release();
    sub_100036650();
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    swift_allocObject();
    sub_100036630();
    sub_1000365E0();
    swift_release();
    sub_100036650();
    sub_10001D380((uint64_t)_swiftEmptyArrayStorage);
    swift_allocObject();
    sub_100036630();
    sub_1000365E0();
    return swift_release();
  }
  return result;
}

uint64_t sub_10001BD4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!*(void *)(a1 + 16)) {
    goto LABEL_23;
  }
  unint64_t v5 = sub_10001172C(0x676E69727473, 0xE600000000000000);
  if ((v6 & 1) == 0) {
    goto LABEL_23;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v5, (uint64_t)v62);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_23;
  }
  unint64_t v7 = *((void *)&v59 + 1);
  unint64_t v8 = v59;
  if (*(void *)(a1 + 16) && (unint64_t v9 = sub_10001172C(0x6E726574746170, 0xE700000000000000), (v10 & 1) != 0))
  {
    sub_10000C7B4(*(void *)(a1 + 56) + 32 * v9, (uint64_t)&v56);
    sub_100006780(&qword_100044B20);
    if (swift_dynamicCast())
    {
      if (*((void *)&v60 + 1))
      {
        unint64_t v65 = v8;
        sub_100007D38(&v59, (uint64_t)v62);
        uint64_t v11 = v63;
        uint64_t v12 = v64;
        sub_1000067C4(v62, v63);
        (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v12 + 8))(&v56, v11, v12);
        if (v2)
        {
          swift_bridgeObjectRelease();
          return sub_10000685C((uint64_t)v62);
        }
        if (!v57)
        {
          sub_100015804((uint64_t)&v56, &qword_100044B28);
LABEL_39:
          sub_10000685C((uint64_t)v62);
          unint64_t v8 = v65;
          goto LABEL_13;
        }
        sub_100007D38(&v56, (uint64_t)&v59);
        if (*(void *)(a1 + 16) && (unint64_t v22 = sub_10001172C(1819305330, 0xE400000000000000), (v23 & 1) != 0))
        {
          sub_10000C7B4(*(void *)(a1 + 56) + 32 * v22, (uint64_t)v52);
          sub_100006780(&qword_100044B38);
          if (swift_dynamicCast())
          {
            unint64_t v8 = v65;
            if (*((void *)&v54 + 1))
            {
              sub_100007D38(&v53, (uint64_t)&v56);
              uint64_t v24 = v57;
              uint64_t v25 = v58;
              sub_1000067C4(&v56, v57);
              (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v25);
              if (v26)
              {
                sub_1000067C4(&v59, *((uint64_t *)&v60 + 1));
                v52[0] = v65;
                v52[1] = v7;
                sub_10001DBEC();
                sub_10001DB98();
                sub_100036A50();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                long long v27 = v53;
                *(void *)(a2 + 24) = &type metadata for String;
                *(_OWORD *)a2 = v27;
                sub_10000685C((uint64_t)&v56);
                sub_10000685C((uint64_t)&v59);
                return sub_10000685C((uint64_t)v62);
              }
              sub_10000685C((uint64_t)&v56);
              sub_10000685C((uint64_t)&v59);
              goto LABEL_39;
            }
            goto LABEL_37;
          }
          uint64_t v55 = 0;
          long long v53 = 0u;
          long long v54 = 0u;
        }
        else
        {
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v55 = 0;
        }
        unint64_t v8 = v65;
LABEL_37:
        sub_100015804((uint64_t)&v53, &qword_100044B30);
        sub_10000685C((uint64_t)&v59);
        sub_10000685C((uint64_t)v62);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v61 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
    }
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v61 = 0;
  }
  sub_100015804((uint64_t)&v59, &qword_100044B08);
LABEL_13:
  if (!*(void *)(a1 + 16)
    || (unint64_t v14 = sub_10001172C(1819305330, 0xE400000000000000), (v15 & 1) == 0)
    || (sub_10000C7B4(*(void *)(a1 + 56) + 32 * v14, (uint64_t)v62), sub_100036640(), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if (!*(void *)(a1 + 16) || (unint64_t v16 = sub_10001172C(0x6E726574746170, 0xE700000000000000), (v17 & 1) == 0))
  {
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v61 = 0;
    goto LABEL_26;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v56);
  sub_100006780(&qword_100044AC8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v61 = 0;
    long long v59 = 0u;
    long long v60 = 0u;
    goto LABEL_26;
  }
  if (!*((void *)&v60 + 1))
  {
LABEL_26:
    swift_bridgeObjectRelease();
    swift_release();
    sub_100015804((uint64_t)&v59, &qword_100044AC0);
    goto LABEL_23;
  }
  sub_100007D38(&v59, (uint64_t)v62);
  uint64_t v18 = v63;
  uint64_t v19 = v64;
  sub_1000067C4(v62, v63);
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return sub_10000685C((uint64_t)v62);
  }
  if (v20)
  {
    uint64_t v28 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v28 = v8;
    }
    uint64_t v29 = 7;
    if (((v7 >> 60) & ((v8 & 0x800000000000000) == 0)) != 0) {
      uint64_t v29 = 11;
    }
    *(void *)&long long v59 = 15;
    *((void *)&v59 + 1) = v29 | (v28 << 16);
    *(void *)&long long v56 = v8;
    *((void *)&v56 + 1) = v7;
    uint64_t v30 = (void *)v20;
    swift_bridgeObjectRetain();
    sub_100006780(&qword_100044AF0);
    sub_100014664(&qword_100044AF8, &qword_100044AF0);
    sub_10001DB44();
    uint64_t v31 = sub_100036AB0();
    uint64_t v33 = v32;
    NSString v34 = sub_100036790();
    unint64_t v65 = v8;
    id v35 = objc_msgSend(v30, "matchesInString:options:range:", v34, 0, v31, v33);

    NSString v36 = sub_100036790();
    id v37 = objc_msgSend(v30, "matchesInString:options:range:", v36, 0, v31, v33);

    sub_10000C980(0, (unint64_t *)&qword_100044AE8);
    unint64_t v38 = sub_100036960();

    *(void *)&long long v56 = v65;
    *((void *)&v56 + 1) = v7;
    unint64_t v50 = v38;
    if (v38 >> 62) {
      goto LABEL_67;
    }
    unint64_t v39 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v39)
    {
      unint64_t v65 = v50 & 0xC000000000000001;
      while (!__OFSUB__(v39--, 1))
      {
        if (v65)
        {
          id v41 = (id)sub_100036BF0();
        }
        else
        {
          if ((v39 & 0x8000000000000000) != 0) {
            goto LABEL_65;
          }
          if (v39 >= *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_66;
          }
          id v41 = *(id *)(v50 + 32 + 8 * v39);
        }
        os_log_t v42 = v41;
        sub_100006780(&qword_100044B10);
        uint64_t v43 = swift_allocObject();
        *(_OWORD *)(v43 + 16) = xmmword_100038110;
        long long v44 = v56;
        uint64_t v45 = type metadata accessor for RegexMatch();
        uint64_t v46 = swift_allocObject();
        *(void *)(v46 + 16) = v42;
        *(_OWORD *)(v46 + 24) = v44;
        *(void *)(v43 + 56) = v45;
        *(void *)(v43 + 32) = v46;
        unint64_t v7 = v42;
        swift_bridgeObjectRetain();
        sub_100036620();
        swift_bridgeObjectRelease();
        if (swift_dynamicCast())
        {
          uint64_t v47 = *((void *)&v53 + 1);
          uint64_t v51 = v53;
          [(id)v7 range];
          swift_bridgeObjectRetain();
          sub_100036A60();
          char v49 = v48;
          swift_bridgeObjectRelease();
          if ((v49 & 1) == 0)
          {
            *(void *)&long long v59 = v51;
            *((void *)&v59 + 1) = v47;
            sub_10001DB98();
            sub_100036860();
          }
          swift_bridgeObjectRelease();

          if (!v39)
          {
LABEL_59:
            swift_bridgeObjectRelease();
            unint64_t v7 = *((void *)&v56 + 1);
            unint64_t v65 = v56;
            goto LABEL_60;
          }
        }
        else
        {

          if (!v39) {
            goto LABEL_59;
          }
        }
      }
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      swift_bridgeObjectRetain();
      unint64_t v39 = sub_100036C30();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
LABEL_60:
    *(void *)(a2 + 24) = &type metadata for String;

    swift_release();
    *(void *)a2 = v65;
    *(void *)(a2 + 8) = v7;
    return sub_10000685C((uint64_t)v62);
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000685C((uint64_t)v62);
LABEL_23:
  sub_10001DA38();
  swift_allocError();
  *uint64_t v21 = 12;
  return swift_willThrow();
}

uint64_t sub_10001C660@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (!*(void *)(a1 + 16) || (unint64_t v5 = sub_10001172C(0x6E726574746170, 0xE700000000000000), (v6 & 1) == 0))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v16 = 0;
    goto LABEL_10;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v5, (uint64_t)&v13);
  sub_100006780(&qword_100044AC8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    goto LABEL_10;
  }
  if (!*((void *)&v15 + 1))
  {
LABEL_10:
    sub_100015804((uint64_t)&v14, &qword_100044AC0);
    goto LABEL_11;
  }
  sub_100007D38(&v14, (uint64_t)v17);
  uint64_t v7 = v18;
  uint64_t v8 = v19;
  sub_1000067C4(v17, v18);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  if (v2) {
    return sub_10000685C((uint64_t)v17);
  }
  uint64_t v10 = v9;
  if (v9)
  {
    a2[3] = sub_10000C980(0, &qword_100044B00);
    *a2 = v10;
    return sub_10000685C((uint64_t)v17);
  }
  sub_10000685C((uint64_t)v17);
LABEL_11:
  sub_10001DA38();
  swift_allocError();
  *uint64_t v12 = 13;
  return swift_willThrow();
}

void sub_10001C7F4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!*(void *)(a1 + 16) || (unint64_t v5 = sub_10001172C(0x6E726574746170, 0xE700000000000000), (v6 & 1) == 0))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v33 = 0;
    goto LABEL_8;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v5, (uint64_t)&v29);
  sub_100006780(&qword_100044AC8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    goto LABEL_8;
  }
  if (!*((void *)&v32 + 1))
  {
LABEL_8:
    sub_100015804((uint64_t)&v31, &qword_100044AC0);
LABEL_9:
    sub_10001DA38();
    swift_allocError();
    *uint64_t v10 = 14;
    swift_willThrow();
    return;
  }
  sub_100007D38(&v31, (uint64_t)v34);
  uint64_t v7 = v35;
  uint64_t v8 = v36;
  sub_1000067C4(v34, v35);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  if (v2)
  {
LABEL_6:
    sub_10000685C((uint64_t)v34);
    return;
  }
  uint64_t v11 = (void *)v9;
  if (!v9) {
    goto LABEL_27;
  }
  if (!*(void *)(a1 + 16)
    || (unint64_t v12 = sub_10001172C(0x676E69727473, 0xE600000000000000), (v13 & 1) == 0)
    || (sub_10000C7B4(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v31), (swift_dynamicCast() & 1) == 0))
  {

LABEL_27:
    sub_10000685C((uint64_t)v34);
    goto LABEL_9;
  }
  uint64_t v15 = v29;
  unint64_t v14 = v30;
  uint64_t v16 = HIBYTE(v30) & 0xF;
  if ((v30 & 0x2000000000000000) == 0) {
    uint64_t v16 = v29;
  }
  uint64_t v17 = 7;
  if (((v30 >> 60) & ((v29 & 0x800000000000000) == 0)) != 0) {
    uint64_t v17 = 11;
  }
  *(void *)&long long v31 = 15;
  *((void *)&v31 + 1) = v17 | (v16 << 16);
  swift_bridgeObjectRetain();
  sub_100006780(&qword_100044AF0);
  sub_100014664(&qword_100044AF8, &qword_100044AF0);
  sub_10001DB44();
  uint64_t v18 = sub_100036AB0();
  uint64_t v20 = v19;
  NSString v21 = sub_100036790();
  id v22 = objc_msgSend(v11, "matchesInString:options:range:", v21, 0, v18, v20);

  sub_10000C980(0, (unint64_t *)&qword_100044AE8);
  unint64_t v23 = sub_100036960();

  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_100036C30();
    swift_bridgeObjectRelease();
    if (v28) {
      goto LABEL_21;
    }
LABEL_30:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_30;
  }
LABEL_21:
  if ((v23 & 0xC000000000000001) != 0)
  {
    id v24 = (id)sub_100036BF0();
    goto LABEL_24;
  }
  if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v24 = *(id *)(v23 + 32);
LABEL_24:
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    if (![v25 range])
    {
      uint64_t v26 = type metadata accessor for RegexMatch();
      long long v27 = (void *)swift_allocObject();
      v27[2] = v25;
      v27[3] = v15;
      v27[4] = v14;
      *(void *)(a2 + 24) = v26;

      *(void *)a2 = v27;
      goto LABEL_6;
    }

    swift_bridgeObjectRelease();
LABEL_31:
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    goto LABEL_6;
  }
  __break(1u);
}

uint64_t sub_10001CBD8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (!*(void *)(a1 + 16)) {
    goto LABEL_12;
  }
  unint64_t v5 = sub_10001172C(0x676E69727473, 0xE600000000000000);
  if ((v6 & 1) == 0) {
    goto LABEL_12;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v5, (uint64_t)v27);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v7 = *((void *)&v24 + 1);
  if (!*(void *)(a1 + 16) || (uint64_t v8 = v24, v9 = sub_10001172C(0x6E726574746170, 0xE700000000000000), (v10 & 1) == 0))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v26 = 0;
    goto LABEL_11;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v23);
  sub_100006780(&qword_100044AC8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v26 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    goto LABEL_11;
  }
  if (!*((void *)&v25 + 1))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    sub_100015804((uint64_t)&v24, &qword_100044AC0);
    goto LABEL_12;
  }
  sub_100007D38(&v24, (uint64_t)v27);
  uint64_t v11 = v28;
  uint64_t v12 = v29;
  sub_1000067C4(v27, v28);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  if (!v2)
  {
    uint64_t v16 = (void *)v13;
    if (v13)
    {
      NSString v17 = sub_100036790();
      v23[0] = 15;
      *(void *)&long long v24 = v8;
      *((void *)&v24 + 1) = v7;
      swift_bridgeObjectRetain();
      sub_100006780(&qword_100044AD0);
      sub_100014664(&qword_100044AD8, &qword_100044AD0);
      sub_10001DB44();
      uint64_t v18 = sub_100036AB0();
      id v20 = objc_msgSend(v16, "matchesInString:options:range:", v17, 0, v18, v19);

      sub_10000C980(0, (unint64_t *)&qword_100044AE8);
      unint64_t v21 = sub_100036960();

      swift_bridgeObjectRetain();
      id v22 = sub_10001D688(v21, v8, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      a2[3] = sub_100006780(&qword_100044778);

      *a2 = v22;
      return sub_10000685C((uint64_t)v27);
    }
    swift_bridgeObjectRelease();
    sub_10000685C((uint64_t)v27);
LABEL_12:
    sub_10001DA38();
    swift_allocError();
    *unint64_t v14 = 15;
    return swift_willThrow();
  }
  swift_bridgeObjectRelease();
  return sub_10000685C((uint64_t)v27);
}

uint64_t sub_10001CEFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!*(void *)(a1 + 16)) {
    goto LABEL_13;
  }
  unint64_t v5 = sub_10001172C(0x676E69727473, 0xE600000000000000);
  if ((v6 & 1) == 0) {
    goto LABEL_13;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v5, (uint64_t)v30);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v7 = *((void *)&v27 + 1);
  if (!*(void *)(a1 + 16) || (uint64_t v8 = v27, v9 = sub_10001172C(0x6E726574746170, 0xE700000000000000), (v10 & 1) == 0))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v29 = 0;
    goto LABEL_12;
  }
  sub_10000C7B4(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v26);
  sub_100006780(&qword_100044AC8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    goto LABEL_12;
  }
  if (!*((void *)&v28 + 1))
  {
LABEL_12:
    swift_bridgeObjectRelease();
    sub_100015804((uint64_t)&v27, &qword_100044AC0);
LABEL_13:
    sub_10001DA38();
    swift_allocError();
    *uint64_t v15 = 16;
    return swift_willThrow();
  }
  sub_100007D38(&v27, (uint64_t)v30);
  uint64_t v11 = v31;
  uint64_t v12 = v32;
  sub_1000067C4(v30, v31);
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  if (v2)
  {
    swift_bridgeObjectRelease();
    return sub_10000685C((uint64_t)v30);
  }
  uint64_t v16 = (void *)v13;
  if (!v13)
  {
    swift_bridgeObjectRelease();
    sub_10000685C((uint64_t)v30);
    goto LABEL_13;
  }
  NSString v17 = sub_100036790();
  v26[0] = 15;
  *(void *)&long long v27 = v8;
  *((void *)&v27 + 1) = v7;
  swift_bridgeObjectRetain();
  sub_100006780(&qword_100044AD0);
  sub_100014664(&qword_100044AD8, &qword_100044AD0);
  sub_10001DB44();
  uint64_t v18 = sub_100036AB0();
  id v20 = objc_msgSend(v16, "firstMatchInString:options:range:", v17, 0, v18, v19);

  if (!v20)
  {
    swift_bridgeObjectRelease();

    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return sub_10000685C((uint64_t)v30);
  }
  id v21 = v20;
  [v21 range];
  uint64_t result = sub_100036A60();
  if ((v22 & 1) == 0)
  {
    sub_100036910();
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_100036850();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    *(void *)(a2 + 24) = &type metadata for String;

    *(void *)a2 = v23;
    *(void *)(a2 + 8) = v25;
    return sub_10000685C((uint64_t)v30);
  }
  __break(1u);
  return result;
}

id sub_10001D250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_100036790();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithPattern:v5 options:a3 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_100036130();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_10001D32C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void *sub_10001D364@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001A750(a1, *(void **)(v2 + 16), a2);
}

unint64_t sub_10001D380(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006780(&qword_100044880);
  uint64_t v2 = sub_100036C60();
  unint64_t v3 = (void *)v2;
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
    sub_10001DC40(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001D4C8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000155C8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_10001D4AC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_10001A50C(a1, *(void **)(v2 + 16), a2);
}

unint64_t sub_10001D4C8(uint64_t a1, uint64_t a2)
{
  sub_100036EB0();
  sub_100036870();
  Swift::Int v4 = sub_100036ED0();

  return sub_10001D540(a1, a2, v4);
}

unint64_t sub_10001D540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_100036E10() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_100036E10() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_100036E10()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

void *sub_10001D688(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v6) {
      return _swiftEmptyArrayStorage;
    }
    unint64_t result = (void *)sub_100024648(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0) {
      break;
    }
    uint64_t v20 = v6;
    uint64_t v8 = 0;
    while (v6 != v8)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_100036BF0();
      }
      else {
        id v9 = *(id *)(a1 + 8 * v8 + 32);
      }
      char v10 = v9;
      [v9 range];
      unint64_t result = (void *)sub_100036A60();
      if (v11) {
        goto LABEL_18;
      }
      uint64_t v12 = a2;
      uint64_t v13 = a3;
      sub_100036910();
      uint64_t v14 = sub_100036850();
      uint64_t v16 = v15;

      swift_bridgeObjectRelease();
      unint64_t v18 = _swiftEmptyArrayStorage[2];
      unint64_t v17 = _swiftEmptyArrayStorage[3];
      if (v18 >= v17 >> 1) {
        sub_100024648(v17 > 1, v18 + 1, 1);
      }
      ++v8;
      _swiftEmptyArrayStorage[2] = v18 + 1;
      uint64_t v19 = (char *)&_swiftEmptyArrayStorage[2 * v18];
      *((void *)v19 + 4) = v14;
      *((void *)v19 + 5) = v16;
      uint64_t v6 = v20;
      a3 = v13;
      a2 = v12;
      if (v20 == v8) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100036C30();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

Swift::Int sub_10001D844(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100006780(&qword_100044B48);
    uint64_t v3 = sub_100036BB0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_100036EB0();
      swift_bridgeObjectRetain();
      sub_100036870();
      Swift::Int result = sub_100036ED0();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_100036E10(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_100036E10();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      id v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *id v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t type metadata accessor for RegexMatch()
{
  return self;
}

ValueMetadata *type metadata accessor for MorpheusPEExtension()
{
  return &type metadata for MorpheusPEExtension;
}

uint64_t sub_10001DA1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10001AFE8(a1, v2, a2);
}

unint64_t sub_10001DA38()
{
  unint64_t result = qword_100044AB8;
  if (!qword_100044AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044AB8);
  }
  return result;
}

uint64_t *sub_10001DA8C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10001DAF0(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    return swift_slowDealloc();
  }
  return result;
}

unint64_t sub_10001DB44()
{
  unint64_t result = qword_100044AE0;
  if (!qword_100044AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044AE0);
  }
  return result;
}

unint64_t sub_10001DB98()
{
  unint64_t result = qword_100044B18;
  if (!qword_100044B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044B18);
  }
  return result;
}

unint64_t sub_10001DBEC()
{
  unint64_t result = qword_100044B40;
  if (!qword_100044B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044B40);
  }
  return result;
}

uint64_t sub_10001DC40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_100044888);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001DCAC(uint64_t a1, uint64_t a2)
{
  sub_100036810();
  ((void (*)(void))__chkstk_darwin)();
  sub_100006780(&qword_100044908);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100036190();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v32 - v11;
  NSString v13 = sub_100036790();
  id v14 = [self bundleWithIdentifier:v13];

  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v33 = a2;
  uint64_t v34 = a1;
  NSString v15 = sub_100036790();
  NSString v16 = sub_100036790();
  id v17 = [v14 URLForResource:v15 withExtension:v16];

  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    a1 = v34;
    goto LABEL_6;
  }
  sub_100036170();

  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v18(v5, v10, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  int v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  a1 = v34;
  if (v19 == 1)
  {
LABEL_6:

    sub_10001E308((uint64_t)v5);
LABEL_7:
    swift_bridgeObjectRetain();
    return a1;
  }
  v18(v12, v5, v6);
  uint64_t v20 = sub_1000361A0();
  unint64_t v22 = v21;
  uint64_t v24 = sub_1000216E4(v20, v21);
  unint64_t v26 = v25;
  sub_10000C9BC(v20, v22);
  sub_1000367F0();
  unint64_t v27 = v26;
  Swift::Int v28 = sub_1000367E0();
  if (v29)
  {
    uint64_t v30 = sub_1000238A0(v28, v29);
    uint64_t v31 = v33;
    swift_bridgeObjectRetain();
    a1 = sub_10001E368(v34, v31, v30);

    sub_10000C9BC(v24, v27);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);

    swift_bridgeObjectRetain();
    sub_10000C9BC(v24, v26);
    return v34;
  }
  return a1;
}

void sub_10001E0F0(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_1000368F0(1);
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v28 = 0;
  uint64_t v29 = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000368B0();
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    id v9 = 0;
    uint64_t v10 = &OBJC_INSTANCE_METHODS_MLFeatureProvider;
    uint64_t v11 = &OBJC_INSTANCE_METHODS_MLFeatureProvider;
    unint64_t v12 = &OBJC_INSTANCE_METHODS_MLFeatureProvider;
    while (1)
    {
      while ((sub_100015868(v7, (unint64_t)v8) & 1) == 0)
      {
        v30._uint64_t countAndFlagsBits = v7;
        v30._uint64_t object = v8;
        sub_100036890(v30);
        swift_bridgeObjectRelease();
        uint64_t v7 = sub_1000368B0();
        uint64_t v8 = v13;
        if (!v13) {
          goto LABEL_16;
        }
      }
      if (!v9) {
        id v9 = objc_msgSend(objc_allocWithZone((Class)EMFEmojiLocaleData), "init", v26, v27, v28, v29);
      }
      id v14 = v9;
      NSString v15 = sub_100036790();
      swift_bridgeObjectRelease();
      id v16 = objc_msgSend(self, *(SEL *)&v10[119], v15, v14);

      id v17 = [v16 *(SEL *)&v11[120]];
      if (!v17) {
        id v17 = [objc_allocWithZone((Class)EMFEmojiToken) init];
      }
      uint64_t v18 = v11;
      int v19 = v12;
      id v20 = objc_msgSend(v17, *(SEL *)&v12[121], v26, v27);
      if (!v20) {
        break;
      }
      unint64_t v21 = v20;
      uint64_t v22 = sub_1000367C0();
      uint64_t v24 = v23;

      v31._uint64_t countAndFlagsBits = v22;
      v31._uint64_t object = v24;
      sub_1000368A0(v31);

      swift_bridgeObjectRelease();
      uint64_t v7 = sub_1000368B0();
      uint64_t v8 = v25;
      uint64_t v10 = &OBJC_INSTANCE_METHODS_MLFeatureProvider;
      uint64_t v11 = v18;
      unint64_t v12 = v19;
      if (!v25) {
        goto LABEL_16;
      }
    }

    __break(1u);
  }
  else
  {
    id v9 = 0;
LABEL_16:
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001E308(uint64_t a1)
{
  uint64_t v2 = sub_100006780(&qword_100044908);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001E368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_1000368B0();
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    do
    {
      if (sub_100015868(v6, (unint64_t)v7) & 1) == 0 || (sub_10001AB50(v6, (uint64_t)v7, a3))
      {
        v10._uint64_t countAndFlagsBits = v6;
        v10._uint64_t object = v7;
        sub_100036890(v10);
      }
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_1000368B0();
      uint64_t v7 = v8;
    }
    while (v8);
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10001E450@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  sub_100006780(&qword_100044B88);
  sub_100036330();
  swift_release();
  uint64_t v2 = sub_100036850();
  uint64_t v4 = v3;
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_10001E4EC@<X0>(uint64_t *a1@<X8>)
{
  swift_getKeyPath();
  sub_100006780(&qword_100044B80);
  sub_100036340();
  swift_release();
  if (v12 >> 14 == v11 >> 14)
  {
LABEL_2:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = 32;
LABEL_20:
    *a1 = v3;
    a1[1] = 0xE100000000000000;
  }
  else
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v4 = sub_100036AF0();
      unint64_t v6 = v5;
      uint64_t result = sub_100036AD0();
      if (!((v6 & 0x2000000000000000) != 0 ? HIBYTE(v6) & 0xF : v4 & 0xFFFFFFFFFFFFLL)) {
        break;
      }
      unint64_t v8 = result;
      if ((v6 & 0x1000000000000000) != 0)
      {
        int v9 = sub_100036BD0();
      }
      else
      {
        if ((v6 & 0x2000000000000000) == 0 && (v4 & 0x1000000000000000) == 0) {
          sub_100036C00();
        }
        int v9 = sub_100036C10();
      }
      int v10 = v9;
      swift_bridgeObjectRelease();
      if ((v10 - 14) > 0xFFFFFFFB || (v10 - 8232) < 2 || v10 == 133)
      {
        uint64_t result = swift_bridgeObjectRelease_n();
        uint64_t v3 = 10;
        goto LABEL_20;
      }
      if (v12 >> 14 == v8 >> 14)
      {
        swift_bridgeObjectRelease();
        goto LABEL_2;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10001E6BC@<X0>(uint64_t *a1@<X8>)
{
  sub_100006780(&qword_100044B80);
  sub_100036350();
  sub_100021010();
  sub_10001DB44();
  uint64_t v2 = sub_100036B30();
  uint64_t v4 = v3;
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

void sub_10001E790()
{
  off_100044B50 = &off_1000415C0;
}

uint64_t sub_10001E7A4(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1000368E0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = sub_1000368D0();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_10001E820(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_10001E900(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_100036BD0();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_100036C00();
      }
      unsigned int v5 = sub_100036C10();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_10001E900(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    uint64_t result = sub_10001E9A0(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_10001EA10(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_10001E9A0(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    uint64_t result = sub_10001E7A4(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_10001EA10(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      uint64_t v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v7 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_14;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_100036C00();
        unint64_t v5 = v12;
        if (v12 == v10) {
          goto LABEL_14;
        }
      }
      if ((*(unsigned char *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          unint64_t v7 = v5 - 1;
          int v8 = *(unsigned char *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      unint64_t v7 = v5;
      return v7 << 16;
    }
    uint64_t v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v9)
    {
      return _StringGuts.foreignScalarAlign(_:)();
    }
  }
  return result;
}

uint64_t sub_10001EB34()
{
  sub_100006780(&qword_100044BA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038680;
  uint64_t v1 = sub_100006780(&qword_100044B60);
  *(void *)(inited + 56) = v1;
  uint64_t v2 = sub_100014664(&qword_100044B68, &qword_100044B60);
  *(void *)(inited + 64) = v2;
  sub_10001DA8C((uint64_t *)(inited + 32));
  sub_100036320();
  *(void *)(inited + 72) = 10;
  *(void *)(inited + 80) = 0xE100000000000000;
  *(void *)(inited + 112) = v1;
  *(void *)(inited + 120) = v2;
  sub_10001DA8C((uint64_t *)(inited + 88));
  sub_100036320();
  *(void *)(inited + 128) = 0;
  *(void *)(inited + 136) = 0xE000000000000000;
  *(void *)(inited + 168) = v1;
  *(void *)(inited + 176) = v2;
  sub_10001DA8C((uint64_t *)(inited + 144));
  sub_100036320();
  *(void *)(inited + 184) = 47;
  *(void *)(inited + 192) = 0xE100000000000000;
  sub_100020FA8(inited + 32, (uint64_t)v5);
  sub_1000067C4(v5, v6);
  sub_10001DBEC();
  sub_10001DB98();
  sub_100036A50();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_10000685C((uint64_t)v5);
  sub_100020FA8(inited + 88, (uint64_t)v5);
  sub_1000067C4(v5, v6);
  sub_100036A50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000685C((uint64_t)v5);
  sub_100020FA8(inited + 144, (uint64_t)v5);
  sub_1000067C4(v5, v6);
  sub_100036A50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000685C((uint64_t)v5);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_100006780(&qword_100044BB0);
  swift_arrayDestroy();
  return v4;
}

id sub_10001EE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Class isa = sub_1000361F0().super.isa;
  type metadata accessor for DocumentReadingOptionKey(0);
  sub_10001F88C();
  Class v7 = sub_100036700().super.isa;
  swift_bridgeObjectRelease();
  id v12 = 0;
  id v8 = [v4 initWithData:isa options:v7 documentAttributes:a4 error:&v12];

  if (v8)
  {
    id v9 = v12;
  }
  else
  {
    id v10 = v12;
    sub_100036130();

    swift_willThrow();
  }
  return v8;
}

uint64_t sub_10001EF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000360D0();
  uint64_t v36 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100036810();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  id v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000367F0();
  uint64_t v11 = sub_1000367D0();
  unint64_t v13 = v12;
  id v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v14(v10, v7);
  if (v13 >> 60 == 15)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v35 = a2;
    uint64_t v32 = v6;
    uint64_t v33 = v4;
    uint64_t v34 = a1;
    sub_100006780(&qword_100044B90);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000384B0;
    *(void *)(inited + 32) = NSDocumentTypeDocumentOption;
    type metadata accessor for DocumentType(0);
    *(void *)(inited + 40) = NSHTMLTextDocumentType;
    *(void *)(inited + 64) = v16;
    *(void *)(inited + 72) = NSCharacterEncodingDocumentOption;
    sub_10001F864(v11, v13);
    id v17 = NSDocumentTypeDocumentOption;
    uint64_t v18 = NSHTMLTextDocumentType;
    int v19 = NSCharacterEncodingDocumentOption;
    sub_1000367F0();
    uint64_t v20 = sub_100036800();
    v14(v10, v7);
    *(void *)(inited + 104) = &type metadata for UInt;
    *(void *)(inited + 80) = v20;
    unint64_t v21 = sub_10000E864(inited);
    id v22 = objc_allocWithZone((Class)NSAttributedString);
    id v23 = sub_10001EE60(v11, v13, v21, 0);
    sub_10001F878(v11, v13);
    uint64_t v24 = v11;
    if (v23)
    {
      id v25 = [v23 string];
      uint64_t v26 = sub_1000367C0();
      uint64_t v28 = v27;

      uint64_t v37 = v26;
      uint64_t v38 = v28;
      uint64_t v29 = v32;
      sub_1000360C0();
      sub_10001DB44();
      a1 = sub_100036B20();

      sub_10001F878(v24, v13);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v29, v33);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10001F878(v11, v13);
      swift_bridgeObjectRetain();
      return v34;
    }
  }
  return a1;
}

uint64_t sub_10001F2F0()
{
  sub_10001DB44();
  sub_100036B50();
  uint64_t v0 = sub_1000368B0();
  unint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = v0;
    do
    {
      if ((v2 & 0x2000000000000000) != 0) {
        uint64_t v5 = HIBYTE(v2) & 0xF;
      }
      else {
        uint64_t v5 = v3 & 0xFFFFFFFFFFFFLL;
      }
      if (v5)
      {
        if ((v2 & 0x1000000000000000) != 0)
        {
          unsigned int v6 = sub_100036BD0();
        }
        else
        {
          if ((v2 & 0x2000000000000000) == 0 && (v3 & 0x1000000000000000) == 0) {
            sub_100036C00();
          }
          unsigned int v6 = sub_100036C10();
        }
        unsigned int v7 = v6;
        if (qword_100044468 != -1) {
          swift_once();
        }
        uint64_t v8 = *((void *)off_100044B50 + 2);
        if (v8)
        {
          uint64_t v9 = (unsigned int *)((char *)off_100044B50 + 36);
          while (v7 < *(v9 - 1) || *v9 < v7)
          {
            v9 += 2;
            if (!--v8) {
              goto LABEL_4;
            }
          }
          v12._uint64_t countAndFlagsBits = v3;
          v12._uint64_t object = (void *)v2;
          sub_100036890(v12);
        }
      }
LABEL_4:
      swift_bridgeObjectRelease();
      uint64_t v3 = sub_1000368B0();
      unint64_t v2 = v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  return sub_100036900();
}

uint64_t sub_10001F4A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_100044B58);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  uint64_t v23 = v5;
  __chkstk_darwin(v4);
  unsigned int v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006780(&qword_100044B60);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10001DCAC(a1, a2);
  unint64_t v27 = v12;
  sub_100036320();
  uint64_t v24 = 32;
  unint64_t v25 = 0xE100000000000000;
  sub_10001DBEC();
  sub_10001DB98();
  v20[0] = sub_100014664(&qword_100044B68, &qword_100044B60);
  sub_100036A50();
  unint64_t v13 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20[1] = v9 + 8;
  unint64_t v21 = v13;
  v13(v11, v8);
  swift_bridgeObjectRelease();
  sub_10001E0F0(v28, v29);
  uint64_t v15 = v14;
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  sub_100006780(&qword_100044B70);
  sub_100036320();
  uint64_t v26 = v15;
  unint64_t v27 = v17;
  sub_100014664(&qword_100044B78, &qword_100044B58);
  uint64_t v18 = v22;
  sub_100036A40();
  swift_bridgeObjectRelease();
  uint64_t v26 = v28;
  unint64_t v27 = v29;
  sub_100036320();
  sub_100036A40();
  v21(v11, v8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v18);
  return v28;
}

uint64_t sub_10001F864(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000CA14(a1, a2);
  }
  return a1;
}

uint64_t sub_10001F878(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000C9BC(a1, a2);
  }
  return a1;
}

unint64_t sub_10001F88C()
{
  unint64_t result = qword_1000445A0;
  if (!qword_1000445A0)
  {
    type metadata accessor for DocumentReadingOptionKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000445A0);
  }
  return result;
}

uint64_t sub_10001F8E4()
{
  sub_100006780(&qword_100044BA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038690;
  uint64_t v1 = sub_100006780(&qword_100044B60);
  *(void *)(inited + 56) = v1;
  uint64_t v2 = sub_100014664(&qword_100044B68, &qword_100044B60);
  *(void *)(inited + 64) = v2;
  sub_10001DA8C((uint64_t *)(inited + 32));
  sub_100036320();
  *(void *)(inited + 72) = 42;
  *(void *)(inited + 80) = 0xE100000000000000;
  *(void *)(inited + 112) = v1;
  *(void *)(inited + 120) = v2;
  sub_10001DA8C((uint64_t *)(inited + 88));
  sub_100036320();
  *(void *)(inited + 128) = 46;
  *(void *)(inited + 136) = 0xE100000000000000;
  *(void *)(inited + 168) = v1;
  *(void *)(inited + 176) = v2;
  sub_10001DA8C((uint64_t *)(inited + 144));
  sub_100036320();
  *(void *)(inited + 184) = 43;
  *(void *)(inited + 192) = 0xE100000000000000;
  uint64_t v3 = sub_100006780(&qword_100044B58);
  *(void *)(inited + 224) = v3;
  uint64_t v4 = sub_100014664(&qword_100044B78, &qword_100044B58);
  *(void *)(inited + 232) = v4;
  sub_10001DA8C((uint64_t *)(inited + 200));
  sub_100006780(&qword_100044B70);
  sub_100036320();
  *(void *)(inited + 240) = 61;
  *(void *)(inited + 248) = 0xE100000000000000;
  *(void *)(inited + 280) = v3;
  *(void *)(inited + 288) = v4;
  sub_10001DA8C((uint64_t *)(inited + 256));
  sub_100036320();
  *(void *)(inited + 296) = 45;
  *(void *)(inited + 304) = 0xE100000000000000;
  *(void *)(inited + 336) = v3;
  *(void *)(inited + 344) = v4;
  sub_10001DA8C((uint64_t *)(inited + 312));
  sub_100036320();
  *(void *)(inited + 352) = 45;
  *(void *)(inited + 360) = 0xE100000000000000;
  *(void *)(inited + 392) = v1;
  *(void *)(inited + 400) = v2;
  sub_10001DA8C((uint64_t *)(inited + 368));
  sub_100036320();
  *(void *)(inited + 408) = 61;
  *(void *)(inited + 416) = 0xE100000000000000;
  *(void *)(inited + 448) = v1;
  *(void *)(inited + 456) = v2;
  sub_10001DA8C((uint64_t *)(inited + 424));
  sub_100036320();
  *(void *)(inited + 464) = 45;
  *(void *)(inited + 472) = 0xE100000000000000;
  *(void *)(inited + 504) = v1;
  *(void *)(inited + 512) = v2;
  sub_10001DA8C((uint64_t *)(inited + 480));
  sub_100036320();
  *(void *)(inited + 520) = 95;
  *(void *)(inited + 528) = 0xE100000000000000;
  *(void *)(inited + 560) = v1;
  *(void *)(inited + 568) = v2;
  sub_10001DA8C((uint64_t *)(inited + 536));
  sub_100036320();
  *(void *)(inited + 576) = 126;
  *(void *)(inited + 584) = 0xE100000000000000;
  *(void *)(inited + 616) = v1;
  *(void *)(inited + 624) = v2;
  sub_10001DA8C((uint64_t *)(inited + 592));
  sub_100036320();
  *(void *)(inited + 632) = 60;
  *(void *)(inited + 640) = 0xE100000000000000;
  *(void *)(inited + 672) = v1;
  *(void *)(inited + 680) = v2;
  sub_10001DA8C((uint64_t *)(inited + 648));
  sub_100036320();
  *(void *)(inited + 688) = 62;
  *(void *)(inited + 696) = 0xE100000000000000;
  *(void *)(inited + 728) = v1;
  *(void *)(inited + 736) = v2;
  sub_10001DA8C((uint64_t *)(inited + 704));
  sub_100036320();
  *(void *)(inited + 744) = 33;
  *(void *)(inited + 752) = 0xE100000000000000;
  *(void *)(inited + 784) = v1;
  *(void *)(inited + 792) = v2;
  sub_10001DA8C((uint64_t *)(inited + 760));
  sub_100036320();
  *(void *)(inited + 800) = 63;
  *(void *)(inited + 808) = 0xE100000000000000;
  *(void *)(inited + 840) = v1;
  *(void *)(inited + 848) = v2;
  sub_10001DA8C((uint64_t *)(inited + 816));
  sub_100036320();
  *(void *)(inited + 856) = 36;
  *(void *)(inited + 864) = 0xE100000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (uint64_t i = 32; i != 872; i += 56)
  {
    sub_100020FA8(inited + i, (uint64_t)v8);
    sub_1000067C4(v8, v8[3]);
    sub_10001DBEC();
    sub_10001DB98();
    sub_100036A50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000685C((uint64_t)v8);
  }
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_100006780(&qword_100044BB0);
  swift_arrayDestroy();
  return v7;
}

uint64_t sub_10001FE30(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_100044B60);
  uint64_t v39 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v38 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_1000360D0();
  uint64_t v41 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v51 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone((Class)NSRegularExpression);
  id v8 = sub_10001D250(0xD00000000000001DLL, 0x8000000100039FA0, 0);
  uint64_t v9 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v9 = a1;
  }
  uint64_t v10 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0) {
    uint64_t v10 = 11;
  }
  uint64_t v60 = 15;
  uint64_t v61 = v10 | (v9 << 16);
  uint64_t v58 = a1;
  unint64_t v59 = a2;
  swift_bridgeObjectRetain();
  sub_100006780(&qword_100044AF0);
  sub_100014664(&qword_100044AF8, &qword_100044AF0);
  unint64_t v50 = sub_10001DB44();
  uint64_t v11 = sub_100036AB0();
  uint64_t v13 = v12;
  uint64_t v60 = a1;
  uint64_t v61 = a2;
  swift_bridgeObjectRetain();
  NSString v14 = sub_100036790();
  id v15 = objc_msgSend(v8, "matchesInString:options:range:", v14, 0, v11, v13);

  sub_100020F68();
  unint64_t v16 = sub_100036960();

  unint64_t v44 = v16;
  uint64_t v40 = v4;
  if (!(v16 >> 62))
  {
    unint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v17) {
      goto LABEL_7;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    uint64_t v56 = v60;
    uint64_t v57 = v61;
    uint64_t v33 = v38;
    sub_100036320();
    uint64_t v54 = 32;
    unint64_t v55 = 0xE100000000000000;
    sub_10001DBEC();
    sub_10001DB98();
    sub_100014664(&qword_100044B68, &qword_100044B60);
    uint64_t v34 = v40;
    sub_100036A50();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v34);
    swift_bridgeObjectRelease();
    uint64_t v35 = v51;
    sub_1000360C0();
    uint64_t v36 = sub_100036B20();

    (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v52);
    swift_bridgeObjectRelease();
    return v36;
  }
LABEL_21:
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_100036C30();
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_22;
  }
LABEL_7:
  unint64_t v49 = v44 & 0xC000000000000001;
  unint64_t v42 = v44 + 32;
  uint64_t v43 = v44 & 0xFFFFFFFFFFFFFF8;
  uint64_t v45 = (void (**)(char *, uint64_t))(v41 + 8);
  unint64_t v46 = a2;
  uint64_t v47 = a1;
  id v48 = v8;
  while (1)
  {
    if (__OFSUB__(v17--, 1))
    {
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    if (v49)
    {
      id v19 = (id)sub_100036BF0();
    }
    else
    {
      if ((v17 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      if (v17 >= *(void *)(v43 + 16)) {
        goto LABEL_20;
      }
      id v19 = *(id *)(v42 + 8 * v17);
    }
    uint64_t v20 = v19;
    [v19 rangeAtIndex:0];
    sub_100036A60();
    if (v21) {
      break;
    }
    id v53 = v20;
    sub_100036910();
    uint64_t v22 = sub_100036850();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    uint64_t v58 = v22;
    unint64_t v59 = v24;
    unint64_t v25 = v51;
    sub_1000360B0();
    uint64_t v26 = sub_100036B20();
    uint64_t v28 = v27;
    (*v45)(v25, v52);
    uint64_t v58 = v22;
    unint64_t v59 = v24;
    uint64_t v56 = v26;
    uint64_t v57 = v28;
    uint64_t v54 = 0;
    unint64_t v55 = 0xE000000000000000;
    uint64_t v29 = sub_100036B30();
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_100036A60();
    LOBYTE(v28) = v32;
    swift_bridgeObjectRelease();
    if ((v28 & 1) == 0)
    {
      uint64_t v58 = v29;
      unint64_t v59 = v31;
      sub_10001DB98();
      sub_100036860();
    }
    swift_bridgeObjectRelease();

    a1 = v47;
    id v8 = v48;
    a2 = v46;
    if (!v17) {
      goto LABEL_22;
    }
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_100020490(char *a1, uint64_t a2, int a3)
{
  uint64_t v35 = sub_100006780(&qword_100044B60);
  uint64_t v6 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v34 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  sub_10001DB44();
  uint64_t v8 = sub_100036B60();
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v32 = v8;
  if (v9)
  {
    uint64_t v10 = a3;
    uint64_t v33 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v11 = (uint64_t *)(v8 + 56);
    uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      char v21 = (char *)*(v11 - 3);
      uint64_t v20 = *(v11 - 2);
      uint64_t v22 = *(v11 - 1);
      uint64_t v23 = *v11;
      swift_bridgeObjectRetain();
      if (sub_100036AE0() < v10) {
        goto LABEL_7;
      }
      uint64_t v38 = v21;
      uint64_t v39 = v20;
      uint64_t v40 = v22;
      uint64_t v41 = v23;
      uint64_t v37 = v12;
      uint64_t v13 = v34;
      sub_100036320();
      unint64_t v36 = sub_100020F14();
      sub_100014664(&qword_100044B68, &qword_100044B60);
      uint64_t v14 = v10;
      uint64_t v15 = v35;
      uint64_t v16 = sub_100036740();
      unint64_t v17 = v13;
      uint64_t v12 = v37;
      uint64_t v18 = v15;
      uint64_t v10 = v14;
      (*v33)(v17, v18);
      uint64_t v19 = *(void *)(v16 + 16);
      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_7:
        uint64_t v24 = sub_100036850();
        uint64_t v26 = v25;
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = sub_10000AB24(0, *((void *)v12 + 2) + 1, 1, v12);
        }
        unint64_t v28 = *((void *)v12 + 2);
        unint64_t v27 = *((void *)v12 + 3);
        if (v28 >= v27 >> 1) {
          uint64_t v12 = sub_10000AB24((char *)(v27 > 1), v28 + 1, 1, v12);
        }
        *((void *)v12 + 2) = v28 + 1;
        uint64_t v29 = &v12[16 * v28];
        *((void *)v29 + 4) = v24;
        *((void *)v29 + 5) = v26;
      }
      v11 += 4;
      --v9;
    }
    while (v9);
  }
  else
  {
    uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  uint64_t v38 = v12;
  sub_100006780(&qword_100044778);
  sub_100014664(&qword_100044780, &qword_100044778);
  uint64_t v30 = sub_100036760();
  swift_bridgeObjectRelease();
  return v30;
}

uint64_t sub_1000207D4()
{
  uint64_t v0 = sub_100006780(&qword_100044B58);
  uint64_t v44 = *(void *)(v0 - 8);
  uint64_t v45 = v0;
  __chkstk_darwin(v0);
  uint64_t v43 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006780(&qword_100044B60);
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v40 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v38 - v5;
  uint64_t v7 = sub_10001EB34();
  sub_10001EF74(v7, v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_10001F2F0();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_10001F4A8(v9, v11);
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v49 = v12;
  unint64_t v50 = v14;
  sub_100036320();
  uint64_t v47 = 32;
  unint64_t v48 = 0xE100000000000000;
  unint64_t v15 = sub_10001DBEC();
  unint64_t v16 = sub_10001DB98();
  sub_100014664(&qword_100044B68, &qword_100044B60);
  uint64_t v38 = v2;
  sub_100036A50();
  unint64_t v17 = *(void (**)(char *, uint64_t))(v46 + 8);
  v46 += 8;
  uint64_t v39 = v17;
  v17(v6, v2);
  swift_bridgeObjectRelease();
  uint64_t v49 = 2621;
  unint64_t v50 = 0xE200000000000000;
  uint64_t v47 = 0;
  unint64_t v48 = 0xE000000000000000;
  sub_10001DB44();
  uint64_t v18 = sub_100036B30();
  unint64_t v20 = v19;
  char v21 = v40;
  sub_100036320();
  uint64_t v49 = v18;
  unint64_t v50 = v20;
  unint64_t v41 = v16;
  unint64_t v42 = v15;
  uint64_t v22 = v38;
  sub_100036A40();
  swift_bridgeObjectRelease();
  sub_100036B40();
  uint64_t v24 = v23;
  v39(v21, v22);
  swift_bridgeObjectRelease();
  if (v24) {
    swift_bridgeObjectRelease();
  }
  uint64_t v25 = sub_10001F8E4();
  unint64_t v27 = v26;
  swift_bridgeObjectRelease();
  uint64_t v49 = v25;
  unint64_t v50 = v27;
  sub_100006780(&qword_100044B70);
  unint64_t v28 = v43;
  sub_100036320();
  uint64_t v47 = 10;
  unint64_t v48 = 0xE100000000000000;
  sub_100014664(&qword_100044B78, &qword_100044B58);
  uint64_t v29 = v45;
  sub_100036A50();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v28, v29);
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_10001EB34();
  unint64_t v32 = v31;
  swift_bridgeObjectRelease();
  uint64_t v33 = (char *)sub_10001FE30(v30, v32);
  uint64_t v35 = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_100020490(v33, v35, 5);
  swift_bridgeObjectRelease();
  return v36;
}

uint64_t sub_100020D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)a3 == 1)
  {
    if (*(unsigned char *)(a3 + 1) == 1 && *(void *)(a3 + 8) != 0)
    {
      sub_100006780(&qword_100044B10);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_100038110;
      *(void *)(v6 + 56) = &type metadata for String;
      *(void *)(v6 + 32) = a1;
      *(void *)(v6 + 40) = a2;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_10000E72C((uint64_t)&_swiftEmptyArrayStorage);
      sub_1000365F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      if (*((void *)&v10 + 1))
      {
        sub_1000155C8(&v9, v11);
        sub_1000155C8(v11, &v9);
        if (swift_dynamicCast()) {
          return v8;
        }
      }
      else
      {
        sub_100020EB4((uint64_t)&v9);
      }
    }
    return sub_1000207D4();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100020EB4(uint64_t a1)
{
  uint64_t v2 = sub_100006780(&qword_100044B98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100020F14()
{
  unint64_t result = qword_100044BA0;
  if (!qword_100044BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044BA0);
  }
  return result;
}

unint64_t sub_100020F68()
{
  unint64_t result = qword_100044AE8;
  if (!qword_100044AE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100044AE8);
  }
  return result;
}

uint64_t sub_100020FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_100044BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100021010()
{
  unint64_t result = qword_100044BB8;
  if (!qword_100044BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044BB8);
  }
  return result;
}

uint64_t sub_100021064()
{
  sub_100036870();

  return swift_bridgeObjectRelease();
}

PrivateEvolutionPlugin::FeaturizerError_optional __swiftcall FeaturizerError.init(rawValue:)(Swift::String rawValue)
{
  uint64_t object = rawValue._object;
  v8._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v3 = v1;
  v4._rawValue = &off_100041958;
  v8._uint64_t object = object;
  unint64_t v5 = sub_100036C90(v4, v8);
  result.value = swift_bridgeObjectRelease();
  char v7 = 9;
  if (v5 < 9) {
    char v7 = v5;
  }
  *uint64_t v3 = v7;
  return result;
}

unint64_t FeaturizerError.rawValue.getter()
{
  unint64_t result = 0x656C6C65636E6163;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x7075727265746E69;
      break;
    case 2:
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0xD000000000000012;
      break;
    case 5:
      unint64_t result = 0x6F5464656C696166;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100021360(unsigned __int8 *a1, char *a2)
{
  return sub_100015A80(*a1, *a2);
}

unint64_t sub_100021370()
{
  unint64_t result = qword_100044BC0;
  if (!qword_100044BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044BC0);
  }
  return result;
}

Swift::Int sub_1000213C4()
{
  return sub_100036ED0();
}

uint64_t sub_10002140C()
{
  return sub_100021064();
}

Swift::Int sub_100021414()
{
  return sub_100036ED0();
}

PrivateEvolutionPlugin::FeaturizerError_optional sub_100021458(Swift::String *a1)
{
  return FeaturizerError.init(rawValue:)(*a1);
}

unint64_t sub_100021464@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = FeaturizerError.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100021490()
{
  unint64_t result = qword_100044BC8;
  if (!qword_100044BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044BC8);
  }
  return result;
}

unint64_t sub_1000214E8()
{
  unint64_t result = qword_100044BD0;
  if (!qword_100044BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044BD0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FeaturizerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FeaturizerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x1000216ACLL);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FeaturizerError()
{
  return &type metadata for FeaturizerError;
}

uint64_t sub_1000216E4(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_1000366F0();
  uint64_t v48 = *(void *)(v5 - 8);
  __chkstk_darwin();
  BOOL v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1000366C0();
  __chkstk_darwin();
  long long v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000366E0();
  uint64_t v51 = *(void *)(v10 - 8);
  __chkstk_darwin();
  unint64_t v50 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100022CA0((uint64_t)&off_100041610);
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v14) = HIDWORD(a1) - a1;
      if (!__OFSUB__(HIDWORD(a1), a1))
      {
        uint64_t v14 = (int)v14;
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_31;
    case 2uLL:
      uint64_t v16 = *(void *)(a1 + 16);
      uint64_t v15 = *(void *)(a1 + 24);
      BOOL v17 = __OFSUB__(v15, v16);
      uint64_t v14 = v15 - v16;
      if (!v17) {
        goto LABEL_6;
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    case 3uLL:
      goto LABEL_11;
    default:
      uint64_t v14 = BYTE6(a2);
      if (v14 < 7) {
        goto LABEL_11;
      }
LABEL_6:
      uint64_t v52 = v12;
      unint64_t v53 = v13;
      uint64_t v18 = sub_1000361D0();
      uint64_t v46 = v10;
      uint64_t v47 = v2;
      uint64_t v19 = v18;
      unint64_t v21 = v20;
      char v22 = sub_100022908(v52, v53, v18, v20);
      sub_10000C9BC(v19, v21);
      uint64_t v12 = v52;
      unint64_t v13 = v53;
      if (v22)
      {
        uint64_t v43 = v9;
        unint64_t v44 = a2 >> 62;
        if (qword_100044470 != -1) {
LABEL_32:
        }
          swift_once();
        unint64_t v23 = qword_100044BE0 >> 62;
        uint64_t v24 = qword_100044BD8;
        unint64_t v45 = qword_100044BE0;
        sub_10000CA14(qword_100044BD8, qword_100044BE0);
        sub_100022D3C(&qword_100044BE8, (void (*)(uint64_t))&type metadata accessor for SHA256);
        sub_1000366B0();
        switch(v23)
        {
          case 1uLL:
            if (v24 >> 32 < (int)v24) {
              __break(1u);
            }
            unint64_t v25 = v45;
            unint64_t v42 = v45 & 0x3FFFFFFFFFFFFFFFLL;
            sub_10000CA14(v24, v45);
            uint64_t v30 = v47;
            sub_100022698((int)v24, v24 >> 32);
            uint64_t v47 = v30;
            goto LABEL_19;
          case 2uLL:
            unint64_t v25 = v45;
            unint64_t v28 = *(void *)(v24 + 16);
            uint64_t v41 = *(void *)(v24 + 24);
            unint64_t v42 = v28;
            sub_10000CA14(v24, v45);
            swift_retain();
            swift_retain();
            uint64_t v29 = v47;
            sub_100022698(v42, v41);
            uint64_t v47 = v29;
            if (v29) {
              goto LABEL_35;
            }
            swift_release();
            swift_release();
LABEL_19:
            sub_10000C9BC(v24, v25);
            break;
          case 3uLL:
            memset(v54, 0, 14);
            sub_100036690();
            uint64_t v26 = v24;
            unint64_t v25 = v45;
            goto LABEL_16;
          default:
            v54[0] = v24;
            unint64_t v25 = v45;
            LODWORD(v54[1]) = v45;
            WORD2(v54[1]) = WORD2(v45);
            sub_100036690();
            uint64_t v26 = v24;
LABEL_16:
            sub_10000C9BC(v26, v25);
            break;
        }
        sub_1000366A0();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v5);
        sub_10000C9BC(v24, v25);
        sub_100022D3C(&qword_100044BF0, (void (*)(uint64_t))&type metadata accessor for SHA256Digest);
        unint64_t v31 = v50;
        sub_1000366D0();
        if (v44)
        {
          if (v44 == 1)
          {
            uint64_t v32 = (int)a1;
            uint64_t v33 = a1 >> 32;
          }
          else
          {
            uint64_t v32 = *(void *)(a1 + 16);
            uint64_t v33 = *(void *)(a1 + 24);
          }
        }
        else
        {
          uint64_t v32 = 0;
          uint64_t v33 = BYTE6(a2);
        }
        if (v33 < 7 || v33 < v32)
        {
          __break(1u);
LABEL_35:
          swift_release();
          swift_release();
          __break(1u);
          JUMPOUT(0x100021D6CLL);
        }
        uint64_t v34 = sub_1000361D0();
        uint64_t v35 = v47;
        uint64_t v37 = sub_100022040(v34, v36);
        if (v35)
        {
          (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v46);
          sub_10000C9BC(v52, v53);
        }
        else
        {
          uint64_t v39 = v37;
          unint64_t v40 = v38;
          a1 = sub_100036670();
          (*(void (**)(char *, uint64_t))(v51 + 8))(v31, v46);
          sub_10000C9BC(v52, v53);
          sub_10000C9BC(v39, v40);
        }
      }
      else
      {
LABEL_11:
        sub_10000C9BC(v12, v13);
        sub_10000CA14(a1, a2);
      }
      return a1;
  }
}

uint64_t sub_100021D8C(uint64_t a1, unint64_t a2)
{
  v28[3] = &type metadata for Data;
  v28[4] = &protocol witness table for Data;
  v28[0] = a1;
  v28[1] = a2;
  unsigned int v4 = sub_1000067C4(v28, (uint64_t)&type metadata for Data);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_10000CA14(a1, a2);
      sub_10000CA14(v5, v6);
      uint64_t v8 = (unsigned char *)sub_1000360F0();
      if (v8)
      {
        uint64_t v9 = sub_100036110();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_100036100();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = 0;
      }
      sub_100022620(v8, v13, &v27);
      sub_10000C9BC(v5, v6);
LABEL_27:
      sub_10000C9BC(a1, a2);
      uint64_t v24 = v27;
      sub_10000685C((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_10000CA14(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)sub_1000360F0();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_100036110();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_100036100();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      char v22 = &v16[v21];
      if (v16) {
        unint64_t v23 = v22;
      }
      else {
        unint64_t v23 = 0;
      }
      sub_100022620(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_10000CA14(a1, a2);
      BOOL v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_10000CA14(a1, a2);
      BOOL v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_100022620(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t sub_100022040(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x10002218CLL);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 > 27) {
        return sub_100021D8C(a1, a2);
      }
LABEL_7:
      uint64_t v8 = sub_100036680();
      sub_100022D3C(&qword_100044BF8, (void (*)(uint64_t))&type metadata accessor for CryptoKitError);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, enum case for CryptoKitError.incorrectParameterSize(_:), v8);
      swift_willThrow();
      return sub_10000C9BC(a1, a2);
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t sub_10002219C()
{
  unint64_t result = sub_1000221C0();
  qword_100044BD8 = result;
  unk_100044BE0 = v1;
  return result;
}

unint64_t sub_1000221C0()
{
  uint64_t v0 = sub_1000368B0();
  if (!v1)
  {
    uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_100022CA0((uint64_t)v4);
    swift_bridgeObjectRelease();
    return v10;
  }
  unint64_t v2 = v0;
  unint64_t v3 = v1;
  uint64_t v4 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    if (v2 == 2573 && v3 == 0xE200000000000000 || (sub_100036E10() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v5) = 10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_6;
    }
    if (sub_100036720())
    {
      unint64_t result = sub_10001E820(v2, v3);
      if ((result & 0x100000000) != 0) {
        goto LABEL_23;
      }
      if ((result & 0xFFFFFF80) == 0) {
        break;
      }
    }
    swift_bridgeObjectRelease();
    LOBYTE(v5) = 0;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_19:
    }
      uint64_t v4 = sub_10000AA28(0, *((void *)v4 + 2) + 1, 1, v4);
LABEL_6:
    unint64_t v7 = *((void *)v4 + 2);
    unint64_t v6 = *((void *)v4 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v4 = sub_10000AA28((char *)(v6 > 1), v7 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v7 + 1;
    v4[v7 + 32] = v5;
    unint64_t v2 = sub_1000368B0();
    unint64_t v3 = v8;
    if (!v8) {
      goto LABEL_21;
    }
  }
  unint64_t result = sub_10001E820(v2, v3);
  if ((result & 0x100000000) != 0) {
    goto LABEL_24;
  }
  int v5 = result;
  unint64_t result = swift_bridgeObjectRelease();
  if ((v5 & 0xFFFFFF00) == 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_6;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_1000223AC@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  unint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_10000CA14(a2, a3);
      uint64_t v10 = (char *)sub_1000360F0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_100036110();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_100036100();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x100022610);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_10000C9BC(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_1000360F0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_100036110();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_100036100();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

unsigned char *sub_100022620@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_100027088(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_100022BA0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_100022C1C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_100022698(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000360F0();
  if (!result || (uint64_t result = sub_100036110(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_100036100();
      sub_1000366F0();
      sub_100022D3C(&qword_100044BE8, (void (*)(uint64_t))&type metadata accessor for SHA256);
      return sub_100036690();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100022778(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1000223AC((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_100022850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1000360F0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_100036110();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_100036100();
  sub_1000223AC(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_100022908(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x100022B70);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_10000CA14(a3, a4);
                  sub_10000CA14(a1, a2);
                  char v17 = sub_100022850((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_10000C9BC(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_10000CA14(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_100022850(v21, v22, v20, a3, a4);
                  sub_10000C9BC(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_10000CA14(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_10000CA14(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_100022778(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_10000C9BC(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_100022BA0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_100036120();
  swift_allocObject();
  uint64_t result = sub_1000360E0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1000361C0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_100022C1C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_100036120();
  swift_allocObject();
  uint64_t result = sub_1000360E0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_100022CA0(uint64_t a1)
{
  uint64_t v9 = sub_100006780(&qword_100044C00);
  unint64_t v10 = sub_100022D84();
  v8[0] = a1;
  uint64_t v2 = sub_1000067C4(v8, v9);
  unint64_t v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_100022620(v3, v4, &v7);
  uint64_t v5 = v7;
  sub_10000685C((uint64_t)v8);
  return v5;
}

uint64_t sub_100022D3C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100022D84()
{
  unint64_t result = qword_100044C08;
  if (!qword_100044C08)
  {
    sub_100006458(&qword_100044C00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044C08);
  }
  return result;
}

uint64_t sub_100022DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10000CA6C;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100022E90(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100044C38 + dword_100044C38);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000094C0;
  return v5(a1);
}

uint64_t sub_100022F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100010624;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_10002301C(uint64_t a1)
{
  unint64_t v2 = sub_100023180();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000230C4()
{
  unint64_t result = qword_100044C10[0];
  if (!qword_100044C10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100044C10);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateEvolutionPlugin()
{
  return &type metadata for PrivateEvolutionPlugin;
}

uint64_t sub_10002312C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100023180()
{
  unint64_t result = qword_100044C30;
  if (!qword_100044C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044C30);
  }
  return result;
}

uint64_t sub_1000231D4(uint64_t a1)
{
  v1[8] = a1;
  uint64_t v2 = sub_1000363E0();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = sub_100036430();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_1000232F0, 0, 0);
}

uint64_t sub_1000232F0()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  sub_100006780(&qword_100044C40);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000384B0;
  sub_100036420();
  sub_100036410();
  v0[7] = v4;
  sub_100023780(&qword_100044C48, (void (*)(uint64_t))&type metadata accessor for PFLPluginConsent);
  sub_100006780(&qword_100044C50);
  sub_100023724();
  sub_100036B80();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for PFLTaskSource.CKProd(_:), v2);
  sub_1000364F0();
  swift_allocObject();
  v0[15] = sub_1000364E0();
  uint64_t v5 = type metadata accessor for PrivateEvolutionPluginRunner();
  uint64_t v6 = (void *)swift_allocObject();
  v0[16] = v6;
  void v6[2] = 0xD000000000000037;
  v6[3] = 0x800000010003A0A0;
  v6[4] = 0xD000000000000016;
  v6[5] = 0x8000000100038820;
  v0[5] = v5;
  uint64_t v7 = sub_100023780(&qword_100044C60, (void (*)(uint64_t))type metadata accessor for PrivateEvolutionPluginRunner);
  v0[2] = v6;
  v0[6] = v7;
  BOOL v11 = (char *)&async function pointer to dispatch thunk of PFLPlugin.run(context:runner:)
      + async function pointer to dispatch thunk of PFLPlugin.run(context:runner:);
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[17] = v8;
  void *v8 = v0;
  v8[1] = sub_10002358C;
  uint64_t v9 = v0[8];
  return ((uint64_t (*)(uint64_t, void *))v11)(v9, v0 + 2);
}

uint64_t sub_10002358C(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 144) = a1;
  swift_task_dealloc();
  sub_10000685C(v2);
  return _swift_task_switch(sub_100023698, 0, 0);
}

uint64_t sub_100023698()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 144);
  return v1(v2);
}

unint64_t sub_100023724()
{
  unint64_t result = qword_100044C58;
  if (!qword_100044C58)
  {
    sub_100006458(&qword_100044C50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044C58);
  }
  return result;
}

uint64_t sub_100023780(unint64_t *a1, void (*a2)(uint64_t))
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

int64_t sub_1000237C8(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0;
    }
    if (v2 >= v3) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002380C(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 16);
    if ((uint64_t)v3 >= result) {
      unint64_t v4 = result;
    }
    else {
      unint64_t v4 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v3 >= v5)
    {
      sub_100036590();
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000238A0(Swift::Int a1, unint64_t a2)
{
  sub_100036880();
  uint64_t v4 = sub_100036A20();
  uint64_t v13 = v4;
  uint64_t v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  v12[2] = a1;
  uint64_t v12[3] = a2;
  void v12[4] = 0;
  v12[5] = v5;
  uint64_t v6 = sub_1000368B0();
  if (v7)
  {
    Swift::Int v8 = v6;
    Swift::Int v9 = v7;
    do
    {
      sub_100025B0C(v12, v8, v9);
      swift_bridgeObjectRelease();
      Swift::Int v8 = sub_1000368B0();
      Swift::Int v9 = v10;
    }
    while (v10);
    uint64_t v4 = v13;
  }
  swift_bridgeObjectRelease();
  return v4;
}

BOOL sub_100023960(char *a1, char *a2)
{
  return qword_100038A80[*a1] == qword_100038A80[*a2];
}

Swift::Int sub_100023984()
{
  uint64_t v1 = *v0;
  sub_100036EB0();
  sub_100036EC0(qword_100038A80[v1]);
  return sub_100036ED0();
}

void sub_1000239D4()
{
  sub_100036EC0(qword_100038A80[*v0]);
}

Swift::Int sub_100023A0C()
{
  uint64_t v1 = *v0;
  sub_100036EB0();
  sub_100036EC0(qword_100038A80[v1]);
  return sub_100036ED0();
}

uint64_t sub_100023A58@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000271E4(*a1);
  *a2 = result;
  return result;
}

void sub_100023A84(void *a1@<X8>)
{
  *a1 = qword_100038A80[*v1];
}

uint64_t sub_100023A9C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10002E65C();
  unint64_t v5 = sub_10002E6B0();

  return Error<>._code.getter(a1, a2, v4, v5);
}

uint64_t sub_100023AF4(uint64_t __src, uint64_t a2)
{
  if (__src)
  {
    if ((unint64_t)(a2 - 0x2000000000000000) >> 62 == 3)
    {
      uint64_t v3 = 4 * a2;
      if (4 * a2)
      {
        if (v3 <= 14)
        {
          return sub_100027088((unsigned char *)__src, (unsigned char *)(__src + v3));
        }
        else
        {
          sub_100036120();
          swift_allocObject();
          sub_1000360E0();
          if ((unint64_t)v3 >= 0x7FFFFFFF)
          {
            sub_1000361C0();
            __src = swift_allocObject();
            *(void *)(__src + 16) = 0;
            *(void *)(__src + 24) = v3;
          }
          else
          {
            return a2 << 34;
          }
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      __break(1u);
    }
  }
  return __src;
}

uint64_t sub_100023BCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_10000AFFC(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  Swift::Int v9 = (char *)v3 + 4 * v8 + 32;
  if (a1 + 32 < (unint64_t)&v9[4 * v2] && (unint64_t)v9 < a1 + 32 + 4 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 4 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_100023D14(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_100036590();
    return a2;
  }
  return result;
}

unint64_t sub_100023D9C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100006780(&qword_100044880);
    uint64_t v2 = (void *)sub_100036C60();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v6 = &v37;
  Swift::Int v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  Swift::Int v10 = &qword_100044750;
  uint64_t v11 = (char *)&type metadata for Any + 8;
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
          sub_10002E1B8();
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
    char v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100006780(v10);
    swift_dynamicCast();
    sub_1000155C8(v6, v7);
    sub_1000155C8(v7, v40);
    sub_1000155C8(v40, &v38);
    unint64_t result = sub_10001172C(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      BOOL v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      uint64_t v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v17 = v35;
      v17[1] = v36;
      Swift::Int v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      Swift::Int v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_10000685C((uint64_t)v18);
      unint64_t result = (unint64_t)sub_1000155C8(&v38, v18);
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
    char v27 = (uint64_t *)(v2[6] + 16 * result);
    *char v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_1000155C8(&v38, (_OWORD *)(v2[7] + 32 * result));
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

uint64_t sub_100024108()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for PrivateEvolutionPluginRunner()
{
  return self;
}

void sub_10002416C()
{
}

uint64_t sub_100024184()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100044DF8 + dword_100044DF8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000094C0;
  return v3();
}

uint64_t sub_100024224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100044DA0 + dword_100044DA0);
  Swift::Int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *Swift::Int v7 = v3;
  v7[1] = sub_1000242E4;
  return v9(a1, a2, a3);
}

uint64_t sub_1000242E4(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

id sub_1000243E4(uint64_t a1, uint64_t a2)
{
  sub_10000C980(0, &qword_100044DC0);
  Class isa = sub_100036950().super.isa;
  swift_bridgeObjectRelease();
  id v9 = 0;
  id v5 = [v2 initWithShape:isa dataType:a2 error:&v9];

  if (v5)
  {
    id v6 = v9;
  }
  else
  {
    id v7 = v9;
    sub_100036130();

    swift_willThrow();
  }
  return v5;
}

id sub_1000244E0()
{
  Class isa = sub_100036700().super.isa;
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithDictionary:isa error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_100036130();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1000245C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100024668(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_1000245E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000247C8(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_100024608(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100024928(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_100024628(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100024AAC(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_100024648(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100024C34(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_100024668(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006780(&qword_1000446E8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_1000247C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006780(&qword_100044E08);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_100024928(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006780(&qword_100044708);
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
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_100024AAC(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006780(&qword_100044DF0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_100024C34(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006780(&qword_100044688);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

uint64_t sub_100024DA0(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100006780(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (char *)v16 + v20;
  int64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  char v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_100036C70();
  __break(1u);
  return result;
}

void *sub_100024FE8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    if (v5 <= 0)
    {
      uint64_t v8 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        unint64_t v10 = a2 + 24 * a3;
        if (v10 < (unint64_t)&v8[3 * v5 + 4] && (unint64_t)(v8 + 4) < v10 + 24 * v5) {
          goto LABEL_17;
        }
        swift_arrayInitWithCopy();
        return v8;
      }
    }
    else
    {
      sub_100006780(&qword_100044DF0);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size(v8);
      v8[2] = v5;
      void v8[3] = 2 * ((uint64_t)(v9 - 32) / 24);
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  uint64_t result = (void *)sub_100036C70();
  __break(1u);
  return result;
}

void *sub_100025178(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100006780(&qword_100044688);
  id v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_10002590C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10002E1B8();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_100025260(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  if (v5 <= 0)
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(sub_100036590() - 8);
      unint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      uint64_t v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_100006780(&qword_100044718);
  uint64_t v8 = *(void *)(sub_100036590() - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (void *)swift_allocObject();
  size_t v12 = j__malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    _OWORD v11[2] = v5;
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
  uint64_t result = (void *)sub_100036C70();
  __break(1u);
  return result;
}

void sub_1000254A0()
{
  uint64_t v1 = *v0;
  unint64_t v2 = *(void *)(*v0 + 16);
  unint64_t v3 = v2 - 2;
  if (v2 >= 2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      swift_stdlib_random();
      uint64_t v6 = (0 * (unsigned __int128)v2) >> 64;
      if (v2)
      {
        if (-(uint64_t)v2 % v2)
        {
          while (1)
            swift_stdlib_random();
        }
      }
      unint64_t v8 = v4 + v6;
      if (__OFADD__(v4, v6)) {
        break;
      }
      if (v4 != v8)
      {
        unint64_t v9 = *(void *)(v1 + 16);
        if (v4 >= v9) {
          goto LABEL_18;
        }
        if (v8 >= v9) {
          goto LABEL_19;
        }
        uint64_t v10 = v1 + 32 + 24 * v4;
        long long v19 = *(_OWORD *)v10;
        uint64_t v11 = *(void *)(v10 + 16);
        size_t v12 = (uint64_t *)(v1 + 32 + 24 * v8);
        uint64_t v14 = *v12;
        uint64_t v13 = v12[1];
        uint64_t v15 = v12[2];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v1 = sub_100027030(v1);
        }
        if (v4 >= *(void *)(v1 + 16)) {
          goto LABEL_20;
        }
        uint64_t v16 = (void *)(v1 + 32 + 24 * v4);
        *uint64_t v16 = v14;
        v16[1] = v13;
        v16[2] = v15;
        swift_bridgeObjectRelease();
        if (v8 >= *(void *)(v1 + 16)) {
          goto LABEL_21;
        }
        uint64_t v17 = v1 + 32 + 24 * v8;
        *(_OWORD *)uint64_t v17 = v19;
        *(void *)(v17 + 16) = v11;
        swift_bridgeObjectRelease();
        *uint64_t v18 = v1;
      }
      --v2;
      if (v4++ == v3) {
        return;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
}

uint64_t sub_100025654()
{
  uint64_t v1 = sub_100036590();
  uint64_t v29 = *(void *)(v1 - 8);
  uint64_t v2 = __chkstk_darwin(v1);
  int64_t v33 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v2);
  uint64_t v32 = (char *)&v25 - v5;
  uint64_t v6 = (char *)*v0;
  unint64_t v7 = *(void *)(*v0 + 16);
  unint64_t v8 = v7 - 2;
  if (v7 >= 2)
  {
    unint64_t v9 = 0;
    unint64_t v26 = v7 - 2;
    char v27 = v0;
    uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v29 + 40);
    while (1)
    {
      unint64_t v34 = 0;
      uint64_t result = swift_stdlib_random();
      uint64_t v11 = (v34 * (unsigned __int128)v7) >> 64;
      if (v7 > v34 * v7)
      {
        unint64_t v12 = -(uint64_t)v7 % v7;
        if (v12 > v34 * v7)
        {
          do
          {
            unint64_t v34 = 0;
            uint64_t result = swift_stdlib_random();
          }
          while (v12 > v34 * v7);
          uint64_t v11 = (v34 * (unsigned __int128)v7) >> 64;
        }
      }
      unint64_t v13 = v9 + v11;
      if (__OFADD__(v9, v11)) {
        break;
      }
      if (v9 != v13)
      {
        unint64_t v14 = *((void *)v6 + 2);
        if (v9 >= v14) {
          goto LABEL_20;
        }
        uint64_t v15 = v1;
        unint64_t v31 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
        uint64_t v16 = &v6[v31];
        uint64_t v17 = *(void *)(v29 + 72);
        uint64_t v30 = v17 * v9;
        uint64_t v18 = *(uint64_t (**)(char *, char *, uint64_t))(v29 + 16);
        uint64_t result = v18(v32, &v6[v31 + v17 * v9], v15);
        if (v13 >= v14) {
          goto LABEL_21;
        }
        uint64_t v19 = v17 * v13;
        v18(v33, &v16[v17 * v13], v15);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v21 = v27;
        *char v27 = (uint64_t)v6;
        uint64_t v1 = v15;
        if (isUniquelyReferenced_nonNull_native)
        {
          int64_t v22 = v28;
          uint64_t result = (uint64_t)v6;
        }
        else
        {
          uint64_t result = sub_100027044(v6);
          *unint64_t v21 = result;
          int64_t v22 = v28;
        }
        unint64_t v23 = v31;
        if (v9 >= *(void *)(result + 16)) {
          goto LABEL_22;
        }
        char v24 = *v22;
        uint64_t result = (*v22)(result + v31 + v30, v33, v1);
        if (v13 >= *(void *)(*v21 + 16)) {
          goto LABEL_23;
        }
        uint64_t result = v24(*v21 + v23 + v19, v32, v1);
        uint64_t v6 = (char *)*v21;
        unint64_t v8 = v26;
      }
      --v7;
      if (v9++ == v8) {
        return result;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
  return result;
}

uint64_t sub_10002590C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    void v5[3] = v12;
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
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

uint64_t sub_100025B0C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  unint64_t v4 = v3;
  uint64_t v8 = *v3;
  sub_100036EB0();
  sub_100036730();
  Swift::Int v9 = sub_100036ED0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v11 = v9 & ~v10;
  uint64_t v12 = v8 + 56;
  if ((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
  {
    uint64_t v13 = *(void *)(v8 + 48);
    int64_t v14 = (void *)(v13 + 16 * v11);
    BOOL v15 = *v14 == a2 && v14[1] == a3;
    if (v15 || (sub_100036E10() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      unint64_t v16 = (Swift::Int *)(*(void *)(*v4 + 48) + 16 * v11);
      Swift::Int v17 = v16[1];
      *a1 = *v16;
      a1[1] = v17;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v19 = ~v10;
    while (1)
    {
      unint64_t v11 = (v11 + 1) & v19;
      if (((*(void *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        break;
      }
      unint64_t v20 = (void *)(v13 + 16 * v11);
      BOOL v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (sub_100036E10() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000263FC(a2, a3, v11, isUniquelyReferenced_nonNull_native);
  *unint64_t v4 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100025C9C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100036EB0();
  swift_bridgeObjectRetain();
  sub_100036870();
  Swift::Int v8 = sub_100036ED0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100036E10() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100036E10() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100026598(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100025E4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006780(&qword_100044E00);
  uint64_t result = sub_100036BA0();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v29 = (void *)(v2 + 56);
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
                  *uint64_t v29 = -1 << v28;
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
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      sub_100036EB0();
      sub_100036730();
      uint64_t result = sub_100036ED0();
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
      *uint64_t v12 = v19;
      v12[1] = v20;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_10002611C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006780(&qword_100044B48);
  uint64_t v3 = sub_100036BA0();
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100036EB0();
      sub_100036870();
      uint64_t result = sub_100036ED0();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_1000263FC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100025E4C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100026734();
      goto LABEL_22;
    }
    sub_100026A9C();
  }
  uint64_t v11 = *v4;
  sub_100036EB0();
  sub_100036730();
  uint64_t result = sub_100036ED0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100036E10(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100036E30();
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
          uint64_t result = sub_100036E10();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

Swift::Int sub_100026598(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10002611C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_1000268E8();
      goto LABEL_22;
    }
    sub_100026D3C();
  }
  uint64_t v11 = *v4;
  sub_100036EB0();
  sub_100036870();
  uint64_t result = sub_100036ED0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100036E10(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100036E30();
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
          uint64_t result = sub_100036E10();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_100026734()
{
  uint64_t v1 = v0;
  sub_100006780(&qword_100044E00);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100036B90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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

void *sub_1000268E8()
{
  uint64_t v1 = v0;
  sub_100006780(&qword_100044B48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100036B90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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

uint64_t sub_100026A9C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006780(&qword_100044E00);
  uint64_t result = sub_100036BA0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
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
      goto LABEL_23;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    if (v15 >= v28) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v28) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v28) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16)
        {
          int64_t v17 = v15 + 3;
          if (v17 >= v28)
          {
LABEL_32:
            uint64_t result = swift_release();
            uint64_t v1 = v0;
            goto LABEL_34;
          }
          unint64_t v16 = *(void *)(v6 + 8 * v17);
          int64_t v5 = v17;
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_23:
    uint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_100036EB0();
    sub_100036730();
    uint64_t result = sub_100036ED0();
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
          goto LABEL_35;
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
    *unint64_t v12 = v20;
    v12[1] = v19;
    ++*(void *)(v4 + 16);
    uint64_t result = swift_bridgeObjectRetain();
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v28) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100026D3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006780(&qword_100044B48);
  uint64_t v3 = sub_100036BA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    sub_100036EB0();
    swift_bridgeObjectRetain();
    sub_100036870();
    uint64_t result = sub_100036ED0();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
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

uint64_t sub_100026FEC(void *a1)
{
  return sub_100024DA0(0, a1[2], 0, a1, &qword_100044710, (uint64_t (*)(void))type metadata accessor for ExtractedMessage);
}

uint64_t sub_100027030(uint64_t a1)
{
  return sub_100024AAC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100027044(void *a1)
{
  return sub_100024DA0(0, a1[2], 0, a1, &qword_100044718, (uint64_t (*)(void))&type metadata accessor for ZeoliteEmbedding);
}

uint64_t sub_100027088(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_10002714C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100036A20();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100025C9C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1000271E4(uint64_t a1)
{
  uint64_t v1 = a1 - 9701;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
      uint64_t result = 0;
      break;
    case 1:
      return result;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      uint64_t result = 3;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 6;
      break;
    case 7:
      uint64_t result = 7;
      break;
    case 8:
      uint64_t result = 8;
      break;
    case 9:
      uint64_t result = 9;
      break;
    case 49:
      uint64_t result = 10;
      break;
    case 50:
      uint64_t result = 11;
      break;
    case 51:
      uint64_t result = 12;
      break;
    case 52:
      uint64_t result = 13;
      break;
    case 53:
      uint64_t result = 14;
      break;
    case 54:
      uint64_t result = 15;
      break;
    case 55:
      uint64_t result = 16;
      break;
    case 56:
      uint64_t result = 17;
      break;
    default:
      uint64_t result = 18;
      break;
  }
  return result;
}

uint64_t sub_10002738C()
{
  sub_100006780(&qword_100044658);
  v0[3] = swift_task_alloc();
  v0[4] = type metadata accessor for EmailExtractor();
  v0[5] = swift_task_alloc();
  return _swift_task_switch(sub_10002744C, 0, 0);
}

uint64_t sub_10002744C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  *(unsigned char *)(v0 + 64) = 1;
  uint64_t v3 = v2 + *(int *)(v1 + 20);
  uint64_t v4 = sub_100036250();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_OWORD *)uint64_t v2 = xmmword_1000388E0;
  *(void *)(v2 + 16) = 2048;
  *(_WORD *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 26) = 0;
  *(void *)(v2 + 32) = 0;
  *(unsigned char *)(v2 + 40) = *(unsigned char *)(v0 + 64);
  *(void *)(v2 + 48) = 1;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 80) = 0;
  *(void *)(v2 + 88) = 0;
  *(void *)(v2 + 96) = 0;
  *(unsigned char *)(v2 + 104) = 0;
  *(void *)(v2 + 112) = 0;
  *(void *)(v2 + 120) = 0;
  Swift::Int v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  *Swift::Int v5 = v0;
  v5[1] = sub_100027588;
  uint64_t v6 = *(void *)(v0 + 24);
  return sub_100015E60(v6, v0 + 65);
}

uint64_t sub_100027588(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *(void *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();
  sub_100018F84(v2);
  return _swift_task_switch(sub_1000276A8, 0, 0);
}

uint64_t sub_1000276A8()
{
  int v1 = *(unsigned __int8 *)(v0 + 65);
  if (v1 != 9)
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1000365C0();
    sub_100007D00(v2, (uint64_t)qword_1000488A0);
    uint64_t v3 = sub_1000365A0();
    os_log_type_t v4 = sub_100036AA0();
    if (os_log_type_enabled(v3, v4))
    {
      Swift::Int v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      *(_DWORD *)Swift::Int v5 = 138412290;
      sub_100021490();
      swift_allocError();
      *Swift::Int v7 = v1;
      uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 16) = v8;
      sub_100036B00();
      *uint64_t v6 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to extract emails with error %@.", v5, 0xCu);
      sub_100006780(&qword_100044740);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  uint64_t v9 = *(void *)(v0 + 56);
  if (v9)
  {
    uint64_t v10 = *(void *)(v9 + 16);
    swift_bridgeObjectRelease();
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  sub_10002E414(*(void *)(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v12 = *(uint64_t (**)(BOOL))(v0 + 8);
  return v12(v11);
}

id sub_1000278B4(uint64_t a1, uint64_t a2)
{
  sub_100036150(__stack_chk_guard);
  Swift::Int v5 = v4;
  id v14 = 0;
  id v6 = [(id)swift_getObjCClassFromMetadata() modelWithContentsOfURL:v4 configuration:a2 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = sub_100036190();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    sub_100036130();

    swift_willThrow();
    uint64_t v12 = sub_100036190();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint8_t *sub_100027A14(void *a1)
{
  uint64_t v3 = sub_100036190();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  id v10 = (char *)&v56 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  unint64_t v59 = (char *)&v56 - v12;
  __chkstk_darwin(v11);
  id v14 = (char *)&v56 - v13;
  id v15 = [objc_allocWithZone((Class)MLModelConfiguration) init];
  [v15 setComputeUnits:0];
  sub_10000C980(0, &qword_100044DD8);
  uint64_t v61 = (uint8_t *)v3;
  uint64_t v62 = v4;
  int64_t v16 = *(void (**)(char *, void *, uint8_t *))(v4 + 16);
  uint64_t v60 = a1;
  unint64_t v17 = a1;
  int64_t v18 = v16;
  v16(v14, v17, (uint8_t *)v3);
  id v19 = v15;
  uint64_t v20 = (char *)sub_1000278B4((uint64_t)v14, (uint64_t)v19);
  if (v1)
  {
    id v58 = v19;

    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1000365C0();
    sub_100007D00(v21, (uint64_t)qword_1000488A0);
    uint64_t v22 = v59;
    unint64_t v23 = v61;
    v18(v59, v60, v61);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v24 = sub_1000365A0();
    os_log_type_t v25 = sub_100036AA0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v57 = (void *)swift_slowAlloc();
      uint64_t v60 = (void *)swift_slowAlloc();
      id v64 = v60;
      *(_DWORD *)uint64_t v26 = 136315394;
      sub_10002E1C0();
      uint64_t v27 = sub_100036DF0();
      uint64_t v63 = sub_10000B1D4(v27, v28, (uint64_t *)&v64);
      sub_100036B00();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint8_t *))(v62 + 8))(v22, v23);
      *(_WORD *)(v26 + 12) = 2112;
      swift_errorRetain();
      uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v63 = v29;
      sub_100036B00();
      *uint64_t v57 = v29;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Model init failed for %s with error: %@.", (uint8_t *)v26, 0x16u);
      sub_100006780(&qword_100044740);
      swift_arrayDestroy();
      swift_slowDealloc();
      unint64_t v23 = (uint8_t *)v60;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint8_t *))(v62 + 8))(v22, v23);
      swift_errorRelease();
      swift_errorRelease();
    }

    sub_10001DA38();
    swift_allocError();
    *uint64_t v36 = 5;
    swift_willThrow();
    swift_errorRelease();
  }
  else
  {
    uint64_t v30 = v20;
    unint64_t v23 = (uint8_t *)v7;

    if (v30 && (unint64_t v31 = [v30 program]) != 0)
    {
      uint64_t v32 = v31;
      id v33 = objc_allocWithZone((Class)MLProgramTrainer);
      id v64 = 0;
      swift_unknownObjectRetain();
      unint64_t v34 = (uint8_t *)[v33 initWithProgram:v32 learningRate:&v64 error:0.0];
      if (v34)
      {
        unint64_t v23 = v34;
        id v35 = v64;

        swift_unknownObjectRelease_n();
      }
      else
      {
        id v45 = v64;
        sub_100036130();

        swift_willThrow();
        uint64_t v57 = v32;
        swift_unknownObjectRelease();
        if (qword_100044478 != -1) {
          swift_once();
        }
        uint64_t v46 = sub_1000365C0();
        sub_100007D00(v46, (uint64_t)qword_1000488A0);
        uint64_t v47 = v10;
        unint64_t v23 = v61;
        v18(v10, v60, v61);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v48 = sub_1000365A0();
        os_log_type_t v49 = sub_100036AA0();
        if (os_log_type_enabled(v48, v49))
        {
          uint64_t v50 = swift_slowAlloc();
          unint64_t v59 = v30;
          uint64_t v51 = v50;
          uint64_t v56 = (void *)swift_slowAlloc();
          uint64_t v60 = (void *)swift_slowAlloc();
          id v64 = v60;
          *(_DWORD *)uint64_t v51 = 136315394;
          sub_10002E1C0();
          uint64_t v52 = sub_100036DF0();
          uint64_t v63 = sub_10000B1D4(v52, v53, (uint64_t *)&v64);
          id v58 = v19;
          sub_100036B00();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint8_t *))(v62 + 8))(v47, v23);
          *(_WORD *)(v51 + 12) = 2112;
          swift_errorRetain();
          uint64_t v54 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v63 = v54;
          id v19 = v58;
          sub_100036B00();
          *uint64_t v56 = v54;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v48, v49, "ML program trainer init failed for %s: %@.", (uint8_t *)v51, 0x16u);
          sub_100006780(&qword_100044740);
          swift_arrayDestroy();
          swift_slowDealloc();
          unint64_t v23 = (uint8_t *)v60;
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v30 = v59;
          swift_slowDealloc();
        }
        else
        {
          (*(void (**)(char *, uint8_t *))(v62 + 8))(v47, v23);
          swift_errorRelease();
          swift_errorRelease();
        }

        sub_10001DA38();
        swift_allocError();
        *unint64_t v55 = 6;
        swift_willThrow();
        swift_errorRelease();

        swift_unknownObjectRelease();
      }
    }
    else
    {
      unint64_t v59 = v30;
      if (qword_100044478 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_1000365C0();
      sub_100007D00(v37, (uint64_t)qword_1000488A0);
      long long v38 = v61;
      v18(v7, v60, v61);
      uint64_t v39 = sub_1000365A0();
      os_log_type_t v40 = sub_100036AA0();
      if (os_log_type_enabled(v39, v40))
      {
        unint64_t v23 = (uint8_t *)swift_slowAlloc();
        id v64 = (id)swift_slowAlloc();
        *(_DWORD *)unint64_t v23 = 136315138;
        id v58 = v19;
        sub_10002E1C0();
        uint64_t v41 = sub_100036DF0();
        uint64_t v63 = sub_10000B1D4(v41, v42, (uint64_t *)&v64);
        id v19 = v58;
        sub_100036B00();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint8_t *))(v62 + 8))(v7, v38);
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "No ML program found for %s.", v23, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint8_t *))(v62 + 8))(v7, v38);
      }

      sub_10001DA38();
      swift_allocError();
      *uint64_t v43 = 6;
      swift_willThrow();
    }
  }
  return v23;
}

id sub_1000283F4(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v90 = a7;
  uint64_t v101 = a6;
  uint64_t v100 = a5;
  uint64_t v97 = a4;
  uint64_t v96 = a3;
  uint64_t v110 = a2;
  uint64_t v95 = sub_100036140();
  uint64_t v93 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v94 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006780(&qword_100044908);
  __chkstk_darwin(v11 - 8);
  uint64_t v91 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100036190();
  uint64_t v98 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v92 = (char *)&v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v99 = (char *)&v88 - v16;
  unint64_t v112 = (unint64_t)_swiftEmptyArrayStorage;
  if (qword_100044478 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1000365C0();
  uint64_t v102 = sub_100007D00(v17, (uint64_t)qword_1000488A0);
  int64_t v18 = sub_1000365A0();
  os_log_type_t v19 = sub_100036A80();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Producing MLBatchProvider for training.", v20, 2u);
    swift_slowDealloc();
  }

  uint64_t v21 = sub_100006780(&qword_100044728);
  uint64_t v22 = swift_allocObject();
  long long v108 = xmmword_1000382F0;
  *(_OWORD *)(v22 + 16) = xmmword_1000382F0;
  uint64_t v23 = *(void *)(a1 + 16);
  *(NSNumber *)(v22 + 32) = sub_100036A30();
  unint64_t v24 = v110;
  *(NSNumber *)(v22 + 40) = sub_100036A30();
  v113[0] = (id)v22;
  sub_100036980();
  uint64_t v25 = (uint64_t)v113[0];
  id v26 = objc_allocWithZone((Class)MLMultiArray);
  id v27 = sub_1000243E4(v25, 65568);
  if (!v8)
  {
    id v106 = v27;
    uint64_t v89 = 0;
    uint64_t v88 = v13;
    if (v23)
    {
      uint64_t v28 = v23;
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)(sub_100036590() - 8);
      uint64_t v105 = a1 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
      uint64_t v104 = *(void *)(v30 + 72);
      unint64_t v31 = &qword_100044DC0;
      uint64_t v32 = NSNumber_ptr;
      uint64_t v103 = v28;
      while (1)
      {
        uint64_t v33 = sub_100036560();
        unint64_t v34 = *(char **)(v33 + 16);
        if (v34 != v24) {
          break;
        }
        uint64_t v107 = v33;
        id v35 = v106;
        if (v24)
        {
          uint64_t v36 = 0;
          uint64_t v109 = (uint8_t *)(v107 + 32);
          do
          {
            uint64_t v37 = v36 + 1;
            long long v38 = v35;
            uint64_t v39 = swift_allocObject();
            *(_OWORD *)(v39 + 16) = v108;
            *(NSNumber *)(v39 + 32) = sub_100036A30();
            *(NSNumber *)(v39 + 40) = sub_100036A30();
            v113[0] = (id)v39;
            sub_100036980();
            Class isa = sub_100036A00().super.super.isa;
            sub_10000C980(0, v31);
            uint64_t v41 = v29;
            unint64_t v42 = v32;
            uint64_t v43 = v21;
            unint64_t v44 = v31;
            Class v45 = sub_100036950().super.isa;
            id v35 = v38;
            swift_bridgeObjectRelease();
            [v38 setObject:isa forKeyedSubscript:v45];

            unint64_t v31 = v44;
            uint64_t v21 = v43;
            uint64_t v32 = v42;
            uint64_t v29 = v41;
            uint64_t v36 = v37;
            BOOL v46 = v110 == v37;
            unint64_t v24 = v110;
          }
          while (!v46);
        }
        ++v29;
        swift_bridgeObjectRelease();
        if (v29 == v103) {
          goto LABEL_15;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v73 = sub_1000365A0();
      os_log_type_t v74 = sub_100036AA0();
      if (os_log_type_enabled(v73, v74))
      {
        uint64_t v75 = swift_slowAlloc();
        *(_DWORD *)uint64_t v75 = 134218240;
        v113[0] = v110;
        sub_100036B00();
        *(_WORD *)(v75 + 12) = 2048;
        swift_bridgeObjectRelease();
        v113[0] = v34;
        sub_100036B00();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v73, v74, "Wrong embedding size: expected %ld, actual %ld.", (uint8_t *)v75, 0x16u);
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      id v7 = v106;
      sub_10001DA38();
      swift_allocError();
      *uint64_t v77 = 3;
      swift_willThrow();
    }
    else
    {
LABEL_15:
      sub_100006780(&qword_1000448E8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100038110;
      uint64_t v48 = v101;
      *(void *)(inited + 32) = v100;
      *(void *)(inited + 40) = v48;
      *(void *)(inited + 72) = sub_10000C980(0, &qword_100044DC8);
      os_log_type_t v49 = v106;
      *(void *)(inited + 48) = v106;
      swift_bridgeObjectRetain();
      uint64_t v110 = v49;
      sub_10000E72C(inited);
      id v50 = objc_allocWithZone((Class)MLDictionaryFeatureProvider);
      uint64_t v51 = v89;
      sub_1000244E0();
      id v7 = v51;
      if (!v51)
      {
        sub_100036940();
        if (*(void *)((v112 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v112 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100036990();
        }
        sub_1000369B0();
        sub_100036980();
        uint64_t v52 = sub_1000365A0();
        os_log_type_t v53 = sub_100036A90();
        if (os_log_type_enabled(v52, v53))
        {
          uint64_t v54 = (uint8_t *)swift_slowAlloc();
          v113[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v54 = 136315138;
          uint64_t v109 = v54 + 4;
          swift_beginAccess();
          swift_bridgeObjectRetain();
          sub_100006780(&qword_100044DD0);
          uint64_t v55 = sub_100036970();
          unint64_t v57 = v56;
          swift_bridgeObjectRelease();
          id v111 = (id)sub_10000B1D4(v55, v57, (uint64_t *)v113);
          sub_100036B00();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v52, v53, "featureProviders: %s.", v54, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }

        uint64_t v58 = v88;
        uint64_t v59 = v98;
        swift_beginAccess();
        id v60 = objc_allocWithZone((Class)MLArrayBatchProvider);
        swift_bridgeObjectRetain();
        sub_100006780(&qword_100044DD0);
        Class v61 = sub_100036950().super.isa;
        swift_bridgeObjectRelease();
        id v62 = [v60 initWithFeatureProviderArray:v61];

        uint64_t v63 = sub_1000365A0();
        os_log_type_t v64 = sub_100036A80();
        if (os_log_type_enabled(v63, v64))
        {
          unint64_t v65 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v65 = 0;
          _os_log_impl((void *)&_mh_execute_header, v63, v64, "Loading MLProgramTrainer for training.", v65, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v91, 1, 1, v58);
        (*(void (**)(char *, void, uint64_t))(v93 + 104))(v94, enum case for URL.DirectoryHint.inferFromPath(_:), v95);
        swift_bridgeObjectRetain();
        sub_100036180();
        uint64_t v66 = v92;
        sub_100036160();
        uint64_t v67 = v66;
        uint64_t v79 = sub_100027A14(v66);
        uint64_t v80 = *(void (**)(void, void))(v59 + 8);
        v80(v67, v58);
        uint64_t v81 = sub_1000365A0();
        os_log_type_t v82 = sub_100036A80();
        if (os_log_type_enabled(v81, v82))
        {
          int64_t v83 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)int64_t v83 = 0;
          _os_log_impl((void *)&_mh_execute_header, v81, v82, "Perform local Private Evolution step.", v83, 2u);
          swift_slowDealloc();
        }

        id v84 = v62;
        Class v85 = sub_100036A10().super.isa;
        id v111 = 0;
        id v7 = [(uint8_t *)v79 evaluateUsingTestData:v84 evaluationMetricNames:v85 error:&v111];

        if (v7)
        {
          id v86 = v111;
          v80(v99, v58);

          swift_bridgeObjectRelease();
          return v7;
        }
        id v87 = v111;
        id v7 = (id)sub_100036130();

        swift_willThrow();
        v80(v99, v58);
      }
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v68 = sub_1000365A0();
      os_log_type_t v69 = sub_100036AA0();
      if (os_log_type_enabled(v68, v69))
      {
        unint64_t v70 = (uint8_t *)swift_slowAlloc();
        uint64_t v71 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v70 = 138412290;
        swift_errorRetain();
        uint64_t v72 = (void *)_swift_stdlib_bridgeErrorToNSError();
        id v111 = v72;
        sub_100036B00();
        *uint64_t v71 = v72;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v68, v69, "Failed to get CoreML Evaluation Results: %@.", v70, 0xCu);
        sub_100006780(&qword_100044740);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      sub_10001DA38();
      swift_allocError();
      *uint64_t v76 = 7;
      swift_willThrow();
      swift_errorRelease();
    }
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1000291BC(void *a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  id v7 = [a1 evaluationMetrics];
  if (!v7)
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_1000365C0();
    sub_100007D00(v23, (uint64_t)qword_1000488A0);
    a3 = sub_1000365A0();
    os_log_type_t v24 = sub_100036AA0();
    if (os_log_type_enabled(a3, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, a3, v24, "Failed to get evaluationMetrics from evaluationResults.", v25, 2u);
      swift_slowDealloc();
    }

    sub_10001DA38();
    swift_allocError();
    *id v26 = 7;
    swift_willThrow();
    return (uint64_t)a3;
  }
  uint64_t v8 = v7;
  uint64_t v98 = a4;
  id v9 = [v7 featuresAtIndex:0];
  NSString v10 = sub_100036790();
  id v100 = v9;
  id v11 = [v9 featureValueForName:v10];

  if (!v11 || (id v12 = [v11 multiArrayValue], v11, !v12))
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1000365C0();
    sub_100007D00(v19, (uint64_t)qword_1000488A0);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_1000365A0();
    os_log_type_t v21 = sub_100036AA0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      v104[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      sub_10000B1D4(a2, (unint64_t)a3, v104);
      sub_100036B00();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "No output for %s.", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10001DA38();
    swift_allocError();
    *id v27 = 7;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return (uint64_t)a3;
  }
  if (qword_100044478 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1000365C0();
  sub_100007D00(v13, (uint64_t)qword_1000488A0);
  id v14 = v12;
  uint64_t v15 = sub_1000365A0();
  os_log_type_t v16 = sub_100036A90();
  uint64_t v97 = v8;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v103 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 138412290;
    v104[0] = (uint64_t)v14;
    id v18 = v14;
    sub_100036B00();
    *uint64_t v103 = v12;

    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Output vector: %@.", v17, 0xCu);
    sub_100006780(&qword_100044740);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v96 = v14;
  id v28 = [v14 numberArray];
  sub_10000C980(0, &qword_100044DC0);
  unint64_t v29 = sub_100036960();

  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_100036C30();
    swift_bridgeObjectRelease();
    if (v30) {
      goto LABEL_22;
    }
LABEL_32:
    swift_bridgeObjectRelease();
    uint64_t v32 = _swiftEmptyArrayStorage;
LABEL_33:
    uint64_t v39 = sub_100023AF4((uint64_t)(v32 + 4), v32[2]);
    unint64_t v41 = v40;
    swift_bridgeObjectRelease();
    sub_10000CA14(v39, v41);
    sub_10000CA14(v39, v41);
    unint64_t v42 = sub_1000365A0();
    os_log_type_t v43 = sub_100036A90();
    unint64_t v94 = v41;
    uint64_t v95 = v39;
    if (os_log_type_enabled(v42, v43))
    {
      unint64_t v44 = (uint8_t *)swift_slowAlloc();
      v104[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v44 = 136315138;
      sub_10000CA14(v39, v41);
      uint64_t v45 = sub_1000361B0();
      unint64_t v47 = v46;
      sub_10000C9BC(v39, v41);
      sub_10000B1D4(v45, v47, v104);
      sub_100036B00();
      swift_bridgeObjectRelease();
      sub_10000C9BC(v39, v41);
      sub_10000C9BC(v39, v41);
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Output data: %s.", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000C9BC(v39, v41);
      sub_10000C9BC(v39, v41);
    }

    unint64_t v105 = sub_10000EAA8((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v99 = *(void *)(v98 + 16);
    if (!v99)
    {
LABEL_71:
      uint64_t v88 = sub_1000365A0();
      os_log_type_t v89 = sub_100036A90();
      if (os_log_type_enabled(v88, v89))
      {
        uint64_t v90 = (uint8_t *)swift_slowAlloc();
        v104[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v90 = 136315138;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_100006780(&qword_100044750);
        uint64_t v91 = sub_100036710();
        unint64_t v93 = v92;
        swift_bridgeObjectRelease();
        sub_10000B1D4(v91, v93, v104);
        sub_100036B00();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v88, v89, "Output metrics: %s.", v90, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      a3 = v95;
      swift_beginAccess();
      return (uint64_t)a3;
    }
    swift_bridgeObjectRetain();
    uint64_t v48 = 0;
    while (1)
    {
      id v50 = (uint64_t *)(v98 + 32 + 16 * v48);
      uint64_t v51 = *v50;
      unint64_t v52 = v50[1];
      swift_bridgeObjectRetain();
      NSString v53 = sub_100036790();
      id v54 = [v100 featureValueForName:v53];

      if (!v54
        || (id v55 = [v54 multiArrayValue], v54, !v55))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        int64_t v83 = sub_1000365A0();
        os_log_type_t v84 = sub_100036AA0();
        if (os_log_type_enabled(v83, v84))
        {
          Class v85 = (uint8_t *)swift_slowAlloc();
          v104[0] = swift_slowAlloc();
          *(_DWORD *)Class v85 = 136315138;
          swift_bridgeObjectRetain();
          sub_10000B1D4(v51, v52, v104);
          sub_100036B00();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v83, v84, "No metricValue for %s.", v85, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        a3 = v97;
        sub_10001DA38();
        swift_allocError();
        *id v86 = 7;
        swift_willThrow();

        sub_10000C9BC(v95, v94);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        return (uint64_t)a3;
      }
      id v56 = [v55 numberArray];
      unint64_t v57 = sub_100036960();

      if (v57 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v58 = sub_100036C30();
        swift_bridgeObjectRelease();
        uint64_t v101 = v55;
        uint64_t v102 = v52;
        if (!v58)
        {
LABEL_54:
          swift_bridgeObjectRelease();
          id v60 = _swiftEmptyArrayStorage;
          goto LABEL_55;
        }
      }
      else
      {
        uint64_t v58 = *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v101 = v55;
        uint64_t v102 = v52;
        if (!v58) {
          goto LABEL_54;
        }
      }
      v104[0] = (uint64_t)_swiftEmptyArrayStorage;
      sub_1000245C8(0, v58 & ~(v58 >> 63), 0);
      if (v58 < 0) {
        goto LABEL_76;
      }
      uint64_t v59 = 0;
      id v60 = (void *)v104[0];
      do
      {
        if ((v57 & 0xC000000000000001) != 0) {
          id v61 = (id)sub_100036BF0();
        }
        else {
          id v61 = *(id *)(v57 + 8 * v59 + 32);
        }
        id v62 = v61;
        [v61 floatValue];
        int v64 = v63;

        v104[0] = (uint64_t)v60;
        unint64_t v66 = v60[2];
        unint64_t v65 = v60[3];
        if (v66 >= v65 >> 1)
        {
          sub_1000245C8(v65 > 1, v66 + 1, 1);
          id v60 = (void *)v104[0];
        }
        ++v59;
        v60[2] = v66 + 1;
        *((_DWORD *)v60 + v66 + 8) = v64;
      }
      while (v58 != v59);
      swift_bridgeObjectRelease();
LABEL_55:
      uint64_t v67 = v105;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v104[0] = v67;
      unint64_t v70 = sub_10001172C(v51, v102);
      uint64_t v71 = *(void *)(v67 + 16);
      BOOL v72 = (v69 & 1) == 0;
      uint64_t v73 = v71 + v72;
      if (__OFADD__(v71, v72))
      {
        __break(1u);
LABEL_76:
        __break(1u);
LABEL_77:
        __break(1u);
        goto LABEL_78;
      }
      char v74 = v69;
      if (*(void *)(v67 + 24) >= v73)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_100012E4C();
        }
        uint64_t v75 = v102;
        uint64_t v78 = (void *)v104[0];
        if (v74) {
          goto LABEL_38;
        }
      }
      else
      {
        sub_100012140(v73, isUniquelyReferenced_nonNull_native);
        uint64_t v75 = v102;
        unint64_t v76 = sub_10001172C(v51, v102);
        if ((v74 & 1) != (v77 & 1)) {
          goto LABEL_79;
        }
        unint64_t v70 = v76;
        uint64_t v78 = (void *)v104[0];
        if (v74)
        {
LABEL_38:
          uint64_t v49 = v78[7];
          swift_bridgeObjectRelease();
          *(void *)(v49 + 8 * v70) = v60;
          goto LABEL_39;
        }
      }
      v78[(v70 >> 6) + 8] |= 1 << v70;
      uint64_t v79 = (uint64_t *)(v78[6] + 16 * v70);
      *uint64_t v79 = v51;
      v79[1] = v75;
      *(void *)(v78[7] + 8 * v70) = v60;
      uint64_t v80 = v78[2];
      BOOL v81 = __OFADD__(v80, 1);
      uint64_t v82 = v80 + 1;
      if (v81) {
        goto LABEL_77;
      }
      v78[2] = v82;
      swift_bridgeObjectRetain();
LABEL_39:
      ++v48;
      unint64_t v105 = (unint64_t)v78;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v48 == v99)
      {
        swift_bridgeObjectRelease();
        goto LABEL_71;
      }
    }
  }
  uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v30) {
    goto LABEL_32;
  }
LABEL_22:
  v104[0] = (uint64_t)_swiftEmptyArrayStorage;
  sub_1000245C8(0, v30 & ~(v30 >> 63), 0);
  if ((v30 & 0x8000000000000000) == 0)
  {
    uint64_t v31 = 0;
    uint64_t v32 = (void *)v104[0];
    do
    {
      if ((v29 & 0xC000000000000001) != 0) {
        id v33 = (id)sub_100036BF0();
      }
      else {
        id v33 = *(id *)(v29 + 8 * v31 + 32);
      }
      unint64_t v34 = v33;
      [v33 floatValue];
      int v36 = v35;

      v104[0] = (uint64_t)v32;
      unint64_t v38 = v32[2];
      unint64_t v37 = v32[3];
      if (v38 >= v37 >> 1)
      {
        sub_1000245C8(v37 > 1, v38 + 1, 1);
        uint64_t v32 = (void *)v104[0];
      }
      ++v31;
      _OWORD v32[2] = v38 + 1;
      *((_DWORD *)v32 + v38 + 8) = v36;
    }
    while (v30 != v31);
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
LABEL_78:
  __break(1u);
LABEL_79:
  uint64_t result = sub_100036E40();
  __break(1u);
  return result;
}

unint64_t sub_10002A02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v59 = a7;
  uint64_t v61 = a4;
  uint64_t v60 = a3;
  uint64_t v11 = sub_100036400();
  uint64_t v57 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  unint64_t v66 = _swiftEmptyArrayStorage;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v58 = v12;
  int v63 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v14)
  {
    uint64_t v56 = a5;
    uint64_t v55 = a6;
    uint64_t v15 = *(void *)(sub_100036590() - 8);
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v17 = *(void *)(v15 + 72);
    swift_bridgeObjectRetain();
    uint64_t v18 = v14;
    uint64_t v19 = v14;
    while (1)
    {
      uint64_t v20 = sub_100036560();
      uint64_t v21 = *(void *)(v20 + 16);
      if (v21 != a2) {
        break;
      }
      sub_100023BCC(v20);
      v16 += v17;
      if (!--v19)
      {
        swift_bridgeObjectRelease();
        a6 = v55;
        a5 = v56;
        uint64_t v14 = v18;
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_1000365C0();
    sub_100007D00(v35, (uint64_t)qword_1000488A0);
    swift_bridgeObjectRetain();
    int v36 = sub_1000365A0();
    os_log_type_t v37 = sub_100036AA0();
    unint64_t v33 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 134218240;
      uint64_t v64 = a2;
      sub_100036B00();
      *(_WORD *)(v38 + 12) = 2048;
      swift_bridgeObjectRelease();
      uint64_t v64 = v21;
      sub_100036B00();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v33, "Wrong embedding size: expected %ld, actual %ld.", (uint8_t *)v38, 0x16u);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10001DA38();
    swift_allocError();
    *unint64_t v44 = 3;
    swift_willThrow();
  }
  else
  {
LABEL_6:
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1000365C0();
    uint64_t v23 = sub_100007D00(v22, (uint64_t)qword_1000488A0);
    os_log_type_t v24 = v66;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_1000365A0();
    os_log_type_t v26 = sub_100036A80();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v56 = v23;
    uint64_t v54 = v14;
    if (v27)
    {
      uint64_t v28 = a6;
      unint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v29 = 134217984;
      uint64_t v64 = v24[2];
      sub_100036B00();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Number elements in embeddingsMatrixRowMajor: %ld.", v29, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
      uint64_t v28 = a6;
    }
    sub_1000364A0();
    swift_allocObject();
    sub_100036490();
    sub_100036470();
    swift_allocObject();
    sub_100036480();
    uint64_t v30 = v63;
    sub_1000363F0();
    sub_100006780(&qword_100044688);
    uint64_t v31 = swift_allocObject();
    long long v53 = xmmword_100038110;
    *(_OWORD *)(v31 + 16) = xmmword_100038110;
    *(void *)(v31 + 32) = a5;
    *(void *)(v31 + 40) = v28;
    swift_bridgeObjectRetain();
    uint64_t v32 = swift_bridgeObjectRetain();
    unint64_t v33 = (unint64_t)sub_100025178(v32);
    swift_bridgeObjectRelease();
    uint64_t v34 = v62;
    sub_100036450();
    if (v34)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v30, v58);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v55 = v28;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v30, v58);
      swift_bridgeObjectRelease();
      swift_release();
      LOBYTE(v64) = 1;
      sub_100036460();
      sub_100006780(&qword_100044DB0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v53;
      uint64_t v47 = v55;
      *(void *)(inited + 32) = 0;
      *(void *)(inited + 40) = v47;
      swift_beginAccess();
      *(void *)(inited + 48) = v66;
      swift_bridgeObjectRetain();
      sub_10000EAA8(inited);
      sub_100006780(&qword_100044DB8);
      uint64_t v48 = swift_initStackObject();
      *(_OWORD *)(v48 + 16) = v53;
      *(void *)(v48 + 32) = 0;
      *(void *)(v48 + 40) = v47;
      *(void *)(v48 + 48) = a2;
      swift_bridgeObjectRetain();
      unint64_t v33 = sub_10000E994(v48);
      uint64_t v49 = sub_100036440();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v49 + 16))
      {
        unint64_t v33 = *(void *)(v49 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_release();
        return v33;
      }
      swift_bridgeObjectRelease();
      id v50 = sub_1000365A0();
      os_log_type_t v51 = sub_100036AA0();
      if (os_log_type_enabled(v50, v51))
      {
        unint64_t v33 = swift_slowAlloc();
        *(_WORD *)unint64_t v33 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Empty evaluation results from EspressoMILTrainer.", (uint8_t *)v33, 2u);
        swift_slowDealloc();
      }

      sub_10001DA38();
      swift_allocError();
      *unint64_t v52 = 7;
      swift_willThrow();
      swift_release();
    }
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v39 = sub_1000365A0();
    os_log_type_t v40 = sub_100036AA0();
    if (os_log_type_enabled(v39, v40))
    {
      unint64_t v41 = (uint8_t *)swift_slowAlloc();
      unint64_t v33 = swift_slowAlloc();
      *(_DWORD *)unint64_t v41 = 138412290;
      swift_errorRetain();
      uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v65 = v42;
      sub_100036B00();
      *(void *)unint64_t v33 = v42;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Failed to get Espresso Evaluation Results: %@.", v41, 0xCu);
      sub_100006780(&qword_100044740);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    sub_10001DA38();
    swift_allocError();
    *os_log_type_t v43 = 7;
    swift_willThrow();
    swift_errorRelease();
  }
  return v33;
}

uint64_t sub_10002A96C(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  if (!*(void *)(a1 + 16)) {
    goto LABEL_7;
  }
  uint64_t v8 = a1;
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_10001172C(a2, a3);
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_1000365C0();
    sub_100007D00(v19, (uint64_t)qword_1000488A0);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_1000365A0();
    os_log_type_t v21 = sub_100036AA0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      v74[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      sub_10000B1D4(a2, a3, v74);
      sub_100036B00();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "No output for %s.", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_10001DA38();
    swift_allocError();
    *uint64_t v23 = 7;
    swift_willThrow();
    return v4;
  }
  BOOL v72 = a4;
  unint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (qword_100044478 != -1) {
    goto LABEL_50;
  }
  while (1)
  {
    uint64_t v12 = sub_1000365C0();
    sub_100007D00(v12, (uint64_t)qword_1000488A0);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_1000365A0();
    os_log_type_t v14 = sub_100036A90();
    uint64_t v73 = v8;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      v74[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_100036970();
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      sub_10000B1D4(v16, v18, v74);
      sub_100036B00();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Output vector: %s.", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v4 = sub_100023AF4(v11 + 32, *(void *)(v11 + 16));
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    sub_10000CA14(v4, v25);
    sub_10000CA14(v4, v25);
    os_log_type_t v26 = sub_1000365A0();
    os_log_type_t v27 = sub_100036A90();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      v74[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      sub_10000CA14(v4, v25);
      uint64_t v29 = sub_1000361B0();
      unint64_t v30 = v25;
      uint64_t v31 = v4;
      unint64_t v33 = v32;
      sub_10000C9BC(v31, v30);
      sub_10000B1D4(v29, v33, v74);
      sub_100036B00();
      uint64_t v4 = v31;
      unint64_t v25 = v30;
      swift_bridgeObjectRelease();
      sub_10000C9BC(v4, v30);
      sub_10000C9BC(v4, v30);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Output data: %s.", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_10000C9BC(v4, v25);
      sub_10000C9BC(v4, v25);
    }

    uint64_t v34 = v73;
    unint64_t v75 = sub_10000EAA8((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v35 = v72[2];
    if (!v35) {
      break;
    }
    uint64_t v70 = v4;
    uint64_t v36 = v72[4];
    unint64_t v11 = v72[5];
    uint64_t v37 = *(void *)(v73 + 16);
    swift_bridgeObjectRetain();
    if (!v37) {
      goto LABEL_43;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v38 = sub_10001172C(v36, v11);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_43:
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_1000365A0();
      os_log_type_t v66 = sub_100036AA0();
      if (os_log_type_enabled(v65, v66))
      {
        uint64_t v67 = (uint8_t *)swift_slowAlloc();
        v74[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v67 = 136315138;
        swift_bridgeObjectRetain();
        sub_10000B1D4(v36, v11, v74);
        sub_100036B00();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "No metricValue for %s.", v67, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_10001DA38();
      swift_allocError();
      *uint64_t v68 = 7;
      swift_willThrow();
      sub_10000C9BC(v70, v25);
      swift_bridgeObjectRelease();
      return v4;
    }
    unint64_t v71 = v25;
    os_log_type_t v40 = v72 + 7;
    while (1)
    {
      uint64_t v8 = *(void *)(*(void *)(v34 + 56) + 8 * v38);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v42 = v75;
      v74[0] = v75;
      uint64_t v4 = v36;
      unint64_t v44 = sub_10001172C(v36, v11);
      uint64_t v45 = *(void *)(v42 + 16);
      BOOL v46 = (v43 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        break;
      }
      char v48 = v43;
      if (*(void *)(v42 + 24) >= v47)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          os_log_type_t v51 = (void *)v74[0];
          if (v43) {
            goto LABEL_29;
          }
        }
        else
        {
          sub_100012E4C();
          os_log_type_t v51 = (void *)v74[0];
          if (v48) {
            goto LABEL_29;
          }
        }
      }
      else
      {
        sub_100012140(v47, isUniquelyReferenced_nonNull_native);
        unint64_t v49 = sub_10001172C(v4, v11);
        if ((v48 & 1) != (v50 & 1))
        {
          uint64_t result = sub_100036E40();
          __break(1u);
          return result;
        }
        unint64_t v44 = v49;
        os_log_type_t v51 = (void *)v74[0];
        if (v48)
        {
LABEL_29:
          uint64_t v56 = v51[7];
          swift_bridgeObjectRelease();
          *(void *)(v56 + 8 * v44) = v8;
          goto LABEL_30;
        }
      }
      v51[(v44 >> 6) + 8] |= 1 << v44;
      unint64_t v52 = (uint64_t *)(v51[6] + 16 * v44);
      *unint64_t v52 = v4;
      v52[1] = v11;
      *(void *)(v51[7] + 8 * v44) = v8;
      uint64_t v53 = v51[2];
      BOOL v54 = __OFADD__(v53, 1);
      uint64_t v55 = v53 + 1;
      if (v54) {
        goto LABEL_49;
      }
      v51[2] = v55;
      swift_bridgeObjectRetain();
LABEL_30:
      unint64_t v75 = (unint64_t)v51;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v35;
      uint64_t v34 = v73;
      if (!v35)
      {
        swift_bridgeObjectRelease();
        uint64_t v4 = v70;
        goto LABEL_38;
      }
      uint64_t v36 = *(v40 - 1);
      unint64_t v11 = *v40;
      if (!*(void *)(v73 + 16))
      {
        swift_bridgeObjectRetain();
        goto LABEL_42;
      }
      v40 += 2;
      swift_bridgeObjectRetain_n();
      unint64_t v38 = sub_10001172C(v36, v11);
      if ((v57 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_42:
        swift_bridgeObjectRelease();
        unint64_t v25 = v71;
        goto LABEL_43;
      }
    }
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    swift_once();
  }
LABEL_38:
  uint64_t v58 = sub_1000365A0();
  os_log_type_t v59 = sub_100036A90();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    v74[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v60 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_100006780(&qword_100044750);
    uint64_t v61 = sub_100036710();
    uint64_t v62 = v4;
    unint64_t v64 = v63;
    swift_bridgeObjectRelease();
    sub_10000B1D4(v61, v64, v74);
    sub_100036B00();
    uint64_t v4 = v62;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "Output metrics: %s.", v60, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  return v4;
}

uint64_t sub_10002B3F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[71] = a3;
  v3[70] = a2;
  v3[69] = a1;
  sub_100006780(&qword_100044658);
  v3[72] = swift_task_alloc();
  v3[73] = swift_task_alloc();
  v3[74] = type metadata accessor for EmailExtractor();
  v3[75] = swift_task_alloc();
  return _swift_task_switch(sub_10002B4CC, 0, 0);
}

uint64_t sub_10002B4CC()
{
  uint64_t v95 = v0;
  uint64_t v1 = *(void *)(v0 + 552);
  *(void *)(v0 + 504) = 0;
  sub_10002E218(v1 + 136, v0 + 144);
  sub_10002E218(v0 + 144, v0 + 16);
  if (sub_10002E280(v0 + 16) == 1)
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v91 = sub_1000365C0();
    sub_100007D00(v91, (uint64_t)qword_1000488A0);
    uint64_t v2 = sub_1000365A0();
    os_log_type_t v3 = sub_100036A80();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Querying embeddings from Biome.", v4, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = *(void *)(v0 + 584);
    uint64_t v6 = *(void *)(v0 + 576);
    uint64_t v93 = *(void *)(v0 + 568);
    uint64_t v7 = *(void *)(v0 + 560);
    uint64_t v8 = *(void **)(v0 + 552);

    uint64_t v9 = v8[9];
    uint64_t v10 = v8[10];
    unint64_t v11 = (void *)v8[13];
    uint64_t v12 = sub_100036250();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    v13(v5, 1, 1, v12);
    v13(v6, 1, 1, v12);
    uint64_t v88 = v9;
    unint64_t v89 = v10;
    uint64_t v14 = sub_1000071B4(v9, v10, v11, v5, v6, 0, v7, v93);
    sub_100018F84(v6);
    sub_100018F84(v5);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 504) = v14;
    if (!v14)
    {
      char v43 = 0;
LABEL_32:
      sub_10001DA38();
      swift_allocError();
      *uint64_t v58 = v43;
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      os_log_type_t v59 = *(uint64_t (**)(void))(v0 + 8);
      return v59();
    }
    uint64_t v15 = *(void *)(v0 + 552);
    sub_10002E2A4(v15);
    sub_10002E2A4(v15);
    sub_10002E2A4(v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10002E2A4(v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1000365A0();
    os_log_type_t v17 = sub_100036A80();
    BOOL v18 = os_log_type_enabled(v16, v17);
    unint64_t v19 = *(void *)(v0 + 568);
    if (v18)
    {
      uint64_t v87 = *(void *)(v0 + 560);
      uint64_t v20 = *(void *)(v0 + 552);
      os_log_type_t type = v17;
      os_log_type_t v21 = (void *)swift_slowAlloc();
      v94[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v21 = 134218754;
      uint64_t v22 = *(void *)(v14 + 16);
      swift_bridgeObjectRelease();
      *(void *)(v0 + 472) = v22;
      sub_100036B00();
      swift_bridgeObjectRelease();
      *((_WORD *)v21 + 6) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 480) = sub_10000B1D4(v88, v89, v94);
      sub_100036B00();
      swift_bridgeObjectRelease();
      sub_10002E048(v20);
      sub_10002E048(v20);
      *((_WORD *)v21 + 11) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 488) = sub_10000B1D4(v87, v19, v94);
      sub_100036B00();
      swift_bridgeObjectRelease_n();
      *((_WORD *)v21 + 16) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_100036970();
      unint64_t v19 = v24;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 496) = sub_10000B1D4(v23, v19, v94);
      unint64_t v25 = (uint64_t *)(v0 + 504);
      sub_100036B00();
      swift_bridgeObjectRelease();
      sub_10002E048(v20);
      sub_10002E048(v20);
      _os_log_impl((void *)&_mh_execute_header, v16, type, "Number of embeddings queried: %ld. Query params: embeddingModel=%s, useCase=%s, sourceTypes=%s.", (uint8_t *)v21, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v14 = *(void *)(v0 + 504);
      if (!v14) {
        goto LABEL_20;
      }
    }
    else
    {
      os_log_type_t v21 = *(void **)(v0 + 552);
      swift_bridgeObjectRelease_n();
      sub_10002E048((uint64_t)v21);
      sub_10002E048((uint64_t)v21);
      swift_bridgeObjectRelease_n();
      sub_10002E048((uint64_t)v21);
      sub_10002E048((uint64_t)v21);

      unint64_t v25 = (uint64_t *)(v0 + 504);
    }
    unint64_t v44 = *(void *)(v14 + 16);
    if (v44 < *(void *)(*(void *)(v0 + 552) + 48))
    {
LABEL_20:
      if (qword_100044478 != -1) {
        swift_once();
      }
      uint64_t v45 = *(void *)(v0 + 552);
      sub_100007D00(v91, (uint64_t)qword_1000488A0);
      sub_10002E2A4(v45);
      BOOL v46 = sub_1000365A0();
      os_log_type_t v47 = sub_100036AA0();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = swift_slowAlloc();
        *(_DWORD *)uint64_t v48 = 134218240;
        swift_beginAccess();
        uint64_t v49 = *v25;
        if (*v25) {
          uint64_t v49 = *(void *)(v49 + 16);
        }
        uint64_t v50 = *(void *)(v0 + 552);
        *(void *)(v0 + 424) = v49;
        sub_100036B00();
        *(_WORD *)(v48 + 12) = 2048;
        *(void *)(v0 + 432) = *(void *)(v50 + 48);
        sub_100036B00();
        sub_10002E048(v50);
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Number of data %ld less than the threshold %lu", (uint8_t *)v48, 0x16u);
        swift_slowDealloc();
      }
      else
      {
        sub_10002E048(*(void *)(v0 + 552));
      }

      char v43 = 2;
      goto LABEL_32;
    }
    uint64_t v51 = qword_100044478;
    swift_bridgeObjectRetain();
    if (v51 != -1) {
      swift_once();
    }
    sub_100007D00(v91, (uint64_t)qword_1000488A0);
    swift_bridgeObjectRetain_n();
    unint64_t v52 = sub_1000365A0();
    os_log_type_t v53 = sub_100036A90();
    uint64_t v54 = v53;
    if (os_log_type_enabled(v52, v53))
    {
      unint64_t v19 = v0 + 456;
      os_log_type_t v21 = (void *)swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      v94[0] = v92;
      *(_DWORD *)os_log_type_t v21 = 134218242;
      *(void *)(v0 + 456) = v44;
      sub_100036B00();
      swift_bridgeObjectRelease();
      *((_WORD *)v21 + 6) = 2080;
      sub_100036590();
      swift_bridgeObjectRetain();
      uint64_t v55 = sub_100036970();
      unint64_t v57 = v56;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 464) = sub_10000B1D4(v55, v57, v94);
      sub_100036B00();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v52, (os_log_type_t)v54, "Embeddings data (count: %ld: %s.", (uint8_t *)v21, 0x16u);
      uint64_t v54 = v92;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v60 = *(void *)(*(void *)(v0 + 552) + 56);
    if (v60 < 0)
    {
      __break(1u);
      goto LABEL_64;
    }
    unint64_t v52 = sub_100023D14(v60, v14);
    os_log_type_t v21 = v61;
    uint64_t v54 = v62;
    unint64_t v19 = v63;
    if (v63)
    {
      sub_100036E20();
      swift_unknownObjectRetain_n();
      unint64_t v64 = (void *)swift_dynamicCastClass();
      if (!v64)
      {
        swift_unknownObjectRelease();
        unint64_t v64 = _swiftEmptyArrayStorage;
      }
      uint64_t v65 = v64[2];
      swift_release();
      if (__OFSUB__(v19 >> 1, v54)) {
        goto LABEL_65;
      }
      if (v65 != (v19 >> 1) - v54) {
        goto LABEL_66;
      }
      os_log_type_t v21 = (void *)swift_dynamicCastClass();
      if (!v21)
      {
        swift_unknownObjectRelease();
        os_log_type_t v21 = _swiftEmptyArrayStorage;
      }
      goto LABEL_45;
    }
    while (1)
    {
      os_log_type_t v21 = sub_100025260((uint64_t)v52, (uint64_t)v21, v54, v19);
LABEL_45:
      uint64_t v54 = *(void *)(v0 + 552);
      swift_unknownObjectRelease();
      v94[0] = (uint64_t)v21;
      unint64_t v52 = v94;
      sub_100025654();
      uint64_t v66 = *(void *)(v54 + 64);
      if ((v66 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      swift_unknownObjectRelease();
    }
    uint64_t v67 = sub_10002380C(v66, v94[0]);
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    unint64_t v73 = v72;
    if (v72)
    {
      sub_100036E20();
      swift_unknownObjectRetain_n();
      unint64_t v75 = (void *)swift_dynamicCastClass();
      if (!v75)
      {
        swift_unknownObjectRelease();
        unint64_t v75 = _swiftEmptyArrayStorage;
      }
      uint64_t v76 = v75[2];
      swift_release();
      if (__OFSUB__(v73 >> 1, v71))
      {
        __break(1u);
      }
      else if (v76 == (v73 >> 1) - v71)
      {
        char v74 = (void *)swift_dynamicCastClass();
        if (!v74)
        {
          swift_unknownObjectRelease();
          char v74 = _swiftEmptyArrayStorage;
        }
        goto LABEL_54;
      }
      swift_unknownObjectRelease();
    }
    char v74 = sub_100025260(v67, v69, v71, v73);
LABEL_54:
    swift_unknownObjectRelease();
    swift_bridgeObjectRetain();
    char v77 = sub_1000365A0();
    os_log_type_t v78 = sub_100036A80();
    if (os_log_type_enabled(v77, v78))
    {
      uint64_t v79 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v79 = 134217984;
      *(void *)(v0 + 448) = v74[2];
      sub_100036B00();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "Number of sampled embeddings: %ld.", v79, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }

    swift_bridgeObjectRetain_n();
    uint64_t v80 = sub_1000365A0();
    os_log_type_t v81 = sub_100036A90();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = (uint8_t *)swift_slowAlloc();
      v94[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v82 = 136315138;
      sub_100036590();
      swift_bridgeObjectRetain();
      uint64_t v83 = sub_100036970();
      unint64_t v85 = v84;
      swift_release();
      *(void *)(v0 + 440) = sub_10000B1D4(v83, v85, v94);
      sub_100036B00();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "Sampled Embeddings data: %s\n", v82, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v86 = *(uint64_t (**)(void *))(v0 + 8);
    return v86(v74);
  }
  sub_10002E218(v0 + 144, v0 + 272);
  sub_100006B38(v0 + 272);
  if (qword_100044478 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_1000365C0();
  *(void *)(v0 + 608) = sub_100007D00(v26, (uint64_t)qword_1000488A0);
  os_log_type_t v27 = sub_1000365A0();
  os_log_type_t v28 = sub_100036A80();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Extracting emails.", v29, 2u);
    swift_slowDealloc();
  }
  unint64_t v30 = *(_OWORD **)(v0 + 600);
  uint64_t v31 = *(void *)(v0 + 592);

  unint64_t v32 = (char *)v30 + *(int *)(v31 + 20);
  uint64_t v33 = sub_100036250();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 1, 1, v33);
  long long v34 = *(_OWORD *)(v0 + 16);
  long long v35 = *(_OWORD *)(v0 + 32);
  long long v36 = *(_OWORD *)(v0 + 64);
  v30[2] = *(_OWORD *)(v0 + 48);
  void v30[3] = v36;
  *unint64_t v30 = v34;
  v30[1] = v35;
  long long v37 = *(_OWORD *)(v0 + 80);
  long long v38 = *(_OWORD *)(v0 + 96);
  long long v39 = *(_OWORD *)(v0 + 128);
  v30[6] = *(_OWORD *)(v0 + 112);
  v30[7] = v39;
  void v30[4] = v37;
  v30[5] = v38;
  os_log_type_t v40 = (void *)swift_task_alloc();
  *(void *)(v0 + 616) = v40;
  *os_log_type_t v40 = v0;
  v40[1] = sub_10002C368;
  uint64_t v41 = *(void *)(v0 + 584);
  return sub_100015E60(v41, v0 + 680);
}

uint64_t sub_10002C368(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 584);
  *(void *)(*(void *)v1 + 624) = a1;
  swift_task_dealloc();
  sub_100018F84(v2);
  return _swift_task_switch(sub_10002C488, 0, 0);
}

uint64_t sub_10002C488()
{
  int v1 = *(unsigned __int8 *)(v0 + 680);
  uint64_t v2 = *(void *)(v0 + 624);
  if (v1 == 9)
  {
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + 16);
      if (v3)
      {
        swift_bridgeObjectRetain();
        uint64_t v4 = sub_1000365A0();
        os_log_type_t v5 = sub_100036A80();
        if (os_log_type_enabled(v4, v5))
        {
          uint64_t v6 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v6 = 134217984;
          *(void *)(v0 + 544) = v3;
          sub_100036B00();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v4, v5, "Extracted %ld items.", v6, 0xCu);
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        uint64_t v20 = sub_1000365A0();
        os_log_type_t v21 = sub_100036A80();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Generating embeddings", v22, 2u);
          swift_slowDealloc();
        }
        uint64_t v23 = *(void **)(v0 + 552);

        uint64_t v24 = v23[9];
        *(void *)(v0 + 632) = v24;
        uint64_t v25 = v23[10];
        *(void *)(v0 + 640) = v25;
        uint64_t v26 = v23[11];
        *(void *)(v0 + 648) = v26;
        uint64_t v27 = v23[12];
        *(void *)(v0 + 656) = v27;
        os_log_type_t v28 = (void *)swift_task_alloc();
        *(void *)(v0 + 664) = v28;
        *os_log_type_t v28 = v0;
        v28[1] = sub_10002C8D8;
        return generateEmbeddingsFromTexts(textItems:embeddingModelName:embeddingModelVersion:)(v2, v24, v25, v26, v27);
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v7 = sub_1000365A0();
    os_log_type_t v14 = sub_100036AA0();
    char v10 = 2;
    if (os_log_type_enabled(v7, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v14, "No data extracted.", v15, 2u);
      goto LABEL_12;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_1000365A0();
    os_log_type_t v8 = sub_100036AA0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      char v10 = 8;
      unint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      sub_100021490();
      swift_allocError();
      *uint64_t v12 = v1;
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 512) = v13;
      sub_100036B00();
      *unint64_t v11 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed to extract emails with error %@.", v9, 0xCu);
      sub_100006780(&qword_100044740);
      swift_arrayDestroy();
      swift_slowDealloc();
LABEL_12:
      swift_slowDealloc();
      goto LABEL_13;
    }
    char v10 = 8;
  }
LABEL_13:
  uint64_t v16 = *(void *)(v0 + 600);

  sub_10001DA38();
  swift_allocError();
  *os_log_type_t v17 = v10;
  swift_willThrow();
  sub_10002E414(v16);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_10002C8D8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 672) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10002C9F8, 0, 0);
}

uint64_t sub_10002C9F8()
{
  uint64_t v71 = v0;
  uint64_t v2 = v0[84];
  swift_bridgeObjectRelease();
  v0[63] = v2;
  if (!v2)
  {
    uint64_t v13 = v0[75];
    sub_10001DA38();
    swift_allocError();
    *os_log_type_t v14 = 9;
    swift_willThrow();
    sub_10002E414(v13);
LABEL_25:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v37 = (uint64_t (*)(void))v0[1];
    return v37();
  }
  uint64_t v3 = v0[84];
  uint64_t v4 = v0[69];
  sub_10002E2A4(v4);
  sub_10002E2A4(v4);
  sub_10002E2A4(v4);
  sub_10002E2A4(v4);
  swift_bridgeObjectRetain();
  os_log_type_t v5 = sub_1000365A0();
  os_log_type_t v6 = sub_100036A80();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = v0[82];
    uint64_t v68 = v0[81];
    unint64_t v8 = v0[80];
    uint64_t v67 = v0[79];
    uint64_t v69 = v0[75];
    unint64_t v1 = v0[69];
    uint64_t v9 = swift_slowAlloc();
    v70[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134218498;
    v0[65] = *(void *)(v3 + 16);
    sub_100036B00();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[66] = sub_10000B1D4(v67, v8, v70);
    sub_100036B00();
    swift_bridgeObjectRelease();
    sub_10002E048(v1);
    sub_10002E048(v1);
    *(_WORD *)(v9 + 22) = 2080;
    if (v7) {
      uint64_t v10 = v68;
    }
    else {
      uint64_t v10 = 7104878;
    }
    if (v7) {
      unint64_t v11 = v7;
    }
    else {
      unint64_t v11 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    v0[67] = sub_10000B1D4(v10, v11, v70);
    sub_100036B00();
    swift_bridgeObjectRelease();
    sub_10002E048(v1);
    sub_10002E048(v1);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Number of embeddings generated: %ld. Model Name: %s, model version: %s.", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v12 = v69;
  }
  else
  {
    uint64_t v15 = v0[75];
    uint64_t v16 = v0[69];

    sub_10002E048(v16);
    sub_10002E048(v16);
    sub_10002E048(v16);
    sub_10002E048(v16);
    swift_bridgeObjectRelease();
    uint64_t v12 = v15;
  }
  sub_10002E414(v12);
  os_log_type_t v17 = v0 + 63;
  uint64_t v18 = v0[84];
  uint64_t v19 = v0[69];
  unint64_t v20 = *(void *)(v18 + 16);
  uint64_t v21 = qword_100044478;
  if (v20 < *(void *)(v19 + 48))
  {
    if (qword_100044478 != -1)
    {
      swift_once();
      uint64_t v19 = v0[69];
    }
    uint64_t v22 = sub_1000365C0();
    sub_100007D00(v22, (uint64_t)qword_1000488A0);
    sub_10002E2A4(v19);
    uint64_t v23 = sub_1000365A0();
    os_log_type_t v24 = sub_100036AA0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 134218240;
      swift_beginAccess();
      uint64_t v26 = *v17;
      if (*v17) {
        uint64_t v26 = *(void *)(v26 + 16);
      }
      uint64_t v27 = v0[69];
      v0[53] = v26;
      sub_100036B00();
      *(_WORD *)(v25 + 12) = 2048;
      v0[54] = *(void *)(v27 + 48);
      sub_100036B00();
      sub_10002E048(v27);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Number of data %ld less than the threshold %lu", (uint8_t *)v25, 0x16u);
      swift_slowDealloc();
    }
    else
    {
      sub_10002E048(v0[69]);
    }

    sub_10001DA38();
    swift_allocError();
    *long long v36 = 2;
    swift_willThrow();
    goto LABEL_25;
  }
  os_log_type_t v28 = v0 + 57;
  swift_bridgeObjectRetain();
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_1000365C0();
  uint64_t v30 = sub_100007D00(v29, (uint64_t)qword_1000488A0);
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_1000365A0();
  os_log_type_t v32 = sub_100036A90();
  if (os_log_type_enabled(v31, v32))
  {
    unint64_t v1 = swift_slowAlloc();
    v70[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v1 = 134218242;
    v0[57] = v20;
    sub_100036B00();
    swift_bridgeObjectRelease();
    *(_WORD *)(v1 + 12) = 2080;
    sub_100036590();
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_100036970();
    os_log_type_t v28 = (void *)v30;
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    v0[58] = sub_10000B1D4(v33, v35, v70);
    sub_100036B00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Embeddings data (count: %ld: %s.", (uint8_t *)v1, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v39 = *(void *)(v0[69] + 56);
  if (v39 < 0)
  {
    __break(1u);
    goto LABEL_57;
  }
  uint64_t v31 = sub_100023D14(v39, v18);
  os_log_type_t v28 = v40;
  uint64_t v18 = v41;
  unint64_t v1 = v42;
  if (v42)
  {
    sub_100036E20();
    swift_unknownObjectRetain_n();
    char v43 = (void *)swift_dynamicCastClass();
    if (!v43)
    {
      swift_unknownObjectRelease();
      char v43 = _swiftEmptyArrayStorage;
    }
    uint64_t v44 = v43[2];
    swift_release();
    if (__OFSUB__(v1 >> 1, v18)) {
      goto LABEL_58;
    }
    if (v44 != (v1 >> 1) - v18) {
      goto LABEL_59;
    }
    os_log_type_t v28 = (void *)swift_dynamicCastClass();
    if (!v28)
    {
      swift_unknownObjectRelease();
      os_log_type_t v28 = _swiftEmptyArrayStorage;
    }
    goto LABEL_38;
  }
  while (1)
  {
    os_log_type_t v28 = sub_100025260((uint64_t)v31, (uint64_t)v28, v18, v1);
LABEL_38:
    uint64_t v45 = v0[69];
    swift_unknownObjectRelease();
    v70[0] = (uint64_t)v28;
    uint64_t v31 = v70;
    sub_100025654();
    uint64_t v46 = *(void *)(v45 + 64);
    if ((v46 & 0x8000000000000000) == 0) {
      break;
    }
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    swift_unknownObjectRelease();
  }
  uint64_t v47 = sub_10002380C(v46, v70[0]);
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  unint64_t v53 = v52;
  if (v52)
  {
    sub_100036E20();
    swift_unknownObjectRetain_n();
    uint64_t v55 = (void *)swift_dynamicCastClass();
    if (!v55)
    {
      swift_unknownObjectRelease();
      uint64_t v55 = _swiftEmptyArrayStorage;
    }
    uint64_t v56 = v55[2];
    swift_release();
    if (__OFSUB__(v53 >> 1, v51))
    {
      __break(1u);
    }
    else if (v56 == (v53 >> 1) - v51)
    {
      uint64_t v54 = (void *)swift_dynamicCastClass();
      if (!v54)
      {
        swift_unknownObjectRelease();
        uint64_t v54 = _swiftEmptyArrayStorage;
      }
      goto LABEL_47;
    }
    swift_unknownObjectRelease();
  }
  uint64_t v54 = sub_100025260(v47, v49, v51, v53);
LABEL_47:
  swift_unknownObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v57 = sub_1000365A0();
  os_log_type_t v58 = sub_100036A80();
  if (os_log_type_enabled(v57, v58))
  {
    os_log_type_t v59 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v59 = 134217984;
    v0[56] = v54[2];
    sub_100036B00();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v57, v58, "Number of sampled embeddings: %ld.", v59, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  swift_bridgeObjectRetain_n();
  uint64_t v60 = sub_1000365A0();
  os_log_type_t v61 = sub_100036A90();
  if (os_log_type_enabled(v60, v61))
  {
    uint64_t v62 = (uint8_t *)swift_slowAlloc();
    v70[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v62 = 136315138;
    sub_100036590();
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_100036970();
    unint64_t v65 = v64;
    swift_release();
    v0[55] = sub_10000B1D4(v63, v65, v70);
    sub_100036B00();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v60, v61, "Sampled Embeddings data: %s\n", v62, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v66 = (uint64_t (*)(void *))v0[1];
  return v66(v54);
}

uint64_t sub_10002D4BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[39] = a2;
  v3[40] = a3;
  v3[38] = a1;
  return _swift_task_switch(sub_10002D4E0, 0, 0);
}

uint64_t sub_10002D4E0()
{
  swift_retain();
  sub_1000343D8(v0 + 2);
  if (qword_100044478 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000365C0();
  v0[41] = sub_100007D00(v1, (uint64_t)qword_1000488A0);
  uint64_t v2 = sub_1000365A0();
  os_log_type_t v3 = sub_100036A80();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Getting, shuffling and sampling embeddings.", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100044DA8 + dword_100044DA8);
  os_log_type_t v5 = (void *)swift_task_alloc();
  v0[42] = v5;
  *os_log_type_t v5 = v0;
  v5[1] = sub_10002D6A8;
  uint64_t v6 = v0[39];
  uint64_t v7 = v0[40];
  return v9((uint64_t)(v0 + 2), v6, v7);
}

uint64_t sub_10002D6A8(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v3 + 344) = a1;
  *(void *)(v3 + 352) = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_10002E048(v3 + 16);
    os_log_type_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    return _swift_task_switch(sub_10002D7F8, 0, 0);
  }
}

void sub_10002D7F8()
{
  uint64_t v56 = v0;
  uint64_t v1 = sub_1000364C0();
  if (!v2)
  {
    swift_bridgeObjectRelease();
    sub_10002E048(v0 + 16);
    uint64_t v18 = sub_1000365A0();
    os_log_type_t v19 = sub_100036AA0();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Model attachment not found.", v20, 2u);
      swift_slowDealloc();
    }

    swift_retain_n();
    uint64_t v21 = sub_1000365A0();
    os_log_type_t v22 = sub_100036A90();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      sub_1000364B0();
      sub_100036190();
      uint64_t v24 = sub_100036970();
      unint64_t v26 = v25;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 280) = sub_10000B1D4(v24, v26, &v55);
      sub_100036B00();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Task attachments = %s.", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    sub_10001DA38();
    swift_allocError();
    *uint64_t v31 = 4;
    swift_willThrow();
    goto LABEL_19;
  }
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  uint64_t v53 = v0 + 16;
  os_log_type_t v5 = *(void **)(v0 + 48);
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_10002714C(v6);
  swift_bridgeObjectRelease();
  uint64_t v54 = v7;
  Swift::Int v8 = *(void *)(v0 + 32);
  uint64_t v9 = *(NSObject **)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_100025C9C(&v55, v8, (Swift::Int)v9);
  swift_bridgeObjectRelease();
  char v10 = *(unsigned char *)(v0 + 144);
  unint64_t v11 = sub_1000365A0();
  os_log_type_t v12 = sub_100036A80();
  BOOL v13 = os_log_type_enabled(v11, v12);
  if ((v10 & 1) == 0)
  {
    if (v13)
    {
      os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Using CoreML Trainer for Private Evolution.", v14, 2u);
      swift_slowDealloc();
    }

    uint64_t v15 = *(char **)(v0 + 56);
    if (((unint64_t)v15 & 0x8000000000000000) == 0)
    {
      uint64_t v16 = *(void *)(v0 + 352);
      id v17 = sub_1000283F4(*(void *)(v0 + 344), v15, v3, v4, *(void *)(v0 + 16), *(void *)(v0 + 24), v54);
      if (v16) {
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v33 = sub_1000365A0();
      os_log_type_t v34 = sub_100036A80();
      if (os_log_type_enabled(v33, v34))
      {
        unint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Extracting outputs for Private Evolution.", v35, 2u);
        swift_slowDealloc();
      }

      sub_1000291BC(v17, v8, v9, (uint64_t)v5);
      uint64_t v41 = v40;
      sub_10002E048(v53);
      swift_bridgeObjectRetain();
      unint64_t v42 = sub_1000365A0();
      uint64_t v43 = sub_100036A80();
      if (os_log_type_enabled(v42, (os_log_type_t)v43))
      {
        id v44 = v17;
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 134217984;
        *(void *)(v0 + 288) = *(void *)(v41 + 16);
        sub_100036B00();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v43, "Finishing plugin by returning %ld metrics and histogram.", v45, 0xCu);
        id v17 = v44;
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      sub_100023D9C(v41);
      swift_bridgeObjectRelease();
      sub_1000363C0();
      swift_allocObject();
      uint64_t v51 = sub_1000363B0();

      goto LABEL_36;
    }
    __break(1u);
LABEL_40:
    __break(1u);
    return;
  }
  if (v13)
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Using Espresso MIL Trainer for Private Evolution.", v27, 2u);
    swift_slowDealloc();
  }

  uint64_t v28 = *(void *)(v0 + 56);
  if (v28 < 0) {
    goto LABEL_40;
  }
  uint64_t v29 = *(void *)(v0 + 352);
  unint64_t v30 = sub_10002A02C(*(void *)(v0 + 344), v28, v3, v4, *(void *)(v0 + 16), *(void *)(v0 + 24), v54);
  if (v29)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10002E048(v53);
LABEL_19:
    os_log_type_t v32 = *(void (**)(void))(v0 + 8);
    v32();
    return;
  }
  uint64_t v36 = v30;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v37 = sub_1000365A0();
  os_log_type_t v38 = sub_100036A80();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Extracting outputs for Private Evolution.", v39, 2u);
    swift_slowDealloc();
  }

  sub_10002A96C(v36, v8, (unint64_t)v9, v5);
  uint64_t v47 = v46;
  swift_bridgeObjectRelease();
  sub_10002E048(v53);
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_1000365A0();
  uint64_t v49 = sub_100036A80();
  if (os_log_type_enabled(v48, (os_log_type_t)v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v50 = 134217984;
    *(void *)(v0 + 296) = *(void *)(v47 + 16);
    sub_100036B00();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v49, "Finishing plugin by returning %ld metrics and histogram.", v50, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  sub_100023D9C(v47);
  swift_bridgeObjectRelease();
  sub_1000363C0();
  swift_allocObject();
  uint64_t v51 = sub_1000363B0();
LABEL_36:
  unint64_t v52 = *(void (**)(uint64_t))(v0 + 8);
  v52(v51);
}

uint64_t sub_10002E048(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v12 = *(void *)(a1 + 144);
  uint64_t v13 = *(void *)(a1 + 136);
  uint64_t v10 = *(void *)(a1 + 168);
  uint64_t v11 = *(void *)(a1 + 160);
  uint64_t v8 = *(void *)(a1 + 184);
  uint64_t v9 = *(void *)(a1 + 176);
  uint64_t v7 = *(void *)(a1 + 192);
  long long v5 = *(_OWORD *)(a1 + 216);
  long long v6 = *(_OWORD *)(a1 + 200);
  long long v4 = *(_OWORD *)(a1 + 232);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002E150(v13, v12, v2, v11, v10, v9, v8, v7, v6, *((uint64_t *)&v6 + 1), v5, *((uint64_t *)&v5 + 1), v4);
  return a1;
}

uint64_t sub_10002E150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a13 != 1)
  {
    sub_100006AC4(a7);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10002E1B8()
{
  return swift_release();
}

unint64_t sub_10002E1C0()
{
  unint64_t result = qword_100044DE0;
  if (!qword_100044DE0)
  {
    sub_100036190();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044DE0);
  }
  return result;
}

uint64_t sub_10002E218(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006780(&qword_100044DE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002E280(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 96);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10002E2A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 152);
  uint64_t v12 = *(void *)(a1 + 144);
  uint64_t v13 = *(void *)(a1 + 136);
  uint64_t v10 = *(void *)(a1 + 168);
  uint64_t v11 = *(void *)(a1 + 160);
  uint64_t v8 = *(void *)(a1 + 184);
  uint64_t v9 = *(void *)(a1 + 176);
  uint64_t v7 = *(void *)(a1 + 192);
  long long v5 = *(_OWORD *)(a1 + 216);
  long long v6 = *(_OWORD *)(a1 + 200);
  long long v4 = *(_OWORD *)(a1 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10002E3AC(v13, v12, v2, v11, v10, v9, v8, v7, v6, *((uint64_t *)&v6 + 1), v5, *((uint64_t *)&v5 + 1), v4);
  return a1;
}

uint64_t sub_10002E3AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a13 != 1)
  {
    sub_100006B28(a7);
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10002E414(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EmailExtractor();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivateEvolutionPluginError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrivateEvolutionPluginError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *uint64_t result = a2 + 17;
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
        JUMPOUT(0x10002E5CCLL);
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
          *uint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateEvolutionPluginError()
{
  return &type metadata for PrivateEvolutionPluginError;
}

unint64_t sub_10002E608()
{
  unint64_t result = qword_100044E10;
  if (!qword_100044E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044E10);
  }
  return result;
}

unint64_t sub_10002E65C()
{
  unint64_t result = qword_100044E18;
  if (!qword_100044E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044E18);
  }
  return result;
}

unint64_t sub_10002E6B0()
{
  unint64_t result = qword_100044E20;
  if (!qword_100044E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044E20);
  }
  return result;
}

int *ExtractedMessage.init(date:sender:receiver:subject:body:conversationId:autoSubmitted:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  uint64_t v21 = sub_100036250();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(a9, a1, v21);
  unint64_t result = (int *)type metadata accessor for ExtractedMessage();
  uint64_t v23 = (void *)(a9 + result[5]);
  *uint64_t v23 = a2;
  v23[1] = a3;
  uint64_t v24 = (void *)(a9 + result[6]);
  *uint64_t v24 = a4;
  v24[1] = a5;
  unint64_t v25 = (void *)(a9 + result[7]);
  *unint64_t v25 = a6;
  v25[1] = a7;
  unint64_t v26 = (void *)(a9 + result[8]);
  *unint64_t v26 = a8;
  v26[1] = a10;
  if (a12) {
    a11 = 0;
  }
  *(void *)(a9 + result[9]) = a11;
  uint64_t v28 = (void *)(a9 + result[10]);
  *uint64_t v28 = a13;
  v28[1] = a14;
  return result;
}

uint64_t type metadata accessor for ExtractedMessage()
{
  uint64_t result = qword_100044F40;
  if (!qword_100044F40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void __swiftcall ExtractedConversation.init(conversationId:count:messages:conversationText:)(PrivateEvolutionPlugin::ExtractedConversation *__return_ptr retstr, Swift::Int64 conversationId, Swift::Int count, Swift::OpaquePointer messages, Swift::String conversationText)
{
  retstr->conversationId = conversationId;
  retstr->count = count;
  retstr->messages = messages;
  retstr->conversationText = conversationText;
}

PrivateEvolutionPlugin::ExtractedItem __swiftcall ExtractedItem.init(itemId:text:)(Swift::Int64 itemId, Swift::String text)
{
  *(void *)uint64_t v2 = itemId;
  *(Swift::String *)(v2 + 8) = text;
  result.text = text;
  result.itemId = itemId;
  return result;
}

uint64_t ExtractedMessage.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100036250();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t ExtractedMessage.sender.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ExtractedMessage() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ExtractedMessage.receiver.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ExtractedMessage() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ExtractedMessage.subject.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ExtractedMessage() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ExtractedMessage.body.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ExtractedMessage() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ExtractedMessage.conversationId.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ExtractedMessage() + 36));
}

uint64_t ExtractedMessage.autoSubmitted.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ExtractedMessage() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10002EA58()
{
  uint64_t result = 1702125924;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7265646E6573;
      break;
    case 2:
      uint64_t result = 0x7265766965636572;
      break;
    case 3:
      uint64_t result = 0x7463656A627573;
      break;
    case 4:
      uint64_t result = 2036625250;
      break;
    case 5:
      uint64_t result = 0x61737265766E6F63;
      break;
    case 6:
      uint64_t result = 0x6D6275536F747561;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002EB3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10003295C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10002EB64(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_10002EB70(uint64_t a1)
{
  unint64_t v2 = sub_10002EE90();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002EBAC(uint64_t a1)
{
  unint64_t v2 = sub_10002EE90();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ExtractedMessage.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100006780(&qword_100044E28);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000067C4(a1, a1[3]);
  sub_10002EE90();
  sub_100036EF0();
  v8[15] = 0;
  sub_100036250();
  sub_10002FC18(&qword_100044E38, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_100036DC0();
  if (!v1)
  {
    type metadata accessor for ExtractedMessage();
    v8[14] = 1;
    sub_100036D80();
    v8[13] = 2;
    sub_100036D80();
    v8[12] = 3;
    sub_100036D80();
    v8[11] = 4;
    sub_100036D80();
    v8[10] = 5;
    sub_100036DD0();
    v8[9] = 6;
    sub_100036D40();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_10002EE90()
{
  unint64_t result = qword_100044E30;
  if (!qword_100044E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044E30);
  }
  return result;
}

uint64_t ExtractedMessage.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v4 = sub_100036250();
  uint64_t v35 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v37 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_100006780(&qword_100044E40);
  uint64_t v36 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  BOOL v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = (int *)type metadata accessor for ExtractedMessage();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067C4(a1, a1[3]);
  sub_10002EE90();
  uint64_t v39 = v7;
  sub_100036EE0();
  if (v2) {
    return sub_10000685C((uint64_t)a1);
  }
  uint64_t v11 = v36;
  uint64_t v33 = a1;
  uint64_t v12 = (uint64_t)v10;
  char v46 = 0;
  sub_10002FC18(&qword_100044E48, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v13 = v37;
  uint64_t v14 = v38;
  sub_100036D20();
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v12, v13, v4);
  char v45 = 1;
  uint64_t v15 = sub_100036CE0();
  uint64_t v16 = (uint64_t *)(v12 + v8[5]);
  *uint64_t v16 = v15;
  v16[1] = v17;
  char v44 = 2;
  uint64_t v18 = sub_100036CE0();
  os_log_type_t v19 = (uint64_t *)(v12 + v8[6]);
  *os_log_type_t v19 = v18;
  v19[1] = v20;
  char v43 = 3;
  uint64_t v21 = sub_100036CE0();
  os_log_type_t v22 = (uint64_t *)(v12 + v8[7]);
  *os_log_type_t v22 = v21;
  v22[1] = v23;
  char v42 = 4;
  uint64_t v24 = sub_100036CE0();
  unint64_t v25 = (uint64_t *)(v12 + v8[8]);
  *unint64_t v25 = v24;
  v25[1] = v26;
  char v41 = 5;
  *(void *)(v12 + v8[9]) = sub_100036D30();
  char v40 = 6;
  uint64_t v27 = sub_100036CA0();
  uint64_t v29 = v28;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v39, v14);
  unint64_t v30 = (uint64_t *)(v12 + v8[10]);
  *unint64_t v30 = v27;
  v30[1] = v29;
  sub_10002F424(v12, v34);
  sub_10000685C((uint64_t)v33);
  return sub_1000145A4(v12);
}

uint64_t sub_10002F424(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExtractedMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002F488@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ExtractedMessage.init(from:)(a1, a2);
}

uint64_t sub_10002F4A0(void *a1)
{
  return ExtractedMessage.encode(to:)(a1);
}

uint64_t ExtractedConversation.conversationId.getter()
{
  return *(void *)v0;
}

uint64_t ExtractedConversation.count.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t ExtractedConversation.messages.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ExtractedConversation.conversationText.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_10002F500()
{
  unint64_t result = 0x61737265766E6F63;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x746E756F63;
      break;
    case 2:
      unint64_t result = 0x736567617373656DLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10002F59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100032C64(a1, a2);
  *a3 = result;
  return result;
}

void sub_10002F5C4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10002F5D0(uint64_t a1)
{
  unint64_t v2 = sub_10002F878();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002F60C(uint64_t a1)
{
  unint64_t v2 = sub_10002F878();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ExtractedConversation.encode(to:)(void *a1)
{
  uint64_t v4 = sub_100006780(&qword_100044E50);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v14 = v8;
  uint64_t v9 = v1[3];
  v12[1] = v1[4];
  v12[2] = v9;
  sub_1000067C4(a1, a1[3]);
  sub_10002F878();
  sub_100036EF0();
  char v19 = 0;
  sub_100036DD0();
  if (!v2)
  {
    uint64_t v10 = v13;
    char v18 = 1;
    sub_100036DA0();
    uint64_t v15 = v10;
    char v17 = 2;
    sub_100006780(&qword_100044E60);
    sub_10002FB84(&qword_100044E68, &qword_100044E70);
    sub_100036DC0();
    char v16 = 3;
    sub_100036D80();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_10002F878()
{
  unint64_t result = qword_100044E58;
  if (!qword_100044E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044E58);
  }
  return result;
}

uint64_t ExtractedConversation.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100006780(&qword_100044E78);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067C4(a1, a1[3]);
  sub_10002F878();
  sub_100036EE0();
  if (v2) {
    return sub_10000685C((uint64_t)a1);
  }
  char v24 = 0;
  uint64_t v9 = sub_100036D30();
  char v23 = 1;
  uint64_t v10 = sub_100036D00();
  sub_100006780(&qword_100044E60);
  char v22 = 2;
  sub_10002FB84(&qword_100044E80, &qword_100044E88);
  sub_100036D20();
  char v21 = 3;
  uint64_t v19 = v20;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_100036CE0();
  uint64_t v13 = v12;
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v11;
  v14(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  uint64_t v15 = v18;
  a2[2] = v19;
  a2[3] = v15;
  a2[4] = v13;
  swift_bridgeObjectRetain();
  sub_10000685C((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002FB84(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006458(&qword_100044E60);
    sub_10002FC18(a2, (void (*)(uint64_t))type metadata accessor for ExtractedMessage);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002FC18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002FC60@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ExtractedConversation.init(from:)(a1, a2);
}

uint64_t sub_10002FC78(void *a1)
{
  return ExtractedConversation.encode(to:)(a1);
}

uint64_t ConversationEmbedding.embedding.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ConversationEmbedding.embeddingModel.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

PrivateEvolutionPlugin::ConversationEmbedding __swiftcall ConversationEmbedding.init(conversationId:embedding:embeddingModel:)(Swift::Int64 conversationId, Swift::OpaquePointer embedding, Swift::String_optional embeddingModel)
{
  *(void *)uint64_t v3 = conversationId;
  *(Swift::OpaquePointer *)(v3 + 8) = embedding;
  *(Swift::String_optional *)(v3 + 16) = embeddingModel;
  result.embeddingModel = embeddingModel;
  result.embedding = embedding;
  result.conversationId = conversationId;
  return result;
}

uint64_t sub_10002FCD4()
{
  if (*v0) {
    return 0x6E69646465626D65;
  }
  else {
    return 0x61737265766E6F63;
  }
}

uint64_t sub_10002FD4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100032E38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10002FD74(uint64_t a1)
{
  unint64_t v2 = sub_10002FFDC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002FDB0(uint64_t a1)
{
  unint64_t v2 = sub_10002FFDC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ConversationEmbedding.encode(to:)(void *a1)
{
  uint64_t v4 = sub_100006780(&qword_100044E90);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[1];
  v10[1] = v1[2];
  uint64_t v11 = v8;
  v10[0] = v1[3];
  sub_1000067C4(a1, a1[3]);
  sub_10002FFDC();
  sub_100036EF0();
  char v15 = 0;
  sub_100036DD0();
  if (!v2)
  {
    uint64_t v12 = v11;
    char v14 = 1;
    sub_100006780(&qword_100044750);
    sub_1000302A0(&qword_100044EA0);
    sub_100036DC0();
    char v13 = 2;
    sub_100036D40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_10002FFDC()
{
  unint64_t result = qword_100044E98;
  if (!qword_100044E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044E98);
  }
  return result;
}

uint64_t ConversationEmbedding.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100006780(&qword_100044EA8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067C4(a1, a1[3]);
  sub_10002FFDC();
  sub_100036EE0();
  if (v2) {
    return sub_10000685C((uint64_t)a1);
  }
  char v19 = 0;
  uint64_t v9 = sub_100036D30();
  sub_100006780(&qword_100044750);
  char v18 = 1;
  sub_1000302A0(&qword_100044EB0);
  sub_100036D20();
  uint64_t v10 = v16[1];
  char v17 = 2;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_100036CA0();
  uint64_t v13 = v12;
  char v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16[0] = v11;
  v14(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v16[0];
  a2[3] = v13;
  swift_bridgeObjectRetain();
  sub_10000685C((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000302A0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006458(&qword_100044750);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100030304@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ConversationEmbedding.init(from:)(a1, a2);
}

uint64_t sub_10003031C(void *a1)
{
  return ConversationEmbedding.encode(to:)(a1);
}

uint64_t ExtractedItem.text.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_100030364(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_10003037C()
{
  if (*v0) {
    return 1954047348;
  }
  else {
    return 0x64496D657469;
  }
}

uint64_t sub_1000303AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100032FDC(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000303D4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000303E0(uint64_t a1)
{
  unint64_t v2 = sub_1000305C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10003041C(uint64_t a1)
{
  unint64_t v2 = sub_1000305C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ExtractedItem.encode(to:)(void *a1)
{
  uint64_t v4 = sub_100006780(&qword_100044EB8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 8);
  v10[0] = *(void *)(v1 + 16);
  v10[1] = v8;
  sub_1000067C4(a1, a1[3]);
  sub_1000305C8();
  sub_100036EF0();
  char v12 = 0;
  sub_100036DD0();
  if (!v2)
  {
    char v11 = 1;
    sub_100036D80();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1000305C8()
{
  unint64_t result = qword_100044EC0;
  if (!qword_100044EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044EC0);
  }
  return result;
}

uint64_t ExtractedItem.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100006780(&qword_100044EC8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067C4(a1, a1[3]);
  sub_1000305C8();
  sub_100036EE0();
  if (!v2)
  {
    char v16 = 0;
    uint64_t v9 = sub_100036D30();
    char v15 = 1;
    uint64_t v11 = sub_100036CE0();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v13;
  }
  return sub_10000685C((uint64_t)a1);
}

uint64_t sub_1000307C0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ExtractedItem.init(from:)(a1, a2);
}

uint64_t sub_1000307D8(void *a1)
{
  return ExtractedItem.encode(to:)(a1);
}

uint64_t EmbeddingItem.sourceType.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall EmbeddingItem.init(itemId:embedding:embeddingModel:sourceType:)(PrivateEvolutionPlugin::EmbeddingItem *__return_ptr retstr, Swift::Int64 itemId, Swift::OpaquePointer embedding, Swift::String_optional embeddingModel, Swift::String_optional sourceType)
{
  retstr->itemId = itemId;
  retstr->embedding = embedding;
  retstr->embeddingModel = embeddingModel;
  retstr->sourceType = sourceType;
}

uint64_t sub_100030830()
{
  uint64_t result = 0x64496D657469;
  switch(*v0)
  {
    case 1:
    case 2:
      uint64_t result = 0x6E69646465626D65;
      break;
    case 3:
      uint64_t result = 0x7954656372756F73;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000308C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000330B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000308E8(uint64_t a1)
{
  unint64_t v2 = sub_100030B8C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100030924(uint64_t a1)
{
  unint64_t v2 = sub_100030B8C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t EmbeddingItem.encode(to:)(void *a1)
{
  uint64_t v4 = sub_100006780(&qword_100044ED0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[1];
  v11[3] = v1[2];
  uint64_t v12 = v8;
  uint64_t v9 = v1[3];
  v11[1] = v1[4];
  _OWORD v11[2] = v9;
  v11[0] = v1[5];
  sub_1000067C4(a1, a1[3]);
  sub_100030B8C();
  sub_100036EF0();
  char v17 = 0;
  sub_100036DD0();
  if (!v2)
  {
    uint64_t v13 = v12;
    char v16 = 1;
    sub_100006780(&qword_100044750);
    sub_1000302A0(&qword_100044EA0);
    sub_100036DC0();
    char v15 = 2;
    sub_100036D40();
    char v14 = 3;
    sub_100036D40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_100030B8C()
{
  unint64_t result = qword_100044ED8;
  if (!qword_100044ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044ED8);
  }
  return result;
}

uint64_t EmbeddingItem.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100006780(&qword_100044EE0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067C4(a1, a1[3]);
  sub_100030B8C();
  sub_100036EE0();
  if (v2) {
    return sub_10000685C((uint64_t)a1);
  }
  char v25 = 0;
  uint64_t v9 = sub_100036D30();
  sub_100006780(&qword_100044750);
  char v24 = 1;
  sub_1000302A0(&qword_100044EB0);
  sub_100036D20();
  uint64_t v10 = v21;
  char v23 = 2;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_100036CA0();
  uint64_t v20 = v11;
  char v22 = 3;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_100036CA0();
  uint64_t v14 = v13;
  char v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  *a2 = v9;
  a2[1] = v10;
  uint64_t v16 = v20;
  a2[2] = v19;
  a2[3] = v16;
  a2[4] = v18;
  a2[5] = v14;
  sub_10000685C((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100030ECC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return EmbeddingItem.init(from:)(a1, a2);
}

uint64_t sub_100030EE4(void *a1)
{
  return EmbeddingItem.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ExtractedMessage(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100036250();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (uint64_t *)((char *)a1 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (uint64_t *)((char *)a1 + v17);
    char v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    char v25 = (uint64_t *)((char *)a1 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = v26[1];
    *char v25 = *v26;
    v25[1] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ExtractedMessage(uint64_t a1)
{
  uint64_t v2 = sub_100036250();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ExtractedMessage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100036250();
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
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = (void *)(a1 + v16);
  uint64_t v21 = (void *)(a2 + v16);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v24 = (void *)(a1 + v23);
  char v25 = (void *)(a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ExtractedMessage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100036250();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
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
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v19 = a3[10];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ExtractedMessage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100036250();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for ExtractedMessage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100036250();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
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
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtractedMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100031520);
}

uint64_t sub_100031520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100036250();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ExtractedMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000315F8);
}

uint64_t sub_1000315F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100036250();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1000316B8()
{
  uint64_t result = sub_100036250();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for ExtractedConversation()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ExtractedConversation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ExtractedConversation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ExtractedConversation(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ExtractedConversation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtractedConversation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtractedConversation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractedConversation()
{
  return &type metadata for ExtractedConversation;
}

uint64_t destroy for ConversationEmbedding()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ConversationEmbedding(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ConversationEmbedding(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ConversationEmbedding(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for ConversationEmbedding(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConversationEmbedding(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ConversationEmbedding(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ConversationEmbedding()
{
  return &type metadata for ConversationEmbedding;
}

uint64_t initializeBufferWithCopyOfBuffer for ExtractedItem(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ExtractedItem()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ExtractedItem(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ExtractedItem(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtractedItem(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ExtractedItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ExtractedItem()
{
  return &type metadata for ExtractedItem;
}

uint64_t destroy for EmbeddingItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EmbeddingItem(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EmbeddingItem(void *a1, void *a2)
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
  return a1;
}

__n128 initializeWithTake for EmbeddingItem(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for EmbeddingItem(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmbeddingItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmbeddingItem(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmbeddingItem()
{
  return &type metadata for EmbeddingItem;
}

ValueMetadata *type metadata accessor for EmbeddingItem.CodingKeys()
{
  return &type metadata for EmbeddingItem.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ExtractedItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ExtractedItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100032054);
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

unsigned char *sub_10003207C(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ExtractedItem.CodingKeys()
{
  return &type metadata for ExtractedItem.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ConversationEmbedding.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x100032164);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationEmbedding.CodingKeys()
{
  return &type metadata for ConversationEmbedding.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PrivateEvolutionPluginArgsError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s22PrivateEvolutionPlugin13EmbeddingItemV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x1000322F8);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractedConversation.CodingKeys()
{
  return &type metadata for ExtractedConversation.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ExtractedMessage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x1000323FCLL);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtractedMessage.CodingKeys()
{
  return &type metadata for ExtractedMessage.CodingKeys;
}

unint64_t sub_100032438()
{
  unint64_t result = qword_100044F90;
  if (!qword_100044F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044F90);
  }
  return result;
}

unint64_t sub_100032490()
{
  unint64_t result = qword_100044F98;
  if (!qword_100044F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044F98);
  }
  return result;
}

unint64_t sub_1000324E8()
{
  unint64_t result = qword_100044FA0;
  if (!qword_100044FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FA0);
  }
  return result;
}

unint64_t sub_100032540()
{
  unint64_t result = qword_100044FA8;
  if (!qword_100044FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FA8);
  }
  return result;
}

unint64_t sub_100032598()
{
  unint64_t result = qword_100044FB0;
  if (!qword_100044FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FB0);
  }
  return result;
}

unint64_t sub_1000325F0()
{
  unint64_t result = qword_100044FB8;
  if (!qword_100044FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FB8);
  }
  return result;
}

unint64_t sub_100032648()
{
  unint64_t result = qword_100044FC0;
  if (!qword_100044FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FC0);
  }
  return result;
}

unint64_t sub_1000326A0()
{
  unint64_t result = qword_100044FC8;
  if (!qword_100044FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FC8);
  }
  return result;
}

unint64_t sub_1000326F8()
{
  unint64_t result = qword_100044FD0;
  if (!qword_100044FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FD0);
  }
  return result;
}

unint64_t sub_100032750()
{
  unint64_t result = qword_100044FD8;
  if (!qword_100044FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FD8);
  }
  return result;
}

unint64_t sub_1000327A8()
{
  unint64_t result = qword_100044FE0;
  if (!qword_100044FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FE0);
  }
  return result;
}

unint64_t sub_100032800()
{
  unint64_t result = qword_100044FE8;
  if (!qword_100044FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FE8);
  }
  return result;
}

unint64_t sub_100032858()
{
  unint64_t result = qword_100044FF0;
  if (!qword_100044FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FF0);
  }
  return result;
}

unint64_t sub_1000328B0()
{
  unint64_t result = qword_100044FF8;
  if (!qword_100044FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044FF8);
  }
  return result;
}

unint64_t sub_100032908()
{
  unint64_t result = qword_100045000;
  if (!qword_100045000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045000);
  }
  return result;
}

uint64_t sub_10003295C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265646E6573 && a2 == 0xE600000000000000 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7265766965636572 && a2 == 0xE800000000000000 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7463656A627573 && a2 == 0xE700000000000000 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 2036625250 && a2 == 0xE400000000000000 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x61737265766E6F63 && a2 == 0xEE0064496E6F6974 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6D6275536F747561 && a2 == 0xED00006465747469)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_100036E10();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_100032C64(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x61737265766E6F63 && a2 == 0xEE0064496E6F6974;
  if (v2 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736567617373656DLL && a2 == 0xE800000000000000 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000010003A130)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_100036E10();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100032E38(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x61737265766E6F63 && a2 == 0xEE0064496E6F6974;
  if (v2 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E69646465626D65 && a2 == 0xE900000000000067 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E69646465626D65 && a2 == 0xEE006C65646F4D67)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_100036E10();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100032FDC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64496D657469 && a2 == 0xE600000000000000;
  if (v2 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_100036E10();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1000330B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64496D657469 && a2 == 0xE600000000000000;
  if (v2 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E69646465626D65 && a2 == 0xE900000000000067 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E69646465626D65 && a2 == 0xEE006C65646F4D67 || (sub_100036E10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7954656372756F73 && a2 == 0xEA00000000006570)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_100036E10();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1000332A4()
{
  uint64_t v0 = sub_1000365C0();
  sub_100033328(v0, qword_1000488A0);
  sub_100007D00(v0, (uint64_t)qword_1000488A0);
  return sub_1000365B0();
}

uint64_t *sub_100033328(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10003338C(char a1)
{
  unint64_t result = 0x706E496C65646F4DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x74754F6C65646F4DLL;
      break;
    case 2:
      unint64_t result = 0x614E63697274654DLL;
      break;
    case 3:
      unint64_t result = 0x6E69646465626D45;
      break;
    case 4:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0x754E656C706D6153;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 9:
      unint64_t result = 0xD000000000000014;
      break;
    case 10:
      unint64_t result = 0x6C65646F4D6C694DLL;
      break;
    case 11:
      unint64_t result = 0xD000000000000015;
      break;
    case 12:
      unint64_t result = 0x7478456C69616D45;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100033570(char a1)
{
  unint64_t result = 0x706E496C65646F4DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x74754F6C65646F4DLL;
      break;
    case 2:
      unint64_t result = 0x614E63697274654DLL;
      break;
    case 3:
      unint64_t result = 0x6E69646465626D45;
      break;
    case 4:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0x754E656C706D6153;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 9:
      unint64_t result = 0xD000000000000014;
      break;
    case 10:
      unint64_t result = 0x6C65646F4D6C694DLL;
      break;
    case 11:
      unint64_t result = 0xD000000000000015;
      break;
    case 12:
      unint64_t result = 0x7478456C69616D45;
      break;
    default:
      return result;
  }
  return result;
}

Swift::Int sub_100033754()
{
  uint64_t v1 = *v0;
  sub_100036EB0();
  sub_100036EC0(v1 + 10301);
  return sub_100036ED0();
}

void sub_1000337A0()
{
  sub_100036EC0(*v0 + 10301);
}

Swift::Int sub_1000337D4()
{
  uint64_t v1 = *v0;
  sub_100036EB0();
  sub_100036EC0(v1 + 10301);
  return sub_100036ED0();
}

uint64_t sub_10003381C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100035410(*a1);
  *a2 = result;
  return result;
}

void sub_100033848(void *a1@<X8>)
{
  *a1 = *v1 + 10301;
}

uint64_t sub_10003385C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000353BC();
  unint64_t v5 = sub_10002E6B0();

  return Error<>._code.getter(a1, a2, v4, v5);
}

uint64_t sub_1000338B4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10003338C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10003338C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100036E10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100033940()
{
  char v1 = *v0;
  sub_100036EB0();
  sub_10003338C(v1);
  sub_100036870();
  swift_bridgeObjectRelease();
  return sub_100036ED0();
}

uint64_t sub_1000339A4()
{
  sub_10003338C(*v0);
  sub_100036870();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000339F8()
{
  char v1 = *v0;
  sub_100036EB0();
  sub_10003338C(v1);
  sub_100036870();
  swift_bridgeObjectRelease();
  return sub_100036ED0();
}

uint64_t sub_100033A58@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100035428(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100033A88@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10003338C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100033AB4()
{
  return sub_100033570(*v0);
}

uint64_t sub_100033ABC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100035428(a1, a2);
  *a3 = result;
  return result;
}

void sub_100033AE4(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_100033AF0(uint64_t a1)
{
  unint64_t v2 = sub_100035C84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100033B2C(uint64_t a1)
{
  unint64_t v2 = sub_100035C84();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_100033B68()
{
  uint64_t v1 = (uint64_t)v0;
  unint64_t v2 = v0[6];
  if (!v2)
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1000365C0();
    sub_100007D00(v8, (uint64_t)qword_1000488A0);
    sub_10002E2A4((uint64_t)v0);
    uint64_t v9 = sub_1000365A0();
    os_log_type_t v10 = sub_100036AA0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 134217984;
      sub_100036B00();
      sub_10002E048(v1);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "minimumNumEvents %lu is not > 0", v11, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      sub_10002E048(v1);
    }

    char v18 = 1;
    goto LABEL_25;
  }
  unint64_t v3 = v0[7];
  if (v3 < v2)
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_1000365C0();
    sub_100007D00(v4, (uint64_t)qword_1000488A0);
    sub_10002E2A4((uint64_t)v0);
    uint64_t v5 = sub_1000365A0();
    os_log_type_t v6 = sub_100036AA0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 134218240;
      sub_100036B00();
      *(_WORD *)(v7 + 12) = 2048;
      sub_100036B00();
      sub_10002E048(v1);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "minimumNumEvents %lu is not <= maximumNumEvents %lu", (uint8_t *)v7, 0x16u);
      swift_slowDealloc();
    }
    else
    {
      sub_10002E048(v1);
    }

    char v18 = 2;
LABEL_25:
    sub_100034844();
    swift_allocError();
    *uint64_t v19 = v18;
    swift_willThrow();
    return;
  }
  unint64_t v12 = v0[8];
  if (v12 < v2 || v3 < v12)
  {
    if (qword_100044478 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1000365C0();
    sub_100007D00(v14, (uint64_t)qword_1000488A0);
    sub_10002E2A4((uint64_t)v0);
    uint64_t v15 = sub_1000365A0();
    os_log_type_t v16 = sub_100036AA0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 134218496;
      sub_100036B00();
      *(_WORD *)(v17 + 12) = 2048;
      sub_100036B00();
      *(_WORD *)(v17 + 22) = 2048;
      sub_100036B00();
      sub_10002E048(v1);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "sampleNumEvents %lu is not in [minimumNumEvents, maximumNumEvents] = [%lu, %lu]", (uint8_t *)v17, 0x20u);
      swift_slowDealloc();
    }
    else
    {
      sub_10002E048(v1);
    }

    char v18 = 3;
    goto LABEL_25;
  }
}

uint64_t sub_100033F58(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100006780(&qword_100045058);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067C4(a1, a1[3]);
  sub_100035C84();
  sub_100036EF0();
  LOBYTE(v10[0]) = 0;
  sub_100036D80();
  if (!v2)
  {
    LOBYTE(v10[0]) = 1;
    sub_100036D80();
    v10[0] = *(void *)(v3 + 32);
    char v11 = 2;
    sub_100006780(&qword_100044778);
    sub_100035D2C(&qword_100045060);
    sub_100036DC0();
    LOBYTE(v10[0]) = 3;
    sub_100036DB0();
    LOBYTE(v10[0]) = 4;
    sub_100036DB0();
    LOBYTE(v10[0]) = 5;
    sub_100036DB0();
    LOBYTE(v10[0]) = 6;
    sub_100036DB0();
    LOBYTE(v10[0]) = 7;
    sub_100036D80();
    LOBYTE(v10[0]) = 8;
    sub_100036D40();
    sub_100006B90(v3 + 104, (uint64_t)v13, &qword_100045018);
    sub_100006B90((uint64_t)v13, (uint64_t)v10, &qword_100045018);
    char v11 = 9;
    sub_100036D70();
    LOBYTE(v10[0]) = 10;
    sub_100036D80();
    LOBYTE(v10[0]) = 11;
    sub_100036D90();
    sub_100006B90(v3 + 136, (uint64_t)v12, &qword_100044DE8);
    sub_100006B90((uint64_t)v12, (uint64_t)v10, &qword_100044DE8);
    char v11 = 12;
    sub_100035D90();
    sub_100036D70();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void *sub_100034330@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100035474(a1, __src);
  if (!v2) {
    return memcpy(a2, __src, 0x108uLL);
  }
  return result;
}

uint64_t sub_100034384(void *a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_100033F58(a1);
}

void *sub_1000343D8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = self;
  sub_1000364D0();
  Class isa = sub_100036700().super.isa;
  swift_bridgeObjectRelease();
  __src[0] = 0;
  id v5 = [v3 dataWithJSONObject:isa options:0 error:__src];

  id v6 = __src[0];
  if (v5)
  {
    uint64_t v7 = sub_100036200();
    unint64_t v9 = v8;

    sub_1000360A0();
    swift_allocObject();
    sub_100036090();
    sub_100034898();
    sub_100036080();
    if (!v1)
    {
      sub_10000C9BC(v7, v9);
      swift_release();
      memcpy(__dst, __src, sizeof(__dst));
      memcpy(v19, __src, sizeof(v19));
      sub_10002E2A4((uint64_t)__dst);
      sub_100033B68();
      swift_release();
      sub_10002E048((uint64_t)__dst);
      return memcpy(a1, v19, 0x108uLL);
    }
    sub_10000C9BC(v7, v9);
    swift_release();
  }
  else
  {
    os_log_type_t v10 = v6;
    sub_100036130();

    swift_willThrow();
  }
  if (qword_100044478 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000365C0();
  sub_100007D00(v11, (uint64_t)qword_1000488A0);
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v12 = sub_1000365A0();
  os_log_type_t v13 = sub_100036AA0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 138412290;
    swift_errorRetain();
    os_log_type_t v16 = (void *)_swift_stdlib_bridgeErrorToNSError();
    __src[0] = v16;
    sub_100036B00();
    *uint64_t v15 = v16;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Couldn't form PrivateEvolutionPluginArgs: %@", v14, 0xCu);
    sub_100006780(&qword_100044740);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_100034844();
  swift_allocError();
  *uint64_t v17 = 0;
  swift_willThrow();
  swift_release();
  return (void *)swift_errorRelease();
}

unint64_t sub_100034844()
{
  unint64_t result = qword_100045008;
  if (!qword_100045008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045008);
  }
  return result;
}

unint64_t sub_100034898()
{
  unint64_t result = qword_100045010;
  if (!qword_100045010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045010);
  }
  return result;
}

uint64_t sub_1000348EC(uint64_t a1)
{
  return a1;
}

uint64_t *sub_100034918(uint64_t *a1)
{
  return a1;
}

uint64_t destroy for PrivateEvolutionPluginArgs(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 232) != 1)
  {
    if (*(void *)(a1 + 184) != 1) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for PrivateEvolutionPluginArgs(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v9 = *(void *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 == 1)
  {
    long long v10 = *(_OWORD *)(a2 + 216);
    *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 216) = v10;
    long long v11 = *(_OWORD *)(a2 + 248);
    *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 248) = v11;
    long long v12 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v12;
    long long v13 = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 184) = v13;
  }
  else
  {
    uint64_t v14 = *(void *)(a2 + 184);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
    *(_WORD *)(a1 + 161) = *(_WORD *)(a2 + 161);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
    if (v14 == 1)
    {
      long long v15 = *(_OWORD *)(a2 + 200);
      *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
      *(_OWORD *)(a1 + 200) = v15;
      *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
    }
    else
    {
      uint64_t v16 = *(void *)(a2 + 192);
      *(void *)(a1 + 184) = v14;
      *(void *)(a1 + 192) = v16;
      *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
      *(void *)(a1 + 208) = *(void *)(a2 + 208);
      *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
      swift_bridgeObjectRetain();
    }
    *(void *)(a1 + 224) = *(void *)(a2 + 224);
    *(void *)(a1 + 232) = v9;
    *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
    uint64_t v17 = *(void *)(a2 + 248);
    uint64_t v18 = *(void *)(a2 + 256);
    *(void *)(a1 + 248) = v17;
    *(void *)(a1 + 256) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for PrivateEvolutionPluginArgs(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v4 = (_OWORD *)(a1 + 136);
  uint64_t v5 = (long long *)(a2 + 136);
  uint64_t v6 = *(void *)(a2 + 232);
  if (*(void *)(a1 + 232) == 1)
  {
    if (v6 == 1)
    {
      long long v7 = *v5;
      long long v8 = *(_OWORD *)(a2 + 152);
      long long v9 = *(_OWORD *)(a2 + 184);
      *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
      *(_OWORD *)(a1 + 184) = v9;
      *uint64_t v4 = v7;
      *(_OWORD *)(a1 + 152) = v8;
      long long v10 = *(_OWORD *)(a2 + 200);
      long long v11 = *(_OWORD *)(a2 + 216);
      long long v12 = *(_OWORD *)(a2 + 248);
      *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
      *(_OWORD *)(a1 + 248) = v12;
      *(_OWORD *)(a1 + 200) = v10;
      *(_OWORD *)(a1 + 216) = v11;
    }
    else
    {
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
      *(unsigned char *)(a1 + 161) = *(unsigned char *)(a2 + 161);
      *(unsigned char *)(a1 + 162) = *(unsigned char *)(a2 + 162);
      uint64_t v19 = *(void *)(a2 + 168);
      *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
      *(void *)(a1 + 168) = v19;
      uint64_t v20 = *(void *)(a2 + 184);
      if (v20 == 1)
      {
        long long v21 = *(_OWORD *)(a2 + 184);
        long long v22 = *(_OWORD *)(a2 + 200);
        *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
        *(_OWORD *)(a1 + 184) = v21;
        *(_OWORD *)(a1 + 200) = v22;
      }
      else
      {
        *(void *)(a1 + 184) = v20;
        uint64_t v30 = *(void *)(a2 + 192);
        *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
        *(void *)(a1 + 192) = v30;
        uint64_t v31 = *(void *)(a2 + 208);
        *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
        *(void *)(a1 + 208) = v31;
        swift_bridgeObjectRetain();
      }
      *(void *)(a1 + 224) = *(void *)(a2 + 224);
      *(void *)(a1 + 232) = *(void *)(a2 + 232);
      *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
      *(void *)(a1 + 248) = *(void *)(a2 + 248);
      *(void *)(a1 + 256) = *(void *)(a2 + 256);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    sub_100034F64(a1 + 136);
    long long v13 = *(_OWORD *)(a2 + 184);
    long long v15 = *v5;
    long long v14 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 184) = v13;
    *uint64_t v4 = v15;
    *(_OWORD *)(a1 + 152) = v14;
    long long v16 = *(_OWORD *)(a2 + 248);
    long long v18 = *(_OWORD *)(a2 + 200);
    long long v17 = *(_OWORD *)(a2 + 216);
    *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
    *(_OWORD *)(a1 + 248) = v16;
    *(_OWORD *)(a1 + 200) = v18;
    *(_OWORD *)(a1 + 216) = v17;
  }
  else
  {
    uint64_t v23 = (long long *)(a1 + 184);
    uint64_t v24 = *(void *)(a1 + 184);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
    *(unsigned char *)(a1 + 161) = *(unsigned char *)(a2 + 161);
    *(unsigned char *)(a1 + 162) = *(unsigned char *)(a2 + 162);
    uint64_t v25 = *(void *)(a2 + 168);
    *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
    *(void *)(a1 + 168) = v25;
    uint64_t v27 = (long long *)(a2 + 184);
    uint64_t v26 = *(void *)(a2 + 184);
    if (v24 == 1)
    {
      if (v26 == 1)
      {
        long long v28 = *v27;
        long long v29 = *(_OWORD *)(a2 + 200);
        *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
        *uint64_t v23 = v28;
        *(_OWORD *)(a1 + 200) = v29;
      }
      else
      {
        *(void *)(a1 + 184) = v26;
        uint64_t v34 = *(void *)(a2 + 192);
        *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
        *(void *)(a1 + 192) = v34;
        uint64_t v35 = *(void *)(a2 + 208);
        *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
        *(void *)(a1 + 208) = v35;
        swift_bridgeObjectRetain();
      }
    }
    else if (v26 == 1)
    {
      sub_1000061DC(a1 + 184);
      char v32 = *(unsigned char *)(a2 + 216);
      long long v33 = *(_OWORD *)(a2 + 200);
      *uint64_t v23 = *v27;
      *(_OWORD *)(a1 + 200) = v33;
      *(unsigned char *)(a1 + 216) = v32;
    }
    else
    {
      *(void *)(a1 + 184) = v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v36 = *(void *)(a2 + 192);
      *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
      *(void *)(a1 + 192) = v36;
      uint64_t v37 = *(void *)(a2 + 208);
      *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
      *(void *)(a1 + 208) = v37;
    }
    *(void *)(a1 + 224) = *(void *)(a2 + 224);
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
    *(void *)(a1 + 248) = *(void *)(a2 + 248);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_100034F64(uint64_t a1)
{
  return a1;
}

void *initializeWithTake for PrivateEvolutionPluginArgs(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x108uLL);
}

uint64_t assignWithTake for PrivateEvolutionPluginArgs(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  if (*(void *)(a1 + 232) == 1) {
    goto LABEL_4;
  }
  uint64_t v9 = *(void *)(a2 + 232);
  if (v9 != 1)
  {
    uint64_t v14 = *(void *)(a2 + 184);
    uint64_t v15 = *(void *)(a1 + 184);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
    *(_WORD *)(a1 + 161) = *(_WORD *)(a2 + 161);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
    if (v15 != 1)
    {
      if (v14 != 1)
      {
        *(void *)(a1 + 184) = v14;
        swift_bridgeObjectRelease();
        *(void *)(a1 + 192) = *(void *)(a2 + 192);
        *(unsigned char *)(a1 + 200) = *(unsigned char *)(a2 + 200);
        *(void *)(a1 + 208) = *(void *)(a2 + 208);
        *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
        goto LABEL_10;
      }
      sub_1000061DC(a1 + 184);
    }
    long long v16 = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 200) = v16;
    *(unsigned char *)(a1 + 216) = *(unsigned char *)(a2 + 216);
LABEL_10:
    *(void *)(a1 + 224) = *(void *)(a2 + 224);
    *(void *)(a1 + 232) = v9;
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
    uint64_t v17 = *(void *)(a2 + 256);
    *(void *)(a1 + 248) = *(void *)(a2 + 248);
    *(void *)(a1 + 256) = v17;
    swift_bridgeObjectRelease();
    return a1;
  }
  sub_100034F64(a1 + 136);
LABEL_4:
  long long v10 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = v10;
  long long v11 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = v11;
  long long v12 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = v12;
  long long v13 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = v13;
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivateEvolutionPluginArgs(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 264)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivateEvolutionPluginArgs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 248) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 264) = 1;
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
    *(unsigned char *)(result + 264) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateEvolutionPluginArgs()
{
  return &type metadata for PrivateEvolutionPluginArgs;
}

unsigned char *storeEnumTagSinglePayload for PrivateEvolutionPluginArgsError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10003532CLL);
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

ValueMetadata *type metadata accessor for PrivateEvolutionPluginArgsError()
{
  return &type metadata for PrivateEvolutionPluginArgsError;
}

unint64_t sub_100035368()
{
  unint64_t result = qword_100045028;
  if (!qword_100045028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045028);
  }
  return result;
}

unint64_t sub_1000353BC()
{
  unint64_t result = qword_100045030;
  if (!qword_100045030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045030);
  }
  return result;
}

uint64_t sub_100035410(uint64_t a1)
{
  if ((unint64_t)(a1 - 10301) >= 4) {
    return 4;
  }
  else {
    return a1 - 10301;
  }
}

uint64_t sub_100035428(uint64_t a1, void *a2)
{
  v6._uint64_t countAndFlagsBits = a1;
  v3._rawValue = &off_100041A50;
  v6._uint64_t object = a2;
  unint64_t v4 = sub_100036C90(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xD) {
    return 13;
  }
  else {
    return v4;
  }
}

void *sub_100035474@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100006780(&qword_100045038);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  char v44 = a1;
  sub_1000067C4(a1, v9);
  sub_100035C84();
  sub_100036EE0();
  if (v2) {
    return (void *)sub_10000685C((uint64_t)v44);
  }
  char v42 = a2;
  uint64_t v43 = v6;
  LOBYTE(v47[0]) = 0;
  uint64_t v10 = sub_100036CE0();
  uint64_t v12 = v11;
  v49[0] = v10;
  v49[1] = v11;
  LOBYTE(v47[0]) = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_100036CE0();
  uint64_t v15 = v14;
  uint64_t v39 = v13;
  uint64_t v40 = v12;
  v49[2] = v13;
  v49[3] = v14;
  sub_100006780(&qword_100044778);
  LOBYTE(v46[0]) = 2;
  sub_100035D2C(&qword_100045048);
  swift_bridgeObjectRetain();
  uint64_t v41 = v15;
  sub_100036D20();
  uint64_t v38 = v10;
  uint64_t v16 = v47[0];
  v49[4] = v47[0];
  LOBYTE(v47[0]) = 3;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_100036D10();
  v49[5] = v17;
  LOBYTE(v47[0]) = 4;
  v49[6] = sub_100036D10();
  LOBYTE(v47[0]) = 5;
  uint64_t v37 = v49[6];
  v49[7] = sub_100036D10();
  LOBYTE(v47[0]) = 6;
  uint64_t v36 = v49[7];
  uint64_t v34 = sub_100036D10();
  uint64_t v35 = v17;
  v49[8] = v34;
  LOBYTE(v47[0]) = 7;
  uint64_t v18 = sub_100036CE0();
  uint64_t v20 = v19;
  uint64_t v33 = v18;
  v49[9] = v18;
  v49[10] = v19;
  LOBYTE(v47[0]) = 8;
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_100036CA0();
  uint64_t v31 = v20;
  v49[11] = v30;
  v49[12] = v21;
  LOBYTE(v46[0]) = 9;
  uint64_t v32 = v21;
  swift_bridgeObjectRetain();
  sub_100036CD0();
  v49[13] = v47[0];
  LOBYTE(v47[0]) = 10;
  uint64_t v29 = v49[13];
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_100036CE0();
  uint64_t v28 = v23;
  uint64_t v24 = v22;
  v49[14] = v22;
  v49[15] = v23;
  LOBYTE(v47[0]) = 11;
  swift_bridgeObjectRetain();
  char v25 = sub_100036CF0();
  int v50 = v25 & 1;
  LOBYTE(v49[16]) = v25 & 1;
  char v51 = 12;
  sub_100035CD8();
  sub_100036CD0();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v5);
  sub_100006B90((uint64_t)&v48, (uint64_t)v45, &qword_100044DE8);
  sub_100006B90((uint64_t)v45, (uint64_t)&v49[17], &qword_100044DE8);
  v46[0] = v38;
  v46[1] = v40;
  v46[2] = v39;
  v46[3] = v41;
  v46[4] = v16;
  v46[5] = v35;
  v46[6] = v37;
  v46[7] = v36;
  v46[8] = v34;
  v46[9] = v33;
  v46[10] = v31;
  v46[11] = v30;
  v46[12] = v32;
  v46[13] = v29;
  v46[14] = v24;
  v46[15] = v28;
  LOBYTE(v46[16]) = v50;
  sub_100006B90((uint64_t)v45, (uint64_t)&v46[17], &qword_100044DE8);
  sub_10002E2A4((uint64_t)v46);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000685C((uint64_t)v44);
  memcpy(v47, v49, sizeof(v47));
  sub_10002E048((uint64_t)v47);
  return memcpy(v42, v46, 0x108uLL);
}

unint64_t sub_100035C84()
{
  unint64_t result = qword_100045040;
  if (!qword_100045040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045040);
  }
  return result;
}

unint64_t sub_100035CD8()
{
  unint64_t result = qword_100045050;
  if (!qword_100045050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045050);
  }
  return result;
}

uint64_t sub_100035D2C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006458(&qword_100044778);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100035D90()
{
  unint64_t result = qword_100045068;
  if (!qword_100045068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045068);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PrivateEvolutionPluginArgs.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrivateEvolutionPluginArgs.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *unint64_t result = a2 + 12;
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
        JUMPOUT(0x100035F40);
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
          *unint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateEvolutionPluginArgs.CodingKeys()
{
  return &type metadata for PrivateEvolutionPluginArgs.CodingKeys;
}

unint64_t sub_100035F7C()
{
  unint64_t result = qword_100045070;
  if (!qword_100045070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045070);
  }
  return result;
}

unint64_t sub_100035FD4()
{
  unint64_t result = qword_100045078;
  if (!qword_100045078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045078);
  }
  return result;
}

unint64_t sub_10003602C()
{
  unint64_t result = qword_100045080;
  if (!qword_100045080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045080);
  }
  return result;
}

uint64_t sub_100036080()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_100036090()
{
  return JSONDecoder.init()();
}

uint64_t sub_1000360A0()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_1000360B0()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t sub_1000360C0()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_1000360D0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000360E0()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t sub_1000360F0()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100036100()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100036110()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_100036120()
{
  return type metadata accessor for __DataStorage();
}

uint64_t sub_100036130()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100036140()
{
  return type metadata accessor for URL.DirectoryHint();
}

void sub_100036150(NSURL *retstr@<X8>)
{
}

uint64_t sub_100036160()
{
  return URL.deletingLastPathComponent()();
}

uint64_t sub_100036170()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100036180()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_100036190()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000361A0()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_1000361B0()
{
  return Data.description.getter();
}

uint64_t sub_1000361C0()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t sub_1000361D0()
{
  return Data._Representation.subscript.getter();
}

uint64_t sub_1000361E0()
{
  return Data._copyBytesHelper(to:from:)();
}

NSData sub_1000361F0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100036200()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate sub_100036210()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100036220()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_100036230()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100036240()
{
  return Date.init()();
}

uint64_t sub_100036250()
{
  return type metadata accessor for Date();
}

uint64_t sub_100036260()
{
  return Locale.init(identifier:)();
}

NSLocale sub_100036270()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_100036280()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100036290()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000362A0()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_1000362B0()
{
  return static Calendar.current.getter();
}

uint64_t sub_1000362C0()
{
  return Calendar.timeZone.getter();
}

uint64_t sub_1000362D0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_1000362E0()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_1000362F0()
{
  return type metadata accessor for Calendar();
}

NSTimeZone sub_100036300()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_100036310()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100036320()
{
  return Regex.init(_regexString:version:)();
}

uint64_t sub_100036330()
{
  return Regex.Match.subscript.getter();
}

uint64_t sub_100036340()
{
  return Regex.Match.subscript.getter();
}

uint64_t sub_100036350()
{
  return Regex.Match.output.getter();
}

uint64_t sub_100036360()
{
  return Regex<A>.init(_:)();
}

uint64_t sub_100036370()
{
  return static AppExtension.main()();
}

uint64_t sub_1000363B0()
{
  return PFLTaskResult.init(json:vector:)();
}

uint64_t sub_1000363C0()
{
  return type metadata accessor for PFLTaskResult();
}

void sub_1000363D0()
{
}

uint64_t sub_1000363E0()
{
  return type metadata accessor for PFLTaskSource();
}

uint64_t sub_1000363F0()
{
  return static EspressoFunction.evaluation.getter();
}

uint64_t sub_100036400()
{
  return type metadata accessor for EspressoFunction();
}

uint64_t sub_100036410()
{
  return static PFLPluginConsent.PrivacyBudget.getter();
}

uint64_t sub_100036420()
{
  return static PFLPluginConsent.DNU.getter();
}

uint64_t sub_100036430()
{
  return type metadata accessor for PFLPluginConsent();
}

uint64_t sub_100036440()
{
  return dispatch thunk of EspressoMILTrainer.eval(_:featureSizes:numSamples:)();
}

uint64_t sub_100036450()
{
  return dispatch thunk of EspressoMILTrainer.load(path:functions:inputs:outputs:weights:)();
}

uint64_t sub_100036460()
{
  return dispatch thunk of EspressoMILTrainer.finalize(batchSize:learningRate:)();
}

uint64_t sub_100036470()
{
  return type metadata accessor for EspressoMILTrainer();
}

uint64_t sub_100036480()
{
  return EspressoMILTrainer.init(_:)();
}

uint64_t sub_100036490()
{
  return PerformanceMeasure.init()();
}

uint64_t sub_1000364A0()
{
  return type metadata accessor for PerformanceMeasure();
}

uint64_t sub_1000364B0()
{
  return dispatch thunk of PFLTask.attachments.getter();
}

uint64_t sub_1000364C0()
{
  return dispatch thunk of PFLTask.attachmentPath(name:)();
}

uint64_t sub_1000364D0()
{
  return dispatch thunk of PFLTask.recipe.getter();
}

uint64_t sub_1000364E0()
{
  return PFLPlugin.init(plugin:useCase:consent:taskSource:)();
}

uint64_t sub_1000364F0()
{
  return type metadata accessor for PFLPlugin();
}

uint64_t sub_100036500()
{
  return type metadata accessor for Library.Streams.Zeolite.Ledger.Embedding();
}

uint64_t sub_100036510()
{
  return static StreamResource.publisher(useCase:bmOptions:)();
}

uint64_t sub_100036520()
{
  return ZeoliteEmbedding.sourceType.getter();
}

uint64_t sub_100036530()
{
  return ZeoliteEmbedding.itemID.setter();
}

uint64_t sub_100036540()
{
  return ZeoliteEmbedding.modelID.getter();
}

uint64_t sub_100036550()
{
  return ZeoliteEmbedding.modelID.setter();
}

uint64_t sub_100036560()
{
  return ZeoliteEmbedding.embedding.getter();
}

uint64_t sub_100036570()
{
  return ZeoliteEmbedding.embedding.setter();
}

uint64_t sub_100036580()
{
  return ZeoliteEmbedding.init()();
}

uint64_t sub_100036590()
{
  return type metadata accessor for ZeoliteEmbedding();
}

uint64_t sub_1000365A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000365B0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000365C0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000365D0()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t sub_1000365E0()
{
  return static MorpheusProgram.registerFunction(name:f:)();
}

uint64_t sub_1000365F0()
{
  return dispatch thunk of MorpheusProgram.execute(args:keywords:)();
}

uint64_t sub_100036600()
{
  return static MorpheusProgram.fromDSL(_:)();
}

uint64_t sub_100036610()
{
  return type metadata accessor for MorpheusProgram();
}

uint64_t sub_100036620()
{
  return dispatch thunk of Function.call(args:keywords:)();
}

uint64_t sub_100036630()
{
  return Function.init(name:arguments:attrs:body:)();
}

uint64_t sub_100036640()
{
  return type metadata accessor for Function();
}

uint64_t sub_100036650()
{
  return Arguments.init(args:posonlyargs:kwonlyargs:kwDefaults:defaults:vaargs:kwargs:)();
}

uint64_t sub_100036660()
{
  return type metadata accessor for Arguments();
}

uint64_t sub_100036670()
{
  return static ChaChaPoly.open(_:using:)();
}

uint64_t sub_100036680()
{
  return type metadata accessor for CryptoKitError();
}

uint64_t sub_100036690()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t sub_1000366A0()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t sub_1000366B0()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t sub_1000366C0()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t sub_1000366D0()
{
  return SymmetricKey.init<A>(data:)();
}

uint64_t sub_1000366E0()
{
  return type metadata accessor for SymmetricKey();
}

uint64_t sub_1000366F0()
{
  return type metadata accessor for SHA256();
}

NSDictionary sub_100036700()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100036710()
{
  return Dictionary.description.getter();
}

uint64_t sub_100036720()
{
  return Character._isSingleScalar.getter();
}

uint64_t sub_100036730()
{
  return Character.hash(into:)();
}

uint64_t sub_100036740()
{
  return BidirectionalCollection<>.matches<A, B>(of:)();
}

uint64_t sub_100036750()
{
  return BidirectionalCollection<>.contains<A>(_:)();
}

uint64_t sub_100036760()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100036770()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t sub_100036780()
{
  return String.init(contentsOf:encoding:)();
}

NSString sub_100036790()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000367A0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000367B0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000367C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000367D0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_1000367E0()
{
  return String.init(data:encoding:)();
}

uint64_t sub_1000367F0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100036800()
{
  return String.Encoding.rawValue.getter();
}

uint64_t sub_100036810()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100036820()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100036830()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100036840()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_100036850()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_100036860()
{
  return String.replaceSubrange<A>(_:with:)();
}

uint64_t sub_100036870()
{
  return String.hash(into:)();
}

uint64_t sub_100036880()
{
  return String.count.getter();
}

void sub_100036890(Swift::String a1)
{
}

void sub_1000368A0(Swift::String a1)
{
}

uint64_t sub_1000368B0()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_1000368C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000368D0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_1000368E0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

void sub_1000368F0(Swift::Bool keepingCapacity)
{
}

uint64_t sub_100036900()
{
  return String.init<A>(_:)();
}

uint64_t sub_100036910()
{
  return String.subscript.getter();
}

uint64_t sub_100036920()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100036930()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100036940()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100036950()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100036960()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100036970()
{
  return Array.description.getter();
}

uint64_t sub_100036980()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100036990()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000369A0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000369B0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000369C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000369D0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1000369E0()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_1000369F0()
{
  return static Task<>.checkCancellation()();
}

NSNumber sub_100036A00()
{
  return Float._bridgeToObjectiveC()();
}

NSSet sub_100036A10()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100036A20()
{
  return Set.init(minimumCapacity:)();
}

NSNumber sub_100036A30()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100036A40()
{
  return RangeReplaceableCollection<>.replacing<A, B, C>(_:maxReplacements:with:)();
}

uint64_t sub_100036A50()
{
  return RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)();
}

uint64_t sub_100036A60()
{
  return Range<>.init(_:in:)();
}

uint64_t sub_100036A70()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_100036A80()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100036A90()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100036AA0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100036AB0()
{
  return _NSRange.init<A, B>(_:in:)();
}

uint64_t sub_100036AC0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100036AD0()
{
  return Substring.index(after:)();
}

uint64_t sub_100036AE0()
{
  return Substring.distance(from:to:)();
}

uint64_t sub_100036AF0()
{
  return Substring.subscript.getter();
}

uint64_t sub_100036B00()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100036B10()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100036B20()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_100036B30()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_100036B40()
{
  return StringProtocol.removingPercentEncoding.getter();
}

uint64_t sub_100036B50()
{
  return StringProtocol.precomposedStringWithCanonicalMapping.getter();
}

uint64_t sub_100036B60()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t sub_100036B80()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100036B90()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100036BA0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100036BB0()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100036BD0()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

uint64_t sub_100036BE0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100036BF0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100036C00()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100036C10()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t sub_100036C20()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100036C30()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100036C40()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100036C50()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100036C60()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100036C70()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100036C90(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100036CA0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100036CB0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100036CC0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_100036CD0()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100036CE0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100036CF0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100036D00()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100036D10()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100036D20()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_100036D30()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100036D40()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100036D50()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100036D60()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_100036D70()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100036D80()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100036D90()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100036DA0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100036DB0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100036DC0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_100036DD0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int sub_100036DE0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100036DF0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100036E10()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100036E20()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_100036E30()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100036E40()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100036E50()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100036E60()
{
  return Error._code.getter();
}

uint64_t sub_100036E70()
{
  return Error._domain.getter();
}

uint64_t sub_100036E80()
{
  return Error._userInfo.getter();
}

uint64_t sub_100036EA0()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_100036EB0()
{
  return Hasher.init(_seed:)();
}

void sub_100036EC0(Swift::UInt a1)
{
}

Swift::Int sub_100036ED0()
{
  return Hasher._finalize()();
}

uint64_t sub_100036EE0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100036EF0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_100036F00()
{
  return Unicode.Scalar.Properties.isEmojiPresentation.getter();
}

uint64_t sub_100036F10()
{
  return Unicode.Scalar.Properties.isVariationSelector.getter();
}

uint64_t sub_100036F20()
{
  return Unicode.Scalar.Properties.isEmoji.getter();
}

uint64_t sub_100036F30()
{
  return type metadata accessor for Unicode.Scalar.Properties();
}

uint64_t sub_100036F40()
{
  return Unicode.Scalar.properties.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}