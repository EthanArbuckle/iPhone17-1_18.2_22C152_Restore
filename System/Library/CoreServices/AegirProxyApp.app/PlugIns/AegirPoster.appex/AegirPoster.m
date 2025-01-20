void type metadata accessor for NUNIAstronomyVista(uint64_t a1)
{
  sub_100003B9C(a1, &qword_100044310);
}

void type metadata accessor for CLAuthorizationStatus(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for AegirSnapshotIdentifierProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100002CFC(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100002D08(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002D28(uint64_t result, int a2, int a3)
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

void type metadata accessor for NUNIAegirStyleDefinition(uint64_t a1)
{
}

id sub_100002D68(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_100031B18();
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v44 - v11;
  uint64_t v50 = a1;
  uint64_t v51 = a2;
  *(void *)&v49[0] = 44;
  v49[1] = -1.7573882e159;
  sub_1000039AC();
  v13 = (void *)sub_100031FF8();
  v14 = v13;
  if (v13[2] == 2)
  {
    uint64_t v44 = v4;
    uint64_t v45 = a1;
    uint64_t v46 = v7;
    uint64_t v16 = v13[4];
    uint64_t v15 = v13[5];
    v49[0] = 0.0;
    uint64_t v17 = __chkstk_darwin(v13);
    *(&v44 - 2) = (uint64_t)v49;
    if ((v15 & 0x1000000000000000) != 0 || !(v15 & 0x2000000000000000 | v16 & 0x1000000000000000))
    {
      swift_bridgeObjectRetain();
      sub_100032058();
      swift_bridgeObjectRelease();
      if ((v48 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else
    {
      __chkstk_darwin(v17);
      *(&v44 - 2) = (uint64_t)sub_100003A00;
      *(&v44 - 1) = (uint64_t)(&v44 - 4);
      if ((v15 & 0x2000000000000000) != 0)
      {
        uint64_t v50 = v16;
        uint64_t v51 = v15 & 0xFFFFFFFFFFFFFFLL;
        if (v16 > 0x20u || ((1 << v16) & 0x100003E01) == 0)
        {
          swift_bridgeObjectRetain();
          v39 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
          if (v39)
          {
            int v40 = *v39;
            swift_bridgeObjectRelease();
            if (v40) {
              goto LABEL_25;
            }
            goto LABEL_8;
          }
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        goto LABEL_25;
      }
      if ((v16 & 0x1000000000000000) != 0)
      {
        uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v19 = v16 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v18 = sub_100032098();
        uint64_t v19 = v43;
      }
      swift_bridgeObjectRetain();
      char v20 = sub_10000394C(v18, v19, (void (*)(uint64_t *__return_ptr))sub_100003A88);
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        goto LABEL_25;
      }
    }
LABEL_8:
    if (v14[2] < 2uLL)
    {
      __break(1u);
      goto LABEL_46;
    }
    double v3 = v49[0];
    uint64_t v22 = v14[6];
    uint64_t v21 = v14[7];
    swift_bridgeObjectRetain();
    uint64_t v23 = swift_bridgeObjectRelease();
    v49[0] = 0.0;
    uint64_t v24 = __chkstk_darwin(v23);
    *(&v44 - 2) = (uint64_t)v49;
    if ((v21 & 0x1000000000000000) != 0 || !(v21 & 0x2000000000000000 | v22 & 0x1000000000000000))
    {
      sub_100032058();
      swift_bridgeObjectRelease();
      if (v48) {
        goto LABEL_15;
      }
      goto LABEL_26;
    }
    __chkstk_darwin(v24);
    *(&v44 - 2) = (uint64_t)sub_100003A00;
    *(&v44 - 1) = v25;
    if ((v21 & 0x2000000000000000) == 0)
    {
      if ((v22 & 0x1000000000000000) != 0)
      {
        uint64_t v26 = (v21 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v27 = v22 & 0xFFFFFFFFFFFFLL;
        goto LABEL_14;
      }
LABEL_46:
      uint64_t v26 = sub_100032098();
LABEL_14:
      char v28 = sub_10000394C(v26, v27, (void (*)(uint64_t *__return_ptr))sub_100003A88);
      swift_bridgeObjectRelease();
      if (v28)
      {
LABEL_15:
        swift_bridgeObjectRelease();
        return [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithLatitude:v3 longitude:v49[0]];
      }
      goto LABEL_26;
    }
    uint64_t v50 = v22;
    uint64_t v51 = v21 & 0xFFFFFFFFFFFFFFLL;
    if (v22 > 0x20u || ((1 << v22) & 0x100003E01) == 0)
    {
      v41 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
      if (v41)
      {
        int v42 = *v41;
        swift_bridgeObjectRelease();
        if (!v42) {
          goto LABEL_15;
        }
        goto LABEL_26;
      }
    }
LABEL_25:
    swift_bridgeObjectRelease();
LABEL_26:
    sub_100031AA8();
    swift_bridgeObjectRetain();
    v36 = sub_100031AF8();
    os_log_type_t v37 = sub_100031F08();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)v38 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&v49[0] = sub_10001B510(v45, a2, &v50);
      sub_100031FD8();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Failed to load location from string. %s ", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v46);
    return 0;
  }
  swift_bridgeObjectRelease();
  sub_100031AA8();
  swift_bridgeObjectRetain();
  v30 = sub_100031AF8();
  os_log_type_t v31 = sub_100031F08();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v46 = v7;
    uint64_t v50 = v33;
    uint64_t v34 = v47;
    *(_DWORD *)v32 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v49[0] = sub_10001B510(a1, a2, &v50);
    sub_100031FD8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to load location from string. %s ", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v46);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v7);
  }
  return 0;
}

void *sub_1000034F0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100003500(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_10000350C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003520(uint64_t a1, uint64_t a2)
{
  return sub_1000037B4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003538(uint64_t a1, id *a2)
{
  uint64_t result = sub_100031C38();
  *a2 = 0;
  return result;
}

uint64_t sub_1000035B0(uint64_t a1, id *a2)
{
  char v3 = sub_100031C48();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100003630@<X0>(void *a1@<X8>)
{
  sub_100031C58();
  NSString v2 = sub_100031C28();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

_DWORD *sub_100003674@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_100003684(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100003690@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100031C28();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000036D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100031C58();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003704(uint64_t a1)
{
  uint64_t v2 = sub_100003C4C(&qword_100044370);
  uint64_t v3 = sub_100003C4C(&qword_100044378);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000379C(uint64_t a1, uint64_t a2)
{
  return sub_1000037B4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000037B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100031C58();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000037F8()
{
  sub_100031C58();
  sub_100031C98();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000384C()
{
  sub_100031C58();
  sub_1000321D8();
  sub_100031C98();
  Swift::Int v0 = sub_1000321F8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000038C0()
{
  uint64_t v0 = sub_100031C58();
  uint64_t v2 = v1;
  if (v0 == sub_100031C58() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000321A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10000394C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

unint64_t sub_1000039AC()
{
  unint64_t result = qword_100044328;
  if (!qword_100044328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044328);
  }
  return result;
}

unsigned char *sub_100003A00@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_100003A18(a1, a2);
}

unsigned char *sub_100003A18@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (unint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_100003A88@<X0>(unsigned char *a1@<X8>)
{
  return sub_100003AA0(a1);
}

void *sub_100003AA0@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

void type metadata accessor for PRTimeFontIdentifier(uint64_t a1)
{
}

__n128 sub_100003B20(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003B2C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003B4C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100003B9C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100003BE4()
{
  return sub_100003C4C(&qword_100044358);
}

uint64_t sub_100003C18()
{
  return sub_100003C4C(&qword_100044360);
}

uint64_t sub_100003C4C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PRTimeFontIdentifier(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100003C90()
{
  return sub_100003C4C(&qword_100044368);
}

uint64_t sub_100003CE4()
{
  sub_100031728();
  sub_1000048F0(&qword_100044380);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100033030;
  if (qword_1000441D8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)static PreferencePane.aegirGeneralPreferencePane;
  *(void *)(v0 + 32) = static PreferencePane.aegirGeneralPreferencePane;
  id v2 = v1;
  *(void *)(v0 + 40) = sub_100031698();
  *(void *)(v0 + 48) = sub_1000316A8();
  sub_100031D78();
  uint64_t result = sub_100031708();
  static PreferencePane.aegirPreferencePane = result;
  return result;
}

uint64_t *PreferencePane.aegirGeneralPreferencePane.unsafeMutableAddressor()
{
  if (qword_1000441D8 != -1) {
    swift_once();
  }
  return &static PreferencePane.aegirGeneralPreferencePane;
}

uint64_t *PreferencePane.aegirPreferencePane.unsafeMutableAddressor()
{
  if (qword_1000441D0 != -1) {
    swift_once();
  }
  return &static PreferencePane.aegirPreferencePane;
}

id static PreferencePane.aegirPreferencePane.getter()
{
  return sub_100004008(&qword_1000441D0, (void **)&static PreferencePane.aegirPreferencePane);
}

id sub_100003E8C(id a1, SEL a2)
{
  return sub_100004078((uint64_t)a1, (uint64_t)a2, &qword_1000441D0, (void **)&static PreferencePane.aegirPreferencePane);
}

uint64_t sub_100003EB0()
{
  id v0 = [self standardUserDefaults];
  sub_10000CBB4((uint64_t)&off_10003D270);
  sub_1000048F0(&qword_100044388);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100033040;
  *(void *)(inited + 32) = 0x6E6F6974704FLL;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = &off_10003D2D8;
  *(void *)(inited + 56) = 1886351939;
  *(void *)(inited + 64) = 0xE400000000000000;
  *(void *)(inited + 72) = &off_10003D398;
  *(void *)(inited + 80) = 1701011782;
  *(void *)(inited + 88) = 0xE400000000000000;
  *(void *)(inited + 96) = &off_10003D3D8;
  sub_10000CCC8(inited);
  sub_10000CDE4((uint64_t)&off_10003D428);
  id v2 = objc_allocWithZone((Class)sub_100031728());
  uint64_t result = sub_1000316F8();
  static PreferencePane.aegirGeneralPreferencePane = result;
  return result;
}

id static PreferencePane.aegirGeneralPreferencePane.getter()
{
  return sub_100004008(&qword_1000441D8, (void **)&static PreferencePane.aegirGeneralPreferencePane);
}

id sub_100004008(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  char v3 = *a2;

  return v3;
}

id sub_100004054(id a1, SEL a2)
{
  return sub_100004078((uint64_t)a1, (uint64_t)a2, &qword_1000441D8, (void **)&static PreferencePane.aegirGeneralPreferencePane);
}

id sub_100004078(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;

  return v5;
}

BOOL sub_1000040C8(id a1, SEL a2)
{
  id v2 = a1;
  char v3 = sub_1000316C8();

  return v3 & 1;
}

uint64_t PreferencePane.autorotate.getter()
{
  return sub_1000316C8() & 1;
}

unint64_t sub_100004158(id a1, SEL a2)
{
  id v2 = a1;
  unint64_t v3 = PreferencePane.vista.getter();

  return v3;
}

uint64_t PreferencePane.vista.getter()
{
  uint64_t v0 = sub_1000316B8();
  if (v1) {
    uint64_t v2 = v0;
  }
  else {
    uint64_t v2 = 0;
  }
  if (v1) {
    unint64_t v3 = v1;
  }
  else {
    unint64_t v3 = 0xE000000000000000;
  }
  BOOL v4 = v2 == 0x6874726145 && v3 == 0xE500000000000000;
  if (v4 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v2 == 1852796749 && v3 == 0xE400000000000000 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (v2 == 0x79532072616C6F53 && v3 == 0xEC0000006D657473 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (v2 == 0x7972756372654DLL && v3 == 0xE700000000000000 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (v2 == 0x73756E6556 && v3 == 0xE500000000000000 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (v2 == 1936875853 && v3 == 0xE400000000000000 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (v2 == 0x7265746970754ALL && v3 == 0xE700000000000000 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (v2 == 0x6E7275746153 && v3 == 0xE600000000000000 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (v2 == 0x73756E617255 && v3 == 0xE600000000000000 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (v2 == 0x656E757470654ELL && v3 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_1000321A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 0;
    }
  }
}

uint64_t PreferencePane.crop.getter()
{
  uint64_t v0 = sub_1000316B8();
  if (v1) {
    uint64_t v2 = v0;
  }
  else {
    uint64_t v2 = 0;
  }
  if (v1) {
    unint64_t v3 = v1;
  }
  else {
    unint64_t v3 = 0xE000000000000000;
  }
  BOOL v4 = v2 == 1819047238 && v3 == 0xE400000000000000;
  if (v4 || (sub_1000321A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 0;
  }
  else if (v2 == 0x6C6961746544 && v3 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v5 = 1;
  }
  else
  {
    char v5 = sub_1000321A8();
    swift_bridgeObjectRelease();
  }
  return v5 & 1;
}

uint64_t PreferencePane.interactionEnabled.getter()
{
  return sub_1000316C8() & 1;
}

uint64_t PreferencePane.idealizedDateEnabled.getter()
{
  return sub_1000316C8() & 1;
}

uint64_t PreferencePane.pulseEnabled.getter()
{
  return sub_1000316C8() & 1;
}

uint64_t PreferencePane.isCalliopeRenderingStyle.getter()
{
  uint64_t v0 = sub_1000316B8();
  if (v1)
  {
    if (v0 == 0x65706F696C6C6143 && v1 == 0xE800000000000000) {
      char v2 = 1;
    }
    else {
      char v2 = sub_1000321A8();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

uint64_t PreferencePane.isAegirRenderingStyle.getter()
{
  uint64_t v0 = sub_1000316B8();
  if (v1)
  {
    if (v0 == 0x7269676541 && v1 == 0xE500000000000000) {
      char v2 = 1;
    }
    else {
      char v2 = sub_1000321A8();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

uint64_t PreferencePane.isClassicRenderingStyle.getter()
{
  uint64_t v0 = sub_1000316B8();
  if (v1)
  {
    if (v0 == 0x63697373616C43 && v1 == 0xE700000000000000) {
      char v2 = 1;
    }
    else {
      char v2 = sub_1000321A8();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

uint64_t sub_1000048F0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

double sub_100004934()
{
  sub_1000048F0(&qword_100044390);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100033060;
  sub_100004B54();
  id v1 = sub_10001E440(10589063);
  *(void *)(v0 + 32) = 4;
  *(unsigned char *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0;
  *(void *)(v0 + 56) = v1;
  *(_OWORD *)(v0 + 64) = 0u;
  id v2 = sub_10001E440(11435597);
  *(void *)(v0 + 80) = 5;
  *(unsigned char *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 0;
  *(void *)(v0 + 104) = v2;
  *(_OWORD *)(v0 + 112) = 0u;
  id v3 = sub_10001E440(7442351);
  *(void *)(v0 + 128) = 0;
  *(unsigned char *)(v0 + 136) = 0;
  *(void *)(v0 + 144) = 0;
  *(void *)(v0 + 152) = v3;
  *(_OWORD *)(v0 + 160) = 0u;
  id v4 = sub_10001E440(7442351);
  *(void *)(v0 + 176) = 0;
  *(unsigned char *)(v0 + 184) = 1;
  *(void *)(v0 + 192) = 0;
  *(void *)(v0 + 200) = v4;
  *(_OWORD *)(v0 + 208) = 0u;
  id v5 = sub_10001E440(9211020);
  *(void *)(v0 + 224) = 1;
  *(unsigned char *)(v0 + 232) = 0;
  *(void *)(v0 + 240) = 0;
  *(void *)(v0 + 248) = v5;
  *(_OWORD *)(v0 + 256) = 0u;
  id v6 = sub_10001E440(9211020);
  *(void *)(v0 + 272) = 1;
  *(unsigned char *)(v0 + 280) = 1;
  *(void *)(v0 + 288) = 0;
  *(void *)(v0 + 296) = v6;
  *(_OWORD *)(v0 + 304) = 0u;
  id v7 = sub_10001E440(14452348);
  *(void *)(v0 + 320) = 6;
  *(unsigned char *)(v0 + 328) = 0;
  *(void *)(v0 + 336) = 0;
  *(void *)(v0 + 344) = v7;
  *(_OWORD *)(v0 + 352) = 0u;
  id v8 = sub_10001E440(12544846);
  *(void *)(v0 + 368) = 7;
  *(unsigned char *)(v0 + 376) = 0;
  *(void *)(v0 + 384) = 0;
  *(void *)(v0 + 392) = v8;
  *(_OWORD *)(v0 + 400) = 0u;
  id v9 = sub_10001E440(12426329);
  *(void *)(v0 + 416) = 3;
  *(unsigned char *)(v0 + 424) = 0;
  *(void *)(v0 + 432) = 0;
  *(void *)(v0 + 440) = v9;
  *(_OWORD *)(v0 + 448) = 0u;
  id v10 = sub_10001E440(8308450);
  *(void *)(v0 + 464) = 8;
  *(unsigned char *)(v0 + 472) = 0;
  *(void *)(v0 + 480) = 0;
  *(void *)(v0 + 488) = v10;
  *(_OWORD *)(v0 + 496) = 0u;
  id v11 = sub_10001E440(6920424);
  *(void *)(v0 + 512) = 9;
  *(unsigned char *)(v0 + 520) = 0;
  *(void *)(v0 + 528) = 0;
  *(void *)(v0 + 536) = v11;
  *(_OWORD *)(v0 + 544) = 0u;
  id v12 = [self vibrantMaterialColor];
  *(void *)(v0 + 560) = 2;
  *(unsigned char *)(v0 + 568) = 0;
  *(void *)(v0 + 576) = 0;
  *(void *)(v0 + 584) = v12;
  double result = 0.0;
  *(_OWORD *)(v0 + 592) = 0u;
  qword_100046C80 = v0;
  return result;
}

unint64_t sub_100004B54()
{
  unint64_t result = qword_100044398;
  if (!qword_100044398)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100044398);
  }
  return result;
}

uint64_t sub_100004B94(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        id v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        id v6 = (unsigned __int8 *)sub_100032098();
      }
      uint64_t v7 = (uint64_t)sub_100004EE4(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              id v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_100004DFC(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

unsigned __int8 *sub_100004DE4(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_100004EE4(a1, a2, a3);
}

unsigned __int8 *sub_100004DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100031D18();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_100005160();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_100032098();
  }
LABEL_7:
  id v11 = sub_100004EE4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_100004EE4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100005160()
{
  unint64_t v0 = sub_100031D28();
  uint64_t v4 = sub_1000051E0(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1000051E0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_100005338(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10001B9B0(v9, 0),
          unint64_t v12 = sub_100005438((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_100031C88();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_100031C88();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_100032098();
LABEL_4:

  return sub_100031C88();
}

uint64_t sub_100005338(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_10001BA18(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10001BA18(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_100005438(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = sub_10001BA18(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_100031CF8();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_100032098();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    unint64_t result = sub_10001BA18(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_100031CC8();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10000564C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    if (a3) {
      uint64_t v5 = 0x6C6961746544;
    }
    else {
      uint64_t v5 = 1819047238;
    }
    if (a3) {
      unint64_t v6 = 0xE600000000000000;
    }
    else {
      unint64_t v6 = 0xE400000000000000;
    }
    uint64_t v7 = a1 + 40;
    uint64_t v20 = a2;
    while (1)
    {
      if (*(void *)(v7 - 8) == a2)
      {
        uint64_t v9 = *(void **)(v7 + 8);
        uint64_t v8 = *(void **)(v7 + 16);
        uint64_t v10 = *(void *)(v7 + 24);
        if (*(unsigned char *)v7) {
          uint64_t v11 = 0x6C6961746544;
        }
        else {
          uint64_t v11 = 1819047238;
        }
        if (*(unsigned char *)v7) {
          unint64_t v12 = 0xE600000000000000;
        }
        else {
          unint64_t v12 = 0xE400000000000000;
        }
        if (v11 == v5 && v12 == v6)
        {
          id v16 = v8;
          id v17 = v9;
          sub_10000633C(v10);

          swift_bridgeObjectRelease_n();
          sub_10000640C(v10);
          return v4;
        }
        char v21 = sub_1000321A8();
        id v14 = v8;
        id v15 = v9;
        sub_10000633C(v10);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10000640C(v10);
        uint64_t v3 = v19;
        a2 = v20;
        if (v21) {
          return v4;
        }
      }
      ++v4;
      v7 += 48;
      if (v3 == v4) {
        return 0;
      }
    }
  }
  return 0;
}

uint64_t sub_1000057F8(uint64_t a1)
{
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  uint64_t v43 = v3;
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = &v37[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v37[-v7];
  if (qword_1000441E0 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100046C80;
  uint64_t v10 = *(void **)(a1 + 16);
  sub_10000634C(a1 + 24, (uint64_t)&v46);
  uint64_t v11 = *(void *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 8);
  uint64_t v13 = *(void *)a1;
  v41 = v10;
  id v14 = v10;
  swift_bridgeObjectRetain();
  sub_1000063B4(&v46);
  sub_10000633C(v11);
  uint64_t v15 = sub_10000564C(v9, v13, v12);
  LOBYTE(v10) = v16;

  sub_1000063E0(&v46);
  sub_10000640C(v11);
  swift_bridgeObjectRelease();
  if (v10)
  {
    sub_100031AB8();
    id v27 = v14;
    sub_1000063B4(&v46);
    sub_10000633C(v11);
    id v28 = v27;
    sub_1000063B4(&v46);
    sub_10000633C(v11);
    v29 = sub_100031AF8();
    os_log_type_t v30 = sub_100031F08();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      os_log_t v39 = v29;
      v32 = (uint8_t *)v31;
      uint64_t v40 = swift_slowAlloc();
      v45[0] = v40;
      *(_DWORD *)v32 = 136315138;
      uint64_t v33 = sub_1000089EC(v13, v12, v41);
      uint64_t v44 = sub_10001B510(v33, v34, v45);
      sub_100031FD8();

      swift_bridgeObjectRelease();
      sub_1000063E0(&v46);
      sub_10000640C(v11);

      sub_1000063E0(&v46);
      sub_10000640C(v11);
      os_log_t v35 = v39;
      _os_log_impl((void *)&_mh_execute_header, v39, v30, "Could not figure out look identifier for configuration: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_1000063E0(&v46);
      sub_10000640C(v11);

      sub_1000063E0(&v46);
      sub_10000640C(v11);
    }
    (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v6, v42);
    v45[0] = 0;
  }
  else
  {
    sub_100031AB8();
    id v17 = v14;
    sub_1000063B4(&v46);
    sub_10000633C(v11);
    id v18 = v17;
    sub_1000063B4(&v46);
    sub_10000633C(v11);
    uint64_t v19 = sub_100031AF8();
    os_log_type_t v20 = sub_100031EE8();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      os_log_t v39 = v19;
      uint64_t v23 = v22;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v44 = v15;
      v45[0] = v40;
      *(_DWORD *)uint64_t v23 = 134218242;
      sub_100031FD8();
      *(_WORD *)(v23 + 12) = 2080;
      int v38 = v21;
      uint64_t v24 = sub_1000089EC(v13, v12, v41);
      uint64_t v44 = sub_10001B510(v24, v25, v45);
      sub_100031FD8();

      swift_bridgeObjectRelease();
      sub_1000063E0(&v46);
      sub_10000640C(v11);

      sub_1000063E0(&v46);
      sub_10000640C(v11);
      os_log_t v26 = v39;
      _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v38, "Look identifier %ld for configuration: %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_1000063E0(&v46);
      sub_10000640C(v11);

      sub_1000063E0(&v46);
      sub_10000640C(v11);
    }
    (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v8, v42);
    v45[0] = v15;
  }
  return sub_100032188();
}

void sub_100005D64(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_100031B18();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 identifier];
  uint64_t v9 = sub_100031C58();
  unint64_t v11 = v10;

  uint64_t v12 = HIBYTE(v11) & 0xF;
  uint64_t v13 = v9 & 0xFFFFFFFFFFFFLL;
  if ((v11 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(v11) & 0xF;
  }
  else {
    uint64_t v14 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (v14)
  {
    if ((v11 & 0x1000000000000000) == 0)
    {
      if ((v11 & 0x2000000000000000) == 0)
      {
        if ((v9 & 0x1000000000000000) == 0) {
          goto LABEL_63;
        }
        for (i = (unsigned __int8 *)((v11 & 0xFFFFFFFFFFFFFFFLL) + 32); ; i = (unsigned __int8 *)sub_100032098())
        {
          uint64_t v16 = (uint64_t)sub_100004EE4(i, v13, 10);
          char v18 = v17 & 1;
LABEL_44:
          swift_bridgeObjectRelease();
          if (v18) {
            break;
          }
LABEL_45:
          if (qword_1000441E0 == -1)
          {
            if ((v16 & 0x8000000000000000) == 0) {
              goto LABEL_47;
            }
          }
          else
          {
            swift_once();
            if ((v16 & 0x8000000000000000) == 0)
            {
LABEL_47:
              if ((unint64_t)v16 < *(void *)(qword_100046C80 + 16))
              {
                uint64_t v28 = qword_100046C80 + 48 * v16;
                uint64_t v29 = *(void *)(v28 + 32);
                uint64_t v30 = *(unsigned __int8 *)(v28 + 40);
                uint64_t v31 = *(void *)(v28 + 48);
                v32 = *(void **)(v28 + 56);
                uint64_t v33 = *(void *)(v28 + 64);
                uint64_t v34 = *(void *)(v28 + 72);
                id v35 = v32;
                id v36 = (id)v31;
                sub_10000633C(v33);
                goto LABEL_60;
              }
              __break(1u);
              goto LABEL_65;
            }
          }
          __break(1u);
LABEL_63:
          ;
        }
        goto LABEL_57;
      }
      v56[0] = v9;
      v56[1] = v11 & 0xFFFFFFFFFFFFFFLL;
      if (v9 == 43)
      {
        if (!v12) {
          goto LABEL_66;
        }
        if (v12 == 1 || (BYTE1(v9) - 48) > 9u) {
          goto LABEL_31;
        }
        uint64_t v16 = (BYTE1(v9) - 48);
        if (v12 != 2)
        {
          if ((BYTE2(v9) - 48) > 9u) {
            goto LABEL_31;
          }
          uint64_t v16 = 10 * (BYTE1(v9) - 48) + (BYTE2(v9) - 48);
          uint64_t v19 = v12 - 3;
          if (v19)
          {
            os_log_type_t v20 = (unsigned __int8 *)v56 + 3;
            while (1)
            {
              unsigned int v21 = *v20 - 48;
              if (v21 > 9) {
                goto LABEL_31;
              }
              uint64_t v22 = 10 * v16;
              if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
                goto LABEL_31;
              }
              uint64_t v16 = v22 + v21;
              if (__OFADD__(v22, v21)) {
                goto LABEL_31;
              }
              char v18 = 0;
              ++v20;
              if (!--v19) {
                goto LABEL_44;
              }
            }
          }
        }
      }
      else
      {
        if (v9 == 45)
        {
          if (v12)
          {
            if (v12 != 1 && (BYTE1(v9) - 48) <= 9u)
            {
              if (v12 == 2)
              {
                char v18 = 0;
                uint64_t v16 = -(uint64_t)(BYTE1(v9) - 48);
                goto LABEL_44;
              }
              if ((BYTE2(v9) - 48) <= 9u)
              {
                uint64_t v16 = -10 * (BYTE1(v9) - 48) - (BYTE2(v9) - 48);
                uint64_t v27 = v12 - 3;
                if (!v27) {
                  goto LABEL_43;
                }
                os_log_type_t v37 = (unsigned __int8 *)v56 + 3;
                while (1)
                {
                  unsigned int v38 = *v37 - 48;
                  if (v38 > 9) {
                    break;
                  }
                  uint64_t v39 = 10 * v16;
                  if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
                    break;
                  }
                  uint64_t v16 = v39 - v38;
                  if (__OFSUB__(v39, v38)) {
                    break;
                  }
                  char v18 = 0;
                  ++v37;
                  if (!--v27) {
                    goto LABEL_44;
                  }
                }
              }
            }
LABEL_31:
            uint64_t v16 = 0;
            char v18 = 1;
            goto LABEL_44;
          }
LABEL_65:
          __break(1u);
LABEL_66:
          __break(1u);
          return;
        }
        if (!v12 || (v9 - 48) > 9u) {
          goto LABEL_31;
        }
        uint64_t v16 = (v9 - 48);
        if (v12 != 1)
        {
          if ((BYTE1(v9) - 48) > 9u) {
            goto LABEL_31;
          }
          uint64_t v16 = 10 * (v9 - 48) + (BYTE1(v9) - 48);
          uint64_t v23 = v12 - 2;
          if (v23)
          {
            uint64_t v24 = (unsigned __int8 *)v56 + 2;
            while (1)
            {
              unsigned int v25 = *v24 - 48;
              if (v25 > 9) {
                goto LABEL_31;
              }
              uint64_t v26 = 10 * v16;
              if ((unsigned __int128)(v16 * (__int128)10) >> 64 != (10 * v16) >> 63) {
                goto LABEL_31;
              }
              uint64_t v16 = v26 + v25;
              if (__OFADD__(v26, v25)) {
                goto LABEL_31;
              }
              char v18 = 0;
              ++v24;
              if (!--v23) {
                goto LABEL_44;
              }
            }
          }
        }
      }
LABEL_43:
      char v18 = 0;
      goto LABEL_44;
    }
    uint64_t v16 = (uint64_t)sub_100004DFC(v9, v11, 10);
    char v41 = v40;
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0) {
      goto LABEL_45;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_57:
  sub_100031AB8();
  id v42 = a1;
  uint64_t v43 = sub_100031AF8();
  os_log_type_t v44 = sub_100031F08();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v55 = a2;
    v56[0] = v46;
    v54 = v7;
    *(_DWORD *)uint64_t v45 = 136315138;
    id v47 = objc_msgSend(v42, "identifier", v45 + 4);
    uint64_t v53 = v4;
    id v48 = v47;
    uint64_t v49 = sub_100031C58();
    unint64_t v51 = v50;

    v56[2] = sub_10001B510(v49, v51, v56);
    sub_100031FD8();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Could not convert look identifier to Int: %s", v45, 0xCu);
    uint64_t v31 = 1;
    swift_arrayDestroy();
    a2 = v55;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v54, v53);
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    v32 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    v32 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v31 = 1;
  }
LABEL_60:
  *a2 = v29;
  a2[1] = v30;
  a2[2] = v31;
  a2[3] = v32;
  a2[4] = v33;
  a2[5] = v34;
}

uint64_t sub_10000633C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000634C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000048F0(&qword_100045100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id *sub_1000063B4(id *a1)
{
  id v2 = *a1;
  return a1;
}

id *sub_1000063E0(id *a1)
{
  return a1;
}

uint64_t sub_10000640C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_10000641C(void *a1, void *a2)
{
  id v5 = [self blackColor];
  [a1 setBackgroundColor:v5];

  id v6 = [v2 vistaView];
  [a1 addSubview:v6];

  id v7 = [v2 vistaView];
  id v8 = [v7 quadViews];

  sub_100006718();
  unint64_t v9 = sub_100031D58();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100032118();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_100032088();
  }
  else
  {
    if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v10 = *(id *)(v9 + 32);
  }
  id v12 = v10;
  swift_bridgeObjectRelease();
  [a2 addSubview:v12];
}

unint64_t sub_1000065E4()
{
  id v1 = [v0 vistaView];
  id v2 = [v1 quadViews];

  sub_100006718();
  unint64_t v3 = sub_100031D58();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100032118();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_11;
  }
LABEL_3:
  unint64_t result = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v6 = (id)sub_100032088();
    goto LABEL_8;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (result >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_17:
    __break(1u);
    return result;
  }
  id v6 = *(id *)(v3 + 8 * result + 32);
LABEL_8:
  id v7 = v6;
  swift_bridgeObjectRelease();
  self;
  unint64_t result = swift_dynamicCastObjCClass();
  if (result) {
    return result;
  }

  return 0;
}

unint64_t sub_100006718()
{
  unint64_t result = qword_1000450C0;
  if (!qword_1000450C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1000450C0);
  }
  return result;
}

uint64_t initializeWithCopy for Configuration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  id v7 = (_OWORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 32);
  id v8 = v4;
  id v9 = v5;
  if (v6)
  {
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 40) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *v7;
  }
  return a1;
}

uint64_t assignWithCopy for Configuration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  id v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  id v7 = *(void **)(a1 + 24);
  id v8 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v8;
  id v9 = v8;

  uint64_t v10 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v10;
      *(void *)(a1 + 40) = v12;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for Configuration(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Configuration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);

  uint64_t v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  uint64_t v5 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v5;
      *(void *)(a1 + 40) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Configuration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Configuration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Configuration()
{
  return &type metadata for Configuration;
}

uint64_t sub_100006A20()
{
  uint64_t v0 = sub_1000315F8();
  sub_100008FA8(v0, qword_100046C88);
  uint64_t v1 = sub_100008F70(v0, (uint64_t)qword_100046C88);
  return sub_100006A6C(v1);
}

uint64_t sub_100006A6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v1 = sub_1000048F0((uint64_t *)&unk_100045A90);
  __chkstk_darwin(v1 - 8);
  unint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000048F0(&qword_1000443A0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000048F0(&qword_1000443A8);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100031518();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100031638();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  uint64_t v15 = sub_100031668();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  v16(v6, 1, 1, v15);
  sub_1000314F8();
  sub_1000314C8();
  sub_1000314D8();
  sub_100031498();
  sub_1000314B8();
  sub_1000314E8();
  sub_100031658();
  v16(v6, 0, 1, v15);
  sub_100031508();
  sub_1000314A8();
  uint64_t v17 = sub_1000315F8();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17) == 1)
  {
    sub_1000315D8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return sub_1000098B4((uint64_t)v3, (uint64_t *)&unk_100045A90);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v21, v3, v17);
  }
}

uint64_t sub_100006E4C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000048F0((uint64_t *)&unk_100045A90);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)v16 - v8;
  uint64_t v10 = (__CFString *)sub_100031C28();
  CFPropertyListRef v11 = CFPreferencesCopyAppValue(v10, kCFPreferencesAnyApplication);

  if (v11)
  {
    v16[1] = v11;
    uint64_t v12 = sub_1000315F8();
    swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 0, 1, v12);
  }
  else
  {
    uint64_t v12 = sub_1000315F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  sub_100009850((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_100045A90);
  sub_1000315F8();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    if (a1)
    {
      if (qword_1000441E8 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_100008F70(v12, (uint64_t)qword_100046C88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(a2, v14, v12);
    }
    else
    {
      sub_1000315D8();
    }
    sub_1000098B4((uint64_t)v7, (uint64_t *)&unk_100045A90);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, v7, v12);
  }
  return sub_1000098B4((uint64_t)v9, (uint64_t *)&unk_100045A90);
}

uint64_t sub_1000070E0(uint64_t a1, uint64_t a2)
{
  return sub_100008940(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_1000070FC()
{
  return sub_100008E40(*(void *)v0, *(unsigned __int8 *)(v0 + 8), *(void **)(v0 + 16));
}

void sub_10000710C(uint64_t a1)
{
  uint64_t v39 = a1;
  uint64_t v2 = sub_100031618();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = &v32[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_100031638();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v43 = v6;
  __chkstk_darwin();
  char v41 = &v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000048F0((uint64_t *)&unk_100045A90);
  __chkstk_darwin();
  id v9 = &v32[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_1000315F8();
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  __chkstk_darwin();
  char v40 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = *(void **)(v1 + 16);
  uint64_t v13 = *(void (**)(void))(v1 + 32);
  sub_10001D6EC();
  v38._countAndFlagsBits = sub_100031C78();
  v38._object = v14;
  swift_bridgeObjectRelease();
  uint64_t v37 = sub_100031C78();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (v12) {
    id v17 = v12;
  }
  else {
    id v17 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:37.33182 longitude:-122.03118];
  }
  id v18 = v12;
  [v17 coordinate];

  double v19 = sub_100031E38(2);
  double v20 = sub_100031E38(2);
  double v21 = v19 * 100.0;
  if (v21 <= -2147483650.0)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v21 >= 2147483650.0)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if ((*(void *)&v21 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_18;
  }
  double v22 = v20 * 100.0;
  if ((COERCE_UNSIGNED_INT64(v20 * 100.0) & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_18;
  }
  if (v22 <= -2147483650.0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v22 < 2147483650.0)
  {
    id v36 = v16;
    if (v13)
    {
      v13();
      uint64_t v24 = v44;
      uint64_t v23 = v45;
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v44 + 56))(v9, 0, 1, v45);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v24 + 48))(v9, 1, v23) != 1)
      {
        unsigned int v25 = v40;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v44 + 32))(v40, v9, v45);
LABEL_15:
        int v33 = (36691 * (int)v22) ^ (33469 * (int)v21);
        uint64_t v26 = v41;
        sub_100031608();
        uint64_t v27 = *(void (**)(unsigned char *, void, uint64_t))(v3 + 104);
        v27(v5, enum case for Calendar.Component.month(_:), v2);
        uint64_t v34 = sub_100031628();
        uint64_t v28 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
        v28(v5, v2);
        v27(v5, enum case for Calendar.Component.day(_:), v2);
        uint64_t v35 = sub_100031628();
        v28(v5, v2);
        v27(v5, enum case for Calendar.Component.timeZone(_:), v2);
        char v40 = (unsigned char *)sub_100031628();
        v28(v5, v2);
        sub_100031E58(3);
        sub_100031E58(3);
        uint64_t v29 = sub_100031F88();
        uint64_t v31 = v30;
        uint64_t v47 = 0;
        unint64_t v48 = 0xE000000000000000;
        sub_100032068(48);
        v49._countAndFlagsBits = 40;
        v49._object = (void *)0xE100000000000000;
        sub_100031CA8(v49);
        sub_100031858();
        sub_10000996C(&qword_100045130, (void (*)(uint64_t))&type metadata accessor for SnapshotType);
        v50._countAndFlagsBits = sub_100032188();
        sub_100031CA8(v50);
        swift_bridgeObjectRelease();
        v51._countAndFlagsBits = 2633001;
        v51._object = (void *)0xE300000000000000;
        sub_100031CA8(v51);
        sub_100031CA8(v38);
        swift_bridgeObjectRelease();
        v52._countAndFlagsBits = 2633001;
        v52._object = (void *)0xE300000000000000;
        sub_100031CA8(v52);
        v53._countAndFlagsBits = v37;
        v53._object = v36;
        sub_100031CA8(v53);
        swift_bridgeObjectRelease();
        v54._countAndFlagsBits = 2633001;
        v54._object = (void *)0xE300000000000000;
        sub_100031CA8(v54);
        LODWORD(v46) = v33;
        v55._countAndFlagsBits = sub_100032188();
        sub_100031CA8(v55);
        swift_bridgeObjectRelease();
        v56._countAndFlagsBits = 2633001;
        v56._object = (void *)0xE300000000000000;
        sub_100031CA8(v56);
        v57._countAndFlagsBits = v29;
        v57._object = v31;
        sub_100031CA8(v57);
        swift_bridgeObjectRelease();
        v58._countAndFlagsBits = 2633001;
        v58._object = (void *)0xE300000000000000;
        sub_100031CA8(v58);
        sub_100031E68();
        v59._countAndFlagsBits = 10285;
        v59._object = (void *)0xE200000000000000;
        sub_100031CA8(v59);
        sub_100031E68();
        v60._countAndFlagsBits = 2633001;
        v60._object = (void *)0xE300000000000000;
        sub_100031CA8(v60);
        uint64_t v46 = (unsigned char *)v34;
        v61._countAndFlagsBits = sub_100032188();
        sub_100031CA8(v61);
        swift_bridgeObjectRelease();
        v62._countAndFlagsBits = 2633001;
        v62._object = (void *)0xE300000000000000;
        sub_100031CA8(v62);
        uint64_t v46 = (unsigned char *)v35;
        v63._countAndFlagsBits = sub_100032188();
        sub_100031CA8(v63);
        swift_bridgeObjectRelease();
        v64._countAndFlagsBits = 2633001;
        v64._object = (void *)0xE300000000000000;
        sub_100031CA8(v64);
        uint64_t v46 = v40;
        v65._countAndFlagsBits = sub_100032188();
        sub_100031CA8(v65);
        swift_bridgeObjectRelease();
        v66._countAndFlagsBits = 41;
        v66._object = (void *)0xE100000000000000;
        sub_100031CA8(v66);
        sub_100031C28();
        swift_bridgeObjectRelease();
        (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v26, v43);
        (*(void (**)(unsigned char *, uint64_t))(v44 + 8))(v25, v45);
        return;
      }
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v9, 1, 1, v45);
    }
    unsigned int v25 = v40;
    sub_1000315D8();
    sub_1000098B4((uint64_t)v9, (uint64_t *)&unk_100045A90);
    goto LABEL_15;
  }
LABEL_20:
  __break(1u);
}

uint64_t sub_100007938(uint64_t a1)
{
  sub_10000710C(a1);
  uint64_t v2 = v1;
  id v3 = [self mainScreen];
  [v3 scale];

  v9._countAndFlagsBits = sub_100031E28();
  sub_100031CA8(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 120;
  v10._object = (void *)0xE100000000000000;
  sub_100031CA8(v10);
  sub_100032068(16);
  swift_bridgeObjectRelease();
  sub_100031858();
  sub_10000996C(&qword_100045130, (void (*)(uint64_t))&type metadata accessor for SnapshotType);
  v11._countAndFlagsBits = sub_100032188();
  sub_100031CA8(v11);
  swift_bridgeObjectRelease();
  id v4 = [v2 description];
  uint64_t v5 = sub_100031C58();
  uint64_t v7 = v6;

  v12._countAndFlagsBits = v5;
  v12._object = v7;
  sub_100031CA8(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 64;
  v13._object = (void *)0xE100000000000000;
  sub_100031CA8(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 1735290926;
  v14._object = (void *)0xE400000000000000;
  sub_100031CA8(v14);

  return 0x2D7269676561;
}

Class sub_100007B08(uint64_t a1)
{
  uint64_t v2 = sub_1000315F8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v7 = swift_retain();
  v6(v7);
  swift_release();
  v8.super.isa = sub_100031598().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return v8.super.isa;
}

uint64_t sub_100007C0C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000048F0(&qword_100045260);
  char v42 = a2;
  uint64_t v6 = sub_100032138();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1000321D8();
    sub_100031C98();
    uint64_t result = sub_1000321F8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    double v19 = (void *)(*(void *)(v7 + 48) + v18);
    *double v19 = v34;
    v19[1] = v33;
    double v20 = (void *)(*(void *)(v7 + 56) + v18);
    *double v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100007F34(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000048F0(&qword_100045AA0);
  uint64_t v6 = sub_100032138();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
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
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_100009B5C((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_100009AB0(v25, (uint64_t)&v38);
      sub_100009B6C(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_100032028(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_100009B5C(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10000824C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_10001BEA8(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_10000859C();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      int64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *int64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_100007C0C(v17, a5 & 1);
  unint64_t v23 = sub_10001BEA8(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_1000321B8();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a3;
  v25[1] = a4;
  long long v26 = (void *)(v20[7] + 16 * v14);
  *long long v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_1000083D4(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_10001BF20(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100008758();
      goto LABEL_7;
    }
    sub_100007F34(v13, a3 & 1);
    unint64_t v19 = sub_10001BF20(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      BOOL v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_100009AB0(a2, (uint64_t)v21);
      return sub_100008520(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_1000321B8();
    __break(1u);
    return result;
  }
LABEL_7:
  BOOL v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_100009B0C((uint64_t)v17);

  return sub_100009B5C(a1, v17);
}

_OWORD *sub_100008520(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_100009B5C(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_10000859C()
{
  uint64_t v1 = v0;
  sub_1000048F0(&qword_100045260);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100032128();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    char v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100008758()
{
  uint64_t v1 = v0;
  sub_1000048F0(&qword_100045AA0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100032128();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_100009AB0(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_100009B6C(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_100009B5C(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100008940(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a1 == a3)
  {
    if (a2) {
      uint64_t v4 = 0x6C6961746544;
    }
    else {
      uint64_t v4 = 1819047238;
    }
    if (a2) {
      unint64_t v5 = 0xE600000000000000;
    }
    else {
      unint64_t v5 = 0xE400000000000000;
    }
    if (a4) {
      uint64_t v6 = 0x6C6961746544;
    }
    else {
      uint64_t v6 = 1819047238;
    }
    if (a4) {
      unint64_t v7 = 0xE600000000000000;
    }
    else {
      unint64_t v7 = 0xE400000000000000;
    }
    if (v4 == v6 && v5 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = sub_1000321A8();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_1000089EC(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = sub_10001D6EC();
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = 44;
  v11._object = (void *)0xE100000000000000;
  sub_100031CA8(v11);
  swift_bridgeObjectRelease();
  BOOL v5 = (a2 & 1) == 0;
  if (a2) {
    uint64_t v6 = 0x6C6961746544;
  }
  else {
    uint64_t v6 = 1819047238;
  }
  if (v5) {
    unint64_t v7 = (void *)0xE400000000000000;
  }
  else {
    unint64_t v7 = (void *)0xE600000000000000;
  }
  swift_bridgeObjectRetain();
  v12._countAndFlagsBits = v6;
  v12._object = v7;
  sub_100031CA8(v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = v10;
  if (a3)
  {
    id v9 = a3;
    [v9 coordinate];
    sub_100031E48();
    v13._countAndFlagsBits = 44;
    v13._object = (void *)0xE100000000000000;
    sub_100031CA8(v13);
    [v9 coordinate];
    sub_100031E48();
    v14._countAndFlagsBits = 0;
    v14._object = (void *)0xE000000000000000;
    sub_100031CA8(v14);
    swift_bridgeObjectRelease();
    v15._countAndFlagsBits = 44;
    v15._object = (void *)0xE100000000000000;
    sub_100031CA8(v15);

    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

void sub_100008B70(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = [a1 currentLook];
  sub_100005D64(v4, v15);

  sub_1000099B4((uint64_t)v15, (uint64_t)&v16);
  uint64_t v5 = v18;
  if (v18 == 1)
  {
    objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
    swift_unknownObjectRelease();
    swift_getObjectType();
    uint64_t v6 = sub_10001DCC4();
    char v8 = v7;
    uint64_t v10 = v9;
    swift_unknownObjectRelease();

    if (v10 == 1) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v6;
    }
    if (v10 == 1) {
      unsigned int v12 = 0;
    }
    else {
      unsigned int v12 = v8 & 1;
    }
    if (v10 == 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v10;
    }
  }
  else
  {
    uint64_t v11 = v16;
    char v13 = v17;

    unsigned int v12 = v13 & 1;
    id v14 = (id)v5;
    sub_100009A1C((uint64_t)v15);
  }
  *a2 = v11;
  a2[1] = v12;
  a2[2] = v5;
  a2[3] = 0;
  a2[4] = 0;
  a2[5] = 0;
}

void *sub_100008C94(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = sub_10001D6EC();
  uint64_t v7 = v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10000824C(v5, v7, 0x6174736956, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  BOOL v9 = (a2 & 1) == 0;
  if (a2) {
    uint64_t v10 = 0x6C6961746544;
  }
  else {
    uint64_t v10 = 1819047238;
  }
  if (v9) {
    uint64_t v11 = 0xE400000000000000;
  }
  else {
    uint64_t v11 = 0xE600000000000000;
  }
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_10000824C(v10, v11, 0x656C797453, 0xE500000000000000, v12);
  swift_bridgeObjectRelease();
  if (a3)
  {
    id v13 = a3;
    [v13 coordinate];
    sub_100031E48();
    v16._countAndFlagsBits = 44;
    v16._object = (void *)0xE100000000000000;
    sub_100031CA8(v16);
    [v13 coordinate];
    sub_100031E48();
    char v14 = swift_isUniquelyReferenced_nonNull_native();
    sub_10000824C(0, 0xE000000000000000, 0x6E6F697461636F4CLL, 0xE800000000000000, v14);

    swift_bridgeObjectRelease();
  }
  return &_swiftEmptyDictionarySingleton;
}

uint64_t sub_100008E40(uint64_t a1, uint64_t a2, void *a3)
{
  v5._countAndFlagsBits = sub_10001D6EC();
  sub_100031CA8(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 8236;
  v6._object = (void *)0xE200000000000000;
  sub_100031CA8(v6);
  sub_1000320F8();
  v7._countAndFlagsBits = 8236;
  v7._object = (void *)0xE200000000000000;
  sub_100031CA8(v7);
  if (a3)
  {
    [a3 coordinate];
    sub_100031E48();
    v8._countAndFlagsBits = 44;
    v8._object = (void *)0xE100000000000000;
    sub_100031CA8(v8);
    [a3 coordinate];
    sub_100031E48();
  }
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  sub_100031CA8(v9);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100008F70(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100008FA8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id sub_10000900C(uint64_t a1, uint64_t a2, char a3, void **a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12)
{
  int v75 = a6;
  id v69 = (id)a5;
  v68 = a4;
  v70 = (void **)a1;
  LODWORD(v67) = a3 & 1;
  uint64_t v66 = sub_100031B18();
  uint64_t v65 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  v73 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1000048F0(&qword_100045D50);
  __chkstk_darwin(v20 - 8);
  unint64_t v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100031568();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  v71 = (char *)&v64 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v72 = (char *)&v64 - v27;
  uint64_t v28 = type metadata accessor for Geotime();
  uint64_t v29 = v28 - 8;
  __chkstk_darwin(v28);
  char v31 = (char *)&v64 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v32 = sub_100009F40();
  id v33 = objc_msgSend(objc_allocWithZone((Class)NUNIAstronomyVistaView), "initWithFrame:configuration:", v32, a9, a10, a11, a12);

  id v34 = objc_allocWithZone((Class)NUNIScene);
  uint64_t v81 = a7;
  uint64_t v82 = a8;
  aBlock = _NSConcreteStackBlock;
  uint64_t v78 = 1107296256;
  v79 = sub_100007B08;
  v80 = &unk_10003D968;
  uint64_t v35 = _Block_copy(&aBlock);
  swift_retain();
  id v36 = [v34 initWithSphereoids:16515070 currentDateBlock:v35];
  _Block_release(v35);
  swift_release();
  [v36 setSnap:3];
  [v36 setBackgroundType:2];
  [v33 setScene:v36];
  id v37 = [objc_allocWithZone((Class)NUNIAstronomyVistaController) initWithVistaView:v33];
  [v37 setIsBacklightTransitionEnabled:1];
  [v37 setActiveModeFrameInterval:1];
  [v37 setVista:a2];
  [v37 setVistaTransitionStyle:1];
  id v74 = v33;
  id v38 = [v33 scene];
  long long v39 = (uint64_t (**)(void))[v38 currentDateBlock];

  id v40 = (id)v39[2](v39);
  sub_1000315C8();

  uint64_t v41 = v24;
  _Block_release(v39);
  char v42 = v68;
  *(void *)&v31[*(int *)(v29 + 28)] = v68;
  uint64_t v43 = v42;
  sub_10000BD84(a2, (char)v67, (uint64_t)v31, (uint64_t)v69);
  LODWORD(aBlock) = v44;
  uint64_t v78 = v45;
  v79 = v46;
  LODWORD(v80) = v47;
  [v37 applyStyleDefinition:&aBlock];
  sub_100009850((uint64_t)v70, (uint64_t)v22, &qword_100045D50);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    sub_1000098B4((uint64_t)v22, &qword_100045D50);
  }
  else
  {
    v70 = v43;
    unint64_t v48 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    Swift::String v49 = v72;
    v48(v72, v22, v23);
    sub_100031548(v50);
    Swift::String v52 = v51;
    [v37 setCacheDirectory:v51];

    sub_100031AA8();
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v71, v49, v23);
    Swift::String v53 = sub_100031AF8();
    os_log_type_t v54 = sub_100031F08();
    if (os_log_type_enabled(v53, v54))
    {
      Swift::String v55 = (uint8_t *)swift_slowAlloc();
      Swift::String v56 = (void **)swift_slowAlloc();
      id v69 = v36;
      v68 = v56;
      aBlock = v56;
      *(_DWORD *)Swift::String v55 = 136315138;
      v67 = v55 + 4;
      sub_10000996C(&qword_1000443B0, (void (*)(uint64_t))&type metadata accessor for URL);
      Swift::String v57 = v71;
      uint64_t v58 = sub_100032188();
      uint64_t v76 = sub_10001B510(v58, v59, (uint64_t *)&aBlock);
      sub_100031FD8();
      swift_bridgeObjectRelease();
      Swift::String v60 = *(void (**)(char *, uint64_t))(v41 + 8);
      v60(v57, v23);
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Vista Controller created with asset directory: %s", v55, 0xCu);
      swift_arrayDestroy();
      id v36 = v69;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v65 + 8))(v73, v66);
      v60(v72, v23);
    }
    else
    {

      Swift::String v61 = *(void (**)(char *, uint64_t))(v41 + 8);
      v61(v71, v23);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v73, v66);
      v61(v72, v23);
    }
    uint64_t v43 = v70;
  }
  [v37 disableCloudDataFetch:v75 & 1];
  if ([v37 mode] != (id)1) {
    [v37 applyMode:1];
  }
  [v37 updateLocation:0 fallbackLocation:v43 animated:0];
  id v62 = [v37 vistaView];
  [v62 updateSunLocationAnimated:0];

  sub_100009910((uint64_t)v31);
  return v37;
}

uint64_t sub_100009838(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009848()
{
  return swift_release();
}

uint64_t sub_100009850(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000048F0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000098B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000048F0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009910(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Geotime();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000996C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000099B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000048F0(&qword_1000443B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009A1C(uint64_t a1)
{
  return a1;
}

void sub_100009A54(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  if (a3 != (void *)1)
  {

    sub_10000640C(a5);
  }
}

uint64_t sub_100009AB0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009B0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

_OWORD *sub_100009B5C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100009B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void _s11AegirPoster13ConfigurationVwxx_0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    swift_release();
  }
}

uint64_t initializeWithCopy for AegirSnapshotIdentifierProvider(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  Swift::String v7 = (_OWORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 32);
  id v8 = v4;
  id v9 = v5;
  if (v6)
  {
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 40) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *v7;
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t assignWithCopy for AegirSnapshotIdentifierProvider(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  Swift::String v7 = *(void **)(a1 + 24);
  id v8 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v8;
  id v9 = v8;

  uint64_t v10 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v10;
      *(void *)(a1 + 40) = v12;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_8;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  swift_retain();
  swift_release();
LABEL_8:
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for AegirSnapshotIdentifierProvider(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AegirSnapshotIdentifierProvider(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);

  long long v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  uint64_t v5 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v5;
      *(void *)(a1 + 40) = v7;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  swift_release();
LABEL_8:
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for AegirSnapshotIdentifierProvider(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AegirSnapshotIdentifierProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AegirSnapshotIdentifierProvider()
{
  return &type metadata for AegirSnapshotIdentifierProvider;
}

id sub_100009F40()
{
  id result = [self currentDevice];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = [objc_allocWithZone((Class)NUNIAstronomyVistaConfiguration) initWithDevice:result];

    [v2 setRendererStyle:3];
    id v3 = [self currentDevice];
    [v3 userInterfaceIdiom];

    NSString v4 = sub_100031C28();
    swift_bridgeObjectRelease();
    [v2 setTextureSuffix:v4];

    [v2 setColorSpace:2];
    id v5 = [self mainScreen];
    [v5 scale];
    double v7 = v6;

    [v2 setScreenScale:v7];
    [v2 setQuadViewOptions:370];
    [v2 setIsGPUEnabled:1];
    [v2 setIsRTLLayout:0];
    NSString v8 = sub_100031C28();
    LODWORD(v4) = MGGetBoolAnswer();

    LODWORD(v9) = 1028443341;
    if (!v4) {
      *(float *)&double v9 = 1.0;
    }
    [v2 setMaxAPL:v9];
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10000A15C()
{
  return sub_10000A198(2, 0x7269676561, 0xE500000000000000, 114);
}

id sub_10000A178()
{
  return sub_10000A198(0, 0x63697373616C63, 0xE700000000000000, 50);
}

id sub_10000A198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result = [self currentDevice];
  if (result)
  {
    double v7 = result;
    id v8 = [objc_allocWithZone((Class)NUNIAstronomyVistaConfiguration) initWithDevice:result];

    [v8 setRendererStyle:a1];
    NSString v9 = sub_100031C28();
    [v8 setTextureSuffix:v9];

    [v8 setColorSpace:a1];
    id v10 = [self mainScreen];
    [v10 scale];
    double v12 = v11;

    [v8 setScreenScale:v12];
    [v8 setQuadViewOptions:a4];
    [v8 setIsGPUEnabled:1];
    [v8 setIsRTLLayout:0];
    NSString v13 = sub_100031C28();
    LODWORD(v10) = MGGetBoolAnswer();

    LODWORD(v14) = 1028443341;
    if (!v10) {
      *(float *)&double v14 = 1.0;
    }
    [v8 setMaxAPL:v14];
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

const mach_header_64 *sub_10000A35C(uint64_t a1)
{
  if (a1 != 2) {
    return &_mh_execute_header;
  }
  sub_10000A428();
  sub_100031C08();
  float v2 = v3;
  return (const mach_header_64 *)(LODWORD(v2) ^ 0x80000000);
}

unint64_t sub_10000A428()
{
  unint64_t result = qword_1000443C0;
  if (!qword_1000443C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000443C0);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for AegirPosterEnvironment(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AegirPosterEnvironment(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AegirPosterEnvironment(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AegirPosterEnvironment()
{
  return &type metadata for AegirPosterEnvironment;
}

uint64_t sub_10000A4EC()
{
  if ((sub_1000315B8() & 1) == 0) {
    return 0;
  }
  sub_10000CB74();
  return sub_100031FA8() & 1;
}

int32x2_t sub_10000A550()
{
  int32x2_t result = vdup_n_s32(0x7F800000u);
  qword_100046CA0 = (uint64_t)result;
  dword_100046CA8 = 2139095040;
  qword_100046CB0 = 0;
  return result;
}

BOOL sub_10000A570(uint64_t a1, uint64_t a2)
{
  return *(float *)a1 == *(float *)a2
      && *(float *)(a1 + 4) == *(float *)(a2 + 4)
      && *(float *)(a1 + 8) == *(float *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16);
}

uint64_t sub_10000A5AC()
{
  sub_100032068(65);
  v1._object = (void *)0x8000000100033B40;
  v1._countAndFlagsBits = 0xD000000000000013;
  sub_100031CA8(v1);
  sub_100031E68();
  v2._countAndFlagsBits = 0xD00000000000001ALL;
  v2._object = (void *)0x8000000100033B60;
  sub_100031CA8(v2);
  sub_100031E68();
  v3._countAndFlagsBits = 0x746E6569726F202CLL;
  v3._object = (void *)0xEE003D6E6F697461;
  sub_100031CA8(v3);
  v4._countAndFlagsBits = sub_100031F88();
  sub_100031CA8(v4);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10000A6D4()
{
  return sub_10000A5AC();
}

void sub_10000A6E0(uint64_t a1)
{
}

double sub_10000A6F8()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  float v2 = 0.05;
  if (!v1) {
    float v2 = -0.15;
  }
  LODWORD(v3) = 0;
  *((float *)&v3 + 1) = v2;
  dword_1000443E8 = 1091792046;
  double result = -0.125;
  qword_1000443F0 = v3;
  unk_1000443F8 = 0xBFC0000000000000;
  dword_100044400 = 1065353216;
  return result;
}

void sub_10000A79C()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  float v2 = 0.1;
  if (!v1) {
    float v2 = -0.1;
  }
  LODWORD(v3) = 0;
  *((float *)&v3 + 1) = v2;
  dword_100044408 = 1085818841;
  qword_100044410 = v3;
  qword_100044418 = 0;
  dword_100044420 = 1065353216;
}

void sub_10000A83C(uint64_t a1)
{
}

void sub_10000A854(uint64_t a1, _DWORD *a2, void *a3, void *a4, _DWORD *a5)
{
  id v9 = [self currentDevice];
  id v10 = [v9 userInterfaceIdiom];

  float v11 = 0.15;
  if (!v10) {
    float v11 = -0.05;
  }
  LODWORD(v12) = 0;
  *((float *)&v12 + 1) = v11;
  *a2 = 1085818841;
  *a3 = v12;
  *a4 = 0;
  *a5 = 1065353216;
}

double sub_10000A90C()
{
  dword_100044448 = 1089441946;
  *(void *)&double result = 3187671040;
  qword_100044450 = 3187671040;
  qword_100044458 = 0;
  dword_100044460 = 1065353216;
  return result;
}

double sub_10000A93C()
{
  dword_100044468 = 1092395897;
  *(void *)&double result = 3156465418;
  qword_100044470 = 3156465418;
  unk_100044478 = 0xBF80000000000000;
  dword_100044480 = 1065353216;
  return result;
}

double sub_10000A970()
{
  dword_100044488 = 1089441946;
  *(void *)&double result = 3186328863;
  qword_100044490 = 3186328863;
  qword_100044498 = 0;
  dword_1000444A0 = 1065353216;
  return result;
}

double sub_10000A9A0()
{
  dword_1000444A8 = 1089441946;
  *(void *)&double result = 3187671040;
  qword_1000444B0 = 3187671040;
  qword_1000444B8 = 0;
  dword_1000444C0 = 1065353216;
  return result;
}

float sub_10000A9D0()
{
  if (qword_1000441F8 != -1) {
    swift_once();
  }
  int v0 = dword_1000443C8;
  uint64_t v1 = qword_1000443D0;
  uint64_t v2 = qword_1000443D8;
  int v3 = dword_1000443E0;
  if (qword_100044218 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044448;
  dword_1000444C8 = v0;
  qword_1000444D0 = v1;
  unk_1000444D8 = v2;
  dword_1000444E0 = v3;
  dword_1000444E8 = dword_100044448;
  qword_1000444F0 = qword_100044450;
  unk_1000444F8 = qword_100044458;
  dword_100044500 = dword_100044460;
  return result;
}

float sub_10000AA9C()
{
  if (qword_100044200 != -1) {
    swift_once();
  }
  int v0 = dword_1000443E8;
  uint64_t v1 = qword_1000443F0;
  uint64_t v2 = unk_1000443F8;
  int v3 = dword_100044400;
  if (qword_100044220 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044468;
  dword_100044508 = v0;
  qword_100044510 = v1;
  unk_100044518 = v2;
  dword_100044520 = v3;
  dword_100044528 = dword_100044468;
  qword_100044530 = qword_100044470;
  unk_100044538 = unk_100044478;
  dword_100044540 = dword_100044480;
  return result;
}

float sub_10000AB68()
{
  if (qword_100044208 != -1) {
    swift_once();
  }
  int v0 = dword_100044408;
  uint64_t v1 = qword_100044410;
  uint64_t v2 = qword_100044418;
  int v3 = dword_100044420;
  if (qword_100044228 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044488;
  dword_100044548 = v0;
  qword_100044550 = v1;
  unk_100044558 = v2;
  dword_100044560 = v3;
  dword_100044568 = dword_100044488;
  qword_100044570 = qword_100044490;
  unk_100044578 = qword_100044498;
  dword_100044580 = dword_1000444A0;
  return result;
}

float sub_10000AC34()
{
  if (qword_100044210 != -1) {
    swift_once();
  }
  int v0 = dword_100044428;
  uint64_t v1 = qword_100044430;
  uint64_t v2 = qword_100044438;
  int v3 = dword_100044440;
  if (qword_100044230 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_1000444A8;
  dword_100044588 = v0;
  qword_100044590 = v1;
  unk_100044598 = v2;
  dword_1000445A0 = v3;
  dword_1000445A8 = dword_1000444A8;
  qword_1000445B0 = qword_1000444B0;
  unk_1000445B8 = qword_1000444B8;
  dword_1000445C0 = dword_1000444C0;
  return result;
}

double sub_10000AD00()
{
  dword_1000445C8 = 1079845637;
  double result = 0.5;
  qword_1000445D0 = 0x3FE0000000000000;
  unk_1000445D8 = 0x3FE0000000000000;
  dword_1000445E0 = 1065353216;
  return result;
}

double sub_10000AD2C()
{
  dword_1000445E8 = 1087026543;
  double result = 0.00273437425;
  qword_1000445F0 = 0x3F66666600000000;
  qword_1000445F8 = 0;
  dword_100044600 = 1065353216;
  return result;
}

double sub_10000AD5C()
{
  dword_100044608 = 1079845637;
  *(void *)&double result = 3217450598;
  qword_100044610 = 3217450598;
  unk_100044618 = 0x4010000000000000;
  dword_100044620 = 1065353216;
  return result;
}

double sub_10000AD90()
{
  dword_100044628 = 1087026543;
  *(void *)&double result = 3208642560;
  qword_100044630 = 3208642560;
  qword_100044638 = 0;
  dword_100044640 = 1065353216;
  return result;
}

float sub_10000ADC0()
{
  if (qword_100044258 != -1) {
    swift_once();
  }
  int v0 = dword_1000445C8;
  uint64_t v1 = qword_1000445D0;
  uint64_t v2 = unk_1000445D8;
  int v3 = dword_1000445E0;
  if (qword_100044268 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044608;
  dword_100044648 = v0;
  qword_100044650 = v1;
  unk_100044658 = v2;
  dword_100044660 = v3;
  dword_100044668 = dword_100044608;
  qword_100044670 = qword_100044610;
  unk_100044678 = unk_100044618;
  dword_100044680 = dword_100044620;
  return result;
}

float sub_10000AE8C()
{
  if (qword_100044260 != -1) {
    swift_once();
  }
  int v0 = dword_1000445E8;
  uint64_t v1 = qword_1000445F0;
  uint64_t v2 = qword_1000445F8;
  int v3 = dword_100044600;
  if (qword_100044270 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044628;
  dword_100044688 = v0;
  qword_100044690 = v1;
  unk_100044698 = v2;
  dword_1000446A0 = v3;
  dword_1000446A8 = dword_100044628;
  qword_1000446B0 = qword_100044630;
  unk_1000446B8 = qword_100044638;
  dword_1000446C0 = dword_100044640;
  return result;
}

double sub_10000AF58()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  float v2 = 0.9;
  if (v1) {
    float v2 = 1.25;
  }
  __asm { FMOV            V1.2S, #-1.0 }
  *((float *)&_D1 + 1) = v2;
  dword_1000446C8 = 1075860221;
  double result = 0.00781250558;
  qword_1000446D0 = _D1;
  unk_1000446D8 = 0x3F800000BFB9999ALL;
  dword_1000446E0 = 1065353216;
  return result;
}

double sub_10000AFF4()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  float v3 = 0.7;
  if (!v1) {
    float v3 = 0.35;
  }
  v2.i32[0] = -1085485875;
  LODWORD(v4) = vdup_lane_s32(v2, 0).u32[0];
  *((float *)&v4 + 1) = v3;
  dword_1000446E8 = 1079362555;
  double result = 0.0000256347812;
  qword_1000446F0 = v4;
  unk_1000446F8 = 0x3EFAE148BF4CCCCDLL;
  dword_100044700 = 1065353216;
  return result;
}

double sub_10000B0A4()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  float v3 = 0.7;
  if (!v1) {
    float v3 = 0.35;
  }
  v2.i32[0] = 1061997773;
  LODWORD(v4) = vdup_lane_s32(v2, 0).u32[0];
  *((float *)&v4 + 1) = v3;
  dword_100044708 = 1079362555;
  double result = 0.0000256347739;
  qword_100044710 = v4;
  unk_100044718 = 0x3EFAE1483F4CCCCDLL;
  dword_100044720 = 1065353216;
  return result;
}

double sub_10000B154()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  float v2 = 0.925;
  if (!v1) {
    float v2 = 0.575;
  }
  LODWORD(v3) = 0;
  *((float *)&v3 + 1) = v2;
  dword_100044728 = 1078637935;
  double result = 0.000170898391;
  qword_100044730 = v3;
  unk_100044738 = 0x3F26666600000000;
  dword_100044740 = 1065353216;
  return result;
}

double sub_10000B1F8()
{
  dword_100044748 = 1083161897;
  *(void *)&double result = 3206662849;
  qword_100044750 = 3206662849;
  unk_100044758 = 0x3F86666600000000;
  dword_100044760 = 1065353216;
  return result;
}

double sub_10000B22C()
{
  dword_100044768 = 1083161897;
  *(void *)&double result = 3206662849;
  qword_100044770 = 3206662849;
  unk_100044778 = 0x3F26666600000000;
  dword_100044780 = 1065353216;
  return result;
}

float sub_10000B260()
{
  if (qword_100044288 != -1) {
    swift_once();
  }
  int v0 = dword_1000446C8;
  uint64_t v1 = qword_1000446D0;
  uint64_t v2 = unk_1000446D8;
  int v3 = dword_1000446E0;
  if (qword_1000442A8 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044748;
  dword_100044788 = v0;
  qword_100044790 = v1;
  unk_100044798 = v2;
  dword_1000447A0 = v3;
  dword_1000447A8 = dword_100044748;
  qword_1000447B0 = qword_100044750;
  unk_1000447B8 = unk_100044758;
  dword_1000447C0 = dword_100044760;
  return result;
}

float sub_10000B32C()
{
  if (qword_100044298 != -1) {
    swift_once();
  }
  int v0 = dword_100044708;
  uint64_t v1 = qword_100044710;
  uint64_t v2 = unk_100044718;
  int v3 = dword_100044720;
  if (qword_1000442B0 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044768;
  dword_1000447C8 = v0;
  qword_1000447D0 = v1;
  unk_1000447D8 = v2;
  dword_1000447E0 = v3;
  dword_1000447E8 = dword_100044768;
  qword_1000447F0 = qword_100044770;
  unk_1000447F8 = unk_100044778;
  dword_100044800 = dword_100044780;
  return result;
}

float sub_10000B3F8()
{
  if (qword_100044290 != -1) {
    swift_once();
  }
  int v0 = dword_1000446E8;
  uint64_t v1 = qword_1000446F0;
  uint64_t v2 = unk_1000446F8;
  int v3 = dword_100044700;
  if (qword_1000442B0 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044768;
  dword_100044808 = v0;
  qword_100044810 = v1;
  unk_100044818 = v2;
  dword_100044820 = v3;
  dword_100044828 = dword_100044768;
  qword_100044830 = qword_100044770;
  unk_100044838 = unk_100044778;
  dword_100044840 = dword_100044780;
  return result;
}

float sub_10000B4C4()
{
  if (qword_1000442A0 != -1) {
    swift_once();
  }
  int v0 = dword_100044728;
  uint64_t v1 = qword_100044730;
  uint64_t v2 = unk_100044738;
  int v3 = dword_100044740;
  if (qword_1000442B0 != -1) {
    swift_once();
  }
  float result = *(float *)&dword_100044768;
  dword_100044848 = v0;
  qword_100044850 = v1;
  unk_100044858 = v2;
  dword_100044860 = v3;
  dword_100044868 = dword_100044768;
  qword_100044870 = qword_100044770;
  unk_100044878 = unk_100044778;
  dword_100044880 = dword_100044780;
  return result;
}

void sub_10000B590(char a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 3) > 1)
  {
    if (a1)
    {
      char v2 = sub_1000321A8();
      swift_bridgeObjectRelease();
      if ((v2 & 1) == 0)
      {
LABEL_9:
        id v4 = [self currentDevice];
        [v4 userInterfaceIdiom];

        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    id v3 = [self currentDevice];
    [v3 userInterfaceIdiom];

    goto LABEL_9;
  }
  if (a1)
  {
    sub_1000321A8();
    swift_bridgeObjectRelease();
    sub_1000321A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

float sub_10000B878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031668();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Class isa = sub_100031598().super.isa;
  sub_100031658();
  Class v9 = sub_100031648().super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  [*(id *)(a1 + *(int *)(type metadata accessor for Geotime() + 20)) coordinate];
  unint64_t v10 = NUNIMoonPhaseFor();

  if (v10 > 8 || ((1 << v10) & 0x23) != 0)
  {
    if (qword_1000442D0 != -1) {
      swift_once();
    }
    float v11 = &dword_100044868;
    BOOL v12 = (unint64_t)(a2 - 3) >= 2;
    NSString v13 = &dword_100044848;
  }
  else if (((1 << v10) & 0x4C) != 0)
  {
    if (qword_1000442C0 != -1) {
      swift_once();
    }
    float v11 = &dword_1000447E8;
    BOOL v12 = (unint64_t)(a2 - 3) >= 2;
    NSString v13 = &dword_1000447C8;
  }
  else
  {
    if (qword_1000442C8 != -1) {
      swift_once();
    }
    float v11 = &dword_100044828;
    BOOL v12 = (unint64_t)(a2 - 3) >= 2;
    NSString v13 = &dword_100044808;
  }
  if (!v12) {
    NSString v13 = v11;
  }
  return *(float *)v13;
}

void sub_10000BAFC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  char v5 = a2 & 1;
  switch(a1)
  {
    case 0:
      if ((a2 & 1) == 0) {
        goto LABEL_8;
      }
      if (qword_1000442B8 != -1) {
        goto LABEL_18;
      }
      break;
    case 1:
      if ((a2 & 1) == 0) {
        goto LABEL_8;
      }
      sub_10000B878(a3, a4);
      break;
    case 2:
      if (qword_100044248 != -1) {
        goto LABEL_18;
      }
      break;
    case 3:
      if (qword_100044240 != -1) {
        goto LABEL_18;
      }
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      if (qword_100044250 != -1) {
        goto LABEL_18;
      }
      break;
    default:
LABEL_8:
      if (qword_100044238 != -1) {
LABEL_18:
      }
        swift_once();
      break;
  }

  sub_10000B590(v5, a4);
}

void sub_10000BD84(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  char v7 = a2 & 1;
  if (a2)
  {
    char v8 = sub_1000321A8();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_8:
      sub_10000BAFC(a1, v7, a3, a4);
      return;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (a1 == 2) {
    goto LABEL_8;
  }
  if (a1 == 3)
  {
    if (qword_100044280 == -1) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (qword_100044278 != -1) {
LABEL_11:
  }
    swift_once();
LABEL_10:
  sub_10000B590(v7, a4);
}

uint64_t sub_10000BF54(void *a1, uint64_t a2)
{
  return sub_10000BF6C(a1, a2, (SEL *)&selRef_backgroundView);
}

uint64_t sub_10000BF60(void *a1, uint64_t a2)
{
  return sub_10000BF6C(a1, a2, (SEL *)&selRef_contentOverlayView);
}

uint64_t sub_10000BF6C(void *a1, uint64_t a2, SEL *a3)
{
  id v5 = [a1 *a3];
  [v5 bounds];

  objc_msgSend(objc_msgSend(a1, "environment"), "floatingObscurableBounds");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  swift_unknownObjectRelease();
  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  CGRectGetMinY(v23);
  objc_msgSend(objc_msgSend(a1, "environment"), "contentCutoutBounds");
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  swift_unknownObjectRelease();
  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  CGRectGetMinY(v24);
  return a2;
}

uint64_t sub_10000C0E4(char a1, uint64_t a2)
{
  if (qword_100044308 != -1) {
    swift_once();
  }
  if ((static DeviceUtilities.forceDisableForeground & 1) == 0)
  {
    id v5 = [self currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    if (v6)
    {
      if ((a1 & 1) == 0)
      {
        BOOL v4 = (unint64_t)(a2 - 3) < 2;
        char v7 = sub_1000321A8();
        swift_bridgeObjectRelease();
        if ((v7 & 1) == 0) {
          return v4;
        }
        return 1;
      }
    }
    else if ((a1 & 1) == 0)
    {
      char v8 = sub_1000321A8();
      swift_bridgeObjectRelease();
      return v8 & 1;
    }
    swift_bridgeObjectRelease();
    return 1;
  }
  return 0;
}

float sub_10000C228(uint64_t a1, char a2, void *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, float a7, float a8, float a9)
{
  return sub_10000C304(a1, a2, a3, a4, a7, a8, a9, a5, a6, (float (*)(uint64_t, void, char *, uint64_t, float, float, float))sub_10000BAFC);
}

uint64_t type metadata accessor for Geotime()
{
  uint64_t result = qword_1000448E0;
  if (!qword_1000448E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000C28C(uint64_t a1)
{
  uint64_t v2 = sub_1000048F0((uint64_t *)&unk_100045A90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

float sub_10000C2EC(uint64_t a1, char a2, void *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, float a7, float a8, float a9)
{
  return sub_10000C304(a1, a2, a3, a4, a7, a8, a9, a5, a6, (float (*)(uint64_t, void, char *, uint64_t, float, float, float))sub_10000BD84);
}

float sub_10000C304(uint64_t a1, char a2, void *a3, void (*a4)(uint64_t), float a5, float a6, float a7, uint64_t a8, uint64_t a9, float (*a10)(uint64_t, void, char *, uint64_t, float, float, float))
{
  uint64_t v33 = a9;
  id v34 = a10;
  uint64_t v32 = a1;
  uint64_t v16 = sub_1000048F0((uint64_t *)&unk_100045A90);
  __chkstk_darwin(v16 - 8);
  double v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000315F8();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  unint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for Geotime();
  uint64_t v24 = __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v31 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v19);
LABEL_6:
    sub_1000315D8();
    sub_10000C28C((uint64_t)v18);
    if (!a3) {
      goto LABEL_4;
    }
LABEL_7:
    id v27 = a3;
    goto LABEL_8;
  }
  a4(v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v18, 0, 1, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1) {
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v18, v19);
  if (a3) {
    goto LABEL_7;
  }
LABEL_4:
  id v27 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:37.33182 longitude:-122.03118];
LABEL_8:
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v26, v22, v19);
  *(void *)&v26[*(int *)(v23 + 20)] = v27;
  id v28 = a3;
  float v29 = v34(v32, a2 & 1, v26, v33, a5, a6, a7);
  sub_100009910((uint64_t)v26);
  return v29;
}

uint64_t *sub_10000C5EC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000315F8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    CGFloat v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void sub_10000C6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000315F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_10000C730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000315F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_10000C7B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000315F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t sub_10000C838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000315F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10000C8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000315F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t sub_10000C938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C94C);
}

uint64_t sub_10000C94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000315F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000CA0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000CA20);
}

uint64_t sub_10000CA20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000315F8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10000CADC()
{
  uint64_t result = sub_1000315F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10000CB74()
{
  unint64_t result = qword_100045C60;
  if (!qword_100045C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100045C60);
  }
  return result;
}

unint64_t sub_10000CBB4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000048F0((uint64_t *)&unk_100045270);
  uint64_t v2 = (void *)sub_100032148();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10001BEA8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
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

unint64_t sub_10000CCC8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000048F0(&qword_100045268);
  uint64_t v2 = (void *)sub_100032148();
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
    unint64_t result = sub_10001BEA8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
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

unint64_t sub_10000CDE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000048F0(&qword_100045260);
  uint64_t v2 = (void *)sub_100032148();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10001BEA8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_10000CF08(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000048F0((uint64_t *)&unk_100045210);
  uint64_t v2 = (void *)sub_100032148();
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
    unint64_t result = sub_10001BEA8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
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

uint64_t (*sub_10000D024())()
{
  return j__swift_endAccess;
}

float sub_10000D084()
{
  uint64_t v1 = v0;
  swift_retain();
  uint64_t v2 = sub_1000319B8();
  swift_release();
  id v3 = *(id *)(v0 + 16);
  uint64_t v4 = sub_10000BF54(v3, v2);
  float v6 = v5;
  float v8 = v7;
  float v10 = v9;
  uint64_t v29 = v4;

  uint64_t v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
  swift_beginAccess();
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  BOOL v14 = (void *)v11[2];
  uint64_t v15 = (void *)v11[3];
  uint64_t v16 = v11[4];
  uint64_t v17 = v11[5];
  if (v14 == (void *)1)
  {
    uint64_t v18 = v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
    uint64_t v19 = *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
    char v28 = *(unsigned char *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 8);
    uint64_t v21 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
    uint64_t v20 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
    unint64_t v22 = *(void (**)(uint64_t))(v1
                                         + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                         + 32);
    uint64_t v23 = *(void *)(v18 + 40);
    id v27 = v20;
    id v26 = v21;
    sub_10000633C((uint64_t)v22);
  }
  else
  {
    char v28 = v13 & 1;
    id v26 = (id)v11[2];
    id v27 = (id)v11[3];
    uint64_t v19 = *v11;
    uint64_t v21 = v14;
    unint64_t v22 = (void (*)(uint64_t))v16;
    uint64_t v23 = v17;
  }
  sub_10001C304(v12, v13, v14, v15, v16);
  float v24 = sub_10000C228(v19, v28, v21, v22, v23, v29, v6, v8, v10);

  sub_10000640C((uint64_t)v22);
  return v24;
}

float sub_10000D238()
{
  uint64_t v1 = v0;
  if (UIAccessibilityIsReduceMotionEnabled()) {
    return sub_10000D084();
  }
  swift_retain();
  uint64_t v3 = sub_1000319B8();
  swift_release();
  id v4 = *(id *)(v0 + 16);
  uint64_t v5 = sub_10000BF54(v4, v3);
  float v7 = v6;
  float v9 = v8;
  float v11 = v10;
  uint64_t v29 = v5;

  uint64_t v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
  swift_beginAccess();
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  uint64_t v15 = (void *)v12[2];
  uint64_t v16 = (void *)v12[3];
  uint64_t v17 = v12[4];
  uint64_t v18 = v12[5];
  if (v15 == (void *)1)
  {
    uint64_t v19 = v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
    uint64_t v20 = *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
    char v26 = *(unsigned char *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 8);
    unint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
    uint64_t v21 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
    uint64_t v23 = *(void (**)(uint64_t))(v1
                                         + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                         + 32);
    uint64_t v24 = *(void *)(v19 + 40);
    id v28 = v21;
    id v27 = v22;
    sub_10000633C((uint64_t)v23);
  }
  else
  {
    char v26 = v14 & 1;
    id v27 = (id)v12[2];
    id v28 = (id)v12[3];
    uint64_t v20 = *v12;
    unint64_t v22 = v15;
    uint64_t v23 = (void (*)(uint64_t))v17;
    uint64_t v24 = v18;
  }
  sub_10001C304(v13, v14, v15, v16, v17);
  float v2 = sub_10000C2EC(v20, v26, v22, v23, v24, v29, v7, v9, v11);

  sub_10000640C((uint64_t)v23);
  return v2;
}

uint64_t sub_10000D410()
{
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
    swift_beginAccess();
    uint64_t v3 = *v1;
    uint64_t v2 = v1[1];
    uint64_t v5 = (void *)v1[2];
    id v4 = (void *)v1[3];
    uint64_t v6 = *v1;
    float v7 = v5;
    uint64_t v8 = v1[4];
    float v9 = v4;
    uint64_t v16 = v8;
    if (v5 == (void *)1)
    {
      uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
      float v7 = *(void **)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      float v9 = *(void **)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
      uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 32);
      uint64_t v15 = v1[1];
      id v11 = v9;
      id v12 = v7;
      uint64_t v16 = v10;
      sub_10000633C(v10);
      uint64_t v2 = v15;
    }
    if (v6 == 2)
    {
      sub_10001C304(v3, v2, v5, v4, v8);
      sub_10000A428();
      sub_100031C08();

      sub_10000640C(v16);
      *(float *)&unsigned int v13 = v17;
      return v13;
    }
    sub_10001C304(v3, v2, v5, v4, v8);

    sub_10000640C(v16);
  }
  return 0;
}

void *sub_10000D590()
{
  uint64_t v1 = sub_100031B18();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t result = (void *)__chkstk_darwin(v1);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(char **)(v0 + 32);
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager;
  uint64_t v8 = *(void **)&v6[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
  if (!v8)
  {
    __break(1u);
    goto LABEL_17;
  }
  float v9 = v6;
  unsigned int v10 = [v8 authorizationStatus];
  unint64_t result = *(void **)&v6[v7];
  if (!result)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  unsigned int v11 = [result authorizationStatus];

  LODWORD(v6) = v10 == 3 || v11 == 4;
LABEL_10:
  uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
  sub_100031AC8();
  uint64_t v14 = sub_100031AF8();
  os_log_type_t v15 = sub_100031EF8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 67109376;
    v17[3] = v6;
    sub_100031FD8();
    *(_WORD *)(v16 + 8) = 1024;
    v17[2] = v13 != 0;
    sub_100031FD8();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "canShowLocation — isAuthorized: %{BOOL}d; haveLocation: %{BOOL}d",
      (uint8_t *)v16,
      0xEu);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  if (v13) {
    return (void *)v6;
  }
  else {
    return 0;
  }
}

void sub_10000D7A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(id *)(v0 + 16);
  char v7 = sub_100031EC8();

  if ((v7 & 1) == 0)
  {
    sub_100031AD8();
    uint64_t v8 = sub_100031AF8();
    os_log_type_t v9 = sub_100031F18();
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Setup location manager", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    unsigned int v11 = self;
    id v12 = [v11 defaultCenter];
    if (qword_1000442F0 != -1) {
      swift_once();
    }
    uint64_t v13 = qword_100046CF0;
    uint64_t v14 = swift_allocObject();
    swift_weakInit();
    uint64_t v29 = sub_10001D2EC;
    uint64_t v30 = v14;
    aBlock = _NSConcreteStackBlock;
    uint64_t v26 = 1107296256;
    id v27 = sub_1000196EC;
    id v28 = &unk_10003DB90;
    os_log_type_t v15 = _Block_copy(&aBlock);
    swift_release();
    id v16 = [v12 addObserverForName:v13 object:0 queue:0 usingBlock:v15];
    _Block_release(v15);
    swift_unknownObjectRelease();

    id v17 = [v11 defaultCenter];
    if (qword_1000442F8 != -1) {
      swift_once();
    }
    uint64_t v18 = qword_100046CF8;
    uint64_t v19 = swift_allocObject();
    swift_weakInit();
    uint64_t v29 = sub_10001D30C;
    uint64_t v30 = v19;
    aBlock = _NSConcreteStackBlock;
    uint64_t v26 = 1107296256;
    id v27 = sub_1000196EC;
    id v28 = &unk_10003DBB8;
    uint64_t v20 = _Block_copy(&aBlock);
    swift_release();
    id v21 = [v17 addObserverForName:v18 object:0 queue:0 usingBlock:v20];
    _Block_release(v20);
    swift_unknownObjectRelease();

    id v22 = objc_allocWithZone((Class)type metadata accessor for AegirLocationManager());
    uint64_t v23 = sub_1000220FC(0);
    uint64_t v24 = *(void **)(v1 + 32);
    *(void *)(v1 + 32) = v23;
  }
}

id *sub_10000DB78()
{
  uint64_t v1 = v0;
  swift_retain();
  sub_100031788();
  swift_release();
  sub_10000DE64();
  id v2 = [v0[3] vistaView];
  [v2 stopAnimation];

  sub_100031898();
  swift_retain();
  sub_100031978();
  swift_release();
  id v3 = [self defaultCenter];
  NSString v4 = sub_100031C28();
  [v3 postNotificationName:v4 object:0];

  uint64_t v5 = (char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState;
  uint64_t v6 = sub_100031848();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  char v7 = (char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_wakeState;
  uint64_t v8 = sub_100031A98();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  sub_100009A54(*(uint64_t *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration), *(uint64_t *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration + 8), *(id *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration + 16), *(id *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration + 24), *(uint64_t *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration + 32));
  swift_release();
  swift_release();
  os_log_type_t v9 = (char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_lastPulseDate;
  uint64_t v10 = sub_1000315F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  unsigned int v11 = *(id *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
  uint64_t v12 = *(uint64_t *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 32);

  sub_10000640C(v12);
  swift_release();

  objc_release(*(id *)((char *)v1
                     + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundDebugColorView));

  objc_release(*(id *)((char *)v1
                     + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingDebugColorView));

  swift_release();
  return v1;
}

void sub_10000DE64()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v1 + 32);
  if (v6)
  {
    char v7 = v6;
    sub_100031AD8();
    uint64_t v8 = sub_100031AF8();
    os_log_type_t v9 = sub_100031EF8();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "teardown location manager", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    id v11 = [self defaultCenter];
    [v11 removeObserver:v1];

    uint64_t v12 = qword_100044930;
    uint64_t v13 = off_100044938;
    swift_retain();
    swift_bridgeObjectRetain();
    v19._countAndFlagsBits = v12;
    v19._object = v13;
    sub_100031928(v19);
    swift_release();
    swift_bridgeObjectRelease();
    if (qword_1000442E8 != -1) {
      swift_once();
    }
    sub_100008F70(v2, (uint64_t)qword_100046CD8);
    uint64_t v14 = sub_100031AF8();
    os_log_type_t v15 = sub_100031F18();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Location manager stopUpdatingLocation.", v16, 2u);
      swift_slowDealloc();
    }

    id v17 = *(void **)&v7[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
    if (v17)
    {
      [v17 stopMonitoringSignificantLocationChanges];
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10000E104()
{
  sub_10000DB78();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10000E15C()
{
  return type metadata accessor for AegirRenderingCoordinator();
}

uint64_t type metadata accessor for AegirRenderingCoordinator()
{
  uint64_t result = qword_100044A90;
  if (!qword_100044A90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000E1B0()
{
  uint64_t result = sub_100031848();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100031A98();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_1000315F8();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

void sub_10000E358(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100031B18();
  uint64_t v68 = *(void *)(v4 - 8);
  uint64_t v69 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  char v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v62 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v62 - v11;
  uint64_t v13 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = a1;
  id v14 = a1;

  id v15 = v14;
  objc_msgSend(objc_msgSend(v15, "environment"), "contents");
  swift_unknownObjectRelease();
  swift_getObjectType();
  uint64_t v16 = sub_10001DCC4();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  swift_unknownObjectRelease();
  id v67 = v15;

  if (v20 == (void *)1)
  {
    sub_100031AD8();
    id v21 = sub_100031AF8();
    os_log_type_t v22 = sub_100031F18();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Unable to create configuration from renderer", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v68 + 8))(v7, v69);
    return;
  }
  uint64_t v72 = v16;
  uint64_t v64 = v18 & 1;
  char v73 = v18 & 1;
  id v74 = v20;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  sub_100031AD8();
  sub_10001D6BC(v16, v18, v20);
  id v24 = v20;
  uint64_t v25 = sub_100031AF8();
  os_log_type_t v26 = sub_100031F18();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v65 = v10;
  uint64_t v66 = v20;
  if (v27)
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    uint64_t v71 = v62;
    *(_DWORD *)id v28 = 136315138;
    uint64_t v63 = v2;
    uint64_t v29 = sub_10001D6EC();
    uint64_t v70 = sub_10001B510(v29, v30, &v71);
    uint64_t v2 = v63;
    sub_100031FD8();
    swift_bridgeObjectRelease();
    sub_10001D6CC(v16, v18, v20);
    uint64_t v10 = v65;
    sub_10001D6CC(v16, v18, v20);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "apply vista: %s", v28, 0xCu);
    swift_arrayDestroy();
    uint64_t v31 = v68;
    swift_slowDealloc();
    uint64_t v32 = v31;
    uint64_t v33 = v69;
    swift_slowDealloc();

    id v34 = *(void (**)(char *, uint64_t))(v32 + 8);
    uint64_t v35 = v12;
    uint64_t v36 = v33;
    v34(v35, v33);
  }
  else
  {
    sub_10001D6CC(v16, v18, v20);
    sub_10001D6CC(v16, v18, v20);

    id v34 = *(void (**)(char *, uint64_t))(v68 + 8);
    id v37 = v12;
    uint64_t v36 = v69;
    v34(v37, v69);
  }
  uint64_t v38 = v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
  if (v16 != *(void *)(v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration)) {
    goto LABEL_25;
  }
  uint64_t v63 = v18;
  uint64_t v39 = v16;
  uint64_t v41 = *(void **)(v38 + 16);
  id v40 = *(void **)(v38 + 24);
  uint64_t v42 = *(void *)(v38 + 32);
  int v43 = *(unsigned __int8 *)(v38 + 8);
  if (v64) {
    uint64_t v44 = 0x6C6961746544;
  }
  else {
    uint64_t v44 = 1819047238;
  }
  if (v64) {
    unint64_t v45 = 0xE600000000000000;
  }
  else {
    unint64_t v45 = 0xE400000000000000;
  }
  if (v43) {
    uint64_t v46 = 0x6C6961746544;
  }
  else {
    uint64_t v46 = 1819047238;
  }
  if (v43) {
    unint64_t v47 = 0xE600000000000000;
  }
  else {
    unint64_t v47 = 0xE400000000000000;
  }
  if (v44 != v46 || v45 != v47)
  {
    char v50 = sub_1000321A8();
    id v51 = v40;
    id v52 = v41;
    sub_10000633C(v42);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000640C(v42);
    uint64_t v36 = v69;
    uint64_t v16 = v39;
    uint64_t v18 = v63;
    uint64_t v10 = v65;
    if (v50) {
      goto LABEL_28;
    }
LABEL_25:
    sub_100031AD8();
    Swift::String v53 = sub_100031AF8();
    os_log_type_t v54 = sub_100031F18();
    if (os_log_type_enabled(v53, v54))
    {
      Swift::String v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v55 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Applying new configuration", v55, 2u);
      swift_slowDealloc();
    }

    v34(v10, v36);
    [*(id *)(v2 + 24) disableCloudDataFetch:sub_100031EC8() & 1];
    sub_10000E9C0(&v72);
    goto LABEL_28;
  }
  id v48 = v40;
  id v49 = v41;
  sub_10000633C(v42);

  swift_bridgeObjectRelease_n();
  sub_10000640C(v42);
  uint64_t v16 = v39;
  uint64_t v18 = v63;
LABEL_28:
  Swift::String v56 = *(void **)(v2 + 24);
  id v57 = *(id *)(v2 + 16);
  char v58 = sub_100031EC8();

  [v56 disableCloudDataFetch:v58 & 1];
  id v59 = *(id *)(v2 + 16);
  char v60 = sub_100031E88();

  if (v60) {
    sub_100010860();
  }
  else {
    sub_100011EB0();
  }
  id v61 = [v56 vistaView];
  [v61 purgeUnused];

  sub_10001D6CC(v16, v18, v66);
}

id sub_10000E9C0(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000048F0(&qword_100045090);
  __chkstk_darwin(v4 - 8);
  uint64_t v77 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100031B18();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AD8();
  uint64_t v10 = (void *)a1[2];
  sub_10001D0A8((uint64_t)(a1 + 3), (uint64_t)&v81, &qword_100045100);
  uint64_t v11 = a1[4];
  id v12 = v10;
  sub_1000063B4(&v81);
  sub_10000633C(v11);
  id v13 = v12;
  sub_1000063B4(&v81);
  sub_10000633C(v11);
  id v14 = sub_100031AF8();
  os_log_type_t v15 = sub_100031F18();
  int v76 = v15;
  BOOL v16 = os_log_type_enabled(v14, v15);
  id v78 = v13;
  if (v16)
  {
    uint64_t v75 = v7;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    uint64_t v80 = v73;
    uint64_t v71 = v17;
    os_log_t v72 = v14;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v70 = v17 + 4;
    uint64_t v18 = *((unsigned __int8 *)a1 + 8);
    uint64_t v74 = v6;
    uint64_t v19 = v2;
    uint64_t v20 = *a1;
    id v21 = v13;
    sub_1000063B4(&v81);
    sub_10000633C(v11);
    uint64_t v22 = v20;
    uint64_t v2 = v19;
    uint64_t v23 = sub_100008E40(v22, v18, v10);
    unint64_t v25 = v24;

    sub_1000063E0(&v81);
    sub_10000640C(v11);
    uint64_t v79 = sub_10001B510(v23, v25, &v80);
    sub_100031FD8();

    swift_bridgeObjectRelease();
    sub_1000063E0(&v81);
    sub_10000640C(v11);

    sub_1000063E0(&v81);
    sub_10000640C(v11);
    os_log_t v26 = v72;
    _os_log_impl((void *)&_mh_execute_header, v72, (os_log_type_t)v76, "Applying configuration: %s", v71, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v27 = v74;
    (*(void (**)(char *))(v75 + 8))(v9);
  }
  else
  {

    sub_1000063E0(&v81);
    sub_10000640C(v11);

    sub_1000063E0(&v81);
    sub_10000640C(v11);

    uint64_t v27 = v6;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  *(unsigned char *)(v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isCurrentConfigurationChange) = 1;
  uint64_t v28 = v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
  uint64_t v29 = *a1;
  if (*(void *)(v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration) != *a1) {
    [*(id *)(v2 + 24) setVista:*a1];
  }
  id v30 = [*(id *)(v2 + 24) vistaView];
  [v30 updateLightingPreference:v29 == 2];

  uint64_t v31 = *(void **)(v28 + 16);
  uint64_t v32 = *(void **)(v28 + 24);
  uint64_t v33 = *(void *)(v28 + 32);
  long long v34 = *((_OWORD *)a1 + 1);
  *(_OWORD *)uint64_t v28 = *(_OWORD *)a1;
  *(_OWORD *)(v28 + 16) = v34;
  *(_OWORD *)(v28 + 32) = *((_OWORD *)a1 + 2);
  id v35 = v78;
  sub_1000063B4(&v81);
  sub_10000633C(v11);

  sub_10000640C(v33);
  if (*(void *)v28 >= 3uLL)
  {
    uint64_t v47 = qword_100044950;
    id v48 = off_100044958;
    swift_retain();
    swift_bridgeObjectRetain();
    v82._countAndFlagsBits = v47;
    v82._object = v48;
    sub_100031928(v82);
    swift_release();
    swift_bridgeObjectRelease();
    id v49 = *(void **)(v2 + 32);
    if (!v49)
    {
LABEL_24:
      id v54 = *(id *)(v2 + 16);
      swift_retain();
      uint64_t v55 = sub_1000319B8();
      swift_release();
      uint64_t v56 = sub_10000BF54(v54, v55);
      unsigned int v58 = v57;
      unsigned int v60 = v59;
      unsigned int v62 = v61;
      uint64_t v63 = v56;

      uint64_t v64 = v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_rotationStartEnvironment;
      *(void *)uint64_t v64 = v58 | ((unint64_t)v60 << 32);
      *(void *)(v64 + 8) = v62;
      *(void *)(v64 + 16) = v63;
      *(unsigned char *)(v64 + 24) = 0;
      uint64_t v65 = sub_100031DE8();
      uint64_t v66 = (uint64_t)v77;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v77, 1, 1, v65);
      uint64_t v67 = swift_allocObject();
      swift_weakInit();
      sub_100031DC8();
      swift_retain();
      uint64_t v68 = sub_100031DB8();
      uint64_t v69 = swift_allocObject();
      *(void *)(v69 + 16) = v68;
      *(void *)(v69 + 24) = &protocol witness table for MainActor;
      *(void *)(v69 + 32) = v67;
      *(unsigned char *)(v69 + 40) = 1;
      swift_release();
      sub_10001025C(v66, (uint64_t)&unk_100045250, v69);
      swift_release();
      return sub_100015FF0();
    }
    uint64_t v50 = qword_1000442E8;
    uint64_t v42 = v49;
    if (v50 != -1) {
      swift_once();
    }
    sub_100008F70(v27, (uint64_t)qword_100046CD8);
    id v51 = sub_100031AF8();
    os_log_type_t v52 = sub_100031F18();
    if (os_log_type_enabled(v51, v52))
    {
      Swift::String v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Location manager stopUpdatingLocation.", v53, 2u);
      swift_slowDealloc();
    }

    id result = *(id *)&v42[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
    if (result)
    {
      [result stopMonitoringSignificantLocationChanges];
      goto LABEL_23;
    }
  }
  else
  {
    id v36 = *(id *)(v2 + 16);
    char v37 = sub_100031E88();

    if ((v37 & 1) == 0)
    {
      uint64_t v38 = *(void **)(v2 + 16);
      swift_retain();
      id v39 = v38;
      swift_bridgeObjectRetain();
      sub_100031968();
      swift_release();

      swift_bridgeObjectRelease();
    }
    id v40 = *(void **)(v2 + 32);
    if (!v40) {
      goto LABEL_24;
    }
    uint64_t v41 = qword_1000442E8;
    uint64_t v42 = v40;
    if (v41 != -1) {
      swift_once();
    }
    sub_100008F70(v27, (uint64_t)qword_100046CD8);
    int v43 = sub_100031AF8();
    os_log_type_t v44 = sub_100031F18();
    if (os_log_type_enabled(v43, v44))
    {
      unint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Location manager startUpdatingLocation", v45, 2u);
      swift_slowDealloc();
    }

    id result = *(id *)&v42[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
    if (result)
    {
      [result _startMonitoringSignificantLocationChangesOfDistance:1 withPowerBudget:50000.0];
LABEL_23:

      goto LABEL_24;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F1FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 172) = a5;
  *(void *)(v5 + 64) = a4;
  uint64_t v6 = sub_100031B18();
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = *(void *)(v6 - 8);
  *(void *)(v5 + 88) = swift_task_alloc();
  *(void *)(v5 + 96) = swift_task_alloc();
  sub_100031DC8();
  *(void *)(v5 + 104) = sub_100031DB8();
  uint64_t v8 = sub_100031DA8();
  *(void *)(v5 + 112) = v8;
  *(void *)(v5 + 120) = v7;
  return _swift_task_switch(sub_10000F304, v8, v7);
}

uint64_t sub_10000F304()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 128) = Strong;
  if (!Strong)
  {
LABEL_34:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::String v53 = *(uint64_t (**)(void))(v0 + 8);
    return v53();
  }
  *(void *)(v0 + 136) = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tokenManager;
  uint64_t v2 = *(void **)(Strong + 16);
  swift_retain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  sub_100031968();
  swift_bridgeObjectRelease();

  swift_release();
  swift_retain();
  uint64_t v4 = sub_1000319B8();
  *(void *)(v0 + 144) = v4;
  swift_release();
  if (v4 == 1)
  {
    BOOL v5 = 1;
    if ((*(unsigned char *)(v0 + 172) & 1) == 0)
    {
LABEL_4:
      swift_release();
      sub_100031AD8();
      swift_retain();
      uint64_t v6 = sub_100031AF8();
      os_log_type_t v7 = sub_100031F18();
      BOOL v8 = os_log_type_enabled(v6, v7);
      uint64_t v9 = *(void *)(v0 + 128);
      if (v8)
      {
        uint64_t v10 = swift_slowAlloc();
        *(_DWORD *)uint64_t v10 = 67109376;
        *(_DWORD *)(v0 + 164) = *(unsigned __int8 *)(v9
                                                   + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_hasPortraitWidgets);
        sub_100031FD8();
        swift_release();
        *(_WORD *)(v10 + 8) = 1024;
        *(_DWORD *)(v0 + 168) = v5;
        sub_100031FD8();
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Renderer hasPortraitWidgets? %{BOOL}d isPortrait? %{BOOL}d", (uint8_t *)v10, 0xEu);
        swift_slowDealloc();
      }
      else
      {
        swift_release();
      }

      uint64_t v12 = *(void *)(v0 + 128);
      id v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 80) + 8);
      v13(*(void *)(v0 + 96), *(void *)(v0 + 72));
      id v14 = (uint64_t *)(v12 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
      swift_beginAccess();
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      uint64_t v18 = (void *)v14[2];
      uint64_t v17 = (void *)v14[3];
      uint64_t v19 = v14[4];
      unsigned int v58 = v13;
      if (v18 == (void *)1)
      {
        uint64_t v20 = *(void *)(v0 + 128) + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
        char v57 = *(unsigned char *)(v20 + 8);
        id v21 = *(void **)(v20 + 16);
        uint64_t v22 = *(void *)(v20 + 32);
        uint64_t v55 = v15;
        uint64_t v23 = v16;
        unint64_t v24 = v17;
        id v56 = *(id *)(v20 + 24);
        id v25 = v21;
        sub_10000633C(v22);
        uint64_t v17 = v24;
        uint64_t v16 = v23;
        uint64_t v15 = v55;
      }
      else
      {
        char v57 = v16 & 1;
        id v56 = (id)v14[3];
        id v25 = (id)v14[2];
        uint64_t v22 = v14[4];
      }
      uint64_t v26 = *(void *)(v0 + 144);
      uint64_t v27 = *(void *)(v0 + 128);
      sub_10001C304(v15, v16, v18, v17, v19);
      LOBYTE(v26) = sub_10000C0E4(v57, v26);

      sub_10000640C(v22);
      char v28 = *(unsigned char *)(v27 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_hasPortraitWidgets) & v5 | v26 ^ 1;
      sub_100031AD8();
      uint64_t v29 = sub_100031AF8();
      os_log_type_t v30 = sub_100031F18();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v31 = 67109120;
        *(_DWORD *)(v0 + 160) = v28 & 1;
        sub_100031FD8();
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "foreground should be hidden: %{BOOL}d", v31, 8u);
        swift_slowDealloc();
      }
      uint64_t v32 = *(void *)(v0 + 128);
      uint64_t v33 = *(void *)(v0 + 88);
      uint64_t v34 = *(void *)(v0 + 72);

      v58(v33, v34);
      id v35 = [*(id *)(v32 + 24) vistaView];
      id v36 = [v35 quadViews];

      sub_100006718();
      unint64_t v37 = sub_100031D58();

      if (v37 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v38 = (void *)sub_100032118();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v38 = *(void **)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      if (v38)
      {
        if ((v37 & 0xC000000000000001) != 0)
        {
          id v39 = (id)sub_100032088();
        }
        else
        {
          if (!*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            JUMPOUT(0x10000FAC4);
          }
          id v39 = *(id *)(v37 + 32);
        }
        uint64_t v38 = v39;
      }
      swift_bridgeObjectRelease();
      [v38 setHidden:v28 & 1];

      if ((v28 & 1) == 0)
      {
        id v40 = [*(id *)(v32 + 24) vistaView];
        [v40 frame];
        double v42 = v41;
        double v44 = v43;

        double v45 = v44 / 3.0;
        id v46 = [self currentDevice];
        id v47 = [v46 userInterfaceIdiom];

        if (v47)
        {
          double v48 = 120.0;
          double v49 = v44 / 3.0;
          double v42 = v42 / 3.0;
          switch(*(void *)(v0 + 144))
          {
            case 1:
              double v48 = v42 + -50.0;
              double v49 = 100.0;
              double v42 = v42 + 100.0;
              break;
            case 2:
              double v48 = v42 + -50.0;
              double v49 = v45 + v45 + -100.0;
              double v42 = v42 + 100.0;
              break;
            case 3:
              double v48 = v42 + v42 + -120.0;
              double v49 = v44 / 3.0;
              break;
            case 4:
              break;
            default:
              double v45 = v44;
              break;
          }
        }
        else
        {
          double v48 = 0.0;
          double v49 = 0.0;
        }
        id v50 = objc_msgSend(*(id *)(v32 + 24), "vistaView", v55);
        objc_msgSend(v50, "updatePortalLayerBounds:", v48, v49, v42, v45);
      }
      uint64_t v51 = qword_100044940;
      os_log_type_t v52 = off_100044948;
      swift_retain();
      swift_bridgeObjectRetain();
      v60._countAndFlagsBits = v51;
      v60._object = v52;
      sub_100031928(v60);
      swift_bridgeObjectRelease();
      swift_release();
      sub_100014818(0);
      goto LABEL_34;
    }
  }
  else
  {
    BOOL v5 = v4 == 2;
    if (!*(unsigned char *)(v0 + 172)) {
      goto LABEL_4;
    }
  }
  *(unsigned char *)(v0 + 173) = v5;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10000FAD4;
  return _swift_task_switch(sub_10001CA60, 0, 0);
}

uint64_t sub_10000FAD4(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 174) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 120);
  uint64_t v4 = *(void *)(v2 + 112);
  return _swift_task_switch(sub_10000FBFC, v4, v3);
}

uint64_t sub_10000FBFC()
{
  char v1 = *(unsigned char *)(v0 + 174);
  uint64_t v2 = *(void *)(v0 + 128);
  swift_release();
  *(unsigned char *)(v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_hasPortraitWidgets) = v1;
  int v3 = *(unsigned __int8 *)(v0 + 173);
  sub_100031AD8();
  swift_retain();
  uint64_t v4 = sub_100031AF8();
  os_log_type_t v5 = sub_100031F18();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(v0 + 128);
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109376;
    *(_DWORD *)(v0 + 164) = *(unsigned __int8 *)(v6
                                               + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_hasPortraitWidgets);
    sub_100031FD8();
    swift_release();
    *(_WORD *)(v7 + 8) = 1024;
    *(_DWORD *)(v0 + 168) = v3;
    sub_100031FD8();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Renderer hasPortraitWidgets? %{BOOL}d isPortrait? %{BOOL}d", (uint8_t *)v7, 0xEu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  uint64_t v8 = *(void *)(v0 + 128);
  Swift::String v53 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 80) + 8);
  v53(*(void *)(v0 + 96), *(void *)(v0 + 72));
  uint64_t v9 = (uint64_t *)(v8 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
  swift_beginAccess();
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  id v13 = (void *)v9[2];
  uint64_t v12 = (void *)v9[3];
  uint64_t v14 = v9[4];
  if (v13 == (void *)1)
  {
    uint64_t v15 = *(void *)(v0 + 128) + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
    char v52 = *(unsigned char *)(v15 + 8);
    uint64_t v16 = *(void **)(v15 + 16);
    uint64_t v17 = *(void *)(v15 + 32);
    uint64_t v50 = v10;
    uint64_t v18 = v11;
    uint64_t v19 = v12;
    id v51 = *(id *)(v15 + 24);
    id v20 = v16;
    sub_10000633C(v17);
    uint64_t v12 = v19;
    uint64_t v11 = v18;
    uint64_t v10 = v50;
  }
  else
  {
    char v52 = v11 & 1;
    id v51 = (id)v9[3];
    id v20 = (id)v9[2];
    uint64_t v17 = v9[4];
  }
  uint64_t v21 = *(void *)(v0 + 144);
  uint64_t v22 = *(void *)(v0 + 128);
  sub_10001C304(v10, v11, v13, v12, v14);
  LOBYTE(v21) = sub_10000C0E4(v52, v21);

  sub_10000640C(v17);
  char v23 = *(unsigned char *)(v22 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_hasPortraitWidgets) & v3 | v21 ^ 1;
  sub_100031AD8();
  unint64_t v24 = sub_100031AF8();
  os_log_type_t v25 = sub_100031F18();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 67109120;
    *(_DWORD *)(v0 + 160) = v23 & 1;
    sub_100031FD8();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "foreground should be hidden: %{BOOL}d", v26, 8u);
    swift_slowDealloc();
  }
  uint64_t v27 = *(void *)(v0 + 128);
  uint64_t v28 = *(void *)(v0 + 88);
  uint64_t v29 = *(void *)(v0 + 72);

  v53(v28, v29);
  id v30 = [*(id *)(v27 + 24) vistaView];
  id v31 = [v30 quadViews];

  sub_100006718();
  unint64_t v32 = sub_100031D58();

  if (v32 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = (void *)sub_100032118();
    swift_bridgeObjectRelease();
    if (!v33) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v33 = *(void **)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v33) {
      goto LABEL_15;
    }
  }
  if ((v32 & 0xC000000000000001) != 0)
  {
    id v34 = (id)sub_100032088();
  }
  else
  {
    if (!*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      JUMPOUT(0x10001024CLL);
    }
    id v34 = *(id *)(v32 + 32);
  }
  uint64_t v33 = v34;
LABEL_15:
  swift_bridgeObjectRelease();
  [v33 setHidden:v23 & 1];

  if ((v23 & 1) == 0)
  {
    id v35 = [*(id *)(v27 + 24) vistaView];
    [v35 frame];
    double v37 = v36;
    double v39 = v38;

    double v40 = v39 / 3.0;
    id v41 = [self currentDevice];
    id v42 = [v41 userInterfaceIdiom];

    if (v42)
    {
      double v43 = 120.0;
      double v44 = v39 / 3.0;
      double v37 = v37 / 3.0;
      switch(*(void *)(v0 + 144))
      {
        case 1:
          double v43 = v37 + -50.0;
          double v44 = 100.0;
          double v37 = v37 + 100.0;
          break;
        case 2:
          double v43 = v37 + -50.0;
          double v44 = v40 + v40 + -100.0;
          double v37 = v37 + 100.0;
          break;
        case 3:
          double v43 = v37 + v37 + -120.0;
          double v44 = v39 / 3.0;
          break;
        case 4:
          break;
        default:
          double v40 = v39;
          break;
      }
    }
    else
    {
      double v43 = 0.0;
      double v44 = 0.0;
    }
    id v45 = [*(id *)(v27 + 24) vistaView];
    objc_msgSend(v45, "updatePortalLayerBounds:", v43, v44, v37, v40);
  }
  uint64_t v46 = qword_100044940;
  id v47 = off_100044948;
  swift_retain();
  swift_bridgeObjectRetain();
  v55._countAndFlagsBits = v46;
  v55._object = v47;
  sub_100031928(v55);
  swift_bridgeObjectRelease();
  swift_release();
  sub_100014818(0);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  double v48 = *(uint64_t (**)(void))(v0 + 8);
  return v48();
}

uint64_t sub_10001025C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100031DE8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100031DD8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000098B4(a1, &qword_100045090);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100031DA8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100010408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[20] = a2;
  v3[21] = a3;
  v3[19] = a1;
  return _swift_task_switch(sub_10001042C, 0, 0);
}

uint64_t sub_10001042C()
{
  uint64_t v2 = (void *)v0[20];
  uint64_t v1 = v0[21];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10001052C;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10001060C;
  v0[13] = &unk_10003DB28;
  v0[14] = v3;
  [v2 fetchLockScreenContentCutoutBoundsForOrientation:v1 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10001052C()
{
  return _swift_task_switch(sub_10001D6DC, 0, 0);
}

uint64_t sub_10001060C(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5 = *(double **)(*(void *)(*(void *)(a1 + 32) + 64) + 40);
  *uint64_t v5 = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  return _swift_continuation_resume();
}

uint64_t sub_100010634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[20] = a2;
  v3[21] = a3;
  v3[19] = a1;
  return _swift_task_switch(sub_100010658, 0, 0);
}

uint64_t sub_100010658()
{
  uint64_t v2 = (void *)v0[20];
  uint64_t v1 = v0[21];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100010758;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10001060C;
  v0[13] = &unk_10003DB10;
  v0[14] = v3;
  [v2 fetchMaximalLockScreenContentCutoutBoundsForOrientation:v1 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100010758()
{
  return _swift_task_switch(sub_100010838, 0, 0);
}

uint64_t sub_100010838()
{
  uint64_t v1 = *(_OWORD **)(v0 + 152);
  long long v2 = *(_OWORD *)(v0 + 136);
  _OWORD *v1 = *(_OWORD *)(v0 + 120);
  v1[1] = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100010860()
{
  uint64_t v1 = v0;
  uint64_t v213 = sub_100031B18();
  uint64_t v2 = *(void *)(v213 - 8);
  uint64_t v3 = __chkstk_darwin(v213);
  uint64_t v5 = (char *)&v189 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  v203 = (char *)&v189 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v208 = (uint64_t *)((char *)&v189 - v9);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v189 - v11;
  __chkstk_darwin(v10);
  v211 = (char *)&v189 - v13;
  v209 = (void *)sub_100031848();
  uint64_t v205 = *(v209 - 1);
  uint64_t v14 = __chkstk_darwin(v209);
  v200 = (char *)&v189 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v189 - v16;
  uint64_t v18 = sub_1000048F0(&qword_100045110);
  __chkstk_darwin(v18 - 8);
  id v20 = (char *)&v189 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100031858();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  v207 = (char *)&v189 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v189 - v25;
  id v27 = *(id *)(v0 + 16);
  sub_100031EA8();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1) {
    return sub_1000098B4((uint64_t)v20, &qword_100045110);
  }
  v196 = v12;
  uint64_t v204 = v2;
  v195 = v5;
  uint64_t v199 = v22;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v210 = v26;
  v29(v26, v20, v21);
  uint64_t v30 = *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
  LODWORD(v206) = *(unsigned __int8 *)(v1
                                     + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                     + 8);
  unint64_t v32 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
  id v31 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
  uint64_t v34 = *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 32);
  uint64_t v33 = *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 40);
  uint64_t v197 = v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
  id v35 = *(void **)(v1 + 16);
  id v36 = v31;
  id v202 = v32;
  *(void *)&long long v212 = v34;
  *((void *)&v212 + 1) = v33;
  sub_10000633C(v34);
  id v37 = v35;
  LOBYTE(v35) = sub_100031EC8();

  double v38 = (SEL *)&unk_100043000;
  uint64_t v198 = v21;
  if ((v35 & 1) == 0)
  {
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive) == 1)
    {
      *(unsigned char *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive) = 0;
      uint64_t v39 = qword_100044960;
      double v40 = off_100044968;
      swift_retain();
      swift_bridgeObjectRetain();
      v224._countAndFlagsBits = v39;
      v224._object = v40;
      sub_100031928(v224);
      swift_release();
      swift_bridgeObjectRelease();
      swift_retain();
      sub_1000317B8();
      swift_release();
      double v38 = (SEL *)&unk_100043000;
    }
    uint64_t v41 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista;
    if (*(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista) != 2
      || *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista) != 2)
    {
      id v42 = (uint64_t *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
      swift_beginAccess();
      uint64_t v43 = *v42;
      uint64_t v44 = v42[1];
      id v45 = (void *)v42[2];
      uint64_t v46 = (void *)v42[3];
      uint64_t v47 = v42[4];
      *id v42 = 0;
      v42[1] = 0;
      v42[2] = 1;
      v42[3] = 0;
      v42[4] = 0;
      v42[5] = 0;
      sub_100009A54(v43, v44, v45, v46, v47);
      *(void *)(v1 + v41) = 2;
      *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista) = 2;
      double v48 = *(void **)(v1 + 24);
      [v48 setVista:2];
      id v49 = *(id *)(v1 + 16);
      sub_100031E98();

      LOBYTE(v49) = sub_100031828();
      uint64_t v50 = *(void (**)(char *, void *))(v205 + 8);
      v50(v17, v209);
      if ((v49 & 1) != 0
        || (id v51 = *(id *)(v1 + 16),
            char v52 = v200,
            sub_100031E98(),
            v51,
            sub_100031838(),
            double v54 = v53,
            v50(v52, v209),
            v54 < 0.01))
      {
        float v55 = sub_10000D084();
      }
      else
      {
        float v55 = sub_10000D238();
      }
      *(float *)&long long v219 = v55;
      *((void *)&v219 + 1) = v56;
      *(void *)&long long v220 = v57;
      DWORD2(v220) = v58;
      [v48 applyStyleDefinition:&v219];
      uint64_t v59 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask;
      if (*(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask))
      {
        swift_retain();
        sub_1000048F0(&qword_1000454C0);
        sub_100031DF8();
        *(void *)(v1 + v59) = 0;
        swift_release();
        uint64_t v60 = qword_100044970;
        unsigned int v61 = off_100044978;
        swift_retain();
        swift_bridgeObjectRetain();
        v225._countAndFlagsBits = v60;
        v225._object = v61;
        sub_100031928(v225);
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
      }
      if ([v48 mode] != (id)1) {
        [v48 applyMode:1];
      }
      id v62 = [v48 vistaView];
      [v62 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];

      uint64_t v21 = v198;
      double v38 = (SEL *)&unk_100043000;
    }
  }
  uint64_t v63 = *(void **)(v1 + 24);
  if ([v63 v38[154]] != (id)1) {
    [v63 applyMode:1];
  }
  id v64 = objc_msgSend(objc_msgSend(*(id *)(v1 + 16), "environment"), "deviceOrientation");
  swift_unknownObjectRelease();
  id v65 = *(id *)(v1 + 16);
  uint64_t v66 = sub_10000BF54(v65, (uint64_t)v64);
  unsigned int v68 = v67;
  unsigned int v70 = v69;
  int v72 = v71;
  uint64_t v73 = v66;

  *(void *)&long long v219 = v30;
  BYTE8(v219) = (_BYTE)v206;
  *(void *)&long long v220 = v32;
  *((void *)&v220 + 1) = v31;
  uint64_t v74 = v212;
  long long v221 = v212;
  *(void *)&long long v222 = __PAIR64__(v70, v68);
  DWORD2(v222) = v72;
  uint64_t v223 = v73;
  id v202 = v202;
  id v201 = v36;
  sub_10000633C(v74);
  uint64_t v75 = (uint64_t)v210;
  sub_10000710C((uint64_t)v210);
  uint64_t v77 = v76;
  id v78 = v211;
  sub_100031AC8();
  uint64_t v79 = v199;
  uint64_t v80 = v207;
  (*(void (**)(char *, uint64_t, uint64_t))(v199 + 16))(v207, v75, v21);
  swift_retain_n();
  id v81 = v77;
  Swift::String v82 = sub_100031AF8();
  int v83 = sub_100031EF8();
  BOOL v84 = os_log_type_enabled(v82, (os_log_type_t)v83);
  id v206 = v81;
  if (v84)
  {
    v190 = v82;
    int v193 = v83;
    id v194 = v64;
    uint64_t v85 = swift_slowAlloc();
    v86 = (void *)swift_slowAlloc();
    uint64_t v191 = swift_slowAlloc();
    *(void *)&long long v216 = v191;
    *(_DWORD *)uint64_t v85 = 138413058;
    uint64_t v87 = v21;
    v88 = *(void **)(v1 + 16);
    uint64_t v215 = (uint64_t)v88;
    id v89 = v88;
    sub_100031FD8();
    v192 = v86;
    void *v86 = v88;
    swift_release_n();
    *(_WORD *)(v85 + 12) = 2080;
    sub_10001D168(&qword_100045130, (void (*)(uint64_t))&type metadata accessor for SnapshotType);
    uint64_t v90 = sub_100032188();
    uint64_t v215 = sub_10001B510(v90, v91, (uint64_t *)&v216);
    sub_100031FD8();
    swift_bridgeObjectRelease();
    v207 = *(char **)(v79 + 8);
    ((void (*)(char *, uint64_t))v207)(v80, v87);
    *(_WORD *)(v85 + 22) = 2080;
    id v92 = *(id *)(v1 + 16);
    id v93 = [v92 environment];
    v214 = &OBJC_PROTOCOL___PRPosterRenderingEnvironment_Private;
    v94 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v94)
    {
      unsigned __int8 v95 = [v94 isFloatingViewSnapshot];

      swift_unknownObjectRelease();
      id v96 = v206;
      uint64_t v97 = v197;
      v98 = v190;
      if (v95)
      {
        unint64_t v99 = 0xE800000000000000;
        uint64_t v100 = 0x676E6974616F6C66;
LABEL_26:
        uint64_t v215 = sub_10001B510(v100, v99, (uint64_t *)&v216);
        sub_100031FD8();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v85 + 32) = 2112;
        uint64_t v215 = (uint64_t)v96;
        id v101 = v96;
        sub_100031FD8();
        v192[1] = v96;

        _os_log_impl((void *)&_mh_execute_header, v98, (os_log_type_t)v193, "_doSnapshot(with: %@ for %s (%s) with snapshotKey: %@", (uint8_t *)v85, 0x2Au);
        sub_1000048F0(&qword_100045128);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v102 = v211;
        v211 = *(char **)(v204 + 8);
        ((void (*)(char *, uint64_t))v211)(v102, v213);
        id v64 = v194;
        goto LABEL_27;
      }
    }
    else
    {

      swift_unknownObjectRelease();
      id v96 = v206;
      uint64_t v97 = v197;
      v98 = v190;
    }
    unint64_t v99 = 0xEA0000000000646ELL;
    uint64_t v100 = 0x756F72676B636162;
    goto LABEL_26;
  }
  swift_release_n();
  v207 = *(char **)(v79 + 8);
  ((void (*)(char *, uint64_t))v207)(v80, v21);

  swift_release_n();
  v211 = *(char **)(v204 + 8);
  ((void (*)(char *, uint64_t))v211)(v78, v213);
  uint64_t v97 = v197;
LABEL_27:
  char v103 = sub_10000C0E4(*(unsigned char *)(v97 + 8), (uint64_t)v64);
  uint64_t v104 = (uint64_t)v210;
  v105 = v208;
  if ((v103 & 1) == 0
    || (id v106 = *(id *)(v1 + 16),
        v107 = v200,
        sub_100031E98(),
        v106,
        char v108 = sub_100031828(),
        (*(void (**)(char *, void *))(v205 + 8))(v107, v209),
        (v108 & 1) == 0))
  {
    *((void *)&v217 + 1) = &type metadata for AegirSnapshotIdentifierProvider;
    unint64_t v127 = sub_10001D10C();
    unint64_t v218 = v127;
    uint64_t v128 = swift_allocObject();
    *(void *)&long long v216 = v128;
    long long v129 = v222;
    *(_OWORD *)(v128 + 48) = v221;
    *(_OWORD *)(v128 + 64) = v129;
    *(void *)(v128 + 80) = v223;
    long long v130 = v220;
    *(_OWORD *)(v128 + 16) = v219;
    *(_OWORD *)(v128 + 32) = v130;
    id v131 = v202;
    id v132 = v201;
    sub_10000633C(v212);
    v133 = (void *)sub_100031888();
    sub_100009B0C((uint64_t)&v216);
    if (v133)
    {
      v209 = v133;
      sub_100031AC8();
      v134 = v206;
      v135 = sub_100031AF8();
      os_log_type_t v136 = sub_100031EF8();
      if (os_log_type_enabled(v135, v136))
      {
        v137 = (uint8_t *)swift_slowAlloc();
        v208 = (void *)swift_slowAlloc();
        *(_DWORD *)v137 = 138412290;
        *(void *)&long long v216 = v134;
        v138 = v134;
        uint64_t v104 = (uint64_t)v210;
        sub_100031FD8();
        void *v208 = v134;

        _os_log_impl((void *)&_mh_execute_header, v135, v136, "Have cached snapshot for key: %@", v137, 0xCu);
        sub_1000048F0(&qword_100045128);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        v135 = v134;
      }
      v148 = v203;

      ((void (*)(char *, uint64_t))v211)(v196, v213);
      int v147 = 0;
LABEL_42:
      v146 = v209;
      goto LABEL_46;
    }
    v139 = sub_10001797C();
    if (v139)
    {
      v140 = v139;
      *((void *)&v217 + 1) = &type metadata for AegirSnapshotIdentifierProvider;
      unint64_t v218 = v127;
      uint64_t v141 = swift_allocObject();
      *(void *)&long long v216 = v141;
      long long v142 = v222;
      *(_OWORD *)(v141 + 48) = v221;
      *(_OWORD *)(v141 + 64) = v142;
      *(void *)(v141 + 80) = v223;
      long long v143 = v220;
      *(_OWORD *)(v141 + 16) = v219;
      *(_OWORD *)(v141 + 32) = v143;
      id v144 = v131;
      id v145 = v132;
      sub_10000633C(v212);
      v209 = v140;
      v146 = v140;
      sub_100031878();

      sub_100009B0C((uint64_t)&v216);
      int v147 = 0;
      goto LABEL_45;
    }
LABEL_43:
    sub_100018678();
    v209 = 0;
LABEL_57:
    uint64_t v169 = v198;
    uint64_t v170 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingImageView;
    v171 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingImageView);
    if (v171)
    {
      [v171 removeFromSuperview];
      v172 = *(void **)(v1 + v170);
      *(void *)(v1 + v170) = 0;
    }
    uint64_t v173 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingDebugColorView;
    v174 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingDebugColorView);
    if (v174)
    {
      [v174 removeFromSuperview];
      v175 = *(void **)(v1 + v173);
      *(void *)(v1 + v173) = 0;
      id v176 = v201;

      id v177 = v202;
    }
    else
    {
      id v176 = v201;

      id v177 = v202;
    }
    uint64_t v178 = v212;
    sub_10000640C(v212);

    sub_10000640C(v178);
    uint64_t v179 = v104;
    uint64_t v180 = v169;
    return ((uint64_t (*)(uint64_t, uint64_t))v207)(v179, v180);
  }
  v109 = sub_10001797C();
  if (!v109) {
    goto LABEL_43;
  }
  v110 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotVistaController);
  v209 = v109;
  if (v110)
  {
    id v111 = v110;
    sub_100031AC8();
    v112 = sub_100031AF8();
    os_log_type_t v113 = sub_100031EF8();
    if (os_log_type_enabled(v112, v113))
    {
      v114 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v114 = 0;
      _os_log_impl((void *)&_mh_execute_header, v112, v113, "Expecting floating view, creating mask", v114, 2u);
      swift_slowDealloc();
    }

    ((void (*)(void *, uint64_t))v211)(v105, v213);
    id v115 = *(id *)(v1 + 16);
    sub_100031EB8();
    double v117 = v116;
    double v119 = v118;
    double v121 = v120;
    double v123 = v122;

    id v124 = [v111 vistaView];
    id v125 = [v124 contentMaskLayer];

    id v126 = [v125 contents];
    if (v126)
    {
      sub_100032008();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v217 = 0u;
      long long v216 = 0u;
    }
    v148 = v203;
    sub_1000183D8((uint64_t)&v216, v117, v119, v121, v123);

    sub_1000098B4((uint64_t)&v216, &qword_100045120);
    int v147 = 1;
    goto LABEL_42;
  }
  int v147 = 1;
  v146 = v109;
LABEL_45:
  v148 = v203;
LABEL_46:
  v149 = v146;
  sub_100031AC8();
  v150 = sub_100031AF8();
  os_log_type_t v151 = sub_100031EF8();
  if (os_log_type_enabled(v150, v151))
  {
    v152 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v152 = 0;
    _os_log_impl((void *)&_mh_execute_header, v150, v151, "Have background image, adding backgroundImageView", v152, 2u);
    swift_slowDealloc();
  }

  ((void (*)(char *, uint64_t))v211)(v148, v213);
  uint64_t v153 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundImageView;
  v154 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundImageView);
  if (v154)
  {
    id v155 = v154;
    [v155 setImage:v149];
  }
  else
  {
    id v156 = [objc_allocWithZone((Class)UIImageView) initWithImage:v149];
    [v156 setOpaque:0];
    v157 = *(void **)(v1 + v153);
    *(void *)(v1 + v153) = v156;
    id v155 = v156;
  }
  id v158 = [*(id *)(v1 + 16) backgroundView];
  [v158 addSubview:v155];

  if (!v147) {
    goto LABEL_57;
  }
  v159 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotMaskLayer);
  if (!v159) {
    goto LABEL_57;
  }
  v160 = v209;
  id v161 = v159;
  v162 = v195;
  sub_100031AC8();
  v163 = sub_100031AF8();
  os_log_type_t v164 = sub_100031EF8();
  if (os_log_type_enabled(v163, v164))
  {
    v165 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v165 = 0;
    _os_log_impl((void *)&_mh_execute_header, v163, v164, "Expects floating view; have background image and maskLayer, adding floatingImageView",
      v165,
      2u);
    v162 = v195;
    swift_slowDealloc();
  }

  ((void (*)(char *, uint64_t))v211)(v162, v213);
  uint64_t v166 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingImageView;
  v167 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingImageView);
  if (v167)
  {
    id v168 = v167;
    [v168 setImage:v160];
  }
  else
  {
    id v181 = [objc_allocWithZone((Class)UIImageView) initWithImage:v160];
    [v181 setOpaque:0];
    v182 = *(void **)(v1 + v166);
    *(void *)(v1 + v166) = v181;
    id v168 = v181;
  }
  uint64_t v183 = v198;
  id v184 = [*(id *)(v1 + 16) floatingView];
  [v184 addSubview:v168];

  id v185 = [v168 layer];
  [v185 addSublayer:v161];
  id v186 = v201;

  id v187 = v202;
  uint64_t v188 = v212;
  sub_10000640C(v212);

  sub_10000640C(v188);
  uint64_t v179 = v104;
  uint64_t v180 = v183;
  return ((uint64_t (*)(uint64_t, uint64_t))v207)(v179, v180);
}

void sub_100011EB0()
{
  uint64_t v1 = v0;
  uint64_t v189 = sub_100031918();
  uint64_t v188 = *(void *)(v189 - 8);
  uint64_t v2 = __chkstk_darwin(v189);
  id v187 = (char *)&v186 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  id v186 = (char *)&v186 - v4;
  uint64_t v204 = sub_1000048F0(&qword_100045228);
  uint64_t v203 = *(void *)(v204 - 8);
  __chkstk_darwin(v204);
  id v202 = (char *)&v186 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = sub_1000048F0(&qword_100045220);
  uint64_t v211 = *(void *)(v205 - 8);
  uint64_t v6 = __chkstk_darwin(v205);
  uint64_t v191 = (char *)&v186 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v197 = (char *)&v186 - v9;
  __chkstk_darwin(v8);
  long long v222 = (char *)&v186 - v10;
  uint64_t v11 = sub_1000048F0(&qword_100045090);
  __chkstk_darwin(v11 - 8);
  v190 = (char *)&v186 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v195 = sub_100031B18();
  uint64_t v194 = *(void *)(v195 - 8);
  __chkstk_darwin(v195);
  int v193 = (char *)&v186 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v231 = sub_100031848();
  uint64_t v219 = *(void *)(v231 - 8);
  long long v220 = (void (*)(char *, uint64_t))v219;
  uint64_t v14 = __chkstk_darwin(v231);
  id v201 = (char *)&v186 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v198 = (char *)&v186 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v207 = (char *)&v186 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v215 = (char *)&v186 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  id v206 = (char *)&v186 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v208 = (char *)&v186 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v209 = (char *)&v186 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v223 = (char *)&v186 - v29;
  __chkstk_darwin(v28);
  id v31 = (char *)&v186 - v30;
  uint64_t v32 = sub_100031A98();
  uint64_t v33 = *(void **)(v32 - 8);
  uint64_t v34 = __chkstk_darwin(v32);
  v192 = (char *)&v186 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __chkstk_darwin(v34);
  v196 = (char *)&v186 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v200 = (char *)&v186 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  v210 = (char *)&v186 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  long long v216 = (char *)&v186 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  uint64_t v46 = (char *)&v186 - v45;
  uint64_t v47 = __chkstk_darwin(v44);
  id v49 = (char *)&v186 - v48;
  __chkstk_darwin(v47);
  id v51 = (char *)&v186 - v50;
  char v52 = (char *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_wakeState);
  swift_beginAccess();
  double v53 = (void (*)(char *, uint64_t, uint64_t))v33[2];
  Swift::String v225 = v51;
  v53(v51, (uint64_t)v52, v32);
  id v54 = *(id *)(v1 + 16);
  Swift::String v224 = v49;
  sub_100031ED8();

  float v55 = (char *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState);
  swift_beginAccess();
  uint64_t v56 = *(void (**)(char *, char *, uint64_t))(v219 + 16);
  v227 = v31;
  uint64_t v57 = v31;
  int v58 = v52;
  uint64_t v59 = v223;
  unint64_t v218 = v55;
  v228 = v56;
  v229 = (void (*)(char *, uint64_t, uint64_t))(v219 + 16);
  v56(v57, v55, v231);
  uint64_t v60 = v1;
  id v61 = *(id *)(v1 + 16);
  id v62 = v59;
  sub_100031E98();

  uint64_t v63 = (void (*)(char *, char *, uint64_t))v53;
  v53(v46, (uint64_t)v58, v32);
  LOBYTE(v61) = sub_100031A88();
  id v64 = (void (*)(char *, uint64_t))v33[1];
  uint64_t v213 = v46;
  id v65 = v46;
  uint64_t v230 = v32;
  v226 = v33 + 1;
  uint64_t v66 = v64;
  v64(v65, v32);
  if (v61) {
    *(unsigned char *)(v60 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isFirstDraw) = 0;
  }
  unsigned int v67 = v218;
  swift_beginAccess();
  unsigned int v68 = v62;
  (*((void (**)(char *, char *, uint64_t))v220 + 3))(v67, v62, v231);
  swift_endAccess();
  swift_beginAccess();
  unsigned int v69 = (void (*)(uint64_t, char *, uint64_t))v33[3];
  long long v212 = v58;
  unsigned int v70 = v58;
  int v71 = v224;
  uint64_t v72 = v230;
  v69((uint64_t)v70, v224, v230);
  swift_endAccess();
  uint64_t v221 = v60;
  uint64_t v199 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isCurrentConfigurationChange;
  LOBYTE(v67) = *(unsigned char *)(v60 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isCurrentConfigurationChange);
  uint64_t v73 = v216;
  v63(v216, v71, v72);
  uint64_t v74 = v210;
  long long v217 = v33 + 2;
  v63(v210, v225, v72);
  v214 = v66;
  if (v67)
  {
    uint64_t v75 = v230;
    v66(v74, v230);
    v66(v73, v75);
    int v76 = v209;
    uint64_t v77 = v231;
    id v78 = v228;
    v228(v209, v62, v231);
    uint64_t v79 = v208;
    v78(v208, v227, v77);
    uint64_t v80 = v68;
LABEL_12:
    v86 = (void (*)(char *, uint64_t))*((void *)v220 + 1);
    uint64_t v94 = v231;
    v86(v79, v231);
    v86(v76, v94);
    goto LABEL_13;
  }
  char v81 = sub_100031A58();
  uint64_t v82 = v230;
  v66(v74, v230);
  v66(v73, v82);
  int v76 = v209;
  uint64_t v83 = v231;
  BOOL v84 = v228;
  v228(v209, v62, v231);
  uint64_t v79 = v208;
  v84(v208, v227, v83);
  uint64_t v80 = v68;
  if ((v81 & 1) == 0) {
    goto LABEL_12;
  }
  char v85 = sub_100031808();
  v86 = (void (*)(char *, uint64_t))*((void *)v220 + 1);
  uint64_t v87 = v231;
  v86(v79, v231);
  v86(v76, v87);
  if (v85)
  {
    uint64_t v88 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isRotationChange;
    uint64_t v89 = v221;
    if (*(unsigned char *)(v221 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isRotationChange) == 1)
    {
      sub_100013594();
      uint64_t v90 = *(void **)(v89 + 24);
      if ([v90 mode]) {
        [v90 applyMode:0];
      }
      *(unsigned char *)(v89 + v88) = 0;
    }
    uint64_t v91 = v231;
    v86(v68, v231);
    v86(v227, v91);
    uint64_t v92 = v230;
    id v93 = v214;
    v214(v224, v230);
    v93(v225, v92);
    return;
  }
LABEL_13:
  uint64_t v95 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isRotationChange;
  uint64_t v96 = v221;
  uint64_t v97 = v218;
  if (*(unsigned char *)(v221 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isRotationChange) == 1)
  {
    v98 = *(void **)(v221 + 24);
    if ([v98 mode]) {
      [v98 applyMode:0];
    }
    *(unsigned char *)(v96 + v95) = 0;
  }
  sub_100013594();
  unint64_t v99 = *(char **)(v96 + 24);
  if ([v99 mode] == (id)1 && objc_msgSend(v99, "mode")) {
    [v99 applyMode:0];
  }
  long long v216 = v99;
  [v99 setActiveModeFrameInterval:0];
  uint64_t v100 = v206;
  uint64_t v101 = v231;
  v228(v206, v97, v231);
  char v102 = sub_1000317F8();
  uint64_t v103 = v219 + 8;
  long long v220 = v86;
  v86(v100, v101);
  if ((v102 & 1) == 0)
  {
    uint64_t v104 = v215;
    uint64_t v105 = v231;
    v228(v215, v97, v231);
    char v106 = sub_1000317E8();
    v220(v104, v105);
    if ((v106 & 1) != 0
      || (v107 = v213, uint64_t v108 = v230, v63(v213, v212, v230), v109 = sub_100031A38(), v214(v107, v108), (v109 & 1) == 0))
    {
      uint64_t v110 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_queuedLocationUpdate;
      id v111 = *(void **)(v96 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_queuedLocationUpdate);
      if (v111)
      {
        id v112 = v111;
        sub_1000137B4(v111);

        os_log_type_t v113 = *(void **)(v96 + v110);
        *(void *)(v96 + v110) = 0;
      }
    }
  }
  sub_100031838();
  double v115 = v114;
  double v116 = v207;
  v228(v207, v80, v231);
  uint64_t v219 = v103;
  if (v115 >= 0.5)
  {
    double v119 = v220;
    v220(v116, v231);
LABEL_36:
    unint64_t v127 = v63;
    sub_100031838();
    double v131 = v130;
    id v132 = v198;
    v228(v198, v80, v231);
    if (v131 <= 0.5)
    {
      v119(v132, v231);
    }
    else
    {
      sub_100031838();
      double v134 = v133;
      v119(v132, v231);
      if (v134 <= 0.5)
      {
        uint64_t v135 = sub_100031DE8();
        uint64_t v136 = (uint64_t)v190;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v135 - 8) + 56))(v190, 1, 1, v135);
        uint64_t v137 = swift_allocObject();
        swift_weakInit();
        sub_100031DC8();
        swift_retain();
        uint64_t v138 = sub_100031DB8();
        uint64_t v139 = swift_allocObject();
        *(void *)(v139 + 16) = v138;
        *(void *)(v139 + 24) = &protocol witness table for MainActor;
        *(void *)(v139 + 32) = v137;
        *(unsigned char *)(v139 + 40) = 0;
        swift_release();
        sub_10001025C(v136, (uint64_t)&unk_100045248, v139);
        swift_release();
      }
    }
LABEL_42:
    uint64_t v141 = v213;
    uint64_t v142 = v230;
    v127(v213, v225, v230);
    v127(v200, v224, v142);
    uint64_t v143 = (uint64_t)v222;
    sub_1000318D8();
    uint64_t v144 = v231;
    id v145 = v228;
    v228(v215, v227, v231);
    v145(v201, v223, v144);
    uint64_t v146 = (uint64_t)v202;
    sub_1000318D8();
    sub_1000152F0(v143, v146);
    (*(void (**)(uint64_t, uint64_t))(v203 + 8))(v146, v204);
    uint64_t v147 = v230;
    v148 = v212;
    v229 = (void (*)(char *, uint64_t, uint64_t))v127;
    v127(v141, v212, v230);
    sub_100031A48();
    double v150 = v149;
    os_log_type_t v151 = v214;
    v214(v141, v147);
    double v233 = v150;
    sub_10001D484();
    sub_100031BF8();
    uint64_t v232 = v234;
    uint64_t v152 = v221;
    sub_100031BE8();
    double v153 = v233;
    id v154 = [v216 vistaView];
    [v154 setAPLFilterAmount:v153];

    sub_1000138E0();
    uint64_t v155 = v205;
    uint64_t v156 = v211;
    if (*(unsigned char *)(v152 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isFirstDraw)) {
      goto LABEL_53;
    }
    v157 = v196;
    uint64_t v158 = v230;
    v229(v196, (uint64_t)v148, v230);
    char v159 = sub_100031A78();
    v151(v157, v158);
    v160 = v151;
    id v161 = *(void (**)(char *, char *, uint64_t))(v156 + 16);
    v162 = v197;
    v161(v197, v222, v155);
    if (v159)
    {
      (*(void (**)(char *, uint64_t))(v156 + 8))(v162, v155);
      os_log_type_t v151 = v160;
      goto LABEL_45;
    }
    uint64_t v169 = v192;
    v229(v192, (uint64_t)v148, v158);
    char v170 = sub_100031A38();
    v160(v169, v158);
    if (v170)
    {
      v171 = v213;
      v229(v213, (uint64_t)v148, v158);
      sub_100031A48();
      double v173 = v172;
      v160(v171, v158);
      v174 = v191;
      v175 = v197;
      v161(v191, v197, v155);
      if (v173 < 0.05)
      {
        id v176 = v186;
        sub_1000318F8();
        uint64_t v177 = v188;
        uint64_t v178 = v187;
        uint64_t v179 = v189;
        (*(void (**)(char *, void, uint64_t))(v188 + 104))(v187, enum case for TransitionDirection.backwards(_:), v189);
        LODWORD(v229) = sub_100031908();
        uint64_t v180 = *(void (**)(char *, uint64_t))(v177 + 8);
        v180(v178, v179);
        v180(v176, v179);
        uint64_t v156 = v211;
        id v181 = *(void (**)(char *, uint64_t))(v211 + 8);
        v181(v174, v155);
        v181(v175, v155);
        os_log_type_t v151 = v160;
        if (v229)
        {
LABEL_45:
          uint64_t v163 = v155;
          id v164 = v216;
          id v165 = [v216 mode];
          uint64_t v166 = v199;
          uint64_t v167 = v230;
          id v168 = v223;
          if (v165 != (id)1) {
            [v164 applyMode:1];
          }
LABEL_57:
          (*(void (**)(char *, uint64_t))(v156 + 8))(v222, v163);
          uint64_t v184 = v231;
          id v185 = v220;
          v220(v168, v231);
          v185(v227, v184);
          v151(v224, v167);
          v151(v225, v167);
          *(unsigned char *)(v152 + v166) = 0;
          return;
        }
LABEL_53:
        uint64_t v163 = v155;
        uint64_t v166 = v199;
        if (*(unsigned char *)(v152 + v199) == 1)
        {
          id v183 = [v216 vistaView];
          [v183 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];

          sub_100014D84(300000000);
        }
        else
        {
          sub_100014818(0);
        }
        uint64_t v167 = v230;
        id v168 = v223;
        goto LABEL_57;
      }
    }
    else
    {
      v174 = v191;
      v175 = v197;
      v161(v191, v197, v155);
    }
    uint64_t v156 = v211;
    v182 = *(void (**)(char *, uint64_t))(v211 + 8);
    v182(v174, v155);
    v182(v175, v155);
    os_log_type_t v151 = v160;
    goto LABEL_53;
  }
  sub_100031838();
  double v118 = v117;
  double v119 = v220;
  v220(v116, v231);
  if (v118 < 0.5) {
    goto LABEL_36;
  }
  double v120 = v193;
  sub_100031AD8();
  double v121 = sub_100031AF8();
  os_log_type_t v122 = sub_100031F18();
  if (os_log_type_enabled(v121, v122))
  {
    double v123 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v123 = 0;
    _os_log_impl((void *)&_mh_execute_header, v121, v122, "Unlocking device and hiding foreground view", v123, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v194 + 8))(v120, v195);
  id v124 = [v216 vistaView];
  id v125 = [v124 quadViews];

  sub_100006718();
  unint64_t v126 = sub_100031D58();

  if (v126 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v140 = sub_100032118();
    swift_bridgeObjectRelease();
    if (v140) {
      goto LABEL_31;
    }
    goto LABEL_41;
  }
  if (!*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_41:
    unint64_t v127 = v63;
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_31:
  if ((v126 & 0xC000000000000001) != 0)
  {
    unint64_t v127 = v63;
    id v128 = (id)sub_100032088();
    goto LABEL_34;
  }
  if (*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    unint64_t v127 = v63;
    id v128 = *(id *)(v126 + 32);
LABEL_34:
    long long v129 = v128;
    swift_bridgeObjectRelease();
    [v129 setHidden:1];

    goto LABEL_42;
  }
  __break(1u);
}

void sub_100013594()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AC8();
  uint64_t v6 = sub_100031AF8();
  os_log_type_t v7 = sub_100031EF8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "_cleanupAfterSnapshotsIfNeeded", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotVistaController;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotVistaController);
  if (v10)
  {
    id v11 = [v10 vistaView];
    [v11 discardContents];
  }
  sub_100031898();
  uint64_t v12 = *(void **)(v1 + v9);
  if (v12)
  {
    id v13 = v12;
    id v14 = [v13 vistaView];
    [v14 purgeUnused];

    uint64_t v15 = *(void **)(v1 + v9);
    *(void *)(v1 + v9) = 0;
  }
  sub_100018678();
  uint64_t v16 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingImageView;
  uint64_t v17 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingImageView);
  if (v17)
  {
    [v17 removeFromSuperview];
    uint64_t v18 = *(void **)(v1 + v16);
    *(void *)(v1 + v16) = 0;
  }
  uint64_t v19 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingDebugColorView;
  uint64_t v20 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingDebugColorView);
  if (v20)
  {
    [v20 removeFromSuperview];
    uint64_t v21 = *(void **)(v1 + v19);
    *(void *)(v1 + v19) = 0;
  }
}

id sub_1000137B4(void *a1)
{
  uint64_t v2 = (long long *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
  *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16) = a1;
  id v4 = a1;

  long long v5 = v2[1];
  long long v11 = *v2;
  long long v12 = v5;
  long long v13 = v2[2];
  sub_10001D0A8((uint64_t)&v12, (uint64_t)&v14, (uint64_t *)&unk_100045580);
  sub_10001D0A8((uint64_t)&v12 + 8, (uint64_t)&v15, &qword_100045100);
  uint64_t v6 = v13;
  sub_1000063B4(&v14);
  sub_1000063B4(&v15);
  sub_10000633C(v6);
  sub_10000E9C0((uint64_t *)&v11);
  sub_1000063E0(&v14);
  sub_1000063E0(&v15);
  sub_10000640C(v6);
  os_log_type_t v7 = *(void **)(v1 + 24);
  id v8 = objc_allocWithZone((Class)CLLocation);
  id v9 = objc_msgSend(v8, "initWithLatitude:longitude:", 37.33182, -122.03118, v11);
  [v7 updateLocation:v4 fallbackLocation:v9 animated:0];

  return [*(id *)(v1 + 16) noteContentSignificantlyChanged];
}

uint64_t sub_1000138E0()
{
  uint64_t v1 = v0;
  uint64_t v127 = sub_100031B18();
  uint64_t v126 = *(void *)(v127 - 8);
  __chkstk_darwin(v127);
  uint64_t v3 = (char *)v117 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100031848();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v124 = (char *)v117 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  double v123 = (char *)v117 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  os_log_type_t v122 = (char *)v117 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  double v121 = (char *)v117 - v13;
  __chkstk_darwin(v12);
  id v15 = (char *)v117 - v14;
  uint64_t v16 = sub_100031A98();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v117 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = *(id *)(v1 + 24);
  id v21 = [v20 vistaView];
  id v125 = [v21 scene];

  uint64_t v22 = v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_wakeState;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v22, v16);
  sub_100031A48();
  double v24 = v23;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  double v136 = v24;
  sub_10001D484();
  sub_100031BF8();
  double v130 = v131;
  sub_100031BE8();
  float v25 = v136;
  uint64_t v26 = v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v15, v26, v4);
  sub_100031838();
  double v28 = v27;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v5 + 8);
  v29(v15, v4);
  double v130 = v28;
  sub_100031BE8();
  float v30 = v131;
  uint64_t v31 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive;
  uint64_t v129 = v1;
  float v32 = 0.0;
  BOOL v42 = *(unsigned char *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive) == 1;
  uint64_t v128 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive;
  if (v42)
  {
    double v119 = v29;
    uint64_t v33 = v15;
    double v120 = v3;
    if (v30 > v25) {
      float v34 = v131;
    }
    else {
      float v34 = v25;
    }
    CFTimeInterval v35 = CACurrentMediaTime();
    uint64_t v36 = v129;
    *(float *)&CFTimeInterval v35 = v35
                   - *(double *)(v129 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationStartTime);
    uint64_t v37 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationTimeOffset;
    float v38 = (float)(*(float *)(v129 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationTimeOffset)
                + *(float *)&v35)
        / 1.5;
    if (v38 > 1.0) {
      float v38 = 1.0;
    }
    float v39 = v38 + (float)(v34 * (float)(1.0 - v38));
    uint64_t v40 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed;
    int v41 = *(unsigned __int8 *)(v129 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed);
    if (*(unsigned char *)(v129 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed)) {
      float v32 = 1.0 - v39;
    }
    else {
      float v32 = v39;
    }
    if (v32 > 0.0) {
      int v41 = 0;
    }
    BOOL v42 = v32 < 1.0 && v41 == 0;
    if (!v42)
    {
      v117[1] = (id)OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tokenManager;
      uint64_t v43 = qword_100044960;
      uint64_t v44 = off_100044968;
      swift_retain();
      swift_bridgeObjectRetain();
      v137._countAndFlagsBits = v43;
      v137._object = v44;
      sub_100031928(v137);
      swift_release();
      swift_bridgeObjectRelease();
      *(_DWORD *)(v36 + v37) = 0;
      *(unsigned char *)(v36 + v128) = 0;
      swift_retain();
      sub_1000317B8();
      swift_release();
      uint64_t v45 = v40;
      uint64_t v46 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista;
      BOOL v42 = *(void *)(v36 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista) == 2;
      uint64_t v47 = v4;
      uint64_t v48 = v124;
      uint64_t v118 = v47;
      if (v42 && (*(unsigned char *)(v36 + v40) & 1) == 0)
      {
        *(void *)(v36 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista) = 2;
        id v49 = (uint64_t *)(v36 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
        swift_beginAccess();
        uint64_t v50 = *v49;
        uint64_t v51 = v49[1];
        char v52 = (void *)v49[2];
        double v53 = (void *)v49[3];
        uint64_t v54 = v49[4];
        *id v49 = 0;
        v49[1] = 0;
        double v49[2] = 1;
        v49[3] = 0;
        uint64_t v47 = v118;
        v49[4] = 0;
        v49[5] = 0;
        sub_100009A54(v50, v51, v52, v53, v54);
        v117[0] = v20;
        [v20 setVista:2];
        id v55 = *(id *)(v36 + 16);
        uint64_t v56 = v33;
        uint64_t v57 = v121;
        sub_100031E98();

        LOBYTE(v55) = sub_100031828();
        int v58 = v57;
        uint64_t v33 = v56;
        v119(v58, v47);
        if ((v55 & 1) != 0
          || (id v59 = *(id *)(v36 + 16),
              sub_100031E98(),
              v59,
              sub_100031838(),
              double v61 = v60,
              v119(v56, v47),
              v61 < 0.01))
        {
          float v62 = sub_10000D084();
        }
        else
        {
          float v62 = sub_10000D238();
        }
        *(float *)&double v131 = v62;
        unint64_t v132 = v63;
        uint64_t v133 = v64;
        int v134 = v65;
        id v20 = v117[0];
        [v117[0] applyStyleDefinition:&v131];
        uint64_t v45 = v40;
      }
      uint64_t v66 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista;
      if (*(void *)(v36 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista) == 2
        && *(unsigned char *)(v36 + v45) == 1)
      {
        *(void *)(v36 + v46) = 2;
        unsigned int v67 = (uint64_t *)(v36 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
        swift_beginAccess();
        uint64_t v68 = *v67;
        uint64_t v69 = v67[1];
        unsigned int v70 = (void *)v67[2];
        int v71 = (void *)v67[3];
        uint64_t v72 = v67[4];
        uint64_t *v67 = 0;
        v67[1] = 0;
        v67[2] = 1;
        v67[3] = 0;
        v67[4] = 0;
        v67[5] = 0;
        sub_100009A54(v68, v69, v70, v71, v72);
        [v20 setVista:2];
        id v73 = *(id *)(v36 + 16);
        uint64_t v74 = v122;
        sub_100031E98();

        LOBYTE(v73) = sub_100031828();
        uint64_t v75 = v74;
        int v76 = v119;
        v119(v75, v47);
        if ((v73 & 1) != 0
          || (id v77 = *(id *)(v36 + 16),
              sub_100031E98(),
              v77,
              sub_100031838(),
              double v79 = v78,
              v76(v33, v47),
              v79 < 0.01))
        {
          float v80 = sub_10000D084();
        }
        else
        {
          float v80 = sub_10000D238();
        }
        *(float *)&double v131 = v80;
        unint64_t v132 = v81;
        uint64_t v133 = v82;
        int v134 = v83;
        [v20 applyStyleDefinition:&v131];
        uint64_t v48 = v124;
        uint64_t v45 = v40;
      }
      if (*(void *)(v36 + v46) != 2 && (*(unsigned char *)(v36 + v45) & 1) == 0)
      {
        objc_msgSend(v20, "setVista:");
        id v84 = *(id *)(v36 + 16);
        char v85 = v123;
        sub_100031E98();

        LOBYTE(v84) = sub_100031828();
        v86 = v85;
        uint64_t v87 = v118;
        v119(v86, v118);
        if ((v84 & 1) != 0
          || (id v88 = *(id *)(v36 + 16),
              sub_100031E98(),
              v88,
              sub_100031838(),
              double v90 = v89,
              v119(v33, v87),
              v90 < 0.01))
        {
          float v91 = sub_10000D084();
        }
        else
        {
          float v91 = sub_10000D238();
        }
        *(float *)&double v131 = v91;
        unint64_t v132 = v92;
        uint64_t v133 = v93;
        int v134 = v94;
        [v20 applyStyleDefinition:&v131];
        uint64_t v45 = v40;
        if (!*(void *)(v36 + v46))
        {
          sub_100015C68(1);
          uint64_t v45 = v40;
        }
      }
      if (*(void *)(v36 + v66) != 2 && *(unsigned char *)(v36 + v45) == 1)
      {
        objc_msgSend(v20, "setVista:");
        id v95 = *(id *)(v36 + 16);
        sub_100031E98();

        LOBYTE(v95) = sub_100031828();
        uint64_t v96 = v118;
        uint64_t v97 = v119;
        v119(v48, v118);
        if ((v95 & 1) != 0
          || (id v98 = *(id *)(v36 + 16),
              sub_100031E98(),
              v98,
              sub_100031838(),
              double v100 = v99,
              v97(v33, v96),
              v100 < 0.01))
        {
          float v101 = sub_10000D084();
        }
        else
        {
          float v101 = sub_10000D238();
        }
        *(float *)&double v131 = v101;
        unint64_t v132 = v102;
        uint64_t v133 = v103;
        int v134 = v104;
        [v20 applyStyleDefinition:&v131];
        if (!*(void *)(v36 + v66)) {
          sub_100015C68(1);
        }
      }
      uint64_t v105 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask;
      if (*(void *)(v36 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask))
      {
        swift_retain();
        sub_1000048F0(&qword_1000454C0);
        sub_100031DF8();
        *(void *)(v36 + v105) = 0;
        swift_release();
        uint64_t v106 = qword_100044970;
        v107 = off_100044978;
        swift_retain();
        swift_bridgeObjectRetain();
        v138._countAndFlagsBits = v106;
        v138._object = v107;
        sub_100031928(v138);
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
      }
      sub_100014818(0);
      [*(id *)(v36 + 16) noteContentSignificantlyChanged];
    }
    uint64_t v3 = v120;
    uint64_t v31 = v128;
  }
  sub_100031AD8();
  uint64_t v108 = sub_100031AF8();
  os_log_type_t v109 = sub_100031EE8();
  uint64_t v110 = v3;
  if (os_log_type_enabled(v108, v109))
  {
    id v111 = (uint8_t *)swift_slowAlloc();
    uint64_t v112 = swift_slowAlloc();
    *(_DWORD *)id v111 = 136315138;
    uint64_t v135 = v112;
    double v131 = 0.0;
    unint64_t v132 = 0xE000000000000000;
    sub_100032068(38);
    v139._countAndFlagsBits = 0x203A6B636F6C6E75;
    v139._object = (void *)0xE800000000000000;
    sub_100031CA8(v139);
    sub_100031E68();
    v140._countAndFlagsBits = 0x203A656B6177203BLL;
    v140._object = (void *)0xE800000000000000;
    sub_100031CA8(v140);
    sub_100031E68();
    v141._object = (void *)0x8000000100034300;
    v141._countAndFlagsBits = 0xD000000000000010;
    sub_100031CA8(v141);
    sub_100031E68();
    double v131 = COERCE_DOUBLE(sub_10001B510(*(uint64_t *)&v131, v132, &v135));
    uint64_t v31 = v128;
    sub_100031FD8();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v108, v109, "render: driver: %s", v111, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v126 + 8))(v110, v127);
  os_log_type_t v113 = v125;
  uint64_t v114 = v129;
  double v115 = sub_1000145F0();
  v115(v113, v30, v25, v32);
  if ((*(unsigned char *)(v114 + v31) & 1) == 0) {
    [v113 updateCamera];
  }

  return swift_release();
}

uint64_t (*sub_1000145F0())(void *a1, double a2, float a3, float a4)
{
  uint64_t v1 = swift_allocObject();
  *(float *)(v1 + 16) = sub_10000D084();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v3;
  *(_DWORD *)(v1 + 40) = v4;
  uint64_t v5 = swift_allocObject();
  *(float *)(v5 + 16) = sub_10000D238();
  *(void *)(v5 + 24) = v6;
  *(void *)(v5 + 32) = v7;
  *(_DWORD *)(v5 + 40) = v8;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    CFTimeInterval v35 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v12 = (uint64_t *)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
    swift_beginAccess();
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v16 = (void *)v12[2];
    id v15 = (void *)v12[3];
    uint64_t v17 = v12[4];
    if (v16 == (void *)1)
    {
      uint64_t v34 = *(void *)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
      uint64_t v18 = *(void **)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      uint64_t v19 = *(void *)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 32);
      uint64_t v31 = v12[1];
      uint64_t v32 = *v12;
      id v33 = *(id *)(v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
      id v20 = v18;
      sub_10000633C(v19);
      uint64_t v14 = v31;
      uint64_t v13 = v32;
    }
    else
    {
      id v33 = (id)v12[3];
      uint64_t v34 = *v12;
      id v20 = (id)v12[2];
      uint64_t v19 = v12[4];
    }
    sub_10001C304(v13, v14, v16, v15, v17);
    CFTimeInterval v35 = sub_10000A35C(v34);
    uint64_t v9 = v21;
    unint64_t v10 = v22;

    uint64_t v11 = (v10 >> 40) & 1;
    sub_10000640C(v19);
  }
  uint64_t v23 = sub_10000D410();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v28 = swift_allocObject();
  swift_weakInit();
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v28;
  *(void *)(v29 + 24) = v1;
  *(void *)(v29 + 32) = v5;
  *(void *)(v29 + 40) = v35;
  *(void *)(v29 + 48) = v9;
  *(unsigned char *)(v29 + 60) = BYTE4(v10);
  *(_DWORD *)(v29 + 56) = v10;
  *(unsigned char *)(v29 + 61) = v11;
  *(void *)(v29 + 64) = v23;
  *(void *)(v29 + 72) = v25;
  *(unsigned char *)(v29 + 84) = BYTE4(v27);
  *(_DWORD *)(v29 + 80) = v27;
  *(unsigned char *)(v29 + 85) = BYTE5(v27) & 1;
  return sub_10001D530;
}

void sub_100014818(int a1)
{
  int v44 = a1;
  uint64_t v2 = sub_100031B18();
  uint64_t v42 = *(void *)(v2 - 8);
  uint64_t v43 = v2;
  ((void (*)(void))__chkstk_darwin)();
  int v41 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100031A98();
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v47 = v4;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v45 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100031848();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v48 = v1;
  uint64_t v13 = v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState;
  swift_beginAccess();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v12, v13, v6);
  char v15 = sub_1000317F8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v12, v6);
  if ((v15 & 1) == 0)
  {
    v14(v10, v13, v6);
    char v17 = sub_1000317E8();
    v16(v10, v6);
    if (v17) {
      goto LABEL_17;
    }
    uint64_t v18 = v48 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_wakeState;
    swift_beginAccess();
    uint64_t v19 = v45;
    uint64_t v20 = v46;
    uint64_t v21 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v45, v18, v47);
    LOBYTE(v18) = sub_100031A38();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v19, v21);
    if ((v18 & 1) == 0)
    {
LABEL_17:
      uint64_t v22 = qword_100044920;
      uint64_t v23 = off_100044928;
      swift_retain();
      swift_bridgeObjectRetain();
      v50._countAndFlagsBits = v22;
      v50._object = v23;
      LOBYTE(v22) = sub_100031938(v50);
      swift_release();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
        uint64_t v24 = qword_100044940;
        uint64_t v25 = off_100044948;
        swift_retain();
        swift_bridgeObjectRetain();
        v51._countAndFlagsBits = v24;
        v51._object = v25;
        LOBYTE(v24) = sub_100031938(v51);
        swift_release();
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0)
        {
          uint64_t v26 = qword_100044960;
          uint64_t v27 = off_100044968;
          swift_retain();
          swift_bridgeObjectRetain();
          v52._countAndFlagsBits = v26;
          v52._object = v27;
          LOBYTE(v26) = sub_100031938(v52);
          swift_release();
          swift_bridgeObjectRelease();
          if ((v26 & 1) == 0)
          {
            uint64_t v28 = qword_100044970;
            uint64_t v29 = off_100044978;
            swift_retain();
            swift_bridgeObjectRetain();
            v53._countAndFlagsBits = v28;
            v53._object = v29;
            LOBYTE(v28) = sub_100031938(v53);
            swift_release();
            swift_bridgeObjectRelease();
            if ((v28 & 1) == 0)
            {
              swift_retain();
              char v30 = sub_1000319A8();
              swift_release();
              if ((v30 & 1) == 0)
              {
                uint64_t v31 = v48;
                uint64_t v32 = v41;
                sub_100031AD8();
                id v33 = sub_100031AF8();
                os_log_type_t v34 = sub_100031F18();
                BOOL v35 = os_log_type_enabled(v33, v34);
                char v36 = v44;
                if (v35)
                {
                  uint64_t v37 = (uint8_t *)swift_slowAlloc();
                  *(_DWORD *)uint64_t v37 = 67109120;
                  int v49 = v36 & 1;
                  sub_100031FD8();
                  _os_log_impl((void *)&_mh_execute_header, v33, v34, "Applying deactive mode.  Render synchronously: %{BOOL}d", v37, 8u);
                  swift_slowDealloc();
                }

                (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v43);
                float v38 = *(void **)(v31 + 24);
                if ([v38 mode] != (id)1) {
                  [v38 applyMode:1];
                }
                if (v36)
                {
                  id v39 = [v38 vistaView];
                  [v39 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
                }
              }
            }
          }
        }
      }
    }
  }
}

id sub_100014D84(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000048F0(&qword_100045090);
  id result = (id)__chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask;
  if (!*(void *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask))
  {
    id result = [*(id *)(v1 + 24) mode];
    if (result != (id)1)
    {
      uint64_t v9 = *(void **)(v1 + 16);
      swift_retain();
      id v10 = v9;
      swift_bridgeObjectRetain();
      sub_100031968();
      swift_release();

      swift_bridgeObjectRelease();
      uint64_t v11 = sub_100031DE8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
      uint64_t v12 = swift_allocObject();
      swift_weakInit();
      sub_100031DC8();
      swift_retain();
      uint64_t v13 = sub_100031DB8();
      uint64_t v14 = (void *)swift_allocObject();
      v14[2] = v13;
      void v14[3] = &protocol witness table for MainActor;
      v14[4] = a1;
      v14[5] = v12;
      swift_release();
      *(void *)(v2 + v8) = sub_100024248((uint64_t)v7, (uint64_t)&unk_100045238, (uint64_t)v14);
      return (id)swift_release();
    }
  }
  return result;
}

uint64_t sub_100014F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a5;
  v5[6] = sub_100031DC8();
  v5[7] = sub_100031DB8();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[8] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100015020;
  return static Task<>.sleep(nanoseconds:)(a4);
}

uint64_t sub_100015020()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_100031DA8();
  if (v0) {
    uint64_t v4 = sub_10001528C;
  }
  else {
    uint64_t v4 = sub_10001517C;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_10001517C()
{
  swift_release();
  if ((sub_100031E08() & 1) == 0)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v2 = Strong;
      uint64_t v3 = qword_100044970;
      uint64_t v4 = off_100044978;
      swift_retain();
      swift_bridgeObjectRetain();
      v8._countAndFlagsBits = v3;
      v8._object = v4;
      sub_100031928(v8);
      swift_bridgeObjectRelease();
      swift_release();
      sub_100014818(0);
      *(void *)(v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask) = 0;
      swift_release();
      swift_release();
    }
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_10001528C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1000152F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v86 = a2;
  uint64_t v82 = a1;
  uint64_t v83 = sub_1000048F0(&qword_100045220);
  uint64_t v75 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v74 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_1000048F0(&qword_100045228);
  uint64_t v80 = *(void *)(v78 - 8);
  uint64_t v5 = __chkstk_darwin(v78);
  id v77 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  int v76 = (char *)&v68 - v7;
  uint64_t v84 = sub_100031848();
  uint64_t v79 = *(void *)(v84 - 8);
  uint64_t v8 = __chkstk_darwin(v84);
  id v10 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v68 - v11;
  uint64_t v81 = sub_100031A98();
  uint64_t v13 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v87 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100031918();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v68 - v20;
  id v85 = *(id *)(v2 + 24);
  if (([v85 forceDisableLocationDot] & 1) == 0)
  {
    sub_100015FF0();
    id v22 = *(id *)(v2 + 16);
    char v23 = sub_100031EC8();

    if ((v23 & 1) == 0)
    {
      uint64_t v24 = (void *)(v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
      if (*(void *)(v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16))
      {
        uint64_t v73 = v3;
        uint64_t v25 = (void *)(v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
        swift_beginAccess();
        if (v25[2] == 1)
        {
          uint64_t v26 = v87;
          if (*v24)
          {
LABEL_6:
            uint64_t v27 = qword_100044920;
            uint64_t v28 = off_100044928;
            swift_retain();
            swift_bridgeObjectRetain();
            v88._countAndFlagsBits = v27;
            v88._object = v28;
            sub_100031928(v88);
            swift_release();
            swift_bridgeObjectRelease();
            [v85 stopLocationDotPulse];
            sub_100014818(0);
            return;
          }
        }
        else
        {
          uint64_t v26 = v87;
          if (*v25) {
            goto LABEL_6;
          }
        }
        sub_1000318F8();
        (*(void (**)(char *, void, uint64_t))(v16 + 104))(v19, enum case for TransitionDirection.forward(_:), v15);
        LODWORD(v72) = sub_100031908();
        uint64_t v29 = *(void (**)(char *, uint64_t))(v16 + 8);
        v29(v19, v15);
        v29(v21, v15);
        sub_1000318E8();
        LOBYTE(v29) = sub_100031A38();
        uint64_t v31 = v13 + 8;
        char v30 = *(void (**)(char *, uint64_t))(v13 + 8);
        uint64_t v32 = v81;
        v30(v26, v81);
        uint64_t v33 = v78;
        if (v29 & 1) != 0 && (v72)
        {
          sub_1000318C8();
          char v34 = sub_100031828();
          (*(void (**)(char *, uint64_t))(v79 + 8))(v12, v84);
          if (v34) {
            sub_100015C68(0);
          }
        }
        sub_1000318C8();
        char v35 = sub_100031A68();
        int v71 = v30;
        uint64_t v72 = v31;
        v30(v26, v32);
        uint64_t v36 = v80;
        if (v35)
        {
          sub_1000318E8();
          char v37 = sub_100031828();
          float v38 = *(void (**)(char *, uint64_t))(v79 + 8);
          v38(v12, v84);
          if ((v37 & 1) == 0)
          {
            sub_1000318C8();
            char v39 = sub_100031828();
            v38(v12, v84);
            if (v39) {
              sub_100015C68(0);
            }
          }
        }
        uint64_t v40 = v86;
        sub_1000318E8();
        char v41 = sub_100031828();
        uint64_t v42 = *(void (**)(char *, uint64_t))(v79 + 8);
        uint64_t v43 = v84;
        v42(v10, v84);
        int v44 = v76;
        uint64_t v79 = *(void *)(v36 + 16);
        ((void (*)(char *, uint64_t, uint64_t))v79)(v76, v40, v33);
        if (v41)
        {
          sub_1000318C8();
          char v45 = sub_100031828();
          uint64_t v69 = v42;
          v42(v12, v43);
          uint64_t v46 = *(void (**)(char *, uint64_t))(v36 + 8);
          v46(v44, v33);
          unsigned int v70 = v46;
          if (v45)
          {
            uint64_t v47 = v78;
            uint64_t v48 = v69;
            int v49 = v87;
          }
          else
          {
            uint64_t v51 = qword_100044920;
            Swift::String v52 = off_100044928;
            swift_retain();
            swift_bridgeObjectRetain();
            v89._countAndFlagsBits = v51;
            int v49 = v87;
            v89._object = v52;
            sub_100031928(v89);
            swift_release();
            swift_bridgeObjectRelease();
            [v85 hideLocationDotPulse];
            uint64_t v47 = v78;
            uint64_t v48 = v69;
          }
        }
        else
        {
          uint64_t v50 = v36;
          uint64_t v47 = v33;
          unsigned int v70 = *(void (**)(char *, uint64_t))(v50 + 8);
          v70(v44, v33);
          uint64_t v48 = v42;
          int v49 = v87;
        }
        uint64_t v53 = v86;
        sub_1000318E8();
        char v54 = sub_1000317E8();
        v48(v12, v43);
        uint64_t v55 = v43;
        uint64_t v56 = v77;
        ((void (*)(char *, uint64_t, uint64_t))v79)(v77, v53, v47);
        if (v54)
        {
          v70(v56, v47);
          int v58 = v74;
          uint64_t v57 = v75;
          uint64_t v60 = v81;
          uint64_t v59 = v82;
          uint64_t v61 = v83;
        }
        else
        {
          sub_1000318C8();
          char v62 = sub_1000317E8();
          v48(v12, v55);
          v70(v56, v47);
          int v58 = v74;
          uint64_t v57 = v75;
          uint64_t v60 = v81;
          uint64_t v59 = v82;
          uint64_t v61 = v83;
          if (v62)
          {
            uint64_t v63 = qword_100044920;
            uint64_t v64 = off_100044928;
            swift_retain();
            swift_bridgeObjectRetain();
            v90._countAndFlagsBits = v63;
            int v49 = v87;
            v90._object = v64;
            sub_100031928(v90);
            swift_release();
            swift_bridgeObjectRelease();
            [v85 stopLocationDotPulse];
            sub_100014818(0);
          }
        }
        sub_1000318E8();
        char v65 = sub_100031A78();
        uint64_t v66 = v71;
        v71(v49, v60);
        (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v58, v59, v61);
        if (v65)
        {
          (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v61);
          return;
        }
        sub_1000318C8();
        char v67 = sub_100031A78();
        v66(v49, v60);
        (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v61);
        if (v67) {
          goto LABEL_6;
        }
      }
    }
  }
}

uint64_t sub_100015C68(char a1)
{
  uint64_t v3 = sub_100031B18();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000315F8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  id v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v25 - v11;
  sub_1000315D8();
  uint64_t v13 = v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_lastPulseDate;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v13, v6);
  sub_100031588();
  double v15 = v14;
  uint64_t v28 = v7;
  char v30 = *(void (**)(char *, uint64_t))(v7 + 8);
  v30(v10, v6);
  uint64_t v29 = v1;
  uint64_t v16 = qword_100044920;
  uint64_t v17 = off_100044928;
  swift_retain();
  swift_bridgeObjectRetain();
  v31._countAndFlagsBits = v16;
  v31._object = v17;
  LOBYTE(v16) = sub_100031938(v31);
  swift_release();
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0 && (v15 > 480.0) | a1 & 1)
  {
    sub_100031AD8();
    uint64_t v18 = sub_100031AF8();
    os_log_type_t v19 = sub_100031F18();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Starting location dot pulse.", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
    uint64_t v21 = v29;
    id v22 = *(void **)(v29 + 16);
    swift_retain();
    id v23 = v22;
    swift_bridgeObjectRetain();
    sub_100031968();
    swift_release();

    swift_bridgeObjectRelease();
    [*(id *)(v21 + 24) pulseLocationDot];
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 24))(v13, v12, v6);
    swift_endAccess();
  }
  return ((uint64_t (*)(char *, uint64_t))v30)(v12, v6);
}

id sub_100015FF0()
{
  uint64_t v1 = sub_100031A98();
  uint64_t v30 = *(void *)(v1 - 8);
  uint64_t v31 = v1;
  __chkstk_darwin(v1);
  uint64_t v29 = &v27[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_100031848();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v27[-v8];
  uint64_t v32 = v0;
  uint64_t v10 = v0 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState;
  swift_beginAccess();
  uint64_t v11 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v10, v3);
  char v12 = sub_1000317F8();
  uint64_t v13 = *(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8);
  id result = (id)v13(v9, v3);
  if ((v12 & 1) == 0)
  {
    v11(v7, v10, v3);
    char v15 = sub_1000317E8();
    v13(v7, v3);
    if (v15) {
      goto LABEL_4;
    }
    uint64_t v16 = v32 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_wakeState;
    swift_beginAccess();
    uint64_t v17 = v29;
    uint64_t v18 = v30;
    uint64_t v19 = v16;
    uint64_t v20 = v31;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v30 + 16))(v29, v19, v31);
    int v28 = sub_100031A38();
    id result = (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v18 + 8))(v17, v20);
    if ((v28 & 1) == 0)
    {
LABEL_4:
      uint64_t v21 = v32;
      id v22 = *(void **)(v32 + 24);
      v11(v7, v10, v3);
      char v23 = sub_100031828();
      v13(v7, v3);
      double v24 = 0.0;
      if ((v23 & 1) != 0 && ([v22 forceDisableLocationDot] & 1) == 0)
      {
        id v25 = *(id *)(v21 + 16);
        char v26 = sub_100031EC8();

        if ((v26 & 1) == 0)
        {
          if (sub_10000D590()) {
            double v24 = 1.0;
          }
          else {
            double v24 = 0.0;
          }
        }
      }
      return [v22 setLocationDotAlpha:v24];
    }
  }
  return result;
}

uint64_t sub_10001630C(float a1, float a2, float a3)
{
  uint64_t v4 = v3;
  swift_retain();
  uint64_t v6 = sub_1000319B8();
  swift_release();
  id v7 = *(id *)(v3 + 16);
  uint64_t v8 = sub_10000BF54(v7, v6);
  float v10 = v9;
  float v12 = v11;
  float v14 = v13;
  uint64_t v15 = v8;

  uint64_t v105 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista;
  uint64_t v106 = *(void **)(v4 + 24);
  float v113 = a3;
  if (*(void *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista) == 2
    || (uint64_t v16 = v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration,
        swift_beginAccess(),
        uint64_t v17 = *(void **)(v16 + 16),
        v17 == (void *)1))
  {
    uint64_t v16 = v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
    char v18 = *(unsigned char *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 8);
    uint64_t v17 = *(void **)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
  }
  else
  {
    char v18 = *(unsigned char *)(v16 + 8) & 1;
  }
  uint64_t v20 = *(void (**)(uint64_t))(v16 + 32);
  uint64_t v19 = *(void *)(v16 + 40);
  uint64_t v21 = *(void **)(v16 + 24);
  uint64_t v22 = *(void *)v16;
  id v23 = v21;
  id v24 = v17;
  sub_10000633C((uint64_t)v20);
  float v25 = sub_10000C228(v22, v18, v17, v20, v19, v15, v10, v12, v14);
  float32x2_t v27 = v26;
  float32x2_t v116 = v28;
  int v104 = v29;
  float v30 = sub_10000C2EC(v22, v18, v17, v20, v19, v15, v10, v12, v14);
  double v115 = v23;
  uint64_t v103 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista;
  float32x2_t v95 = v31;
  float32x2_t v98 = v32;
  if (*(void *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista) == 2
    || (uint64_t v33 = v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration,
        swift_beginAccess(),
        char v34 = *(void **)(v33 + 16),
        v34 == (void *)1))
  {
    float v35 = v30;
    uint64_t v33 = v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
    char v36 = *(unsigned char *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 8);
    char v34 = *(void **)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
  }
  else
  {
    float v35 = v30;
    char v36 = *(unsigned char *)(v33 + 8) & 1;
  }
  float v38 = *(void (**)(uint64_t))(v33 + 32);
  uint64_t v37 = *(void *)(v33 + 40);
  char v39 = *(void **)(v33 + 24);
  uint64_t v40 = *(void *)v33;
  id v102 = v39;
  id v114 = v34;
  sub_10000633C((uint64_t)v38);
  float v41 = sub_10000C228(v40, v36, v34, v38, v37, v15, v10, v12, v14);
  float32x2_t v43 = v42;
  float32x2_t v117 = v44;
  int v101 = v45;
  float v46 = sub_10000C2EC(v40, v36, v34, v38, v37, v15, v10, v12, v14);
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed) == 1)
  {
    if (a2 > 0.0)
    {
      float32x2_t v27 = vmla_n_f32(v27, vsub_f32(v95, v27), a2);
      float v25 = v25 + (float)(a2 * (float)(v35 - v25));
      float32x2_t v116 = vmla_n_f32(v116, vsub_f32(v98, v116), a2);
    }
    int v49 = v24;
    if (v113 <= 0.0 || UIAccessibilityIsReduceMotionEnabled())
    {
      float v50 = a1;
      uint64_t v52 = v105;
      uint64_t v51 = v106;
      int v53 = v104;
      float32x2_t v54 = v116;
      float32x2_t v55 = v117;
      uint64_t v57 = v102;
      uint64_t v56 = v103;
      int v58 = v101;
      float v59 = v41;
      goto LABEL_39;
    }
    uint64_t v60 = (uint64_t *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
    swift_beginAccess();
    uint64_t v61 = *v60;
    uint64_t v62 = v60[1];
    uint64_t v64 = (void *)v60[2];
    uint64_t v63 = (void *)v60[3];
    uint64_t v65 = v60[4];
    if (v64 == (void *)1)
    {
      uint64_t v99 = *(void *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
      os_log_type_t v109 = *(void **)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      uint64_t v66 = *(void *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 32);
      uint64_t v89 = v60[1];
      uint64_t v91 = *v60;
      uint64_t v85 = v60[4];
      uint64_t v87 = (void *)v60[3];
      id v96 = *(id *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
      id v93 = v109;
      uint64_t v110 = v66;
      sub_10000633C(v66);
      uint64_t v65 = v85;
      uint64_t v63 = v87;
      uint64_t v62 = v89;
      uint64_t v61 = v91;
    }
    else
    {
      id v93 = (id)v60[2];
      id v96 = (id)v60[3];
      uint64_t v99 = *v60;
      uint64_t v110 = v60[4];
    }
    uint64_t v57 = v102;
    float v59 = v41;
    sub_10001C304(v61, v62, v64, v63, v65);
    sub_10000A35C(v99);
    uint64_t v75 = v74;
    uint64_t v77 = v76;

    sub_10000640C(v110);
    if ((v77 & 0x10000000000) == 0)
    {
      if ((v77 & (unint64_t)&_mh_execute_header) == 0) {
        float v25 = v25 + (float)(v113 * (float)((float)(v25 * *(float *)&v77) - v25));
      }
      float v50 = a1;
      uint64_t v52 = v105;
      uint64_t v51 = v106;
      int v53 = v104;
      float32x2_t v54 = v116;
      float32x2_t v55 = v117;
      uint64_t v56 = v103;
      int v58 = v101;
      if ((v75 & 0x100000000) == 0) {
        v54.f32[0] = v116.f32[0] + (float)((float)(v113 * (float)(*(float *)&v75 / -15.0)) + 0.0);
      }
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  float32x2_t v55 = v117;
  float v59 = v41;
  if (a2 > 0.0)
  {
    float32x2_t v43 = vmla_n_f32(v43, vsub_f32(v47, v43), a2);
    float v59 = v41 + (float)(a2 * (float)(v46 - v41));
    float32x2_t v55 = vmla_n_f32(v117, vsub_f32(v48, v117), a2);
  }
  int v49 = v24;
  if (v113 <= 0.0)
  {
    float v50 = a1;
    uint64_t v52 = v105;
    uint64_t v51 = v106;
    int v53 = v104;
    float32x2_t v54 = v116;
    uint64_t v57 = v102;
    uint64_t v56 = v103;
    int v58 = v101;
    goto LABEL_39;
  }
  float32x2_t v117 = v55;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    float v50 = a1;
    uint64_t v52 = v105;
    uint64_t v51 = v106;
    int v53 = v104;
    float32x2_t v54 = v116;
    uint64_t v57 = v102;
    uint64_t v56 = v103;
LABEL_38:
    int v58 = v101;
    float32x2_t v55 = v117;
    goto LABEL_39;
  }
  char v67 = (uint64_t *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
  swift_beginAccess();
  uint64_t v68 = *v67;
  uint64_t v69 = v67[1];
  int v71 = (void *)v67[2];
  unsigned int v70 = (void *)v67[3];
  uint64_t v72 = v67[4];
  if (v71 == (void *)1)
  {
    uint64_t v100 = *(void *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
    id v111 = *(void **)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
    uint64_t v73 = *(void *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 32);
    uint64_t v90 = v67[1];
    uint64_t v92 = *v67;
    uint64_t v86 = v67[4];
    Swift::String v88 = (void *)v67[3];
    id v97 = *(id *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
    id v94 = v111;
    uint64_t v112 = v73;
    sub_10000633C(v73);
    uint64_t v72 = v86;
    unsigned int v70 = v88;
    uint64_t v69 = v90;
    uint64_t v68 = v92;
  }
  else
  {
    id v94 = (id)v67[2];
    id v97 = (id)v67[3];
    uint64_t v100 = *v67;
    uint64_t v112 = v67[4];
  }
  uint64_t v57 = v102;
  sub_10001C304(v68, v69, v71, v70, v72);
  sub_10000A35C(v100);
  uint64_t v79 = v78;
  uint64_t v81 = v80;

  sub_10000640C(v112);
  if ((v81 & 0x10000000000) != 0)
  {
LABEL_37:
    float v50 = a1;
    uint64_t v52 = v105;
    uint64_t v51 = v106;
    int v53 = v104;
    float32x2_t v54 = v116;
    uint64_t v56 = v103;
    goto LABEL_38;
  }
  if ((v81 & (unint64_t)&_mh_execute_header) == 0) {
    float v59 = v59 + (float)(v113 * (float)((float)(v59 * *(float *)&v81) - v59));
  }
  float v50 = a1;
  uint64_t v52 = v105;
  uint64_t v51 = v106;
  int v53 = v104;
  float32x2_t v54 = v116;
  float32x2_t v55 = v117;
  uint64_t v56 = v103;
  int v58 = v101;
  if ((v79 & 0x100000000) == 0) {
    v55.f32[0] = v117.f32[0] + (float)((float)(v113 * (float)(*(float *)&v79 / -15.0)) + 0.0);
  }
LABEL_39:
  uint64_t v82 = *(void *)(v4 + v52);
  uint64_t v83 = *(void *)(v4 + v56);
  float v122 = v25;
  float32x2_t v123 = v27;
  float32x2_t v124 = v54;
  int v125 = v53;
  float v118 = v59;
  float32x2_t v119 = v43;
  float32x2_t v120 = v55;
  int v121 = v58;
  [v51 applyTransitionFraction:v82 fromVista:&v122 fromStyleDefinition:v83 toVista:&v118 toStyleDefinition:v50];

  sub_10000640C((uint64_t)v38);
  return sub_10000640C((uint64_t)v20);
}

void sub_1000169E4(double a1, double a2)
{
  uint64_t v145 = sub_100031A98();
  uint64_t v144 = *(void *)(v145 - 8);
  __chkstk_darwin(v145);
  uint64_t v143 = (uint64_t)&v132 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031848();
  uint64_t v149 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v142 = (char *)&v132 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v146 = (char *)&v132 - v12;
  __chkstk_darwin(v11);
  float v14 = (char *)&v132 - v13;
  uint64_t v15 = (void *)sub_100031B18();
  uint64_t v16 = *(v15 - 1);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v147 = (void (*)(char *, uint64_t))((char *)&v132 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v132 - v19;
  sub_100031AD8();
  uint64_t v21 = sub_100031AF8();
  os_log_type_t v22 = sub_100031F18();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 134218240;
    double v151 = a1;
    sub_100031FD8();
    *(_WORD *)(v23 + 12) = 2048;
    double v151 = a2;
    sub_100031FD8();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "didReceiveTapAt: %f, %f", (uint8_t *)v23, 0x16u);
    swift_slowDealloc();
  }

  float32x2_t v26 = *(void (**)(void, void))(v16 + 8);
  float v25 = (void *)(v16 + 8);
  id v24 = v26;
  v26(v20, v15);
  uint64_t v27 = v150 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
  if (*(void *)(v150 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration) == 2)
  {
    id v135 = v24;
    double v136 = v25;
    Swift::String v137 = v15;
    int v134 = v8;
    uint64_t v148 = v5;
    uint64_t v28 = *(void *)(v27 + 32);
    uint64_t v29 = *(void *)(v27 + 40);
    float32x2_t v31 = *(void **)(v27 + 16);
    float v30 = *(void **)(v27 + 24);
    uint64_t v32 = v150 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState;
    swift_beginAccess();
    uint64_t v33 = v149;
    char v34 = *(void (**)(char *, uint64_t, uint64_t))(v149 + 16);
    v34(v14, v32, v148);
    id v138 = v30;
    id v139 = v31;
    uint64_t v140 = v28;
    uint64_t v35 = v28;
    uint64_t v36 = v148;
    uint64_t v141 = v29;
    sub_10000633C(v35);
    LOBYTE(v30) = sub_1000317F8();
    char v39 = *(char **)(v33 + 8);
    uint64_t v37 = v33 + 8;
    float v38 = v39;
    ((void (*)(char *, uint64_t))v39)(v14, v36);
    if ((v30 & 1) == 0)
    {
      float32x2_t v44 = v146;
      v34(v146, v32, v36);
      char v45 = sub_1000317E8();
      ((void (*)(char *, uint64_t))v38)(v44, v36);
      if (v45) {
        goto LABEL_9;
      }
      uint64_t v46 = v150 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_wakeState;
      swift_beginAccess();
      uint64_t v47 = v144;
      uint64_t v48 = v143;
      uint64_t v49 = v145;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v144 + 16))(v143, v46, v145);
      LOBYTE(v46) = sub_100031A38();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v49);
      if ((v46 & 1) == 0)
      {
LABEL_9:
        uint64_t v149 = v37;
        uint64_t v50 = v150;
        sub_100013594();
        uint64_t v51 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive;
        if (*(unsigned char *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive) == 1)
        {
          CFTimeInterval v52 = CACurrentMediaTime();
          uint64_t v53 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationStartTime;
          *(float *)&CFTimeInterval v52 = v52
                         - *(double *)(v50
                                     + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationStartTime);
          uint64_t v54 = v50;
          uint64_t v55 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationTimeOffset;
          float v56 = *(float *)(v54 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationTimeOffset)
              + *(float *)&v52;
          if (v56 <= 1.5) {
            float v57 = v56;
          }
          else {
            float v57 = 1.5;
          }
          uint64_t v58 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask;
          if (*(void *)(v54 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask))
          {
            swift_retain();
            sub_1000048F0(&qword_1000454C0);
            sub_100031DF8();
            *(void *)(v54 + v58) = 0;
            swift_release();
            uint64_t v59 = qword_100044970;
            uint64_t v60 = off_100044978;
            swift_retain();
            swift_bridgeObjectRetain();
            v155._countAndFlagsBits = v59;
            v155._object = v60;
            sub_100031928(v155);
            swift_release();
            swift_release();
            swift_bridgeObjectRelease();
          }
          float v61 = (float)(v57 + 0.1) * 1000000000.0;
          if ((~LODWORD(v61) & 0x7F800000) != 0)
          {
            if (v61 > -1.0)
            {
              if (v61 < 1.8447e19)
              {
                uint64_t v62 = v150;
                sub_100014D84((unint64_t)v61);
                uint64_t v63 = qword_100044960;
                uint64_t v64 = off_100044968;
                swift_retain();
                swift_bridgeObjectRetain();
                v156._countAndFlagsBits = v63;
                v156._object = v64;
                sub_100031928(v156);
                swift_release();
                swift_bridgeObjectRelease();
                uint64_t v65 = *(void **)(v62 + 16);
                swift_retain();
                id v66 = v65;
                swift_bridgeObjectRetain();
                sub_100031968();
                swift_release();

                swift_bridgeObjectRelease();
                *(CFTimeInterval *)(v62 + v53) = CACurrentMediaTime();
                *(float *)(v62 + v55) = 1.5 - v57;
                swift_retain();
                sub_1000317B8();

                sub_10000640C(v140);
                swift_release();
                *(unsigned char *)(v62 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed) = (*(unsigned char *)(v62 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed) & 1) == 0;
                return;
              }
              goto LABEL_57;
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
LABEL_57:
          __break(1u);
          return;
        }
        uint64_t v147 = (void (*)(char *, uint64_t))v38;
        char v67 = *(void **)(v50 + 24);
        uint64_t v68 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista;
        uint64_t v69 = *(void *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista);
        if (v69 == 2
          && (uint64_t v70 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista,
              *(void *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista) == 2))
        {
          id v71 = [*(id *)(v50 + 24) vistaView];
          id v72 = objc_msgSend(v71, "spheroidAtPoint:", a1, a2);

          if (!v72)
          {
LABEL_53:

            sub_10000640C(v140);
            return;
          }
          double v136 = v67;
          *(void *)(v50 + v70) = 2;
          id v135 = v72;
          [v72 type];
          *(void *)(v50 + v68) = NUNIAstronomyVistaView_SpheroidTypeToVista();
          uint64_t v145 = *(void *)v27;
          uint64_t v144 = *(unsigned __int8 *)(v27 + 8);
          uint64_t v73 = *(void **)(v27 + 16);
          uint64_t v74 = *(void **)(v27 + 24);
          uint64_t v75 = *(void *)(v27 + 32);
          uint64_t v76 = *(void *)(v27 + 40);
          uint64_t v77 = (uint64_t *)(v150 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
          swift_beginAccess();
          uint64_t v78 = *v77;
          uint64_t v143 = v77[1];
          uint64_t v79 = (void *)v77[3];
          Swift::String v137 = (void *)v77[2];
          uint64_t v133 = v68;
          uint64_t v80 = v77[4];
          uint64_t v81 = v144;
          *uint64_t v77 = v145;
          v77[1] = v81;
          v77[2] = (uint64_t)v73;
          v77[3] = (uint64_t)v74;
          v77[4] = v75;
          v77[5] = v76;
          id v82 = v74;
          uint64_t v50 = v150;
          id v83 = v73;
          sub_10000633C(v75);
          sub_100009A54(v78, v143, v137, v79, v80);
          uint64_t v85 = sub_10000D024();
          uint64_t v86 = *(void **)(v84 + 16);
          if (v86 == (void *)1)
          {
            ((void (*)(double *, void))v85)(&v151, 0);
            uint64_t v68 = v133;
          }
          else
          {
            int v104 = (void *)v84;
            uint64_t v105 = *(void *)(v84 + 32);
            id v106 = *(id *)(v84 + 24);
            id v107 = v86;
            sub_10000633C(v105);

            uint64_t v50 = v150;
            sub_10000640C(v105);
            uint64_t v68 = v133;
            *int v104 = *(void *)(v50 + v133);
            ((void (*)(double *, void))v85)(&v151, 0);
          }
          os_log_type_t v109 = sub_10000D024();
          uint64_t v110 = *(void **)(v108 + 16);
          if (v110 != (void *)1)
          {
            uint64_t v111 = v108;
            uint64_t v112 = *(void *)(v108 + 32);
            id v113 = *(id *)(v108 + 24);
            id v114 = v110;
            sub_10000633C(v112);

            uint64_t v50 = v150;
            sub_10000640C(v112);
            *(unsigned char *)(v111 + 8) = 0;
          }
          ((void (*)(double *, void))v109)(&v151, 0);

          uint64_t v36 = v148;
          char v67 = v136;
          if (!UIAccessibilityIsReduceMotionEnabled())
          {
LABEL_39:
            *(unsigned char *)(v50 + v51) = 1;
            double v115 = *(void **)(v50 + 16);
            swift_retain();
            id v116 = v115;
            swift_bridgeObjectRetain();
            sub_100031968();
            swift_release();

            swift_bridgeObjectRelease();
            if ([v67 mode]) {
              [v67 applyMode:0];
            }
            uint64_t v117 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask;
            if (*(void *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask))
            {
              swift_retain();
              sub_1000048F0(&qword_1000454C0);
              sub_100031DF8();
              *(void *)(v50 + v117) = 0;
              swift_release();
              uint64_t v118 = qword_100044970;
              float32x2_t v119 = off_100044978;
              swift_retain();
              swift_bridgeObjectRetain();
              v157._countAndFlagsBits = v118;
              v157._object = v119;
              sub_100031928(v157);
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
            }
            sub_100014D84(1600000000);
            *(CFTimeInterval *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationStartTime) = CACurrentMediaTime();
            *(_DWORD *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationTimeOffset) = 0;
            *(unsigned char *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed) = 0;
            swift_retain();
            sub_1000317B8();
            swift_release();
            sub_10001630C(0.0, 0.0, 0.0);
            goto LABEL_53;
          }
        }
        else
        {
          if ((*(unsigned char *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed) & 1) == 0)
          {
            uint64_t v87 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista;
            *(void *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista) = *(void *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista);
            *(void *)(v50 + v87) = v69;
          }
          if (!UIAccessibilityIsReduceMotionEnabled()) {
            goto LABEL_39;
          }
        }
        if ([v67 mode]) {
          [v67 applyMode:0];
        }
        sub_10001630C(1.0, 0.0, 0.0);
        if (*(void *)(v50 + v68) == 2)
        {
          *(void *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista) = 2;
          Swift::String v88 = (uint64_t *)(v50 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
          swift_beginAccess();
          uint64_t v89 = *v88;
          uint64_t v90 = v88[1];
          uint64_t v91 = (void *)v88[2];
          uint64_t v92 = (void *)v88[3];
          uint64_t v93 = v88[4];
          uint64_t *v88 = 0;
          v88[1] = 0;
          v88[2] = 1;
          v88[3] = 0;
          v88[4] = 0;
          v88[5] = 0;
          sub_100009A54(v89, v90, v91, v92, v93);
          [v67 setVista:2];
          id v94 = *(id *)(v50 + 16);
          float32x2_t v95 = v142;
          sub_100031E98();

          LOBYTE(v88) = sub_100031828();
          v147(v95, v36);
          if ((v88 & 1) != 0
            || (id v96 = *(id *)(v50 + 16),
                id v97 = v146,
                sub_100031E98(),
                v96,
                sub_100031838(),
                double v99 = v98,
                v147(v97, v36),
                v99 < 0.01))
          {
            float v100 = sub_10000D084();
          }
          else
          {
            float v100 = sub_10000D238();
          }
          *(float *)&double v151 = v100;
          uint64_t v152 = v101;
          uint64_t v153 = v102;
          int v154 = v103;
          [v67 applyStyleDefinition:&v151];
          if (*(void *)(v50 + v68) == 2) {
            goto LABEL_51;
          }
        }
        objc_msgSend(v67, "setVista:");
        id v120 = *(id *)(v50 + 16);
        int v121 = v134;
        sub_100031E98();

        char v122 = sub_100031828();
        float32x2_t v123 = v147;
        v147(v121, v36);
        if ((v122 & 1) != 0
          || (id v124 = *(id *)(v50 + 16),
              int v125 = v146,
              sub_100031E98(),
              v124,
              sub_100031838(),
              double v127 = v126,
              v123(v125, v36),
              v127 < 0.01))
        {
          float v128 = sub_10000D084();
        }
        else
        {
          float v128 = sub_10000D238();
        }
        *(float *)&double v151 = v128;
        uint64_t v152 = v129;
        uint64_t v153 = v130;
        int v154 = v131;
        [v67 applyStyleDefinition:&v151];
        if (*(void *)(v50 + v68))
        {
LABEL_51:
          sub_100014D84(200000000);
        }
        else
        {
          sub_100015FF0();
          sub_100015C68(1);
        }
        goto LABEL_53;
      }
    }
    uint64_t v40 = v147;
    sub_100031AD8();
    float v41 = sub_100031AF8();
    os_log_type_t v42 = sub_100031F18();
    if (os_log_type_enabled(v41, v42))
    {
      float32x2_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)float32x2_t v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Tap received while transitioning.  Not performing tap animation", v43, 2u);
      swift_slowDealloc();

      sub_10000640C(v140);
    }
    else
    {

      sub_10000640C(v140);
    }
    ((void (*)(void, void *))v135)(v40, v137);
  }
}

id sub_10001797C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031848();
  *(void *)&long long v119 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v107 - v6;
  uint64_t v8 = sub_100031B18();
  uint64_t v117 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  *(void *)&long long v121 = (char *)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000048F0(&qword_100045110);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100031858();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = v0[2];
  sub_100031EA8();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_1000098B4((uint64_t)v12, &qword_100045110);
    return 0;
  }
  uint64_t v109 = v8;
  uint64_t v110 = v7;
  uint64_t v108 = v5;
  uint64_t v111 = v2;
  uint64_t v115 = v14;
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v116 = v13;
  v18(v16, v12, v13);
  uint64_t v19 = *(uint64_t *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
  char v20 = *((unsigned char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 8);
  id v120 = v16;
  os_log_type_t v22 = *(id *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
  uint64_t v21 = *(id *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 24);
  uint64_t v23 = v1;
  uint64_t v25 = *(uint64_t *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 32);
  uint64_t v24 = *(uint64_t *)((char *)v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 40);
  id v26 = v23[2];
  uint64_t v118 = v21;
  id v27 = v22;
  sub_10000633C(v25);
  id v28 = objc_msgSend(objc_msgSend(v26, "environment"), "deviceOrientation");
  swift_unknownObjectRelease();
  id v29 = v23[2];
  uint64_t v30 = sub_10000BF54(v29, (uint64_t)v28);
  int v32 = v31;
  int v34 = v33;
  int v36 = v35;
  uint64_t v37 = v30;

  uint64_t v124 = v19;
  char v125 = v20;
  double v126 = v22;
  double v127 = v21;
  uint64_t v38 = (uint64_t)v120;
  uint64_t v128 = v25;
  uint64_t v129 = v24;
  int v130 = v32;
  int v131 = v34;
  int v132 = v36;
  uint64_t v133 = v37;
  id v39 = v27;
  uint64_t v40 = v118;
  uint64_t v113 = v25;
  uint64_t v114 = v24;
  sub_10000633C(v25);
  sub_10000710C(v38);
  os_log_type_t v42 = v41;
  uint64_t v118 = v23;
  id v43 = [v23[3] vistaView];
  [v43 removeBackBuffers];

  uint64_t v44 = v121;
  sub_100031AC8();
  char v45 = v42;
  uint64_t v46 = sub_100031AF8();
  os_log_type_t v47 = sub_100031EF8();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v112 = v45;
  if (v48)
  {
    uint64_t v49 = swift_slowAlloc();
    id v107 = v40;
    uint64_t v50 = (uint8_t *)v49;
    uint64_t v51 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v50 = 138412290;
    v122[0] = v45;
    id v52 = v39;
    uint64_t v53 = v45;
    uint64_t v44 = v121;
    sub_100031FD8();
    *uint64_t v51 = v45;

    id v39 = v52;
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Taking snapshot for key: %@", v50, 0xCu);
    sub_1000048F0(&qword_100045128);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v40 = v107;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v46 = v45;
  }

  (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v44, v109);
  uint64_t v54 = v118;
  id v55 = sub_10001881C();
  id v56 = v54[2];
  float v57 = v110;
  sub_100031E98();

  char v58 = sub_100031828();
  uint64_t v59 = *(void (**)(char *, uint64_t))(v119 + 8);
  uint64_t v60 = v111;
  v59(v57, v111);
  if ((v58 & 1) != 0
    || (id v61 = v54[2],
        uint64_t v62 = v108,
        sub_100031E98(),
        v61,
        sub_100031838(),
        double v64 = v63,
        v59(v62, v60),
        v64 < 0.01))
  {
    float v65 = sub_10000D084();
  }
  else
  {
    float v65 = sub_10000D238();
  }
  *(float *)char v122 = v65;
  v122[1] = v66;
  v122[2] = v67;
  int v123 = v68;
  [v55 applyStyleDefinition:v122];
  id v69 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:37.33182 longitude:-122.03118];
  [v55 updateLocation:v39 fallbackLocation:v69 animated:0];

  id v70 = [v55 vistaView];
  [v70 updateSunLocationAnimated:0];

  id v71 = v54[2];
  unsigned __int8 v72 = sub_10000D590();
  unsigned __int8 v73 = objc_msgSend(objc_msgSend(v71, "environment"), "isPreview");
  swift_unknownObjectRelease();
  if ((v73 & 1) != 0 || (v72 & 1) == 0)
  {

    double v76 = 0.0;
  }
  else
  {
    uint64_t v74 = v108;
    sub_100031E98();
    char v75 = sub_100031828();
    v59(v74, v60);

    double v76 = 0.0;
    if (v75) {
      double v76 = 1.0;
    }
  }
  uint64_t v77 = v118;
  [v55 setLocationDotAlpha:v76];
  uint64_t v78 = (char *)objc_msgSend(objc_msgSend(v77[2], "environment"), "deviceOrientation");
  swift_unknownObjectRelease();
  float v79 = 0.0;
  uint64_t v80 = v120;
  if ((unint64_t)(v78 - 2) < 3) {
    float v79 = flt_10003340C[(void)(v78 - 2)];
  }
  id v81 = [v55 vistaView];
  id v82 = [v81 scene];

  [v82 restingCameraRoll];
  float v84 = v83;
  [v82 cameraPosition];
  long long v121 = v85;
  [v82 cameraTarget];
  long long v119 = v86;
  [v82 cameraUp];
  *(float *)&double v87 = v79 + v84;
  [v82 setCamera:*(double *)&v121 target:*(double *)&v119 up:v88 roll:v87];
  [v82 updateCamera];
  id v89 = v77[2];
  sub_100031EB8();
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;

  unint64_t v98 = sub_1000065E4();
  if (!v98)
  {

    uint64_t v105 = v113;
    sub_10000640C(v113);

    sub_10000640C(v105);
    (*(void (**)(char *, uint64_t))(v115 + 8))(v80, v116);
    return 0;
  }
  double v99 = (void *)v98;
  id v100 = [self mainScreen];
  [v100 scale];
  double v102 = v101;

  id v103 = objc_msgSend(v99, "snapshotInRect:scale:time:", v91, v93, v95, v97, v102, 0.0);
  uint64_t v104 = v113;
  sub_10000640C(v113);

  sub_10000640C(v104);
  (*(void (**)(char *, uint64_t))(v115 + 8))(v80, v116);
  return v103;
}

void sub_1000183D8(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v11 = [objc_allocWithZone((Class)CALayer) init];
  objc_msgSend(v11, "setFrame:", a2, a3, a4, a5);
  [v11 setCompositingFilter:kCAFilterDestOut];
  [v11 setOpaque:0];
  sub_1000048F0(&qword_100045200);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000332D0;
  *(void *)(inited + 32) = 0x73746E65746E6F63;
  *(void *)(inited + 40) = 0xE800000000000000;
  *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNull) init];
  sub_10000CF08(inited);
  sub_1000048F0(&qword_100045208);
  Class isa = sub_100031BB8().super.isa;
  swift_bridgeObjectRelease();
  [v11 setActions:isa];

  sub_10001D1B0(a1, (uint64_t)v23);
  uint64_t v14 = v24;
  if (v24)
  {
    uint64_t v15 = sub_10001D218(v23, v24);
    uint64_t v16 = *(void *)(v14 - 8);
    __chkstk_darwin(v15);
    uint64_t v18 = (char *)&v23[-1] - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v16 + 16))(v18);
    uint64_t v19 = sub_100032198();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v14);
    sub_100009B0C((uint64_t)v23);
  }
  else
  {
    uint64_t v19 = 0;
  }
  [v11 setContents:v19];
  swift_unknownObjectRelease();
  uint64_t v20 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotMaskLayer;
  [*(id *)(v5 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotMaskLayer) removeFromSuperlayer];
  uint64_t v21 = *(void **)(v5 + v20);
  *(void *)(v5 + v20) = v11;
}

void sub_100018678()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundImageView;
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundImageView);
  if (v7)
  {
    id v8 = v7;
    sub_100031AC8();
    uint64_t v9 = sub_100031AF8();
    os_log_type_t v10 = sub_100031EF8();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Removing background snapshot image view", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    [v8 removeFromSuperview];

    uint64_t v12 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = 0;
  }
  uint64_t v13 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundDebugColorView;
  uint64_t v14 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundDebugColorView);
  if (v14)
  {
    [v14 removeFromSuperview];
    uint64_t v15 = *(void **)(v1 + v13);
    *(void *)(v1 + v13) = 0;
  }
}

id sub_10001881C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000048F0(&qword_100045D50);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031B18();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotVistaController);
  if (v9)
  {
    id v10 = *(id *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotVistaController);
  }
  else
  {
    uint64_t v46 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotVistaController;
    sub_100031AC8();
    id v11 = sub_100031AF8();
    os_log_type_t v12 = sub_100031EF8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "creating snapshotVistaController", v13, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    id v14 = objc_msgSend(objc_msgSend(*(id *)(v1 + 16), "environment"), "deviceOrientation");
    swift_unknownObjectRelease();
    id v15 = *(id *)(v1 + 16);
    uint64_t v45 = sub_10000BF54(v15, (uint64_t)v14);

    long long v16 = *(_OWORD *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
    long long v47 = *(_OWORD *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
    long long v48 = v16;
    long long v49 = *(_OWORD *)(v1 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 32);
    uint64_t v17 = (void *)v16;
    sub_10001D0A8((uint64_t)&v48 + 8, (uint64_t)v50, &qword_100045100);
    long long v18 = v49;
    uint64_t v19 = *(void **)(v1 + 16);
    uint64_t v20 = v17;
    id v21 = v19;
    sub_1000063B4(v50);
    v44[1] = *((void *)&v18 + 1);
    sub_10000633C(v18);
    char v22 = sub_100031EC8();

    id v23 = [*(id *)(v1 + 16) backgroundView];
    [v23 bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    uint64_t v32 = sub_100031568();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v4, 1, 1, v32);
    int v33 = v20;
    if (!v17) {
      int v33 = (void **)[objc_allocWithZone((Class)CLLocation) initWithLatitude:37.33182 longitude:-122.03118];
    }
    uint64_t v34 = v47;
    char v35 = BYTE8(v47);
    uint64_t v36 = swift_allocObject();
    long long v37 = v48;
    *(_OWORD *)(v36 + 16) = v47;
    *(_OWORD *)(v36 + 32) = v37;
    *(_OWORD *)(v36 + 48) = v49;
    int v38 = v22 & 1;
    *(unsigned char *)(v36 + 64) = v22 & 1;
    id v39 = v20;
    sub_1000063B4(v50);
    sub_10000633C(v18);
    id v40 = sub_10000900C((uint64_t)v4, v34, v35, v33, v45, v38, (uint64_t)sub_10001D2C0, v36, v25, v27, v29, v31);

    swift_release();
    sub_1000098B4((uint64_t)v4, &qword_100045D50);
    if ([v40 mode] != (id)1) {
      [v40 applyMode:1];
    }

    sub_1000063E0(v50);
    sub_10000640C(v18);
    float v41 = *(void **)(v1 + v46);
    *(void *)(v1 + v46) = *((void *)&v18 + 1);
    id v10 = *((id *)&v18 + 1);

    uint64_t v9 = 0;
  }
  id v42 = v9;
  return v10;
}

uint64_t sub_100018E98()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 32))
    {
      __chkstk_darwin(result);
      id v3 = v2;
      sub_1000048F0((uint64_t *)&unk_100045580);
      sub_100031F58();

      uint64_t v4 = v8;
    }
    else
    {
      uint64_t v4 = 0;
    }
    id v5 = *(id *)(v1 + 16);
    sub_100018FF0(v4, v5);

    uint64_t v6 = qword_100044930;
    uint64_t v7 = off_100044938;
    swift_retain();
    swift_bridgeObjectRetain();
    v9._countAndFlagsBits = v6;
    v9._object = v7;
    sub_100031928(v9);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_100018FF0(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v56 = a1;
  uint64_t v5 = sub_100031B18();
  uint64_t v57 = *(void *)(v5 - 8);
  uint64_t v58 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v54 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v55 = (char *)&v50 - v8;
  uint64_t v9 = sub_100031A98();
  uint64_t v51 = *(void *)(v9 - 8);
  uint64_t v52 = v9;
  __chkstk_darwin(v9);
  uint64_t v50 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100031848();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v50 - v16;
  long long v18 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = a2;
  id v19 = a2;

  uint64_t v53 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tokenManager;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100031968();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v20 = v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState;
  swift_beginAccess();
  id v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v21(v17, v20, v11);
  LOBYTE(a2) = sub_1000317F8();
  char v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  v22(v17, v11);
  if (a2) {
    goto LABEL_4;
  }
  v21(v15, v20, v11);
  char v23 = sub_1000317E8();
  v22(v15, v11);
  if (v23) {
    goto LABEL_7;
  }
  uint64_t v24 = v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_wakeState;
  swift_beginAccess();
  double v25 = v50;
  uint64_t v26 = v51;
  uint64_t v27 = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v24, v52);
  LOBYTE(v24) = sub_100031A38();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
  if (v24)
  {
LABEL_4:
    double v28 = v55;
    sub_100031AD8();
    double v29 = sub_100031AF8();
    os_log_type_t v30 = sub_100031F18();
    if (os_log_type_enabled(v29, v30))
    {
      double v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Received location update call but currently transitioning; queue location update",
        v31,
        2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v57 + 8))(v28, v58);
    uint64_t v32 = *(void **)(v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_queuedLocationUpdate);
    int v33 = v56;
    *(void *)(v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_queuedLocationUpdate) = v56;
    id v34 = v33;
  }
  else
  {
LABEL_7:
    sub_1000137B4(v56);
    char v35 = *(void **)(v3 + 24);
    id v36 = *(id *)(v3 + 16);
    char v37 = sub_100031EC8();

    [v35 disableCloudDataFetch:v37 & 1];
    id v38 = *(id *)(v3 + 16);
    char v39 = sub_100031E88();

    if (v39) {
      sub_100010860();
    }
    else {
      sub_100011EB0();
    }
    id v40 = [v35 vistaView];
    [v40 purgeUnused];

    uint64_t v41 = qword_100044930;
    id v42 = off_100044938;
    swift_retain();
    swift_bridgeObjectRetain();
    v62._countAndFlagsBits = v41;
    v62._object = v42;
    sub_100031928(v62);
    swift_release();
    swift_bridgeObjectRelease();
    id v43 = v54;
    sub_100031AD8();
    swift_retain_n();
    uint64_t v44 = sub_100031AF8();
    os_log_type_t v45 = sub_100031F18();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136315138;
      long long v47 = *(void **)(v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      if (v47)
      {
        id v48 = *(id *)(v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      }
      else
      {
        id v48 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:37.33182 longitude:-122.03118];
        long long v47 = 0;
      }
      id v56 = v46 + 4;
      uint64_t v59 = 0;
      unint64_t v60 = 0xE000000000000000;
      id v49 = v47;
      [v48 coordinate];
      sub_100031E48();
      v63._countAndFlagsBits = 44;
      v63._object = (void *)0xE100000000000000;
      sub_100031CA8(v63);
      [v48 coordinate];
      sub_100031E48();

      uint64_t v59 = sub_10001B510(v59, v60, &v61);
      sub_100031FD8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Updated location to %s", v46, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v57 + 8))(v54, v58);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v43, v58);
    }
  }
}

uint64_t sub_1000196EC(uint64_t a1)
{
  uint64_t v2 = sub_100031488();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_100031478();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000197E0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v1 = *(id *)(result + 16);
    sub_100018FF0(0, v1);

    uint64_t v2 = qword_100044930;
    uint64_t v3 = off_100044938;
    swift_retain();
    swift_bridgeObjectRetain();
    v4._countAndFlagsBits = v2;
    v4._object = v3;
    sub_100031928(v4);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000198A0(void *a1, double a2, float a3, float a4, uint64_t a5, float32x2_t *a6, float32x2_t *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(void *)&long long v73 = a10;
  uint64_t v71 = a9;
  v74[0] = a2;
  uint64_t v20 = sub_100031868();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  char v23 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v25 = result;
    uint64_t v68 = v21;
    uint64_t v69 = a8;
    uint64_t v70 = a11;
    uint64_t v26 = (float *)&a6[2];
    uint64_t v27 = (float *)&a7[2];
    int v28 = *(unsigned __int8 *)(result
                             + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive);
    uint64_t v72 = a13;
    if (v28 == 1)
    {
      sub_10001630C(a4, *(float *)v74, a3);
    }
    else
    {
      uint64_t v67 = a12;
      swift_beginAccess();
      float32x2_t v29 = a6[3];
      swift_beginAccess();
      objc_msgSend(a1, "setCameraOffset:", COERCE_DOUBLE(vmla_n_f32(v29, vsub_f32(a7[3], v29), *(float *)v74)));
      if ((v73 & 0x10100000000) == 0)
      {
        float v30 = *(float *)&v73;
        swift_beginAccess();
        float v31 = *v26 + (float)(a3 * (float)((float)(*v26 * v30) - *v26));
        swift_beginAccess();
        *uint64_t v26 = v31;
      }
      uint64_t v32 = v72;
      if ((v72 & 0x10100000000) == 0)
      {
        swift_beginAccess();
        float v33 = *v27 + (float)(*(float *)v74 * (float)((float)(*v27 * *(float *)&v32) - *v27));
        swift_beginAccess();
        *uint64_t v27 = v33;
      }
      swift_beginAccess();
      float v34 = a6[2].f32[0];
      swift_beginAccess();
      *(float *)&double v35 = v34 + (float)(*(float *)v74 * (float)(a7[2].f32[0] - v34));
      [a1 setCameraOrbit:v35];
      swift_beginAccess();
      *(float32x2_t *)&long long v36 = a6[4];
      long long v66 = v36;
      swift_beginAccess();
      CLLocationCoordinate2DMake(0.0, 0.0);
      float v37 = *(float *)&v71;
      if (v73 & 0x10000000000 | v71 & (unint64_t)&_mh_execute_header) {
        float v37 = 0.0;
      }
      float v38 = *(float *)&v67;
      if (v32 & 0x10000000000 | v67 & (unint64_t)&_mh_execute_header) {
        float v38 = 0.0;
      }
      CLLocationCoordinate2DMake(0.0, (float)((float)((float)(a3 * v37) + 0.0)+ (float)(*(float *)v74 * (float)(v38 - (float)((float)(a3 * v37) + 0.0)))));
      NUNIAstronomyAddLocationCoordinates();
      objc_msgSend(a1, "setOffsetCoordinate:");
    }
    id v39 = [a1 spheroidOfType:3];
    if (v39)
    {
      id v40 = v39;
      swift_beginAccess();
      float v41 = a6[5].f32[0];
      swift_beginAccess();
      *(float *)&double v42 = sub_10001D59C(v41, a7[5].f32[0], *(float *)v74);
      [v40 setCloudOpacity:v42];
    }
    if (sub_10000D590())
    {
      if ([*(id *)(v25 + 24) forceDisableLocationDot])
      {
        uint64_t v43 = v68;
      }
      else
      {
        id v46 = *(id *)(v25 + 16);
        char v47 = sub_100031EC8();

        uint64_t v43 = v68;
        if ((v47 & 1) == 0) {
          sub_10000D590();
        }
      }
      uint64_t v48 = enum case for TimingFunction.easeOutExpo(_:);
      id v49 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 104);
      v49(v23, enum case for TimingFunction.easeOutExpo(_:), v20);
      sub_100031C18();
      uint64_t v50 = *(void (**)(char *, uint64_t))(v43 + 8);
      v50(v23, v20);
      CLKInterpolateBetweenFloatsClipped();
      *(float *)&double v51 = v51;
      [a1 setLocationDotAlpha:v51];
      v49(v23, v48, v20);
      sub_100031C18();
      v50(v23, v20);
      CLKInterpolateBetweenFloatsClipped();
      float v44 = v45;
    }
    else
    {
      float v44 = 0.0;
      [a1 setLocationDotAlpha:0.0];
    }
    float v53 = *(float *)&v69;
    float v52 = *(float *)&v70;
    unint64_t v54 = v72 & 0x10000000000 | v70 & (unint64_t)&_mh_execute_header;
    unint64_t v55 = v73 & 0x10000000000 | v69 & (unint64_t)&_mh_execute_header;
    *(float *)&double v45 = v44;
    [a1 setLocationDotPulseOverrideAlpha:v45];
    if (v55) {
      float v56 = 0.0;
    }
    else {
      float v56 = v53;
    }
    if (v54) {
      float v57 = 0.0;
    }
    else {
      float v57 = v52;
    }
    swift_retain();
    uint64_t v58 = sub_1000319B8();
    swift_release();
    float v59 = 0.0;
    if ((unint64_t)(v58 - 2) <= 2) {
      float v59 = flt_10003340C[v58 - 2];
    }
    [a1 restingCameraRoll];
    float v61 = (float)((float)((float)(a3 * v56) + 0.0)
                + (float)(*(float *)v74 * (float)(v57 - (float)((float)(a3 * v56) + 0.0))))
        + (float)(v59 + v60);
    [a1 cameraPosition];
    *(_OWORD *)uint64_t v74 = v62;
    [a1 cameraTarget];
    long long v73 = v63;
    [a1 cameraUp];
    *(float *)&double v64 = v61;
    [a1 setCamera:v74[0] target:*(double *)&v73 up:v65 roll:v64];
    return swift_release();
  }
  return result;
}

void sub_100019F34(char *a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v140 = a2;
  *(double *)&long long v144 = a3;
  uint64_t v6 = sub_100031848();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v136 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v136 - v11;
  uint64_t v141 = (void *)sub_100031B18();
  uint64_t v13 = *(v141 - 1);
  __chkstk_darwin(v141);
  id v15 = (char *)&v136 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AD8();
  uint64_t v16 = sub_100031AF8();
  os_log_type_t v17 = sub_100031F18();
  BOOL v18 = os_log_type_enabled(v16, v17);
  *(void *)&long long v143 = v4;
  *(void *)&long long v142 = v12;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    Swift::String v137 = v10;
    v146[0] = v20;
    *(_DWORD *)uint64_t v19 = 134218498;
    double v145 = *(float *)&v144;
    sub_100031FD8();
    *(_WORD *)(v19 + 12) = 2080;
    *(void *)&long long v139 = v6;
    uint64_t v21 = sub_100031F88();
    *(void *)&long long v138 = v7;
    double v145 = COERCE_DOUBLE(sub_10001B510(v21, v22, v146));
    sub_100031FD8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    double v136 = a1;
    uint64_t v23 = v140;
    uint64_t v24 = sub_100031F88();
    double v145 = COERCE_DOUBLE(sub_10001B510(v24, v25, v146));
    uint64_t v6 = v139;
    sub_100031FD8();
    uint64_t v7 = v138;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Renderer rotating: %f from: %s to: %s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    uint64_t v10 = v137;
    swift_slowDealloc();
    uint64_t v4 = v143;
    swift_slowDealloc();

    (*(void (**)(char *, void *))(v13 + 8))(v15, v141);
    uint64_t v26 = v136;
  }
  else
  {
    uint64_t v27 = a1;
    uint64_t v23 = v140;

    (*(void (**)(char *, void *))(v13 + 8))(v15, v141);
    uint64_t v26 = v27;
  }
  float v28 = 0.0;
  float v29 = 0.0;
  if ((unint64_t)(v26 - 2) <= 2) {
    float v29 = flt_10003340C[(void)(v26 - 2)];
  }
  if ((unint64_t)(v23 - 2) <= 2) {
    float v28 = flt_10003340C[v23 - 2];
  }
  float v30 = vabds_f32(v29, v28);
  if (v30 == 3.1416)
  {
    if (v29 < v28) {
      float v28 = v28 + -6.2832;
    }
  }
  else if (v30 > 3.1416)
  {
    if (v29 >= v28) {
      float v31 = -6.2832;
    }
    else {
      float v31 = 6.2832;
    }
    float v29 = v29 + v31;
  }
  id v32 = [*(id *)(v4 + 24) vistaView];
  float v33 = [v32 scene];

  uint64_t v34 = v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_rotationStartEnvironment;
  char v35 = *(unsigned char *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_rotationStartEnvironment + 24);
  uint64_t v141 = v33;
  if (v35)
  {
    id v36 = *(id *)(v4 + 16);
    uint64_t v37 = sub_10000BF54(v36, (uint64_t)v26);
    float v39 = v38;
    float v41 = v40;
    float v43 = v42;
    *(void *)&long long v139 = v37;
  }
  else
  {
    *(void *)&long long v139 = *(void *)(v34 + 16);
    float v39 = *(float *)v34;
    float v41 = *(float *)(v34 + 4);
    float v43 = *(float *)(v34 + 8);
  }
  id v44 = *(id *)(v4 + 16);
  uint64_t v45 = sub_10000BF54(v44, v23);
  float v47 = v46;
  float v49 = v48;
  float v51 = v50;
  uint64_t v52 = v45;

  uint64_t v53 = v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState;
  swift_beginAccess();
  unint64_t v54 = (char *)v142;
  (*(void (**)(void, uint64_t, uint64_t))(v7 + 16))(v142, v53, v6);
  sub_100031818();
  LOBYTE(v53) = sub_100031808();
  unint64_t v55 = *(void (**)(char *, uint64_t))(v7 + 8);
  v55(v10, v6);
  v55(v54, v6);
  uint64_t v140 = v52;
  if ((v53 & 1) != 0 || UIAccessibilityIsReduceMotionEnabled())
  {
    float v56 = (uint64_t *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
    swift_beginAccess();
    uint64_t v57 = *v56;
    uint64_t v58 = v56[1];
    float v59 = (char *)v56[2];
    float v60 = (char *)v56[3];
    uint64_t v62 = v56[4];
    uint64_t v61 = v56[5];
    if (v59 == (char *)1)
    {
      uint64_t v63 = v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
      *(void *)&long long v138 = *(void *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
      LODWORD(v142) = *(unsigned __int8 *)(v4
                                         + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                         + 8);
      double v64 = *(char **)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      long long v66 = *(void (**)(uint64_t))(v4
                                           + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                           + 32);
      uint64_t v65 = *(void *)(v63 + 40);
      Swift::String v137 = (char *)*(id *)(v63 + 24);
      double v136 = v64;
      sub_10000633C((uint64_t)v66);
    }
    else
    {
      LODWORD(v142) = v58 & 1;
      Swift::String v137 = v60;
      double v136 = v59;
      *(void *)&long long v138 = v57;
      double v64 = v59;
      long long v66 = (void (*)(uint64_t))v62;
      uint64_t v65 = v61;
    }
    sub_10001C304(v57, v58, v59, v60, v62);
    float v67 = sub_10000C228(v138, v142, v64, v66, v65, v139, v39, v41, v43);
    long long v139 = v68;
    long long v138 = v69;

    sub_10000640C((uint64_t)v66);
    uint64_t v70 = *v56;
    uint64_t v71 = v56[1];
    uint64_t v72 = (char *)v56[2];
    long long v73 = (char *)v56[3];
    uint64_t v74 = v56[4];
    uint64_t v75 = v56[5];
    if (v72 == (char *)1)
    {
      uint64_t v76 = *(void *)(v143 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
      LODWORD(v142) = *(unsigned __int8 *)(v143
                                         + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                         + 8);
      uint64_t v77 = *(char **)(v143 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      uint64_t v78 = *(void (**)(uint64_t))(v143
                                           + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                           + 32);
      uint64_t v79 = *(void *)(v143 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 40);
      Swift::String v137 = (char *)objc_retain(*(id *)(v143
                                       + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                       + 24));
      double v136 = v77;
      sub_10000633C((uint64_t)v78);
    }
    else
    {
      LODWORD(v142) = v71 & 1;
      Swift::String v137 = v73;
      double v136 = v72;
      uint64_t v76 = v70;
      uint64_t v77 = v72;
      uint64_t v78 = (void (*)(uint64_t))v74;
      uint64_t v79 = v75;
    }
    sub_10001C304(v70, v71, v72, v73, v74);
    float v80 = sub_10000C228(v76, v142, v77, v78, v79, v140, v47, v49, v51);
  }
  else
  {
    float v83 = (uint64_t *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
    swift_beginAccess();
    uint64_t v84 = *v83;
    uint64_t v85 = v83[1];
    long long v86 = (char *)v83[2];
    double v87 = (char *)v83[3];
    uint64_t v89 = v83[4];
    uint64_t v88 = v83[5];
    if (v86 == (char *)1)
    {
      uint64_t v90 = v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
      *(void *)&long long v138 = *(void *)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
      LODWORD(v142) = *(unsigned __int8 *)(v4
                                         + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                         + 8);
      double v91 = *(char **)(v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      double v93 = *(void (**)(uint64_t))(v4
                                           + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                           + 32);
      uint64_t v92 = *(void *)(v90 + 40);
      Swift::String v137 = (char *)*(id *)(v90 + 24);
      double v136 = v91;
      sub_10000633C((uint64_t)v93);
    }
    else
    {
      LODWORD(v142) = v85 & 1;
      Swift::String v137 = v87;
      double v136 = v86;
      *(void *)&long long v138 = v84;
      double v91 = v86;
      double v93 = (void (*)(uint64_t))v89;
      uint64_t v92 = v88;
    }
    sub_10001C304(v84, v85, v86, v87, v89);
    float v67 = sub_10000C2EC(v138, v142, v91, v93, v92, v139, v39, v41, v43);
    long long v139 = v94;
    long long v138 = v95;

    sub_10000640C((uint64_t)v93);
    uint64_t v96 = *v83;
    uint64_t v97 = v83[1];
    unint64_t v98 = (char *)v83[2];
    double v99 = (char *)v83[3];
    uint64_t v100 = v83[4];
    uint64_t v101 = v83[5];
    if (v98 == (char *)1)
    {
      uint64_t v102 = *(void *)(v143 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration);
      LODWORD(v142) = *(unsigned __int8 *)(v143
                                         + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                         + 8);
      id v103 = *(char **)(v143 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 16);
      uint64_t v78 = *(void (**)(uint64_t))(v143
                                           + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                           + 32);
      uint64_t v104 = *(void *)(v143 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration + 40);
      Swift::String v137 = (char *)objc_retain(*(id *)(v143
                                       + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration
                                       + 24));
      double v136 = v103;
      sub_10000633C((uint64_t)v78);
    }
    else
    {
      LODWORD(v142) = v97 & 1;
      Swift::String v137 = v99;
      double v136 = v98;
      uint64_t v102 = v96;
      id v103 = v98;
      uint64_t v78 = (void (*)(uint64_t))v100;
      uint64_t v104 = v101;
    }
    sub_10001C304(v96, v97, v98, v99, v100);
    float v80 = sub_10000C2EC(v102, v142, v103, v78, v104, v140, v47, v49, v51);
  }
  float v105 = v80;
  long long v142 = v81;
  float32x2_t v106 = v82;

  sub_10000640C((uint64_t)v78);
  uint64_t v107 = v143;
  id v108 = v141;
  *(float *)&double v109 = v67 + (float)(*(float *)&v144 * (float)(v105 - v67));
  [v141 setCameraOrbit:v109];
  *(int32x2_t *)&long long v110 = vceqz_f32(*(float32x2_t *)&v139);
  if ((vpmin_u32(*(uint32x2_t *)&v110, *(uint32x2_t *)&v110).u32[0] & 0x80000000) != 0
    || (uint32x2_t v111 = (uint32x2_t)vceqz_f32(*(float32x2_t *)&v142), (vpmin_u32(v111, v111).u32[0] & 0x80000000) != 0)
    || (vceq_f32(*(float32x2_t *)&v139, *(float32x2_t *)&v142).u8[0] & 1) != 0
    || (v112 = *((float *)&v139 + 1), float v113 = *((float *)&v142 + 1), *((float *)&v139 + 1) == *((float *)&v142 + 1)))
  {
    float32x2_t v114 = vmla_n_f32(*(float32x2_t *)&v139, vsub_f32(*(float32x2_t *)&v142, *(float32x2_t *)&v139), *(float *)&v144);
  }
  else
  {
    *(float32x2_t *)&long long v110 = vmul_f32(*(float32x2_t *)&v139, *(float32x2_t *)&v139);
    unsigned __int32 v125 = vadd_f32(*(float32x2_t *)&v110, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v110, 1)).u32[0];
    float32x2_t v126 = vmul_f32(*(float32x2_t *)&v142, *(float32x2_t *)&v142);
    LODWORD(v140) = sqrtf(vaddv_f32(*(float32x2_t *)&v110));
    *(float32x2_t *)&long long v110 = vadd_f32(v126, (float32x2_t)vdup_lane_s32((int32x2_t)v126, 1));
    long long v143 = v110;
    LODWORD(v137) = sqrtf(vaddv_f32(v126));
    float32x2_t v127 = vrsqrte_f32((float32x2_t)v125);
    float32x2_t v128 = vmul_f32(v127, vrsqrts_f32((float32x2_t)v125, vmul_f32(v127, v127)));
    float v129 = acosf(fminf(fmaxf(vmul_f32(*(float32x2_t *)&v139, vmul_f32(v128, vrsqrts_f32((float32x2_t)v125, vmul_f32(v128, v128)))).f32[0], -1.0), 1.0));
    if (v112 >= 0.0) {
      float v130 = v129;
    }
    else {
      float v130 = 6.2832 - v129;
    }
    float32x2_t v131 = vrsqrte_f32((float32x2_t)v143);
    float32x2_t v132 = vmul_f32(v131, vrsqrts_f32((float32x2_t)v143, vmul_f32(v131, v131)));
    float v133 = acosf(fminf(fmaxf(vmul_f32(*(float32x2_t *)&v142, vmul_f32(v132, vrsqrts_f32((float32x2_t)v143, vmul_f32(v132, v132)))).f32[0], -1.0), 1.0));
    if (v113 < 0.0) {
      float v133 = 6.2832 - v133;
    }
    if ((float)(v133 - v130) >= 3.1406)
    {
      float v130 = v130 + 6.2832;
    }
    else if ((float)(v130 - v133) > 3.1426)
    {
      float v133 = v133 + 6.2832;
    }
    *(float *)&long long v134 = *(float *)&v140 + (float)(*(float *)&v144 * (float)(*(float *)&v137 - *(float *)&v140));
    long long v143 = v134;
    __float2 v135 = __sincosf_stret(v130 + (float)(*(float *)&v144 * (float)(v133 - v130)));
    float32x2_t v114 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v135.__sinval), LODWORD(v135.__cosval)), *(float *)&v143);
  }
  objc_msgSend(v108, "setCameraOffset:", *(double *)&v114, v136);
  CLLocationCoordinate2D v117 = CLLocationCoordinate2DMake(0.0, 0.0);
  double longitude = v117.longitude;
  double latitude = v117.latitude;
  if (*(void *)(v107 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration) != 1)
  {
    float32x2_t v118 = vmla_n_f32(*(float32x2_t *)&v138, vsub_f32(v106, *(float32x2_t *)&v138), *(float *)&v144);
    double latitude = vmuls_lane_f32(-15.0, v118, 1);
    double longitude = (float)(-15.0 * v118.f32[0]);
  }
  objc_msgSend(v108, "setOffsetCoordinate:", latitude, longitude);
  [v108 restingCameraRoll];
  float v120 = v119;
  [v108 cameraPosition];
  long long v143 = v121;
  [v108 cameraTarget];
  long long v142 = v122;
  [v108 cameraUp];
  *(float *)&double v123 = (float)(v29 + (float)(*(float *)&v144 * (float)(v28 - v29))) + v120;
  [v108 setCamera:*(double *)&v143 target:*(double *)&v142 up:v124 roll:v123];
  [v108 updateCamera];
}

void sub_10001ABC8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000048F0(&qword_100045090);
  __chkstk_darwin(v4 - 8);
  float v60 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100031848();
  *(void *)&long long v63 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v62 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v65 = (char *)&v59 - v9;
  uint64_t v10 = sub_100031B18();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AB8();
  uint64_t v14 = sub_100031AF8();
  os_log_type_t v15 = sub_100031F18();
  BOOL v16 = os_log_type_enabled(v14, v15);
  *(void *)&v64[0] = a1;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v59 = v10;
    BOOL v18 = (uint8_t *)v17;
    v67[0] = swift_slowAlloc();
    uint64_t v61 = (void (*)(char *, uint64_t, uint64_t))v6;
    *(_DWORD *)BOOL v18 = 136315138;
    uint64_t v19 = sub_100031F88();
    uint64_t v66 = sub_10001B510(v19, v20, v67);
    uint64_t v6 = (uint64_t)v61;
    sub_100031FD8();
    a1 = *(void *)&v64[0];
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Renderer didRotate: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v59);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  float v21 = 0.0;
  if ((unint64_t)(a1 - 2) <= 2) {
    float v21 = flt_10003340C[a1 - 2];
  }
  id v22 = [*(id *)(v2 + 24) vistaView];
  id v23 = [v22 scene];

  uint64_t v24 = v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState;
  swift_beginAccess();
  uint64_t v25 = v63;
  uint64_t v26 = v65;
  uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 16);
  v61(v65, v24, v6);
  uint64_t v27 = v62;
  sub_100031818();
  LOBYTE(v22) = sub_100031808();
  float v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v28(v27, v6);
  v28(v26, v6);
  if (v22) {
    *(float *)&double v29 = sub_10000D084();
  }
  else {
    *(float *)&double v29 = sub_10000D238();
  }
  double v32 = v30;
  long long v63 = v31;
  [v23 setCameraOrbit:v29];
  [v23 setCameraOffset:v32];
  id v33 = *(id *)(v2 + 16);
  uint64_t v34 = sub_10000BF54(v33, *(uint64_t *)&v64[0]);
  LODWORD(v32) = v35;
  unsigned int v37 = v36;
  unsigned int v39 = v38;
  uint64_t v40 = v34;

  uint64_t v41 = v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_rotationStartEnvironment;
  *(void *)uint64_t v41 = LODWORD(v32) | ((unint64_t)v37 << 32);
  *(void *)(v41 + 8) = v39;
  *(void *)(v41 + 16) = v40;
  *(unsigned char *)(v41 + 24) = 0;
  CLLocationCoordinate2D v44 = CLLocationCoordinate2DMake(0.0, 0.0);
  double longitude = v44.longitude;
  double latitude = v44.latitude;
  double v45 = vmuls_lane_f32(-15.0, *(float32x2_t *)&v63, 1);
  if (*(void *)(v2 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration) != 1)
  {
    double longitude = (float)(-15.0 * *(float *)&v63);
    double latitude = v45;
  }
  objc_msgSend(v23, "setOffsetCoordinate:", latitude, longitude, (float)(-15.0 * *(float *)&v63), v45);
  [v23 restingCameraRoll];
  float v47 = v46;
  [v23 cameraPosition];
  *(_OWORD *)double v64 = v48;
  [v23 cameraTarget];
  long long v63 = v49;
  [v23 cameraUp];
  *(float *)&double v50 = v21 + v47;
  [v23 setCamera:v64[0] target:*(double *)&v63 up:v51 roll:v50];
  [v23 updateCamera];
  uint64_t v52 = v65;
  v61(v65, v24, v6);
  char v53 = sub_1000317E8();
  v28(v52, v6);
  if (v53)
  {
    sub_100014818(0);
  }
  else
  {
    uint64_t v54 = sub_100031DE8();
    uint64_t v55 = (uint64_t)v60;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v60, 1, 1, v54);
    uint64_t v56 = swift_allocObject();
    swift_weakInit();
    sub_100031DC8();
    swift_retain();
    uint64_t v57 = sub_100031DB8();
    uint64_t v58 = swift_allocObject();
    *(void *)(v58 + 16) = v57;
    *(void *)(v58 + 24) = &protocol witness table for MainActor;
    *(void *)(v58 + 32) = v56;
    *(unsigned char *)(v58 + 40) = 0;
    swift_release();
    sub_10001025C(v55, (uint64_t)&unk_1000450A0, v58);

    swift_release();
  }
}

uint64_t sub_10001B250(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10001B260(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10001B29C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001B378;
  return v6(a1);
}

uint64_t sub_10001B378()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001B470(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001B498(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001B510(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100031FD8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001B510(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001B5E4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009B6C((uint64_t)v12, *a3);
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
      sub_100009B6C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009B0C((uint64_t)v12);
  return v7;
}

uint64_t sub_10001B5E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100031FE8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001B7A0(a5, a6);
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
  uint64_t v8 = sub_100032098();
  if (!v8)
  {
    sub_100032108();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100032158();
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

uint64_t sub_10001B7A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001B838(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001BA94(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001BA94(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001B838(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001B9B0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100032078();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100032108();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100031CB8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100032158();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100032108();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001B9B0(uint64_t a1, uint64_t a2)
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
  sub_1000048F0(&qword_1000450A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001BA18(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_100031D08();
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
    uint64_t v5 = sub_100031CD8();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10001BA94(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000048F0(&qword_1000450A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_100032158();
  __break(1u);
  return result;
}

unsigned char **sub_10001BBE4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_10001BBF4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_100032158();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_10001BC98(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_10001BCC4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001BCEC@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10001BD1C(uint64_t (*a1)(void))
{
  return a1();
}

void sub_10001BD44(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100031FD8();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_10001BDFC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001BE24(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_100031FD8();
  *a1 = v5;
  return result;
}

double sub_10001BE7C(float (*a1)(void))
{
  return a1();
}

unint64_t sub_10001BEA8(uint64_t a1, uint64_t a2)
{
  sub_1000321D8();
  sub_100031C98();
  Swift::Int v4 = sub_1000321F8();

  return sub_10001BF64(a1, a2, v4);
}

unint64_t sub_10001BF20(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100032028(*(void *)(v2 + 40));

  return sub_10001C048(a1, v4);
}

unint64_t sub_10001BF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000321A8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000321A8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10001C048(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100009AB0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100032038();
      sub_10001D330((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10001C110()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001C14C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int64_t v8 = v2;
  v8[1] = sub_10001D6E0;
  return sub_10000F1FC(a1, v4, v5, v6, v7);
}

uint64_t sub_10001C214()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001C24C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10001D6E0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000450B0 + dword_1000450B0);
  return v6(a1, v4);
}

void sub_10001C304(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  if (a3 != (void *)1)
  {
    id v8 = a4;
    id v9 = a3;
    sub_10000633C(a5);
  }
}

void *sub_10001C360(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v47 = a2;
  double v45 = a1;
  uint64_t v46 = sub_100031A98();
  uint64_t v6 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  id v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100031848();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3[4] = 0;
  uint64_t v13 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tokenManager;
  sub_100031998();
  swift_allocObject();
  *(void *)((char *)v3 + v13) = sub_100031988();
  *((unsigned char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isTransientAnimationActive) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientToVista) = 2;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientFromVista) = 2;
  BOOL v14 = (void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_transientConfiguration);
  void *v14 = 0;
  v14[1] = 0;
  v14[2] = 1;
  void v14[3] = 0;
  v14[4] = 0;
  v14[5] = 0;
  uint64_t v15 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_displayLink;
  sub_1000317D8();
  swift_allocObject();
  *(void *)((char *)v3 + v15) = sub_1000317C8();
  *(_DWORD *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationDuration) = 1069547520;
  *(_DWORD *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationTimeOffset) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationStartTime) = 0;
  *((unsigned char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_tapAnimationReversed) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_changeToDeactiveModeTask) = 0;
  *((unsigned char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isFirstDraw) = 1;
  sub_100031578();
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_pulseWaitTime) = 0x407E000000000000;
  *((unsigned char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isCurrentConfigurationChange) = 1;
  *((unsigned char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isRotationChange) = 0;
  *((unsigned char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_hasPortraitWidgets) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_queuedLocationUpdate) = 0;
  uint64_t v16 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_rotationAnimator;
  sub_100031A28();
  swift_allocObject();
  *(void *)((char *)v3 + v16) = sub_100031A18();
  uint64_t v17 = (char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_rotationStartEnvironment;
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0;
  *((void *)v17 + 2) = 0;
  v17[24] = 1;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotVistaController) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundImageView) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotBackgroundDebugColorView) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingImageView) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotFloatingDebugColorView) = 0;
  *(void *)((char *)v3 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotMaskLayer) = 0;
  uint64_t v18 = OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_snapshotManager;
  sub_1000318B8();
  swift_allocObject();
  *(void *)((char *)v3 + v18) = sub_1000318A8();
  uint64_t v19 = v45;
  v3[2] = a3;
  v3[3] = v19;
  id v20 = a3;
  id v21 = v19;
  sub_100031E98();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))((uint64_t)v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_unlockState, v12, v9);
  sub_100031ED8();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_wakeState, v8, v46);
  id v22 = v20;
  objc_msgSend(objc_msgSend(v22, "environment"), "contents");
  swift_unknownObjectRelease();
  swift_getObjectType();
  uint64_t v23 = sub_10001DCC4();
  char v25 = v24;
  uint64_t v27 = v26;
  swift_unknownObjectRelease();

  if (v27 == 1) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = v23;
  }
  if (v27 == 1) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = v27;
  }
  double v30 = (char *)v4 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_currentConfiguration;
  *(void *)double v30 = v28;
  v30[8] = (v27 != 1) & v25;
  *((void *)v30 + 2) = v29;
  *((void *)v30 + 3) = 0;
  *((void *)v30 + 4) = 0;
  *((void *)v30 + 5) = 0;
  sub_10001D168((unint64_t *)&unk_1000450F0, (void (*)(uint64_t))type metadata accessor for AegirRenderingCoordinator);
  swift_retain();
  swift_retain();
  sub_100031A08();
  swift_release();
  swift_retain();
  sub_1000319C8();
  swift_release();
  [v21 setPulseAnimationDelegate:v4];
  [v21 setVistaTransitionStyle:0];
  id v31 = [v21 vistaView];
  [v31 setObserver:v4];

  sub_10000D7A4();
  long long v32 = *((_OWORD *)v30 + 1);
  long long v48 = *(_OWORD *)v30;
  long long v49 = v32;
  long long v50 = *((_OWORD *)v30 + 2);
  sub_10001D0A8((uint64_t)&v49, (uint64_t)&v51, (uint64_t *)&unk_100045580);
  sub_10001D0A8((uint64_t)&v49 + 8, (uint64_t)&v52, &qword_100045100);
  uint64_t v33 = v50;
  sub_1000063B4(&v51);
  sub_1000063B4(&v52);
  sub_10000633C(v33);
  sub_10000E9C0((uint64_t *)&v48);
  sub_1000063E0(&v51);
  sub_1000063E0(&v52);
  sub_10000640C(v33);
  sub_10001D168(&qword_100045108, (void (*)(uint64_t))type metadata accessor for AegirRenderingCoordinator);
  swift_retain();
  swift_retain();
  sub_1000317A8();
  swift_release();
  swift_retain();
  sub_1000317B8();
  swift_release();
  uint64_t v34 = self;
  swift_retain();
  v35.super.Class isa = (Class)[v34 currentRunLoop];
  Class isa = v35.super.isa;
  sub_100031798(v35, NSRunLoopCommonModes);
  swift_release();

  unsigned int v37 = (void *)v4[3];
  id v38 = (id)v4[2];
  char v39 = sub_100031EC8();

  [v37 disableCloudDataFetch:v39 & 1];
  id v40 = (id)v4[2];
  char v41 = sub_100031E88();

  if (v41) {
    sub_100010860();
  }
  else {
    sub_100011EB0();
  }
  id v42 = [v37 vistaView];
  [v42 purgeUnused];

  return v4;
}

uint64_t sub_10001CA44()
{
  return _swift_task_switch(sub_10001CA60, 0, 0);
}

uint64_t sub_10001CA60()
{
  id v1 = [objc_allocWithZone((Class)SBSWallpaperService) init];
  v0[175] = v1;
  uint64_t v2 = swift_task_alloc();
  v0[176] = v2;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 1;
  type metadata accessor for CGRect(255);
  swift_asyncLet_begin();
  uint64_t v3 = swift_task_alloc();
  v0[177] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 1;
  swift_asyncLet_begin();
  return _swift_asyncLet_get(v0 + 82, v0 + 171, sub_10001CBA4, v0 + 162);
}

uint64_t sub_10001CBA4()
{
  return _swift_task_switch(sub_10001CBC0, 0, 0);
}

uint64_t sub_10001CBC0()
{
  *(CGFloat *)(v0 + 1424) = CGRectGetMinY(*(CGRect *)(v0 + 1368));
  return _swift_asyncLet_get(v0 + 16, v0 + 1336, sub_10001CC50, v0 + 1296);
}

uint64_t sub_10001CC50()
{
  return _swift_task_switch(sub_10001CC6C, 0, 0);
}

uint64_t sub_10001CC6C()
{
  *(CGFloat *)(v0 + 1432) = CGRectGetMinY(*(CGRect *)(v0 + 1336));
  return _swift_asyncLet_finish(v0 + 16, v0 + 1336, sub_10001CCFC, v0 + 1296);
}

uint64_t sub_10001CCFC()
{
  return _swift_task_switch(sub_10001CD18, 0, 0);
}

uint64_t sub_10001CD18()
{
  swift_task_dealloc();
  return _swift_asyncLet_finish(v0 + 656, v0 + 1368, sub_10001CD98, v0 + 16);
}

uint64_t sub_10001CD98()
{
  return _swift_task_switch(sub_10001CDB4, 0, 0);
}

uint64_t sub_10001CDB4()
{
  id v1 = *(void **)(v0 + 1400);
  swift_task_dealloc();
  [v1 invalidate];

  uint64_t v2 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v3 = *(double *)(v0 + 1424) != *(double *)(v0 + 1432);
  return v2(v3);
}

uint64_t sub_10001CE3C(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10001D6E0;
  v6[20] = v5;
  v6[21] = v4;
  v6[19] = a1;
  return _swift_task_switch(sub_10001042C, 0, 0);
}

uint64_t sub_10001CEF8(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10001CFB4;
  v6[20] = v5;
  v6[21] = v4;
  v6[19] = a1;
  return _swift_task_switch(sub_100010658, 0, 0);
}

uint64_t sub_10001CFB4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001D0A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000048F0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10001D10C()
{
  unint64_t result = qword_100045118;
  if (!qword_100045118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045118);
  }
  return result;
}

uint64_t sub_10001D160()
{
  return sub_10001D264(88);
}

uint64_t sub_10001D168(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001D1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000048F0(&qword_100045120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_10001D218(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001D25C()
{
  return sub_10001D264(65);
}

uint64_t sub_10001D264(uint64_t a1)
{
  if (*(void *)(v1 + 48)) {
    swift_release();
  }

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_10001D2C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100006E4C(*(unsigned char *)(v1 + 64), a1);
}

uint64_t sub_10001D2EC()
{
  return sub_100018E98();
}

uint64_t sub_10001D2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001D304()
{
  return swift_release();
}

uint64_t sub_10001D30C()
{
  return sub_1000197E0();
}

id sub_10001D314@<X0>(void *a1@<X8>)
{
  return sub_1000220C4(*(void *)(v1 + 16), a1);
}

uint64_t sub_10001D330(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001D384()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001D3C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10001D6E0;
  return sub_100014F6C(a1, v4, v5, v7, v6);
}

unint64_t sub_10001D484()
{
  unint64_t result = qword_100045240;
  if (!qword_100045240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045240);
  }
  return result;
}

uint64_t sub_10001D4D8()
{
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001D4E8()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 86, 7);
}

uint64_t sub_10001D530(void *a1, double a2, float a3, float a4)
{
  return sub_1000198A0(a1, a2, a3, a4, *(void *)(v4 + 16), *(float32x2_t **)(v4 + 24), *(float32x2_t **)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48), *(unsigned int *)(v4 + 56) | ((unint64_t)*(unsigned __int8 *)(v4 + 60) << 32) | ((unint64_t)*(unsigned __int8 *)(v4 + 61) << 40), *(void *)(v4 + 64), *(void *)(v4 + 72), *(unsigned int *)(v4 + 80) | ((unint64_t)*(unsigned __int8 *)(v4 + 84) << 32) | ((unint64_t)*(unsigned __int8 *)(v4 + 85) << 40));
}

float sub_10001D59C(float a1, float a2, float a3)
{
  return (float)(a2 * a3) + (float)(a1 * (float)(1.0 - a3));
}

uint64_t sub_10001D5B4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10001CFB4;
  return sub_10000F1FC(a1, v4, v5, v6, v7);
}

uint64_t sub_10001D67C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 41, 7);
}

id sub_10001D6BC(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3 != (void *)1) {
    return a3;
  }
  return result;
}

void sub_10001D6CC(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3 != (void *)1) {
}
  }

uint64_t sub_10001D6EC()
{
  return 0;
}

uint64_t sub_10001D810(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6874726145 && a2 == 0xE500000000000000) {
    return 0;
  }
  if (sub_1000321A8()) {
    return 0;
  }
  if (a1 == 1852796749 && a2 == 0xE400000000000000 || (sub_1000321A8() & 1) != 0) {
    return 1;
  }
  if (a1 == 0x79726572724FLL && a2 == 0xE600000000000000 || (sub_1000321A8() & 1) != 0) {
    return 2;
  }
  if (a1 == 0x7972756372654DLL && a2 == 0xE700000000000000 || (sub_1000321A8() & 1) != 0) {
    return 4;
  }
  if (a1 == 0x73756E6556 && a2 == 0xE500000000000000 || (sub_1000321A8() & 1) != 0) {
    return 5;
  }
  if (a1 == 1936875853 && a2 == 0xE400000000000000 || (sub_1000321A8() & 1) != 0) {
    return 6;
  }
  if (a1 == 0x7265746970754ALL && a2 == 0xE700000000000000 || (sub_1000321A8() & 1) != 0) {
    return 7;
  }
  if (a1 == 0x6E7275746153 && a2 == 0xE600000000000000 || (sub_1000321A8() & 1) != 0) {
    return 3;
  }
  if (a1 == 0x73756E617255 && a2 == 0xE600000000000000 || (sub_1000321A8() & 1) != 0) {
    return 8;
  }
  if (a1 == 0x656E757470654ELL && a2 == 0xE700000000000000) {
    return 9;
  }
  if (sub_1000321A8()) {
    return 9;
  }
  return 0;
}

uint64_t sub_10001DB3C()
{
  sub_100032068(38);
  v1._countAndFlagsBits = 0x203A6B636F6C6E75;
  v1._object = (void *)0xE800000000000000;
  sub_100031CA8(v1);
  sub_100031E68();
  v2._countAndFlagsBits = 0x203A656B6177203BLL;
  v2._object = (void *)0xE800000000000000;
  sub_100031CA8(v2);
  sub_100031E68();
  v3._object = (void *)0x8000000100034300;
  v3._countAndFlagsBits = 0xD000000000000010;
  sub_100031CA8(v3);
  sub_100031E68();
  return 0;
}

uint64_t sub_10001DC48()
{
  return sub_10001DB3C();
}

uint64_t initializeBufferWithCopyOfBuffer for AegirSceneUpdateDriver(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)id result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AegirSceneUpdateDriver(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AegirSceneUpdateDriver(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)id result = (a2 - 1);
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
  *(unsigned char *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AegirSceneUpdateDriver()
{
  return &type metadata for AegirSceneUpdateDriver;
}

uint64_t sub_10001DCC4()
{
  uint64_t v1 = sub_100031B18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v43 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v43 - v9;
  v47[0] = 0;
  id v11 = [v0 loadUserInfoWithError:v47];
  id v12 = v47[0];
  if (!v11)
  {
    id v22 = v47[0];
    sub_100031538();

    swift_willThrow();
    sub_100031AA8();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v23 = sub_100031AF8();
    os_log_type_t v24 = sub_100031F08();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = (uint8_t *)swift_slowAlloc();
      v47[0] = (id)swift_slowAlloc();
      uint64_t v44 = v1;
      *(_DWORD *)char v25 = 136315138;
      swift_getErrorValue();
      uint64_t v26 = sub_1000321C8();
      *(void *)&long long v48 = sub_10001B510(v26, v27, (uint64_t *)v47);
      sub_100031FD8();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to load configuration from contents %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v44);
      return 0;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  uint64_t v13 = v11;
  uint64_t v14 = sub_100031BC8();
  id v15 = v12;

  uint64_t v45 = 0x6174736956;
  unint64_t v46 = 0xE500000000000000;
  sub_100032048();
  if (*(void *)(v14 + 16) && (unint64_t v16 = sub_10001BF20((uint64_t)v47), (v17 & 1) != 0))
  {
    sub_100009B6C(*(void *)(v14 + 56) + 32 * v16, (uint64_t)&v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  sub_10001D330((uint64_t)v47);
  if (!*((void *)&v49 + 1))
  {
    swift_bridgeObjectRelease();
    sub_10001E3A0((uint64_t)&v48);
LABEL_15:
    sub_100031AA8();
    uint64_t v29 = sub_100031AF8();
    os_log_type_t v30 = sub_100031F08();
    if (os_log_type_enabled(v29, v30))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Vista not available in userInfo", v31, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v19 = v45;
  uint64_t v18 = v46;
  uint64_t v45 = 0x656C797453;
  unint64_t v46 = 0xE500000000000000;
  sub_100032048();
  if (*(void *)(v14 + 16) && (unint64_t v20 = sub_10001BF20((uint64_t)v47), (v21 & 1) != 0))
  {
    sub_100009B6C(*(void *)(v14 + 56) + 32 * v20, (uint64_t)&v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  sub_10001D330((uint64_t)v47);
  if (!*((void *)&v49 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10001E3A0((uint64_t)&v48);
LABEL_27:
    sub_100031AA8();
    unsigned int v36 = sub_100031AF8();
    os_log_type_t v37 = sub_100031F18();
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Style not available in configuration", v38, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v10, v1);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  uint64_t v33 = v45;
  long long v32 = (void *)v46;
  uint64_t v45 = 0x6E6F697461636F4CLL;
  unint64_t v46 = 0xE800000000000000;
  sub_100032048();
  if (*(void *)(v14 + 16) && (unint64_t v34 = sub_10001BF20((uint64_t)v47), (v35 & 1) != 0))
  {
    sub_100009B6C(*(void *)(v14 + 56) + 32 * v34, (uint64_t)&v48);
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10001D330((uint64_t)v47);
  if (*((void *)&v49 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v40 = v45;
      unint64_t v41 = v46;
      sub_10001E400();
      sub_100002D68(v40, v41);
    }
  }
  else
  {
    sub_10001E3A0((uint64_t)&v48);
  }
  uint64_t v28 = sub_10001D810(v19, v18);
  swift_bridgeObjectRelease();
  v42._rawValue = &off_10003D4A8;
  v50._countAndFlagsBits = v33;
  v50._object = v32;
  sub_100032178(v42, v50);
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t sub_10001E3A0(uint64_t a1)
{
  uint64_t v2 = sub_1000048F0(&qword_100045120);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10001E400()
{
  unint64_t result = qword_100045680;
  if (!qword_100045680)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100045680);
  }
  return result;
}

id sub_10001E440(int a1)
{
  double v1 = (double)BYTE2(a1) * 0.00392156863;
  double v2 = (double)BYTE1(a1) * 0.00392156863;
  double v3 = (double)a1 * 0.00392156863;
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v5 = [objc_allocWithZone((Class)UIColor) initWithRed:v1 green:v2 blue:v3 alpha:1.0];
  id v6 = [v4 initWithColor:v5];

  return v6;
}

uint64_t PlanetColors.rawValue.getter(char a1)
{
  return dword_10003355C[a1];
}

BOOL sub_10001E510(char *a1, char *a2)
{
  return dword_10003355C[*a1] == dword_10003355C[*a2];
}

Swift::Int sub_10001E534()
{
  uint64_t v1 = *v0;
  sub_1000321D8();
  sub_1000321E8(dword_10003355C[v1]);
  return sub_1000321F8();
}

void sub_10001E584()
{
  sub_1000321E8(dword_10003355C[*v0]);
}

Swift::Int sub_10001E5BC()
{
  uint64_t v1 = *v0;
  sub_1000321D8();
  sub_1000321E8(dword_10003355C[v1]);
  return sub_1000321F8();
}

uint64_t sub_10001E608@<X0>(int *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s11AegirPoster12PlanetColorsO8rawValueACSgs6UInt32V_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_10001E634(_DWORD *a1@<X8>)
{
  *a1 = dword_10003355C[*v1];
}

uint64_t _s11AegirPoster12PlanetColorsO8rawValueACSgs6UInt32V_tcfC_0(int a1)
{
  if (a1 <= 10589062)
  {
    if (a1 > 8308449)
    {
      if (a1 == 8308450) {
        return 7;
      }
      if (a1 == 9211020) {
        return 3;
      }
    }
    else
    {
      if (a1 == 6920424) {
        return 8;
      }
      if (a1 == 7442351) {
        return 2;
      }
    }
  }
  else if (a1 <= 12426328)
  {
    if (a1 == 10589063) {
      return 0;
    }
    if (a1 == 11435597) {
      return 1;
    }
  }
  else
  {
    switch(a1)
    {
      case 12426329:
        return 6;
      case 12544846:
        return 5;
      case 14452348:
        return 4;
    }
  }
  return 9;
}

unint64_t sub_10001E760()
{
  unint64_t result = qword_100045400;
  if (!qword_100045400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045400);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AegirPosterCropStyle(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlanetColors(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PlanetColors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001E91CLL);
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

uint64_t sub_10001E944(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001E950(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PlanetColors()
{
  return &type metadata for PlanetColors;
}

uint64_t sub_10001E968()
{
  uint64_t v0 = sub_100031B18();
  sub_100008FA8(v0, qword_100046CC0);
  sub_100008F70(v0, (uint64_t)qword_100046CC0);
  sub_100031AE8();
  return sub_100031B08();
}

id sub_10001EAD4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AegirUpdatingController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AegirUpdatingController()
{
  return self;
}

uint64_t sub_10001EB2C()
{
  sub_1000048F0(&qword_1000454D8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100033580;
  sub_1000203F4(0, (unint64_t *)&qword_100044398);
  id v1 = sub_10001E440(7442351);
  objc_super v2 = (void *)PRTimeFontIdentifierSoft;
  *(void *)(v0 + 32) = 0x747261452D313056;
  *(void *)(v0 + 40) = 0xE900000000000068;
  *(void *)(v0 + 48) = 0;
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 72) = &off_10003D4F8;
  id v3 = v2;
  id v4 = sub_10001E440(9211020);
  uint64_t v5 = (void *)PRTimeFontIdentifierRounded;
  *(void *)(v0 + 80) = 0x6E6F6F4D2D323056;
  *(void *)(v0 + 88) = 0xE800000000000000;
  *(void *)(v0 + 96) = 1;
  *(void *)(v0 + 104) = v4;
  *(void *)(v0 + 112) = v5;
  *(void *)(v0 + 120) = &off_10003D530;
  id v6 = v5;
  id v7 = sub_10001E440(14452348);
  int v8 = (void *)PRTimeFontIdentifierStencil;
  *(void *)(v0 + 128) = 0x7372614D2D333056;
  *(void *)(v0 + 136) = 0xE800000000000000;
  *(void *)(v0 + 144) = 6;
  *(void *)(v0 + 152) = v7;
  *(void *)(v0 + 160) = v8;
  *(void *)(v0 + 168) = &off_10003D568;
  id v9 = v8;
  id v10 = sub_10001E440(12544846);
  id v11 = (void *)PRTimeFontIdentifierNewYork;
  *(void *)(v0 + 176) = 0x6970754A2D343056;
  *(void *)(v0 + 184) = 0xEB00000000726574;
  *(void *)(v0 + 192) = 7;
  *(void *)(v0 + 200) = v10;
  *(void *)(v0 + 208) = v11;
  *(void *)(v0 + 216) = &off_10003D5A0;
  id v12 = v11;
  id v13 = sub_10001E440(12426329);
  uint64_t v14 = (void *)PRTimeFontIdentifierSlab;
  *(void *)(v0 + 224) = 0x757461532D353056;
  *(void *)(v0 + 232) = 0xEA00000000006E72;
  *(void *)(v0 + 240) = 3;
  *(void *)(v0 + 248) = v13;
  *(void *)(v0 + 256) = v14;
  *(void *)(v0 + 264) = &off_10003D5D8;
  id v15 = self;
  id v16 = v14;
  id v17 = [v15 vibrantMaterialColor];
  uint64_t v18 = PRTimeFontIdentifierRail;
  *(void *)(v0 + 272) = 0x6572724F2D363056;
  *(void *)(v0 + 280) = 0xEA00000000007972;
  *(void *)(v0 + 288) = 2;
  *(void *)(v0 + 296) = v17;
  *(void *)(v0 + 304) = v18;
  *(void *)(v0 + 312) = &off_10003D610;
  off_100045410 = (_UNKNOWN *)v0;

  return _objc_retain_x1();
}

void sub_10001EFA8(uint64_t a1, uint64_t a2)
{
  unint64_t v120 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_1000048F0(&qword_100044380);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100033590;
  id v3 = objc_allocWithZone((Class)ATXComplication);
  NSString v4 = sub_100031C28();
  NSString v5 = sub_100031C28();
  NSString v6 = sub_100031C28();
  id v7 = [v3 initWithExtensionBundleIdentifier:v4 kind:v5 containerBundleIdentifier:v6 widgetFamily:11 intent:0 source:5];

  *(void *)(inited + 32) = v7;
  id v8 = objc_allocWithZone((Class)ATXComplication);
  NSString v9 = sub_100031C28();
  NSString v10 = sub_100031C28();
  NSString v11 = sub_100031C28();
  id v12 = [v8 initWithExtensionBundleIdentifier:v9 kind:v10 containerBundleIdentifier:v11 widgetFamily:10 intent:0 source:5];

  *(void *)(inited + 40) = v12;
  id v13 = objc_allocWithZone((Class)ATXComplication);
  NSString v14 = sub_100031C28();
  NSString v15 = sub_100031C28();
  NSString v16 = sub_100031C28();
  id v17 = [v13 initWithExtensionBundleIdentifier:v14 kind:v15 containerBundleIdentifier:v16 widgetFamily:10 intent:0 source:5];

  *(void *)(inited + 48) = v17;
  id v18 = objc_allocWithZone((Class)ATXComplication);
  NSString v19 = sub_100031C28();
  NSString v20 = sub_100031C28();
  NSString v21 = sub_100031C28();
  id v22 = [v18 initWithExtensionBundleIdentifier:v19 kind:v20 containerBundleIdentifier:v21 widgetFamily:10 intent:0 source:5];

  *(void *)(inited + 56) = v22;
  id v23 = objc_allocWithZone((Class)ATXComplication);
  NSString v24 = sub_100031C28();
  NSString v25 = sub_100031C28();
  NSString v26 = sub_100031C28();
  id v27 = [v23 initWithExtensionBundleIdentifier:v24 kind:v25 containerBundleIdentifier:v26 widgetFamily:10 intent:0 source:5];

  *(void *)(inited + 64) = v27;
  id v28 = objc_allocWithZone((Class)ATXComplication);
  NSString v29 = sub_100031C28();
  NSString v30 = sub_100031C28();
  NSString v31 = sub_100031C28();
  id v32 = [v28 initWithExtensionBundleIdentifier:v29 kind:v30 containerBundleIdentifier:v31 widgetFamily:10 intent:0 source:5];

  *(void *)(inited + 72) = v32;
  v124[0] = (id)inited;
  sub_100031D78();
  unint64_t v33 = inited;
  id v34 = [self currentDevice];
  id v110 = [v34 userInterfaceIdiom];

  if (qword_1000442E0 != -1) {
    goto LABEL_70;
  }
  while (1)
  {
    uint64_t v114 = *((void *)off_100045410 + 2);
    if (!v114) {
      break;
    }
    uint64_t v35 = 0;
    unint64_t v36 = 0;
    unint64_t v109 = v33 & 0xC000000000000001;
    uint64_t v112 = v33 & 0xFFFFFFFFFFFFFF8;
    uint32x2_t v111 = (v33 + 32);
    uint64_t v37 = a1;
    while (v36 < *((void *)off_100045410 + 2))
    {
      uint64_t v41 = *(void *)((char *)off_100045410 + v35 + 32);
      unint64_t v42 = *(void *)((char *)off_100045410 + v35 + 40);
      uint64_t v43 = *(void **)((char *)off_100045410 + v35 + 56);
      uint64_t v45 = *(void **)((char *)off_100045410 + v35 + 64);
      uint64_t v44 = *(void **)((char *)off_100045410 + v35 + 72);
      uint64_t v46 = *(void *)(v37 + 16);
      swift_bridgeObjectRetain_n();
      float32x2_t v118 = v44;
      uint64_t v119 = v41;
      if (v46)
      {
        swift_bridgeObjectRetain();
        id v47 = v43;
        id v48 = v45;
        swift_bridgeObjectRetain();
        unint64_t v49 = sub_10001BEA8(v41, v42);
        if (v50)
        {
          id v51 = *(id *)(*(void *)(v37 + 56) + 8 * v49);
          swift_bridgeObjectRelease();
          NSString v52 = sub_100031C28();
          id v53 = [v51 objectForUserInfoKey:v52];

          if (v53)
          {
            sub_100032008();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v122 = 0u;
            long long v123 = 0u;
          }
          sub_100020430((uint64_t)&v122, (uint64_t)v124);
          if (v124[3])
          {
            if ((swift_dynamicCast() & 1) != 0 && *(void *)&v121[0] == 1000)
            {
              if (qword_1000442D8 != -1) {
                swift_once();
              }
              uint64_t v56 = sub_100031B18();
              sub_100008F70(v56, (uint64_t)qword_100046CC0);
              swift_bridgeObjectRetain();
              uint64_t v57 = sub_100031AF8();
              os_log_type_t v58 = sub_100031F18();
              if (os_log_type_enabled(v57, v58))
              {
                uint64_t v59 = swift_slowAlloc();
                v124[0] = (id)swift_slowAlloc();
                *(_DWORD *)uint64_t v59 = 136315138;
                swift_bridgeObjectRetain();
                *(void *)(v59 + 4) = sub_10001B510(v119, v42, (uint64_t *)v124);
                swift_bridgeObjectRelease_n();
                _os_log_impl((void *)&_mh_execute_header, v57, v58, "Reusing descriptor %s", (uint8_t *)v59, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {

                swift_bridgeObjectRelease_n();
              }
              goto LABEL_48;
            }
          }
          else
          {
            sub_10001E3A0((uint64_t)v124);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        id v54 = v43;
        id v55 = v45;
        swift_bridgeObjectRetain();
      }
      uint64_t v116 = v35;
      if (qword_1000442D8 != -1) {
        swift_once();
      }
      unint64_t v117 = v36;
      uint64_t v60 = sub_100031B18();
      uint64_t v61 = sub_100008F70(v60, (uint64_t)qword_100046CC0);
      swift_bridgeObjectRetain_n();
      uint64_t v62 = sub_100031AF8();
      os_log_type_t v63 = sub_100031F18();
      if (os_log_type_enabled(v62, v63))
      {
        double v64 = (uint8_t *)swift_slowAlloc();
        v124[0] = (id)swift_slowAlloc();
        *(_DWORD *)double v64 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)&long long v122 = sub_10001B510(v119, v42, (uint64_t *)v124);
        sub_100031FD8();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v62, v63, "Creating descriptor %s", v64, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_bridgeObjectRetain();
      NSString v65 = sub_100031C28();
      swift_bridgeObjectRelease();
      id v66 = [self mutableDescriptorWithIdentifier:v65];

      uint64_t v67 = swift_allocObject();
      *(_OWORD *)(v67 + 16) = xmmword_1000335A0;
      id v68 = objc_allocWithZone((Class)PRTimeFontConfiguration);
      id v51 = v66;
      *(void *)(v67 + 32) = [v68 initWithTimeFontIdentifier:v45];
      v124[0] = (id)v67;
      sub_100031D78();
      sub_1000203F4(0, (unint64_t *)&unk_1000454B0);
      Class isa = sub_100031D48().super.isa;
      swift_bridgeObjectRelease();
      [v51 setPreferredTimeFontConfigurations:isa];

      uint64_t v70 = swift_allocObject();
      *(_OWORD *)(v70 + 16) = xmmword_1000335A0;
      *(void *)(v70 + 32) = v43;
      v124[0] = (id)v70;
      sub_100031D78();
      sub_1000203F4(0, (unint64_t *)&qword_100044398);
      id v115 = v43;
      Class v71 = sub_100031D48().super.isa;
      swift_bridgeObjectRelease();
      [v51 setPreferredTitleColors:v71];

      Class v72 = sub_100031E78().super.super.isa;
      NSString v73 = sub_100031C28();
      [v51 setObject:v72 forUserInfoKey:v73];

      *(void *)&long long v122 = 0x6174736956;
      *((void *)&v122 + 1) = 0xE500000000000000;
      sub_100032048();
      uint64_t v74 = sub_10001D6EC();
      *((void *)&v123 + 1) = &type metadata for String;
      *(void *)&long long v122 = v74;
      *((void *)&v122 + 1) = v75;
      sub_100009B5C(&v122, v121);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_1000083D4(v121, (uint64_t)v124, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_10001D330((uint64_t)v124);
      *(void *)&long long v122 = 0x656C797453;
      *((void *)&v122 + 1) = 0xE500000000000000;
      sub_100032048();
      *((void *)&v123 + 1) = &type metadata for String;
      *(void *)&long long v122 = 1819047238;
      *((void *)&v122 + 1) = 0xE400000000000000;
      sub_100009B5C(&v122, v121);
      char v77 = swift_isUniquelyReferenced_nonNull_native();
      sub_1000083D4(v121, (uint64_t)v124, v77);
      swift_bridgeObjectRelease();
      sub_10001D330((uint64_t)v124);
      Class v78 = sub_100031BB8().super.isa;
      swift_bridgeObjectRelease();
      v124[0] = 0;
      unsigned int v79 = [v51 storeUserInfo:v78 error:v124];

      id v80 = v124[0];
      if (v79)
      {
        unint64_t v33 = (unint64_t)objc_allocWithZone((Class)ATXPosterDescriptorGalleryOptions);
        id v81 = v80;
        float32x2_t v82 = [(id)v33 init];
        [v82 setAllowsSystemSuggestedComplications:0];
        [v82 setFeaturedConfidenceLevel:1];
        if (v110)
        {
          unint64_t v36 = v117;
          [v82 setAllowsSystemSuggestedComplicationsInLandscape:(v117 & 1) == 0];
        }
        else
        {
          uint64_t v86 = swift_allocObject();
          *(_OWORD *)(v86 + 16) = xmmword_100033030;
          unint64_t v36 = v117;
          if (!v118[2]) {
            goto LABEL_61;
          }
          unint64_t v33 = v86;
          unint64_t v87 = v118[4];
          if (v109)
          {
            *(void *)(v33 + 32) = sub_100032088();
            if (v118[2] < 2uLL) {
              goto LABEL_64;
            }
            *(void *)(v33 + 40) = sub_100032088();
            if (v118[2] < 3uLL) {
              goto LABEL_67;
            }
            uint64_t v96 = (objc_class *)sub_100032088();
          }
          else
          {
            if ((v87 & 0x8000000000000000) != 0) {
              goto LABEL_62;
            }
            if (v87 >= *(void *)(v112 + 16)) {
              goto LABEL_63;
            }
            uint64_t v88 = v111[v87].isa;
            *(void *)(v33 + 32) = v88;
            unint64_t v89 = v118[2];
            uint64_t v90 = v88;
            if (v89 < 2) {
              goto LABEL_64;
            }
            unint64_t v91 = v118[5];
            if ((v91 & 0x8000000000000000) != 0) {
              goto LABEL_65;
            }
            if (v91 >= *(void *)(v112 + 16)) {
              goto LABEL_66;
            }
            uint64_t v92 = v111[v91].isa;
            *(void *)(v33 + 40) = v92;
            unint64_t v93 = v118[2];
            long long v94 = v92;
            if (v93 < 3) {
              goto LABEL_67;
            }
            unint64_t v95 = v118[6];
            if ((v95 & 0x8000000000000000) != 0) {
              goto LABEL_68;
            }
            if (v95 >= *(void *)(v112 + 16)) {
              goto LABEL_69;
            }
            uint64_t v96 = v111[v95].isa;
          }
          *(void *)(v33 + 48) = v96;
          v124[0] = (id)v33;
          sub_100031D78();
          sub_1000203F4(0, (unint64_t *)&unk_1000454C8);
          Class v97 = sub_100031D48().super.isa;
          swift_bridgeObjectRelease();
          [v82 setModularComplications:v97];
        }
        v124[0] = 0;
        if ([v51 storeGalleryOptions:v82 error:v124])
        {
          id v98 = v124[0];

          swift_bridgeObjectRelease();
          uint64_t v35 = v116;
          uint64_t v37 = a1;
LABEL_48:
          id v99 = v51;
          sub_100031D38();
          if (*(void *)((v120 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v120 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100031D88();
          }
          sub_100031D98();
          unint64_t v33 = (unint64_t)&v120;
          sub_100031D78();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          goto LABEL_6;
        }
        id v100 = v124[0];
        uint64_t v101 = sub_100031538();

        swift_willThrow();
        swift_errorRetain();
        swift_bridgeObjectRetain();
        swift_errorRetain();
        unint64_t v33 = v61;
        uint64_t v102 = sub_100031AF8();
        os_log_type_t v103 = sub_100031F08();
        if (!os_log_type_enabled(v102, v103))
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_bridgeObjectRelease_n();
          swift_errorRelease();
          swift_errorRelease();

          goto LABEL_54;
        }
        uint64_t v104 = swift_slowAlloc();
        v124[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v104 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)&long long v122 = sub_10001B510(v119, v42, (uint64_t *)v124);
        sub_100031FD8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v104 + 12) = 2082;
        *(void *)&long long v122 = v101;
        swift_errorRetain();
        sub_1000048F0(&qword_1000454C0);
        uint64_t v105 = sub_100031C68();
        *(void *)&long long v122 = sub_10001B510(v105, v106, (uint64_t *)v124);
        sub_100031FD8();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        unint64_t v33 = (unint64_t)v102;
        _os_log_impl((void *)&_mh_execute_header, v102, v103, "Unable to store gallery options %s error=%{public}s", (uint8_t *)v104, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_errorRelease();

        uint64_t v37 = a1;
      }
      else
      {
        id v83 = v124[0];
        uint64_t v84 = sub_100031538();

        swift_willThrow();
        swift_errorRetain();
        swift_bridgeObjectRetain();
        swift_errorRetain();
        unint64_t v33 = sub_100031AF8();
        os_log_type_t v85 = sub_100031F08();
        if (!os_log_type_enabled((os_log_t)v33, v85))
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_bridgeObjectRelease_n();
          swift_errorRelease();
          swift_errorRelease();

LABEL_54:
          uint64_t v35 = v116;
          unint64_t v36 = v117;
          uint64_t v37 = a1;
          goto LABEL_6;
        }
        uint64_t v38 = swift_slowAlloc();
        v124[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)&long long v122 = sub_10001B510(v119, v42, (uint64_t *)v124);
        sub_100031FD8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v38 + 12) = 2082;
        *(void *)&long long v122 = v84;
        swift_errorRetain();
        sub_1000048F0(&qword_1000454C0);
        uint64_t v39 = sub_100031C68();
        *(void *)&long long v122 = sub_10001B510(v39, v40, (uint64_t *)v124);
        sub_100031FD8();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v33, v85, "Unable to store user info %s error=%{public}s", (uint8_t *)v38, 0x16u);
        swift_arrayDestroy();
        uint64_t v37 = a1;
        swift_slowDealloc();
        swift_slowDealloc();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_errorRelease();
      }
      uint64_t v35 = v116;
      unint64_t v36 = v117;
LABEL_6:
      ++v36;
      v35 += 48;
      if (v114 == v36) {
        goto LABEL_59;
      }
    }
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
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
    swift_once();
  }
LABEL_59:
  swift_bridgeObjectRelease();
  sub_1000203F4(0, (unint64_t *)&unk_1000454A0);
  Class v107 = sub_100031D48().super.isa;
  (*(void (**)(uint64_t, Class, void))(a2 + 16))(a2, v107, 0);
  swift_bridgeObjectRelease();
}

uint64_t sub_1000203F4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100020430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000048F0(&qword_100045120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for AegirDescriptorDefinition(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AegirDescriptorDefinition(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  NSString v6 = (void *)a2[4];
  uint64_t v5 = a2[5];
  a1[4] = v6;
  a1[5] = v5;
  swift_bridgeObjectRetain();
  id v7 = v4;
  id v8 = v6;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AegirDescriptorDefinition(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v4 = (void *)a2[3];
  uint64_t v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  id v7 = (void *)a2[4];
  id v8 = (void *)a1[4];
  a1[4] = v7;
  id v9 = v7;

  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AegirDescriptorDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AegirDescriptorDefinition(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AegirDescriptorDefinition(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AegirDescriptorDefinition()
{
  return &type metadata for AegirDescriptorDefinition;
}

uint64_t sub_1000206E0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6C6961746544;
  }
  else {
    uint64_t v3 = 1819047238;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x6C6961746544;
  }
  else {
    uint64_t v5 = 1819047238;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1000321A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

AegirPoster::AegirPosterCropStyle __swiftcall AegirPosterCropStyle.init(name:)(Swift::String name)
{
  object = name._object;
  v5._countAndFlagsBits = name._countAndFlagsBits;
  v2._rawValue = &off_10003D4A8;
  v5._object = object;
  Swift::Int v3 = sub_100032178(v2, v5);
  swift_bridgeObjectRelease();
  return v3 == 1;
}

AegirPoster::AegirPosterCropStyle_optional __swiftcall AegirPosterCropStyle.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v6._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._rawValue = &off_10003D4A8;
  v6._object = object;
  Swift::Int v3 = sub_100032178(v2, v6);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = AegirPoster_AegirPosterCropStyle_detail;
  }
  else {
    v4.value = AegirPoster_AegirPosterCropStyle_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t AegirPosterCropStyle.rawValue.getter(char a1)
{
  if (a1) {
    return 0x6C6961746544;
  }
  else {
    return 1819047238;
  }
}

uint64_t sub_100020844(char *a1, char *a2)
{
  return sub_1000206E0(*a1, *a2);
}

Swift::Int sub_100020850()
{
  return sub_1000321F8();
}

uint64_t sub_1000208C8()
{
  sub_100031C98();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10002092C()
{
  return sub_1000321F8();
}

uint64_t sub_1000209A0@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  Swift::Int v3 = (void *)a1[1];
  v4._rawValue = &off_10003D4A8;
  v8._object = v3;
  Swift::Int v5 = sub_100032178(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100020A00(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1819047238;
  if (*v1) {
    uint64_t v2 = 0x6C6961746544;
  }
  unint64_t v3 = 0xE400000000000000;
  if (*v1) {
    unint64_t v3 = 0xE600000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t static NUNIAegirStyleDefinition.== infix(_:_:)(float a1, float32x2_t a2, float32x2_t a3, double a4, float a5, float32x2_t a6, float32x2_t a7)
{
  return sub_100020A58(a1, a2, a3, a5, a6, a7);
}

uint64_t sub_100020A44(float32x2_t *a1, float32x2_t *a2)
{
  return sub_100020A58(a1->f32[0], a1[1], a1[2], a2->f32[0], a2[1], a2[2]);
}

uint64_t sub_100020A58(float a1, float32x2_t a2, float32x2_t a3, float a4, float32x2_t a5, float32x2_t a6)
{
  __int8 v6 = 0;
  if (a1 == a4 && (vceq_f32(a3, a6).u32[0] & 1) != 0)
  {
    int32x2_t v7 = vceq_f32((float32x2_t)__PAIR64__(a3.u32[1], a2.u32[0]), (float32x2_t)__PAIR64__(a6.u32[1], a5.u32[0]));
    if (v7.i8[4] & 1) != 0 && (v7.i8[0]) {
      __int8 v6 = vceq_f32(a2, a5).i8[4];
    }
  }
  return v6 & 1;
}

unint64_t sub_100020AA8()
{
  unint64_t result = qword_1000454E0;
  if (!qword_1000454E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000454E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AegirPosterCropStyle(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AegirPosterCropStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100020C58);
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

unsigned char *sub_100020C80(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AegirPosterCropStyle()
{
  return &type metadata for AegirPosterCropStyle;
}

void *sub_100020C9C(uint64_t a1)
{
  unint64_t v40 = &_swiftEmptyArrayStorage;
  sub_1000320C8();
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v31 = a1;
  swift_bridgeObjectRetain();
  uint64_t v32 = v2;
  if (v2)
  {
    uint64_t v3 = 0;
    unsigned int v4 = (void *)(v31 + 40);
    do
    {
      uint64_t v12 = v4[3];
      uint64_t v13 = v4[4];
      NSString v14 = (void *)v4[1];
      NSString v15 = (void *)v4[2];
      int v16 = *(unsigned __int8 *)v4;
      v38._countAndFlagsBits = v3;
      id v37 = v15;
      id v34 = v14;
      uint64_t v35 = v13;
      uint64_t v36 = v12;
      sub_10000633C(v12);
      uint64_t v33 = sub_100032188();
      v38._countAndFlagsBits = sub_10001D6EC();
      v38._object = v17;
      v41._countAndFlagsBits = 32;
      v41._object = (void *)0xE100000000000000;
      sub_100031CA8(v41);
      if (v16) {
        v18._countAndFlagsBits = 0x6C6961746544;
      }
      else {
        v18._countAndFlagsBits = 1819047238;
      }
      if (v16) {
        NSString v19 = (void *)0xE600000000000000;
      }
      else {
        NSString v19 = (void *)0xE400000000000000;
      }
      v18._object = v19;
      sub_100031CA8(v18);
      swift_bridgeObjectRelease();
      Swift::String v20 = v38;
      NSString v21 = (objc_class *)[self mainBundle];
      v29._countAndFlagsBits = 0xE000000000000000;
      v42.value._countAndFlagsBits = 0;
      v42.value._object = 0;
      v22.super.Class isa = v21;
      v43._countAndFlagsBits = 0;
      v43._object = (void *)0xE000000000000000;
      sub_100031528(v20, v42, v22, v43, v29);
      swift_bridgeObjectRelease();

      if (v15)
      {
        *((void *)&v39 + 1) = sub_1000203F4(0, (unint64_t *)&qword_100044398);
        id v23 = v37;
        v38._countAndFlagsBits = (uint64_t)v37;
      }
      else
      {
        Swift::String v38 = (Swift::String)0;
        long long v39 = 0u;
        id v23 = v37;
      }
      id v24 = v23;
      NSString v25 = sub_100031C28();
      swift_bridgeObjectRelease();
      NSString v26 = sub_100031C28();
      swift_bridgeObjectRelease();
      uint64_t v27 = *((void *)&v39 + 1);
      id v37 = v24;
      if (*((void *)&v39 + 1))
      {
        uint64_t v5 = sub_10001D218(&v38, *((uint64_t *)&v39 + 1));
        uint64_t v6 = *(void *)(v27 - 8);
        __chkstk_darwin(v5);
        int v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v6 + 16))(v8);
        uint64_t v9 = sub_100032198();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v27);
        sub_100009B0C((uint64_t)&v38);
      }
      else
      {
        uint64_t v9 = 0;
      }
      uint64_t v10 = v36;
      NSString v11 = v34;
      ++v3;
      [objc_allocWithZone((Class)PREditingLook) initWithIdentifier:v25 displayName:v26 initialTimeFontConfiguration:0 initialTitleColor:v9];

      swift_unknownObjectRelease();
      sub_10000640C(v10);
      sub_1000320A8();
      sub_1000320D8();
      sub_1000320E8();
      sub_1000320B8();
      v4 += 6;
    }
    while (v32 != v3);
  }
  swift_bridgeObjectRelease();
  return v40;
}

id sub_100021038()
{
  uint64_t v1 = sub_100031B18();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator] = 0;
  uint64_t v5 = (objc_class *)type metadata accessor for AegirEditingController();
  v11.receiver = v0;
  v11.super_class = v5;
  id v6 = objc_msgSendSuper2(&v11, "init");
  sub_100031AB8();
  uint64_t v7 = sub_100031AF8();
  os_log_type_t v8 = sub_100031F18();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "AegirEditingController created", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  nw_parameters_create();
  nw_parameters_set_source_application_by_bundle_id();

  swift_unknownObjectRelease();
  return v6;
}

id sub_1000211F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AegirEditingController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AegirEditingController()
{
  return self;
}

uint64_t sub_1000218DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AB8();
  id v6 = sub_100031AF8();
  os_log_type_t v7 = sub_100031F18();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Editor did update. Updating editingCoordinator.", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (*(void *)(v1 + OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator))
  {
    swift_retain();
    sub_10002AE9C();
    return swift_release();
  }
  return result;
}

void sub_100021A48(uint64_t a1, const void *a2)
{
  uint64_t v4 = sub_100031B18();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  _Block_copy(a2);
  sub_100031AB8();
  os_log_type_t v8 = sub_100031AF8();
  os_log_type_t v9 = sub_100031F18();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "finalizeWithCompletion", v10, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (*(void *)(a1 + OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator))
  {
    _Block_copy(a2);
    uint64_t v11 = swift_retain();
    sub_10002B028(v11, (uint64_t)a2);
    _Block_release(a2);
    swift_release();
  }
  _Block_release(a2);
}

uint64_t sub_100021BD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AB8();
  uint64_t v6 = sub_100031AF8();
  os_log_type_t v7 = sub_100031F18();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "AegirEditingController invalidated", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator) = 0;
  return swift_release();
}

uint64_t sub_100021D28()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11AegirPoster22AegirEditingController_coordinator);
  if (!v1) {
    return 0;
  }
  long long v2 = *(_OWORD *)(v1 + 40);
  long long v6 = *(_OWORD *)(v1 + 24);
  long long v7 = v2;
  long long v8 = *(_OWORD *)(v1 + 56);
  sub_10001D0A8((uint64_t)&v7, (uint64_t)&v9, (uint64_t *)&unk_100045580);
  sub_10001D0A8((uint64_t)&v7 + 8, (uint64_t)&v10, &qword_100045100);
  uint64_t v3 = v8;
  swift_retain();
  sub_1000063B4(&v9);
  sub_1000063B4(&v10);
  sub_10000633C(v3);
  uint64_t v4 = sub_1000057F8((uint64_t)&v6);
  sub_1000063E0(&v9);
  sub_1000063E0(&v10);
  sub_10000640C(v3);
  swift_release();
  return v4;
}

uint64_t sub_100021E1C()
{
  uint64_t v0 = sub_100031B18();
  sub_100008FA8(v0, qword_100046CD8);
  sub_100008F70(v0, (uint64_t)qword_100046CD8);
  return sub_100031B08();
}

uint64_t CLAuthorizationStatus.description.getter()
{
  return 0x6E776F6E6B6E55;
}

unint64_t sub_100021F7C()
{
  unint64_t result = 0x6574654420746F4ELL;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x7463697274736552;
      break;
    case 2:
      unint64_t result = 0x6465696E6544;
      break;
    case 3:
      unint64_t result = 0x7A69726F68747541;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

NSString sub_100022054()
{
  NSString result = sub_100031C28();
  qword_100046CF0 = (uint64_t)result;
  return result;
}

NSString sub_10002208C()
{
  NSString result = sub_100031C28();
  qword_100046CF8 = (uint64_t)result;
  return result;
}

id sub_1000220C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  long long v2 = *(void **)(a1 + OBJC_IVAR____TtC11AegirPoster20AegirLocationManager__location);
  *a2 = v2;
  return v2;
}

char *sub_1000220FC(int a1)
{
  int v21 = a1;
  uint64_t v2 = sub_100031F28();
  __chkstk_darwin(v2);
  uint64_t v3 = sub_100031B58();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_100031F38();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager__location] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager] = 0;
  uint64_t v20 = OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationQueue;
  sub_1000203F4(0, (unint64_t *)&unk_100045C90);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v4);
  long long v8 = v1;
  sub_100031B48();
  id v23 = &_swiftEmptyArrayStorage;
  sub_100023DE8(&qword_100045650, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000048F0(&qword_100045658);
  sub_100023E30(&qword_100045660, &qword_100045658);
  sub_100032018();
  *(void *)&v1[v20] = sub_100031F78();
  v8[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_isInEditor] = v21;

  id v9 = (objc_class *)type metadata accessor for AegirLocationManager();
  v22.receiver = v8;
  v22.super_class = v9;
  id v10 = objc_msgSendSuper2(&v22, "init");
  id v11 = objc_allocWithZone((Class)CLLocationManager);
  uint64_t v12 = (char *)v10;
  id v13 = [v11 init];
  uint64_t v14 = OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager;
  NSString v15 = *(void **)&v12[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
  *(void *)&v12[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager] = v13;

  NSString result = *(char **)&v12[v14];
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  [result setDelegate:v12];
  NSString result = *(char **)&v12[v14];
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  NSString result = (char *)[result setDesiredAccuracy:kCLLocationAccuracyThreeKilometers];
  id v17 = *(void **)&v12[v14];
  if (v17)
  {
    id v18 = v17;
    [v18 setShowsBackgroundLocationIndicator:0];

    return v12;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_100022458(unint64_t a1)
{
  uint64_t v4 = v1;
  uint64_t v6 = sub_100031B18();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager;
  id v11 = *(void **)&v4[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
  if (!v11)
  {
    __break(1u);
    goto LABEL_56;
  }
  uint64_t v2 = (char *)&unk_100043000;
  unsigned int v12 = [v11 authorizationStatus];
  id v13 = *(void **)&v4[v10];
  if (!v13)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  unsigned int v14 = [v13 authorizationStatus];
  if (v12 != 3 && v14 != 4)
  {
    uint64_t v19 = *(void **)&v4[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager__location];
    *(void *)&v4[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager__location] = 0;

    return;
  }
  BOOL v58 = 0;
  if (a1)
  {
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      int v16 = (char *)sub_100032118();
      if (!v16) {
        goto LABEL_17;
      }
    }
    else
    {
      int v16 = *(char **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v16)
      {
LABEL_17:
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    id v17 = v16 - 1;
    if (__OFSUB__(v16, 1))
    {
      __break(1u);
    }
    else if ((a1 & 0xC000000000000001) == 0)
    {
      if (((unint64_t)v17 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if ((unint64_t)v17 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v18 = (char *)*(id *)(a1 + 8 * (void)v17 + 32);
LABEL_16:
        int v16 = v18;
        goto LABEL_17;
      }
      __break(1u);
LABEL_54:
      swift_once();
LABEL_33:
      sub_100008F70(v6, (uint64_t)qword_100046CD8);
      id v37 = v16;
      Swift::String v38 = sub_100031AF8();
      os_log_type_t v39 = sub_100031F18();
      if (os_log_type_enabled(v38, v39))
      {
        unint64_t v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        *(_DWORD *)unint64_t v40 = 136380675;
        uint64_t v54 = (uint64_t)(v40 + 4);
        uint64_t v55 = v41;
        uint64_t v56 = 0;
        unint64_t v57 = 0xE000000000000000;
        [v37 coordinate];
        sub_100031E48();
        v61._countAndFlagsBits = 44;
        v61._object = (void *)0xE100000000000000;
        sub_100031CA8(v61);
        [v37 coordinate];
        sub_100031E48();
        uint64_t v56 = sub_10001B510(v56, v57, &v55);
        sub_100031FD8();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "current location: nil; new location: %{private}s)",
          v40,
          0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      goto LABEL_44;
    }
    id v18 = (char *)sub_100032088();
    goto LABEL_16;
  }
  int v16 = 0;
LABEL_19:
  uint64_t v3 = OBJC_IVAR____TtC11AegirPoster20AegirLocationManager__location;
  uint64_t v20 = *(void **)&v4[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager__location];
  if (v20)
  {
    if (v16)
    {
      uint64_t v54 = OBJC_IVAR____TtC11AegirPoster20AegirLocationManager__location;
      int v21 = v16;
      id v22 = v20;
      [v22 coordinate];
      double v24 = v23;
      [v21 coordinate];
      double v26 = floor((v24 - v25) * 40.0);
      BOOL v58 = v26 != 0.0;
      if (qword_1000442E8 != -1) {
        swift_once();
      }
      sub_100008F70(v6, (uint64_t)qword_100046CD8);
      uint64_t v27 = v21;
      id v28 = v22;
      Swift::String v29 = v27;
      id v30 = v28;
      uint64_t v31 = sub_100031AF8();
      os_log_type_t v32 = sub_100031F18();
      int v33 = v32;
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v55 = v53;
        uint64_t v56 = 0;
        *(_DWORD *)uint64_t v34 = 136381187;
        id v51 = (uint8_t *)(v34 + 4);
        unint64_t v57 = 0xE000000000000000;
        [v30 coordinate];
        sub_100031E48();
        LODWORD(v52) = v33;
        v59._countAndFlagsBits = 44;
        v59._object = (void *)0xE100000000000000;
        sub_100031CA8(v59);
        [v30 coordinate];
        sub_100031E48();
        uint64_t v56 = sub_10001B510(v56, v57, &v55);
        sub_100031FD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 12) = 2081;
        uint64_t v56 = 0;
        unint64_t v57 = 0xE000000000000000;
        [v29 coordinate];
        sub_100031E48();
        v60._countAndFlagsBits = 44;
        v60._object = (void *)0xE100000000000000;
        sub_100031CA8(v60);
        [v29 coordinate];
        sub_100031E48();
        uint64_t v56 = sub_10001B510(v56, v57, &v55);
        sub_100031FD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 22) = 2080;
        if (v26 == 0.0) {
          uint64_t v35 = 7562585;
        }
        else {
          uint64_t v35 = 28494;
        }
        if (v26 == 0.0) {
          unint64_t v36 = 0xE300000000000000;
        }
        else {
          unint64_t v36 = 0xE200000000000000;
        }
        uint64_t v56 = sub_10001B510(v35, v36, &v55);
        sub_100031FD8();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v52, "current location: %{private}s); new location: %{private}s); areEqual? %s",
          (uint8_t *)v34,
          0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v3 = v54;
      goto LABEL_45;
    }
    if (qword_1000442E8 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_100008F70(v6, (uint64_t)qword_100046CD8);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v42, v6);
    uint64_t v2 = v4;
    Swift::String v43 = sub_100031AF8();
    int v44 = sub_100031F18();
    if (!os_log_type_enabled(v43, (os_log_type_t)v44))
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      goto LABEL_44;
    }
    LODWORD(v53) = v44;
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v52 = v46;
    *(_DWORD *)uint64_t v45 = 136380675;
    uint64_t v54 = v3;
    uint64_t v55 = v46;
    id v47 = *(void **)&v4[v3];
    if (v47)
    {
      id v51 = v45 + 4;
      uint64_t v56 = 0;
      unint64_t v57 = 0xE000000000000000;
      id v48 = v47;
      [v48 coordinate];
      sub_100031E48();
      v62._countAndFlagsBits = 44;
      v62._object = (void *)0xE100000000000000;
      sub_100031CA8(v62);
      [v48 coordinate];
      sub_100031E48();

      uint64_t v56 = sub_10001B510(v56, v57, &v55);
      sub_100031FD8();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v53, "current location: %{private}s); new location: nil",
        v45,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      uint64_t v3 = v54;
LABEL_44:
      BOOL v58 = 1;
      goto LABEL_45;
    }
LABEL_57:

    __break(1u);
    return;
  }
  if (v16)
  {
    if (qword_1000442E8 == -1) {
      goto LABEL_33;
    }
    goto LABEL_54;
  }
LABEL_45:
  swift_beginAccess();
  if (v58)
  {
    unint64_t v49 = *(char **)&v4[v3];
    *(void *)&v4[v3] = v16;
    int v16 = v49;
  }
}

void sub_100022DC4()
{
}

void sub_100022DE8()
{
}

void sub_100022E0C(void *a1, void *a2)
{
  id v4 = [self defaultCenter];
  id v5 = v4;
  if (*a1 != -1)
  {
    swift_once();
    id v4 = v5;
  }
  [v4 postNotificationName:*a2 object:0];
}

void sub_100022EB0(char a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_isInEditor) == 1)
  {
    uint64_t v2 = v1;
    if (qword_1000442E8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100031B18();
    sub_100008F70(v4, (uint64_t)qword_100046CD8);
    id v5 = sub_100031AF8();
    os_log_type_t v6 = sub_100031F18();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Requesting authorization", v7, 2u);
      swift_slowDealloc();
    }

    uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager);
    if (a1)
    {
      if (v8)
      {
        id v9 = "requestWhenInUseAuthorizationWithPrompt";
LABEL_18:
        [v8 v9];
        return;
      }
      __break(1u);
    }
    else if (v8)
    {
      id v9 = "requestWhenInUseAuthorization";
      goto LABEL_18;
    }
    __break(1u);
    return;
  }
  if (qword_1000442E8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100031B18();
  sub_100008F70(v10, (uint64_t)qword_100046CD8);
  oslog = sub_100031AF8();
  os_log_type_t v11 = sub_100031F08();
  if (os_log_type_enabled(oslog, v11))
  {
    unsigned int v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v11, "Tried to request location authorization outside of editor. This is not allowed.", v12, 2u);
    swift_slowDealloc();
  }
}

id sub_1000231C8(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1000442E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100031B18();
  sub_100008F70(v4, (uint64_t)qword_100046CD8);
  id v5 = a1;
  os_log_type_t v6 = sub_100031AF8();
  os_log_type_t v7 = sub_100031F18();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    [v5 authorizationStatus];
    uint64_t v18 = sub_10001B510(0x6E776F6E6B6E55, 0xE700000000000000, &v19);
    sub_100031FD8();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Location auth status changed to %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id result = objc_msgSend(v5, "authorizationStatus", v18);
  if (result < 3)
  {
    uint64_t v10 = sub_100031AF8();
    os_log_type_t v11 = sub_100031F18();
    if (os_log_type_enabled(v10, v11))
    {
      unsigned int v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Location manager stopUpdatingLocation.", v12, 2u);
      swift_slowDealloc();
    }

    id v13 = *(void **)(v2 + OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager);
    if (v13) {
      return [v13 stopMonitoringSignificantLocationChanges];
    }
    __break(1u);
LABEL_18:
    __break(1u);
    JUMPOUT(0x100023580);
  }
  if ((result - 3) <= 1)
  {
    unsigned int v14 = sub_100031AF8();
    os_log_type_t v15 = sub_100031F18();
    if (os_log_type_enabled(v14, v15))
    {
      int v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Location manager startUpdatingLocation", v16, 2u);
      swift_slowDealloc();
    }

    id v17 = *(void **)(v2 + OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager);
    if (!v17) {
      goto LABEL_18;
    }
    return [v17 _startMonitoringSignificantLocationChangesOfDistance:1 withPowerBudget:50000.0];
  }
  return result;
}

id sub_10002362C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AegirLocationManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AegirLocationManager()
{
  return self;
}

uint64_t sub_1000236E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100023728(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031B38();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100031B58();
  uint64_t v8 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000203F4(0, (unint64_t *)&unk_100045C90);
  os_log_type_t v11 = (void *)sub_100031F48();
  aBlock[4] = a1;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002C738;
  aBlock[3] = a2;
  unsigned int v12 = _Block_copy(aBlock);
  sub_100031B48();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100023DE8((unint64_t *)&qword_100045668, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000048F0(&qword_100045670);
  sub_100023E30((unint64_t *)&qword_100045678, &qword_100045670);
  sub_100032018();
  sub_100031F68();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v15);
}

void sub_1000239B8(unint64_t a1)
{
  if (qword_1000442E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100031B18();
  sub_100008F70(v2, (uint64_t)qword_100046CD8);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_100031AF8();
  os_log_type_t v4 = sub_100031EE8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136380675;
    sub_1000203F4(0, (unint64_t *)&qword_100045680);
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100031D68();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    sub_10001B510(v6, v8, &v10);
    sub_100031FD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Location manager didUpdateLocations. %{private}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_100022458(a1);
  if (v9) {
    sub_100023728((uint64_t)sub_100022DC4, (uint64_t)&unk_10003DF08);
  }
}

uint64_t sub_100023BD4()
{
  if (qword_1000442E8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100031B18();
  sub_100008F70(v0, (uint64_t)qword_100046CD8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100031AF8();
  os_log_type_t v2 = sub_100031F08();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = sub_1000321C8();
    sub_10001B510(v4, v5, &v7);
    sub_100031FD8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Location manager didFail. %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_100022458(0);
  return sub_100023728((uint64_t)sub_100022DE8, (uint64_t)&unk_10003DEE0);
}

uint64_t sub_100023DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100023DE0()
{
  return swift_release();
}

uint64_t sub_100023DE8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100023E30(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000236E0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100023E88(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000048F0(&qword_100045AA0);
    uint64_t v2 = (void *)sub_100032148();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    id v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_100009B5C(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_100009B5C(v35, v36);
    sub_100009B5C(v36, &v32);
    uint64_t result = sub_100032028(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_100009B5C(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_10002BE84();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100024248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100031DE8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_100031DD8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1000098B4(a1, &qword_100045090);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100031DA8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_100024428(void *a1)
{
  uint64_t v3 = sub_1000048F0((uint64_t *)&unk_100045A90);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000315F8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Geotime();
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v13 = *(void **)(v1 + 96);
  if (!v13 || *(unsigned char *)(v1 + 112) != 1) {
    return;
  }
  id v92 = v13;
  [a1 contentOffset];
  double v15 = v14;
  [a1 frame];
  double v16 = v15 / CGRectGetWidth(v101);
  if (qword_1000441E0 != -1) {
    swift_once();
  }
  double v17 = (double)(*(void *)(qword_100046C80 + 16) - 1);
  if (v16 < 0.0 || v16 > v17)
  {
    if (v16 < 0.0)
    {
      id v19 = [self mainScreen];
      id v20 = [v19 traitCollection];

      id v21 = [v20 layoutDirection];
      uint64_t v23 = *(void *)(qword_100046C80 + 16);
      if (v21 == (id)1)
      {
        if (v23)
        {
          uint64_t v24 = qword_100046C80 + 48 * v23;
          uint64_t v25 = *(void *)(v24 - 16);
          LODWORD(v88) = *(unsigned __int8 *)(v24 - 8);
          uint64_t v27 = *(void **)v24;
          int64_t v26 = *(void **)(v24 + 8);
          uint64_t v29 = *(void *)(v24 + 16);
          uint64_t v28 = *(void *)(v24 + 24);
          uint64_t v89 = v25;
          *(void *)&long long v90 = v26;
          id v30 = v26;
          uint64_t v91 = (uint64_t)v27;
          id v31 = v27;
          uint64_t v32 = v29;
LABEL_19:
          unsigned int v48 = v88;
          sub_10000633C(v32);
LABEL_21:
          double v49 = fabs(v16);
          LODWORD(v22) = -1.5;
          goto LABEL_27;
        }
      }
      else if (v23)
      {
        uint64_t v41 = *(void *)(qword_100046C80 + 32);
        LODWORD(v88) = *(unsigned __int8 *)(qword_100046C80 + 40);
        Swift::String v43 = *(void **)(qword_100046C80 + 48);
        uint64_t v42 = *(void **)(qword_100046C80 + 56);
        uint64_t v44 = *(void *)(qword_100046C80 + 64);
        uint64_t v45 = *(void *)(qword_100046C80 + 72);
        uint64_t v89 = v41;
        *(void *)&long long v90 = v42;
        id v46 = v42;
        uint64_t v91 = (uint64_t)v43;
        id v47 = v43;
        uint64_t v32 = v44;
        uint64_t v28 = v45;
        goto LABEL_19;
      }
      uint64_t v89 = 0;
      *(void *)&long long v90 = 0;
      unsigned int v48 = 0;
      uint64_t v32 = 0;
      uint64_t v28 = 0;
      uint64_t v91 = 1;
      goto LABEL_21;
    }
    if (v16 > v17)
    {
      id v33 = [self mainScreen];
      id v34 = [v33 traitCollection];

      id v35 = [v34 layoutDirection];
      uint64_t v36 = *(void *)(qword_100046C80 + 16);
      if (v35 == (id)1)
      {
        if (v36)
        {
          uint64_t v89 = *(void *)(qword_100046C80 + 32);
          LODWORD(v88) = *(unsigned __int8 *)(qword_100046C80 + 40);
          Swift::String v38 = *(void **)(qword_100046C80 + 48);
          id v37 = *(void **)(qword_100046C80 + 56);
          uint64_t v39 = *(void *)(qword_100046C80 + 64);
          uint64_t v40 = *(void *)(qword_100046C80 + 72);
LABEL_24:
          *(void *)&long long v90 = v37;
          id v51 = v37;
          uint64_t v91 = (uint64_t)v38;
          id v52 = v38;
          uint64_t v32 = v39;
          uint64_t v28 = v40;
          unsigned int v48 = v88;
          sub_10000633C(v32);
LABEL_26:
          *(double *)&long long v22 = fmod(v16, 1.0);
          double v49 = *(double *)&v22;
          LODWORD(v22) = 1.5;
LABEL_27:
          if (v91 == 1) {
            goto LABEL_28;
          }
          long long v84 = v22;
          uint64_t v54 = v48;
          uint64_t v85 = v48;
          uint64_t v55 = (void *)v90;
          sub_10001C304(v89, v54, (void *)v91, (void *)v90, v32);
          id v83 = v55;
          sub_100029648();
          uint64_t v56 = *(void **)(v1 + 96);
          uint64_t v87 = v28;
          if (v56)
          {
            uint64_t v57 = v32;
            id v58 = v56;
            if ([v58 mode]) {
              [v58 applyMode:0];
            }

            uint64_t v32 = v57;
          }
          uint64_t v86 = v32;
          sub_10000640C(v32);
          id v59 = *(id *)(v1 + 56);
          Swift::String v60 = *(void **)(v1 + 152);
          uint64_t v88 = *(void *)(v1 + 64);
          if (v60)
          {
            sub_10000633C((uint64_t)v59);
            sub_10000633C((uint64_t)v59);
            id v61 = v60;
          }
          else
          {
            Swift::String v62 = *(void **)(v1 + 40);
            if (v62)
            {
              id v82 = v59;
              sub_10000633C((uint64_t)v59);
              id v59 = v82;
              sub_10000633C((uint64_t)v82);
              id v61 = v62;
            }
            else
            {
              id v82 = objc_allocWithZone((Class)CLLocation);
              sub_10000633C((uint64_t)v59);
              sub_10000633C((uint64_t)v59);
              id v61 = [v82 initWithLatitude:37.33182 longitude:-122.03118];
            }
          }
          id v63 = v61;
          id v64 = v60;

          id v82 = *(id *)(v1 + 88);
          if (v59)
          {
            ((void (*)(uint64_t))v59)(v65);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
            int v66 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
            uint64_t v67 = (void *)v90;
            if (v66 != 1)
            {
              id v68 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
              v68(v9, v5, v6);
              uint64_t v67 = (void *)v90;
LABEL_45:
              v68(v12, v9, v6);
              *(void *)&v12[*(int *)(v10 + 20)] = v63;
              id v69 = v63;
              uint64_t v70 = v89;
              uint64_t v71 = v85;
              sub_10000BAFC(v89, v85, (uint64_t)v12, (uint64_t)v82);
              int v73 = v72;
              uint64_t v75 = v74;
              uint64_t v77 = v76;
              int v79 = v78;
              sub_100009910((uint64_t)v12);
              id v80 = v83;

              sub_10000640C((uint64_t)v59);
              *(void *)&long long v81 = v84;
              long long v90 = v81;
              [v92 setVista:v70];
              int v96 = v73;
              uint64_t v97 = v75;
              uint64_t v98 = v77;
              int v99 = v79;
              int v93 = 1091188195;
              long long v94 = (unint64_t)v90;
              int v95 = 1065353216;
              [v92 applyTransitionFraction:&v96 fromStyleDefinition:&v93 toStyleDefinition:v49];
              sub_100009A54(v70, v71, (void *)v91, v67, v86);

              sub_10000640C((uint64_t)v59);
              return;
            }
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
            uint64_t v67 = (void *)v90;
          }
          sub_1000315D8();
          sub_1000098B4((uint64_t)v5, (uint64_t *)&unk_100045A90);
          id v68 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
          goto LABEL_45;
        }
      }
      else if (v36)
      {
        uint64_t v50 = qword_100046C80 + 48 * v36;
        uint64_t v89 = *(void *)(v50 - 16);
        LODWORD(v88) = *(unsigned __int8 *)(v50 - 8);
        Swift::String v38 = *(void **)v50;
        id v37 = *(void **)(v50 + 8);
        uint64_t v39 = *(void *)(v50 + 16);
        uint64_t v40 = *(void *)(v50 + 24);
        goto LABEL_24;
      }
      uint64_t v89 = 0;
      *(void *)&long long v90 = 0;
      unsigned int v48 = 0;
      uint64_t v32 = 0;
      uint64_t v28 = 0;
      uint64_t v91 = 1;
      goto LABEL_26;
    }
  }
LABEL_28:
  id v53 = v92;
}

id sub_100024CC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AegirEditingCoordinatorScrollViewScrollObserver();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for _AegirEditingCoordinatorScrollViewScrollObserver()
{
  return self;
}

void sub_100024D2C(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  *(_WORD *)(v2 + 113) = 0;
  sub_100031A28();
  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 104) = 0;
  swift_allocObject();
  *(void *)(v2 + 120) = sub_100031A18();
  *(void *)(v2 + 128) = [objc_allocWithZone((Class)type metadata accessor for _AegirEditingCoordinatorScrollViewScrollObserver()) init];
  *(void *)(v2 + 136) = 0;
  *(unsigned char *)(v2 + 144) = 2;
  *(void *)(v2 + 152) = 0;
  *(void *)(v2 + 16) = a2;
  uint64_t v6 = qword_1000441F0;
  id v7 = a2;
  if (v6 != -1) {
    swift_once();
  }
  int v8 = dword_100046CA8;
  uint64_t v9 = qword_100046CB0;
  *(void *)(v3 + 72) = qword_100046CA0;
  *(_DWORD *)(v3 + 80) = v8;
  *(void *)(v3 + 88) = v9;
  *(unsigned char *)(v3 + 112) = !UIAccessibilityIsReduceMotionEnabled();
  id v10 = v7;
  sub_100008B70(v10, &v32);
  uint64_t v11 = v32;
  char v12 = v33;
  uint64_t v13 = v34;
  uint64_t v14 = v35;
  uint64_t v15 = v36;
  uint64_t v16 = v37;
  sub_10001D0A8((uint64_t)&v32, (uint64_t)v38, &qword_1000443B8);
  if (v39 == 1)
  {
    uint64_t v11 = 0;
    char v17 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    char v17 = v12 & 1;
  }
  *(void *)(v3 + 24) = v11;
  *(unsigned char *)(v3 + 32) = v17;
  *(void *)(v3 + 40) = v13;
  *(void *)(v3 + 48) = v14;
  *(void *)(v3 + 56) = v15;
  *(void *)(v3 + 64) = v16;
  swift_retain();
  sub_1000319C8();
  swift_release();
  sub_10002BE8C();
  swift_retain();
  swift_retain();
  sub_100031A08();
  swift_release();
  swift_weakAssign();
  if (*(unsigned char *)(v3 + 112) == 1) {
    [v10 setLooksScrollingDecelerationRate:PRScrollViewDecelerationRateSlow];
  }
  long long v18 = *(_OWORD *)(v3 + 40);
  long long v40 = *(_OWORD *)(v3 + 24);
  long long v41 = v18;
  long long v42 = *(_OWORD *)(v3 + 56);
  sub_10001D0A8((uint64_t)&v41, (uint64_t)&v43, (uint64_t *)&unk_100045580);
  sub_10001D0A8((uint64_t)&v41 + 8, (uint64_t)&v44, &qword_100045100);
  uint64_t v19 = v42;
  sub_1000063B4(&v43);
  sub_1000063B4(&v44);
  sub_10000633C(v19);
  id v20 = sub_100027C6C((uint64_t)&v40, v10);
  sub_1000063E0(&v43);
  sub_1000063E0(&v44);
  sub_10000640C(v19);
  [v20 setStyleAnimationDelegate:v3];
  [v20 setPulseAnimationDelegate:v3];
  id v21 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v20;
  id v22 = v20;

  sub_100028214(0, 0);
  sub_10002508C();
  uint64_t v23 = *(char **)(v3 + 104);
  if (!v23)
  {
    char v31 = 2;
LABEL_18:
    *(unsigned char *)(v3 + 144) = v31;
    sub_100025540(a1);

    return;
  }
  uint64_t v24 = OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager;
  uint64_t v25 = *(void **)&v23[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
  if (v25)
  {
    int64_t v26 = v23;
    unsigned int v27 = [v25 authorizationStatus];
    uint64_t v28 = *(void **)&v23[v24];
    if (v28)
    {
      unsigned int v29 = [v28 authorizationStatus];

      char v31 = v27 == 3 || v29 == 4;
      goto LABEL_18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10002508C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AB8();
  uint64_t v6 = sub_100031AF8();
  os_log_type_t v7 = sub_100031F18();
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Setup location manager", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = self;
  id v10 = [v9 defaultCenter];
  if (qword_1000442F0 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_100046CF0;
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v33 = sub_10002BEE0;
  uint64_t v34 = v12;
  aBlock = _NSConcreteStackBlock;
  uint64_t v30 = 1107296256;
  char v31 = sub_1000196EC;
  uint64_t v32 = &unk_10003DFF8;
  uint64_t v13 = _Block_copy(&aBlock);
  swift_release();
  id v14 = [v10 addObserverForName:v11 object:0 queue:0 usingBlock:v13];
  _Block_release(v13);
  swift_unknownObjectRelease();

  id v15 = [v9 defaultCenter];
  if (qword_1000442F8 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_100046CF8;
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v33 = sub_10002BF00;
  uint64_t v34 = v17;
  aBlock = _NSConcreteStackBlock;
  uint64_t v30 = 1107296256;
  char v31 = sub_1000196EC;
  uint64_t v32 = &unk_10003E020;
  long long v18 = _Block_copy(&aBlock);
  swift_release();
  id v19 = [v15 addObserverForName:v16 object:0 queue:0 usingBlock:v18];
  _Block_release(v18);
  swift_unknownObjectRelease();

  id v20 = objc_allocWithZone((Class)type metadata accessor for AegirLocationManager());
  id v21 = sub_1000220FC(1);
  id v22 = *(void **)(v1 + 104);
  *(void *)(v1 + 104) = v21;

  uint64_t v23 = *(void **)(v1 + 104);
  if (v23)
  {
    uint64_t v24 = v23;
    sub_100022EB0(0);
    if (qword_1000442E8 != -1) {
      swift_once();
    }
    sub_100008F70(v2, (uint64_t)qword_100046CD8);
    uint64_t v25 = sub_100031AF8();
    os_log_type_t v26 = sub_100031F18();
    if (os_log_type_enabled(v25, v26))
    {
      unsigned int v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Location manager startUpdatingLocation", v27, 2u);
      swift_slowDealloc();
    }

    uint64_t v28 = *(void **)&v24[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
    if (v28)
    {
      [v28 _startMonitoringSignificantLocationChangesOfDistance:1 withPowerBudget:50000.0];
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_100025540(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000048F0(&qword_100045090);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v7 = (void *)sub_100031B18();
  uint64_t v8 = *(v7 - 1);
  __chkstk_darwin(v7);
  id v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AB8();
  uint64_t v11 = sub_100031AF8();
  os_log_type_t v12 = sub_100031F18();
  BOOL v13 = os_log_type_enabled(v11, v12);
  Swift::String v62 = v6;
  *(void *)&long long v61 = a1;
  if (v13)
  {
    uint64_t v14 = swift_slowAlloc();
    id v60 = v7;
    id v15 = (uint8_t *)v14;
    uint64_t v64 = swift_slowAlloc();
    *(_DWORD *)id v15 = 136315138;
    uint64_t v16 = sub_100031F88();
    uint64_t v63 = sub_10001B510(v16, v17, &v64);
    sub_100031FD8();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Editor didRotate: %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t result = (*(uint64_t (**)(char *, id))(v8 + 8))(v10, v60);
  }
  else
  {

    uint64_t result = (*(uint64_t (**)(char *, void *))(v8 + 8))(v10, v7);
  }
  id v19 = *(void **)(v2 + 96);
  if (v19)
  {
    uint64_t v20 = *(void *)(v2 + 24);
    char v21 = *(unsigned char *)(v2 + 32);
    id v22 = *(void **)(v2 + 40);
    uint64_t v23 = v61;
    float v24 = 0.0;
    os_log_type_t v26 = *(void (**)(uint64_t))(v2 + 56);
    uint64_t v25 = *(void *)(v2 + 64);
    if ((unint64_t)(v61 - 2) <= 2) {
      float v24 = flt_1000338BC[(void)v61 - 2];
    }
    id v60 = *(id *)(v2 + 48);
    id v27 = v19;
    id v59 = v22;
    sub_10000633C((uint64_t)v26);
    id v28 = [v27 vistaView];
    id v29 = [v28 scene];

    id v30 = *(id *)(v2 + 16);
    uint64_t v31 = sub_10000BF60(v30, v23);
    float v33 = v32;
    float v35 = v34;
    float v37 = v36;
    uint64_t v38 = v31;

    *(float *)(v2 + 72) = v33;
    *(float *)(v2 + 76) = v35;
    *(float *)(v2 + 80) = v37;
    *(void *)(v2 + 88) = v38;
    *(float *)&double v39 = sub_10000C228(v20, v21, v22, v26, v25, v38, v33, v35, v37);
    double v41 = v40;
    long long v61 = v42;
    [v29 setCameraOrbit:v39];
    [v29 setCameraOffset:v41];
    CLLocationCoordinate2D v45 = CLLocationCoordinate2DMake(0.0, 0.0);
    double longitude = v45.longitude;
    double latitude = v45.latitude;
    double v46 = vmuls_lane_f32(-15.0, *(float32x2_t *)&v61, 1);
    if (v20 != 1)
    {
      double longitude = (float)(-15.0 * *(float *)&v61);
      double latitude = v46;
    }
    objc_msgSend(v29, "setOffsetCoordinate:", latitude, longitude, (float)(-15.0 * *(float *)&v61), v46);
    [v29 restingCameraRoll];
    float v48 = v47;
    [v29 cameraPosition];
    long long v61 = v49;
    [v29 cameraTarget];
    long long v58 = v50;
    [v29 cameraUp];
    *(float *)&double v51 = v24 + v48;
    [v29 setCamera:*(double *)&v61 target:*(double *)&v58 up:v52 roll:v51];
    [v29 updateCamera];
    uint64_t v53 = sub_100031DE8();
    uint64_t v54 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v62, 1, 1, v53);
    uint64_t v55 = swift_allocObject();
    swift_weakInit();
    sub_100031DC8();
    swift_retain();
    uint64_t v56 = sub_100031DB8();
    uint64_t v57 = (void *)swift_allocObject();
    v57[2] = v56;
    v57[3] = &protocol witness table for MainActor;
    v57[4] = v55;
    swift_release();
    sub_10001025C(v54, (uint64_t)&unk_100045A60, (uint64_t)v57);
    swift_release();
    sub_100029C58();

    return sub_10000640C((uint64_t)v26);
  }
  return result;
}

uint64_t sub_100025A6C()
{
  sub_100025B1C();
  uint64_t v1 = *(void **)(v0 + 96);
  if (v1)
  {
    id v2 = [v1 vistaView];
    [v2 purgeUnused];
  }
  uint64_t v3 = *(void **)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);

  sub_10000640C(v4);
  swift_release();

  swift_release();
  return v0;
}

void sub_100025B1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v1 + 104);
  if (v6)
  {
    os_log_type_t v7 = v6;
    sub_100031AB8();
    uint64_t v8 = sub_100031AF8();
    os_log_type_t v9 = sub_100031F18();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Teardown location manager", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    id v11 = [self defaultCenter];
    [v11 removeObserver:v1];

    if (qword_1000442E8 != -1) {
      swift_once();
    }
    sub_100008F70(v2, (uint64_t)qword_100046CD8);
    os_log_type_t v12 = sub_100031AF8();
    os_log_type_t v13 = sub_100031F18();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Location manager stopUpdatingLocation.", v14, 2u);
      swift_slowDealloc();
    }

    id v15 = *(void **)&v7[OBJC_IVAR____TtC11AegirPoster20AegirLocationManager_locationManager];
    if (v15)
    {
      [v15 stopMonitoringSignificantLocationChanges];

      uint64_t v16 = *(void **)(v1 + 104);
      *(void *)(v1 + 104) = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_100025D84()
{
  sub_100025A6C();

  return _swift_deallocClassInstance(v0, 160, 7);
}

uint64_t type metadata accessor for AegirEditingCoordinator()
{
  return self;
}

void sub_100025DDC(void *a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000048F0((uint64_t *)&unk_100045A90);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  os_log_type_t v9 = (char *)&v187 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v204 = (char *)&v187 - v10;
  uint64_t v11 = sub_1000315F8();
  uint64_t v206 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v187 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v205 = (char *)&v187 - v15;
  *(void *)&long long v209 = type metadata accessor for Geotime();
  uint64_t v16 = __chkstk_darwin(v209);
  long long v18 = (char *)&v187 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  *(void *)&long long v207 = (char *)&v187 - v19;
  uint64_t v20 = sub_100031B18();
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v187 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v21);
  os_log_type_t v26 = (char *)&v187 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  id v29 = (char *)&v187 - v28;
  uint64_t v30 = __chkstk_darwin(v27);
  float v33 = (char *)&v187 - v32;
  if (*(unsigned char *)(v3 + 112) != 1) {
    return;
  }
  uint64_t v203 = v31;
  v208 = (void (*)(void))v30;
  uint64_t v199 = v14;
  id v201 = v18;
  v200 = v9;
  uint64_t v202 = v11;
  id v34 = [*(id *)(v3 + 16) currentLook];
  id v35 = [v34 identifier];

  uint64_t v36 = sub_100031C58();
  unint64_t v38 = v37;

  uint64_t v39 = sub_100004B94(v36, v38);
  if (v40)
  {
    sub_100031AB8();
    id v59 = a1;
    id v60 = sub_100031AF8();
    os_log_type_t v61 = sub_100031F08();
    if (os_log_type_enabled(v60, v61))
    {
      Swift::String v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = (void *)swift_slowAlloc();
      *(_DWORD *)Swift::String v62 = 138412290;
      *(void *)&double v214 = v59;
      uint64_t v64 = v59;
      sub_100031FD8();
      *uint64_t v63 = v59;

      _os_log_impl((void *)&_mh_execute_header, v60, v61, "Current look identifier can not convert to Int: %@", v62, 0xCu);
      sub_1000048F0(&qword_100045128);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v60 = v59;
    }

    (*(void (**)(char *, void (*)(void)))(v203 + 8))(v23, v208);
    return;
  }
  unint64_t v41 = v39;
  id v42 = [a1 identifier];
  uint64_t v43 = sub_100031C58();
  unint64_t v45 = v44;

  uint64_t v46 = sub_100004B94(v43, v45);
  if (v47)
  {
    sub_100031AB8();
    uint64_t v65 = a1;
    int v66 = sub_100031AF8();
    os_log_type_t v67 = sub_100031F08();
    if (os_log_type_enabled(v66, v67))
    {
      id v68 = (uint8_t *)swift_slowAlloc();
      id v69 = (void *)swift_slowAlloc();
      *(_DWORD *)id v68 = 138412290;
      *(void *)&double v214 = v65;
      uint64_t v70 = v65;
      sub_100031FD8();
      *id v69 = v65;

      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Transitioning look identifier can not convert to Int: %@", v68, 0xCu);
      sub_1000048F0(&qword_100045128);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      int v66 = v65;
    }

    (*(void (**)(char *, void (*)(void)))(v203 + 8))(v26, v208);
    return;
  }
  unint64_t v48 = v46;
  sub_100031AB8();
  long long v49 = sub_100031AF8();
  os_log_type_t v50 = sub_100031EF8();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = swift_slowAlloc();
    *(_DWORD *)uint64_t v51 = 134218496;
    *(void *)&double v214 = v41;
    sub_100031FD8();
    *(_WORD *)(v51 + 12) = 2048;
    *(void *)&double v214 = v48;
    sub_100031FD8();
    *(_WORD *)(v51 + 22) = 2048;
    double v214 = a2;
    sub_100031FD8();
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Scrolling from: %ld to index: %ld, progress: %f", (uint8_t *)v51, 0x20u);
    swift_slowDealloc();
  }

  double v52 = *(void (**)(char *, void (*)(void)))(v203 + 8);
  v52(v33, v208);
  uint64_t v53 = *(void **)(v3 + 96);
  uint64_t v54 = v202;
  if (v53)
  {
    if (v41 == v48)
    {
      id v55 = v53;
      sub_100031AB8();
      uint64_t v56 = sub_100031AF8();
      os_log_type_t v57 = sub_100031EF8();
      if (os_log_type_enabled(v56, v57))
      {
        long long v58 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)long long v58 = 134217984;
        *(void *)&double v214 = v41;
        sub_100031FD8();
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Scrolled to: %ld", v58, 0xCu);
        swift_slowDealloc();
      }

      v52(v29, v208);
      if ([v55 mode] != (id)1) {
        [v55 applyMode:1];
      }

      return;
    }
    uint64_t v71 = qword_1000441E0;
    id v72 = v53;
    if (v71 == -1)
    {
      if ((v48 & 0x8000000000000000) == 0) {
        goto LABEL_24;
      }
    }
    else
    {
      swift_once();
      if ((v48 & 0x8000000000000000) == 0)
      {
LABEL_24:
        unint64_t v73 = *(void *)(qword_100046C80 + 16);
        if (v48 < v73)
        {
          if (v41 < v73)
          {
            uint64_t v74 = qword_100046C80 + 32 + 48 * v48;
            unint64_t v75 = *(void *)v74;
            int v193 = *(unsigned __int8 *)(v74 + 8);
            uint64_t v76 = *(void **)(v74 + 16);
            uint64_t v77 = *(void **)(v74 + 24);
            uint64_t v78 = *(void *)(v74 + 32);
            uint64_t v79 = qword_100046C80 + 32 + 48 * v41;
            uint64_t v196 = *(void *)v79;
            int v192 = *(unsigned __int8 *)(v79 + 8);
            id v80 = *(void **)(v79 + 24);
            id v198 = *(id *)(v79 + 16);
            v208 = *(void (**)(void))(v79 + 32);
            uint64_t v203 = *(void *)(v79 + 40);
            unint64_t v197 = v41;
            unint64_t v191 = v48;
            id v189 = v72;
            id v194 = v80;
            id v195 = v76;
            if (v41 >= v48)
            {
              id v89 = v77;
              id v90 = v76;
              sub_10000633C(v78);
              id v91 = v80;
              id v92 = v198;
              sub_10000633C((uint64_t)v208);
            }
            else
            {
              long long v81 = self;
              id v82 = v77;
              id v83 = v76;
              sub_10000633C(v78);
              id v84 = v80;
              id v85 = v198;
              sub_10000633C((uint64_t)v208);
              id v86 = [v81 mainScreen];
              id v87 = [v86 traitCollection];

              id v88 = [v87 layoutDirection];
              if (v88 != (id)1) {
                goto LABEL_32;
              }
            }
            if (v191 >= v197
              || (id v93 = [self mainScreen],
                  id v94 = [v93 traitCollection],
                  v93,
                  id v95 = [v94 layoutDirection],
                  v94,
                  v95 != (id)1))
            {
              a2 = 1.0 - a2;
              uint64_t v110 = v196;
              goto LABEL_36;
            }
LABEL_32:
            if (v197 < *(void *)(qword_100046C80 + 16))
            {
              int v96 = v77;
              uint64_t v97 = qword_100046C80 + 48 * v197;
              unint64_t v197 = *(void *)(v97 + 32);
              int v193 = *(unsigned __int8 *)(v97 + 40);
              uint64_t v98 = *(void **)(v97 + 48);
              uint64_t v77 = *(void **)(v97 + 56);
              uint64_t v99 = *(void *)(v97 + 64);
              id v100 = v77;
              id v101 = v98;
              sub_10000633C(v99);

              sub_10000640C(v78);
              if (v191 < *(void *)(qword_100046C80 + 16))
              {
                uint64_t v102 = qword_100046C80 + 48 * v191;
                uint64_t v103 = *(void *)(v102 + 32);
                int v192 = *(unsigned __int8 *)(v102 + 40);
                uint64_t v104 = *(void **)(v102 + 48);
                uint64_t v105 = *(void **)(v102 + 56);
                uint64_t v106 = *(void *)(v102 + 64);
                uint64_t v107 = *(void *)(v102 + 72);
                id v108 = v105;
                id v109 = v104;
                sub_10000633C(v106);

                sub_10000640C((uint64_t)v208);
                v208 = (void (*)(void))v106;
                uint64_t v203 = v107;
                id v194 = v105;
                uint64_t v110 = v103;
                id v198 = v104;
                uint64_t v78 = v99;
                id v195 = v98;
                uint64_t v54 = v202;
                unint64_t v75 = v197;
LABEL_36:
                unint64_t v197 = v75;
                uint64_t v196 = v110;
                if (v75 == v110)
                {
                  uint64_t v111 = v193 ? 0x6C6961746544 : 1819047238;
                  unint64_t v112 = v193 ? 0xE600000000000000 : 0xE400000000000000;
                  uint64_t v113 = v192 ? 0x6C6961746544 : 1819047238;
                  unint64_t v114 = v192 ? 0xE600000000000000 : 0xE400000000000000;
                  LODWORD(v191) = v111 == v113 && v112 == v114 ? 1 : sub_1000321A8();
                  id v115 = v77;
                  sub_10000633C(v78);
                  id v116 = v195;
                  unint64_t v117 = v77;
                  uint64_t v118 = (uint64_t)v208;
                  sub_10000633C((uint64_t)v208);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v119 = v118;
                  uint64_t v77 = v117;
                  sub_10000640C(v119);

                  sub_10000640C(v78);
                  uint64_t v54 = v202;
                  if (v191)
                  {

                    sub_10000640C((uint64_t)v208);
                    sub_10000640C(v78);
                    return;
                  }
                }
                id v188 = v77;
                sub_10000640C(v78);
                unint64_t v120 = *(void (**)(void))(v3 + 56);
                uint64_t v121 = *(void *)(v3 + 64);
                long long v122 = *(void **)(v3 + 152);
                if (v122)
                {
                  sub_10000633C(*(void *)(v3 + 56));
                  sub_10000633C((uint64_t)v120);
                  long long v123 = v122;
                  id v124 = v204;
                }
                else
                {
                  unsigned __int32 v125 = *(void **)(v3 + 40);
                  id v124 = v204;
                  if (v125)
                  {
                    sub_10000633C(*(void *)(v3 + 56));
                    sub_10000633C((uint64_t)v120);
                    id v126 = v125;
                  }
                  else
                  {
                    id v127 = objc_allocWithZone((Class)CLLocation);
                    sub_10000633C((uint64_t)v120);
                    sub_10000633C((uint64_t)v120);
                    id v126 = [v127 initWithLatitude:37.33182 longitude:-122.03118];
                  }
                  long long v123 = v126;
                }
                id v128 = v122;
                sub_10000640C((uint64_t)v208);
                id v129 = v123;

                uint64_t v130 = *(void *)(v3 + 56);
                uint64_t v131 = *(void *)(v3 + 64);
                float32x2_t v132 = *(void **)(v3 + 152);
                v208 = (void (*)(void))v130;
                uint64_t v203 = v131;
                if (v132)
                {
                  sub_10000633C(v130);
                  sub_10000633C(v130);
                  id v133 = v132;
                }
                else
                {
                  long long v134 = *(void **)(v3 + 40);
                  if (v134)
                  {
                    uint64_t v135 = (uint64_t)v208;
                    sub_10000633C((uint64_t)v208);
                    sub_10000633C(v135);
                    id v133 = v134;
                  }
                  else
                  {
                    id v136 = objc_allocWithZone((Class)CLLocation);
                    uint64_t v137 = (uint64_t)v208;
                    sub_10000633C((uint64_t)v208);
                    sub_10000633C(v137);
                    id v133 = [v136 initWithLatitude:37.33182 longitude:-122.03118];
                  }
                }
                id v195 = v133;
                id v138 = v132;

                swift_retain();
                uint64_t v139 = sub_1000319B8();
                swift_release();
                id v140 = *(id *)(v3 + 16);
                uint64_t v141 = sub_10000BF60(v140, v139);
                int v143 = v142;
                int v145 = v144;
                int v147 = v146;
                uint64_t v148 = v141;

                *(_DWORD *)(v3 + 72) = v143;
                *(_DWORD *)(v3 + 76) = v145;
                *(_DWORD *)(v3 + 80) = v147;
                *(void *)(v3 + 88) = v148;
                unint64_t v191 = (unint64_t)v120;
                uint64_t v190 = v121;
                if (v120)
                {
                  uint64_t v204 = (char *)v188;
                  v120();
                  uint64_t v149 = v206;
                  uint64_t v150 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v206 + 56);
                  v150(v124, 0, 1, v54);
                  if ((*(unsigned int (**)(id, uint64_t, uint64_t))(v149 + 48))(v124, 1, v54) != 1)
                  {
                    double v151 = *(void (**)(char *, id, uint64_t))(v149 + 32);
                    uint64_t v152 = v205;
                    v151(v205, v124, v54);
                    goto LABEL_71;
                  }
                }
                else
                {
                  uint64_t v149 = v206;
                  uint64_t v150 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v206 + 56);
                  v150(v124, 1, 1, v54);
                  uint64_t v204 = (char *)v188;
                }
                uint64_t v152 = v205;
                sub_1000315D8();
                sub_1000098B4((uint64_t)v124, (uint64_t *)&unk_100045A90);
                double v151 = *(void (**)(char *, id, uint64_t))(v149 + 32);
LABEL_71:
                uint64_t v153 = v207;
                v151((char *)v207, v152, v54);
                *(void *)(v153 + *(int *)(v209 + 20)) = v129;
                int v154 = (char *)v129;
                uint64_t v206 = v148;
                sub_10000BAFC(v197, v193, v153, v148);
                int v156 = v155;
                uint64_t v158 = v157;
                float32x2_t v160 = v159;
                int v162 = v161;
                sub_100009910(v153);

                uint64_t v205 = v154;
                sub_10000640C(v191);
                uint64_t v163 = v208;
                if (v208)
                {
                  id v164 = v194;
                  uint64_t v165 = (uint64_t)v200;
                  v163();
                  v150((id)v165, 0, 1, v54);
                  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v149 + 48))(v165, 1, v54) != 1)
                  {
                    uint64_t v166 = v199;
                    v151(v199, (id)v165, v54);
                    unint64_t v167 = v197;
LABEL_76:
                    uint64_t v168 = (uint64_t)v201;
                    v151(v201, v166, v54);
                    id v169 = v195;
                    *(void *)(v168 + *(int *)(v209 + 20)) = v195;
                    id v170 = v169;
                    uint64_t v171 = v196;
                    sub_10000BAFC(v196, v192, v168, v206);
                    uint64_t v206 = v172;
                    long long v207 = v173;
                    long long v209 = v174;
                    int v176 = v175;
                    sub_100009910(v168);

                    uint64_t v177 = (uint64_t)v208;
                    sub_10000640C((uint64_t)v208);
                    sub_100029648();
                    uint64_t v178 = *(void **)(v3 + 96);
                    id v179 = v189;
                    if (v178)
                    {
                      id v180 = v178;
                      if ([v180 mode]) {
                        [v180 applyMode:0];
                      }
                    }
                    id v181 = [v179 vista];
                    if (v167 == v171)
                    {
                      if (v181 != (id)v171) {
                        [v179 setVista:v171];
                      }
                      LODWORD(v214) = v156;
                      uint64_t v215 = v158;
                      float32x2_t v216 = v160;
                      int v217 = v162;
                      int v210 = v206;
                      uint64_t v211 = v207;
                      uint64_t v212 = v209;
                      int v213 = v176;
                      [v179 applyTransitionFraction:&v214 fromStyleDefinition:&v210 toStyleDefinition:a2];
                    }
                    else
                    {
                      if (v181 != (id)v167) {
                        [v179 setVista:v167];
                      }
                      [v179 styleDefinition];
                      v182.i64[1] = v215;
                      v182.i64[0] = __PAIR64__(v216.u32[1], LODWORD(v214));
                      uint64_t v183 = v209;
                      uint64_t v184 = v207;
                      v185.i64[1] = v207;
                      int v186 = v206;
                      v185.i64[0] = __PAIR64__(DWORD1(v209), v206);
                      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(v182, v185)), 0xFuLL))) & 1) == 0
                        || (vceq_f32(v216, *(float32x2_t *)&v209).u32[0] & 1) == 0)
                      {
                        LODWORD(v214) = v206;
                        uint64_t v215 = v207;
                        float32x2_t v216 = (float32x2_t)v209;
                        int v217 = v176;
                        [v179 setStyleDefinition:&v214];
                        int v186 = v206;
                        uint64_t v184 = v207;
                        uint64_t v183 = v209;
                      }
                      LODWORD(v214) = v156;
                      uint64_t v215 = v158;
                      float32x2_t v216 = v160;
                      int v217 = v162;
                      int v210 = v186;
                      uint64_t v211 = v184;
                      uint64_t v212 = v183;
                      int v213 = v176;
                      [v179 applyTransitionFraction:v167 fromVista:&v214 fromStyleDefinition:v171 toVista:&v210 toStyleDefinition:a2];
                    }

                    sub_10000640C(v177);
                    sub_10000640C(v191);
                    return;
                  }
                }
                else
                {
                  uint64_t v165 = (uint64_t)v200;
                  v150(v200, 1, 1, v54);
                  id v164 = v194;
                }
                unint64_t v167 = v197;
                uint64_t v166 = v199;
                sub_1000315D8();
                sub_1000098B4(v165, (uint64_t *)&unk_100045A90);
                goto LABEL_76;
              }
LABEL_96:
              __break(1u);
              return;
            }
LABEL_95:
            __break(1u);
            goto LABEL_96;
          }
LABEL_94:
          __break(1u);
          goto LABEL_95;
        }
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
    }
    __break(1u);
    goto LABEL_93;
  }
}

void sub_10002727C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_100031B18();
  uint64_t v98 = *(v4 - 1);
  id v99 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = &v92[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1000048F0((uint64_t *)&unk_100045A90);
  __chkstk_darwin(v7 - 8);
  uint64_t v97 = &v92[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_1000315F8();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v92[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v96 = type metadata accessor for Geotime();
  __chkstk_darwin(v96);
  uint64_t v14 = &v92[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v15 = [a1 identifier];
  uint64_t v16 = sub_100031C58();
  unint64_t v18 = v17;

  uint64_t v19 = HIBYTE(v18) & 0xF;
  uint64_t v20 = v16 & 0xFFFFFFFFFFFFLL;
  if ((v18 & 0x2000000000000000) != 0) {
    uint64_t v21 = HIBYTE(v18) & 0xF;
  }
  else {
    uint64_t v21 = v16 & 0xFFFFFFFFFFFFLL;
  }
  if (!v21)
  {
    swift_bridgeObjectRelease();
    goto LABEL_79;
  }
  if ((v18 & 0x1000000000000000) != 0)
  {
    uint64_t v23 = (uint64_t)sub_100004DFC(v16, v18, 10);
    LOBYTE(v16) = v91;
    goto LABEL_44;
  }
  if ((v18 & 0x2000000000000000) != 0)
  {
    id v100 = v16;
    uint64_t v101 = v18 & 0xFFFFFFFFFFFFFFLL;
    if (v16 == 43)
    {
      if (!v19)
      {
LABEL_90:
        __break(1u);
        return;
      }
      if (v19 == 1 || (BYTE1(v16) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v23 = (BYTE1(v16) - 48);
      if (v19 != 2)
      {
        if ((BYTE2(v16) - 48) > 9u) {
          goto LABEL_31;
        }
        uint64_t v23 = 10 * (BYTE1(v16) - 48) + (BYTE2(v16) - 48);
        uint64_t v25 = v19 - 3;
        if (v25)
        {
          os_log_type_t v26 = (unsigned __int8 *)&v100 + 3;
          while (1)
          {
            unsigned int v27 = *v26 - 48;
            if (v27 > 9) {
              goto LABEL_31;
            }
            uint64_t v28 = 10 * v23;
            if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
              goto LABEL_31;
            }
            uint64_t v23 = v28 + v27;
            if (__OFADD__(v28, v27)) {
              goto LABEL_31;
            }
            LOBYTE(v16) = 0;
            ++v26;
            if (!--v25) {
              goto LABEL_44;
            }
          }
        }
      }
    }
    else
    {
      if (v16 == 45)
      {
        if (!v19)
        {
LABEL_89:
          __break(1u);
          goto LABEL_90;
        }
        if (v19 != 1 && (BYTE1(v16) - 48) <= 9u)
        {
          if (v19 == 2)
          {
            LOBYTE(v16) = 0;
            uint64_t v23 = -(uint64_t)(BYTE1(v16) - 48);
            goto LABEL_44;
          }
          if ((BYTE2(v16) - 48) <= 9u)
          {
            uint64_t v23 = -10 * (BYTE1(v16) - 48) - (BYTE2(v16) - 48);
            uint64_t v33 = v19 - 3;
            if (!v33) {
              goto LABEL_43;
            }
            id v82 = (unsigned __int8 *)&v100 + 3;
            while (1)
            {
              unsigned int v83 = *v82 - 48;
              if (v83 > 9) {
                break;
              }
              uint64_t v84 = 10 * v23;
              if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
                break;
              }
              uint64_t v23 = v84 - v83;
              if (__OFSUB__(v84, v83)) {
                break;
              }
              LOBYTE(v16) = 0;
              ++v82;
              if (!--v33) {
                goto LABEL_44;
              }
            }
          }
        }
LABEL_31:
        uint64_t v23 = 0;
        LOBYTE(v16) = 1;
        goto LABEL_44;
      }
      if (!v19 || (v16 - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v23 = (v16 - 48);
      if (v19 != 1)
      {
        if ((BYTE1(v16) - 48) > 9u) {
          goto LABEL_31;
        }
        uint64_t v23 = 10 * (v16 - 48) + (BYTE1(v16) - 48);
        uint64_t v29 = v19 - 2;
        if (v29)
        {
          uint64_t v30 = (unsigned __int8 *)&v100 + 2;
          while (1)
          {
            unsigned int v31 = *v30 - 48;
            if (v31 > 9) {
              goto LABEL_31;
            }
            uint64_t v32 = 10 * v23;
            if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63) {
              goto LABEL_31;
            }
            uint64_t v23 = v32 + v31;
            if (__OFADD__(v32, v31)) {
              goto LABEL_31;
            }
            LOBYTE(v16) = 0;
            ++v30;
            if (!--v29) {
              goto LABEL_44;
            }
          }
        }
      }
    }
LABEL_43:
    LOBYTE(v16) = 0;
    goto LABEL_44;
  }
  if ((v16 & 0x1000000000000000) != 0) {
    uint64_t v22 = (unsigned __int8 *)((v18 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    uint64_t v22 = (unsigned __int8 *)sub_100032098();
  }
  uint64_t v23 = (uint64_t)sub_100004DE4(v22, v20, 10);
  LOBYTE(v16) = v24 & 1;
LABEL_44:
  swift_bridgeObjectRelease();
  if (v16)
  {
LABEL_79:
    sub_100031AB8();
    id v85 = a1;
    id v86 = sub_100031AF8();
    os_log_type_t v87 = sub_100031F08();
    if (os_log_type_enabled(v86, v87))
    {
      id v88 = (uint8_t *)swift_slowAlloc();
      id v89 = (void *)swift_slowAlloc();
      *(_DWORD *)id v88 = 138412290;
      id v100 = v85;
      id v90 = v85;
      sub_100031FD8();
      *id v89 = v85;

      _os_log_impl((void *)&_mh_execute_header, v86, v87, "Current look identifier can not convert to Int: %@", v88, 0xCu);
      sub_1000048F0(&qword_100045128);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v86 = v85;
    }

    (*(void (**)(unsigned char *, id))(v98 + 8))(v6, v99);
    return;
  }
  id v34 = *(void **)(v2 + 96);
  if (!v34) {
    return;
  }
  uint64_t v35 = qword_1000441E0;
  id v99 = v34;
  if (v35 == -1)
  {
    if ((v23 & 0x8000000000000000) == 0) {
      goto LABEL_48;
    }
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  swift_once();
  if (v23 < 0) {
    goto LABEL_87;
  }
LABEL_48:
  if ((unint64_t)v23 >= *(void *)(qword_100046C80 + 16))
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  uint64_t v98 = v9;
  uint64_t v36 = qword_100046C80 + 48 * v23;
  uint64_t v37 = *(void *)(v36 + 32);
  int v93 = *(unsigned __int8 *)(v36 + 40);
  uint64_t v39 = *(void **)(v36 + 48);
  unint64_t v38 = *(void **)(v36 + 56);
  char v40 = *(void (**)(void))(v2 + 56);
  unint64_t v41 = *(void **)(v2 + 152);
  id v94 = (void *)v37;
  id v95 = v38;
  if (v41)
  {
    id v42 = v38;
    sub_10000633C((uint64_t)v40);
    id v43 = v42;
    sub_10000633C((uint64_t)v40);
    id v44 = v39;
    unint64_t v45 = v41;
  }
  else
  {
    uint64_t v46 = *(void **)(v2 + 40);
    if (v46)
    {
      id v47 = v95;
      sub_10000633C((uint64_t)v40);
      id v48 = v47;
      sub_10000633C((uint64_t)v40);
      id v44 = v39;
      id v49 = v46;
    }
    else
    {
      id v50 = objc_allocWithZone((Class)CLLocation);
      id v51 = v95;
      sub_10000633C((uint64_t)v40);
      id v52 = v51;
      sub_10000633C((uint64_t)v40);
      id v44 = v39;
      id v49 = [v50 initWithLatitude:37.33182 longitude:-122.03118];
    }
    unint64_t v45 = v49;
  }
  id v53 = v41;
  id v54 = v45;

  swift_retain();
  uint64_t v55 = sub_1000319B8();
  swift_release();
  id v56 = *(id *)(v2 + 16);
  uint64_t v57 = sub_10000BF60(v56, v55);
  int v59 = v58;
  int v61 = v60;
  int v63 = v62;
  uint64_t v64 = v57;

  *(_DWORD *)(v2 + 72) = v59;
  *(_DWORD *)(v2 + 76) = v61;
  *(_DWORD *)(v2 + 80) = v63;
  *(void *)(v2 + 88) = v64;
  uint64_t v65 = (uint64_t)v97;
  if (!v40)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v97, 1, 1, v98);
    goto LABEL_59;
  }
  v40();
  uint64_t v66 = v98;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v65, 0, 1, v98);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v65, 1, v66) == 1)
  {
LABEL_59:
    sub_1000315D8();
    sub_1000098B4(v65, (uint64_t *)&unk_100045A90);
    os_log_type_t v67 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 32);
    goto LABEL_60;
  }
  os_log_type_t v67 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 32);
  v67(v12, v65, v98);
LABEL_60:
  v67(v14, (uint64_t)v12, v98);
  *(void *)&v14[*(int *)(v96 + 20)] = v54;
  id v68 = v54;
  id v69 = v94;
  sub_10000BAFC((uint64_t)v94, v93, (uint64_t)v14, v64);
  int v71 = v70;
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  int v77 = v76;
  sub_100009910((uint64_t)v14);

  id v78 = v95;
  sub_10000640C((uint64_t)v40);
  if ([v99 vista] != v69) {
    [v99 setVista:v69];
  }
  sub_100029648();
  uint64_t v79 = *(void **)(v2 + 96);
  if (v79)
  {
    id v80 = v79;
    if ([v80 mode]) {
      [v80 applyMode:0];
    }
  }
  LODWORD(v100) = v71;
  uint64_t v101 = v73;
  uint64_t v102 = v75;
  int v103 = v77;
  [v99 applyStyleDefinition:&v100];
  sub_100028214(0, 0);
  if (!*(void *)(v2 + 24) && (*(unsigned char *)(v2 + 144) & 1) != 0 && *(void *)(v2 + 152))
  {
    id v81 = v99;
    [v99 pulseLocationDot];

    *(unsigned char *)(v2 + 114) = 1;
  }
  else
  {
    sub_1000297D8(200000000);
  }
  sub_10000640C((uint64_t)v40);
}

id sub_100027C6C(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  id v60 = a2;
  uint64_t v5 = sub_1000048F0(&qword_100045D50);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100031B18();
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AB8();
  uint64_t v11 = *(void **)(a1 + 16);
  sub_10001D0A8(a1 + 24, (uint64_t)v64, &qword_100045100);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v11;
  sub_1000063B4(v64);
  sub_10000633C(v12);
  uint64_t v14 = (void **)v13;
  sub_1000063B4(v64);
  sub_10000633C(v12);
  id v15 = sub_100031AF8();
  os_log_type_t v16 = sub_100031F18();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v61 = v12;
  if (v17)
  {
    os_log_t v53 = v15;
    id v54 = v14;
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v63 = v52;
    id v56 = v7;
    id v51 = v18;
    *(_DWORD *)unint64_t v18 = 136315138;
    id v50 = v18 + 4;
    uint64_t v19 = *(unsigned __int8 *)(a1 + 8);
    uint64_t v55 = v3;
    uint64_t v20 = *(void *)a1;
    uint64_t v21 = v14;
    uint64_t v57 = v11;
    uint64_t v22 = v21;
    sub_1000063B4(v64);
    sub_10000633C(v12);
    uint64_t v23 = sub_100008E40(v20, v19, v57);
    unint64_t v25 = v24;

    sub_1000063E0(v64);
    sub_10000640C(v12);
    uint64_t v62 = sub_10001B510(v23, v25, &v63);
    uint64_t v7 = v56;
    sub_100031FD8();

    uint64_t v3 = v55;
    swift_bridgeObjectRelease();
    sub_1000063E0(v64);
    sub_10000640C(v12);

    uint64_t v11 = v57;
    sub_1000063E0(v64);
    sub_10000640C(v12);
    os_log_t v26 = v53;
    _os_log_impl((void *)&_mh_execute_header, v53, v16, "Creating vista controller with configuration: %s", v51, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v58 + 8))(v10, v59);
    unsigned int v27 = v54;
  }
  else
  {

    sub_1000063E0(v64);
    sub_10000640C(v12);

    sub_1000063E0(v64);
    sub_10000640C(v12);

    (*(void (**)(char *, uint64_t))(v58 + 8))(v10, v59);
    unsigned int v27 = v14;
  }
  id v28 = v60;
  id v29 = [v60 contentOverlayView];
  [v29 bounds];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  id v38 = objc_msgSend(objc_msgSend(v28, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  id v39 = [v38 assetDirectory];
  swift_unknownObjectRelease();
  sub_100031558();

  uint64_t v40 = sub_100031568();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v7, 0, 1, v40);
  unint64_t v41 = v27;
  if (!v11) {
    unint64_t v41 = (void **)[objc_allocWithZone((Class)CLLocation) initWithLatitude:37.33182 longitude:-122.03118];
  }
  uint64_t v42 = *(void *)a1;
  char v43 = *(unsigned char *)(a1 + 8);
  uint64_t v44 = *(void *)(v3 + 88);
  unint64_t v45 = (_OWORD *)swift_allocObject();
  long long v46 = *(_OWORD *)(a1 + 16);
  v45[1] = *(_OWORD *)a1;
  uint64_t v45[2] = v46;
  v45[3] = *(_OWORD *)(a1 + 32);
  id v47 = v27;
  sub_1000063B4(v64);
  sub_10000633C(v61);
  id v48 = sub_10000900C((uint64_t)v7, v42, v43, v41, v44, 0, (uint64_t)sub_10002BE5C, (uint64_t)v45, v31, v33, v35, v37);

  swift_release();
  sub_1000098B4((uint64_t)v7, &qword_100045D50);
  return v48;
}

uint64_t sub_100028214(int a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000048F0(&qword_100045090);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v134 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v154 = (void *)sub_100031B18();
  uint64_t v153 = *(v154 - 1);
  uint64_t v9 = __chkstk_darwin(v154);
  uint64_t v11 = (char *)v134 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)v134 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  BOOL v17 = (char *)v134 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)v134 - v18;
  sub_100008B70(*(id *)(v3 + 16), v159);
  sub_10001D0A8((uint64_t)v159, (uint64_t)&v160, &qword_1000443B8);
  if ((void)v161 == 1)
  {
    sub_100031AB8();
    uint64_t v20 = sub_100031AF8();
    os_log_type_t v21 = sub_100031F18();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Unable to create configuration", v22, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, void *))(v153 + 8))(v11, v154);
  }
  int v147 = a1;
  long long v163 = v160;
  long long v164 = v161;
  long long v165 = v162;
  sub_100029F94();
  swift_retain();
  uint64_t v24 = sub_1000319B8();
  swift_release();
  id v25 = *(id *)(v3 + 16);
  uint64_t v26 = sub_10000BF60(v25, v24);
  float v28 = v27;
  float v30 = v29;
  float v32 = v31;
  uint64_t v152 = v26;

  uint64_t v33 = v163;
  BOOL v34 = *(void *)(v3 + 24) == (void)v163;
  uint64_t v149 = v8;
  int v148 = a2;
  uint64_t v151 = v163;
  uint64_t v150 = (_OWORD *)(v3 + 24);
  if (!v34)
  {
    float v44 = *(float *)(v3 + 72);
    int v144 = (float *)(v3 + 72);
    int v143 = (float *)(v3 + 76);
    int v142 = (float *)(v3 + 80);
    uint64_t v141 = (void *)(v3 + 88);
    if (v44 == v28)
    {
      BOOL v45 = *(float *)(v3 + 76) == v30;
      if (*(float *)(v3 + 80) != v32) {
        BOOL v45 = 0;
      }
      LODWORD(v46) = *(void *)(v3 + 88) == v152 && v45;
LABEL_45:
      sub_100031AB8();
      id v54 = (void *)v164;
      sub_10001D0A8((uint64_t)&v164 + 8, (uint64_t)&v166, &qword_100045100);
      long long v55 = v165;
      id v140 = v54;
      id v56 = v54;
      swift_retain();
      sub_1000063B4(&v166);
      sub_10000633C(v55);
      swift_retain();
      id v146 = v56;
      sub_1000063B4(&v166);
      sub_10000633C(v55);
      uint64_t v57 = sub_100031AF8();
      os_log_type_t v58 = sub_100031F18();
      int v59 = v58;
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v60 = swift_slowAlloc();
        v134[2] = *((void *)&v55 + 1);
        uint64_t v61 = v60;
        uint64_t v137 = (void *)swift_slowAlloc();
        id v155 = v137;
        *(_DWORD *)uint64_t v61 = 136315394;
        v134[1] = v61 + 4;
        int v145 = v14;
        uint64_t v62 = *(void *)(v3 + 24);
        uint64_t v63 = *(unsigned __int8 *)(v3 + 32);
        int v139 = v46;
        uint64_t v65 = *(void **)(v3 + 40);
        uint64_t v64 = *(void **)(v3 + 48);
        os_log_t v136 = v57;
        uint64_t v66 = *(void *)(v3 + 56);
        id v67 = v64;
        int v135 = v59;
        id v68 = v67;
        id v69 = v65;
        id v138 = v17;
        id v70 = v69;
        sub_10000633C(v66);
        uint64_t v71 = sub_100008E40(v62, v63, v65);
        unint64_t v73 = v72;

        uint64_t v33 = v151;
        sub_10000640C(v66);
        uint64_t v167 = sub_10001B510(v71, v73, (uint64_t *)&v155);
        sub_100031FD8();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v61 + 12) = 2080;
        uint64_t v74 = BYTE8(v163);
        id v75 = v146;
        sub_1000063B4(&v166);
        sub_10000633C(v55);
        uint64_t v46 = sub_100008E40(v33, v74, v140);
        unint64_t v77 = v76;

        sub_1000063E0(&v166);
        sub_10000640C(v55);
        uint64_t v78 = v46;
        LOBYTE(v46) = v139;
        uint64_t v167 = sub_10001B510(v78, v77, (uint64_t *)&v155);
        uint64_t v14 = v145;
        sub_100031FD8();

        swift_bridgeObjectRelease();
        sub_1000063E0(&v166);
        sub_10000640C(v55);

        sub_1000063E0(&v166);
        sub_10000640C(v55);
        os_log_t v79 = v136;
        _os_log_impl((void *)&_mh_execute_header, v136, (os_log_type_t)v135, "Configuration changed from: %s; to: %s",
          (uint8_t *)v61,
          0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, void *))(v153 + 8))(v138, v154);
      }
      else
      {
        id v80 = v146;

        swift_release_n();
        sub_1000063E0(&v166);
        sub_10000640C(v55);

        sub_1000063E0(&v166);
        sub_10000640C(v55);

        (*(void (**)(char *, void *))(v153 + 8))(v17, v154);
      }
      if (v46) {
        goto LABEL_51;
      }
      goto LABEL_49;
    }
LABEL_44:
    LODWORD(v46) = 0;
    goto LABEL_45;
  }
  double v35 = v17;
  char v36 = a2;
  double v37 = v14;
  uint64_t v38 = *(void *)(v3 + 56);
  if (*(unsigned char *)(v3 + 32)) {
    uint64_t v39 = 0x6C6961746544;
  }
  else {
    uint64_t v39 = 1819047238;
  }
  if (*(unsigned char *)(v3 + 32)) {
    unint64_t v40 = 0xE600000000000000;
  }
  else {
    unint64_t v40 = 0xE400000000000000;
  }
  if (BYTE8(v163)) {
    uint64_t v41 = 0x6C6961746544;
  }
  else {
    uint64_t v41 = 1819047238;
  }
  if (BYTE8(v163)) {
    unint64_t v42 = 0xE600000000000000;
  }
  else {
    unint64_t v42 = 0xE400000000000000;
  }
  if (v39 == v41 && v40 == v42) {
    char v43 = 1;
  }
  else {
    char v43 = sub_1000321A8();
  }
  sub_10000633C(v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000640C(v38);
  float v47 = *(float *)(v3 + 72);
  float v48 = *(float *)(v3 + 80);
  int v142 = (float *)(v3 + 80);
  uint64_t v49 = *(void *)(v3 + 88);
  uint64_t v141 = (void *)(v3 + 88);
  int v144 = (float *)(v3 + 72);
  int v143 = (float *)(v3 + 76);
  if (v47 != v28)
  {
    uint64_t v14 = v37;
    if (v43)
    {
LABEL_40:
      uint64_t v33 = v151;
      goto LABEL_49;
    }
    BOOL v17 = v35;
LABEL_41:
    LODWORD(v46) = 0;
    uint64_t v33 = v151;
    goto LABEL_45;
  }
  uint64_t v14 = v37;
  BOOL v17 = v35;
  if (*(float *)(v3 + 76) != v30)
  {
    if (v43) {
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  if (v48 != v32)
  {
    uint64_t v33 = v151;
LABEL_43:
    if ((v43 & 1) == 0) {
      goto LABEL_44;
    }
LABEL_49:
    sub_100031AB8();
    swift_retain_n();
    id v81 = sub_100031AF8();
    os_log_type_t v82 = sub_100031F18();
    if (!os_log_type_enabled(v81, v82))
    {

      swift_release_n();
      (*(void (**)(char *, void *))(v153 + 8))(v14, v154);
      id v90 = *(void **)(v3 + 96);
      if (v90)
      {
LABEL_52:
        char v91 = v150;
        uint64_t v92 = *(void *)v150;
        int v93 = v90;
        id v94 = v93;
        if (v92 != v33) {
          [v93 setVista:v33];
        }
        int v154 = v94;
        id v95 = (void *)v164;
        sub_10001D0A8((uint64_t)&v164 + 8, (uint64_t)&v167, &qword_100045100);
        long long v96 = v165;
        uint64_t v98 = *(void **)(v3 + 40);
        uint64_t v97 = *(void **)(v3 + 48);
        uint64_t v99 = *(void *)(v3 + 56);
        long long v100 = v165;
        long long v101 = v163;
        v91[1] = v164;
        v91[2] = v100;
        *char v91 = v101;
        id v102 = v95;
        sub_1000063B4((id *)&v167);
        sub_10000633C(v96);
        id v103 = v102;
        sub_1000063B4((id *)&v167);
        sub_10000633C(v96);

        sub_10000640C(v99);
        sub_1000063E0((id *)&v167);
        sub_10000640C(v96);
        char v104 = v148;
        if ((v148 & 1) == 0)
        {
          *int v144 = v28;
          *int v143 = v30;
          *int v142 = v32;
          *uint64_t v141 = v152;
        }
        float v105 = sub_10000C228(v33, SBYTE8(v163), v95, (void (*)(uint64_t))v96, *((uint64_t *)&v96 + 1), v152, v28, v30, v32);
        float v109 = v105;
        uint64_t v110 = v106;
        uint64_t v111 = v107;
        int v112 = v108;
        uint64_t v113 = (uint64_t)v149;
        id v114 = v154;
        if ((v147 & 1) == 0)
        {
          *(float *)&id v155 = v105;
          uint64_t v156 = v106;
          uint64_t v157 = v107;
          int v158 = v108;
          [v154 applyStyleDefinition:&v155];
LABEL_73:
          uint64_t v130 = sub_100031DE8();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v130 - 8) + 56))(v113, 1, 1, v130);
          uint64_t v131 = swift_allocObject();
          swift_weakInit();
          sub_100031DC8();
          swift_retain();
          uint64_t v132 = sub_100031DB8();
          id v133 = (void *)swift_allocObject();
          v133[2] = v132;
          v133[3] = &protocol witness table for MainActor;
          v133[4] = v131;
          swift_release();
          sub_10001025C(v113, (uint64_t)&unk_100045A80, (uint64_t)v133);

          swift_release();
          sub_1000063E0((id *)&v167);
          uint64_t v129 = v96;
          return sub_10000640C(v129);
        }
        sub_100029648();
        id v116 = *(void **)(v3 + 96);
        if (v116)
        {
          id v117 = v116;
          if ([v117 mode]) {
            [v117 applyMode:0];
          }
        }
        if ((v104 & 1) == 0)
        {
          *(float *)&id v155 = v109;
          uint64_t v156 = v110;
          uint64_t v157 = v111;
          int v158 = v112;
          LODWORD(v115) = 1050253722;
          [v114 animateToStyleDefinition:&v155 duration:v115];
          uint64_t v121 = 300000000;
LABEL_72:
          sub_1000297D8(v121);
          goto LABEL_73;
        }
        [v114 hideLocationDotPulse];
        *(unsigned char *)(v3 + 114) = 0;
        swift_retain();
        sub_1000319F8();
        float v119 = v118;
        uint64_t result = swift_release();
        float v120 = (float)(v119 + 0.1) * 1000000000.0;
        if ((~LODWORD(v120) & 0x7F800000) != 0)
        {
          if (v120 > -1.0)
          {
            if (v120 < 1.8447e19)
            {
              if ((unint64_t)v120 <= 0x11E1A300) {
                uint64_t v121 = 300000000;
              }
              else {
                uint64_t v121 = (unint64_t)v120;
              }
              goto LABEL_72;
            }
LABEL_80:
            __break(1u);
            return result;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_80;
      }
LABEL_70:
      sub_10001D0A8((uint64_t)&v164, (uint64_t)&v167, (uint64_t *)&unk_100045580);
      sub_10001D0A8((uint64_t)&v164 + 8, (uint64_t)&v155, &qword_100045100);
      uint64_t v122 = v165;
      long long v123 = *(void **)(v3 + 40);
      id v124 = *(void **)(v3 + 48);
      uint64_t v125 = *(void *)(v3 + 56);
      long long v126 = v165;
      id v127 = v150;
      long long v128 = v163;
      v150[1] = v164;
      v127[2] = v126;
      *id v127 = v128;
      sub_1000063B4((id *)&v167);
      sub_1000063B4(&v155);
      sub_10000633C(v122);

      sub_10000640C(v125);
      sub_1000063E0((id *)&v167);
      sub_1000063E0(&v155);
      uint64_t v129 = v122;
      return sub_10000640C(v129);
    }
    uint64_t v83 = swift_slowAlloc();
    uint64_t v84 = (void *)swift_slowAlloc();
    int v145 = v14;
    id v155 = v84;
    *(_DWORD *)uint64_t v83 = 136315394;
    uint64_t v85 = sub_10000A5AC();
    uint64_t v167 = sub_10001B510(v85, v86, (uint64_t *)&v155);
    uint64_t v87 = v153;
    sub_100031FD8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v83 + 12) = 2080;
    uint64_t v88 = sub_10000A5AC();
    uint64_t v167 = sub_10001B510(v88, v89, (uint64_t *)&v155);
    uint64_t v33 = v151;
    sub_100031FD8();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v81, v82, "Environment changed from: %s; to: %s", (uint8_t *)v83, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void *))(v87 + 8))(v145, v154);
LABEL_51:
    id v90 = *(void **)(v3 + 96);
    if (v90) {
      goto LABEL_52;
    }
    goto LABEL_70;
  }
  char v50 = v36;
  uint64_t v33 = v151;
  if (v49 != v152) {
    goto LABEL_43;
  }
  if ((v43 & 1) == 0)
  {
    LODWORD(v46) = 1;
    goto LABEL_45;
  }
  if (v50) {
    goto LABEL_51;
  }
  sub_100031AB8();
  id v51 = sub_100031AF8();
  os_log_type_t v52 = sub_100031F18();
  if (os_log_type_enabled(v51, v52))
  {
    os_log_t v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_t v53 = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "Configuration and Environment are equal and not rotating", v53, 2u);
    swift_slowDealloc();

    sub_10001D0A8((uint64_t)&v164, (uint64_t)&v167, (uint64_t *)&unk_100045580);
    sub_1000063E0((id *)&v167);
    sub_10001D0A8((uint64_t)&v164 + 8, (uint64_t)&v155, &qword_100045100);
    sub_1000063E0(&v155);
    sub_10000640C(v165);
  }
  else
  {
    sub_10001D0A8((uint64_t)&v164, (uint64_t)&v167, (uint64_t *)&unk_100045580);
    sub_1000063E0((id *)&v167);
    sub_10001D0A8((uint64_t)&v164 + 8, (uint64_t)&v155, &qword_100045100);
    sub_1000063E0(&v155);
    sub_10000640C(v165);
  }
  return (*(uint64_t (**)(char *, void *))(v153 + 8))(v19, v154);
}

uint64_t sub_1000291F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = sub_100031B18();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  sub_100031DC8();
  v4[10] = sub_100031DB8();
  uint64_t v7 = sub_100031DA8();
  return _swift_task_switch(sub_1000292E4, v7, v6);
}

void sub_1000292E4()
{
  uint64_t v23 = v0;
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    swift_retain();
    uint64_t v3 = sub_1000319B8();
    swift_release();
    LODWORD(v4) = sub_10000C0E4(*(unsigned char *)(v2 + 32), v3) ^ 1;
    sub_100031AB8();
    uint64_t v5 = sub_100031AF8();
    os_log_type_t v6 = sub_100031F18();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v9 = *(void *)(v0 + 64);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 56);
    if (v7)
    {
      char v21 = v4;
      uint64_t v4 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 67109378;
      *(_DWORD *)(v0 + 88) = v21 & 1;
      sub_100031FD8();
      *(_WORD *)(v4 + 8) = 2080;
      uint64_t v11 = sub_100031F88();
      *(void *)(v0 + 40) = sub_10001B510(v11, v12, &v22);
      sub_100031FD8();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Foreground should be hidden: %{BOOL}d, using orientation: %s", (uint8_t *)v4, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      LOBYTE(v4) = v21;
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    }
    uint64_t v13 = *(void **)(v2 + 96);
    if (!v13)
    {
      swift_release();
      goto LABEL_14;
    }
    id v14 = v13;
    id v15 = [v14 vistaView];
    id v16 = [v15 quadViews];

    sub_100006718();
    unint64_t v17 = sub_100031D58();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = (void *)sub_100032118();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v18 = *(void **)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v18)
      {
LABEL_8:
        if ((v17 & 0xC000000000000001) != 0)
        {
          id v19 = (id)sub_100032088();
        }
        else
        {
          if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v19 = *(id *)(v17 + 32);
        }
        uint64_t v18 = v19;
      }
    }
    swift_bridgeObjectRelease();
    [v18 setHidden:v4 & 1];

    swift_release();
  }
LABEL_14:
  swift_task_dealloc();
  uint64_t v20 = *(void (**)(void))(v0 + 8);
  v20();
}

uint64_t sub_100029648()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = __chkstk_darwin(v2);
  os_log_type_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v1 + 136))
  {
    swift_retain();
    sub_100031AB8();
    BOOL v7 = sub_100031AF8();
    os_log_type_t v8 = sub_100031F18();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Applying scheduled deactive mode", v9, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    sub_1000048F0(&qword_1000454C0);
    sub_100031DF8();
    swift_release();
    *(void *)(v1 + 136) = 0;
    return swift_release();
  }
  return result;
}

id sub_1000297D8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000048F0(&qword_100045090);
  id result = (id)__chkstk_darwin(v4 - 8);
  BOOL v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(v1 + 136))
  {
    os_log_type_t v8 = *(void **)(v1 + 96);
    if (!v8 || (id result = [v8 mode], result != (id)1))
    {
      uint64_t v9 = sub_100031DE8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
      uint64_t v10 = swift_allocObject();
      swift_weakInit();
      sub_100031DC8();
      swift_retain();
      uint64_t v11 = sub_100031DB8();
      unint64_t v12 = (void *)swift_allocObject();
      v12[2] = v11;
      uint64_t v12[3] = &protocol witness table for MainActor;
      v12[4] = a1;
      v12[5] = v10;
      swift_release();
      *(void *)(v2 + 136) = sub_100024248((uint64_t)v7, (uint64_t)&unk_100045A78, (uint64_t)v12);
      return (id)swift_release();
    }
  }
  return result;
}

uint64_t sub_10002995C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a5;
  v5[6] = sub_100031DC8();
  v5[7] = sub_100031DB8();
  BOOL v7 = (void *)swift_task_alloc();
  v5[8] = v7;
  *BOOL v7 = v5;
  v7[1] = sub_100029A10;
  return static Task<>.sleep(nanoseconds:)(a4);
}

uint64_t sub_100029A10()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_100031DA8();
  if (v0) {
    uint64_t v4 = sub_10001528C;
  }
  else {
    uint64_t v4 = sub_100029B6C;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_100029B6C()
{
  swift_release();
  if ((sub_100031E08() & 1) == 0)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v2 = Strong;
      uint64_t v3 = *(void **)(Strong + 96);
      if (v3)
      {
        id v4 = v3;
        if ([v4 mode] != (id)1) {
          [v4 applyMode:1];
        }
      }
      *(void *)(v2 + 136) = 0;
      swift_release();
      swift_release();
    }
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void sub_100029C58()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  char v6 = sub_1000319A8();
  swift_release();
  if ((v6 & 1) == 0 && (*(unsigned char *)(v0 + 114) & 1) == 0)
  {
    sub_100031AB8();
    uint64_t v7 = sub_100031AF8();
    os_log_type_t v8 = sub_100031F18();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Applying deactive mode", v9, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_100029648();
    uint64_t v10 = *(void **)(v1 + 96);
    if (v10)
    {
      id v11 = v10;
      if ([v11 mode] != (id)1) {
        [v11 applyMode:1];
      }
    }
  }
}

void sub_100029E08(void *a1)
{
  id v3 = a1;
  sub_10002BB6C(a1);

  sub_100029F94();
  uint64_t v4 = *(void **)(v1 + 96);
  if (v4)
  {
    id v5 = objc_allocWithZone((Class)CLLocation);
    id v10 = v4;
    id v6 = [v5 initWithLatitude:37.33182 longitude:-122.03118];
    [v10 updateLocation:v3 fallbackLocation:v6 animated:0];

    if ([v10 mode] == (id)1)
    {
      id v7 = [v10 vistaView];
      [v7 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
    }
    if (!*(void *)(v1 + 24) && (*(unsigned char *)(v1 + 144) & 1) != 0 && *(void *)(v1 + 152))
    {
      sub_100029648();
      os_log_type_t v8 = *(void **)(v1 + 96);
      if (v8)
      {
        id v9 = v8;
        if ([v9 mode]) {
          [v9 applyMode:0];
        }
      }
      sub_1000297D8(1500000000);
      [v10 pulseLocationDot];
    }
  }
}

void sub_100029F94()
{
  uint64_t v1 = *(void **)(v0 + 96);
  if (v1)
  {
    id v4 = v1;
    if (![v4 vista])
    {
      if (*(void *)(v0 + 152)) {
        BOOL v2 = (*(unsigned char *)(v0 + 144) & 1) == 0;
      }
      else {
        BOOL v2 = 1;
      }
      double v3 = 1.0;
      if (v2) {
        double v3 = 0.0;
      }
      [v4 setLocationDotAlpha:v3];
    }
  }
}

void sub_10002A020()
{
  uint64_t v0 = sub_100031B18();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  double v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    sub_100031AB8();
    id v6 = sub_100031AF8();
    os_log_type_t v7 = sub_100031F18();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Location Updated", v8, 2u);
      swift_slowDealloc();
    }

    uint64_t v9 = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    if (*(void *)(v5 + 104))
    {
      __chkstk_darwin(v9);
      v13[-2] = v10;
      id v11 = v10;
      sub_1000048F0((uint64_t *)&unk_100045580);
      sub_100031F58();

      uint64_t v12 = (void *)v13[2];
    }
    else
    {
      uint64_t v12 = 0;
    }
    sub_100029E08(v12);
    swift_release();
  }
}

uint64_t sub_10002A230()
{
  uint64_t v0 = sub_100031B18();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  double v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100031AB8();
    uint64_t v5 = sub_100031AF8();
    os_log_type_t v6 = sub_100031F18();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Location Failed", v7, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_100029E08(0);
    return swift_release();
  }
  return result;
}

uint64_t sub_10002A480(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  v103[0] = a3;
  uint64_t v7 = sub_100031B18();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AB8();
  id v11 = sub_100031AF8();
  os_log_type_t v12 = sub_100031F18();
  BOOL v13 = os_log_type_enabled(v11, v12);
  *(void *)&long long v102 = a1;
  if (v13)
  {
    uint64_t v14 = swift_slowAlloc();
    *(void *)&long long v101 = a2;
    uint64_t v15 = v14;
    uint64_t v16 = swift_slowAlloc();
    *(void *)&long long v100 = v7;
    v105[0] = v16;
    *(_DWORD *)uint64_t v15 = 134218498;
    double v104 = *(float *)v103;
    sub_100031FD8();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v17 = sub_100031F88();
    double v104 = COERCE_DOUBLE(sub_10001B510(v17, v18, v105));
    sub_100031FD8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2080;
    uint64_t v19 = sub_100031F88();
    double v104 = COERCE_DOUBLE(sub_10001B510(v19, v20, v105));
    sub_100031FD8();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Editor rotating: %f from: %s to: %s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v101;
    swift_slowDealloc();

    uint64_t result = (*(uint64_t (**)(char *, void))(v8 + 8))(v10, v100);
  }
  else
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v22 = *(void **)(v4 + 96);
  if (v22)
  {
    *(void *)&long long v101 = *(void *)(v4 + 24);
    char v23 = *(unsigned char *)(v4 + 32);
    uint64_t v24 = *(void **)(v4 + 40);
    float v25 = 0.0;
    float v26 = 0.0;
    float v27 = *(void (**)(uint64_t))(v4 + 56);
    uint64_t v28 = *(void *)(v4 + 64);
    if ((unint64_t)(v102 - 2) <= 2) {
      float v26 = flt_1000338BC[(void)v102 - 2];
    }
    uint64_t v29 = a2;
    if ((unint64_t)(a2 - 2) <= 2) {
      float v25 = flt_1000338BC[a2 - 2];
    }
    float v30 = vabds_f32(v26, v25);
    float v31 = v26 + -6.2832;
    if (v26 < v25) {
      float v31 = v26 + 6.2832;
    }
    if (v30 > 3.1416) {
      float v32 = v31;
    }
    else {
      float v32 = v26;
    }
    float v33 = v25 + -6.2832;
    if (v26 >= v25) {
      float v33 = v25;
    }
    if (v30 == 3.1416) {
      float v34 = v33;
    }
    else {
      float v34 = v25;
    }
    if (v30 == 3.1416) {
      float v35 = v26;
    }
    else {
      float v35 = v32;
    }
    id v99 = *(id *)(v4 + 48);
    id v36 = v22;
    id v37 = v24;
    sub_10000633C((uint64_t)v27);
    id v98 = v36;
    id v38 = [v36 vistaView];
    id v39 = [v38 scene];

    float v40 = *(float *)(v4 + 72);
    float v41 = *(float *)(v4 + 76);
    float v42 = *(float *)(v4 + 80);
    uint64_t v43 = *(void *)(v4 + 88);
    id v44 = *(id *)(v4 + 16);
    uint64_t v45 = sub_10000BF60(v44, v29);
    float v47 = v46;
    float v49 = v48;
    float v51 = v50;
    uint64_t v52 = v45;

    uint64_t v53 = v101;
    float v54 = sub_10000C228(v101, v23, v24, v27, v28, v43, v40, v41, v42);
    long long v100 = v55;
    long long v97 = v56;
    float v57 = sub_10000C228(v53, v23, v24, v27, v28, v52, v47, v49, v51);
    long long v102 = v58;
    float32x2_t v60 = v59;
    *(float *)&double v61 = v54 + (float)(*(float *)v103 * (float)(v57 - v54));
    [v39 setCameraOrbit:v61];
    *(int32x2_t *)&long long v62 = vceqz_f32(*(float32x2_t *)&v100);
    if ((vpmin_u32(*(uint32x2_t *)&v62, *(uint32x2_t *)&v62).u32[0] & 0x80000000) != 0
      || (uint32x2_t v63 = (uint32x2_t)vceqz_f32(*(float32x2_t *)&v102), (vpmin_u32(v63, v63).u32[0] & 0x80000000) != 0)
      || (vceq_f32(*(float32x2_t *)&v100, *(float32x2_t *)&v102).u8[0] & 1) != 0
      || (float v64 = *((float *)&v100 + 1), v65 = *((float *)&v102 + 1), *((float *)&v100 + 1) == *((float *)&v102 + 1)))
    {
      float32x2_t v66 = vmla_n_f32(*(float32x2_t *)&v100, vsub_f32(*(float32x2_t *)&v102, *(float32x2_t *)&v100), *(float *)v103);
      id v68 = v98;
      id v67 = v99;
    }
    else
    {
      *(float32x2_t *)&long long v62 = vmul_f32(*(float32x2_t *)&v100, *(float32x2_t *)&v100);
      unsigned __int32 v79 = vadd_f32(*(float32x2_t *)&v62, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v62, 1)).u32[0];
      float32x2_t v80 = vmul_f32(*(float32x2_t *)&v102, *(float32x2_t *)&v102);
      float v95 = sqrtf(vaddv_f32(*(float32x2_t *)&v62));
      *(float32x2_t *)&long long v62 = vadd_f32(v80, (float32x2_t)vdup_lane_s32((int32x2_t)v80, 1));
      long long v96 = v62;
      float v94 = sqrtf(vaddv_f32(v80));
      float32x2_t v81 = vrsqrte_f32((float32x2_t)v79);
      float32x2_t v82 = vmul_f32(v81, vrsqrts_f32((float32x2_t)v79, vmul_f32(v81, v81)));
      float v83 = acosf(fminf(fmaxf(vmul_f32(*(float32x2_t *)&v100, vmul_f32(v82, vrsqrts_f32((float32x2_t)v79, vmul_f32(v82, v82)))).f32[0], -1.0), 1.0));
      if (v64 >= 0.0) {
        float v84 = v83;
      }
      else {
        float v84 = 6.2832 - v83;
      }
      float32x2_t v85 = vrsqrte_f32((float32x2_t)v96);
      float32x2_t v86 = vmul_f32(v85, vrsqrts_f32((float32x2_t)v96, vmul_f32(v85, v85)));
      float v87 = acosf(fminf(fmaxf(vmul_f32(*(float32x2_t *)&v102, vmul_f32(v86, vrsqrts_f32((float32x2_t)v96, vmul_f32(v86, v86)))).f32[0], -1.0), 1.0));
      if (v65 < 0.0) {
        float v87 = 6.2832 - v87;
      }
      if ((float)(v87 - v84) >= 3.1406)
      {
        float v84 = v84 + 6.2832;
        float v89 = *(float *)v103;
        id v68 = v98;
        id v67 = v99;
        float v90 = v95;
        float v91 = v94;
      }
      else
      {
        float v89 = *(float *)v103;
        id v68 = v98;
        id v67 = v99;
        float v90 = v95;
        float v91 = v94;
        if ((float)(v84 - v87) > 3.1426) {
          float v87 = v87 + 6.2832;
        }
      }
      *(float *)&long long v88 = v90 + (float)(v89 * (float)(v91 - v90));
      long long v102 = v88;
      __float2 v92 = __sincosf_stret(v84 + (float)(v89 * (float)(v87 - v84)));
      float32x2_t v66 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v92.__sinval), LODWORD(v92.__cosval)), *(float *)&v102);
    }
    [v39 setCameraOffset:*(double *)&v66];
    CLLocationCoordinate2D v71 = CLLocationCoordinate2DMake(0.0, 0.0);
    double longitude = v71.longitude;
    double latitude = v71.latitude;
    if (v53 != 1)
    {
      float32x2_t v72 = vmla_n_f32(*(float32x2_t *)&v97, vsub_f32(v60, *(float32x2_t *)&v97), *(float *)v103);
      double latitude = vmuls_lane_f32(-15.0, v72, 1);
      double longitude = (float)(-15.0 * v72.f32[0]);
    }
    objc_msgSend(v39, "setOffsetCoordinate:", latitude, longitude);
    [v39 restingCameraRoll];
    float v74 = v73;
    [v39 cameraPosition];
    long long v102 = v75;
    [v39 cameraTarget];
    long long v101 = v76;
    [v39 cameraUp];
    *(float *)&double v77 = (float)(v35 + (float)(*(float *)v103 * (float)(v34 - v35))) + v74;
    [v39 setCamera:*(double *)&v102 target:*(double *)&v101 up:v78 roll:v77];
    [v39 updateCamera];

    return sub_10000640C((uint64_t)v27);
  }
  return result;
}

uint64_t sub_10002ABC8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10002ABF8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002AC34(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001D6E0;
  return sub_1000291F0(a1, v4, v5, v6);
}

void sub_10002ACE8(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [a1 backgroundView];
  id v5 = [v4 superview];

  if (v5)
  {
    id v6 = [v5 superview];

    if (v6)
    {
      self;
      uint64_t v7 = (void *)swift_dynamicCastObjCClass();
      if (v7) {
        [v7 _addScrollViewScrollObserver:*(void *)(v2 + 128)];
      }
    }
  }
  uint64_t v8 = *(void **)(v2 + 96);
  if (v8)
  {
    id v9 = v8;
    id v10 = [a1 backgroundView];
    id v11 = [a1 floatingView];
    sub_10000641C(v10, v11);

    id v12 = [v9 vistaView];
    [v12 updateSunLocationAnimated:0];

    sub_100029F94();
    id v13 = [v9 vistaView];
    [v13 renderSynchronouslyWithImageQueueDiscard:0 inGroup:0];
  }
}

uint64_t sub_10002AE9C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AB8();
  id v6 = sub_100031AF8();
  os_log_type_t v7 = sub_100031F18();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Editor did update. Updating editingCoordinator.", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((*(unsigned char *)(v1 + 113) & 1) == 0)
  {
    id v10 = *(void **)(v1 + 16);
    swift_retain();
    id v11 = v10;
    char v12 = sub_1000319D8();
    swift_release();

    return sub_100028214(1, v12 & 1);
  }
  return result;
}

void sub_10002B028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031B18();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  float v73 = (char *)&v67 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v67 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v67 - v14;
  sub_100031AB8();
  uint64_t v16 = sub_100031AF8();
  os_log_type_t v17 = sub_100031F18();
  if (os_log_type_enabled(v16, v17))
  {
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "finalizeWithCompletion", v18, 2u);
    swift_slowDealloc();
  }

  char v21 = *(void (**)(void, void))(v5 + 8);
  uint64_t v20 = v5 + 8;
  uint64_t v19 = v21;
  v21(v15, v4);
  id v22 = [*(id *)(a1 + 16) currentLook];
  sub_100005D64(v22, v78);

  sub_10001D0A8((uint64_t)v78, (uint64_t)&v79, &qword_1000443B8);
  if ((void)v80 == 1)
  {
    sub_100031AB8();
    swift_retain();
    char v23 = sub_100031AF8();
    os_log_type_t v24 = sub_100031F08();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v75 = v4;
      uint64_t v25 = swift_slowAlloc();
      float v74 = v19;
      float v26 = (uint8_t *)v25;
      float v27 = (void *)swift_slowAlloc();
      uint64_t v71 = v20;
      *(_DWORD *)float v26 = 138412290;
      id v28 = [*(id *)(a1 + 16) currentLook];
      *(void *)&long long v82 = v28;
      uint64_t v4 = v75;
      sub_100031FD8();
      *float v27 = v28;
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Could not create configuration from current look: %@", v26, 0xCu);
      sub_1000048F0(&qword_100045128);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v19 = v74;
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    v19(v13, v4);
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }
  else
  {
    float v74 = v19;
    uint64_t v75 = v4;
    uint64_t v72 = a2;
    long long v82 = v79;
    long long v83 = v80;
    long long v84 = v81;
    sub_10001D0A8((uint64_t)&v83 + 8, (uint64_t)&v85, &qword_100045100);
    long long v29 = v84;
    uint64_t v30 = sub_10001D0A8((uint64_t)&v83, (uint64_t)&v86, (uint64_t *)&unk_100045580);
    *(unsigned char *)(a1 + 113) = 1;
    float v31 = *(uint8_t **)(a1 + 104);
    if (v31)
    {
      __chkstk_darwin(v30);
      *(&v67 - 2) = v31;
      sub_1000063B4(&v85);
      sub_10000633C(v29);
      float v32 = v31;
      sub_1000048F0((uint64_t *)&unk_100045580);
      sub_100031F58();
      sub_1000063E0(&v86);

      id v33 = v77;
    }
    else
    {
      sub_1000063B4(&v85);
      sub_10000633C(v29);
      sub_1000063E0(&v86);
      id v33 = 0;
    }
    uint64_t v34 = v82;
    char v35 = BYTE8(v82);
    id v36 = v33;
    id v37 = sub_100008C94(v34, v35, v33);
    id v70 = v36;

    sub_1000063E0(&v85);
    sub_10000640C(v29);
    id v38 = objc_msgSend(objc_msgSend(*(id *)(a1 + 16), "environment"), "targetConfiguration");
    swift_unknownObjectRelease();
    sub_100023E88((uint64_t)v37);
    swift_bridgeObjectRelease();
    Class isa = sub_100031BB8().super.isa;
    swift_bridgeObjectRelease();
    id v77 = 0;
    LODWORD(v34) = [v38 storeUserInfo:isa error:&v77];

    id v40 = v77;
    if (!v34) {
      goto LABEL_16;
    }
    float v41 = *(void **)(a1 + 16);
    id v42 = v77;
    id v43 = objc_msgSend(objc_msgSend(v41, "environment"), "targetConfiguration");
    swift_unknownObjectRelease();
    id v77 = 0;
    id v44 = [v43 loadUserInfoWithError:&v77];

    id v40 = v77;
    if (v44)
    {
      sub_100031BC8();
      id v45 = v40;

      float v46 = v73;
      sub_100031AB8();
      swift_bridgeObjectRetain();
      float v47 = sub_100031AF8();
      os_log_type_t v48 = sub_100031F18();
      BOOL v49 = os_log_type_enabled(v47, v48);
      uint64_t v50 = v75;
      if (v49)
      {
        float v51 = (uint8_t *)swift_slowAlloc();
        id v68 = (void *)swift_slowAlloc();
        id v77 = v68;
        uint64_t v71 = v20;
        *(_DWORD *)float v51 = 136315138;
        id v67 = v51 + 4;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_100031BD8();
        uint64_t v69 = *((void *)&v29 + 1);
        unint64_t v54 = v53;
        swift_bridgeObjectRelease();
        uint64_t v76 = sub_10001B510(v52, v54, (uint64_t *)&v77);
        sub_100031FD8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Stored configuration with userInfo: %s", v51, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v74(v73, v75);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v74(v46, v50);
      }

      sub_1000063E0(&v85);
      uint64_t v55 = v29;
    }
    else
    {
LABEL_16:
      float v73 = (char *)v29;
      id v56 = v40;
      sub_100031538();

      swift_willThrow();
      sub_100031AB8();
      swift_errorRetain();
      swift_errorRetain();
      float v57 = sub_100031AF8();
      os_log_type_t v58 = sub_100031F08();
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = swift_slowAlloc();
        uint64_t v71 = v20;
        float32x2_t v60 = (uint8_t *)v59;
        double v61 = (void *)swift_slowAlloc();
        uint64_t v69 = *((void *)&v29 + 1);
        id v77 = v61;
        *(_DWORD *)float32x2_t v60 = 136315138;
        swift_getErrorValue();
        uint64_t v62 = sub_1000321C8();
        uint64_t v76 = sub_10001B510(v62, v63, (uint64_t *)&v77);
        sub_100031FD8();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v57, v58, "Failed to store user info in editor.environment.targetConfiguration. %s", v60, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      v74(v8, v75);

      sub_1000063E0(&v85);
      uint64_t v55 = (uint64_t)v73;
    }
    sub_10000640C(v55);
    (*(void (**)(uint64_t))(v72 + 16))(v72);
  }
  float v64 = *(void **)(a1 + 96);
  if (v64)
  {
    id v65 = v64;
    if ([v65 mode] != (id)1) {
      [v65 applyMode:1];
    }
    id v66 = [v65 vistaView];
    [v66 purgeUnused];
  }
}

void sub_10002BB6C(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 152);
  *(void *)(v1 + 152) = a1;
  id v3 = a1;

  uint64_t v4 = *(void **)(v1 + 96);
  if (v4)
  {
    id v7 = v4;
    if (![v7 vista])
    {
      if (*(void *)(v1 + 152)) {
        BOOL v5 = (*(unsigned char *)(v1 + 144) & 1) == 0;
      }
      else {
        BOOL v5 = 1;
      }
      double v6 = 1.0;
      if (v5) {
        double v6 = 0.0;
      }
      [v7 setLocationDotAlpha:v6];
    }
  }
}

uint64_t sub_10002BC14()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002BC54(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10001CFB4;
  return sub_10002995C(a1, v4, v5, v7, v6);
}

uint64_t sub_10002BD18()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002BD58(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001CFB4;
  return sub_1000291F0(a1, v4, v5, v6);
}

uint64_t sub_10002BE0C()
{
  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002BE5C@<X0>(uint64_t a1@<X8>)
{
  return sub_100006E4C(0, a1);
}

uint64_t sub_10002BE84()
{
  return swift_release();
}

unint64_t sub_10002BE8C()
{
  unint64_t result = qword_100045AA8;
  if (!qword_100045AA8)
  {
    type metadata accessor for AegirEditingCoordinator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045AA8);
  }
  return result;
}

void sub_10002BEE0()
{
}

uint64_t sub_10002BEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002BEF8()
{
  return swift_release();
}

uint64_t sub_10002BF00()
{
  return sub_10002A230();
}

id sub_10002BF08@<X0>(void *a1@<X8>)
{
  return sub_10001D314(a1);
}

char *DeviceUtilities.forceDisableForeground.unsafeMutableAddressor()
{
  if (qword_100044308 != -1) {
    swift_once();
  }
  return &static DeviceUtilities.forceDisableForeground;
}

void *sub_10002BF74()
{
  unint64_t result = MTLCreateSystemDefaultDevice();
  if (result)
  {
    unsigned __int8 v1 = [result supportsFamily:1006];
    unint64_t result = (void *)swift_unknownObjectRelease();
  }
  else
  {
    unsigned __int8 v1 = 0;
  }
  static DeviceUtilities.supportsGPUFamilyApple6 = v1;
  return result;
}

char *DeviceUtilities.supportsGPUFamilyApple6.unsafeMutableAddressor()
{
  if (qword_100044300 != -1) {
    swift_once();
  }
  return &static DeviceUtilities.supportsGPUFamilyApple6;
}

uint64_t static DeviceUtilities.supportsGPUFamilyApple6.getter()
{
  return sub_10002C128(&qword_100044300, (unsigned __int8 *)&static DeviceUtilities.supportsGPUFamilyApple6);
}

void sub_10002C038()
{
  NSString v0 = sub_100031C28();
  unsigned __int8 v1 = (void *)MGGetStringAnswer();

  if (v1)
  {
    if (sub_100031C58() == 0x3031303874 && v2 == 0xE500000000000000)
    {

      swift_bridgeObjectRelease();
      char v4 = 1;
    }
    else
    {
      char v4 = sub_1000321A8();

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v4 = 0;
  }
  static DeviceUtilities.forceDisableForeground = v4 & 1;
}

uint64_t static DeviceUtilities.forceDisableForeground.getter()
{
  return sub_10002C128(&qword_100044308, (unsigned __int8 *)&static DeviceUtilities.forceDisableForeground);
}

uint64_t sub_10002C128(void *a1, unsigned __int8 *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *a2;
}

uint64_t DeviceUtilities.deinit()
{
  return v0;
}

uint64_t DeviceUtilities.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for DeviceUtilities()
{
  return self;
}

Swift::Void __swiftcall aegirProxyAppDataUsageAttribution()()
{
  nw_parameters_create();
  nw_parameters_set_source_application_by_bundle_id();

  swift_unknownObjectRelease();
}

uint64_t sub_10002C1E4@<X0>(uint64_t *a1@<X8>)
{
  sub_100031B98();
  swift_allocObject();
  sub_100031BA8();
  sub_100031B68();
  swift_allocObject();
  swift_retain();
  sub_100031B78();
  sub_1000048F0(&qword_100045B68);
  sub_100031688();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1000338F0;
  sub_10002C674(&qword_100045B70, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100031678();
  sub_10002C674(&qword_100045B78, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100031678();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_10002C40C()
{
  return sub_10002C43C((uint64_t (*)(void))type metadata accessor for AegirRenderingController);
}

id sub_10002C424()
{
  return sub_10002C43C((uint64_t (*)(void))type metadata accessor for AegirEditingController);
}

id sub_10002C43C(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));

  return [v1 init];
}

uint64_t sub_10002C47C()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10002C5D8()
{
  unint64_t result = qword_100045B48;
  if (!qword_100045B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045B48);
  }
  return result;
}

ValueMetadata *type metadata accessor for AegirPosterExtension()
{
  return &type metadata for AegirPosterExtension;
}

uint64_t sub_10002C63C()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_10002C674(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002C6BC()
{
  return sub_10002C6F0((unint64_t *)&unk_100045B80);
}

uint64_t sub_10002C6F0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000236E0(&qword_100045B58);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002C738(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10002C77C()
{
  id v1 = v0;
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for AegirAppViewController();
  objc_msgSendSuper2(&v20, "viewDidLoad");
  id v2 = [self defaultCenter];
  [v2 addObserver:v1 selector:"onDeviceOrientationDidChange" name:UIDeviceOrientationDidChangeNotification object:0];

  id v3 = [self currentDevice];
  [v3 beginGeneratingDeviceOrientationNotifications];

  if (qword_1000441D0 != -1) {
    swift_once();
  }
  char v4 = (void *)static PreferencePane.aegirPreferencePane;
  uint64_t v5 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_renderingConfig;
  uint64_t v6 = *(void **)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_renderingConfig];
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_renderingConfig] = static PreferencePane.aegirPreferencePane;
  id v7 = v4;

  if (qword_1000441D8 != -1) {
    swift_once();
  }
  uint64_t v8 = self;
  id v9 = [v8 standardUserDefaults];
  sub_1000316D8();
  sub_100031728();
  uint64_t v10 = (void *)sub_100031698();
  id v11 = [v8 standardUserDefaults];
  sub_1000316D8();

  uint64_t v12 = (void *)sub_1000316A8();
  id v13 = [v8 standardUserDefaults];
  sub_1000316D8();

  uint64_t v14 = *(void **)&v1[v5];
  if (v14)
  {
    uint64_t v15 = v1;
    id v16 = v14;
    sub_100031718();

    sub_10002CF70();
    os_log_type_t v17 = *(void **)&v15[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController];
    if (v17)
    {
      id v18 = v17;
      id v19 = [v18 vistaView];
      [v19 setObserver:v15];

      [v18 prepareForTransitions];
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_10002CA7C()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  id v2 = [self currentDevice];
  [v2 endGeneratingDeviceOrientationNotifications];

  sub_10002D354();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for AegirAppViewController();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_10002CC8C()
{
  uint64_t v1 = sub_100031B38();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  objc_super v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100031B58();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000203F4(0, (unint64_t *)&unk_100045C90);
  id v9 = (void *)sub_100031F48();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_10002FCC8;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002C738;
  aBlock[3] = &unk_10003E108;
  id v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  sub_100031B48();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10002FCF0();
  sub_1000048F0(&qword_100045670);
  sub_10002FD48();
  sub_100032018();
  sub_100031F68();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10002CF70()
{
  uint64_t v1 = v0;
  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v3 = v2;
  [v2 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  sub_10002ECEC(v5, v7, v9, v11);
  id v12 = *(void **)&v0[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController];
  if (!v12) {
    return;
  }
  id v36 = v12;
  id v13 = [v36 vistaView];
  id v14 = [v0 view];
  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v15 = v14;
  [v14 addSubview:v13];

  if (qword_1000441D8 != -1) {
    swift_once();
  }
  if (sub_1000316C8())
  {
    uint64_t v16 = 2;
  }
  else
  {
    sub_10002D42C();
    uint64_t v16 = 0;
  }
  [v36 applyMode:v16];
  sub_1000203F4(0, &qword_100045C88);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v1;
  id v18 = v1;
  id v19 = (void *)sub_100031FB8();
  id v20 = objc_msgSend(v18, "view", 0, 0, 0, sub_10002FCA4, v17);
  if (!v20) {
    goto LABEL_19;
  }
  char v21 = v20;
  [v20 bounds];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v38.origin.x = v23;
  v38.origin.y = v25;
  v38.size.width = v27;
  v38.size.height = v29;
  id v30 = objc_msgSend(objc_allocWithZone((Class)UIButton), "initWithFrame:primaryAction:", v19, 20.0, CGRectGetMaxY(v38) + -70.0, 50.0, 50.0);
  NSString v31 = sub_100031C28();
  id v32 = [self imageNamed:v31];

  [v30 setImage:v32 forState:0];
  id v33 = [v18 view];
  if (!v33)
  {
LABEL_20:
    __break(1u);
    return;
  }
  uint64_t v34 = v33;
  [v33 addSubview:v30];

  char v35 = *(void **)&v18[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_settingsButton];
  *(void *)&v18[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_settingsButton] = v30;

  if (sub_1000316C8()) {
    [v36 pulseLocationDot];
  }
}

void sub_10002D354()
{
  uint64_t v1 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_settingsButton;
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_settingsButton);
  if (v2)
  {
    [v2 removeFromSuperview];
    uint64_t v3 = *(void **)(v0 + v1);
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + v1) = 0;

  uint64_t v4 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_scrollView;
  double v5 = *(void **)(v0 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_scrollView);
  if (v5)
  {
    id v6 = v5;
    [v6 removeFromSuperview];
    double v7 = *(void **)(v0 + v4);
    *(void *)(v0 + v4) = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController;
  double v9 = *(void **)(v0 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController);
  if (v9)
  {
    id v10 = [v9 vistaView];
    [v10 removeFromSuperview];

    double v9 = *(void **)(v0 + v8);
  }
  *(void *)(v0 + v8) = 0;
}

void sub_10002D42C()
{
  if (qword_1000441E0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(qword_100046C80 + 16);
  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v3 = v2;
  [v2 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_msgSend(objc_allocWithZone((Class)UIScrollView), "initWithFrame:", v5, v7, v9, v11);
  id v13 = [v0 view];
  if (!v13)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v14 = v13;
  [v13 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v45.origin.x = v16;
  v45.origin.y = v18;
  v45.size.width = v20;
  v45.size.height = v22;
  double Width = CGRectGetWidth(v45);
  id v24 = [v0 view];
  if (!v24)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  CGFloat v25 = v24;
  [v24 bounds];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v46.origin.x = v27;
  v46.origin.y = v29;
  v46.size.width = v31;
  v46.size.height = v33;
  objc_msgSend(v12, "setContentSize:", Width * (double)v1, CGRectGetHeight(v46));
  uint64_t v34 = self;
  id v35 = v12;
  id v36 = [v34 clearColor];
  [v35 setBackgroundColor:v36];

  [v35 setPagingEnabled:0];
  [v35 setDelegate:v0];
  [v35 setDecelerationRate:UIScrollViewDecelerationRateNormal];
  if (qword_1000441D8 != -1) {
    swift_once();
  }
  id v37 = (void *)static PreferencePane.aegirGeneralPreferencePane;
  if ([(id)static PreferencePane.aegirGeneralPreferencePane vista] == (id)1)
  {
    [v35 bounds];
    double v38 = CGRectGetWidth(v47);
  }
  else
  {
    if ([v37 vista] != (id)2) {
      goto LABEL_13;
    }
    [v35 bounds];
    CGFloat v39 = CGRectGetWidth(v48);
    double v38 = v39 + v39;
  }
  objc_msgSend(v35, "setContentOffset:animated:", 0, v38, 0.0);
LABEL_13:
  id v40 = [v0 view];
  if (!v40)
  {
LABEL_20:
    __break(1u);
    return;
  }
  float v41 = v40;
  [v40 addSubview:v35];

  id v42 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v0 action:"didTapView:"];
  [v35 addGestureRecognizer:v42];
  id v43 = *(id *)&v0[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_scrollView];
  *(void *)&v0[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_scrollView] = v35;
}

void sub_10002D7C4(void *a1)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController);
  if (!v2) {
    return;
  }
  id v31 = v2;
  [a1 contentOffset];
  long double v5 = v4;
  [a1 bounds];
  long double v7 = v6;
  if (qword_1000441E0 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_100046C80;
  unint64_t v9 = *(void *)(qword_100046C80 + 16);
  double v10 = fmod(v5, v7) / v7;
  if (v10 > 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = 0.0;
  }
  double v12 = floor(v5 / v7);
  if ((~*(void *)&v12 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (v12 <= -9.22337204e18)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v12 >= 9.22337204e18)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v13 = v9 - 1;
  uint64_t v14 = (uint64_t)v12;
  if ((uint64_t)(v9 - 1) < (uint64_t)v12) {
    uint64_t v14 = v9 - 1;
  }
  unint64_t v15 = v14 & ~(v14 >> 63);
  if ((uint64_t)v13 >= (uint64_t)(v15 + 1)) {
    unint64_t v13 = v15 + 1;
  }
  if (v15 >= v9) {
    goto LABEL_23;
  }
  if (v13 >= v9)
  {
LABEL_24:
    __break(1u);
    return;
  }
  uint64_t v16 = v8 + 32 + 48 * v15;
  uint64_t v17 = *(void *)(v16 + 32);
  CGFloat v18 = *(void **)(v16 + 16);
  char v28 = *(unsigned char *)(v16 + 8);
  uint64_t v19 = *(void *)v16;
  uint64_t v20 = v8 + 32 + 48 * v13;
  uint64_t v21 = *(void *)v20;
  char v22 = *(unsigned char *)(v20 + 8);
  CGFloat v23 = *(void **)(v20 + 16);
  id v24 = *(void **)(v20 + 24);
  uint64_t v25 = *(void *)(v20 + 32);
  id v30 = *(id *)(v16 + 24);
  id v29 = v18;
  sub_10000633C(v17);
  id v26 = v24;
  id v27 = v23;
  sub_10000633C(v25);
  sub_10002F828(v19, v28, v21, v22, v11);

  sub_10000640C(v25);
  sub_10000640C(v17);
}

void sub_10002DA94(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100031B18();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long double v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AA8();
  uint64_t v8 = a1;
  unint64_t v9 = sub_100031AF8();
  os_log_type_t v10 = sub_100031F18();
  if (os_log_type_enabled(v9, v10))
  {
    double v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)double v11 = 134217984;
    [v8 contentOffset];
    v16[1] = v12;
    sub_100031FD8();

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "scrollViewDidEndDecelerating. %f", v11, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    unint64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_10002DDD0();
  unint64_t v13 = *(void **)(v2 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController);
  if (v13)
  {
    id v14 = v13;
    id v15 = [v14 vistaView];
    [v15 purgeUnused];
  }
}

uint64_t sub_10002DDD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Geotime();
  __chkstk_darwin(v2);
  uint64_t v4 = &v42[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1000315F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  unint64_t v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  os_log_type_t v10 = *(void **)(v0 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_scrollView);
  if (v10)
  {
    id v11 = v10;
    [v11 contentOffset];
    if (v12 > 0.0) {
      double v13 = v12;
    }
    else {
      double v13 = 0.0;
    }
    [v11 bounds];
    double v15 = v14;
    if (qword_1000441D8 != -1) {
      swift_once();
    }
    if (sub_1000316C8()) {
      uint64_t result = sub_1000315A8();
    }
    else {
      uint64_t result = sub_1000315D8();
    }
    if (qword_1000441E0 != -1) {
      uint64_t result = swift_once();
    }
    double v16 = floor(v13 / v15);
    if ((~*(void *)&v16 & 0x7FF0000000000000) != 0)
    {
      if (v16 > -9.22337204e18)
      {
        if (v16 < 9.22337204e18)
        {
          unint64_t v17 = *(void *)(qword_100046C80 + 16);
          uint64_t v18 = v17 - 1;
          if ((uint64_t)(v17 - 1) >= (uint64_t)v16) {
            uint64_t v18 = (uint64_t)v16;
          }
          unint64_t v19 = v18 & ~(v18 >> 63);
          if (v19 < v17)
          {
            id v46 = v11;
            uint64_t v20 = qword_100046C80 + 48 * v19;
            uint64_t v21 = *(void *)(v20 + 32);
            int v43 = *(unsigned __int8 *)(v20 + 40);
            char v22 = *(void **)(v20 + 48);
            CGFloat v23 = *(void **)(v20 + 56);
            uint64_t v24 = *(void *)(v20 + 64);
            uint64_t v25 = *(void (**)(unsigned char *))(v6 + 16);
            CGRect v45 = v9;
            v25(v4);
            uint64_t v44 = v5;
            id v26 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation);
            *(void *)&v4[*(int *)(v2 + 20)] = v26;
            id v27 = v23;
            id v28 = v26;
            id v29 = v22;
            sub_10000633C(v24);
            sub_10000BAFC(v21, v43, (uint64_t)v4, 1);
            int v31 = v30;
            uint64_t v33 = v32;
            uint64_t v35 = v34;
            int v37 = v36;
            sub_100009910((uint64_t)v4);
            double v38 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController);
            if (v38)
            {
              id v39 = v38;
              [v39 setVista:v21];
              LODWORD(v47) = v31;
              uint64_t v48 = v33;
              uint64_t v49 = v35;
              LODWORD(v50) = v37;
              [v39 setStyleDefinition:&v47];
              uint64_t v40 = sub_10001D6EC();
              uint64_t v50 = &type metadata for String;
              uint64_t v47 = v40;
              uint64_t v48 = v41;
              sub_1000316E8();
              sub_10001E3A0((uint64_t)&v47);
              [v39 cleanUpAfterTransitions];

              sub_10000640C(v24);
              return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v45, v44);
            }
            else
            {
              (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v45, v44);

              return sub_10000640C(v24);
            }
          }
LABEL_25:
          __break(1u);
          return result;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  return result;
}

void sub_10002E218(void *a1)
{
  uint64_t v58 = type metadata accessor for Geotime();
  __chkstk_darwin(v58);
  uint64_t v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000315F8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100031B18();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  double v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  double v15 = (char *)&v52 - v14;
  double v16 = *(void **)(v1 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController);
  if (v16)
  {
    unint64_t v54 = v4;
    uint64_t v55 = v1;
    uint64_t v59 = v8;
    uint64_t v56 = v6;
    uint64_t v57 = v5;
    id v17 = v16;
    [v17 setVistaTransitionStyle:0];
    id v18 = [v17 vistaView];
    [a1 locationInView:v18];
    double v20 = v19;
    double v22 = v21;

    sub_100031AA8();
    CGFloat v23 = sub_100031AF8();
    os_log_type_t v24 = sub_100031F18();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 134218240;
      *(double *)float32x2_t v60 = v20;
      sub_100031FD8();
      *(_WORD *)(v25 + 12) = 2048;
      *(double *)float32x2_t v60 = v22;
      sub_100031FD8();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "tap occured at. %f %f", (uint8_t *)v25, 0x16u);
      swift_slowDealloc();
    }

    id v26 = *(void (**)(char *, uint64_t))(v10 + 8);
    v26(v15, v9);
    if ([v17 vista] != (id)2) {
      goto LABEL_12;
    }
    sub_100031AA8();
    id v27 = sub_100031AF8();
    os_log_type_t v28 = sub_100031F18();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Tapping on the Orrery", v29, 2u);
      swift_slowDealloc();
    }

    v26(v13, v9);
    id v30 = [v17 vistaView];
    id v31 = objc_msgSend(v30, "spheroidAtPoint:", v20, v22);

    if (v31)
    {
      [v31 type];
      uint64_t v53 = NUNIAstronomyVistaView_SpheroidTypeToVista();
      if (qword_1000441D8 != -1) {
        swift_once();
      }
      if (sub_1000316C8()) {
        sub_1000315A8();
      }
      else {
        sub_1000315D8();
      }
      if (qword_1000441E0 != -1) {
        swift_once();
      }
      if (*(void *)(qword_100046C80 + 16))
      {
        char v32 = *(unsigned char *)(qword_100046C80 + 40);
        uint64_t v33 = *(void **)(qword_100046C80 + 48);
        uint64_t v34 = *(void **)(qword_100046C80 + 56);
        uint64_t v35 = *(void *)(qword_100046C80 + 64);
        uint64_t v36 = v56;
        uint64_t v37 = (uint64_t)v54;
        (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v54, v59, v57);
        double v38 = *(void **)(v55 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation);
        *(void *)(v37 + *(int *)(v58 + 20)) = v38;
        id v39 = v34;
        id v40 = v33;
        sub_10000633C(v35);
        id v41 = v38;
        uint64_t v42 = v53;
        sub_10000BAFC(v53, v32, v37, 1);
        int v44 = v43;
        uint64_t v46 = v45;
        uint64_t v48 = v47;
        int v50 = v49;
        sub_100009910(v37);
        LODWORD(v60[0]) = v44;
        v60[1] = v46;
        v60[2] = v48;
        int v61 = v50;
        LODWORD(v51) = 1.5;
        [v17 animateToVista:v42 styleDefinition:v60 duration:v51];

        sub_10000640C(v35);
        (*(void (**)(char *, uint64_t))(v36 + 8))(v59, v57);
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
LABEL_12:
    }
  }
}

id sub_10002E860()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031748();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = (id)__chkstk_darwin(v4);
  uint64_t v9 = (char *)v31 - v8;
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_renderingConfig];
  if (v10)
  {
    id v11 = v10;
    sub_100031738();
    uint64_t v12 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_preferenceViewController;
    double v13 = *(void **)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_preferenceViewController];
    if (v13) {
      goto LABEL_3;
    }
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v9, v2);
    id v16 = objc_allocWithZone((Class)sub_1000048F0((uint64_t *)&unk_100045C78));
    uint64_t v17 = sub_100031B28();
    id v18 = *(void **)&v1[v12];
    *(void *)&v1[v12] = v17;

    double v19 = *(void **)&v1[v12];
    if (!v19) {
      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }
    id result = [v19 view];
    if (result)
    {
      double v20 = result;
      id v21 = [self whiteColor];
      [v20 setBackgroundColor:v21];

      double v13 = *(void **)&v1[v12];
      if (!v13) {
        return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
      }
LABEL_3:
      uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController];
      id v15 = v13;
      if (v14) {
        [v14 applyMode:2];
      }
      [v13 setModalInPresentation:1];
      id v22 = [self currentDevice];
      id v23 = [v22 userInterfaceIdiom];

      if (v23 == (id)1)
      {
        [v13 setModalPresentationStyle:7];
        id v24 = [v13 popoverPresentationController];
        if (v24)
        {
          uint64_t v25 = v24;
          [v24 setSourceView:*(void *)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_settingsButton]];
LABEL_14:
        }
      }
      else
      {
        [v13 setModalPresentationStyle:1];
        id v26 = [v13 sheetPresentationController];
        if (v26)
        {
          uint64_t v25 = v26;
          sub_1000048F0(&qword_100044380);
          uint64_t v27 = swift_allocObject();
          *(_OWORD *)(v27 + 16) = xmmword_1000335A0;
          sub_1000203F4(0, &qword_100045C70);
          *(void *)(swift_allocObject() + 16) = v1;
          os_log_type_t v28 = v1;
          uint64_t v29 = sub_100031F98();
          swift_release();
          *(void *)(v27 + 32) = v29;
          v31[1] = v27;
          sub_100031D78();
          Class isa = sub_100031D48().super.isa;
          swift_bridgeObjectRelease();
          [v25 setDetents:isa];

          [v25 setPrefersGrabberVisible:1];
          [v25 setPrefersScrollingExpandsWhenScrolledToEdge:0];
          [v25 setLargestUndimmedDetentIdentifier:UISheetPresentationControllerDetentIdentifierMedium];
          goto LABEL_14;
        }
      }
      [v1 presentViewController:v13 animated:1 completion:0];

      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10002EC80(int a1, id a2)
{
  uint64_t result = (uint64_t)[a2 view];
  if (*(double *)&result == 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = (void *)result;
    [(id)result bounds];
    double v5 = v4;

    *(double *)&uint64_t result = v5 / 3.0;
  }
  return result;
}

void sub_10002ECEC(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for Geotime();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000441D8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1000316B8();
  if (!v14) {
    goto LABEL_10;
  }
  if (v13 == 0x65706F696C6C6143 && v14 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    id v17 = sub_100009F40();
    goto LABEL_20;
  }
  char v16 = sub_1000321A8();
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
LABEL_10:
    uint64_t v18 = sub_1000316B8();
    if (v19)
    {
      if (v18 == 0x7269676541 && v19 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v21 = sub_1000321A8();
        swift_bridgeObjectRelease();
        if ((v21 & 1) == 0) {
          goto LABEL_16;
        }
      }
      id v17 = sub_10000A15C();
      goto LABEL_20;
    }
LABEL_16:
    id v17 = sub_10000A178();
    goto LABEL_20;
  }
  id v17 = sub_100009F40();
LABEL_20:
  id v22 = v17;
  id v23 = objc_msgSend(objc_allocWithZone((Class)NUNIAstronomyVistaView), "initWithFrame:configuration:", v17, a1, a2, a3, a4);
  id v24 = objc_allocWithZone((Class)NUNIScene);
  uint64_t v47 = sub_10002F14C;
  uint64_t v48 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v44 = 1107296256;
  uint64_t v45 = sub_100007B08;
  uint64_t v46 = &unk_10003E068;
  uint64_t v25 = _Block_copy(&aBlock);
  id v26 = [v24 initWithSphereoids:16515070 currentDateBlock:v25];
  _Block_release(v25);
  swift_release();
  [v26 setSnap:3];
  [v26 setBackgroundType:2];
  [v23 setScene:v26];
  id v27 = [objc_allocWithZone((Class)NUNIAstronomyVistaController) initWithVistaView:v23];
  os_log_type_t v28 = *(void **)(v5 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController);
  *(void *)(v5 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController) = v27;
  id v29 = v27;

  [v29 setActiveModeFrameInterval:0];
  id v30 = (void *)static PreferencePane.aegirGeneralPreferencePane;
  objc_msgSend(v29, "setVista:", objc_msgSend((id)static PreferencePane.aegirGeneralPreferencePane, "vista"));
  id v31 = [v30 vista];
  LOBYTE(v30) = PreferencePane.crop.getter() & 1;
  sub_1000315E8();
  uint64_t v32 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation;
  uint64_t v33 = *(void **)(v5 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation);
  *(void *)&v12[*(int *)(v10 + 20)] = v33;
  id v34 = v33;
  sub_10000BAFC((uint64_t)v31, (char)v30, (uint64_t)v12, 1);
  int v36 = v35;
  uint64_t v38 = v37;
  id v40 = v39;
  int v42 = v41;
  sub_100009910((uint64_t)v12);
  LODWORD(aBlock) = v36;
  uint64_t v44 = v38;
  uint64_t v45 = v40;
  LODWORD(v46) = v42;
  [v29 applyStyleDefinition:&aBlock];
  [v29 setVistaTransitionStyle:1];
  [v29 updateLocation:*(void *)(v5 + v32) fallbackLocation:0];
  [v29 applyMode:2];
}

uint64_t sub_10002F14C()
{
  if (qword_1000441D8 != -1) {
    swift_once();
  }
  if (sub_1000316C8())
  {
    return sub_1000315A8();
  }
  else
  {
    return sub_1000315D8();
  }
}

void sub_10002F200()
{
  sub_1000203F4(0, (unint64_t *)&qword_100045C60);
  if (qword_1000441D8 != -1) {
    swift_once();
  }
  if (sub_100031FA8())
  {
    uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_preferenceViewController);
    if (v1)
    {
      id v2 = [v1 view];
      if (v2)
      {
        uint64_t v3 = v2;
        id v4 = [v2 superview];

        if (v4)
        {

          sub_10002D354();
          sub_10002CF70();
        }
      }
      else
      {
        __break(1u);
      }
    }
  }
}

id sub_10002F4D8(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController] = 0;
  v3[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_isActive] = 0;
  v3[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_animateSun] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_settingsButton] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_scrollView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_rotationModel] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_renderingConfig] = 0;
  *(void *)&v3[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_preferenceViewController] = 0;
  uint64_t v6 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation;
  id v7 = objc_allocWithZone((Class)CLLocation);
  uint64_t v8 = v3;
  *(void *)&v3[v6] = [v7 initWithLatitude:37.33182 longitude:-122.03118];

  if (a2)
  {
    NSString v9 = sub_100031C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for AegirAppViewController();
  id v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

id sub_10002F67C(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController] = 0;
  v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_isActive] = 0;
  v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_animateSun] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_settingsButton] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_scrollView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_rotationModel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_renderingConfig] = 0;
  *(void *)&v1[OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_preferenceViewController] = 0;
  uint64_t v3 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation;
  id v4 = objc_allocWithZone((Class)CLLocation);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 initWithLatitude:37.33182 longitude:-122.03118];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for AegirAppViewController();
  id v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

uint64_t type metadata accessor for AegirAppViewController()
{
  return self;
}

uint64_t sub_10002F7D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002F7E0()
{
  return swift_release();
}

uint64_t sub_10002F7E8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F820(int a1)
{
  return sub_10002EC80(a1, *(id *)(v1 + 16));
}

uint64_t sub_10002F828(uint64_t a1, char a2, uint64_t a3, char a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = type metadata accessor for Geotime();
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000315F8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t result = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v20 = *(void **)(v6 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController);
  if (v20)
  {
    uint64_t v54 = a3;
    char v21 = a2 & 1;
    LODWORD(v58) = a4 & 1;
    uint64_t v22 = qword_1000441D8;
    id v53 = v20;
    if (v22 != -1) {
      swift_once();
    }
    uint64_t v23 = a1;
    if (sub_1000316C8()) {
      sub_1000315A8();
    }
    else {
      sub_1000315D8();
    }
    uint64_t v55 = v16;
    id v24 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v24(v14, v19, v15);
    uint64_t v25 = OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation;
    id v26 = *(void **)(v6 + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation);
    *(void *)&v14[*(int *)(v12 + 20)] = v26;
    id v27 = v26;
    sub_10000BAFC(v23, v21, (uint64_t)v14, 1);
    unsigned int v29 = v28;
    uint64_t v31 = v30;
    float32x2_t v33 = v32;
    int v35 = v34;
    sub_100009910((uint64_t)v14);
    v24(v14, v19, v15);
    int v36 = *(void **)(v6 + v25);
    *(void *)&v14[*(int *)(v12 + 20)] = v36;
    id v37 = v36;
    uint64_t v38 = v54;
    sub_10000BAFC(v54, v58, (uint64_t)v14, 1);
    uint64_t v56 = v39;
    long long v57 = v40;
    long long v58 = v41;
    int v43 = v42;
    sub_100009910((uint64_t)v14);
    id v44 = v53;
    id v45 = [v53 vista];
    if (v23 == v38)
    {
      if (v45 != (id)v23) {
        [v44 setVista:v23];
      }
      unsigned int v63 = v29;
      uint64_t v64 = v31;
      float32x2_t v65 = v33;
      int v66 = v35;
      int v59 = v56;
      uint64_t v60 = v57;
      uint64_t v61 = v58;
      int v62 = v43;
      [v44 applyTransitionFraction:&v63 fromStyleDefinition:&v59 toStyleDefinition:a5];
      uint64_t v46 = v55;
    }
    else
    {
      if (v45 != (id)v23) {
        [v44 setVista:v23];
      }
      [v44 styleDefinition];
      v47.i64[1] = v64;
      v47.i64[0] = __PAIR64__(v65.u32[1], v63);
      uint64_t v49 = v57;
      uint64_t v48 = v58;
      v50.i64[1] = v57;
      int v51 = v56;
      v50.i64[0] = __PAIR64__(DWORD1(v58), v56);
      uint64_t v46 = v55;
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(v47, v50)), 0xFuLL))) & 1) == 0
        || (vceq_f32(v65, *(float32x2_t *)&v58).u32[0] & 1) == 0)
      {
        unsigned int v63 = v56;
        uint64_t v64 = v57;
        float32x2_t v65 = (float32x2_t)v58;
        int v66 = v43;
        [v44 setStyleDefinition:&v63];
        int v51 = v56;
        uint64_t v49 = v57;
        uint64_t v48 = v58;
      }
      unsigned int v63 = v29;
      uint64_t v64 = v31;
      float32x2_t v65 = v33;
      int v66 = v35;
      int v59 = v51;
      uint64_t v60 = v49;
      uint64_t v61 = v48;
      int v62 = v43;
      [v44 applyTransitionFraction:v23 fromVista:&v63 fromStyleDefinition:v38 toVista:&v59 toStyleDefinition:a5];
    }

    return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v19, v15);
  }
  return result;
}

id sub_10002FCA4()
{
  return sub_10002E860();
}

void sub_10002FCC8()
{
}

unint64_t sub_10002FCF0()
{
  unint64_t result = qword_100045668;
  if (!qword_100045668)
  {
    sub_100031B38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045668);
  }
  return result;
}

unint64_t sub_10002FD48()
{
  unint64_t result = qword_100045678;
  if (!qword_100045678)
  {
    sub_1000236E0(&qword_100045670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045678);
  }
  return result;
}

id sub_10002FDA4(void *a1, uint64_t a2, double a3)
{
  [a1 contentOffset];
  if (v6 <= 0.0) {
    double v6 = 0.0;
  }
  float v7 = v6;
  id result = [a1 bounds];
  float v10 = v9;
  float v11 = floorf(v7 / v10);
  if ((~LODWORD(v11) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 <= -9.2234e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v11 >= 9.2234e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v12 = (uint64_t)v11;
  if (__OFADD__((uint64_t)v11, 1))
  {
LABEL_13:
    __break(1u);
    return result;
  }
  if (a3 > 0.0) {
    uint64_t v12 = (uint64_t)v11 + 1;
  }
  double v13 = (float)(v10 * (float)v12);
  id result = [a1 contentOffset];
  *(double *)a2 = v13;
  *(void *)(a2 + 8) = v14;
  return result;
}

id sub_10002FE94()
{
  uint64_t v1 = sub_100031B18();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC11AegirPoster24AegirRenderingController_coordinator] = 0;
  uint64_t v5 = &v0[OBJC_IVAR____TtC11AegirPoster24AegirRenderingController_overrideDate];
  uint64_t v6 = sub_1000315F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  float v7 = (objc_class *)type metadata accessor for AegirRenderingController();
  v13.receiver = v0;
  v13.super_class = v7;
  id v8 = objc_msgSendSuper2(&v13, "init");
  sub_100031AD8();
  double v9 = sub_100031AF8();
  os_log_type_t v10 = sub_100031F18();
  if (os_log_type_enabled(v9, v10))
  {
    float v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)float v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "AegirRenderingController created", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  nw_parameters_create();
  nw_parameters_set_source_application_by_bundle_id();

  swift_unknownObjectRelease();
  return v8;
}

id sub_10003009C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AegirRenderingController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10003011C()
{
  return type metadata accessor for AegirRenderingController();
}

uint64_t type metadata accessor for AegirRenderingController()
{
  uint64_t result = qword_100045CD8;
  if (!qword_100045CD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100030170()
{
  sub_10003020C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10003020C()
{
  if (!qword_100045CE8)
  {
    sub_1000315F8();
    unint64_t v0 = sub_100031FC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100045CE8);
    }
  }
}

void sub_100030264(void *a1, void *a2)
{
  uint64_t v4 = sub_1000048F0(&qword_100045D50);
  __chkstk_darwin(v4 - 8);
  uint64_t v82 = (uint64_t)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100031B18();
  uint64_t v80 = *(void *)(v6 - 8);
  uint64_t v81 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  double v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v76 = (uint64_t)&v68 - v10;
  if (sub_100031E88())
  {
    sub_100031998();
    sub_100031958();
  }
  id v83 = [a2 deviceOrientation];
  id v11 = a1;
  id v12 = objc_msgSend(objc_msgSend(v11, "environment"), "contents");
  swift_unknownObjectRelease();
  swift_getObjectType();
  uint64_t v13 = sub_10001DCC4();
  uint64_t v15 = v14;
  id v17 = v16;
  swift_unknownObjectRelease();
  id v72 = v11;

  if (v17 == (void *)1) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v13;
  }
  if (v17 == (void *)1) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v17;
  }
  uint64_t v20 = v76;
  sub_100031AD8();
  sub_10001D6BC(v13, v15, v17);
  sub_10001D6BC(v13, v15, v17);
  char v21 = sub_100031AF8();
  os_log_type_t v22 = sub_100031F18();
  BOOL v23 = os_log_type_enabled(v21, v22);
  double v78 = v17;
  uint64_t v79 = v15;
  uint64_t v77 = v13;
  uint64_t v71 = v9;
  uint64_t v74 = v18;
  int v73 = (v17 != (void *)1) & v15;
  if (v23)
  {
    id v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v69 = v19;
    aBlock[0] = v25;
    *(_DWORD *)id v24 = 136315138;
    id v70 = (void (*)(char *, uint64_t))(v24 + 4);
    sub_10001D6BC(v13, v15, v17);
    uint64_t v26 = sub_100008E40(v18, (v17 != (void *)1) & v15, v69);
    unint64_t v28 = v27;
    sub_10001D6CC(v13, v15, v17);
    uint64_t v84 = sub_10001B510(v26, v28, aBlock);
    sub_100031FD8();
    swift_bridgeObjectRelease();
    sub_10001D6CC(v13, v15, v17);
    sub_10001D6CC(v13, v15, v17);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "didInitialize — configuration: %s", v24, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v69;
    swift_slowDealloc();
    swift_slowDealloc();

    unsigned int v29 = *(void (**)(char *, uint64_t))(v80 + 8);
    uint64_t v30 = v76;
  }
  else
  {
    sub_10001D6CC(v13, v15, v17);
    sub_10001D6CC(v13, v15, v17);

    unsigned int v29 = *(void (**)(char *, uint64_t))(v80 + 8);
    uint64_t v30 = v20;
  }
  id v70 = v29;
  v29((char *)v30, v81);
  id v31 = v72;
  uint64_t v76 = sub_10000BF54(v31, (uint64_t)v83);

  id v32 = [v31 backgroundView];
  [v32 bounds];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  uint64_t v41 = sub_100031568();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v82, 1, 1, v41);
  if (v19)
  {
    int v42 = v19;
    int v43 = (void **)v19;
  }
  else
  {
    int v43 = (void **)[objc_allocWithZone((Class)CLLocation) initWithLatitude:37.33182 longitude:-122.03118];
    int v42 = 0;
  }
  id v44 = v42;
  char v45 = sub_100031EC8();
  uint64_t v46 = swift_allocObject();
  uint64_t v47 = v74;
  *(void *)(v46 + 16) = v74;
  char v48 = v73;
  *(unsigned char *)(v46 + 24) = v73;
  *(_DWORD *)(v46 + 25) = v84;
  *(_DWORD *)(v46 + 28) = *(_DWORD *)((char *)&v84 + 3);
  *(void *)(v46 + 32) = v19;
  *(void *)(v46 + 40) = 0;
  *(void *)(v46 + 48) = 0;
  *(void *)(v46 + 56) = 0;
  *(void *)(v46 + 64) = v31;
  id v49 = v31;
  uint64_t v50 = v77;
  int v51 = v78;
  uint64_t v52 = v79;
  sub_10001D6BC(v77, v79, v78);
  int v53 = v45 & 1;
  uint64_t v54 = v82;
  id v55 = sub_10000900C(v82, v47, v48, v43, v76, v53, (uint64_t)sub_1000313F8, v46, v34, v36, v38, v40);

  swift_release();
  sub_1000098B4(v54, &qword_100045D50);
  id v56 = [v49 backgroundView];
  id v57 = [v49 floatingView];
  sub_10000641C(v56, v57);

  type metadata accessor for AegirRenderingCoordinator();
  swift_allocObject();
  id v58 = v49;
  id v59 = v55;
  uint64_t v60 = sub_10001C360(v59, (uint64_t)v83, v58);

  uint64_t v61 = OBJC_IVAR____TtC11AegirPoster24AegirRenderingController_coordinator;
  uint64_t v62 = v75;
  *(void *)(v75 + OBJC_IVAR____TtC11AegirPoster24AegirRenderingController_coordinator) = v60;
  swift_release();
  if (*(void *)(v62 + v61))
  {
    swift_retain();
    sub_10000E358(v58);
    aBlock[4] = (uint64_t)sub_100030ADC;
    aBlock[5] = 0;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100030B40;
    aBlock[3] = (uint64_t)&unk_10003E158;
    unsigned int v63 = _Block_copy(aBlock);
    swift_release();
    [v58 updatePreferences:v63];
    _Block_release(v63);
    if (swift_isEscapingClosureAtFileLocation())
    {
      __break(1u);
    }
    else
    {
      uint64_t v64 = v71;
      sub_100031AD8();
      float32x2_t v65 = sub_100031AF8();
      os_log_type_t v66 = sub_100031F18();
      if (os_log_type_enabled(v65, v66))
      {
        id v67 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v67 = 0;
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "Finished setting up renderer", v67, 2u);
        swift_slowDealloc();

        swift_release();
        sub_10001D6CC(v77, v79, v78);
      }
      else
      {
        sub_10001D6CC(v77, v79, v78);

        swift_release();
      }
      v70(v64, v81);
    }
  }
  else
  {

    sub_10001D6CC(v50, v52, v51);
  }
}

id sub_100030ADC(void *a1)
{
  [a1 setHandlesWakeAnimation:1];
  [a1 setUserTapEventsRequested:1];

  return [a1 setHideDimmingLayer:1];
}

uint64_t sub_100030B40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, id))(a1 + 32);
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, v6);

  return swift_unknownObjectRelease();
}

uint64_t sub_100030D38()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100031B18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AD8();
  id v6 = sub_100031AF8();
  os_log_type_t v7 = sub_100031F18();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "didInvalidate", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster24AegirRenderingController_coordinator) = 0;
  swift_release();
  uint64_t result = sub_100031E88();
  if (result)
  {
    sub_100031998();
    return sub_100031948();
  }
  return result;
}

uint64_t sub_100030F14(void *a1)
{
  uint64_t v3 = sub_100031B18();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AD8();
  os_log_type_t v7 = a1;
  uint64_t v8 = sub_100031AF8();
  os_log_type_t v9 = sub_100031F18();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 67109376;
    LOBYTE(v27) = sub_100031EC8() & 1;
    int v27 = v27;
    sub_100031FD8();
    *(_WORD *)(v10 + 8) = 1024;
    LOBYTE(v26) = sub_100031E88() & 1;
    int v26 = v26;
    sub_100031FD8();

    _os_log_impl((void *)&_mh_execute_header, v8, v9, "didUpdate — isPreview: %{BOOL}d; isSnapshot: %{BOOL}d",
      (uint8_t *)v10,
      0xEu);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v8 = v7;
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC11AegirPoster24AegirRenderingController_coordinator);
  if (v12)
  {
    swift_retain();
    swift_retain();
    char v13 = sub_1000319E8();
    swift_release();
    if (v13)
    {
      *(unsigned char *)(v12 + OBJC_IVAR____TtC11AegirPoster25AegirRenderingCoordinator_isRotationChange) = 1;
      uint64_t v14 = *(void **)(v12 + 24);
      id v15 = [v14 vistaView];
      id v16 = [v14 vistaView];
      [v16 frame];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      objc_msgSend(v15, "updatePortalLayerBounds:", v18, v20, v22, v24);
    }
    sub_10000E358(v7);
    return swift_release();
  }
  return result;
}

uint64_t sub_1000311D8(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100031B18();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  os_log_type_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100031AD8();
  uint64_t v10 = sub_100031AF8();
  os_log_type_t v11 = sub_100031F18();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218240;
    double v15 = a1;
    sub_100031FD8();
    *(_WORD *)(v12 + 12) = 2048;
    double v15 = a2;
    sub_100031FD8();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "didReceiveTapAt: %f, %f", (uint8_t *)v12, 0x16u);
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (*(void *)(v3 + OBJC_IVAR____TtC11AegirPoster24AegirRenderingController_coordinator))
  {
    swift_retain();
    sub_1000169E4(a1, a2);
    return swift_release();
  }
  return result;
}

uint64_t sub_1000313A0()
{
  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000313F8@<X0>(uint64_t a1@<X8>)
{
  char v2 = sub_100031EC8();
  return sub_100006E4C(v2 & 1, a1);
}

uint64_t sub_10003143C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003144C()
{
  return swift_release();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100031478()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100031488()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100031498()
{
  return DateComponents.day.setter();
}

uint64_t sub_1000314A8()
{
  return DateComponents.date.getter();
}

uint64_t sub_1000314B8()
{
  return DateComponents.hour.setter();
}

uint64_t sub_1000314C8()
{
  return DateComponents.year.setter();
}

uint64_t sub_1000314D8()
{
  return DateComponents.month.setter();
}

uint64_t sub_1000314E8()
{
  return DateComponents.minute.setter();
}

uint64_t sub_1000314F8()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_100031508()
{
  return DateComponents.timeZone.setter();
}

uint64_t sub_100031518()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100031528(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100031538()
{
  return _convertNSErrorToError(_:)();
}

void sub_100031548(NSURL *retstr@<X8>)
{
}

uint64_t sub_100031558()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100031568()
{
  return type metadata accessor for URL();
}

uint64_t sub_100031578()
{
  return static Date.distantPast.getter();
}

uint64_t sub_100031588()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_100031598()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000315A8()
{
  return static Date.idealizedDate.getter();
}

uint64_t sub_1000315B8()
{
  return static Date.== infix(_:_:)();
}

uint64_t sub_1000315C8()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000315D8()
{
  return static Date.now.getter();
}

uint64_t sub_1000315E8()
{
  return Date.init()();
}

uint64_t sub_1000315F8()
{
  return type metadata accessor for Date();
}

uint64_t sub_100031608()
{
  return static Calendar.current.getter();
}

uint64_t sub_100031618()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100031628()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_100031638()
{
  return type metadata accessor for Calendar();
}

NSTimeZone sub_100031648()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_100031658()
{
  return static TimeZone.current.getter();
}

uint64_t sub_100031668()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100031678()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100031688()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100031698()
{
  return static PreferencePane.aegirRenderingPreferencePane.getter();
}

uint64_t sub_1000316A8()
{
  return static PreferencePane.calliopeRenderingPreferencePane.getter();
}

uint64_t sub_1000316B8()
{
  return dispatch thunk of PreferencePane.stringValue(forKey:)();
}

uint64_t sub_1000316C8()
{
  return dispatch thunk of PreferencePane.BOOLeanValue(forKey:)();
}

uint64_t sub_1000316D8()
{
  return dispatch thunk of PreferencePane.userDefaults.setter();
}

uint64_t sub_1000316E8()
{
  return dispatch thunk of PreferencePane.set(_:forKey:)();
}

uint64_t sub_1000316F8()
{
  return PreferencePane.init(name:userDefaults:sliders:toggles:pickerOptions:pickerSelections:)();
}

uint64_t sub_100031708()
{
  return PreferencePane.__allocating_init(name:panes:)();
}

uint64_t sub_100031718()
{
  return dispatch thunk of PreferencePane.delegate.setter();
}

uint64_t sub_100031728()
{
  return type metadata accessor for PreferencePane();
}

uint64_t sub_100031738()
{
  return PreferencePaneView.init(pane:)();
}

uint64_t sub_100031748()
{
  return type metadata accessor for PreferencePaneView();
}

uint64_t sub_100031758()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100031768()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100031778()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

void sub_100031788()
{
}

void sub_100031798(NSRunLoop to, NSRunLoopMode forMode)
{
}

uint64_t sub_1000317A8()
{
  return DisplayLink.delegate.setter();
}

uint64_t sub_1000317B8()
{
  return DisplayLink.isPaused.setter();
}

uint64_t sub_1000317C8()
{
  return DisplayLink.init()();
}

uint64_t sub_1000317D8()
{
  return type metadata accessor for DisplayLink();
}

uint64_t sub_1000317E8()
{
  return UnlockState.isUnlocked.getter();
}

uint64_t sub_1000317F8()
{
  return UnlockState.isTransitioning.getter();
}

uint64_t sub_100031808()
{
  return static UnlockState.== infix(_:_:)();
}

uint64_t sub_100031818()
{
  return static UnlockState.locked.getter();
}

uint64_t sub_100031828()
{
  return UnlockState.isLocked.getter();
}

uint64_t sub_100031838()
{
  return UnlockState.progress.getter();
}

uint64_t sub_100031848()
{
  return type metadata accessor for UnlockState();
}

uint64_t sub_100031858()
{
  return type metadata accessor for SnapshotType();
}

uint64_t sub_100031868()
{
  return type metadata accessor for TimingFunction();
}

uint64_t sub_100031878()
{
  return dispatch thunk of SnapshotManager.saveSnapshot(image:type:filenameProvider:)();
}

uint64_t sub_100031888()
{
  return dispatch thunk of SnapshotManager.cachedSnapshot(for:filenameProvider:)();
}

uint64_t sub_100031898()
{
  return dispatch thunk of SnapshotManager.removeLocalSnapshots()();
}

uint64_t sub_1000318A8()
{
  return SnapshotManager.init()();
}

uint64_t sub_1000318B8()
{
  return type metadata accessor for SnapshotManager();
}

uint64_t sub_1000318C8()
{
  return StateTransition.current.getter();
}

uint64_t sub_1000318D8()
{
  return StateTransition.init(previous:current:)();
}

uint64_t sub_1000318E8()
{
  return StateTransition.previous.getter();
}

uint64_t sub_1000318F8()
{
  return StateTransition<A>.transitionDirection.getter();
}

uint64_t sub_100031908()
{
  return static TransitionDirection.== infix(_:_:)();
}

uint64_t sub_100031918()
{
  return type metadata accessor for TransitionDirection();
}

void sub_100031928(Swift::String a1)
{
}

BOOL sub_100031938(Swift::String a1)
{
  return RendererTokenManager.hasExtension(for:)(a1);
}

uint64_t sub_100031948()
{
  return static RendererTokenManager.popSupression()();
}

uint64_t sub_100031958()
{
  return static RendererTokenManager.pushSupression()();
}

uint64_t sub_100031968()
{
  return RendererTokenManager.requestExtension(from:for:)();
}

void sub_100031978()
{
}

uint64_t sub_100031988()
{
  return RendererTokenManager.init()();
}

uint64_t sub_100031998()
{
  return type metadata accessor for RendererTokenManager();
}

uint64_t sub_1000319A8()
{
  return dispatch thunk of PosterRotationAnimator.isRotating.getter();
}

uint64_t sub_1000319B8()
{
  return dispatch thunk of PosterRotationAnimator.orientation.getter();
}

uint64_t sub_1000319C8()
{
  return dispatch thunk of PosterRotationAnimator.orientation.setter();
}

uint64_t sub_1000319D8()
{
  return dispatch thunk of PosterRotationAnimator.startIfNeeded(editor:transition:)();
}

uint64_t sub_1000319E8()
{
  return dispatch thunk of PosterRotationAnimator.startIfNeeded(renderer:transition:)();
}

uint64_t sub_1000319F8()
{
  return dispatch thunk of PosterRotationAnimator.rotationDuration.getter();
}

uint64_t sub_100031A08()
{
  return dispatch thunk of PosterRotationAnimator.delegate.setter();
}

uint64_t sub_100031A18()
{
  return PosterRotationAnimator.init()();
}

uint64_t sub_100031A28()
{
  return type metadata accessor for PosterRotationAnimator();
}

uint64_t sub_100031A38()
{
  return WakeState.isTransitioning.getter();
}

uint64_t sub_100031A48()
{
  return WakeState.backlightProgress.getter();
}

uint64_t sub_100031A58()
{
  return static WakeState.== infix(_:_:)();
}

uint64_t sub_100031A68()
{
  return WakeState.isOn.getter();
}

uint64_t sub_100031A78()
{
  return WakeState.isOff.getter();
}

uint64_t sub_100031A88()
{
  return WakeState.isNotOff.getter();
}

uint64_t sub_100031A98()
{
  return type metadata accessor for WakeState();
}

uint64_t sub_100031AA8()
{
  return static Logger.data.getter();
}

uint64_t sub_100031AB8()
{
  return static Logger.editing.getter();
}

uint64_t sub_100031AC8()
{
  return static Logger.snapshot.getter();
}

uint64_t sub_100031AD8()
{
  return static Logger.rendering.getter();
}

uint64_t sub_100031AE8()
{
  return static Logger.subsystem.getter();
}

uint64_t sub_100031AF8()
{
  return Logger.logObject.getter();
}

uint64_t sub_100031B08()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100031B18()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100031B28()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_100031B38()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100031B48()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100031B58()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100031B68()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100031B78()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100031B88()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100031B98()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100031BA8()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100031BB8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100031BC8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100031BD8()
{
  return Dictionary.description.getter();
}

uint64_t sub_100031BE8()
{
  return FloatingPoint.smoothstep.getter();
}

uint64_t sub_100031BF8()
{
  return FloatingPoint.reverse.getter();
}

uint64_t sub_100031C08()
{
  return FloatingPoint.toRadians.getter();
}

uint64_t sub_100031C18()
{
  return FloatingPoint<>.retimed(_:)();
}

NSString sub_100031C28()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100031C38()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100031C48()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100031C58()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100031C68()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100031C78()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100031C88()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100031C98()
{
  return String.hash(into:)();
}

void sub_100031CA8(Swift::String a1)
{
}

Swift::Int sub_100031CB8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100031CC8()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100031CD8()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100031CF8()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100031D08()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_100031D18()
{
  return String.init<A>(_:)();
}

uint64_t sub_100031D28()
{
  return String.subscript.getter();
}

uint64_t sub_100031D38()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100031D48()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100031D58()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100031D68()
{
  return Array.description.getter();
}

uint64_t sub_100031D78()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100031D88()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100031D98()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100031DA8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100031DB8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100031DC8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100031DD8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100031DE8()
{
  return type metadata accessor for TaskPriority();
}

void sub_100031DF8()
{
}

uint64_t sub_100031E08()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_100031E28()
{
  return Double.description.getter();
}

double sub_100031E38(Swift::Int to)
{
  return Double.truncate(to:)(to);
}

uint64_t sub_100031E48()
{
  return Double.write<A>(to:)();
}

float sub_100031E58(Swift::Int to)
{
  return Float.truncate(to:)(to);
}

uint64_t sub_100031E68()
{
  return Float.write<A>(to:)();
}

NSNumber sub_100031E78()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100031E88()
{
  return PRRenderer.isSnapshot.getter();
}

uint64_t sub_100031E98()
{
  return PRRenderer.unlockState.getter();
}

uint64_t sub_100031EA8()
{
  return PRRenderer.snapshotType.getter();
}

uint64_t sub_100031EB8()
{
  return PRRenderer.snapshotBounds.getter();
}

uint64_t sub_100031EC8()
{
  return PRRenderer.isPreview.getter();
}

uint64_t sub_100031ED8()
{
  return PRRenderer.wakeState.getter();
}

uint64_t sub_100031EE8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100031EF8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100031F08()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100031F18()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100031F28()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100031F38()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100031F48()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100031F58()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_100031F68()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100031F78()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100031F88()
{
  return UIInterfaceOrientation.description.getter();
}

uint64_t sub_100031F98()
{
  return static UISheetPresentationControllerDetent.custom(identifier:resolver:)();
}

uint64_t sub_100031FA8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100031FB8()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_100031FC8()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100031FD8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100031FE8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100031FF8()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_100032008()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100032018()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_100032028(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100032038()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100032048()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100032058()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

void sub_100032068(Swift::Int a1)
{
}

uint64_t sub_100032078()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100032088()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100032098()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000320A8()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000320B8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000320C8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000320D8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000320E8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000320F8()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100032108()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100032118()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100032128()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100032138()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100032148()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100032158()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100032178(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100032188()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100032198()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000321A8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000321B8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000321C8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000321D8()
{
  return Hasher.init(_seed:)();
}

void sub_1000321E8(Swift::UInt32 a1)
{
}

Swift::Int sub_1000321F8()
{
  return Hasher._finalize()();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.double longitude = v3;
  result.double latitude = v2;
  return result;
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t NUNIAstronomyAddLocationCoordinates()
{
  return _NUNIAstronomyAddLocationCoordinates();
}

uint64_t NUNIAstronomyVistaView_SpheroidTypeToVista()
{
  return _NUNIAstronomyVistaView_SpheroidTypeToVista();
}

uint64_t NUNIMoonPhaseFor()
{
  return _NUNIMoonPhaseFor();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

float acosf(float a1)
{
  return _acosf(a1);
}

void bzero(void *a1, size_t a2)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
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

nw_parameters_t nw_parameters_create(void)
{
  return _nw_parameters_create();
}

uint64_t nw_parameters_set_source_application_by_bundle_id()
{
  return _nw_parameters_set_source_application_by_bundle_id();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
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