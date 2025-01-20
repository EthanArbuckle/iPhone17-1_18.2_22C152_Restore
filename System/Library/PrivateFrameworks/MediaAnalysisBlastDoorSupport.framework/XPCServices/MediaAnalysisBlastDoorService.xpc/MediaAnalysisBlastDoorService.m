int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  char *v4;
  Swift::OpaquePointer v5;
  Swift::OpaquePointer v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  sub_100008508(&qword_1000240C8);
  __chkstk_darwin();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  register_for_dlsym_callbacks();
  _CFPrefsSetDirectModeEnabled();
  _CFPrefsSetReadOnly();
  sub_10001BF20();
  qword_1000242F0 = sub_10001BEF0();
  v5._rawValue = &off_100021120;
  qword_1000242F8 = (uint64_t)&off_100021120;
  sub_10001BEC0(v5, 1);
  v6._rawValue = &off_1000211E0;
  qword_100024300 = (uint64_t)&off_1000211E0;
  sub_10001BED0(v6);
  sub_10001BF70();
  sub_10000854C();
  sub_10001BF00();
  sub_10001C6C0();
  sub_1000085A0();
  sub_10001BF00();
  sub_10001BFD0();
  sub_1000085F4();
  sub_10001BF00();
  sub_10001C0F0();
  sub_100008648();
  sub_10001BF10();
  v7 = sub_10001C940();
  sub_10000869C(v7, qword_100024308);
  v8 = sub_100008700(v7, (uint64_t)qword_100024308);
  v9 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v8, enum case for SandboxID.blastdoor(_:), v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v4, v8, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v7);
  sub_10001BEE0();
  sub_100008738((uint64_t)v4);
  return 0;
}

uint64_t sub_100008508(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000854C()
{
  unint64_t result = qword_1000240D0;
  if (!qword_1000240D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000240D0);
  }
  return result;
}

unint64_t sub_1000085A0()
{
  unint64_t result = qword_1000240D8;
  if (!qword_1000240D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000240D8);
  }
  return result;
}

unint64_t sub_1000085F4()
{
  unint64_t result = qword_1000240E0;
  if (!qword_1000240E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000240E0);
  }
  return result;
}

unint64_t sub_100008648()
{
  unint64_t result = qword_1000240E8;
  if (!qword_1000240E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000240E8);
  }
  return result;
}

uint64_t *sub_10000869C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008700(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100008738(uint64_t a1)
{
  uint64_t v2 = sub_100008508(&qword_1000240C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008798(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_1000087D0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1000087E4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100008804(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

__n128 sub_100008850(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000885C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000887C(uint64_t result, int a2, int a3)
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

__n128 sub_1000088B8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_1000088CC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000088EC(uint64_t result, int a2, int a3)
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

void type metadata accessor for CMTime(uint64_t a1)
{
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
}

void type metadata accessor for CFNumber(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for CGImageSource(uint64_t a1)
{
}

uint64_t sub_10000897C()
{
  return sub_10001BE80();
}

uint64_t sub_1000089C8()
{
  return sub_10001BE70();
}

Swift::Int sub_100008A20()
{
  return sub_10001CCA0();
}

uint64_t sub_100008A88()
{
  swift_getWitnessTable();

  return sub_10001BE60();
}

uint64_t sub_100008AF4()
{
  return sub_100008B5C(&qword_100024128);
}

uint64_t sub_100008B28()
{
  return sub_100008B5C(&qword_100024130);
}

uint64_t sub_100008B5C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

void sub_100008BB4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100008BFC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000010001D1A0) {
    return 1;
  }
  if ((sub_10001CC70() & 1) != 0 || a1 == 0x702E63696C627570 && a2 == 0xEA0000000000676ELL) {
    return 1;
  }
  if ((sub_10001CC70() & 1) != 0 || a1 == 0xD000000000000014 && a2 == 0x800000010001D160) {
    return 1;
  }
  if ((sub_10001CC70() & 1) != 0 || a1 == 0x682E63696C627570 && a2 == 0xEB00000000666965) {
    return 1;
  }
  char v4 = sub_10001CC70();
  BOOL v5 = a1 == 0x682E63696C627570 && a2 == 0xEB00000000636965;
  BOOL v6 = v5;
  if ((v4 & 1) != 0 || v6) {
    return 1;
  }
  char v7 = sub_10001CC70();
  BOOL v8 = a1 == 0x682E63696C627570 && a2 == 0xEC00000073636965;
  BOOL v9 = v8;
  if ((v7 & 1) != 0 || v9) {
    return 1;
  }
  char v10 = sub_10001CC70();
  BOOL v11 = a1 == 0xD000000000000014 && a2 == 0x800000010001D1C0;
  BOOL v12 = v11;
  if ((v10 & 1) != 0 || v12) {
    return 1;
  }

  return sub_10001CC70();
}

ValueMetadata *type metadata accessor for LargeImageUnpacker()
{
  return &type metadata for LargeImageUnpacker;
}

uint64_t sub_100008E60()
{
  return sub_100009FA8(&qword_100024140, (void (*)(uint64_t))&type metadata accessor for LargeImage);
}

uint64_t sub_100008EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v57[4] = a1;
  v57[3] = a2;
  sub_100008508(&qword_100024148);
  ((void (*)(void))__chkstk_darwin)();
  v66 = (char *)v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001C8F0();
  uint64_t v67 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  ((void (*)(void))__chkstk_darwin)();
  v69 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001C720();
  uint64_t v62 = *(void *)(v5 - 8);
  v63 = (void (*)(char *, char *, uint64_t))v5;
  ((void (*)(void))__chkstk_darwin)();
  v61 = (char *)v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001C700();
  uint64_t v59 = *(void *)(v7 - 8);
  uint64_t v60 = v7;
  ((void (*)(void))__chkstk_darwin)();
  v58 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C6C0();
  ((void (*)(void))__chkstk_darwin)();
  v57[2] = (char *)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001C760();
  uint64_t v65 = *(void *)(v10 - 8);
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  v57[1] = (char *)v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v14 = __chkstk_darwin(v13);
  v64 = (char *)v57 - v15;
  __chkstk_darwin(v14);
  v17 = (char *)v57 - v16;
  uint64_t v18 = sub_10001C8D0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  v22 = (char *)v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v24 = (char *)v57 - v23;
  sub_10001C8C0();
  sub_10001BF50();
  sub_10001BF40();
  v70 = v24;
  uint64_t v71 = v19;
  v25 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  uint64_t v72 = v18;
  v25(v22, v24, v18);
  sub_10001C930();
  swift_allocObject();
  v26 = v73;
  sub_10001C920();
  if (!v26)
  {
    v73 = (void (*)(void, void, void))v10;
    swift_retain();
    sub_10001C900();
    sub_10001BF60();
    sub_10001BF30();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v70, v72);
  }
  v77 = v26;
  swift_errorRetain();
  sub_100008508(&qword_100024150);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_errorRelease();
    v47 = v69;
    sub_10001C8E0();
    sub_100009EB4();
    uint64_t v65 = sub_10001CB60();
    sub_100008508(&qword_100024160);
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_10001DD40;
    uint64_t v49 = (uint64_t)v66;
    uint64_t v50 = v67;
    v73 = *(void (**)(void, void, void))(v67 + 16);
    uint64_t v51 = v68;
    v73(v66, v47, v68);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v49, 0, 1, v51);
    uint64_t v52 = sub_10001C7E0();
    uint64_t v54 = v53;
    sub_100009EF4(v49);
    *(void *)(v48 + 56) = &type metadata for String;
    *(void *)(v48 + 64) = sub_100009F54();
    *(void *)(v48 + 32) = v52;
    *(void *)(v48 + 40) = v54;
    sub_10001CAD0();
    v55 = (void *)v65;
    sub_10001BE90();

    swift_bridgeObjectRelease();
    sub_100009FA8(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    v73(v56, v47, v51);
    swift_willThrow();
    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v51);
    return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v70, v72);
  }
  swift_errorRelease();
  v27 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
  v73 = (void (*)(void, void, void))v10;
  v27(v64, v17, v10);
  uint64_t v75 = 0;
  unint64_t v76 = 0xE000000000000000;
  v28 = v58;
  sub_10001C740();
  uint64_t v29 = sub_10001C6F0();
  unint64_t v31 = v30;
  (*(void (**)(char *, uint64_t))(v59 + 8))(v28, v60);
  swift_bridgeObjectRelease();
  uint64_t v75 = v29;
  unint64_t v76 = v31;
  v78._countAndFlagsBits = 8250;
  v78._object = (void *)0xE200000000000000;
  sub_10001C9D0(v78);
  v32 = v61;
  sub_10001C730();
  uint64_t v33 = sub_10001C710();
  v35 = v34;
  (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v62 + 8))(v32, v63);
  v79._countAndFlagsBits = v33;
  v79._object = v35;
  sub_10001C9D0(v79);
  swift_bridgeObjectRelease();
  if (sub_10001C750())
  {
    v74._countAndFlagsBits = 0;
    v74._object = (void *)0xE000000000000000;
    sub_10001CBC0(16);
    swift_bridgeObjectRelease();
    strcpy((char *)&v74, ". Extra Info: ");
    HIBYTE(v74._object) = -18;
    v80._countAndFlagsBits = sub_10001C980();
    sub_10001C9D0(v80);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10001C9D0(v74);
    swift_bridgeObjectRelease();
  }
  v36 = v69;
  sub_10001C8E0();
  sub_100009EB4();
  v37 = (void *)sub_10001CB60();
  sub_100008508(&qword_100024160);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_10001DD40;
  uint64_t v39 = (uint64_t)v66;
  uint64_t v40 = v67;
  v63 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  uint64_t v41 = v68;
  v63(v66, v36, v68);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v39, 0, 1, v41);
  uint64_t v42 = sub_10001C7E0();
  uint64_t v44 = v43;
  sub_100009EF4(v39);
  *(void *)(v38 + 56) = &type metadata for String;
  *(void *)(v38 + 64) = sub_100009F54();
  *(void *)(v38 + 32) = v42;
  *(void *)(v38 + 40) = v44;
  sub_10001CAD0();
  sub_10001BE90();

  swift_bridgeObjectRelease();
  sub_100009FA8(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
  swift_allocError();
  v63(v45, v36, v41);
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v36, v41);
  (*(void (**)(char *, void (*)(void, void, void)))(v65 + 8))(v64, v73);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v70, v72);
  return swift_errorRelease();
}

uint64_t sub_100009E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008EA8(a1, a2);
}

unint64_t sub_100009EB4()
{
  unint64_t result = qword_100024158;
  if (!qword_100024158)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100024158);
  }
  return result;
}

uint64_t sub_100009EF4(uint64_t a1)
{
  uint64_t v2 = sub_100008508(&qword_100024148);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100009F54()
{
  unint64_t result = qword_100024168;
  if (!qword_100024168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024168);
  }
  return result;
}

uint64_t sub_100009FA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100009FF0(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_10000A350(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000A350(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_10001CC70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10000A07C()
{
  char v1 = *v0;
  sub_10001CC90();
  sub_10000A350(v1);
  sub_10001C9C0();
  swift_bridgeObjectRelease();
  return sub_10001CCA0();
}

uint64_t sub_10000A0E0()
{
  sub_10000A350(*v0);
  sub_10001C9C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000A134()
{
  char v1 = *v0;
  sub_10001CC90();
  sub_10000A350(v1);
  sub_10001C9C0();
  swift_bridgeObjectRelease();
  return sub_10001CCA0();
}

void sub_10000A194(void *a1@<X8>)
{
  *a1 = &off_100021218;
}

uint64_t sub_10000A1A4()
{
  uint64_t v0 = 86;
  char v1 = &byte_100021238;
  while (1)
  {
    char v4 = *v1++;
    char v3 = v4;
    uint64_t v5 = sub_10000A350(v4);
    uint64_t v7 = v6;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v10 = sub_10000F614(v5, v7);
    uint64_t v11 = _swiftEmptyDictionarySingleton[2];
    BOOL v12 = (v9 & 1) == 0;
    uint64_t v13 = v11 + v12;
    if (__OFADD__(v11, v12)) {
      break;
    }
    char v14 = v9;
    if (_swiftEmptyDictionarySingleton[3] >= v13)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v9) {
          goto LABEL_2;
        }
      }
      else
      {
        sub_10000DE24();
        if (v14) {
          goto LABEL_2;
        }
      }
    }
    else
    {
      sub_10000D838(v13, isUniquelyReferenced_nonNull_native);
      unint64_t v15 = sub_10000F614(v5, v7);
      if ((v14 & 1) != (v16 & 1)) {
        goto LABEL_18;
      }
      unint64_t v10 = v15;
      if (v14)
      {
LABEL_2:
        *(unsigned char *)(_swiftEmptyDictionarySingleton[7] + v10) = v3;
        goto LABEL_3;
      }
    }
    _swiftEmptyDictionarySingleton[(v10 >> 6) + 8] |= 1 << v10;
    v17 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 16 * v10);
    uint64_t *v17 = v5;
    v17[1] = v7;
    *(unsigned char *)(_swiftEmptyDictionarySingleton[7] + v10) = v3;
    uint64_t v18 = _swiftEmptyDictionarySingleton[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_17;
    }
    _swiftEmptyDictionarySingleton[2] = v20;
    swift_bridgeObjectRetain();
LABEL_3:
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (!--v0)
    {
      off_100024178 = _swiftEmptyDictionarySingleton;
      return result;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_10001CC80();
  __break(1u);
  return result;
}

uint64_t sub_10000A350(char a1)
{
  uint64_t result = 0x6974617275447661;
  switch(a1)
  {
    case 1:
      goto LABEL_4;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 29:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 50:
    case 51:
    case 52:
    case 58:
    case 79:
    case 85:
      return sub_10001C9A0();
    case 9:
      if (!kPFImagePropertyCustomPhotoProcessingFlags) {
        goto LABEL_101;
      }
      return sub_10001C9A0();
    case 24:
      if (kPFVideoPropertyVideoDynamicRange) {
        return sub_10001C9A0();
      }
      __break(1u);
LABEL_10:
      if (!kPFImagePropertyHDRGain)
      {
        __break(1u);
LABEL_12:
        if (!kPFImagePropertyHasHDRGainMap)
        {
          __break(1u);
LABEL_14:
          if (!kPFVideoPropertyVideoContainsCinematicData)
          {
            __break(1u);
LABEL_16:
            if (!kPFMediaPropertyLivePhotoPairingIdentifier) {
              goto LABEL_101;
            }
          }
        }
      }
      return sub_10001C9A0();
    case 25:
      goto LABEL_10;
    case 26:
      goto LABEL_12;
    case 27:
      goto LABEL_14;
    case 28:
      goto LABEL_16;
    case 30:
      if (kPFVideoPropertyPlaybackVariationIdentifier) {
        return sub_10001C9A0();
      }
      __break(1u);
LABEL_20:
      if (!kPFVideoPropertyVideoComplVideoDurationValue)
      {
        __break(1u);
LABEL_22:
        if (!kPFVideoPropertyVideoComplVideoDurationTimescale)
        {
          __break(1u);
LABEL_24:
          if (!kPFVideoPropertyVideoComplVideoImageDisplayValue)
          {
            __break(1u);
LABEL_26:
            if (!kPFVideoPropertyVideoComplVideoImageDisplayTimescale)
            {
              __break(1u);
LABEL_28:
              if (!kPFVideoPropertyAVFPS)
              {
                __break(1u);
LABEL_30:
                if (!kPFVideoPropertyCustomCodecFourCharCode)
                {
                  __break(1u);
LABEL_32:
                  if (!kPFVideoPropertyCaptureMode)
                  {
                    __break(1u);
LABEL_34:
                    if (!kPFVideoPropertyVideoIsMontage)
                    {
                      __break(1u);
LABEL_36:
                      if (!kPFVideoPropertyIsProRes)
                      {
                        __break(1u);
LABEL_38:
                        if (!kPFVideoPropertyVideoDurationValue)
                        {
                          __break(1u);
LABEL_40:
                          if (!kPFVideoPropertyVideoDurationTimescale)
                          {
                            __break(1u);
LABEL_42:
                            if (!kPFMediaPropertyOriginatingAssetIdentifier) {
                              goto LABEL_101;
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
      }
      return sub_10001C9A0();
    case 31:
      goto LABEL_20;
    case 32:
      goto LABEL_22;
    case 33:
      goto LABEL_24;
    case 34:
      goto LABEL_26;
    case 35:
      return result;
    case 36:
      goto LABEL_28;
    case 37:
      goto LABEL_30;
    case 38:
      goto LABEL_32;
    case 39:
      goto LABEL_34;
    case 40:
      goto LABEL_36;
    case 41:
      goto LABEL_38;
    case 42:
      goto LABEL_40;
    case 43:
      goto LABEL_42;
    case 49:
      return 0x5465746144737067;
    case 53:
      return 0x6953656C6946534ELL;
    case 54:
      if (kPFFilePropertyUniformTypeIdentifier) {
        return sub_10001C9A0();
      }
      __break(1u);
LABEL_48:
      if (!kPFFilePropertyOriginalFilename)
      {
        __break(1u);
LABEL_50:
        if (!kPFImagePropertyIsPhotoBooth)
        {
          __break(1u);
LABEL_52:
          if (!kPFImagePropertyBurstUuid) {
            goto LABEL_101;
          }
        }
      }
      return sub_10001C9A0();
    case 55:
      goto LABEL_48;
    case 56:
      goto LABEL_50;
    case 57:
      goto LABEL_52;
    case 59:
      if (kPFImagePropertyFrontFacingCamera) {
        return sub_10001C9A0();
      }
      __break(1u);
LABEL_56:
      if (!kPFImagePropertySpatialOverCaptureIdentifier)
      {
        __break(1u);
LABEL_58:
        if (!kPFImagePropertySemanticStyleSceneBias)
        {
          __break(1u);
LABEL_60:
          if (!kPFImagePropertySemanticStyleWarmthBias)
          {
            __break(1u);
LABEL_62:
            if (!kPFImagePropertySemanticStyleRenderingVersion)
            {
              __break(1u);
LABEL_64:
              if (!kPFImagePropertySemanticStylePreset)
              {
                __break(1u);
LABEL_66:
                if (!kPFImagePropertySmartStyleHasSmartStyle)
                {
                  __break(1u);
LABEL_68:
                  if (!kPFImagePropertySmartStyleToneBias)
                  {
                    __break(1u);
LABEL_70:
                    if (!kPFImagePropertySmartStyleColorBias)
                    {
                      __break(1u);
LABEL_72:
                      if (!kPFImagePropertySmartStyleCast)
                      {
                        __break(1u);
LABEL_74:
                        if (!kPFImagePropertySmartStyleRenderingVersion)
                        {
                          __break(1u);
LABEL_76:
                          if (!kPFImagePropertySmartStyleIsReversible)
                          {
                            __break(1u);
LABEL_78:
                            if (!kPFImagePropertySmartStyleVideoCastValue)
                            {
                              __break(1u);
LABEL_80:
                              if (!kPFImagePropertyIsHDR)
                              {
                                __break(1u);
LABEL_82:
                                if (!kPFImagePropertyHasISOGainMap)
                                {
                                  __break(1u);
LABEL_84:
                                  if (!kPFImagePropertyIsAnimatedImage)
                                  {
                                    __break(1u);
LABEL_86:
                                    if (!kPFImagePropertyStillImageCaptureFlags)
                                    {
                                      __break(1u);
LABEL_88:
                                      if (!kPFImagePropertyCameraUsedForCapture)
                                      {
                                        __break(1u);
LABEL_90:
                                        if (!kPFImagePropertyExifFlashFired) {
                                          goto LABEL_101;
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
                  }
                }
              }
            }
          }
        }
      }
      return sub_10001C9A0();
    case 60:
      goto LABEL_56;
    case 61:
      goto LABEL_58;
    case 62:
      goto LABEL_60;
    case 63:
      goto LABEL_62;
    case 64:
      goto LABEL_64;
    case 65:
      goto LABEL_66;
    case 66:
      goto LABEL_68;
    case 67:
      goto LABEL_70;
    case 68:
      if (!kPFImagePropertySmartStyleIntensity)
      {
        __break(1u);
        JUMPOUT(0x10000A964);
      }
      return sub_10001C9A0();
    case 69:
      goto LABEL_72;
    case 70:
      goto LABEL_74;
    case 71:
      goto LABEL_76;
    case 72:
      goto LABEL_78;
    case 73:
      goto LABEL_80;
    case 74:
      goto LABEL_82;
    case 75:
      goto LABEL_84;
    case 76:
      goto LABEL_86;
    case 77:
      goto LABEL_88;
    case 78:
      goto LABEL_90;
    case 80:
      if (kPFVideoPropertyCaptureModeTimelapse) {
        return sub_10001C9A0();
      }
      __break(1u);
LABEL_94:
      if (!kPFImagePropertyHasSpatialAudio)
      {
        __break(1u);
LABEL_96:
        if (!kPFImagePropertyIsAlchemist)
        {
          __break(1u);
LABEL_98:
          if (!kPFImagePropertyIsThreeImageStereoHEIC)
          {
            __break(1u);
LABEL_100:
            if (!kPFImagePropertyGenerativeAIImageType) {
LABEL_101:
            }
              __break(1u);
          }
        }
      }
      return sub_10001C9A0();
    case 81:
      goto LABEL_94;
    case 82:
      goto LABEL_96;
    case 83:
      goto LABEL_98;
    case 84:
      goto LABEL_100;
    default:
      if (!kPFMediaPropertyCreationDate)
      {
        __break(1u);
LABEL_4:
        if (!kPFMediaPropertyTimeZoneOffsetSeconds) {
          goto LABEL_101;
        }
      }
      return sub_10001C9A0();
  }
}

uint64_t sub_10000AABC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  char v3 = sub_10000E1A0(*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_10000AB04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A350(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_10000AB30(void *a1)
{
  uint64_t v2 = sub_10001C400();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v112 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100008508(&qword_100024180);
  __chkstk_darwin(v6 - 8);
  char v8 = (char *)&v112 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008508(&qword_100024188);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v112 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008508(&qword_100024190);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  unint64_t v15 = (char *)&v112 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v112 - v16;
  id result = [a1 syndicationProperties];
  if (result)
  {
    BOOL v19 = result;
    v117 = v17;
    v118 = v15;
    v119 = v5;
    uint64_t v120 = v2;
    uint64_t v20 = sub_10001C970();

    int64_t v21 = 0;
    uint64_t v22 = *(void *)(v20 + 64);
    uint64_t v121 = v20 + 64;
    uint64_t v23 = 1 << *(unsigned char *)(v20 + 32);
    uint64_t v24 = -1;
    if (v23 < 64) {
      uint64_t v24 = ~(-1 << v23);
    }
    unint64_t v25 = v24 & v22;
    unsigned int v116 = enum case for MediaMetadata.AppleMakerNoteCamera.unknown(_:);
    v115 = (void (**)(char *, void, uint64_t))(v3 + 104);
    v114 = (void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    int64_t v122 = (unint64_t)(v23 + 63) >> 6;
    int64_t v113 = v122 - 1;
    if ((v24 & v22) == 0) {
      goto LABEL_7;
    }
LABEL_5:
    unint64_t v26 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    unint64_t v27 = v26 | (v21 << 6);
LABEL_6:
    uint64_t v28 = *(void *)(v20 + 56);
    uint64_t v29 = (void *)(*(void *)(v20 + 48) + 16 * v27);
    uint64_t v30 = v29[1];
    *(void *)&long long v125 = *v29;
    *((void *)&v125 + 1) = v30;
    sub_10000D6D4(v28 + 32 * v27, (uint64_t)v126);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_10000D730((uint64_t)&v125, (uint64_t)&v127);
      uint64_t v34 = v128;
      if (!v128) {
        return (id)swift_release();
      }
      uint64_t v35 = v127;
      sub_10000D798(&v129, &v125);
      if (qword_1000240C0 != -1) {
        swift_once();
      }
      v36 = off_100024178;
      if (*((void *)off_100024178 + 2))
      {
        unint64_t v37 = sub_10000F614(v35, v34);
        if (v38)
        {
          uint64_t v39 = *(unsigned __int8 *)(v36[7] + v37);
          swift_bridgeObjectRelease();
          switch(v39)
          {
            case 1:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v44 = v123;
                [v123 integerValue];
              }
              sub_10001C2D0();
              goto LABEL_34;
            case 2:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v45 = v123;
                [v123 doubleValue];
              }
              sub_10001C380();
              goto LABEL_34;
            case 3:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v46 = v123;
                [v123 integerValue];
              }
              sub_10001C2A0();
              goto LABEL_34;
            case 4:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v47 = v123;
                [v123 unsignedIntegerValue];
              }
              sub_10001C250();
              goto LABEL_34;
            case 5:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v48 = v123;
                [v123 unsignedIntegerValue];
              }
              sub_10001C2B0();
              goto LABEL_34;
            case 6:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C6A0();
              goto LABEL_34;
            case 7:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C670();
              goto LABEL_34;
            case 8:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C190();
              goto LABEL_34;
            case 9:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v49 = v123;
                [v123 unsignedIntegerValue];
              }
              sub_10001C2F0();
              goto LABEL_34;
            case 10:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v50 = v123;
                [v123 BOOLValue];
              }
              sub_10001C300();
              goto LABEL_34;
            case 11:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v51 = v123;
                [v123 doubleValue];
              }
              sub_10001C210();
              goto LABEL_34;
            case 12:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v52 = v123;
                [v123 integerValue];
              }
              sub_10001C330();
              goto LABEL_34;
            case 13:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v53 = v123;
                [v123 integerValue];
              }
              sub_10001C5D0();
              goto LABEL_34;
            case 14:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v54 = v123;
                [v123 doubleValue];
              }
              sub_10001C150();
              goto LABEL_34;
            case 15:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v55 = v123;
                [v123 doubleValue];
              }
              sub_10001C360();
              goto LABEL_34;
            case 16:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v56 = v123;
                [v123 integerValue];
              }
              sub_10001C290();
              goto LABEL_34;
            case 17:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v57 = v123;
                [v123 integerValue];
              }
              sub_10001C1E0();
              goto LABEL_34;
            case 18:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v58 = v123;
                [v123 doubleValue];
              }
              sub_10001C1F0();
              goto LABEL_34;
            case 19:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C5F0();
              goto LABEL_34;
            case 20:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C5B0();
              goto LABEL_34;
            case 21:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v59 = v123;
                [v123 integerValue];
              }
              sub_10001C200();
              goto LABEL_34;
            case 22:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v60 = v123;
                [v123 integerValue];
              }
              sub_10001C180();
              goto LABEL_34;
            case 23:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v61 = v123;
                [v123 integerValue];
              }
              sub_10001C440();
              goto LABEL_34;
            case 24:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v62 = v123;
                [v123 integerValue];
              }
              sub_10001C350();
              goto LABEL_34;
            case 25:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v63 = v123;
                [v123 doubleValue];
              }
              sub_10001C610();
              goto LABEL_34;
            case 26:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v64 = v123;
                [v123 BOOLValue];
              }
              sub_10001C220();
              goto LABEL_34;
            case 27:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v65 = v123;
                [v123 BOOLValue];
              }
              sub_10001C540();
              goto LABEL_34;
            case 28:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C110();
              goto LABEL_34;
            case 29:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v66 = v123;
                [v123 doubleValue];
              }
              sub_10001C1B0();
              goto LABEL_34;
            case 30:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v67 = v123;
                [v123 unsignedIntegerValue];
              }
              sub_10001C3E0();
              goto LABEL_34;
            case 31:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v68 = v123;
                [v123 doubleValue];
              }
              sub_10001C560();
              goto LABEL_34;
            case 32:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v69 = v123;
                [v123 doubleValue];
              }
              sub_10001C580();
              goto LABEL_34;
            case 33:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v70 = v123;
                [v123 doubleValue];
              }
              sub_10001C590();
              goto LABEL_34;
            case 34:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v71 = v123;
                [v123 doubleValue];
              }
              sub_10001C5A0();
              goto LABEL_34;
            case 35:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v72 = v123;
                [v123 doubleValue];
              }
              sub_10001C130();
              goto LABEL_34;
            case 36:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v73 = v123;
                [v123 doubleValue];
              }
              sub_10001C5C0();
              goto LABEL_34;
            case 37:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C320();
              goto LABEL_34;
            case 38:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C140();
              goto LABEL_34;
            case 39:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C280();
              goto LABEL_34;
            case 40:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v74 = v123;
                [v123 BOOLValue];
              }
              sub_10001C650();
              goto LABEL_34;
            case 41:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v75 = v123;
                [v123 doubleValue];
              }
              sub_10001C390();
              goto LABEL_34;
            case 42:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v76 = v123;
                [v123 doubleValue];
              }
              sub_10001C4B0();
              goto LABEL_34;
            case 43:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C520();
              goto LABEL_34;
            case 44:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v77 = v123;
                [v123 doubleValue];
              }
              sub_10001C6B0();
              goto LABEL_34;
            case 45:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v78 = v123;
                [v123 doubleValue];
              }
              sub_10001C660();
              goto LABEL_34;
            case 46:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v79 = v123;
                [v123 doubleValue];
              }
              sub_10001C620();
              goto LABEL_34;
            case 47:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v80 = v123;
                [v123 doubleValue];
              }
              sub_10001C640();
              goto LABEL_34;
            case 48:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C160();
              goto LABEL_34;
            case 49:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              uint64_t v81 = sub_10001BDF0();
              v82 = v118;
              int v83 = swift_dynamicCast();
              (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v82, v83 ^ 1u, 1, v81);
              sub_10001C1C0();
              goto LABEL_34;
            case 50:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v84 = v123;
                [v123 doubleValue];
              }
              sub_10001C430();
              goto LABEL_34;
            case 51:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v85 = v123;
                [v123 doubleValue];
              }
              sub_10001C270();
              goto LABEL_34;
            case 52:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C340();
              goto LABEL_34;
            case 53:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v86 = v123;
                [v123 unsignedIntegerValue];
              }
              sub_10001C630();
              goto LABEL_34;
            case 54:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C460();
              goto LABEL_34;
            case 55:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C310();
              goto LABEL_34;
            case 56:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v87 = v123;
                [v123 BOOLValue];
              }
              sub_10001C1D0();
              goto LABEL_34;
            case 57:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001BE00();
              swift_bridgeObjectRelease();
              sub_10001C680();
              goto LABEL_34;
            case 58:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C1A0();
              goto LABEL_34;
            case 59:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v88 = v123;
                [v123 BOOLValue];
              }
              sub_10001C3A0();
              goto LABEL_34;
            case 60:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C550();
              goto LABEL_34;
            case 61:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v89 = v123;
                [v123 doubleValue];
              }
              sub_10001C480();
              goto LABEL_34;
            case 62:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v90 = v123;
                [v123 doubleValue];
              }
              sub_10001C4C0();
              goto LABEL_34;
            case 63:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v91 = v123;
                [v123 integerValue];
              }
              sub_10001C570();
              goto LABEL_34;
            case 64:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v92 = v123;
                [v123 integerValue];
              }
              sub_10001C3B0();
              goto LABEL_34;
            case 65:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v93 = v123;
                [v123 BOOLValue];
              }
              sub_10001C240();
              goto LABEL_34;
            case 66:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v94 = v123;
                [v123 doubleValue];
              }
              sub_10001C370();
              goto LABEL_34;
            case 67:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v95 = v123;
                [v123 doubleValue];
              }
              sub_10001C3C0();
              goto LABEL_34;
            case 68:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v96 = v123;
                [v123 doubleValue];
              }
              sub_10001C3D0();
              goto LABEL_34;
            case 69:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v97 = v123;
                [v123 doubleValue];
              }
              sub_10001C2C0();
              goto LABEL_34;
            case 70:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v98 = v123;
                [v123 integerValue];
              }
              sub_10001C530();
              goto LABEL_34;
            case 71:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v99 = v123;
                [v123 BOOLValue];
              }
              sub_10001C490();
              goto LABEL_34;
            case 72:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v100 = v123;
                [v123 doubleValue];
              }
              sub_10001C510();
              goto LABEL_34;
            case 73:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v101 = v123;
                [v123 BOOLValue];
              }
              sub_10001C5E0();
              goto LABEL_34;
            case 74:
            case 75:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v40 = v123;
                [v123 BOOLValue];
              }
              sub_10001C230();
              goto LABEL_34;
            case 76:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v102 = v123;
                [v123 unsignedIntegerValue];
              }
              sub_10001C4A0();
              goto LABEL_34;
            case 77:
              v112 = v11;
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v103 = v123;
                [v123 integerValue];
              }
              uint64_t v111 = v120;
              (*v115)(v119, v116, v120);
              sub_10001C3F0();
              (*v114)(v8, 0, 1, v111);
              sub_10001C410();
              sub_10000D7A8((uint64_t)&v125);
              uint64_t v11 = v112;
              if (!v25) {
                goto LABEL_7;
              }
              goto LABEL_5;
            case 78:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v104 = v123;
                [v123 BOOLValue];
              }
              sub_10001C260();
              goto LABEL_34;
            case 79:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v105 = v123;
                [v123 doubleValue];
              }
              sub_10001C4F0();
              goto LABEL_34;
            case 80:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v106 = v123;
                [v123 BOOLValue];
              }
              sub_10001C420();
              goto LABEL_34;
            case 81:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v107 = v123;
                [v123 BOOLValue];
              }
              sub_10001C2E0();
              goto LABEL_34;
            case 82:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v108 = v123;
                [v123 BOOLValue];
              }
              sub_10001C170();
              goto LABEL_34;
            case 83:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v109 = v123;
                [v123 BOOLValue];
              }
              sub_10001C470();
              goto LABEL_34;
            case 84:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              sub_10000D7F8();
              if (swift_dynamicCast())
              {
                id v110 = v123;
                [v123 doubleValue];
              }
              sub_10001C450();
              goto LABEL_34;
            case 85:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              swift_dynamicCast();
              sub_10001C120();
              goto LABEL_34;
            default:
              sub_10000D6D4((uint64_t)&v125, (uint64_t)v124);
              uint64_t v41 = sub_10001BDF0();
              uint64_t v42 = v117;
              int v43 = swift_dynamicCast();
              (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v42, v43 ^ 1u, 1, v41);
              sub_10001C690();
              goto LABEL_34;
          }
        }
      }
      swift_bridgeObjectRelease();
LABEL_34:
      sub_10000D7A8((uint64_t)&v125);
      if (v25) {
        goto LABEL_5;
      }
LABEL_7:
      int64_t v31 = v21 + 1;
      if (__OFADD__(v21, 1))
      {
        __break(1u);
LABEL_253:
        __break(1u);
        JUMPOUT(0x10000D57CLL);
      }
      if (v31 < v122)
      {
        unint64_t v32 = *(void *)(v121 + 8 * v31);
        if (v32) {
          goto LABEL_10;
        }
        int64_t v33 = v21 + 2;
        ++v21;
        if (v31 + 1 < v122)
        {
          unint64_t v32 = *(void *)(v121 + 8 * v33);
          if (v32) {
            goto LABEL_13;
          }
          int64_t v21 = v31 + 1;
          if (v31 + 2 < v122)
          {
            unint64_t v32 = *(void *)(v121 + 8 * (v31 + 2));
            if (v32)
            {
              v31 += 2;
              goto LABEL_10;
            }
            int64_t v33 = v31 + 3;
            int64_t v21 = v31 + 2;
            if (v31 + 3 < v122)
            {
              unint64_t v32 = *(void *)(v121 + 8 * v33);
              if (v32)
              {
LABEL_13:
                int64_t v31 = v33;
LABEL_10:
                unint64_t v25 = (v32 - 1) & v32;
                unint64_t v27 = __clz(__rbit64(v32)) + (v31 << 6);
                int64_t v21 = v31;
                goto LABEL_6;
              }
              while (1)
              {
                int64_t v31 = v33 + 1;
                if (__OFADD__(v33, 1)) {
                  goto LABEL_253;
                }
                if (v31 >= v122) {
                  break;
                }
                unint64_t v32 = *(void *)(v121 + 8 * v31);
                ++v33;
                if (v32) {
                  goto LABEL_10;
                }
              }
              int64_t v21 = v113;
            }
          }
        }
      }
      unint64_t v25 = 0;
      memset(v126, 0, sizeof(v126));
      long long v125 = 0u;
    }
  }
  return result;
}

uint64_t sub_10000D6D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008508(&qword_100024198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000D798(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D7A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10000D7F8()
{
  unint64_t result = qword_1000241A0;
  if (!qword_1000241A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000241A0);
  }
  return result;
}

uint64_t sub_10000D838(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008508(&qword_1000241A8);
  char v37 = a2;
  uint64_t v6 = sub_10001CC30();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v35;
        if ((v37 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v36 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    unint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    char v29 = *(unsigned char *)(*(void *)(v5 + 56) + v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_10001CC90();
    sub_10001C9C0();
    uint64_t result = sub_10001CCA0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v32 = v17 == v31;
        if (v17 == v31) {
          unint64_t v17 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    BOOL v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *BOOL v19 = v28;
    v19[1] = v27;
    *(unsigned char *)(*(void *)(v7 + 56) + v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000DB24(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100008508(&qword_1000241B0);
  uint64_t v6 = sub_10001CC30();
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
                  void *v34 = -1 << v32;
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
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_10000D798(v24, v35);
      }
      else
      {
        sub_10000D6D4((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_10001CC90();
      sub_10001C9C0();
      uint64_t result = sub_10001CCA0();
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
      uint64_t result = (uint64_t)sub_10000D798(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_10000DE24()
{
  uint64_t v1 = v0;
  sub_100008508(&qword_1000241A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001CC20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    if (!v21) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *unint64_t v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_10000DFB8()
{
  uint64_t v1 = v0;
  sub_100008508(&qword_1000241B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001CC20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    sub_10000D6D4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_10000D798(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
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

uint64_t sub_10000E1A0(uint64_t a1, uint64_t a2)
{
  if (qword_1000240C0 != -1) {
    swift_once();
  }
  uint64_t v4 = off_100024178;
  if (*((void *)off_100024178 + 2) && (unint64_t v5 = sub_10000F614(a1, a2), (v6 & 1) != 0)) {
    return *(unsigned __int8 *)(v4[7] + v5);
  }
  else {
    return 86;
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for MetadataKey(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MetadataKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xAB) {
    goto LABEL_17;
  }
  if (a2 + 85 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 85) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 85;
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
      return (*a1 | (v4 << 8)) - 85;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 85;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x56;
  int v8 = v6 - 86;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MetadataKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 85 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 85) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xAB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xAA)
  {
    unsigned int v6 = ((a2 - 171) >> 8) + 1;
    *uint64_t result = a2 + 85;
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
        JUMPOUT(0x10000E394);
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
          *uint64_t result = a2 + 85;
        break;
    }
  }
  return result;
}

uint64_t sub_10000E3BC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000E3C8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MetadataKey()
{
  return &type metadata for MetadataKey;
}

unint64_t sub_10000E3E4()
{
  unint64_t result = qword_1000241B8;
  if (!qword_1000241B8)
  {
    sub_10000E440(&qword_1000241C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000241B8);
  }
  return result;
}

uint64_t sub_10000E440(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000E48C()
{
  unint64_t result = qword_1000241C8;
  if (!qword_1000241C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000241C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaMetadataUnpacker()
{
  return &type metadata for MediaMetadataUnpacker;
}

uint64_t sub_10000E4F0()
{
  return sub_10000F88C(&qword_1000241D0, (void (*)(uint64_t))&type metadata accessor for MediaMetadata);
}

void sub_10000E538(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100008508(&qword_100024148);
  __chkstk_darwin(v5 - 8);
  id v69 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v7 = (void *)sub_10001C8F0();
  id v71 = (void *)*(v7 - 1);
  id v72 = v7;
  __chkstk_darwin(v7);
  id v70 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008508(&qword_1000241D8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  unint64_t v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v64 - v13;
  sub_10001C8C0();
  uint64_t v15 = sub_10001C4E0();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  if ((sub_10001C600() & 1) == 0) {
    goto LABEL_19;
  }
  sub_10001C820();
  type metadata accessor for CGImageSource(0);
  sub_10001C100();
  if (v2)
  {
    sub_10000F5B8((uint64_t)v14, &qword_1000241D8);
    return;
  }
  id v68 = v14;
  if (!v73)
  {
    int64_t v33 = v70;
    sub_10001C8E0();
    sub_100009EB4();
    uint64_t v42 = (void *)sub_10001CB80();
    sub_100008508(&qword_100024160);
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_10001DD40;
    char v37 = v71;
    id v36 = v72;
    id v67 = (CGImageSource *)v71[2];
    uint64_t v44 = (uint64_t)v69;
    ((void (*)(char *, char *, id))v67)(v69, v33, v72);
    ((void (*)(uint64_t, void, uint64_t, id))v37[7])(v44, 0, 1, v36);
    uint64_t v45 = sub_10001C7E0();
    uint64_t v47 = v46;
    sub_10000F5B8(v44, &qword_100024148);
    *(void *)(v43 + 56) = &type metadata for String;
    *(void *)(v43 + 64) = sub_100009F54();
    *(void *)(v43 + 32) = v45;
    *(void *)(v43 + 40) = v47;
    sub_10001CAD0();
    sub_10001BE90();

    swift_bridgeObjectRelease();
    sub_10000F88C(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    ((void (*)(uint64_t, char *, id))v67)(v48, v33, v36);
    swift_willThrow();
LABEL_17:
    ((void (*)(char *, id))v37[1])(v33, v36);
    sub_10000F5B8((uint64_t)v68, &qword_1000241D8);
    return;
  }
  id v67 = v73;
  sub_100008508(&qword_1000241E0);
  uint64_t inited = swift_initStackObject();
  long long v66 = xmmword_10001DD40;
  *(_OWORD *)(inited + 16) = xmmword_10001DD40;
  *(void *)(inited + 32) = kCGImageSourceShouldCache;
  *(void *)(inited + 64) = &type metadata for Bool;
  *(unsigned char *)(inited + 40) = 0;
  CFStringRef v18 = (id)kCGImageSourceShouldCache;
  sub_10000F1D4(inited);
  type metadata accessor for CFString(0);
  sub_10000F88C(&qword_100024128, type metadata accessor for CFString);
  CFDictionaryRef isa = sub_10001C950().super.isa;
  swift_bridgeObjectRelease();
  CFDictionaryRef v20 = CGImageSourceCopyPropertiesAtIndex(v67, 0, isa);

  if (!v20
    || (v73 = 0, type metadata accessor for CFNumber(0), sub_10001C960(), v20, (unint64_t v21 = v73) == 0))
  {
    int64_t v33 = v70;
    sub_10001C8E0();
    sub_100009EB4();
    uint64_t v34 = (void *)sub_10001CB80();
    sub_100008508(&qword_100024160);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = v66;
    char v37 = v71;
    id v36 = v72;
    *(void *)&long long v66 = v71[2];
    uint64_t v38 = (uint64_t)v69;
    ((void (*)(char *, char *, id))v66)(v69, v33, v72);
    ((void (*)(uint64_t, void, uint64_t, id))v37[7])(v38, 0, 1, v36);
    uint64_t v39 = sub_10001C7E0();
    uint64_t v41 = v40;
    sub_10000F5B8(v38, &qword_100024148);
    *(void *)(v35 + 56) = &type metadata for String;
    *(void *)(v35 + 64) = sub_100009F54();
    *(void *)(v35 + 32) = v39;
    *(void *)(v35 + 40) = v41;
    sub_10001CAD0();
LABEL_15:
    sub_10001BE90();

    swift_bridgeObjectRelease();
    sub_10000F88C(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    ((void (*)(uint64_t, char *, id))v66)(v54, v33, v36);
    swift_willThrow();
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v22 = sub_10001C9A0();
  id v65 = (void *)v23;
  if (!*((void *)v21 + 2) || (unint64_t v24 = sub_10000F614(v22, (uint64_t)v65), (v25 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int64_t v33 = v70;
    sub_10001C8E0();
    sub_100009EB4();
    id v65 = (void *)sub_10001CB80();
    sub_100008508(&qword_100024160);
    uint64_t v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = v66;
    char v37 = v71;
    id v36 = v72;
    *(void *)&long long v66 = v71[2];
    uint64_t v50 = (uint64_t)v69;
    ((void (*)(char *, char *, id))v66)(v69, v33, v72);
    ((void (*)(uint64_t, void, uint64_t, id))v37[7])(v50, 0, 1, v36);
    uint64_t v51 = sub_10001C7E0();
    uint64_t v53 = v52;
    sub_10000F5B8(v50, &qword_100024148);
    *(void *)(v49 + 56) = &type metadata for String;
    *(void *)(v49 + 64) = sub_100009F54();
    *(void *)(v49 + 32) = v51;
    *(void *)(v49 + 40) = v53;
    sub_10001CAD0();
    uint64_t v34 = v65;
    goto LABEL_15;
  }
  id v64 = *(id *)(*((void *)v21 + 7) + 8 * v24);
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_10001C9A0();
  if (!*((void *)v21 + 2) || (unint64_t v28 = sub_10000F614(v26, v27), (v29 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int64_t v33 = v70;
    sub_10001C8E0();
    sub_100009EB4();
    id v65 = (void *)sub_10001CB80();
    sub_100008508(&qword_100024160);
    uint64_t v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = v66;
    char v37 = v71;
    id v36 = v72;
    *(void *)&long long v66 = v71[2];
    uint64_t v56 = (uint64_t)v69;
    ((void (*)(char *, char *, id))v66)(v69, v33, v72);
    ((void (*)(uint64_t, void, uint64_t, id))v37[7])(v56, 0, 1, v36);
    uint64_t v57 = sub_10001C7E0();
    uint64_t v59 = v58;
    sub_10000F5B8(v56, &qword_100024148);
    *(void *)(v55 + 56) = &type metadata for String;
    *(void *)(v55 + 64) = sub_100009F54();
    *(void *)(v55 + 32) = v57;
    *(void *)(v55 + 40) = v59;
    sub_10001CAD0();
    id v60 = v65;
    sub_10001BE90();

    swift_bridgeObjectRelease();
    sub_10000F88C(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    ((void (*)(uint64_t, char *, id))v66)(v61, v33, v36);
    swift_willThrow();

    goto LABEL_16;
  }
  id v72 = *(id *)(*((void *)v21 + 7) + 8 * v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v30 = v64;
  uint64_t v31 = sub_10001CA70();
  id v71 = v30;

  uint64_t v32 = (char *)v72;
  id v72 = (id)sub_10001CA70();
  id v70 = v32;

  sub_10001C930();
  id v69 = (char *)v31;
  sub_10001C910();
  sub_10001C4D0();

  unint64_t v14 = v68;
  sub_10000F5B8((uint64_t)v68, &qword_1000241D8);
  v16(v12, 0, 1, v15);
  sub_10000F68C((uint64_t)v12, (uint64_t)v14);
LABEL_19:
  sub_10000FA30((uint64_t)v14, (uint64_t)v12, &qword_1000241D8);
  uint64_t v62 = sub_10001C500();
  __chkstk_darwin(v62);
  *(&v64 - 2) = a1;
  *(&v64 - 1) = a2;
  sub_10001C7F0();
  sub_10000F5B8((uint64_t)v14, &qword_1000241D8);
  if (v2)
  {
    uint64_t v63 = sub_10001C6C0();
    (*(void (**)(void *, uint64_t))(*(void *)(v63 - 8) + 8))(a2, v63);
  }
}

id sub_10000F1A8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return a1;
}

unint64_t sub_10000F1D4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008508(&qword_1000241E8);
  uint64_t v2 = sub_10001CC40();
  int v3 = (void *)v2;
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
    sub_10000FA30(v6, (uint64_t)&v13, &qword_1000241F0);
    uint64_t v7 = v13;
    unint64_t result = sub_10000F6F4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10000D798(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10000F304(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008508(&qword_1000241B0);
  uint64_t v2 = sub_10001CC40();
  int v3 = (void *)v2;
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
    sub_10000FA30(v6, (uint64_t)&v15, &qword_100024200);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000F614(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000D798(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_10000F43C()
{
  uint64_t v0 = sub_10001C850();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  int v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C810();
  sub_10001C830();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v4 = objc_allocWithZone((Class)PFMetadata);
  NSString v5 = sub_10001C990();
  swift_bridgeObjectRelease();
  id v6 = [v4 initForLimitedPropertiesWithPath:v5];

  if (v6)
  {
    sub_10000AB30(v6);
  }
}

void sub_10000F584(void *a1@<X0>, void *a2@<X8>)
{
}

void sub_10000F59C()
{
}

uint64_t sub_10000F5B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008508(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000F614(uint64_t a1, uint64_t a2)
{
  sub_10001CC90();
  sub_10001C9C0();
  Swift::Int v4 = sub_10001CCA0();

  return sub_10000F7A8(a1, a2, v4);
}

uint64_t sub_10000F68C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008508(&qword_1000241D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000F6F4(uint64_t a1)
{
  sub_10001CC90();
  type metadata accessor for CFString(0);
  sub_10000F88C(&qword_1000241F8, type metadata accessor for CFString);
  sub_10001BE70();
  Swift::Int v2 = sub_10001CCA0();

  return sub_10000F8D4(a1, v2);
}

unint64_t sub_10000F7A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001CC70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10001CC70() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000F88C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000F8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_10000F88C(&qword_1000241F8, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_10001BE60();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_10001BE60();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_10000FA30(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100008508(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for PreviewImageUnpacker()
{
  return &type metadata for PreviewImageUnpacker;
}

uint64_t sub_10000FAA4()
{
  return sub_100010E60(&qword_100024208, (void (*)(uint64_t))&type metadata accessor for PreviewImage);
}

uint64_t sub_10000FAEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v125 = a2;
  uint64_t v114 = a1;
  uint64_t v110 = a3;
  uint64_t v103 = sub_10001C6E0();
  uint64_t v102 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  id v107 = (char *)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100008508(&qword_100024210);
  __chkstk_darwin(v4 - 8);
  uint64_t v120 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_10001C7C0();
  uint64_t v113 = *(void *)(v117 - 8);
  uint64_t v6 = __chkstk_darwin(v117);
  v112 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v111 = (char *)&v95 - v8;
  uint64_t v9 = sub_100008508(&qword_100024218);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  id v109 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  id v100 = (char *)&v95 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  id v106 = (char *)&v95 - v15;
  __chkstk_darwin(v14);
  long long v17 = (char *)&v95 - v16;
  uint64_t v18 = sub_100008508(&qword_100024220);
  __chkstk_darwin(v18 - 8);
  uint64_t v115 = (uint64_t)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10001C8B0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v118 = v20;
  uint64_t v119 = v21;
  uint64_t v22 = __chkstk_darwin(v20);
  id v101 = (char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  id v105 = (char *)&v95 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  id v104 = (char *)&v95 - v27;
  __chkstk_darwin(v26);
  char v29 = (char *)&v95 - v28;
  uint64_t v30 = sub_10001C850();
  uint64_t v31 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  int64_t v33 = (char *)&v95 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BF20();
  sub_10001BEB0();
  unint64_t v108 = sub_100009EB4();
  uint64_t v34 = (void *)sub_10001CB90();
  sub_100008508(&qword_100024160);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_10001DD40;
  sub_10001C810();
  uint64_t v36 = sub_10001C830();
  uint64_t v38 = v37;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
  uint64_t v121 = v36;
  uint64_t v122 = v38;
  uint64_t v39 = sub_10001C7E0();
  uint64_t v41 = v40;
  swift_bridgeObjectRelease();
  *(void *)(v35 + 56) = &type metadata for String;
  *(void *)(v35 + 64) = sub_100009F54();
  *(void *)(v35 + 32) = v39;
  *(void *)(v35 + 40) = v41;
  sub_10001CAD0();
  sub_10001BE90();

  swift_bridgeObjectRelease();
  uint64_t v42 = sub_10001C820();
  uint64_t v123 = v42;
  v124 = &protocol witness table for File;
  uint64_t v43 = sub_100010D50(&v121);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 16))(v43, v114, v42);
  sub_10001BF90();
  uint64_t v44 = sub_10001C880();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v115, 1, 1, v44);
  sub_10001C890();
  uint64_t v45 = sub_10001BFD0();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56);
  uint64_t v48 = (uint64_t)v17;
  v47(v17, 1, 1, v45);
  sub_10001C8A0();
  sub_100010DB4(&v121, v123);
  uint64_t v49 = v116;
  uint64_t v50 = v117;
  sub_10001C100();
  if (v49)
  {
    sub_10000F5B8(v48, &qword_100024218);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v29, v118);
    return sub_10000D7A8((uint64_t)&v121);
  }
  uint64_t v97 = v46 + 56;
  uint64_t v98 = v45;
  uint64_t v114 = 0;
  uint64_t v99 = v46;
  id v96 = v47;
  uint64_t v115 = v48;
  unsigned int v116 = v29;
  uint64_t v53 = v112;
  uint64_t v52 = v113;
  uint64_t v54 = (uint64_t)v120;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v113 + 48))(v120, 1, v50) == 1)
  {
    sub_10000F5B8(v54, &qword_100024210);
    sub_10000D7A8((uint64_t)&v121);
    uint64_t v56 = v118;
    uint64_t v55 = v119;
    uint64_t v57 = v115;
    uint64_t v59 = (uint64_t)v109;
    uint64_t v58 = v110;
    uint64_t v60 = v99;
    uint64_t v61 = v98;
    goto LABEL_24;
  }
  uint64_t v62 = v111;
  uint64_t v63 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v111, v54, v50);
  sub_10000D7A8((uint64_t)&v121);
  uint64_t v64 = sub_10001C790();
  uint64_t v67 = v118;
  uint64_t v66 = v119;
  if (!v65)
  {
    sub_10001C8F0();
    sub_100010E60(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_10001C8E0();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v62, v50);
    sub_10000F5B8(v115, &qword_100024218);
    return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v116, v67);
  }
  uint64_t v68 = v64;
  uint64_t v69 = v65;
  if (sub_10001BF80())
  {
    if ((v68 != 0x682E63696C627570 || v69 != 0xEB00000000636965) && (sub_10001CC70() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_10001C8F0();
      sub_100010E60(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_10001C8E0();
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v113 + 8))(v111, v63);
      sub_10000F5B8(v115, &qword_100024218);
      return (*(uint64_t (**)(char *, uint64_t))(v119 + 8))(v116, v118);
    }
    sub_10001BFA0();
    sub_10001BF90();
    uint64_t v121 = 0;
    uint64_t v122 = 0;
    id v70 = v104;
    id v71 = v116;
    uint64_t v72 = v114;
    sub_10001C860();
    uint64_t v114 = v72;
    if (v72)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v113 + 8))(v111, v117);
      sub_10000F5B8(v115, &qword_100024218);
      return (*(uint64_t (**)(char *, uint64_t))(v119 + 8))(v71, v118);
    }
    uint64_t v56 = v118;
    uint64_t v55 = v119;
    (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v105, v70, v118);
    (*(void (**)(char *, void, uint64_t))(v102 + 104))(v107, enum case for StickerEffect.none(_:), v103);
    uint64_t v89 = (uint64_t)v106;
    sub_10001BFC0();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v70, v56);
    (*(void (**)(char *, uint64_t))(v113 + 8))(v111, v117);
    uint64_t v57 = v115;
    sub_10000F5B8(v115, &qword_100024218);
    uint64_t v61 = v98;
    v96((char *)v89, 0, 1, v98);
  }
  else
  {
    char v73 = sub_100008BFC(v68, v69);
    uint64_t v74 = v113;
    (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v53, v111, v63);
    if (v73)
    {
      uint64_t v75 = sub_10001C770();
      id v78 = *(void (**)(char *, uint64_t))(v74 + 8);
      uint64_t v76 = v74 + 8;
      id v77 = v78;
      v78(v53, v63);
      if (v75 > 1)
      {
        uint64_t v113 = v76;
        id v79 = (void *)sub_10001CB90();
        sub_10001CAD0();
        sub_10001BE90();

        uint64_t v80 = sub_10001BFA0();
        uint64_t v81 = v111;
        uint64_t v82 = sub_10001C770();
        uint64_t v83 = sub_10001BFB0();
        uint64_t v84 = v114;
        sub_100010F10(v80, v82, v83);
        if (v84)
        {
          swift_bridgeObjectRelease();
          v77(v81, v117);
          sub_10000F5B8(v115, &qword_100024218);
          return (*(uint64_t (**)(char *, uint64_t))(v119 + 8))(v116, v118);
        }
        sub_10001BF90();
        sub_10001C870();
        uint64_t v114 = 0;
        id v93 = v111;
        sub_10001C770();
        sub_10001C7B0();
        (*(void (**)(char *, void, uint64_t))(v102 + 104))(v107, enum case for StickerEffect.none(_:), v103);
        uint64_t v94 = (uint64_t)v100;
        uint64_t v55 = v119;
        sub_10001BFC0();
        v77(v93, v117);
        uint64_t v57 = v115;
        sub_10000F5B8(v115, &qword_100024218);
        uint64_t v61 = v98;
        v96((char *)v94, 0, 1, v98);
        sub_100010EA8(v94, v57);
        uint64_t v56 = v118;
        goto LABEL_23;
      }
      uint64_t v120 = (char *)v68;
      uint64_t v63 = v117;
      uint64_t v88 = v118;
      id v86 = v105;
      id v87 = v96;
      id v85 = v77;
    }
    else
    {
      uint64_t v120 = (char *)v68;
      id v85 = *(void (**)(char *, uint64_t))(v74 + 8);
      v85(v53, v63);
      id v86 = v105;
      id v87 = v96;
      uint64_t v88 = v118;
    }
    id v90 = (void *)sub_10001CB90();
    sub_10001CAD0();
    sub_10001BE90();

    (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v86, v116, v88);
    id v91 = v111;
    sub_10001C770();
    LODWORD(v125) = sub_10001C780();
    sub_10001C7A0();
    sub_10001C6D0();
    sub_10001C7B0();
    uint64_t v89 = (uint64_t)v106;
    uint64_t v56 = v118;
    sub_10001BFC0();
    v85(v91, v63);
    uint64_t v55 = v119;
    uint64_t v57 = v115;
    sub_10000F5B8(v115, &qword_100024218);
    uint64_t v61 = v98;
    v87((char *)v89, 0, 1, v98);
  }
  sub_100010EA8(v89, v57);
LABEL_23:
  uint64_t v59 = (uint64_t)v109;
  uint64_t v58 = v110;
  uint64_t v60 = v99;
LABEL_24:
  sub_100010DF8(v57, v59);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48))(v59, 1, v61) == 1)
  {
    sub_10000F5B8(v59, &qword_100024218);
    id v92 = (void *)sub_10001CB90();
    sub_10001CAD0();
    sub_10001BE90();

    sub_10001C8F0();
    sub_100010E60(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_10001C8E0();
    swift_willThrow();
    sub_10000F5B8(v57, &qword_100024218);
    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v116, v56);
  }
  else
  {
    sub_10000F5B8(v57, &qword_100024218);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v116, v56);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v58, v59, v61);
  }
}

uint64_t sub_100010CC0@<X0>(uint64_t a1@<X8>)
{
  sub_10001CAE0();
  uint64_t v2 = sub_10001C7C0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

uint64_t sub_100010D38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000FAEC(a1, a2, a3);
}

uint64_t *sub_100010D50(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *sub_100010DB4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100010DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008508(&qword_100024218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010E60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100010EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008508(&qword_100024218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010F10(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result >= a3)
  {
    sub_10001C8F0();
    sub_100010E60(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_10001C8E0();
    return swift_willThrow();
  }
  else if (a3 < a2)
  {
    double v3 = (double)a2 / (double)a3 * (double)result;
    if ((~*(void *)&v3 & 0x7FF0000000000000) != 0)
    {
      if (v3 > -9.22337204e18)
      {
        if (v3 < 9.22337204e18) {
          return (uint64_t)v3;
        }
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_11:
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoPreviewUnpacker()
{
  return &type metadata for VideoPreviewUnpacker;
}

uint64_t sub_10001106C()
{
  return sub_10001BB78(&qword_100024228, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
}

uint64_t sub_1000110B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v5 = sub_100008508(&qword_100024230);
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  __chkstk_darwin(v5);
  uint64_t v38 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001C850();
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001BDE0();
  uint64_t v35 = *(void *)(v10 - 8);
  uint64_t v36 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10001C820();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v17 = sub_10001CAB0();
  sub_10001BD80(0, (unint64_t *)&qword_100024158);
  uint64_t v18 = sub_10001CB70();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v37 = a1;
  v19(v16, a1, v13);
  os_log_type_t v20 = v17;
  if (os_log_type_enabled(v18, v17))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v43 = v31;
    uint64_t v32 = a3;
    *(_DWORD *)uint64_t v21 = 136446210;
    v29[1] = v21 + 4;
    uint64_t v30 = v21;
    sub_10001C810();
    sub_10001C840();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v34);
    sub_10001BB78(&qword_100024240, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v22 = v36;
    uint64_t v23 = sub_10001CC60();
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v22);
    uint64_t v42 = sub_10001ABB4(v23, v25, &v43);
    sub_10001CBA0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    _os_log_impl((void *)&_mh_execute_header, v18, v20, "BlastDoor processing thumbnail for video: %{public}s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  __chkstk_darwin(v26);
  uint64_t v27 = v39;
  v29[-2] = v37;
  v29[-1] = v27;
  sub_100008508(&qword_100024238);
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v38, enum case for AsyncThrowingStream.Continuation.BufferingPolicy.unbounded<A, B>(_:), v41);
  return sub_10001CA50();
}

uint64_t sub_100011594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = a3;
  uint64_t v30 = a1;
  uint64_t v27 = a2;
  uint64_t v31 = sub_100008508(&qword_100024250);
  uint64_t v3 = *(void *)(v31 - 8);
  uint64_t v28 = *(void *)(v3 + 64);
  __chkstk_darwin(v31);
  uint64_t v26 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001C030();
  uint64_t v24 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  unint64_t v25 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001C820();
  uint64_t v23 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100008508(&qword_100024258);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001CA20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v27, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v5);
  uint64_t v16 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v26, v30, v31);
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v18 = (v10 + *(unsigned __int8 *)(v6 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v19 = (v7 + *(unsigned __int8 *)(v3 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = 0;
  *(void *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v17, v11, v23);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v18, v25, v24);
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v20 + v19, v16, v31);
  sub_10001A830((uint64_t)v14, (uint64_t)&unk_100024268, v20);
  return swift_release();
}

uint64_t sub_100011910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  uint64_t v7 = sub_100008508(&qword_100024250);
  v6[8] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[9] = v8;
  v6[10] = *(void *)(v8 + 64);
  v6[11] = swift_task_alloc();
  uint64_t v9 = sub_10001C030();
  v6[12] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[13] = v10;
  v6[14] = *(void *)(v10 + 64);
  v6[15] = swift_task_alloc();
  uint64_t v11 = sub_10001C850();
  v6[16] = v11;
  v6[17] = *(void *)(v11 - 8);
  v6[18] = swift_task_alloc();
  uint64_t v12 = sub_10001BDE0();
  v6[19] = v12;
  v6[20] = *(void *)(v12 - 8);
  v6[21] = swift_task_alloc();
  uint64_t v13 = sub_10001C820();
  v6[22] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v6[23] = v14;
  v6[24] = *(void *)(v14 + 64);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return _swift_task_switch(sub_100011B70, 0, 0);
}

uint64_t sub_100011B70()
{
  uint64_t v48 = v0;
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[22];
  uint64_t v4 = v0[23];
  os_log_type_t v5 = sub_10001CAB0();
  v0[27] = sub_10001BD80(0, (unint64_t *)&qword_100024158);
  uint64_t v6 = sub_10001CB70();
  uint64_t v46 = *(void (**)(void))(v4 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v46)(v2, v1, v3);
  os_log_type_t v7 = v5;
  if (os_log_type_enabled(v6, v5))
  {
    uint64_t v8 = v0[26];
    uint64_t v9 = v0[21];
    uint64_t v40 = v0[23];
    uint64_t v42 = v0[22];
    uint64_t v10 = v0[20];
    uint64_t v36 = v0[19];
    uint64_t v11 = v0[17];
    uint64_t v12 = v0[18];
    uint64_t v35 = v0[16];
    os_log_type_t type = v7;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446210;
    sub_10001C810();
    sub_10001C840();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v35);
    sub_10001BB78(&qword_100024240, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v14 = sub_10001CC60();
    unint64_t v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v36);
    v0[4] = sub_10001ABB4(v14, v16, &v47);
    sub_10001CBA0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v8, v42);
    _os_log_impl((void *)&_mh_execute_header, v6, type, "Task running for video: %{public}s)", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v17 = v0[26];
    uint64_t v18 = v0[22];
    uint64_t v19 = v0[23];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
  uint64_t v20 = v0[23];
  uint64_t v39 = v0[22];
  uint64_t v41 = v0[25];
  uint64_t v21 = v0[15];
  uint64_t v37 = v0[24];
  buf = (uint8_t *)v0[14];
  uint64_t v23 = v0[12];
  uint64_t v22 = v0[13];
  uint64_t v24 = v0[11];
  uint64_t v25 = v0[8];
  uint64_t v26 = v0[9];
  uint64_t v43 = v25;
  *(void *)typea = v24;
  uint64_t v28 = v0[6];
  uint64_t v27 = v0[7];
  v46();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v28, v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v27, v25);
  unint64_t v29 = (*(unsigned __int8 *)(v20 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v30 = (v37 + *(unsigned __int8 *)(v22 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v31 = (unint64_t)&buf[*(unsigned __int8 *)(v26 + 80) + v30] & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v32 = swift_allocObject();
  v0[28] = v32;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v20 + 32))(v32 + v29, v41, v39);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(v32 + v30, v21, v23);
  (*(void (**)(unint64_t, os_log_type_t *, uint64_t))(v26 + 32))(v32 + v31, *(os_log_type_t **)typea, v43);
  uint64_t v33 = (void *)swift_task_alloc();
  v0[29] = v33;
  *uint64_t v33 = v0;
  v33[1] = sub_100011FC0;
  return File.withResource<A>(_:)();
}

uint64_t sub_100011FC0()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100012184;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1000120DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000120DC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100012184()
{
  swift_release();
  os_log_type_t v1 = sub_10001CAC0();
  uint64_t v2 = sub_10001CB70();
  os_log_type_t v3 = v1;
  if (os_log_type_enabled(v2, v1))
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v6;
    sub_10001CBA0();
    *os_log_type_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Caught error: %@", v4, 0xCu);
    sub_100008508(&qword_100024290);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  uint64_t v7 = v0[30];

  v0[2] = v7;
  sub_10001CA40();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10001236C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[134] = a4;
  v4[133] = a3;
  v4[132] = a2;
  sub_100008508(&qword_100024238);
  v4[135] = swift_task_alloc();
  uint64_t v5 = sub_100008508(&qword_100024298);
  v4[136] = v5;
  v4[137] = *(void *)(v5 - 8);
  v4[138] = swift_task_alloc();
  uint64_t v6 = sub_10001C0F0();
  v4[139] = v6;
  v4[140] = *(void *)(v6 - 8);
  v4[141] = swift_task_alloc();
  v4[142] = swift_task_alloc();
  uint64_t v7 = sub_10001C010();
  v4[143] = v7;
  v4[144] = *(void *)(v7 - 8);
  v4[145] = swift_task_alloc();
  v4[146] = swift_task_alloc();
  uint64_t v8 = sub_10001BFF0();
  v4[147] = v8;
  v4[148] = *(void *)(v8 - 8);
  v4[149] = swift_task_alloc();
  v4[150] = swift_task_alloc();
  sub_100008508(&qword_100024220);
  v4[151] = swift_task_alloc();
  uint64_t v9 = sub_10001C8B0();
  v4[152] = v9;
  v4[153] = *(void *)(v9 - 8);
  v4[154] = swift_task_alloc();
  v4[155] = swift_task_alloc();
  uint64_t v10 = sub_10001CA90();
  v4[156] = v10;
  v4[157] = *(void *)(v10 - 8);
  v4[158] = swift_task_alloc();
  v4[159] = swift_task_alloc();
  uint64_t v11 = sub_10001C0B0();
  v4[160] = v11;
  v4[161] = *(void *)(v11 - 8);
  v4[162] = swift_task_alloc();
  v4[163] = swift_task_alloc();
  v4[164] = swift_task_alloc();
  v4[165] = swift_task_alloc();
  v4[166] = swift_task_alloc();
  uint64_t v12 = sub_10001C0D0();
  v4[167] = v12;
  v4[168] = *(void *)(v12 - 8);
  v4[169] = swift_task_alloc();
  uint64_t v13 = sub_10001C040();
  v4[170] = v13;
  v4[171] = *(void *)(v13 - 8);
  v4[172] = swift_task_alloc();
  v4[173] = swift_task_alloc();
  v4[174] = swift_task_alloc();
  v4[175] = swift_task_alloc();
  v4[176] = swift_task_alloc();
  uint64_t v14 = sub_10001BDE0();
  v4[177] = v14;
  v4[178] = *(void *)(v14 - 8);
  v4[179] = swift_task_alloc();
  uint64_t v15 = sub_10001C850();
  v4[180] = v15;
  v4[181] = *(void *)(v15 - 8);
  v4[182] = swift_task_alloc();
  return _swift_task_switch(sub_100012914, 0, 0);
}

uint64_t sub_100012914()
{
  uint64_t v1 = v0[182];
  uint64_t v2 = v0[181];
  uint64_t v3 = v0[180];
  uint64_t v4 = v0[179];
  uint64_t v5 = v0[178];
  uint64_t v6 = v0[177];
  sub_10001C810();
  sub_10001C840();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[183] = sub_100008508(&qword_1000242A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001DD40;
  *(void *)(inited + 32) = sub_10001C9A0();
  *(void *)(inited + 40) = v8;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  sub_10000F304(inited);
  id v9 = objc_allocWithZone((Class)AVURLAsset);
  sub_10001BDD0(v10);
  uint64_t v12 = v11;
  Class isa = sub_10001C950().super.isa;
  swift_bridgeObjectRelease();
  id v14 = [v9 initWithURL:v12 options:isa];
  v0[184] = v14;

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  os_log_type_t v15 = sub_10001CAB0();
  v0[185] = sub_10001BD80(0, (unint64_t *)&qword_100024158);
  unint64_t v16 = sub_10001CB70();
  if (os_log_type_enabled(v16, v15))
  {
    id v17 = v14;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138543362;
    v0[129] = v17;
    id v23 = v14;
    id v19 = v17;
    sub_10001CBA0();
    void *v22 = v17;

    id v14 = v23;
    _os_log_impl((void *)&_mh_execute_header, v16, v15, "Created asset: %{public}@", v18, 0xCu);
    sub_100008508(&qword_100024290);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_10001CAB0();
  uint64_t v20 = (void *)sub_10001CB70();
  sub_10001BEA0();

  v0[2] = v0;
  v0[7] = v0 + 126;
  v0[3] = sub_100012D04;
  v0[82] = swift_continuation_init();
  v0[78] = _NSConcreteStackBlock;
  v0[79] = 0x40000000;
  v0[80] = sub_10001A754;
  v0[81] = &unk_1000216C8;
  [v14 loadTracksWithMediaType:AVMediaTypeVideo completionHandler:v0 + 78];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100012D04()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 1488) = v1;
  if (v1) {
    uint64_t v2 = sub_1000187E0;
  }
  else {
    uint64_t v2 = sub_100012E40;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100012E40()
{
  unint64_t v1 = *(void *)(v0 + 1008);
  sub_10001CAB0();
  uint64_t v2 = (void *)sub_10001CB70();
  sub_10001BEA0();

  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10001CC10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10001CC10();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1496) = v4;
    if (v3)
    {
LABEL_3:
      unint64_t v5 = v3 - 1;
      if (__OFSUB__(v3, 1))
      {
        __break(1u);
      }
      else if ((v1 & 0xC000000000000001) == 0)
      {
        if ((v5 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v5 < *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v6 = *(id *)(v1 + 8 * v5 + 32);
LABEL_8:
          uint64_t v7 = v6;
          swift_bridgeObjectRelease();
          goto LABEL_11;
        }
        __break(1u);
      }
      id v6 = (id)sub_10001CBE0();
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v4 = v3;
    *(void *)(v0 + 1496) = v3;
    if (v3) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = 0;
LABEL_11:
  *(void *)(v0 + 1504) = v7;
  os_log_type_t v8 = sub_10001CAB0();
  id v9 = sub_10001CB70();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134349056;
    *(void *)(v0 + 1048) = v4;
    sub_10001CBA0();
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Tracks found: %{public}ld)", v10, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v11 = *(void **)(v0 + 1472);
  if (v7)
  {
    uint64_t v12 = *(void *)(v0 + 1408);
    uint64_t v13 = *(void *)(v0 + 1368);
    uint64_t v14 = *(void *)(v0 + 1360);
    os_log_type_t v15 = self;
    id v16 = v7;
    *(unsigned char *)(v0 + 1820) = [v15 videoAssetIsSpatial:v11];
    sub_10001C020();
    id v17 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 88);
    *(void *)(v0 + 1512) = v17;
    *(void *)(v0 + 1520) = (v13 + 88) & 0xFFFFFFFFFFFFLL | 0xA3B5000000000000;
    int v18 = v17(v12, v14);
    *(_DWORD *)(v0 + 1796) = v18;
    int v19 = enum case for VideoPreview.FrameConstraints.singleFrame(_:);
    *(_DWORD *)(v0 + 1800) = enum case for VideoPreview.FrameConstraints.singleFrame(_:);
    if (v18 == v19)
    {
      uint64_t v20 = *(void *)(v0 + 1408);
      uint64_t v21 = *(void *)(v0 + 1360);
      uint64_t v22 = *(void *)(v0 + 1352);
      uint64_t v23 = *(void *)(v0 + 1344);
      uint64_t v24 = *(void *)(v0 + 1336);
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1368) + 96);
      *(void *)(v0 + 1528) = v25;
      v25(v20, v21);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v22, v20, v24);
      sub_100008508(&qword_1000242D8);
      uint64_t v26 = sub_10001BE10();
      *(void *)(v0 + 1536) = v26;
      uint64_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 1544) = v27;
      *uint64_t v27 = v0;
      v27[1] = sub_100013800;
      return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 936, v26);
    }
    if (v18 == enum case for VideoPreview.FrameConstraints.multiFrame(_:))
    {
      uint64_t v28 = *(void *)(v0 + 1408);
      uint64_t v29 = *(void *)(v0 + 1328);
      uint64_t v30 = *(void *)(v0 + 1320);
      uint64_t v31 = *(void *)(v0 + 1288);
      uint64_t v32 = *(void *)(v0 + 1280);
      uint64_t v33 = *(void (**)(uint64_t, void))(*(void *)(v0 + 1368) + 96);
      v33(v28, *(void *)(v0 + 1360));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v29, v28, v32);
      uint64_t v34 = sub_10001C080();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v30, v29, v32);
      uint64_t v35 = *(void *)(v0 + 1320);
      uint64_t v36 = *(void *)(v0 + 1288);
      uint64_t v37 = *(void *)(v0 + 1280);
      if (v34 < 1)
      {
        uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
        v39(*(void *)(v0 + 1320), *(void *)(v0 + 1280));
      }
      else
      {
        uint64_t v38 = sub_10001C090();
        uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
        v39(v35, v37);
        if (v38 > 0)
        {
          uint64_t v40 = *(void *)(v0 + 1328);
          uint64_t v41 = *(void *)(v0 + 1280);
          double v42 = (double)sub_10001C080();
          double v43 = (double)sub_10001C090();
          uint64_t v44 = sub_10001C050();
          v39(v40, v41);
          *(double *)(v0 + 1624) = v42;
          *(double *)(v0 + 1616) = v43;
          *(void *)(v0 + 1608) = v44;
          *(void *)(v0 + 1600) = v33;
          uint64_t v45 = (void *)swift_task_alloc();
          *(void *)(v0 + 1632) = v45;
          void *v45 = v0;
          v45[1] = sub_100013ECC;
          uint64_t v46 = *(void *)(v0 + 1272);
          return AVAssetTrack.info.getter(v46);
        }
      }
      uint64_t v51 = *(void **)(v0 + 1472);
      uint64_t v52 = *(void *)(v0 + 1328);
      uint64_t v53 = *(void *)(v0 + 1280);
      sub_10001C8F0();
      sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_10001C8E0();
      swift_willThrow();

      v39(v52, v53);
    }
    else
    {
      uint64_t v47 = *(void **)(v0 + 1472);
      uint64_t v48 = *(void *)(v0 + 1408);
      uint64_t v49 = *(void *)(v0 + 1368);
      uint64_t v50 = *(void *)(v0 + 1360);
      sub_10001C8F0();
      sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_10001C8E0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
    }
  }
  else
  {
    sub_10001C8F0();
    sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_10001C8E0();
    swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v54 = *(uint64_t (**)(void))(v0 + 8);
  return v54();
}

uint64_t sub_100013800()
{
  *(void *)(*(void *)v1 + 1552) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_1000189F4;
  }
  else {
    uint64_t v2 = sub_100013960;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100013960()
{
  v0[195] = v0[117];
  v0[196] = v0[118];
  sub_100008508(&qword_1000242E0);
  uint64_t v1 = sub_10001BE30();
  v0[197] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[198] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100013A64;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 66, v1);
}

uint64_t sub_100013A64()
{
  *(void *)(*(void *)v1 + 1592) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100018C30;
  }
  else {
    uint64_t v2 = sub_100013BC4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100013BC4()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void *)(v0 + 1568);
  uint64_t v2 = *(void *)(v0 + 1560);
  long long v3 = *(_OWORD *)(v0 + 544);
  long long v4 = *(_OWORD *)(v0 + 560);
  *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 528);
  *(_OWORD *)(v0 + 448) = v3;
  *(_OWORD *)(v0 + 464) = v4;
  uint64_t v5 = 0;
  *(void *)&long long v3 = 0;
  CGRect v31 = CGRectApplyAffineTransform(*(CGRect *)(&v1 - 3), (CGAffineTransform *)(v0 + 432));
  double width = v31.size.width;
  double height = v31.size.height;
  double v8 = (double)sub_10001C0C0();
  double v9 = fmin(width / height, 1.77777778);
  if (width / height < 0.75) {
    double v10 = 0.75;
  }
  else {
    double v10 = v9;
  }
  double v11 = ceil(v8 / v10);
  if (height == 0.0 || width == 0.0)
  {
    os_log_type_t v13 = sub_10001CAB0();
    uint64_t v14 = sub_10001CB70();
    os_log_type_t v15 = v13;
    BOOL v16 = os_log_type_enabled(v14, v13);
    uint64_t v17 = *(void *)(v0 + 1352);
    uint64_t v18 = *(void *)(v0 + 1344);
    uint64_t v19 = *(void *)(v0 + 1336);
    if (v16)
    {
      uint64_t v27 = *(void *)(v0 + 1352);
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      *(double *)(v0 + 952) = v8;
      *(double *)(v0 + 960) = v11;
      type metadata accessor for CGSize(0);
      uint64_t v21 = sub_10001C9B0();
      *(void *)(v0 + 1040) = sub_10001ABB4(v21, v22, &v28);
      sub_10001CBA0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "video size is zero, falling back to maxPtSize: %s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v27, v19);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
  }
  else
  {
    double v12 = v8 / width;
    if (v8 / width <= v11 / height) {
      double v12 = v11 / height;
    }
    double v8 = ceil(width * v12);
    double v11 = ceil(height * v12);
    (*(void (**)(void, void))(*(void *)(v0 + 1344) + 8))(*(void *)(v0 + 1352), *(void *)(v0 + 1336));
  }
  uint64_t v23 = *(void *)(v0 + 1528);
  *(double *)(v0 + 1624) = v8;
  *(double *)(v0 + 1616) = v11;
  *(void *)(v0 + 1608) = 0;
  *(void *)(v0 + 1600) = v23;
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 1632) = v24;
  void *v24 = v0;
  v24[1] = sub_100013ECC;
  uint64_t v25 = *(void *)(v0 + 1272);
  return AVAssetTrack.info.getter(v25);
}

uint64_t sub_100013ECC()
{
  *(void *)(*(void *)v1 + 1640) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100018E6C;
  }
  else {
    uint64_t v2 = sub_10001400C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001400C()
{
  uint64_t v13 = v0;
  os_log_type_t v1 = sub_10001CAB0();
  uint64_t v2 = sub_10001CB70();
  os_log_type_t v3 = v1;
  if (os_log_type_enabled(v2, v1))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v5 = sub_10001CA60();
    *(void *)(v0 + 992) = sub_10001ABB4(v5, v6, &v12);
    sub_10001CBA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    uint64_t v7 = sub_10001CA60();
    *(void *)(v0 + 1000) = sub_10001ABB4(v7, v8, &v12);
    sub_10001CBA0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "thumbnailFitPxSize: %s x %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v9 = *(id *)(v0 + 1472);
  double v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 1648) = v10;
  *double v10 = v0;
  v10[1] = sub_10001423C;
  return AVAsset.isAutoLoop.getter();
}

uint64_t sub_10001423C(char a1)
{
  uint64_t v3 = *v2;
  *(unsigned char *)(v3 + 1821) = a1;
  *(void *)(v3 + 1656) = v1;
  swift_task_dealloc();
  if (v1)
  {

    uint64_t v4 = sub_100019084;
  }
  else
  {
    uint64_t v4 = sub_100014390;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100014390()
{
  uint64_t v1 = *(void **)(v0 + 1472);

  id v2 = objc_allocWithZone((Class)AVAssetReader);
  *(void *)(v0 + 1024) = 0;
  id v3 = [v2 initWithAsset:v1 error:v0 + 1024];
  *(void *)(v0 + 1664) = v3;
  uint64_t v4 = *(void **)(v0 + 1024);
  if (!v3)
  {
    uint64_t v44 = *(void **)(v0 + 1504);
    uint64_t v45 = *(void **)(v0 + 1472);
    uint64_t v46 = *(void *)(v0 + 1272);
    uint64_t v47 = *(void *)(v0 + 1256);
    uint64_t v48 = *(void *)(v0 + 1248);
    id v49 = v4;
    sub_10001BDC0();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);

    goto LABEL_66;
  }
  uint64_t v5 = *(void *)(v0 + 1624);
  uint64_t v6 = *(void **)(v0 + 1472);
  id v7 = v4;

  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001DFC0;
  *(void *)(inited + 32) = sub_10001C9A0();
  *(void *)(inited + 40) = v9;
  *(void *)(inited + 72) = sub_100008508(&qword_1000242A8);
  *(void *)(inited + 48) = &off_100021290;
  *(void *)(inited + 80) = sub_10001C9A0();
  *(void *)(inited + 88) = v10;
  if ((~v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_74;
  }
  double v11 = *(double *)(v0 + 1624);
  if (v11 <= -9.22337204e18)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  if (v11 >= 9.22337204e18)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  uint64_t v12 = *(void *)(v0 + 1616);
  *(void *)(inited + 120) = &type metadata for Int;
  *(void *)(inited + 96) = (uint64_t)v11;
  *(void *)(inited + 128) = sub_10001C9A0();
  *(void *)(inited + 136) = v13;
  if ((~v12 & 0x7FF0000000000000) == 0)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  double v14 = *(double *)(v0 + 1616);
  if (v14 <= -9.22337204e18)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (v14 >= 9.22337204e18)
  {
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
  }
  os_log_type_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
  uint64_t v16 = *(void *)(v0 + 1400);
  uint64_t v17 = *(void *)(v0 + 1360);
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = (uint64_t)v14;
  unint64_t v18 = sub_10000F304(inited);
  sub_10001C020();
  int v19 = v15(v16, v17);
  int v20 = enum case for VideoPreview.FrameConstraints.multiFrame(_:);
  *(_DWORD *)(v0 + 1804) = enum case for VideoPreview.FrameConstraints.multiFrame(_:);
  if (v19 == v20)
  {
    uint64_t v21 = *(void *)(v0 + 1400);
    uint64_t v22 = *(void *)(v0 + 1312);
    uint64_t v23 = *(void *)(v0 + 1288);
    uint64_t v24 = *(void *)(v0 + 1280);
    (*(void (**)(uint64_t, void))(v0 + 1600))(v21, *(void *)(v0 + 1360));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v22, v21, v24);
    if (sub_10001C060() >= 1)
    {
      uint64_t v25 = sub_10001C9A0();
      uint64_t v27 = v26;
      uint64_t v28 = sub_10001C060();
      *(void *)(v0 + 784) = &type metadata for Int;
      *(void *)(v0 + 760) = v28;
      sub_10000D798((_OWORD *)(v0 + 760), (_OWORD *)(v0 + 728));
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_10001BBC0((_OWORD *)(v0 + 728), v25, v27, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    *(void *)(v0 + 1672) = v18;
    uint64_t v30 = *(void *)(v0 + 1312);
    uint64_t v31 = *(void *)(v0 + 1304);
    uint64_t v32 = *(void *)(v0 + 1288);
    uint64_t v33 = *(void *)(v0 + 1280);
    uint64_t v34 = sub_10001C050();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v30, v33);
    uint64_t v35 = *(void *)(v0 + 1304);
    uint64_t v36 = *(void *)(v0 + 1288);
    uint64_t v37 = *(void *)(v0 + 1280);
    if (v34 < 1)
    {
      uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v39(*(void *)(v0 + 1304), *(void *)(v0 + 1280));
    }
    else
    {
      char v38 = sub_10001C070();
      uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      *(void *)(v0 + 1680) = v39;
      *(void *)(v0 + 1688) = (v36 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v39(v35, v37);
      if (v38)
      {
        sub_100008508(&qword_1000242C8);
        uint64_t v40 = sub_10001BE50();
        *(void *)(v0 + 1696) = v40;
        uint64_t v41 = (void *)swift_task_alloc();
        *(void *)(v0 + 1704) = v41;
        *uint64_t v41 = v0;
        v41[1] = sub_100015A40;
        uint64_t v42 = v0 + 888;
        uint64_t v43 = v40;
LABEL_25:
        return AVAsynchronousKeyValueLoading.load<A>(_:)(v42, v43);
      }
    }
    v39(*(void *)(v0 + 1312), *(void *)(v0 + 1280));
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 1368) + 8))(*(void *)(v0 + 1400), *(void *)(v0 + 1360));
  }
  *(void *)(v0 + 1720) = v18;
  int v203 = *(_DWORD *)(v0 + 1804);
  uint64_t v50 = *(unsigned int (**)(uint64_t, uint64_t))(v0 + 1512);
  uint64_t v51 = *(void **)(v0 + 1504);
  uint64_t v52 = *(void *)(v0 + 1392);
  uint64_t v53 = *(void *)(v0 + 1360);
  id v54 = objc_allocWithZone((Class)AVAssetReaderTrackOutput);
  id v55 = v51;
  swift_bridgeObjectRetain();
  Class isa = sub_10001C950().super.isa;
  swift_bridgeObjectRelease();
  id v57 = [v54 initWithTrack:v55 outputSettings:isa];
  *(void *)(v0 + 1728) = v57;

  sub_10001C020();
  if (v50(v52, v53) == v203)
  {
    uint64_t v58 = *(void *)(v0 + 1392);
    uint64_t v59 = *(void *)(v0 + 1296);
    uint64_t v60 = *(void *)(v0 + 1288);
    uint64_t v61 = *(void *)(v0 + 1280);
    (*(void (**)(uint64_t, void))(v0 + 1600))(v58, *(void *)(v0 + 1360));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v59, v58, v61);
    [v57 setAppliesPreferredTrackTransform:sub_10001C0A0() & 1];
    if (sub_10001C060() == 1) {
      [v57 setLimitsImageQueueCapacityToOneFrame:1];
    }
    (*(void (**)(void, void))(*(void *)(v0 + 1288) + 8))(*(void *)(v0 + 1296), *(void *)(v0 + 1280));
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 1368) + 8))(*(void *)(v0 + 1392), *(void *)(v0 + 1360));
    [v57 setAppliesPreferredTrackTransform:1];
  }
  uint64_t v62 = *(void **)(v0 + 1664);
  int v63 = *(_DWORD *)(v0 + 1800);
  uint64_t v64 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
  uint64_t v65 = *(void *)(v0 + 1384);
  uint64_t v66 = *(void *)(v0 + 1368);
  uint64_t v67 = *(void *)(v0 + 1360);
  [v57 setAlwaysCopiesSampleData:0];
  [v62 addOutput:v57];
  sub_10001C020();
  int v68 = v64(v65, v67);
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v65, v67);
  if (v68 == v63)
  {
    sub_100008508(&qword_1000242B8);
    uint64_t v69 = sub_10001BE20();
    *(void *)(v0 + 1736) = v69;
    id v70 = (void *)swift_task_alloc();
    *(void *)(v0 + 1744) = v70;
    void *v70 = v0;
    v70[1] = sub_100017090;
    uint64_t v42 = v0 + 1792;
    uint64_t v43 = v69;
    goto LABEL_25;
  }
  id v71 = *(void **)(v0 + 1728);
  [*(id *)(v0 + 1664) startReading];
  *(void *)(v0 + 1016) = 0;
  id v72 = [v71 copyNextSampleBuffer];
  if (!v72)
  {
    uint64_t v128 = *(void **)(v0 + 1728);
    long long v129 = *(void **)(v0 + 1664);
    v130 = *(void **)(v0 + 1504);
    v131 = *(void **)(v0 + 1472);
    uint64_t v132 = *(void *)(v0 + 1272);
    uint64_t v133 = *(void *)(v0 + 1256);
    uint64_t v134 = *(void *)(v0 + 1248);
    swift_bridgeObjectRelease();
    sub_10001C8F0();
    sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_10001C8E0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v133 + 8))(v132, v134);
    goto LABEL_66;
  }
  id v73 = v72;
  uint64_t v74 = *(void *)(v0 + 1608);
  int v75 = *(_DWORD *)(v0 + 1800);
  int v76 = *(_DWORD *)(v0 + 1796);
  id v77 = (opaqueCMSampleBuffer *)v72;
  v173 = (void *)(v0 + 1016);
  swift_beginAccess();
  if (v76 != v75 && *(void *)(v0 + 1016) == v74) {
    goto LABEL_65;
  }
  v171 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1256) + 16);
  uint64_t v78 = *(void *)(v0 + 1224);
  uint64_t v79 = *(void *)(v0 + 1184);
  uint64_t v80 = *(void *)(v0 + 1152);
  uint64_t v81 = *(void *)(v0 + 1120);
  v169 = (void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16);
  v170 = (void (**)(uint64_t, uint64_t, uint64_t))(v78 + 16);
  v172 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1368) + 8);
  v166 = (void (**)(uint64_t, uint64_t, uint64_t))(v81 + 16);
  v167 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1096) + 8);
  v168 = (void (**)(uint64_t, uint64_t, uint64_t))(v80 + 16);
  v162 = (void (**)(uint64_t, uint64_t))(v81 + 8);
  v163 = (void (**)(uint64_t, uint64_t))(v80 + 8);
  v164 = (void (**)(uint64_t, uint64_t))(v79 + 8);
  v165 = (void (**)(uint64_t, uint64_t))(v78 + 8);
  uint64_t v82 = v73;
  while (1)
  {
    if (CMSampleBufferGetNumSamples(v77)) {
      goto LABEL_44;
    }
    uint64_t v83 = *(void *)(v0 + 1608);
    int v84 = *(_DWORD *)(v0 + 1800);
    int v85 = *(_DWORD *)(v0 + 1796);

    uint64_t v86 = *(void *)(v0 + 1016);
    id v87 = v82;
    uint64_t v88 = v87;
    if (v85 != v84 && v86 == v83)
    {
      id v73 = v82;
      id v77 = v87;
      goto LABEL_65;
    }
    if (!CMSampleBufferGetNumSamples(v87)) {
      break;
    }
    id v77 = v88;
LABEL_44:
    uint64_t v96 = sub_10001CAF0();
    if (!v96)
    {
      v142 = *(void **)(v0 + 1728);
      v143 = v77;
      v144 = *(void **)(v0 + 1664);
      v145 = *(void **)(v0 + 1504);
      v146 = *(void **)(v0 + 1472);
      uint64_t v147 = *(void *)(v0 + 1256);
      uint64_t v202 = *(void *)(v0 + 1248);
      uint64_t v205 = *(void *)(v0 + 1272);
      swift_bridgeObjectRelease();
      sub_10001C8F0();
      sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_10001C8E0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v205, v202);
      goto LABEL_66;
    }
    uint64_t v97 = (void *)v96;
    v200 = v82;
    v204 = v77;
    os_log_type_t v98 = sub_10001CAB0();
    uint64_t v99 = sub_10001CB70();
    if (os_log_type_enabled(v99, v98))
    {
      uint64_t v100 = swift_slowAlloc();
      *(_DWORD *)uint64_t v100 = 134217984;
      *(void *)(v100 + 4) = *v173;
      _os_log_impl((void *)&_mh_execute_header, v99, v98, "BlastDoor processing thumbnail %ld", (uint8_t *)v100, 0xCu);
      swift_slowDealloc();
    }
    int v197 = *(_DWORD *)(v0 + 1800);
    v194 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
    uint64_t v190 = *(void *)(v0 + 1376);
    uint64_t v192 = *(void *)(v0 + 1360);
    uint64_t v101 = *(void *)(v0 + 1272);
    uint64_t v102 = *(void *)(v0 + 1264);
    uint64_t v103 = *(void *)(v0 + 1248);
    uint64_t v104 = *(void *)(v0 + 1240);
    uint64_t v176 = *(void *)(v0 + 1232);
    uint64_t v177 = *(void *)(v0 + 1216);
    uint64_t v105 = *(void *)(v0 + 1208);
    uint64_t v106 = *(void *)(v0 + 1200);
    uint64_t v178 = *(void *)(v0 + 1192);
    uint64_t v179 = *(void *)(v0 + 1176);
    uint64_t v175 = *(void *)(v0 + 1168);
    uint64_t v181 = *(void *)(v0 + 1160);
    uint64_t v183 = *(void *)(v0 + 1144);

    sub_10001CB00();
    sub_10001CB40();
    type metadata accessor for CVBuffer(0);
    uint64_t v107 = sub_10001C880();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v107 - 8) + 56))(v105, 1, 1, v107);
    id v174 = v97;
    sub_10001C890();
    unint64_t v108 = *v171;
    (*v171)(v102, v101, v103);
    sub_10001BFE0();
    v108(v102, v101, v103);
    sub_10001C000();
    (*v170)(v176, v104, v177);
    (*v169)(v178, v106, v179);
    (*v168)(v181, v175, v183);
    sub_10001C0E0();
    sub_10001C020();
    int v109 = v194(v190, v192);
    uint64_t v110 = *(void **)(v0 + 1728);
    if (v109 == v197)
    {
      v182 = *(void **)(v0 + 1664);
      v184 = *(void **)(v0 + 1504);
      v185 = *(void **)(v0 + 1472);
      uint64_t v148 = *(void *)(v0 + 1376);
      uint64_t v149 = *(void *)(v0 + 1360);
      uint64_t v196 = *(void *)(v0 + 1248);
      uint64_t v199 = *(void *)(v0 + 1272);
      uint64_t v193 = *(void *)(v0 + 1240);
      uint64_t v195 = *(void *)(v0 + 1256);
      uint64_t v189 = *(void *)(v0 + 1200);
      uint64_t v191 = *(void *)(v0 + 1216);
      uint64_t v187 = *(void *)(v0 + 1168);
      uint64_t v188 = *(void *)(v0 + 1176);
      uint64_t v186 = *(void *)(v0 + 1144);
      uint64_t v150 = *(void *)(v0 + 1136);
      uint64_t v151 = *(void *)(v0 + 1128);
      uint64_t v152 = *(void *)(v0 + 1112);
      uint64_t v153 = *(void *)(v0 + 1104);
      uint64_t v180 = *(void *)(v0 + 1088);
      swift_bridgeObjectRelease();
      (*v172)(v148, v149);
      sub_10001CAB0();
      v154 = (void *)sub_10001CB70();
      sub_10001BEA0();

      (*v166)(v151, v150, v152);
      sub_10001BB78(&qword_1000242B0, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
      sub_10001C7D0();
      sub_100008508(&qword_100024250);
      sub_10001CA30();
      (*v167)(v153, v180);
      *(void *)(v0 + 968) = 0;
      sub_10001CA40();

      (*v162)(v150, v152);
      (*v163)(v187, v186);
      (*v164)(v189, v188);
      (*v165)(v193, v191);
      (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v199, v196);
      goto LABEL_66;
    }
    (*v172)(*(void *)(v0 + 1376), *(void *)(v0 + 1360));
    id v73 = [v110 copyNextSampleBuffer];

    uint64_t v111 = *(void *)(v0 + 1016);
    BOOL v112 = __OFADD__(v111, 1);
    uint64_t v113 = v111 + 1;
    if (v112) {
      goto LABEL_79;
    }
    void *v173 = v113;
    if (v73) {
      BOOL v115 = *(_DWORD *)(v0 + 1796) != *(_DWORD *)(v0 + 1800) && v113 == *(void *)(v0 + 1608);
    }
    else {
      BOOL v115 = 1;
    }
    uint64_t v116 = *(void *)(v0 + 1104);
    uint64_t v117 = *(void *)(v0 + 1088);
    (*v166)(*(void *)(v0 + 1128), *(void *)(v0 + 1136), *(void *)(v0 + 1112));
    sub_10001BB78(&qword_1000242B0, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
    sub_10001C7D0();
    sub_100008508(&qword_100024250);
    sub_10001CA30();
    (*v167)(v116, v117);
    uint64_t v118 = *(void *)(v0 + 1240);
    uint64_t v198 = *(void *)(v0 + 1200);
    uint64_t v201 = *(void *)(v0 + 1216);
    uint64_t v119 = *(void *)(v0 + 1176);
    uint64_t v120 = *(void *)(v0 + 1168);
    uint64_t v121 = *(void *)(v0 + 1144);
    uint64_t v122 = *(void *)(v0 + 1136);
    uint64_t v123 = *(void *)(v0 + 1112);
    if (v115)
    {
      *(void *)(v0 + 976) = 0;
      sub_10001CA40();
    }

    (*v162)(v122, v123);
    (*v163)(v120, v121);
    (*v164)(v198, v119);
    (*v165)(v118, v201);
    if (!v73)
    {
      v155 = *(void **)(v0 + 1728);
      v156 = *(void **)(v0 + 1504);
      v157 = *(void **)(v0 + 1472);
      uint64_t v158 = *(void *)(v0 + 1272);
      uint64_t v159 = *(void *)(v0 + 1256);
      uint64_t v160 = *(void *)(v0 + 1248);

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v159 + 8))(v158, v160);
      goto LABEL_66;
    }
    uint64_t v124 = *(void *)(v0 + 1608);
    int v125 = *(_DWORD *)(v0 + 1800);
    int v126 = *(_DWORD *)(v0 + 1796);
    uint64_t v127 = *(void *)(v0 + 1016);
    id v77 = (opaqueCMSampleBuffer *)v73;
    uint64_t v82 = v73;
    if (v126 != v125)
    {
      uint64_t v82 = v73;
      if (v127 == v124) {
        goto LABEL_65;
      }
    }
  }
  while (1)
  {
    uint64_t v90 = *(void *)(v0 + 1608);
    int v91 = *(_DWORD *)(v0 + 1800);
    int v92 = *(_DWORD *)(v0 + 1796);

    uint64_t v93 = *(void *)(v0 + 1016);
    uint64_t v94 = v88;
    id v77 = v94;
    if (v92 != v91 && v93 == v90) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v94)) {
      goto LABEL_44;
    }
  }
  id v73 = v82;
LABEL_65:
  v135 = *(void **)(v0 + 1728);
  v136 = *(void **)(v0 + 1504);
  v137 = *(void **)(v0 + 1472);
  uint64_t v138 = *(void *)(v0 + 1272);
  uint64_t v139 = *(void *)(v0 + 1256);
  uint64_t v140 = *(void *)(v0 + 1248);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v138, v140);
LABEL_66:
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
  swift_task_dealloc();
  swift_task_dealloc();
  v141 = *(uint64_t (**)(void))(v0 + 8);
  return v141();
}

uint64_t sub_100015A40()
{
  *(void *)(*(void *)v1 + 1712) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    id v2 = sub_1000192C0;
  }
  else
  {
    swift_release();
    id v2 = sub_100015BBC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100015BBC()
{
  uint64_t v187 = v0;
  uint64_t v1 = *(void *)(v0 + 904);
  uint64_t v2 = *(void *)(v0 + 896);
  *(void *)(v0 + 912) = *(void *)(v0 + 888);
  *(void *)(v0 + 920) = v2;
  *(void *)(v0 + 928) = v1;
  double Seconds = CMTimeGetSeconds((CMTime *)(v0 + 912));
  uint64_t v4 = sub_10001C050();
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
LABEL_62:
    __break(1u);
  }
  double v5 = Seconds / ((double)(v4 - 1) + 0.1);
  if (v5 <= 0.0)
  {
    (*(void (**)(void, void))(v0 + 1680))(*(void *)(v0 + 1312), *(void *)(v0 + 1280));
    CMTimeValue value = *(void *)(v0 + 1672);
  }
  else
  {
    CMTimeMakeWithSeconds(&v184, v5, 1000);
    CMTimeEpoch epoch = v184.epoch;
    uint64_t v7 = *(void *)&v184.timescale;
    *(void *)(v0 + 864) = v184.value;
    *(void *)(v0 + 872) = v7;
    *(void *)(v0 + 880) = epoch;
    CFDictionaryRef v8 = CMTimeCopyAsDictionary((CMTime *)(v0 + 864), kCFAllocatorDefault);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 1680);
    CMTimeValue v10 = *(void *)(v0 + 1672);
    if (!v8)
    {
      os_log_type_t v98 = *(void **)(v0 + 1664);
      uint64_t v99 = *(void **)(v0 + 1504);
      uint64_t v100 = *(void **)(v0 + 1472);
      uint64_t v101 = *(void *)(v0 + 1312);
      uint64_t v102 = *(void *)(v0 + 1280);
      uint64_t v103 = *(void *)(v0 + 1256);
      uint64_t v174 = *(void *)(v0 + 1248);
      uint64_t v178 = *(void *)(v0 + 1272);
      swift_bridgeObjectRelease();
      sub_10001C8F0();
      sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_10001C8E0();
      swift_willThrow();

      v9(v101, v102);
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v178, v174);
      goto LABEL_54;
    }
    CFDictionaryRef v11 = v8;
    uint64_t v12 = *(void *)(v0 + 1312);
    uint64_t v13 = *(void *)(v0 + 1280);
    uint64_t v14 = sub_10001C9A0();
    uint64_t v16 = v15;
    *(void *)(v0 + 720) = sub_10001BD80(0, &qword_1000242D0);
    *(void *)(v0 + 696) = v11;
    sub_10000D798((_OWORD *)(v0 + 696), (_OWORD *)(v0 + 664));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v184.CMTimeValue value = v10;
    sub_10001BBC0((_OWORD *)(v0 + 664), v14, v16, isUniquelyReferenced_nonNull_native);
    CMTimeValue value = v184.value;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9(v12, v13);
  }
  *(void *)(v0 + 1720) = value;
  int v181 = *(_DWORD *)(v0 + 1804);
  int v19 = *(unsigned int (**)(uint64_t, uint64_t))(v0 + 1512);
  int v20 = *(void **)(v0 + 1504);
  uint64_t v21 = *(void *)(v0 + 1392);
  uint64_t v22 = *(void *)(v0 + 1360);
  id v23 = objc_allocWithZone((Class)AVAssetReaderTrackOutput);
  id v24 = v20;
  swift_bridgeObjectRetain();
  Class isa = sub_10001C950().super.isa;
  swift_bridgeObjectRelease();
  id v26 = [v23 initWithTrack:v24 outputSettings:isa];
  *(void *)(v0 + 1728) = v26;

  sub_10001C020();
  if (v19(v21, v22) == v181)
  {
    uint64_t v27 = *(void *)(v0 + 1392);
    uint64_t v28 = *(void *)(v0 + 1296);
    uint64_t v29 = *(void *)(v0 + 1288);
    uint64_t v30 = *(void *)(v0 + 1280);
    (*(void (**)(uint64_t, void))(v0 + 1600))(v27, *(void *)(v0 + 1360));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v28, v27, v30);
    [v26 setAppliesPreferredTrackTransform:sub_10001C0A0() & 1];
    if (sub_10001C060() == 1) {
      [v26 setLimitsImageQueueCapacityToOneFrame:1];
    }
    (*(void (**)(void, void))(*(void *)(v0 + 1288) + 8))(*(void *)(v0 + 1296), *(void *)(v0 + 1280));
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 1368) + 8))(*(void *)(v0 + 1392), *(void *)(v0 + 1360));
    [v26 setAppliesPreferredTrackTransform:1];
  }
  uint64_t v31 = *(void **)(v0 + 1664);
  int v32 = *(_DWORD *)(v0 + 1800);
  uint64_t v33 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
  uint64_t v34 = *(void *)(v0 + 1384);
  uint64_t v35 = *(void *)(v0 + 1368);
  uint64_t v36 = *(void *)(v0 + 1360);
  [v26 setAlwaysCopiesSampleData:0];
  [v31 addOutput:v26];
  sub_10001C020();
  int v37 = v33(v34, v36);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
  if (v37 == v32)
  {
    sub_100008508(&qword_1000242B8);
    uint64_t v38 = sub_10001BE20();
    *(void *)(v0 + 1736) = v38;
    uint64_t v39 = (void *)swift_task_alloc();
    *(void *)(v0 + 1744) = v39;
    *uint64_t v39 = v0;
    v39[1] = sub_100017090;
    return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 1792, v38);
  }
  uint64_t v40 = *(void **)(v0 + 1728);
  [*(id *)(v0 + 1664) startReading];
  *(void *)(v0 + 1016) = 0;
  id v41 = [v40 copyNextSampleBuffer];
  if (!v41)
  {
    uint64_t v104 = *(void **)(v0 + 1728);
    uint64_t v105 = *(void **)(v0 + 1664);
    uint64_t v106 = *(void **)(v0 + 1504);
    uint64_t v107 = *(void **)(v0 + 1472);
    uint64_t v108 = *(void *)(v0 + 1272);
    uint64_t v109 = *(void *)(v0 + 1256);
    uint64_t v110 = *(void *)(v0 + 1248);
    swift_bridgeObjectRelease();
    sub_10001C8F0();
    sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_10001C8E0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v108, v110);
    goto LABEL_54;
  }
  id v42 = v41;
  uint64_t v43 = *(void *)(v0 + 1608);
  int v44 = *(_DWORD *)(v0 + 1800);
  int v45 = *(_DWORD *)(v0 + 1796);
  uint64_t v46 = (opaqueCMSampleBuffer *)v41;
  uint64_t v149 = (void *)(v0 + 1016);
  swift_beginAccess();
  if (v45 != v44 && *(void *)(v0 + 1016) == v43) {
    goto LABEL_53;
  }
  uint64_t v148 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1256) + 16);
  uint64_t v47 = *(void *)(v0 + 1224);
  uint64_t v48 = *(void *)(v0 + 1184);
  uint64_t v49 = *(void *)(v0 + 1152);
  uint64_t v50 = *(void *)(v0 + 1120);
  v146 = (void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
  uint64_t v147 = (void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
  v144 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1368) + 8);
  v145 = (void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
  uint64_t v138 = (void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
  uint64_t v139 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1096) + 8);
  uint64_t v140 = (void (**)(uint64_t, uint64_t))(v50 + 8);
  v141 = (void (**)(uint64_t, uint64_t))(v49 + 8);
  v142 = (void (**)(uint64_t, uint64_t))(v48 + 8);
  v143 = (void (**)(uint64_t, uint64_t))(v47 + 8);
  uint64_t v51 = v42;
  while (1)
  {
    if (CMSampleBufferGetNumSamples(v46)) {
      goto LABEL_31;
    }
    uint64_t v52 = *(void *)(v0 + 1608);
    int v53 = *(_DWORD *)(v0 + 1800);
    int v54 = *(_DWORD *)(v0 + 1796);

    uint64_t v55 = *(void *)(v0 + 1016);
    uint64_t v56 = v51;
    id v57 = v56;
    if (v54 != v53 && v55 == v52)
    {
      id v42 = v51;
      uint64_t v46 = v56;
      goto LABEL_53;
    }
    if (!CMSampleBufferGetNumSamples(v56)) {
      break;
    }
    uint64_t v46 = v57;
LABEL_31:
    uint64_t v65 = sub_10001CAF0();
    if (!v65)
    {
      uint64_t v118 = *(void **)(v0 + 1728);
      uint64_t v119 = v46;
      uint64_t v120 = *(void **)(v0 + 1664);
      uint64_t v121 = *(void **)(v0 + 1504);
      uint64_t v122 = *(void **)(v0 + 1472);
      uint64_t v123 = *(void *)(v0 + 1256);
      uint64_t v179 = *(void *)(v0 + 1248);
      uint64_t v183 = *(void *)(v0 + 1272);
      swift_bridgeObjectRelease();
      sub_10001C8F0();
      sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_10001C8E0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v183, v179);
      goto LABEL_54;
    }
    uint64_t v66 = (void *)v65;
    uint64_t v151 = v51;
    v182 = v46;
    os_log_type_t v67 = sub_10001CAB0();
    int v68 = sub_10001CB70();
    if (os_log_type_enabled(v68, v67))
    {
      uint64_t v69 = swift_slowAlloc();
      *(_DWORD *)uint64_t v69 = 134217984;
      *(void *)(v69 + 4) = *v149;
      _os_log_impl((void *)&_mh_execute_header, v68, v67, "BlastDoor processing thumbnail %ld", (uint8_t *)v69, 0xCu);
      swift_slowDealloc();
    }
    int v176 = *(_DWORD *)(v0 + 1800);
    v171 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
    uint64_t v167 = *(void *)(v0 + 1376);
    uint64_t v169 = *(void *)(v0 + 1360);
    uint64_t v70 = *(void *)(v0 + 1272);
    uint64_t v71 = *(void *)(v0 + 1264);
    uint64_t v72 = *(void *)(v0 + 1248);
    uint64_t v73 = *(void *)(v0 + 1240);
    uint64_t v153 = *(void *)(v0 + 1232);
    uint64_t v154 = *(void *)(v0 + 1216);
    uint64_t v74 = *(void *)(v0 + 1208);
    uint64_t v75 = *(void *)(v0 + 1200);
    uint64_t v155 = *(void *)(v0 + 1192);
    uint64_t v156 = *(void *)(v0 + 1176);
    uint64_t v152 = *(void *)(v0 + 1168);
    uint64_t v158 = *(void *)(v0 + 1160);
    uint64_t v160 = *(void *)(v0 + 1144);

    sub_10001CB00();
    sub_10001CB40();
    type metadata accessor for CVBuffer(0);
    uint64_t v185 = v76;
    uint64_t v186 = &protocol witness table for CVBufferRef;
    v184.CMTimeValue value = (CMTimeValue)v66;
    uint64_t v77 = sub_10001C880();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v74, 1, 1, v77);
    id v150 = v66;
    sub_10001C890();
    uint64_t v78 = *v148;
    (*v148)(v71, v70, v72);
    sub_10001BFE0();
    v78(v71, v70, v72);
    sub_10001C000();
    (*v147)(v153, v73, v154);
    (*v146)(v155, v75, v156);
    (*v145)(v158, v152, v160);
    sub_10001C0E0();
    sub_10001C020();
    int v79 = v171(v167, v169);
    uint64_t v80 = *(void **)(v0 + 1728);
    if (v79 == v176)
    {
      uint64_t v159 = *(void **)(v0 + 1664);
      v161 = *(void **)(v0 + 1504);
      v162 = *(void **)(v0 + 1472);
      uint64_t v124 = *(void *)(v0 + 1376);
      uint64_t v125 = *(void *)(v0 + 1360);
      uint64_t v175 = *(void *)(v0 + 1248);
      uint64_t v180 = *(void *)(v0 + 1272);
      uint64_t v170 = *(void *)(v0 + 1240);
      uint64_t v172 = *(void *)(v0 + 1256);
      uint64_t v166 = *(void *)(v0 + 1200);
      uint64_t v168 = *(void *)(v0 + 1216);
      uint64_t v164 = *(void *)(v0 + 1168);
      uint64_t v165 = *(void *)(v0 + 1176);
      uint64_t v163 = *(void *)(v0 + 1144);
      uint64_t v126 = *(void *)(v0 + 1136);
      uint64_t v127 = *(void *)(v0 + 1128);
      uint64_t v128 = *(void *)(v0 + 1112);
      uint64_t v129 = *(void *)(v0 + 1104);
      uint64_t v157 = *(void *)(v0 + 1088);
      swift_bridgeObjectRelease();
      (*v144)(v124, v125);
      sub_10001CAB0();
      v130 = (void *)sub_10001CB70();
      sub_10001BEA0();

      (*v138)(v127, v126, v128);
      sub_10001BB78(&qword_1000242B0, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
      sub_10001C7D0();
      sub_100008508(&qword_100024250);
      sub_10001CA30();
      (*v139)(v129, v157);
      *(void *)(v0 + 968) = 0;
      sub_10001CA40();

      (*v140)(v126, v128);
      (*v141)(v164, v163);
      (*v142)(v166, v165);
      (*v143)(v170, v168);
      (*(void (**)(uint64_t, uint64_t))(v172 + 8))(v180, v175);
      goto LABEL_54;
    }
    (*v144)(*(void *)(v0 + 1376), *(void *)(v0 + 1360));
    id v42 = [v80 copyNextSampleBuffer];

    uint64_t v81 = *(void *)(v0 + 1016);
    BOOL v82 = __OFADD__(v81, 1);
    uint64_t v83 = v81 + 1;
    if (v82) {
      goto LABEL_62;
    }
    *uint64_t v149 = v83;
    if (v42) {
      BOOL v85 = *(_DWORD *)(v0 + 1796) != *(_DWORD *)(v0 + 1800) && v83 == *(void *)(v0 + 1608);
    }
    else {
      BOOL v85 = 1;
    }
    uint64_t v86 = *(void *)(v0 + 1104);
    uint64_t v87 = *(void *)(v0 + 1088);
    (*v138)(*(void *)(v0 + 1128), *(void *)(v0 + 1136), *(void *)(v0 + 1112));
    sub_10001BB78(&qword_1000242B0, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
    sub_10001C7D0();
    sub_100008508(&qword_100024250);
    sub_10001CA30();
    (*v139)(v86, v87);
    uint64_t v88 = *(void *)(v0 + 1240);
    uint64_t v173 = *(void *)(v0 + 1200);
    uint64_t v177 = *(void *)(v0 + 1216);
    uint64_t v89 = *(void *)(v0 + 1176);
    uint64_t v90 = *(void *)(v0 + 1168);
    uint64_t v91 = *(void *)(v0 + 1144);
    uint64_t v92 = *(void *)(v0 + 1136);
    uint64_t v93 = *(void *)(v0 + 1112);
    if (v85)
    {
      *(void *)(v0 + 976) = 0;
      sub_10001CA40();
    }

    (*v140)(v92, v93);
    (*v141)(v90, v91);
    (*v142)(v173, v89);
    (*v143)(v88, v177);
    if (!v42)
    {
      v131 = *(void **)(v0 + 1728);
      uint64_t v132 = *(void **)(v0 + 1504);
      uint64_t v133 = *(void **)(v0 + 1472);
      uint64_t v134 = *(void *)(v0 + 1272);
      uint64_t v135 = *(void *)(v0 + 1256);
      uint64_t v136 = *(void *)(v0 + 1248);

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v134, v136);
      goto LABEL_54;
    }
    uint64_t v94 = *(void *)(v0 + 1608);
    int v95 = *(_DWORD *)(v0 + 1800);
    int v96 = *(_DWORD *)(v0 + 1796);
    uint64_t v97 = *(void *)(v0 + 1016);
    uint64_t v46 = (opaqueCMSampleBuffer *)v42;
    uint64_t v51 = v42;
    if (v96 != v95)
    {
      uint64_t v51 = v42;
      if (v97 == v94) {
        goto LABEL_53;
      }
    }
  }
  while (1)
  {
    uint64_t v59 = *(void *)(v0 + 1608);
    int v60 = *(_DWORD *)(v0 + 1800);
    int v61 = *(_DWORD *)(v0 + 1796);

    uint64_t v62 = *(void *)(v0 + 1016);
    int v63 = v57;
    uint64_t v46 = v63;
    if (v61 != v60 && v62 == v59) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v63)) {
      goto LABEL_31;
    }
  }
  id v42 = v51;
LABEL_53:
  uint64_t v111 = *(void **)(v0 + 1728);
  BOOL v112 = *(void **)(v0 + 1504);
  uint64_t v113 = *(void **)(v0 + 1472);
  uint64_t v114 = *(void *)(v0 + 1272);
  uint64_t v115 = *(void *)(v0 + 1256);
  uint64_t v116 = *(void *)(v0 + 1248);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v114, v116);
LABEL_54:
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v117 = *(uint64_t (**)(void))(v0 + 8);
  return v117();
}

uint64_t sub_100017090()
{
  *(void *)(*(void *)v1 + 1752) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v2 = sub_100019520;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_10001720C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001720C()
{
  float v1 = ceilf(*(float *)(v0 + 1792));
  *(float *)(v0 + 1808) = v1;
  if ((~LODWORD(v1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v1 <= -2147500000.0)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
  }
  if (v1 >= 2147500000.0) {
    goto LABEL_9;
  }
  *(void *)(v0 + 1760) = kCMTimeZero.value;
  *(void *)(v0 + 1812) = *(void *)&kCMTimeZero.timescale;
  *(void *)(v0 + 1768) = kCMTimeZero.epoch;
  sub_100008508(&qword_1000242C0);
  uint64_t v2 = sub_10001BE40();
  *(void *)(v0 + 1776) = v2;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1784) = v3;
  *id v3 = v0;
  v3[1] = sub_10001736C;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 984, v2);
}

uint64_t sub_10001736C()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    swift_release();
    float v1 = sub_10001976C;
  }
  else
  {
    swift_release();
    float v1 = sub_1000174E0;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_1000174E0()
{
  uint64_t v185 = v0;
  unint64_t v1 = *(void *)(v0 + 984);
  if (v1 >> 62) {
    goto LABEL_71;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = (uint64_t *)(v0 + 1812);
    if (!v2) {
      break;
    }
    unint64_t v4 = 0;
    unint64_t v5 = v1 & 0xC000000000000001;
    uint64_t v6 = &selRef_syndicationProperties;
    uint64_t v166 = v2;
    while (1)
    {
      if (v5)
      {
        id v7 = (id)sub_10001CBE0();
      }
      else
      {
        if (v4 >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_69;
        }
        id v7 = *(id *)(v1 + 32 + 8 * v4);
      }
      CFDictionaryRef v8 = v7;
      BOOL v9 = __OFADD__(v4++, 1);
      if (v9) {
        break;
      }
      if (([v7 v6[17]] & 1) == 0)
      {
        CMTimeValue v10 = *(void **)(v0 + 1504);
        [v8 timeMapping];
        uint64_t v11 = v177;
        uint64_t v12 = v176;
        *(void *)(v0 + 792) = v175;
        *(void *)(v0 + 800) = v12;
        *(void *)(v0 + 808) = v11;
        id v13 = [v10 makeSampleCursorWithPresentationTimeStamp:v0 + 792];
        if (v13)
        {
          uint64_t v14 = v13;
          do
          {
            if (([v14 currentSampleDependencyInfo] & 0x1000000) == 0) {
              break;
            }
            if ([v14 stepInPresentationOrderByCount:1] != (id)1) {
              break;
            }
            [v14 presentationTimeStamp];
            [v8 timeMapping];
            uint64_t v15 = v179;
            uint64_t v16 = v176;
            uint64_t v17 = v178;
            long long v18 = v177;
            *(void *)(v0 + 480) = v175;
            *(void *)(v0 + 488) = v16;
            *(_OWORD *)(v0 + 496) = v18;
            *(void *)(v0 + 512) = v17;
            *(void *)(v0 + 520) = v15;
            sub_10001CA80();
          }
          while ((sub_10001CB20() & 1) == 0);
          if (([v14 currentSampleDependencyInfo] & 0x1000000) == 0)
          {
            swift_bridgeObjectRelease();
            [v14 presentationTimeStamp];
            uint64_t v91 = v175;
            uint64_t v92 = v177;
            uint64_t v93 = v176;
            [v8 timeMapping];
            uint64_t v94 = v175;
            long long v95 = v177;
            uint64_t v96 = v179;
            uint64_t v97 = v176;
            os_log_type_t v98 = v178;
            [v8 timeMapping];
            uint64_t v99 = v180;
            uint64_t v100 = v184;
            uint64_t v101 = v181;
            uint64_t v102 = v183;
            long long v103 = v182;
            *(void *)(v0 + 816) = v91;
            *(void *)(v0 + 824) = v93;
            *(void *)(v0 + 832) = v92;
            *(void *)(v0 + 576) = v94;
            *(void *)(v0 + 584) = v97;
            *(_OWORD *)(v0 + 592) = v95;
            *(void *)(v0 + 608) = v98;
            *(void *)(v0 + 616) = v96;
            *(void *)(v0 + 336) = v99;
            *(void *)(v0 + 344) = v101;
            *(_OWORD *)(v0 + 352) = v103;
            *(void *)(v0 + 368) = v102;
            *(void *)(v0 + 376) = v100;
            CMTimeMapTimeFromRangeToRange((CMTime *)&v175, (CMTime *)(v0 + 816), (CMTimeRange *)(v0 + 576), (CMTimeRange *)(v0 + 336));
            uint64_t v21 = v175;
            uint64_t v20 = v176;
            uint64_t v19 = v177;

            goto LABEL_22;
          }

          unint64_t v5 = v1 & 0xC000000000000001;
          uint64_t v2 = v166;
          uint64_t v6 = &selRef_syndicationProperties;
        }
      }

      if (v4 == v2)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = *(void *)(v0 + 1768);
        uint64_t v3 = (uint64_t *)(v0 + 1812);
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10001CC10();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v0 + 1768);
LABEL_21:
  uint64_t v20 = *v3;
  uint64_t v21 = *(void **)(v0 + 1760);
LABEL_22:
  uint64_t v22 = *(void **)(v0 + 1664);
  unint64_t v23 = sub_10001CB30(1, (int)*(float *)(v0 + 1808));
  *(void *)(v0 + 384) = v21;
  *(void *)(v0 + 392) = v20;
  *(void *)(v0 + 400) = v19;
  *(void *)(v0 + 408) = v23;
  *(_DWORD *)(v0 + 416) = v24;
  *(_DWORD *)(v0 + 420) = v25;
  *(void *)(v0 + 424) = v26;
  [v22 setTimeRange:v0 + 384];
  uint64_t v27 = *(void **)(v0 + 1728);
  [*(id *)(v0 + 1664) startReading];
  *(void *)(v0 + 1016) = 0;
  id v28 = [v27 copyNextSampleBuffer];
  if (!v28)
  {
    int v84 = *(void **)(v0 + 1728);
    BOOL v85 = *(void **)(v0 + 1664);
    uint64_t v86 = *(void **)(v0 + 1504);
    uint64_t v87 = *(void **)(v0 + 1472);
    uint64_t v88 = *(void *)(v0 + 1272);
    uint64_t v89 = *(void *)(v0 + 1256);
    uint64_t v90 = *(void *)(v0 + 1248);
    swift_bridgeObjectRelease();
    sub_10001C8F0();
    sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_10001C8E0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v88, v90);
    goto LABEL_61;
  }
  id v29 = v28;
  uint64_t v30 = *(void *)(v0 + 1608);
  int v31 = *(_DWORD *)(v0 + 1800);
  int v32 = *(_DWORD *)(v0 + 1796);
  uint64_t v33 = (opaqueCMSampleBuffer *)v28;
  v143 = (void *)(v0 + 1016);
  swift_beginAccess();
  if (v32 != v31 && *(void *)(v0 + 1016) == v30) {
    goto LABEL_60;
  }
  v141 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1256) + 16);
  uint64_t v34 = *(void *)(v0 + 1224);
  uint64_t v35 = *(void *)(v0 + 1184);
  uint64_t v36 = *(void *)(v0 + 1152);
  uint64_t v37 = *(void *)(v0 + 1120);
  uint64_t v139 = (void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
  uint64_t v140 = (void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16);
  v142 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1368) + 8);
  uint64_t v132 = (void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16);
  uint64_t v133 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1096) + 8);
  uint64_t v134 = (void (**)(uint64_t, uint64_t))(v37 + 8);
  uint64_t v135 = (void (**)(uint64_t, uint64_t))(v36 + 8);
  uint64_t v136 = (void (**)(uint64_t, uint64_t))(v35 + 8);
  v137 = (void (**)(uint64_t, CMTimeRange *))(v34 + 8);
  uint64_t v138 = (void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
  uint64_t v38 = v29;
  while (1)
  {
    v171 = v38;
    if (CMSampleBufferGetNumSamples(v33)) {
      goto LABEL_38;
    }
    uint64_t v39 = *(void *)(v0 + 1608);
    int v40 = *(_DWORD *)(v0 + 1800);
    int v41 = *(_DWORD *)(v0 + 1796);

    uint64_t v42 = *(void *)(v0 + 1016);
    uint64_t v43 = v38;
    int v44 = v43;
    if (v41 != v40 && v42 == v39)
    {
      id v29 = v38;
      uint64_t v33 = v43;
      goto LABEL_60;
    }
    if (!CMSampleBufferGetNumSamples(v43)) {
      break;
    }
    uint64_t v33 = v44;
LABEL_38:
    uint64_t v52 = sub_10001CAF0();
    if (!v52)
    {
      BOOL v112 = *(void **)(v0 + 1728);
      uint64_t v113 = v33;
      uint64_t v114 = *(void **)(v0 + 1664);
      uint64_t v115 = *(void **)(v0 + 1504);
      uint64_t v116 = *(void **)(v0 + 1472);
      uint64_t v174 = *(void *)(v0 + 1272);
      uint64_t v117 = *(void *)(v0 + 1256);
      uint64_t v118 = *(void *)(v0 + 1248);
      swift_bridgeObjectRelease();
      sub_10001C8F0();
      sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_10001C8E0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v174, v118);
      goto LABEL_61;
    }
    int v53 = (void *)v52;
    uint64_t v173 = v33;
    os_log_type_t v54 = sub_10001CAB0();
    uint64_t v55 = sub_10001CB70();
    if (os_log_type_enabled(v55, v54))
    {
      uint64_t v56 = swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 134217984;
      *(void *)(v56 + 4) = *v143;
      _os_log_impl((void *)&_mh_execute_header, v55, v54, "BlastDoor processing thumbnail %ld", (uint8_t *)v56, 0xCu);
      swift_slowDealloc();
    }
    int v168 = *(_DWORD *)(v0 + 1800);
    uint64_t v164 = *(uint64_t (**)(uint64_t, CMTimeRange *))(v0 + 1512);
    uint64_t v159 = *(void *)(v0 + 1376);
    toRange = *(CMTimeRange **)(v0 + 1360);
    uint64_t v57 = *(void *)(v0 + 1272);
    uint64_t v58 = *(void *)(v0 + 1264);
    uint64_t v59 = *(void *)(v0 + 1248);
    uint64_t v60 = *(void *)(v0 + 1240);
    uint64_t v146 = *(void *)(v0 + 1232);
    uint64_t v147 = *(void *)(v0 + 1216);
    uint64_t v61 = *(void *)(v0 + 1208);
    uint64_t v62 = *(void *)(v0 + 1200);
    uint64_t v148 = *(void *)(v0 + 1192);
    uint64_t v149 = *(void *)(v0 + 1176);
    uint64_t v145 = *(void *)(v0 + 1168);
    unint64_t v150 = *(void *)(v0 + 1160);
    uint64_t v152 = *(void *)(v0 + 1144);

    sub_10001CB00();
    sub_10001CB40();
    type metadata accessor for CVBuffer(0);
    *((void *)&v177 + 1) = v63;
    uint64_t v178 = &protocol witness table for CVBufferRef;
    uint64_t v175 = v53;
    uint64_t v64 = sub_10001C880();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 56))(v61, 1, 1, v64);
    id v144 = v53;
    sub_10001C890();
    uint64_t v65 = *v141;
    (*v141)(v58, v57, v59);
    sub_10001BFE0();
    v65(v58, v57, v59);
    sub_10001C000();
    (*v140)(v146, v60, v147);
    (*v139)(v148, v62, v149);
    unint64_t v1 = v150;
    (*v138)(v150, v145, v152);
    sub_10001C0E0();
    sub_10001C020();
    int v66 = v164(v159, toRange);
    os_log_type_t v67 = *(void **)(v0 + 1728);
    if (v66 == v168)
    {
      uint64_t v153 = *(void **)(v0 + 1664);
      uint64_t v154 = *(void **)(v0 + 1504);
      uint64_t v155 = *(void **)(v0 + 1472);
      uint64_t v119 = *(void *)(v0 + 1376);
      uint64_t v120 = *(void *)(v0 + 1360);
      uint64_t v165 = *(void *)(v0 + 1256);
      uint64_t v167 = *(void *)(v0 + 1248);
      uint64_t v170 = *(void *)(v0 + 1272);
      toRangea = *(CMTimeRange **)(v0 + 1216);
      uint64_t v163 = *(void *)(v0 + 1240);
      uint64_t v158 = *(void *)(v0 + 1176);
      uint64_t v160 = *(void *)(v0 + 1200);
      uint64_t v156 = *(void *)(v0 + 1144);
      uint64_t v157 = *(void *)(v0 + 1168);
      uint64_t v121 = *(void *)(v0 + 1136);
      uint64_t v122 = *(void *)(v0 + 1128);
      uint64_t v123 = *(void *)(v0 + 1112);
      uint64_t v124 = *(void *)(v0 + 1104);
      uint64_t v151 = *(void *)(v0 + 1088);
      swift_bridgeObjectRelease();
      (*v142)(v119, v120);
      sub_10001CAB0();
      uint64_t v125 = (void *)sub_10001CB70();
      sub_10001BEA0();

      (*v132)(v122, v121, v123);
      sub_10001BB78(&qword_1000242B0, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
      sub_10001C7D0();
      sub_100008508(&qword_100024250);
      sub_10001CA30();
      (*v133)(v124, v151);
      *(void *)(v0 + 968) = 0;
      sub_10001CA40();

      (*v134)(v121, v123);
      (*v135)(v157, v156);
      (*v136)(v160, v158);
      (*v137)(v163, toRangea);
      (*(void (**)(uint64_t, uint64_t))(v165 + 8))(v170, v167);
      goto LABEL_61;
    }
    (*v142)(*(void *)(v0 + 1376), *(void *)(v0 + 1360));
    id v29 = [v67 copyNextSampleBuffer];

    uint64_t v68 = *(void *)(v0 + 1016);
    BOOL v9 = __OFADD__(v68, 1);
    uint64_t v69 = v68 + 1;
    if (v9) {
      goto LABEL_70;
    }
    void *v143 = v69;
    if (v29) {
      BOOL v71 = *(_DWORD *)(v0 + 1796) != *(_DWORD *)(v0 + 1800) && v69 == *(void *)(v0 + 1608);
    }
    else {
      BOOL v71 = 1;
    }
    uint64_t v72 = *(void *)(v0 + 1104);
    uint64_t v73 = *(void *)(v0 + 1088);
    (*v132)(*(void *)(v0 + 1128), *(void *)(v0 + 1136), *(void *)(v0 + 1112));
    sub_10001BB78(&qword_1000242B0, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
    sub_10001C7D0();
    sub_100008508(&qword_100024250);
    sub_10001CA30();
    (*v133)(v72, v73);
    uint64_t v74 = *(void *)(v0 + 1240);
    uint64_t v169 = *(void *)(v0 + 1200);
    uint64_t v172 = *(CMTimeRange **)(v0 + 1216);
    uint64_t v75 = *(void *)(v0 + 1176);
    uint64_t v76 = *(void *)(v0 + 1168);
    uint64_t v77 = *(void *)(v0 + 1144);
    uint64_t v78 = *(void *)(v0 + 1136);
    uint64_t v79 = *(void *)(v0 + 1112);
    if (v71)
    {
      *(void *)(v0 + 976) = 0;
      sub_10001CA40();
    }

    (*v134)(v78, v79);
    (*v135)(v76, v77);
    (*v136)(v169, v75);
    (*v137)(v74, v172);
    if (!v29)
    {
      uint64_t v126 = *(void **)(v0 + 1728);
      uint64_t v127 = *(void **)(v0 + 1504);
      uint64_t v128 = *(void **)(v0 + 1472);
      uint64_t v129 = *(void *)(v0 + 1272);
      uint64_t v130 = *(void *)(v0 + 1256);
      uint64_t v131 = *(void *)(v0 + 1248);

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v129, v131);
      goto LABEL_61;
    }
    uint64_t v80 = *(void *)(v0 + 1608);
    int v81 = *(_DWORD *)(v0 + 1800);
    int v82 = *(_DWORD *)(v0 + 1796);
    uint64_t v83 = *(void *)(v0 + 1016);
    uint64_t v33 = (opaqueCMSampleBuffer *)v29;
    uint64_t v38 = v29;
    if (v82 != v81)
    {
      uint64_t v38 = v29;
      if (v83 == v80) {
        goto LABEL_60;
      }
    }
  }
  while (1)
  {
    uint64_t v46 = *(void *)(v0 + 1608);
    int v47 = *(_DWORD *)(v0 + 1800);
    int v48 = *(_DWORD *)(v0 + 1796);

    uint64_t v49 = *(void *)(v0 + 1016);
    uint64_t v50 = v44;
    uint64_t v33 = v50;
    if (v48 != v47 && v49 == v46) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v50)) {
      goto LABEL_38;
    }
  }
  id v29 = v38;
LABEL_60:
  uint64_t v104 = *(void **)(v0 + 1728);
  uint64_t v105 = *(void **)(v0 + 1504);
  uint64_t v106 = *(void **)(v0 + 1472);
  uint64_t v107 = *(void *)(v0 + 1272);
  uint64_t v108 = *(void *)(v0 + 1256);
  uint64_t v109 = *(void *)(v0 + 1248);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v107, v109);
LABEL_61:
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v110 = *(uint64_t (**)(void))(v0 + 8);
  return v110();
}

uint64_t sub_1000187E0()
{
  unint64_t v1 = *(void **)(v0 + 1472);
  swift_willThrow();

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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000189F4()
{
  unint64_t v1 = *(void **)(v0 + 1504);
  uint64_t v2 = *(void *)(v0 + 1352);
  uint64_t v3 = *(void *)(v0 + 1344);
  uint64_t v4 = *(void *)(v0 + 1336);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
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
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100018C30()
{
  unint64_t v1 = *(void **)(v0 + 1504);
  uint64_t v2 = *(void *)(v0 + 1352);
  uint64_t v3 = *(void *)(v0 + 1344);
  uint64_t v4 = *(void *)(v0 + 1336);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
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
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100018E6C()
{
  unint64_t v1 = *(void **)(v0 + 1504);

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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100019084()
{
  unint64_t v1 = *(void **)(v0 + 1504);
  uint64_t v2 = *(void *)(v0 + 1272);
  uint64_t v3 = *(void *)(v0 + 1256);
  uint64_t v4 = *(void *)(v0 + 1248);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
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
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000192C0()
{
  unint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1680);
  uint64_t v2 = *(void **)(v0 + 1504);
  uint64_t v3 = *(void **)(v0 + 1472);
  uint64_t v4 = *(void *)(v0 + 1312);
  uint64_t v5 = *(void *)(v0 + 1280);
  uint64_t v6 = *(void *)(v0 + 1272);
  uint64_t v7 = *(void *)(v0 + 1256);
  uint64_t v8 = *(void *)(v0 + 1248);

  v1(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
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
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_100019520()
{
  unint64_t v1 = *(void **)(v0 + 1728);
  uint64_t v2 = *(void **)(v0 + 1504);
  uint64_t v3 = *(void **)(v0 + 1472);
  uint64_t v4 = *(void *)(v0 + 1272);
  uint64_t v5 = *(void *)(v0 + 1256);
  uint64_t v6 = *(void *)(v0 + 1248);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_10001976C()
{
  uint64_t v1 = *(void *)(v0 + 1768);
  uint64_t v2 = *(void *)(v0 + 1760);
  uint64_t v3 = *(void **)(v0 + 1664);
  uint64_t v4 = *(void *)(v0 + 1812);
  unint64_t v5 = sub_10001CB30(1, (int)*(float *)(v0 + 1808));
  *(void *)(v0 + 384) = v2;
  *(void *)(v0 + 392) = v4;
  *(void *)(v0 + 400) = v1;
  *(void *)(v0 + 408) = v5;
  *(_DWORD *)(v0 + 416) = v6;
  *(_DWORD *)(v0 + 420) = v7;
  *(void *)(v0 + 424) = v8;
  [v3 setTimeRange:v0 + 384];
  uint64_t v9 = *(void **)(v0 + 1728);
  [*(id *)(v0 + 1664) startReading];
  *(void *)(v0 + 1016) = 0;
  id v10 = [v9 copyNextSampleBuffer];
  if (!v10)
  {
    int v66 = *(void **)(v0 + 1728);
    os_log_type_t v67 = *(void **)(v0 + 1664);
    uint64_t v68 = *(void **)(v0 + 1504);
    uint64_t v69 = *(void **)(v0 + 1472);
    uint64_t v70 = *(void *)(v0 + 1272);
    uint64_t v71 = *(void *)(v0 + 1256);
    uint64_t v72 = *(void *)(v0 + 1248);
    swift_bridgeObjectRelease();
    sub_10001C8F0();
    sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
    swift_allocError();
    sub_10001C8E0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v70, v72);
    goto LABEL_39;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)(v0 + 1608);
  int v13 = *(_DWORD *)(v0 + 1800);
  int v14 = *(_DWORD *)(v0 + 1796);
  uint64_t v15 = (opaqueCMSampleBuffer *)v10;
  uint64_t v111 = (void *)(v0 + 1016);
  swift_beginAccess();
  if (v14 != v13 && *(void *)(v0 + 1016) == v12) {
    goto LABEL_38;
  }
  uint64_t v110 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1256) + 16);
  uint64_t v16 = *(void *)(v0 + 1224);
  uint64_t v17 = *(void *)(v0 + 1184);
  uint64_t v18 = *(void *)(v0 + 1152);
  uint64_t v19 = *(void *)(v0 + 1120);
  uint64_t v108 = (void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  uint64_t v109 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  uint64_t v106 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1368) + 8);
  uint64_t v107 = (void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
  uint64_t v104 = (void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  uint64_t v105 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1096) + 8);
  uint64_t v100 = (void (**)(uint64_t, uint64_t))(v19 + 8);
  uint64_t v101 = (void (**)(uint64_t, uint64_t))(v18 + 8);
  uint64_t v102 = (void (**)(uint64_t, uint64_t))(v17 + 8);
  long long v103 = (void (**)(uint64_t, uint64_t))(v16 + 8);
  uint64_t v20 = v11;
  while (1)
  {
    if (CMSampleBufferGetNumSamples(v15)) {
      goto LABEL_17;
    }
    uint64_t v21 = *(void *)(v0 + 1608);
    int v22 = *(_DWORD *)(v0 + 1800);
    int v23 = *(_DWORD *)(v0 + 1796);

    uint64_t v24 = *(void *)(v0 + 1016);
    int v25 = v20;
    uint64_t v26 = v25;
    if (v23 != v22 && v24 == v21)
    {
      id v11 = v20;
      uint64_t v15 = v25;
      goto LABEL_38;
    }
    if (!CMSampleBufferGetNumSamples(v25)) {
      break;
    }
    uint64_t v15 = v26;
LABEL_17:
    uint64_t v34 = sub_10001CAF0();
    if (!v34)
    {
      int v81 = *(void **)(v0 + 1728);
      int v82 = v15;
      uint64_t v83 = *(void **)(v0 + 1664);
      int v84 = *(void **)(v0 + 1504);
      BOOL v85 = *(void **)(v0 + 1472);
      uint64_t v86 = *(void *)(v0 + 1256);
      uint64_t v140 = *(void *)(v0 + 1248);
      uint64_t v142 = *(void *)(v0 + 1272);
      swift_bridgeObjectRelease();
      sub_10001C8F0();
      sub_10001BB78(&qword_100024170, (void (*)(uint64_t))&type metadata accessor for Explosion);
      swift_allocError();
      sub_10001C8E0();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v142, v140);
      goto LABEL_39;
    }
    uint64_t v35 = (void *)v34;
    uint64_t v138 = v20;
    v141 = v15;
    os_log_type_t v36 = sub_10001CAB0();
    uint64_t v37 = sub_10001CB70();
    if (os_log_type_enabled(v37, v36))
    {
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 134217984;
      *(void *)(v38 + 4) = *v111;
      _os_log_impl((void *)&_mh_execute_header, v37, v36, "BlastDoor processing thumbnail %ld", (uint8_t *)v38, 0xCu);
      swift_slowDealloc();
    }
    int v135 = *(_DWORD *)(v0 + 1800);
    uint64_t v132 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1512);
    uint64_t v128 = *(void *)(v0 + 1376);
    uint64_t v130 = *(void *)(v0 + 1360);
    uint64_t v39 = *(void *)(v0 + 1272);
    uint64_t v40 = *(void *)(v0 + 1264);
    uint64_t v41 = *(void *)(v0 + 1248);
    uint64_t v42 = *(void *)(v0 + 1240);
    uint64_t v114 = *(void *)(v0 + 1232);
    uint64_t v115 = *(void *)(v0 + 1216);
    uint64_t v43 = *(void *)(v0 + 1208);
    uint64_t v44 = *(void *)(v0 + 1200);
    uint64_t v116 = *(void *)(v0 + 1192);
    uint64_t v117 = *(void *)(v0 + 1176);
    uint64_t v113 = *(void *)(v0 + 1168);
    uint64_t v119 = *(void *)(v0 + 1160);
    uint64_t v121 = *(void *)(v0 + 1144);

    sub_10001CB00();
    sub_10001CB40();
    type metadata accessor for CVBuffer(0);
    uint64_t v45 = sub_10001C880();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v43, 1, 1, v45);
    id v112 = v35;
    sub_10001C890();
    uint64_t v46 = *v110;
    (*v110)(v40, v39, v41);
    sub_10001BFE0();
    v46(v40, v39, v41);
    sub_10001C000();
    (*v109)(v114, v42, v115);
    (*v108)(v116, v44, v117);
    (*v107)(v119, v113, v121);
    sub_10001C0E0();
    sub_10001C020();
    int v47 = v132(v128, v130);
    int v48 = *(void **)(v0 + 1728);
    if (v47 == v135)
    {
      uint64_t v120 = *(void **)(v0 + 1664);
      uint64_t v122 = *(void **)(v0 + 1504);
      uint64_t v123 = *(void **)(v0 + 1472);
      uint64_t v87 = *(void *)(v0 + 1376);
      uint64_t v88 = *(void *)(v0 + 1360);
      uint64_t v134 = *(void *)(v0 + 1248);
      uint64_t v137 = *(void *)(v0 + 1272);
      uint64_t v131 = *(void *)(v0 + 1240);
      uint64_t v133 = *(void *)(v0 + 1256);
      uint64_t v127 = *(void *)(v0 + 1200);
      uint64_t v129 = *(void *)(v0 + 1216);
      uint64_t v125 = *(void *)(v0 + 1168);
      uint64_t v126 = *(void *)(v0 + 1176);
      uint64_t v124 = *(void *)(v0 + 1144);
      uint64_t v89 = *(void *)(v0 + 1136);
      uint64_t v90 = *(void *)(v0 + 1128);
      uint64_t v91 = *(void *)(v0 + 1112);
      uint64_t v92 = *(void *)(v0 + 1104);
      uint64_t v118 = *(void *)(v0 + 1088);
      swift_bridgeObjectRelease();
      (*v106)(v87, v88);
      sub_10001CAB0();
      uint64_t v93 = (void *)sub_10001CB70();
      sub_10001BEA0();

      (*v104)(v90, v89, v91);
      sub_10001BB78(&qword_1000242B0, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
      sub_10001C7D0();
      sub_100008508(&qword_100024250);
      sub_10001CA30();
      (*v105)(v92, v118);
      *(void *)(v0 + 968) = 0;
      sub_10001CA40();

      (*v100)(v89, v91);
      (*v101)(v125, v124);
      (*v102)(v127, v126);
      (*v103)(v131, v129);
      (*(void (**)(uint64_t, uint64_t))(v133 + 8))(v137, v134);
      goto LABEL_39;
    }
    (*v106)(*(void *)(v0 + 1376), *(void *)(v0 + 1360));
    id v11 = [v48 copyNextSampleBuffer];

    uint64_t v49 = *(void *)(v0 + 1016);
    BOOL v50 = __OFADD__(v49, 1);
    uint64_t v51 = v49 + 1;
    if (v50) {
      __break(1u);
    }
    *uint64_t v111 = v51;
    if (v11) {
      BOOL v53 = *(_DWORD *)(v0 + 1796) != *(_DWORD *)(v0 + 1800) && v51 == *(void *)(v0 + 1608);
    }
    else {
      BOOL v53 = 1;
    }
    uint64_t v54 = *(void *)(v0 + 1104);
    uint64_t v55 = *(void *)(v0 + 1088);
    (*v104)(*(void *)(v0 + 1128), *(void *)(v0 + 1136), *(void *)(v0 + 1112));
    sub_10001BB78(&qword_1000242B0, (void (*)(uint64_t))&type metadata accessor for VideoPreview);
    sub_10001C7D0();
    sub_100008508(&qword_100024250);
    sub_10001CA30();
    (*v105)(v54, v55);
    uint64_t v56 = *(void *)(v0 + 1240);
    uint64_t v136 = *(void *)(v0 + 1200);
    uint64_t v139 = *(void *)(v0 + 1216);
    uint64_t v57 = *(void *)(v0 + 1176);
    uint64_t v58 = *(void *)(v0 + 1168);
    uint64_t v59 = *(void *)(v0 + 1144);
    uint64_t v60 = *(void *)(v0 + 1136);
    uint64_t v61 = *(void *)(v0 + 1112);
    if (v53)
    {
      *(void *)(v0 + 976) = 0;
      sub_10001CA40();
    }

    (*v100)(v60, v61);
    (*v101)(v58, v59);
    (*v102)(v136, v57);
    (*v103)(v56, v139);
    if (!v11)
    {
      uint64_t v94 = *(void **)(v0 + 1728);
      long long v95 = *(void **)(v0 + 1504);
      uint64_t v96 = *(void **)(v0 + 1472);
      uint64_t v97 = *(void *)(v0 + 1272);
      uint64_t v98 = *(void *)(v0 + 1256);
      uint64_t v99 = *(void *)(v0 + 1248);

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v97, v99);
      goto LABEL_39;
    }
    uint64_t v62 = *(void *)(v0 + 1608);
    int v63 = *(_DWORD *)(v0 + 1800);
    int v64 = *(_DWORD *)(v0 + 1796);
    uint64_t v65 = *(void *)(v0 + 1016);
    uint64_t v15 = (opaqueCMSampleBuffer *)v11;
    uint64_t v20 = v11;
    if (v64 != v63)
    {
      uint64_t v20 = v11;
      if (v65 == v62) {
        goto LABEL_38;
      }
    }
  }
  while (1)
  {
    uint64_t v28 = *(void *)(v0 + 1608);
    int v29 = *(_DWORD *)(v0 + 1800);
    int v30 = *(_DWORD *)(v0 + 1796);

    uint64_t v31 = *(void *)(v0 + 1016);
    int v32 = v26;
    uint64_t v15 = v32;
    if (v30 != v29 && v31 == v28) {
      break;
    }
    if (CMSampleBufferGetNumSamples(v32)) {
      goto LABEL_17;
    }
  }
  id v11 = v20;
LABEL_38:
  uint64_t v73 = *(void **)(v0 + 1728);
  uint64_t v74 = *(void **)(v0 + 1504);
  uint64_t v75 = *(void **)(v0 + 1472);
  uint64_t v76 = *(void *)(v0 + 1272);
  uint64_t v77 = *(void *)(v0 + 1256);
  uint64_t v78 = *(void *)(v0 + 1248);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v78);
LABEL_39:
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v79 = *(uint64_t (**)(void))(v0 + 8);
  return v79();
}

uint64_t sub_10001A754(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100008508(&qword_100024150);
    uint64_t v5 = swift_allocError();
    *int v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10001BD80(0, &qword_1000242E8);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_10001C9F0();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10001A830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001CA20();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10001CA10();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001B6A0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10001CA00();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001A9D8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001AAB4;
  return v6(a1);
}

uint64_t sub_10001AAB4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001ABAC(uint64_t a1)
{
  return sub_100011594(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001ABB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001AC88(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D6D4((uint64_t)v12, *a3);
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
      sub_10000D6D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D7A8((uint64_t)v12);
  return v7;
}

uint64_t sub_10001AC88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001CBB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001AE44(a5, a6);
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
  uint64_t v8 = sub_10001CBF0();
  if (!v8)
  {
    sub_10001CC00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001CC50();
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

uint64_t sub_10001AE44(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001AEDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001B0BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001B0BC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001AEDC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001B054(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001CBD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001CC00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001C9E0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001CC50();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001CC00();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001B054(uint64_t a1, uint64_t a2)
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
  sub_100008508(&qword_100024248);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001B0BC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008508(&qword_100024248);
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
  int v13 = a4 + 32;
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
  uint64_t result = sub_10001CC50();
  __break(1u);
  return result;
}

uint64_t sub_10001B210()
{
  uint64_t v17 = sub_10001C820();
  uint64_t v1 = *(void *)(v17 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v16 = sub_10001C030();
  uint64_t v5 = *(void *)(v16 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = sub_100008508(&qword_100024250);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v15 = v12 + *(void *)(v10 + 64);
  uint64_t v13 = v2 | v6 | v11 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v17);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v16);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);

  return _swift_deallocObject(v0, v15, v13);
}

uint64_t sub_10001B3F4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10001C820() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(sub_10001C030() - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(sub_100008508(&qword_100024250) - 8) + 80);
  unint64_t v11 = v8 + v9 + v10;
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v14 = v1 + v5;
  uint64_t v15 = v1 + v8;
  uint64_t v16 = v1 + (v11 & ~v10);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v17;
  void *v17 = v2;
  v17[1] = sub_10001B5AC;
  return sub_100011910(a1, v12, v13, v14, v15, v16);
}

uint64_t sub_10001B5AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001B6A0(uint64_t a1)
{
  uint64_t v2 = sub_100008508(&qword_100024258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001B700()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B738(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10001BDBC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100024270 + dword_100024270);
  return v6(a1, v4);
}

uint64_t sub_10001B7F0()
{
  uint64_t v17 = sub_10001C820();
  uint64_t v1 = *(void *)(v17 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v16 = sub_10001C030();
  uint64_t v5 = *(void *)(v16 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = sub_100008508(&qword_100024250);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v15 = v12 + *(void *)(v10 + 64);
  uint64_t v13 = v2 | v6 | v11 | 7;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v3, v17);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v16);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v9);

  return _swift_deallocObject(v0, v15, v13);
}

uint64_t sub_10001B9CC(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10001C820() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(sub_10001C030() - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(sub_100008508(&qword_100024250) - 8) + 80);
  unint64_t v11 = v8 + v9 + v10;
  uint64_t v12 = v1 + v5;
  uint64_t v13 = v1 + v8;
  uint64_t v14 = v1 + (v11 & ~v10);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v15;
  *uint64_t v15 = v2;
  v15[1] = sub_10001B5AC;
  return sub_10001236C(a1, v12, v13, v14);
}

uint64_t sub_10001BB78(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_10001BBC0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10000F614(a2, a3);
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
      sub_10000DFB8();
      goto LABEL_7;
    }
    sub_10000DB24(v15, a4 & 1);
    unint64_t v21 = sub_10000F614(a2, a3);
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
    uint64_t result = (_OWORD *)sub_10001CC80();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10000D7A8((uint64_t)v19);
    return sub_10000D798(a1, v19);
  }
LABEL_13:
  sub_10001BD14(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_10001BD14(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10000D798(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_10001BD80(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10001BDC0()
{
  return _convertNSErrorToError(_:)();
}

void sub_10001BDD0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10001BDE0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10001BDF0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10001BE00()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_10001BE10()
{
  return static AVPartialAsyncProperty<A>.naturalSize.getter();
}

uint64_t sub_10001BE20()
{
  return static AVPartialAsyncProperty<A>.nominalFrameRate.getter();
}

uint64_t sub_10001BE30()
{
  return static AVPartialAsyncProperty<A>.preferredTransform.getter();
}

uint64_t sub_10001BE40()
{
  return static AVPartialAsyncProperty<A>.segments.getter();
}

uint64_t sub_10001BE50()
{
  return static AVPartialAsyncProperty<A>.duration.getter();
}

uint64_t sub_10001BE60()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_10001BE70()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_10001BE80()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10001BE90()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_10001BEA0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10001BEB0()
{
  return static BlastDoorServer.disableRawDecoding()();
}

void sub_10001BEC0(Swift::OpaquePointer allowedImageFormats, Swift::Bool increasedRestrictions)
{
}

void sub_10001BED0(Swift::OpaquePointer codecs)
{
}

uint64_t sub_10001BEE0()
{
  return dispatch thunk of BlastDoorServer.resume(sandboxID:)();
}

uint64_t sub_10001BEF0()
{
  return static BlastDoorServer.service.getter();
}

uint64_t sub_10001BF00()
{
  return BlastDoorServer.register<A, B>(unpacker:for:)();
}

uint64_t sub_10001BF10()
{
  return BlastDoorServer.register<A, B>(unpacker:for:)();
}

uint64_t sub_10001BF20()
{
  return type metadata accessor for BlastDoorServer();
}

uint64_t sub_10001BF30()
{
  return LargeImage.init(image:metadata:)();
}

uint64_t sub_10001BF40()
{
  return LargeImage.Context.bufferSize.getter();
}

uint64_t sub_10001BF50()
{
  return LargeImage.Context.machPort.getter();
}

uint64_t sub_10001BF60()
{
  return LargeImage.Context.metadata.getter();
}

uint64_t sub_10001BF70()
{
  return type metadata accessor for LargeImage();
}

uint64_t sub_10001BF80()
{
  return PreviewImage.Constraints.isEmojiImage.getter();
}

uint64_t sub_10001BF90()
{
  return PreviewImage.Constraints.maxPixelDimension.getter();
}

uint64_t sub_10001BFA0()
{
  return PreviewImage.Constraints.index.getter();
}

uint64_t sub_10001BFB0()
{
  return PreviewImage.Constraints.maxCount.getter();
}

uint64_t sub_10001BFC0()
{
  return PreviewImage.init(image:frameCount:frameDuration:isScreenshot:stickerEffect:utTypeString:isMonoskiAsset:alignmentInset:)();
}

uint64_t sub_10001BFD0()
{
  return type metadata accessor for PreviewImage();
}

uint64_t sub_10001BFE0()
{
  return VideoPreview.VideoFormat.init(trackInfo:)();
}

uint64_t sub_10001BFF0()
{
  return type metadata accessor for VideoPreview.VideoFormat();
}

uint64_t sub_10001C000()
{
  return VideoPreview.AudioFormat.init(trackInfo:)();
}

uint64_t sub_10001C010()
{
  return type metadata accessor for VideoPreview.AudioFormat();
}

uint64_t sub_10001C020()
{
  return VideoPreview.Constraints.frameConstraints.getter();
}

uint64_t sub_10001C030()
{
  return type metadata accessor for VideoPreview.Constraints();
}

uint64_t sub_10001C040()
{
  return type metadata accessor for VideoPreview.FrameConstraints();
}

uint64_t sub_10001C050()
{
  return VideoPreview.MultiFrameConstraints.frameLimit.getter();
}

uint64_t sub_10001C060()
{
  return VideoPreview.MultiFrameConstraints.framesPerSync.getter();
}

uint64_t sub_10001C070()
{
  return VideoPreview.MultiFrameConstraints.uniformSampling.getter();
}

uint64_t sub_10001C080()
{
  return VideoPreview.MultiFrameConstraints.targetPixelWidth.getter();
}

uint64_t sub_10001C090()
{
  return VideoPreview.MultiFrameConstraints.targetPixelHeight.getter();
}

uint64_t sub_10001C0A0()
{
  return VideoPreview.MultiFrameConstraints.appliesPreferredTrackTransform.getter();
}

uint64_t sub_10001C0B0()
{
  return type metadata accessor for VideoPreview.MultiFrameConstraints();
}

uint64_t sub_10001C0C0()
{
  return VideoPreview.SingleFrameConstraints.maxPixelDimension.getter();
}

uint64_t sub_10001C0D0()
{
  return type metadata accessor for VideoPreview.SingleFrameConstraints();
}

uint64_t sub_10001C0E0()
{
  return VideoPreview.init(image:isAutoloop:frame:timestamp:trackCount:videoFormat:audioFormat:videoIsMonoskiAsset:)();
}

uint64_t sub_10001C0F0()
{
  return type metadata accessor for VideoPreview();
}

uint64_t sub_10001C100()
{
  return ImageProvider.withImageSource<A>(_:)();
}

uint64_t sub_10001C110()
{
  return MediaMetadata.videoComplementMediaGroupId.setter();
}

uint64_t sub_10001C120()
{
  return MediaMetadata.IPTCCredit.setter();
}

uint64_t sub_10001C130()
{
  return MediaMetadata.avDuration.setter();
}

uint64_t sub_10001C140()
{
  return MediaMetadata.captureMode.setter();
}

uint64_t sub_10001C150()
{
  return MediaMetadata.focalLength.setter();
}

uint64_t sub_10001C160()
{
  return MediaMetadata.gpsSpeedRef.setter();
}

uint64_t sub_10001C170()
{
  return MediaMetadata.isAlchemist.setter();
}

uint64_t sub_10001C180()
{
  return MediaMetadata.lightSource.setter();
}

uint64_t sub_10001C190()
{
  return MediaMetadata.profileName.setter();
}

uint64_t sub_10001C1A0()
{
  return MediaMetadata.userComment.setter();
}

uint64_t sub_10001C1B0()
{
  return MediaMetadata.gifDelayTime.setter();
}

uint64_t sub_10001C1C0()
{
  return MediaMetadata.gpsTimestamp.setter();
}

uint64_t sub_10001C1D0()
{
  return MediaMetadata.isPhotoBooth.setter();
}

uint64_t sub_10001C1E0()
{
  return MediaMetadata.meteringMode.setter();
}

uint64_t sub_10001C1F0()
{
  return MediaMetadata.shutterSpeed.setter();
}

uint64_t sub_10001C200()
{
  return MediaMetadata.whiteBalance.setter();
}

uint64_t sub_10001C210()
{
  return MediaMetadata.apertureValue.setter();
}

uint64_t sub_10001C220()
{
  return MediaMetadata.hasHDRGainMap.setter();
}

uint64_t sub_10001C230()
{
  return MediaMetadata.hasISOGainMap.setter();
}

uint64_t sub_10001C240()
{
  return MediaMetadata.hasSmartStyle.setter();
}

uint64_t sub_10001C250()
{
  return MediaMetadata.rawPixelWidth.setter();
}

uint64_t sub_10001C260()
{
  return MediaMetadata.exifFlashFired.setter();
}

uint64_t sub_10001C270()
{
  return MediaMetadata.imageDirection.setter();
}

uint64_t sub_10001C280()
{
  return MediaMetadata.isVideoMontage.setter();
}

uint64_t sub_10001C290()
{
  return MediaMetadata.isoRatingValue.setter();
}

uint64_t sub_10001C2A0()
{
  return MediaMetadata.rawOrientation.setter();
}

uint64_t sub_10001C2B0()
{
  return MediaMetadata.rawPixelHeight.setter();
}

uint64_t sub_10001C2C0()
{
  return MediaMetadata.smartStyleCast.setter();
}

uint64_t sub_10001C2D0()
{
  return MediaMetadata.timezoneOffset.setter();
}

uint64_t sub_10001C2E0()
{
  return MediaMetadata.hasSpatialAudio.setter();
}

uint64_t sub_10001C2F0()
{
  return MediaMetadata.processingFlags.setter();
}

uint64_t sub_10001C300()
{
  return MediaMetadata.isCustomRendered.setter();
}

uint64_t sub_10001C310()
{
  return MediaMetadata.originalFileName.setter();
}

uint64_t sub_10001C320()
{
  return MediaMetadata.codecFourCharCode.setter();
}

uint64_t sub_10001C330()
{
  return MediaMetadata.exposureBiasValue.setter();
}

uint64_t sub_10001C340()
{
  return MediaMetadata.imageDirectionRef.setter();
}

uint64_t sub_10001C350()
{
  return MediaMetadata.videoDynamicRange.setter();
}

uint64_t sub_10001C360()
{
  return MediaMetadata.focalLenIn35mmFilm.setter();
}

uint64_t sub_10001C370()
{
  return MediaMetadata.smartStyleToneBias.setter();
}

uint64_t sub_10001C380()
{
  return MediaMetadata.subsecTimeOriginal.setter();
}

uint64_t sub_10001C390()
{
  return MediaMetadata.videoDurationValue.setter();
}

uint64_t sub_10001C3A0()
{
  return MediaMetadata.isFrontFacingCamera.setter();
}

uint64_t sub_10001C3B0()
{
  return MediaMetadata.semanticStylePreset.setter();
}

uint64_t sub_10001C3C0()
{
  return MediaMetadata.smartStyleColorBias.setter();
}

uint64_t sub_10001C3D0()
{
  return MediaMetadata.smartStyleIntensity.setter();
}

uint64_t sub_10001C3E0()
{
  return MediaMetadata.variationIdentifier.setter();
}

uint64_t sub_10001C3F0()
{
  return MediaMetadata.AppleMakerNoteCamera.init(defaultingRawValue:defaultValue:)();
}

uint64_t sub_10001C400()
{
  return type metadata accessor for MediaMetadata.AppleMakerNoteCamera();
}

uint64_t sub_10001C410()
{
  return MediaMetadata.cameraUsedForCapture.setter();
}

uint64_t sub_10001C420()
{
  return MediaMetadata.captureModeTimelapse.setter();
}

uint64_t sub_10001C430()
{
  return MediaMetadata.gpsHPositioningError.setter();
}

uint64_t sub_10001C440()
{
  return MediaMetadata.ciffWhiteBalanceIndex.setter();
}

uint64_t sub_10001C450()
{
  return MediaMetadata.generativeAIImageType.setter();
}

uint64_t sub_10001C460()
{
  return MediaMetadata.uniformTypeIdentifier.setter();
}

uint64_t sub_10001C470()
{
  return MediaMetadata.isThreeImageStereoHEIC.setter();
}

uint64_t sub_10001C480()
{
  return MediaMetadata.semanticStyleSceneBias.setter();
}

uint64_t sub_10001C490()
{
  return MediaMetadata.smartStyleIsReversible.setter();
}

uint64_t sub_10001C4A0()
{
  return MediaMetadata.stillImageCaptureFlags.setter();
}

uint64_t sub_10001C4B0()
{
  return MediaMetadata.videoDurationTimescale.setter();
}

uint64_t sub_10001C4C0()
{
  return MediaMetadata.semanticStyleWarmthBias.setter();
}

uint64_t sub_10001C4D0()
{
  return MediaMetadata.LargeImageContextualInfo.init(pixelWidth:pixelHeight:bufferByteSize:)();
}

uint64_t sub_10001C4E0()
{
  return type metadata accessor for MediaMetadata.LargeImageContextualInfo();
}

uint64_t sub_10001C4F0()
{
  return MediaMetadata.exifAuxFlashCompensation.setter();
}

uint64_t sub_10001C500()
{
  return MediaMetadata.init(largeImageContextualInfo:)();
}

uint64_t sub_10001C510()
{
  return MediaMetadata.smartStyleVideoCastValue.setter();
}

uint64_t sub_10001C520()
{
  return MediaMetadata.originatingAssetIdentifier.setter();
}

uint64_t sub_10001C530()
{
  return MediaMetadata.smartStyleRenderingVersion.setter();
}

uint64_t sub_10001C540()
{
  return MediaMetadata.videoContainsCinematicData.setter();
}

uint64_t sub_10001C550()
{
  return MediaMetadata.spatialOverCaptureIdentifier.setter();
}

uint64_t sub_10001C560()
{
  return MediaMetadata.videoComplementDurationValue.setter();
}

uint64_t sub_10001C570()
{
  return MediaMetadata.semanticStyleRenderingVersion.setter();
}

uint64_t sub_10001C580()
{
  return MediaMetadata.videoComplementDurationTimescale.setter();
}

uint64_t sub_10001C590()
{
  return MediaMetadata.videoComplementImageDisplayValue.setter();
}

uint64_t sub_10001C5A0()
{
  return MediaMetadata.videoComplementImageDisplayTimescale.setter();
}

uint64_t sub_10001C5B0()
{
  return MediaMetadata.make.setter();
}

uint64_t sub_10001C5C0()
{
  return MediaMetadata.avFPS.setter();
}

uint64_t sub_10001C5D0()
{
  return MediaMetadata.flash.setter();
}

uint64_t sub_10001C5E0()
{
  return MediaMetadata.isHDR.setter();
}

uint64_t sub_10001C5F0()
{
  return MediaMetadata.model.setter();
}

uint64_t sub_10001C600()
{
  return MediaMetadata.Context.requiresLargeImageInfo.getter();
}

uint64_t sub_10001C610()
{
  return MediaMetadata.hdrGain.setter();
}

uint64_t sub_10001C620()
{
  return MediaMetadata.altitude.setter();
}

uint64_t sub_10001C630()
{
  return MediaMetadata.fileSize.setter();
}

uint64_t sub_10001C640()
{
  return MediaMetadata.gpsSpeed.setter();
}

uint64_t sub_10001C650()
{
  return MediaMetadata.isProRes.setter();
}

uint64_t sub_10001C660()
{
  return MediaMetadata.latitude.setter();
}

uint64_t sub_10001C670()
{
  return MediaMetadata.lensMake.setter();
}

uint64_t sub_10001C680()
{
  return MediaMetadata.burstUuid.setter();
}

uint64_t sub_10001C690()
{
  return MediaMetadata.imageDate.setter();
}

uint64_t sub_10001C6A0()
{
  return MediaMetadata.lensModel.setter();
}

uint64_t sub_10001C6B0()
{
  return MediaMetadata.longitude.setter();
}

uint64_t sub_10001C6C0()
{
  return type metadata accessor for MediaMetadata();
}

uint64_t sub_10001C6D0()
{
  return StickerEffect.init(defaultingRawValue:)();
}

uint64_t sub_10001C6E0()
{
  return type metadata accessor for StickerEffect();
}

uint64_t sub_10001C6F0()
{
  return MachImageError.ErrorKind.rawValue.getter();
}

uint64_t sub_10001C700()
{
  return type metadata accessor for MachImageError.ErrorKind();
}

uint64_t sub_10001C710()
{
  return MachImageError.Description.rawValue.getter();
}

uint64_t sub_10001C720()
{
  return type metadata accessor for MachImageError.Description();
}

uint64_t sub_10001C730()
{
  return MachImageError.description.getter();
}

uint64_t sub_10001C740()
{
  return MachImageError.kind.getter();
}

uint64_t sub_10001C750()
{
  return MachImageError.extraInfo.getter();
}

uint64_t sub_10001C760()
{
  return type metadata accessor for MachImageError();
}

uint64_t sub_10001C770()
{
  return ImageProperties.frameCount.getter();
}

uint64_t sub_10001C780()
{
  return ImageProperties.isScreenshot.getter();
}

uint64_t sub_10001C790()
{
  return ImageProperties.utTypeString.getter();
}

uint64_t sub_10001C7A0()
{
  return ImageProperties.stickerEffect.getter();
}

uint64_t sub_10001C7B0()
{
  return ImageProperties.isMonoskiAsset.getter();
}

uint64_t sub_10001C7C0()
{
  return type metadata accessor for ImageProperties();
}

uint64_t sub_10001C7D0()
{
  return SessionSchemaResult.init(_:lastResult:)();
}

uint64_t sub_10001C7E0()
{
  return >> prefix<A>(_:)();
}

uint64_t sub_10001C7F0()
{
  return File.withResource<A>(_:)();
}

uint64_t sub_10001C810()
{
  return File.path.getter();
}

uint64_t sub_10001C820()
{
  return type metadata accessor for File();
}

uint64_t sub_10001C830()
{
  return Path.absolutePath.getter();
}

uint64_t sub_10001C840()
{
  return Path.fileURL.getter();
}

uint64_t sub_10001C850()
{
  return type metadata accessor for Path();
}

uint64_t sub_10001C860()
{
  return Image.emojiStrikeImage(atIndex:maxPixelDimension:alignmentInset:)();
}

uint64_t sub_10001C870()
{
  return Image.thumbnailImage(maxPixelDimension:imageIndex:)();
}

uint64_t sub_10001C880()
{
  return type metadata accessor for Image.Encoding();
}

uint64_t sub_10001C890()
{
  return Image.init(provider:maxPixelDimension:enforcedEncoding:)();
}

uint64_t sub_10001C8A0()
{
  return Image.provider.getter();
}

uint64_t sub_10001C8B0()
{
  return type metadata accessor for Image();
}

uint64_t sub_10001C8C0()
{
  return static Sandbox.enableHubbleStateFlag()();
}

uint64_t sub_10001C8D0()
{
  return type metadata accessor for MachPort();
}

uint64_t sub_10001C8E0()
{
  return Explosion.init(domain:errorType:keyPath:)();
}

uint64_t sub_10001C8F0()
{
  return type metadata accessor for Explosion();
}

uint64_t sub_10001C900()
{
  return dispatch thunk of MachImage.initialize(from:)();
}

uint64_t sub_10001C910()
{
  return static MachImage.expectedByteSize(width:height:)();
}

uint64_t sub_10001C920()
{
  return MachImage.init(machPort:bufferSize:)();
}

uint64_t sub_10001C930()
{
  return type metadata accessor for MachImage();
}

uint64_t sub_10001C940()
{
  return type metadata accessor for SandboxID();
}

NSDictionary sub_10001C950()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10001C960()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10001C970()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001C980()
{
  return Dictionary.description.getter();
}

NSString sub_10001C990()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001C9A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001C9B0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10001C9C0()
{
  return String.hash(into:)();
}

void sub_10001C9D0(Swift::String a1)
{
}

Swift::Int sub_10001C9E0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001C9F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001CA00()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10001CA10()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10001CA20()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10001CA30()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t sub_10001CA40()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t sub_10001CA50()
{
  return AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
}

uint64_t sub_10001CA60()
{
  return Double.description.getter();
}

uint64_t sub_10001CA70()
{
  return Int.init(truncating:)();
}

uint64_t sub_10001CA80()
{
  return CMTimeRange.end.getter();
}

uint64_t sub_10001CA90()
{
  return type metadata accessor for AVAssetTrack.Info();
}

uint64_t sub_10001CAB0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10001CAC0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001CAD0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001CAE0()
{
  return CGImageSourceRef.imageProperties()();
}

uint64_t sub_10001CAF0()
{
  return CMSampleBufferRef.imageBuffer.getter();
}

uint64_t sub_10001CB00()
{
  return CMSampleBufferRef.presentationTimeStamp.getter();
}

uint64_t sub_10001CB20()
{
  return static CMTime.> infix(_:_:)();
}

unint64_t sub_10001CB30(Swift::Int64 value, Swift::Int32 timescale)
{
  return (unint64_t)CMTime.init(value:timescale:)(value, timescale);
}

uint64_t sub_10001CB40()
{
  return CMTime.seconds.getter();
}

uint64_t sub_10001CB60()
{
  return static OS_os_log.largeImageUnpacker.getter();
}

uint64_t sub_10001CB70()
{
  return static OS_os_log.videoPreviewUnpacker.getter();
}

uint64_t sub_10001CB80()
{
  return static OS_os_log.mediaMetadataUnpacker.getter();
}

uint64_t sub_10001CB90()
{
  return static OS_os_log.image.getter();
}

uint64_t sub_10001CBA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001CBB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_10001CBC0(Swift::Int a1)
{
}

uint64_t sub_10001CBD0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001CBE0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001CBF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001CC00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001CC10()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001CC20()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10001CC30()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001CC40()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10001CC50()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10001CC60()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10001CC70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001CC80()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001CC90()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10001CCA0()
{
  return Hasher._finalize()();
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetNumSamples(sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return _CMTimeMapTimeFromRangeToRange(retstr, t, fromRange, toRange);
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return __CFPrefsSetDirectModeEnabled();
}

uint64_t _CFPrefsSetReadOnly()
{
  return __CFPrefsSetReadOnly();
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

uint64_t register_for_dlsym_callbacks()
{
  return _register_for_dlsym_callbacks();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}