void *pickKeyAlgorithm(__SecKey *a1, uint64_t a2, void *a3)
{
  CFDictionaryRef v5;
  const void *Value;
  void **v7;
  void *v8;
  void *v9;
  void v11[2];
  void v12[3];

  v12[2] = *MEMORY[0x263EF8340];
  v5 = SecKeyCopyAttributes(a1);
  Value = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x263F16FA8]);
  if (CFEqual(Value, (CFTypeRef)*MEMORY[0x263F16FB0]))
  {
    switch(a2)
    {
      case 5:
        v7 = (void **)MEMORY[0x263F172B8];
        break;
      case 4:
        v7 = (void **)MEMORY[0x263F172B0];
        break;
      case 2:
        v7 = (void **)MEMORY[0x263F172A8];
        break;
      default:
LABEL_11:
        if (a3)
        {
          v11[0] = @"KeyType";
          v11[1] = @"DigestAlgorithm";
          v12[0] = Value;
          v8 = [NSNumber numberWithUnsignedInt:a2];
          v12[1] = v8;
          v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

          *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"Security" code:-4 userInfo:v9];

          a3 = 0;
        }
        if (v5) {
          goto LABEL_20;
        }
        return a3;
    }
  }
  else
  {
    if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x263F16FE0])) {
      goto LABEL_11;
    }
    switch(a2)
    {
      case 5:
        v7 = (void **)MEMORY[0x263F17380];
        break;
      case 4:
        v7 = (void **)MEMORY[0x263F17378];
        break;
      case 2:
        v7 = (void **)MEMORY[0x263F17370];
        break;
      default:
        goto LABEL_11;
    }
  }
  a3 = *v7;
  if (v5) {
LABEL_20:
  }
    CFRelease(v5);
  return a3;
}

void sub_24D157FBC(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t mapDigestAlgorithm(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263F55680]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F55688]])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F55690]])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_24D15830C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, CFTypeRef a12)
{
  if (cf) {
    CFRelease(cf);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (a12) {
    CFRelease(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_24D158834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

void sub_24D158C2C(_Unwind_Exception *a1)
{
  CFRelease(v2);
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t PackageStaticValidator.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url;
  uint64_t v4 = sub_24D169160();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_24D158D08@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D158D60(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D158DCC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D158E18(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D158E6C())()
{
  return j__swift_endAccess;
}

uint64_t PackageStaticValidator.__allocating_init(url:requireTrust:)(uint64_t a1, int a2)
{
  int v21 = a2;
  uint64_t v19 = sub_24D169100();
  uint64_t v3 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24D169160();
  uint64_t v6 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms) = &unk_26FF74A28;
  swift_retain();
  if (sub_24D163C64())
  {
    uint64_t v10 = v24;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v9 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url, a1, v24);
    uint64_t v22 = 0x727574616E676973;
    unint64_t v23 = 0xE900000000000065;
    uint64_t v11 = v19;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06E50], v19);
    sub_24D159624();
    sub_24D169140();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v11);
    swift_bridgeObjectRelease();
    uint64_t v12 = v20;
    uint64_t v13 = sub_24D169170();
    if (v12)
    {
      MEMORY[0x25331F6C0](v12);
      uint64_t v13 = 0;
      unint64_t v14 = 0xF000000000000000;
    }
    uint64_t v9 = PackageValidator.init(signatureData:requireTrust:)(v13, v14, v21 & 1);
    v16 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v16(a1, v10);
    v16((uint64_t)v8, v10);
  }
  else
  {
    swift_release();
    sub_24D1595D0();
    swift_allocError();
    *(void *)(v15 + 8) = 0;
    *(void *)(v15 + 16) = 0;
    *(void *)uint64_t v15 = 0;
    *(unsigned char *)(v15 + 24) = 5;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v24);
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
  }
  return v9;
}

uint64_t PackageStaticValidator.init(url:requireTrust:)(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  int v20 = a2;
  uint64_t v5 = sub_24D169100();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24D169160();
  uint64_t v9 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms) = &unk_26FF74A28;
  swift_retain();
  if (sub_24D163C64())
  {
    uint64_t v12 = v23;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v3 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url, a1, v23);
    uint64_t v21 = 0x727574616E676973;
    unint64_t v22 = 0xE900000000000065;
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F06E50], v5);
    sub_24D159624();
    sub_24D169140();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    uint64_t v13 = v19;
    uint64_t v14 = sub_24D169170();
    if (v13)
    {
      MEMORY[0x25331F6C0](v13);
      uint64_t v14 = 0;
      unint64_t v15 = 0xF000000000000000;
    }
    uint64_t v3 = PackageValidator.init(signatureData:requireTrust:)(v14, v15, v20 & 1);
    v17 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v17(a1, v12);
    v17((uint64_t)v11, v12);
  }
  else
  {
    swift_release();
    sub_24D1595D0();
    swift_allocError();
    *(void *)(v16 + 8) = 0;
    *(void *)(v16 + 16) = 0;
    *(void *)uint64_t v16 = 0;
    *(unsigned char *)(v16 + 24) = 5;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v23);
    swift_bridgeObjectRelease();
    type metadata accessor for PackageStaticValidator();
    swift_deallocPartialClassInstance();
  }
  return v3;
}

unint64_t sub_24D1595D0()
{
  unint64_t result = qword_269858DA0;
  if (!qword_269858DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858DA0);
  }
  return result;
}

unint64_t sub_24D159624()
{
  unint64_t result = qword_269858DA8;
  if (!qword_269858DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858DA8);
  }
  return result;
}

uint64_t type metadata accessor for PackageStaticValidator()
{
  uint64_t result = qword_269858DB8;
  if (!qword_269858DB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PackageStaticValidator.__allocating_init(url:)(char *a1)
{
  uint64_t v2 = sub_24D169100();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v26 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24D169160();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v32 = a1;
  v11((char *)&v24 - v9, (uint64_t)a1, v4);
  type metadata accessor for PackageStaticValidator();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms) = &unk_26FF74A50;
  swift_retain();
  if (sub_24D163C64())
  {
    uint64_t v25 = v4;
    v11((char *)(v12 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url), (uint64_t)v10, v4);
    uint64_t v30 = 0x727574616E676973;
    unint64_t v31 = 0xE900000000000065;
    uint64_t v14 = v26;
    uint64_t v13 = v27;
    uint64_t v15 = v28;
    (*(void (**)(char *, void, uint64_t))(v27 + 104))(v26, *MEMORY[0x263F06E50], v28);
    sub_24D159624();
    sub_24D169140();
    swift_release();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v14, v15);
    swift_bridgeObjectRelease();
    uint64_t v16 = v29;
    uint64_t v17 = sub_24D169170();
    if (v16)
    {
      MEMORY[0x25331F6C0](v16);
      uint64_t v17 = 0;
      unint64_t v18 = 0xF000000000000000;
    }
    uint64_t v12 = PackageValidator.init(signatureData:requireTrust:)(v17, v18, 1);
    uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v22 = v25;
    v21(v10, v25);
    v21(v8, v22);
    v21(v32, v22);
  }
  else
  {
    swift_release();
    sub_24D1595D0();
    swift_allocError();
    *(void *)(v19 + 8) = 0;
    *(void *)(v19 + 16) = 0;
    *(void *)uint64_t v19 = 0;
    *(unsigned char *)(v19 + 24) = 5;
    swift_willThrow();
    int v20 = *(void (**)(char *, uint64_t))(v5 + 8);
    v20(v10, v4);
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    v20(v32, v4);
  }
  return v12;
}

uint64_t sub_24D159AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_24D169100();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24D169160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v2;
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F06E50], v5);
  sub_24D159624();
  sub_24D169140();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v13 = objc_msgSend(self, sel_defaultManager);
  sub_24D169130();
  uint64_t v14 = (void *)sub_24D169260();
  swift_bridgeObjectRelease();
  unsigned __int8 v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  if (v15)
  {
    uint64_t v16 = v27;
    uint64_t v17 = sub_24D169170();
    if (!v16)
    {
      uint64_t v19 = v17;
      unint64_t v20 = v18;
      sub_24D167774(a1, a2, v17, v18);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return sub_24D15A778(v19, v20);
    }
  }
  else
  {
    sub_24D1595D0();
    swift_allocError();
    *(void *)uint64_t v22 = a1;
    *(void *)(v22 + 8) = a2;
    *(void *)(v22 + 16) = 0;
    *(unsigned char *)(v22 + 24) = 2;
    swift_bridgeObjectRetain();
    swift_willThrow();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_24D159D9C(char a1)
{
  v69 = (uint64_t *)(v1 + 16);
  swift_beginAccess();
  swift_retain();
  int v4 = sub_24D16422C();
  uint64_t result = swift_release();
  if (v2) {
    return result;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858DB0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D169CB0;
  *(_DWORD *)(inited + 32) = v4;
  uint64_t v7 = sub_24D15B1C0(inited);
  swift_setDeallocating();
  type metadata accessor for FileMeasurer();
  swift_initStackObject();
  uint64_t v8 = FileMeasurer.init(_:)(v7);
  uint64_t v9 = sub_24D166364(v1 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url, v8);
  char v59 = a1;
  uint64_t v10 = *v69;
  swift_beginAccess();
  uint64_t v11 = *(void *)(v10 + 24);
  uint64_t v62 = v11 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v11 + 64);
  uint64_t v65 = v11;
  swift_bridgeObjectRetain();
  uint64_t v64 = v9 + 24;
  uint64_t result = swift_beginAccess();
  int64_t v15 = 0;
  int64_t v63 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v60 = MEMORY[0x263F8EE78];
  uint64_t v61 = MEMORY[0x263F8EE78];
  while (v14)
  {
    unint64_t v16 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    unint64_t v17 = v16 | (v15 << 6);
LABEL_18:
    uint64_t v21 = (uint64_t *)(*(void *)(v65 + 48) + 16 * v17);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = *(void *)(*(void *)(v65 + 56) + 8 * v17);
    uint64_t v25 = *(void *)v64;
    uint64_t v26 = *(void *)(*(void *)v64 + 16);
    swift_bridgeObjectRetain();
    if (v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v27 = sub_24D15AD30(v22, v23);
      if ((v28 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      uint64_t v29 = *(void *)(*(void *)(v25 + 56) + 8 * v27);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v68[3] = v29;
      v68[0] = v24;
      uint64_t v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_24D169CB0;
      *(_DWORD *)(v30 + 32) = v4;
      char v31 = FileMeasurement.isSameFile(_:withSupportedAlgorithms:)(v68, v30);
      swift_setDeallocating();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_24D15ADA8(0, *(void *)(v60 + 16) + 1, 1, (char *)v60);
          uint64_t v60 = result;
        }
        unint64_t v33 = *(void *)(v60 + 16);
        unint64_t v36 = *(void *)(v60 + 24);
        unint64_t v34 = v33 + 1;
        if (v33 >= v36 >> 1)
        {
          uint64_t result = (uint64_t)sub_24D15ADA8((char *)(v36 > 1), v33 + 1, 1, (char *)v60);
          uint64_t v60 = result;
        }
        uint64_t v35 = v60;
        goto LABEL_37;
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
LABEL_27:
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_24D15ADA8(0, *(void *)(v61 + 16) + 1, 1, (char *)v61);
        uint64_t v61 = result;
      }
      unint64_t v33 = *(void *)(v61 + 16);
      unint64_t v32 = *(void *)(v61 + 24);
      unint64_t v34 = v33 + 1;
      if (v33 >= v32 >> 1)
      {
        uint64_t result = (uint64_t)sub_24D15ADA8((char *)(v32 > 1), v33 + 1, 1, (char *)v61);
        uint64_t v61 = result;
      }
      uint64_t v35 = v61;
LABEL_37:
      *(void *)(v35 + 16) = v34;
      unint64_t v37 = v35 + 16 * v33;
      *(void *)(v37 + 32) = v22;
      *(void *)(v37 + 40) = v23;
    }
  }
  BOOL v18 = __OFADD__(v15++, 1);
  if (v18)
  {
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (v15 >= v63) {
    goto LABEL_38;
  }
  unint64_t v19 = *(void *)(v62 + 8 * v15);
  if (v19)
  {
LABEL_17:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v15 << 6);
    goto LABEL_18;
  }
  int64_t v20 = v15 + 1;
  if (v15 + 1 >= v63) {
    goto LABEL_38;
  }
  unint64_t v19 = *(void *)(v62 + 8 * v20);
  if (v19) {
    goto LABEL_16;
  }
  int64_t v20 = v15 + 2;
  if (v15 + 2 >= v63) {
    goto LABEL_38;
  }
  unint64_t v19 = *(void *)(v62 + 8 * v20);
  if (v19)
  {
LABEL_16:
    int64_t v15 = v20;
    goto LABEL_17;
  }
  int64_t v20 = v15 + 3;
  if (v15 + 3 < v63)
  {
    unint64_t v19 = *(void *)(v62 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        int64_t v15 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          break;
        }
        if (v15 >= v63) {
          goto LABEL_38;
        }
        unint64_t v19 = *(void *)(v62 + 8 * v15);
        ++v20;
        if (v19) {
          goto LABEL_17;
        }
      }
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    goto LABEL_16;
  }
LABEL_38:
  swift_release();
  swift_beginAccess();
  uint64_t v38 = *(void *)v64;
  uint64_t v67 = *(void *)v64 + 64;
  uint64_t v39 = 1 << *(unsigned char *)(*(void *)v64 + 32);
  uint64_t v40 = -1;
  if (v39 < 64) {
    uint64_t v40 = ~(-1 << v39);
  }
  unint64_t v41 = v40 & *(void *)(*(void *)v64 + 64);
  int64_t v42 = (unint64_t)(v39 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v43 = 0;
  uint64_t v66 = MEMORY[0x263F8EE78];
  if (!v41) {
    goto LABEL_43;
  }
  while (2)
  {
    unint64_t v44 = __clz(__rbit64(v41));
    v41 &= v41 - 1;
    unint64_t v45 = v44 | (v43 << 6);
LABEL_54:
    v48 = (uint64_t *)(*(void *)(v38 + 48) + 16 * v45);
    uint64_t v50 = *v48;
    uint64_t v49 = v48[1];
    uint64_t v51 = *v69;
    swift_beginAccess();
    uint64_t v52 = *(void *)(*(void *)(v51 + 24) + 16);
    swift_bridgeObjectRetain();
    if (v52)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24D15AD30(v50, v49);
      char v54 = v53;
      swift_bridgeObjectRelease();
      if ((v54 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_57;
      }
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v41) {
        continue;
      }
    }
    else
    {
LABEL_57:
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_24D15ADA8(0, *(void *)(v66 + 16) + 1, 1, (char *)v66);
        uint64_t v66 = result;
      }
      unint64_t v56 = *(void *)(v66 + 16);
      unint64_t v55 = *(void *)(v66 + 24);
      if (v56 >= v55 >> 1)
      {
        uint64_t result = (uint64_t)sub_24D15ADA8((char *)(v55 > 1), v56 + 1, 1, (char *)v66);
        uint64_t v66 = result;
      }
      *(void *)(v66 + 16) = v56 + 1;
      unint64_t v57 = v66 + 16 * v56;
      *(void *)(v57 + 32) = v50;
      *(void *)(v57 + 40) = v49;
      if (v41) {
        continue;
      }
    }
    break;
  }
LABEL_43:
  BOOL v18 = __OFADD__(v43++, 1);
  if (v18) {
    goto LABEL_75;
  }
  if (v43 >= v42)
  {
LABEL_67:
    swift_release();
    if (*(void *)(v66 + 16) || !((*(void *)(v61 + 16) == 0) | v59 & 1) || *(void *)(v60 + 16))
    {
      sub_24D1595D0();
      swift_allocError();
      *(void *)uint64_t v58 = v66;
      *(void *)(v58 + 8) = v61;
      *(void *)(v58 + 16) = v60;
      *(unsigned char *)(v58 + 24) = 4;
      swift_bridgeObjectRetain();
      swift_willThrow();
      swift_release();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    return swift_release();
  }
  unint64_t v46 = *(void *)(v67 + 8 * v43);
  if (v46)
  {
LABEL_53:
    unint64_t v41 = (v46 - 1) & v46;
    unint64_t v45 = __clz(__rbit64(v46)) + (v43 << 6);
    goto LABEL_54;
  }
  int64_t v47 = v43 + 1;
  if (v43 + 1 >= v42) {
    goto LABEL_67;
  }
  unint64_t v46 = *(void *)(v67 + 8 * v47);
  if (v46) {
    goto LABEL_52;
  }
  int64_t v47 = v43 + 2;
  if (v43 + 2 >= v42) {
    goto LABEL_67;
  }
  unint64_t v46 = *(void *)(v67 + 8 * v47);
  if (v46) {
    goto LABEL_52;
  }
  int64_t v47 = v43 + 3;
  if (v43 + 3 >= v42) {
    goto LABEL_67;
  }
  unint64_t v46 = *(void *)(v67 + 8 * v47);
  if (v46)
  {
LABEL_52:
    int64_t v43 = v47;
    goto LABEL_53;
  }
  while (1)
  {
    int64_t v43 = v47 + 1;
    if (__OFADD__(v47, 1)) {
      break;
    }
    if (v43 >= v42) {
      goto LABEL_67;
    }
    unint64_t v46 = *(void *)(v67 + 8 * v43);
    ++v47;
    if (v46) {
      goto LABEL_53;
    }
  }
LABEL_77:
  __break(1u);
  return result;
}

void PackageStaticValidator.__allocating_init(signatureData:requireTrust:)()
{
}

void PackageStaticValidator.init(signatureData:requireTrust:)()
{
}

uint64_t sub_24D15A5A8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url;
  uint64_t v2 = sub_24D169160();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t PackageStaticValidator.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_24D15B304(*(void *)(v0 + 40), *(void *)(v0 + 48));
  uint64_t v1 = v0 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url;
  uint64_t v2 = sub_24D169160();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PackageStaticValidator.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_24D15B304(*(void *)(v0 + 40), *(void *)(v0 + 48));
  uint64_t v1 = v0 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url;
  uint64_t v2 = sub_24D169160();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24D15A778(uint64_t a1, unint64_t a2)
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

uint64_t sub_24D15A814()
{
  return sub_24D169540();
}

uint64_t sub_24D15A85C()
{
  return sub_24D169530();
}

uint64_t sub_24D15A888()
{
  return sub_24D169540();
}

_DWORD *sub_24D15A8CC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_24D15A8DC(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24D15A8E8(uint64_t a1, uint64_t a2)
{
  return sub_24D15AA54(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24D15A900(uint64_t a1, id *a2)
{
  uint64_t result = sub_24D169270();
  *a2 = 0;
  return result;
}

uint64_t sub_24D15A978(uint64_t a1, id *a2)
{
  char v3 = sub_24D169280();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24D15A9F8@<X0>(uint64_t *a1@<X8>)
{
  sub_24D169290();
  uint64_t v2 = sub_24D169260();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24D15AA3C(uint64_t a1, uint64_t a2)
{
  return sub_24D15AA54(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24D15AA54(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24D169290();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24D15AA98()
{
  sub_24D169290();
  sub_24D1692B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D15AAEC()
{
  sub_24D169290();
  sub_24D169510();
  sub_24D1692B0();
  uint64_t v0 = sub_24D169540();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_24D15AB60(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24D15AB74()
{
  uint64_t v0 = sub_24D169290();
  uint64_t v2 = v1;
  if (v0 == sub_24D169290() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24D1694A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24D15AC00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24D169260();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24D15AC48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24D169290();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24D15AC74(uint64_t a1)
{
  uint64_t v2 = sub_24D15B610(&qword_269858E18, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_24D15B610(&qword_269858E20, type metadata accessor for URLResourceKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_24D15AD30(uint64_t a1, uint64_t a2)
{
  sub_24D169510();
  sub_24D1692B0();
  uint64_t v4 = sub_24D169540();
  return sub_24D15AEAC(a1, a2, v4);
}

char *sub_24D15ADA8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269858DE0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_24D15AEAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24D1694A0() & 1) == 0)
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
      while (!v14 && (sub_24D1694A0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24D15AF90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269858DE8);
    uint64_t v3 = sub_24D169360();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      unint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_24D169290();
      sub_24D169510();
      id v7 = v6;
      sub_24D1692B0();
      uint64_t v8 = sub_24D169540();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_24D169290();
        uint64_t v17 = v16;
        if (v15 == sub_24D169290() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_24D1694A0();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_24D169290();
          uint64_t v24 = v23;
          if (v22 == sub_24D169290() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_24D1694A0();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_24D15B1C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269858DF0);
    uint64_t v3 = sub_24D169360();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      int v7 = *(_DWORD *)(v6 + 4 * v4);
      sub_24D169510();
      sub_24D169530();
      uint64_t result = sub_24D169540();
      uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v10 = result & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
      uint64_t v13 = 1 << v10;
      uint64_t v14 = *(void *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(_DWORD *)(v14 + 4 * v10) == v7) {
          goto LABEL_3;
        }
        uint64_t v15 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v15;
          unint64_t v11 = v10 >> 6;
          uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
          uint64_t v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0) {
            break;
          }
          if (*(_DWORD *)(v14 + 4 * v10) == v7) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v11) = v13 | v12;
      *(_DWORD *)(v14 + 4 * v10) = v7;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_24D15B304(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24D15A778(a1, a2);
  }
  return a1;
}

uint64_t sub_24D15B318()
{
  return type metadata accessor for PackageStaticValidator();
}

uint64_t sub_24D15B320()
{
  uint64_t result = sub_24D169160();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PackageStaticValidator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PackageStaticValidator);
}

uint64_t dispatch thunk of PackageStaticValidator.supportedMeasurementAlgorithms.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of PackageStaticValidator.supportedMeasurementAlgorithms.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of PackageStaticValidator.supportedMeasurementAlgorithms.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of PackageStaticValidator.__allocating_init(url:requireTrust:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of PackageStaticValidator.validateResource(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of PackageStaticValidator.validateAllResources(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
}

void type metadata accessor for SecCSDigestAlgorithm(uint64_t a1)
{
}

uint64_t sub_24D15B520()
{
  return sub_24D15B610(&qword_269858DD8, type metadata accessor for SecCSDigestAlgorithm);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void sub_24D15B580(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24D15B5C8()
{
  return sub_24D15B610(&qword_269858E00, type metadata accessor for URLResourceKey);
}

uint64_t sub_24D15B610(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D15B658()
{
  return sub_24D15B610(&qword_269858E08, type metadata accessor for URLResourceKey);
}

uint64_t sub_24D15B6A0()
{
  return sub_24D15B610(&qword_269858E10, type metadata accessor for URLResourceKey);
}

uint64_t FileMeasurement.isSameFile(_:withSupportedAlgorithms:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    uint64_t v5 = *a1;
    uint64_t v6 = *v2;
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = *(unsigned int *)(a2 + 4 * v7 + 32);
      if (v8 == 2)
      {
        uint64_t v9 = 0x3268736168;
        if (!*(void *)(v6 + 16)) {
          goto LABEL_3;
        }
      }
      else
      {
        if (v8 != 5)
        {
          sub_24D15B8FC();
          swift_allocError();
          *(void *)uint64_t v18 = v8;
          *(void *)(v18 + 8) = 0;
          *(unsigned char *)(v18 + 16) = 1;
          swift_willThrow();
          swift_bridgeObjectRelease();
          return 0;
        }
        uint64_t v9 = 0x3568736168;
        if (!*(void *)(v6 + 16))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
      }
      unint64_t v10 = sub_24D15AD30(v9, 0xE500000000000000);
      if ((v11 & 1) == 0) {
        goto LABEL_3;
      }
      uint64_t v12 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v10);
      uint64_t v14 = *v12;
      unint64_t v13 = v12[1];
      sub_24D15E490(*v12, v13);
      swift_bridgeObjectRelease();
      if (*(void *)(v5 + 16))
      {
        unint64_t v15 = sub_24D15AD30(v9, 0xE500000000000000);
        if (v16)
        {
          char v20 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v15);
          uint64_t v21 = *v20;
          unint64_t v22 = v20[1];
          sub_24D15E490(*v20, v22);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          char v23 = sub_24D15FAA8(v14, v13, v21, v22);
          sub_24D15A778(v21, v22);
          sub_24D15A778(v14, v13);
          return v23 & 1;
        }
      }
      swift_bridgeObjectRelease();
      sub_24D15A778(v14, v13);
LABEL_4:
      if (v3 == ++v7)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  sub_24D15B8FC();
  swift_allocError();
  *(_OWORD *)uint64_t v17 = xmmword_24D169F80;
  *(unsigned char *)(v17 + 16) = 3;
  swift_willThrow();
  return 0;
}

unint64_t sub_24D15B8FC()
{
  unint64_t result = qword_269858E28;
  if (!qword_269858E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858E28);
  }
  return result;
}

uint64_t sub_24D15B968(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v51 = a2;
  LODWORD(v3) = a3;
  uint64_t v49 = a1;
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24D169250();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24D169230();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24D169240();
  uint64_t v48 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24D169220();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 == 5)
  {
    uint64_t v26 = v8;
    uint64_t v47 = v5;
    uint64_t v48 = v9;
    uint64_t v46 = sub_24D1606CC(&qword_269858E98, MEMORY[0x263F04818]);
    sub_24D169210();
    unint64_t v27 = v51;
    uint64_t v28 = v49;
    BOOL v29 = v11;
    uint64_t v30 = v26;
    switch(v51 >> 62)
    {
      case 1uLL:
        if (v49 >> 32 < (int)v49) {
          goto LABEL_26;
        }
        sub_24D15E490(v49, v51);
        uint64_t v43 = v50;
        sub_24D15F838((int)v28, v28 >> 32, v27 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v7, MEMORY[0x263F04818], &qword_269858E98, MEMORY[0x263F04818]);
        uint64_t v50 = v43;
        goto LABEL_22;
      case 2uLL:
        uint64_t v36 = *(void *)(v49 + 16);
        uint64_t v37 = *(void *)(v49 + 24);
        sub_24D15E490(v49, v51);
        swift_retain();
        swift_retain();
        uint64_t v38 = v50;
        sub_24D15F838(v36, v37, v27 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v7, MEMORY[0x263F04818], &qword_269858E98, MEMORY[0x263F04818]);
        uint64_t v50 = v38;
        if (v38) {
          goto LABEL_28;
        }
        swift_release();
        swift_release();
LABEL_22:
        sub_24D15A778(v28, v27);
        uint64_t v42 = v48;
        BOOL v29 = v11;
        break;
      case 3uLL:
        memset(v53, 0, 14);
        goto LABEL_19;
      default:
        v53[0] = v49;
        LODWORD(v53[1]) = v51;
        WORD2(v53[1]) = WORD2(v51);
LABEL_19:
        sub_24D1691F0();
        sub_24D15A778(v28, v27);
        uint64_t v42 = v48;
        break;
    }
    sub_24D169200();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v4);
    uint64_t v54 = v30;
    uint64_t v55 = sub_24D1606CC(&qword_269858EA0, MEMORY[0x263F045F0]);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v53);
    (*(void (**)(uint64_t *, char *, uint64_t))(v42 + 16))(boxed_opaque_existential_1, v29, v30);
    __swift_project_boxed_opaque_existential_1(v53, v54);
    sub_24D169030();
    uint64_t v3 = v52;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v30);
  }
  else if (v3 == 2)
  {
    char v20 = v19;
    uint64_t v21 = v16;
    uint64_t v47 = v17;
    sub_24D1606CC(&qword_269858EA8, MEMORY[0x263F047F8]);
    sub_24D169210();
    switch(v51 >> 62)
    {
      case 1uLL:
        uint64_t v33 = v49;
        if (v33 >> 32 < (int)v33)
        {
          __break(1u);
LABEL_26:
          __break(1u);
        }
        unint64_t v32 = v51;
        uint64_t v46 = v51 & 0x3FFFFFFFFFFFFFFFLL;
        sub_24D15E490(v49, v51);
        sub_24D15F838((int)v33, v33 >> 32, v46, (uint64_t)v14, MEMORY[0x263F047F8], &qword_269858EA8, MEMORY[0x263F047F8]);
        break;
      case 2uLL:
        unint64_t v32 = v51;
        uint64_t v33 = v49;
        uint64_t v34 = *(void *)(v49 + 16);
        uint64_t v46 = *(void *)(v49 + 24);
        sub_24D15E490(v49, v51);
        swift_retain();
        swift_retain();
        uint64_t v35 = v50;
        sub_24D15F838(v34, v46, v32 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v14, MEMORY[0x263F047F8], &qword_269858EA8, MEMORY[0x263F047F8]);
        if (v35)
        {
          swift_release();
          swift_release();
          __break(1u);
LABEL_28:
          swift_release();
          swift_release();
          __break(1u);
          JUMPOUT(0x24D15C354);
        }
        swift_release();
        swift_release();
        break;
      case 3uLL:
        memset(v53, 0, 14);
        sub_24D1691F0();
        uint64_t v24 = v49;
        unint64_t v25 = v51;
        goto LABEL_13;
      default:
        uint64_t v22 = v49;
        v53[0] = v49;
        unint64_t v23 = v51;
        LODWORD(v53[1]) = v51;
        WORD2(v53[1]) = WORD2(v51);
        sub_24D1691F0();
        uint64_t v24 = v22;
        unint64_t v25 = v23;
LABEL_13:
        sub_24D15A778(v24, v25);
        goto LABEL_17;
    }
    sub_24D15A778(v33, v32);
LABEL_17:
    uint64_t v39 = v20;
    sub_24D169200();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v14, v12);
    uint64_t v54 = v21;
    uint64_t v55 = sub_24D1606CC(&qword_269858EB0, MEMORY[0x263F045C0]);
    uint64_t v40 = __swift_allocate_boxed_opaque_existential_1(v53);
    uint64_t v41 = v47;
    (*(void (**)(uint64_t *, char *, uint64_t))(v47 + 16))(v40, v39, v21);
    __swift_project_boxed_opaque_existential_1(v53, v54);
    sub_24D169030();
    uint64_t v3 = v52;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v39, v21);
  }
  else
  {
    uint64_t v3 = v3;
    sub_24D15B8FC();
    swift_allocError();
    *(void *)uint64_t v31 = v3;
    *(void *)(v31 + 8) = 0;
    *(unsigned char *)(v31 + 16) = 1;
    swift_willThrow();
  }
  return v3;
}

uint64_t sub_24D15C374(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x3568736168;
  }
  else {
    uint64_t v2 = 0x3268736168;
  }
  if (a2) {
    uint64_t v3 = 0x3568736168;
  }
  else {
    uint64_t v3 = 0x3268736168;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_24D1694A0();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_24D15C3EC(char *a1, char *a2)
{
  return sub_24D15C374(*a1, *a2);
}

uint64_t sub_24D15C3F8()
{
  return sub_24D169540();
}

uint64_t sub_24D15C468()
{
  sub_24D1692B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D15C4BC()
{
  return sub_24D169540();
}

uint64_t sub_24D15C528@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24D169430();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_24D15C588(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x3268736168;
  if (*v1) {
    uint64_t v2 = 0x3568736168;
  }
  *a1 = v2;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_24D15C5B8()
{
  if (*v0) {
    return 0x3568736168;
  }
  else {
    return 0x3268736168;
  }
}

uint64_t sub_24D15C5E4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24D169430();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_24D15C648()
{
  return 0;
}

void sub_24D15C654(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24D15C660(uint64_t a1)
{
  unint64_t v2 = sub_24D15FF84();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24D15C69C(uint64_t a1)
{
  unint64_t v2 = sub_24D15FF84();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24D15C6D8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v10 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v9 << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    swift_bridgeObjectRetain_n();
    unint64_t v18 = sub_24D169430();
    swift_bridgeObjectRelease();
    if (v18 > 1)
    {
      sub_24D15B8FC();
      swift_allocError();
      *(void *)uint64_t v19 = v17;
      *(void *)(v19 + 8) = v16;
      *(unsigned char *)(v19 + 16) = 0;
      swift_bridgeObjectRetain();
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v7) {
      goto LABEL_27;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_27;
      }
      unint64_t v13 = *(void *)(v3 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_27;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        if (!v13)
        {
          int64_t v9 = v12 + 3;
          if (v12 + 3 >= v7) {
            goto LABEL_27;
          }
          unint64_t v13 = *(void *)(v3 + 8 * v9);
          if (!v13)
          {
            int64_t v9 = v12 + 4;
            if (v12 + 4 >= v7) {
              goto LABEL_27;
            }
            unint64_t v13 = *(void *)(v3 + 8 * v9);
            if (!v13) {
              break;
            }
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 5;
  if (v14 >= v7)
  {
LABEL_27:
    uint64_t result = swift_release();
    *a2 = a1;
    return result;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_27;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t FileMeasurement.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269858E30);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24D15FF84();
  sub_24D169550();
  uint64_t v9 = v2;
  if (v2) {
    goto LABEL_26;
  }
  uint64_t v36 = a2;
  uint64_t v37 = v6;
  uint64_t v38 = a1;
  uint64_t v10 = sub_24D169460();
  uint64_t v42 = *(void *)(v10 + 16);
  uint64_t v43 = v10;
  char v11 = (void *)MEMORY[0x263F8EE80];
  if (!v42)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    if (v11[2])
    {
      (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v5);
      *uint64_t v36 = v11;
      uint64_t v32 = (uint64_t)v38;
      return __swift_destroy_boxed_opaque_existential_1(v32);
    }
    swift_bridgeObjectRelease();
    sub_24D15B8FC();
    swift_allocError();
    *(void *)uint64_t v33 = 0;
    *(void *)(v33 + 8) = 0;
    *(unsigned char *)(v33 + 16) = 3;
    swift_willThrow();
LABEL_25:
    (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v5);
    a1 = v38;
LABEL_26:
    uint64_t v32 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v32);
  }
  unint64_t v12 = sub_24D160028();
  uint64_t v40 = v5;
  unint64_t v41 = v12;
  uint64_t v13 = 0;
  uint64_t v39 = v8;
  while (1)
  {
    if (*(unsigned char *)(v43 + v13 + 32)) {
      uint64_t v15 = 0x3568736168;
    }
    else {
      uint64_t v15 = 0x3268736168;
    }
    LOBYTE(v47) = *(unsigned char *)(v43 + v13 + 32);
    sub_24D169450();
    if (v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
    uint64_t v44 = 0;
    uint64_t v17 = v45;
    uint64_t v16 = v46;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v47 = v11;
    unint64_t v20 = sub_24D15AD30(v15, 0xE500000000000000);
    uint64_t v21 = v11[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      break;
    }
    char v24 = v19;
    if (v11[3] >= v23)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        char v11 = v47;
        if (v19) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_24D15EB10();
        char v11 = v47;
        if (v24) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_24D15E4E8(v23, isUniquelyReferenced_nonNull_native);
      unint64_t v25 = sub_24D15AD30(v15, 0xE500000000000000);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_30;
      }
      unint64_t v20 = v25;
      char v11 = v47;
      if (v24)
      {
LABEL_4:
        uint64_t v14 = v11[7] + 16 * v20;
        sub_24D15A778(*(void *)v14, *(void *)(v14 + 8));
        *(void *)uint64_t v14 = v17;
        *(void *)(v14 + 8) = v16;
        goto LABEL_5;
      }
    }
    v11[(v20 >> 6) + 8] |= 1 << v20;
    unint64_t v27 = (uint64_t *)(v11[6] + 16 * v20);
    *unint64_t v27 = v15;
    v27[1] = 0xE500000000000000;
    uint64_t v28 = (void *)(v11[7] + 16 * v20);
    *uint64_t v28 = v17;
    v28[1] = v16;
    uint64_t v29 = v11[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_29;
    }
    v11[2] = v31;
    swift_bridgeObjectRetain();
LABEL_5:
    ++v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v39;
    uint64_t v5 = v40;
    uint64_t v9 = v44;
    if (v42 == v13) {
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  uint64_t result = sub_24D1694C0();
  __break(1u);
  return result;
}

uint64_t FileMeasurement.init(withHash:ofType:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, void *a4@<X8>)
{
  if (a3 == 2)
  {
    uint64_t v8 = 0x3268736168;
  }
  else
  {
    if (a3 != 5)
    {
      uint64_t v12 = a3;
      sub_24D15B8FC();
      swift_allocError();
      *(void *)uint64_t v13 = v12;
      *(void *)(v13 + 8) = 0;
      *(unsigned char *)(v13 + 16) = 1;
      swift_willThrow();
      return sub_24D15A778(a1, a2);
    }
    uint64_t v8 = 0x3568736168;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858E48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D169CB0;
  *(void *)(inited + 32) = v8;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  sub_24D15E490(a1, a2);
  unint64_t v10 = sub_24D15CDE4(inited);
  sub_24D15C6D8(v10, &v14);
  uint64_t result = sub_24D15A778(a1, a2);
  if (!v4) {
    *a4 = v14;
  }
  return result;
}

unint64_t sub_24D15CDE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858E90);
  uint64_t v2 = (void *)sub_24D169410();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    unint64_t v8 = *v4;
    swift_bridgeObjectRetain();
    sub_24D15E490(v7, v8);
    unint64_t result = sub_24D15AD30(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    *char v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (uint64_t *)(v2[7] + 16 * result);
    uint64_t *v12 = v7;
    v12[1] = v8;
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

uint64_t FileMeasurement.encode(to:)(void *a1)
{
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269858E50);
  uint64_t v31 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24D15FF84();
  uint64_t v34 = v5;
  sub_24D169560();
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v32 = v6 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v12 << 6);
    }
    else
    {
      if (__OFADD__(v12++, 1))
      {
        __break(1u);
LABEL_38:
        __break(1u);
        return result;
      }
      if (v12 >= v33) {
        goto LABEL_34;
      }
      unint64_t v18 = *(void *)(v32 + 8 * v12);
      if (!v18)
      {
        int64_t v19 = v12 + 1;
        if (v12 + 1 >= v33) {
          goto LABEL_34;
        }
        unint64_t v18 = *(void *)(v32 + 8 * v19);
        if (!v18)
        {
          int64_t v19 = v12 + 2;
          if (v12 + 2 >= v33) {
            goto LABEL_34;
          }
          unint64_t v18 = *(void *)(v32 + 8 * v19);
          if (!v18)
          {
            int64_t v19 = v12 + 3;
            if (v12 + 3 >= v33) {
              goto LABEL_34;
            }
            unint64_t v18 = *(void *)(v32 + 8 * v19);
            if (!v18)
            {
              int64_t v19 = v12 + 4;
              if (v12 + 4 >= v33) {
                goto LABEL_34;
              }
              unint64_t v18 = *(void *)(v32 + 8 * v19);
              if (!v18)
              {
                int64_t v19 = v12 + 5;
                if (v12 + 5 >= v33)
                {
LABEL_34:
                  uint64_t v28 = v31;
                  swift_release();
                  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v34, v35);
                }
                unint64_t v18 = *(void *)(v32 + 8 * v19);
                if (!v18)
                {
                  while (1)
                  {
                    int64_t v12 = v19 + 1;
                    if (__OFADD__(v19, 1)) {
                      goto LABEL_38;
                    }
                    if (v12 >= v33) {
                      goto LABEL_34;
                    }
                    unint64_t v18 = *(void *)(v32 + 8 * v12);
                    ++v19;
                    if (v18) {
                      goto LABEL_22;
                    }
                  }
                }
              }
            }
          }
        }
        int64_t v12 = v19;
      }
LABEL_22:
      unint64_t v10 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
    }
    unint64_t v20 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_24D169430();
    swift_bridgeObjectRelease();
    if (!v23)
    {
      char v24 = 0;
      if (!*(void *)(v6 + 16)) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
    if (v23 != 1) {
      break;
    }
    char v24 = 1;
    if (!*(void *)(v6 + 16)) {
      goto LABEL_4;
    }
LABEL_28:
    unint64_t v25 = sub_24D15AD30(v21, v22);
    if (v26)
    {
      unint64_t v27 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v25);
      uint64_t v13 = *v27;
      unint64_t v14 = v27[1];
      sub_24D15E490(*v27, v14);
      goto LABEL_5;
    }
LABEL_4:
    uint64_t v13 = 0;
    unint64_t v14 = 0xF000000000000000;
LABEL_5:
    swift_bridgeObjectRelease();
    uint64_t v36 = v13;
    unint64_t v37 = v14;
    char v38 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269858E58);
    sub_24D16007C();
    sub_24D169480();
    uint64_t result = sub_24D15B304(v13, v14);
    if (v2) {
      goto LABEL_36;
    }
  }
  sub_24D15B8FC();
  swift_allocError();
  *(void *)uint64_t v29 = v21;
  *(void *)(v29 + 8) = v22;
  *(unsigned char *)(v29 + 16) = 0;
  swift_willThrow();
LABEL_36:
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v34, v35);
}

uint64_t FileMeasurement.hashTypes()()
{
  uint64_t v1 = *v0;
  uint64_t v21 = MEMORY[0x263F8EE88];
  uint64_t v2 = v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v11 = v10 | (v8 << 6);
      goto LABEL_26;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v12 >= v6) {
      goto LABEL_29;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v12);
    ++v8;
    if (!v13)
    {
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v6) {
        goto LABEL_29;
      }
      unint64_t v13 = *(void *)(v2 + 8 * v8);
      if (!v13)
      {
        int64_t v8 = v12 + 2;
        if (v12 + 2 >= v6) {
          goto LABEL_29;
        }
        unint64_t v13 = *(void *)(v2 + 8 * v8);
        if (!v13)
        {
          int64_t v8 = v12 + 3;
          if (v12 + 3 >= v6) {
            goto LABEL_29;
          }
          unint64_t v13 = *(void *)(v2 + 8 * v8);
          if (!v13)
          {
            int64_t v8 = v12 + 4;
            if (v12 + 4 >= v6) {
              goto LABEL_29;
            }
            unint64_t v13 = *(void *)(v2 + 8 * v8);
            if (!v13) {
              break;
            }
          }
        }
      }
    }
LABEL_25:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_26:
    unint64_t v15 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_24D169430();
    swift_bridgeObjectRelease();
    if (v18 == 1)
    {
      uint64_t v9 = 5;
    }
    else
    {
      if (v18)
      {
        sub_24D15B8FC();
        swift_allocError();
        *(void *)uint64_t v19 = v17;
        *(void *)(v19 + 8) = v16;
        *(unsigned char *)(v19 + 16) = 0;
        swift_willThrow();
        swift_release();
        return swift_bridgeObjectRelease();
      }
      uint64_t v9 = 2;
    }
    swift_bridgeObjectRelease();
    uint64_t result = sub_24D15EF08(&v20, v9);
  }
  int64_t v14 = v12 + 5;
  if (v14 >= v6)
  {
LABEL_29:
    swift_release();
    return v21;
  }
  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_29;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_25;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t FileMeasurement.bestHash()()
{
  uint64_t result = FileMeasurement.hashTypes()();
  if (!v0)
  {
    uint64_t v2 = result;
    if (sub_24D167A00(5, result))
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else if (sub_24D167A00(2, v2))
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      sub_24D15B8FC();
      swift_allocError();
      *(void *)uint64_t v3 = 0;
      *(void *)(v3 + 8) = 0;
      *(unsigned char *)(v3 + 16) = 3;
      swift_willThrow();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t FileMeasurement.hashData(forDigestAlgorithm:)(unsigned int a1)
{
  uint64_t v3 = *v1;
  if (a1 == 2)
  {
    uint64_t v4 = 0x3268736168;
    if (!*(void *)(v3 + 16)) {
      goto LABEL_8;
    }
  }
  else
  {
    if (a1 != 5)
    {
      uint64_t v8 = a1;
      sub_24D15B8FC();
      swift_allocError();
      *(void *)uint64_t v9 = a1;
      char v10 = 1;
      goto LABEL_10;
    }
    uint64_t v4 = 0x3568736168;
    if (!*(void *)(v3 + 16))
    {
LABEL_8:
      swift_bridgeObjectRelease();
      uint64_t v8 = a1;
      sub_24D15B8FC();
      swift_allocError();
      *(void *)uint64_t v9 = a1;
      char v10 = 2;
LABEL_10:
      *(void *)(v9 + 8) = 0;
      *(unsigned char *)(v9 + 16) = v10;
      swift_willThrow();
      return v8;
    }
  }
  unint64_t v5 = sub_24D15AD30(v4, 0xE500000000000000);
  if ((v6 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v7 = *(void *)(v3 + 56) + 16 * v5;
  uint64_t v8 = *(void *)v7;
  sub_24D15E490(*(void *)v7, *(void *)(v7 + 8));
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t static FileMeasurement.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_24D15D6F4(*a1, *a2);
}

uint64_t sub_24D15D6F4(uint64_t a1, uint64_t a2)
{
  __s2[2] = *MEMORY[0x263EF8340];
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v90 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v91 = (unint64_t)(v5 + 63) >> 6;
  while (2)
  {
    if (v7)
    {
      unint64_t v8 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v93 = v4;
      unint64_t v9 = v8 | (v4 << 6);
    }
    else
    {
      int64_t v10 = v4 + 1;
      if (__OFADD__(v4, 1))
      {
        __break(1u);
LABEL_142:
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        __break(1u);
LABEL_145:
        __break(1u);
LABEL_146:
        __break(1u);
LABEL_147:
        __break(1u);
LABEL_148:
        __break(1u);
        goto LABEL_149;
      }
      if (v10 >= v91) {
        return 1;
      }
      unint64_t v11 = *(void *)(v90 + 8 * v10);
      int64_t v12 = v4 + 1;
      if (!v11)
      {
        int64_t v12 = v4 + 2;
        if (v4 + 2 >= v91) {
          return 1;
        }
        unint64_t v11 = *(void *)(v90 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v4 + 3;
          if (v4 + 3 >= v91) {
            return 1;
          }
          unint64_t v11 = *(void *)(v90 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 4;
            if (v4 + 4 >= v91) {
              return 1;
            }
            unint64_t v11 = *(void *)(v90 + 8 * v12);
            if (!v11)
            {
              uint64_t v13 = v4 + 5;
              if (v4 + 5 >= v91) {
                return 1;
              }
              unint64_t v11 = *(void *)(v90 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  int64_t v12 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    break;
                  }
                  if (v12 >= v91) {
                    return 1;
                  }
                  unint64_t v11 = *(void *)(v90 + 8 * v12);
                  ++v13;
                  if (v11) {
                    goto LABEL_25;
                  }
                }
LABEL_149:
                __break(1u);
LABEL_150:
                __break(1u);
LABEL_151:
                __break(1u);
LABEL_152:
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
LABEL_157:
                __break(1u);
LABEL_158:
                __break(1u);
LABEL_159:
                __break(1u);
LABEL_160:
                __break(1u);
LABEL_161:
                __break(1u);
LABEL_162:
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                __break(1u);
              }
              int64_t v12 = v4 + 5;
            }
          }
        }
      }
LABEL_25:
      unint64_t v7 = (v11 - 1) & v11;
      int64_t v93 = v12;
      unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    }
    uint64_t v14 = 16 * v9;
    unint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 56) + v14);
    uint64_t v20 = *v18;
    unint64_t v19 = v18[1];
    swift_bridgeObjectRetain();
    sub_24D15E490(v20, v19);
    unint64_t v21 = sub_24D15AD30(v16, v17);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0) {
      goto LABEL_139;
    }
    unint64_t v24 = v19 >> 62;
    unint64_t v25 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v21);
    uint64_t v27 = *v25;
    unint64_t v26 = v25[1];
    uint64_t v28 = 0;
    switch(v26 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v27), v27)) {
          goto LABEL_142;
        }
        uint64_t v28 = HIDWORD(v27) - (int)v27;
LABEL_32:
        sub_24D15E490(v27, v26);
        break;
      case 2uLL:
        uint64_t v30 = *(void *)(v27 + 16);
        uint64_t v29 = *(void *)(v27 + 24);
        uint64_t v28 = v29 - v30;
        if (!__OFSUB__(v29, v30)) {
          goto LABEL_32;
        }
        goto LABEL_143;
      case 3uLL:
        break;
      default:
        uint64_t v28 = BYTE6(v26);
        break;
    }
    switch((int)v24)
    {
      case 1:
        LODWORD(v31) = HIDWORD(v20) - v20;
        if (__OFSUB__(HIDWORD(v20), v20)) {
          goto LABEL_144;
        }
        uint64_t v31 = (int)v31;
LABEL_38:
        if (v28 == v31)
        {
          if (v28 < 1)
          {
LABEL_7:
            sub_24D15A778(v27, v26);
            sub_24D15A778(v20, v19);
            uint64_t v3 = a1;
            int64_t v4 = v93;
          }
          else
          {
            switch(v26 >> 62)
            {
              case 1uLL:
                if ((int)v27 > v27 >> 32) {
                  goto LABEL_146;
                }
                uint64_t v40 = (char *)sub_24D168FF0();
                if (!v40) {
                  goto LABEL_52;
                }
                uint64_t v41 = sub_24D169010();
                if (__OFSUB__((int)v27, v41)) {
                  goto LABEL_148;
                }
                v40 += (int)v27 - v41;
LABEL_52:
                uint64_t v2 = a2;
                sub_24D169000();
                if (!v24)
                {
                  __s2[0] = v20;
                  LOWORD(__s2[1]) = v19;
                  BYTE2(__s2[1]) = BYTE2(v19);
                  BYTE3(__s2[1]) = BYTE3(v19);
                  BYTE4(__s2[1]) = BYTE4(v19);
                  BYTE5(__s2[1]) = BYTE5(v19);
                  if (!v40) {
                    goto LABEL_177;
                  }
                  size_t v58 = BYTE6(v19);
                  uint64_t v60 = __s2;
                  char v59 = v40;
LABEL_120:
                  int v46 = memcmp(v59, v60, v58);
                  goto LABEL_121;
                }
                if (v24 == 1)
                {
                  if (v20 >> 32 < (int)v20) {
                    goto LABEL_158;
                  }
                  swift_retain();
                  uint64_t v42 = (char *)sub_24D168FF0();
                  if (v42)
                  {
                    uint64_t v43 = sub_24D169010();
                    if (__OFSUB__((int)v20, v43)) {
                      goto LABEL_165;
                    }
                    v42 += (int)v20 - v43;
                  }
                  uint64_t v2 = a2;
                  uint64_t v44 = sub_24D169000();
                  if (v44 >= (v20 >> 32) - (int)v20) {
                    size_t v45 = (v20 >> 32) - (int)v20;
                  }
                  else {
                    size_t v45 = v44;
                  }
                  if (!v40) {
                    goto LABEL_167;
                  }
                  uint64_t v3 = a1;
                  if (!v42) {
                    goto LABEL_168;
                  }
                  int v46 = memcmp(v40, v42, v45);
                  sub_24D15A778(v20, v19);
                  sub_24D15A778(v27, v26);
                  sub_24D15A778(v20, v19);
                  goto LABEL_123;
                }
                uint64_t v81 = *(void *)(v20 + 16);
                uint64_t v80 = *(void *)(v20 + 24);
                swift_retain();
                swift_retain();
                v82 = (char *)sub_24D168FF0();
                if (v82)
                {
                  uint64_t v83 = sub_24D169010();
                  if (__OFSUB__(v81, v83)) {
                    goto LABEL_164;
                  }
                  v82 += v81 - v83;
                }
                BOOL v34 = __OFSUB__(v80, v81);
                int64_t v84 = v80 - v81;
                if (v34) {
                  goto LABEL_159;
                }
                uint64_t v85 = sub_24D169000();
                if (v85 >= v84) {
                  size_t v86 = v84;
                }
                else {
                  size_t v86 = v85;
                }
                uint64_t v3 = a1;
                if (!v40) {
                  goto LABEL_178;
                }
                uint64_t v2 = a2;
                if (!v82) {
                  goto LABEL_179;
                }
                int v71 = memcmp(v40, v82, v86);
                swift_release();
                swift_release();
                sub_24D15A778(v27, v26);
                sub_24D15A778(v20, v19);
LABEL_135:
                int64_t v4 = v93;
                if (v71) {
                  return 0;
                }
                continue;
              case 2uLL:
                uint64_t v47 = *(void *)(v27 + 16);
                swift_retain();
                swift_retain();
                uint64_t v48 = (char *)sub_24D168FF0();
                if (!v48) {
                  goto LABEL_67;
                }
                uint64_t v49 = sub_24D169010();
                if (__OFSUB__(v47, v49)) {
                  goto LABEL_147;
                }
                v48 += v47 - v49;
LABEL_67:
                uint64_t v2 = a2;
                sub_24D169000();
                if (!v24)
                {
                  __s2[0] = v20;
                  LOWORD(__s2[1]) = v19;
                  BYTE2(__s2[1]) = BYTE2(v19);
                  BYTE3(__s2[1]) = BYTE3(v19);
                  BYTE4(__s2[1]) = BYTE4(v19);
                  BYTE5(__s2[1]) = BYTE5(v19);
                  if (!v48) {
                    goto LABEL_174;
                  }
                  int v46 = memcmp(v48, __s2, BYTE6(v19));
                  goto LABEL_106;
                }
                __s1 = v48;
                if (v24 == 1)
                {
                  if (v20 >> 32 < (int)v20) {
                    goto LABEL_152;
                  }
                  swift_retain();
                  uint64_t v50 = (char *)sub_24D168FF0();
                  if (v50)
                  {
                    uint64_t v51 = sub_24D169010();
                    if (__OFSUB__((int)v20, v51)) {
                      goto LABEL_163;
                    }
                    v50 += (int)v20 - v51;
                  }
                  uint64_t v2 = a2;
                  uint64_t v52 = sub_24D169000();
                  if (v52 >= (v20 >> 32) - (int)v20) {
                    size_t v53 = (v20 >> 32) - (int)v20;
                  }
                  else {
                    size_t v53 = v52;
                  }
                  if (!v48) {
                    goto LABEL_169;
                  }
                  if (!v50) {
                    goto LABEL_170;
                  }
                  int v46 = memcmp(v48, v50, v53);
                  sub_24D15A778(v20, v19);
LABEL_106:
                  swift_release();
                  swift_release();
LABEL_121:
                  sub_24D15A778(v27, v26);
                  sub_24D15A778(v20, v19);
LABEL_122:
                  uint64_t v3 = a1;
LABEL_123:
                  int64_t v4 = v93;
                  if (v46) {
                    return 0;
                  }
                  continue;
                }
                uint64_t v73 = *(void *)(v20 + 16);
                uint64_t v72 = *(void *)(v20 + 24);
                swift_retain();
                swift_retain();
                v74 = (char *)sub_24D168FF0();
                if (v74)
                {
                  uint64_t v75 = sub_24D169010();
                  if (__OFSUB__(v73, v75)) {
                    goto LABEL_162;
                  }
                  v74 += v73 - v75;
                }
                BOOL v34 = __OFSUB__(v72, v73);
                int64_t v76 = v72 - v73;
                if (v34) {
                  goto LABEL_157;
                }
                uint64_t v77 = sub_24D169000();
                if (v77 >= v76) {
                  size_t v78 = v76;
                }
                else {
                  size_t v78 = v77;
                }
                if (!__s1) {
                  goto LABEL_175;
                }
                uint64_t v2 = a2;
                if (!v74) {
                  goto LABEL_176;
                }
                int v79 = memcmp(__s1, v74, v78);
                swift_release();
                swift_release();
                swift_release();
                swift_release();
                sub_24D15A778(v27, v26);
                sub_24D15A778(v20, v19);
                uint64_t v3 = a1;
                int64_t v4 = v93;
                if (v79) {
                  return 0;
                }
                break;
              case 3uLL:
                memset(__s2, 0, 14);
                if (!v24) {
                  goto LABEL_88;
                }
                if (v24 == 1)
                {
                  uint64_t v35 = (v20 >> 32) - (int)v20;
                  if (v20 >> 32 < (int)v20) {
                    goto LABEL_151;
                  }
                  sub_24D15E490(v20, v19);
                  uint64_t v54 = sub_24D168FF0();
                  if (!v54) {
                    goto LABEL_171;
                  }
                  uint64_t v37 = v54;
                  uint64_t v55 = sub_24D169010();
                  uint64_t v39 = (int)v20 - v55;
                  if (__OFSUB__((int)v20, v55)) {
                    goto LABEL_156;
                  }
LABEL_84:
                  uint64_t v56 = sub_24D169000();
                  if (v56 >= v35) {
                    size_t v57 = v35;
                  }
                  else {
                    size_t v57 = v56;
                  }
                  int v46 = memcmp(__s2, (const void *)(v37 + v39), v57);
                  sub_24D15A778(v20, v19);
                  sub_24D15A778(v27, v26);
                  sub_24D15A778(v20, v19);
                  uint64_t v2 = a2;
                  goto LABEL_122;
                }
                uint64_t v67 = *(void *)(v20 + 16);
                uint64_t v68 = *(void *)(v20 + 24);
                swift_retain();
                swift_retain();
                int64_t v63 = (char *)sub_24D168FF0();
                if (v63)
                {
                  uint64_t v69 = sub_24D169010();
                  if (__OFSUB__(v67, v69)) {
                    goto LABEL_161;
                  }
                  v63 += v67 - v69;
                }
                int64_t v65 = v68 - v67;
                if (__OFSUB__(v68, v67)) {
                  goto LABEL_154;
                }
                uint64_t v66 = sub_24D169000();
                uint64_t v3 = a1;
                if (!v63) {
                  goto LABEL_173;
                }
LABEL_100:
                if (v66 >= v65) {
                  size_t v70 = v65;
                }
                else {
                  size_t v70 = v66;
                }
                int v71 = memcmp(__s2, v63, v70);
                swift_release();
                swift_release();
                sub_24D15A778(v27, v26);
                sub_24D15A778(v20, v19);
                uint64_t v2 = a2;
                goto LABEL_135;
              default:
                __s2[0] = v27;
                LOWORD(__s2[1]) = v26;
                BYTE2(__s2[1]) = BYTE2(v26);
                BYTE3(__s2[1]) = BYTE3(v26);
                BYTE4(__s2[1]) = BYTE4(v26);
                BYTE5(__s2[1]) = BYTE5(v26);
                if (!v24)
                {
LABEL_88:
                  uint64_t v94 = v20;
                  __int16 v95 = v19;
                  char v96 = BYTE2(v19);
                  char v97 = BYTE3(v19);
                  char v98 = BYTE4(v19);
                  size_t v58 = BYTE6(v19);
                  char v99 = BYTE5(v19);
                  char v59 = __s2;
                  uint64_t v60 = &v94;
                  goto LABEL_120;
                }
                if (v24 == 1)
                {
                  uint64_t v35 = (v20 >> 32) - (int)v20;
                  if (v20 >> 32 < (int)v20) {
                    goto LABEL_150;
                  }
                  sub_24D15E490(v20, v19);
                  uint64_t v36 = sub_24D168FF0();
                  if (!v36)
                  {
                    sub_24D169000();
                    __break(1u);
LABEL_167:
                    __break(1u);
LABEL_168:
                    __break(1u);
LABEL_169:
                    __break(1u);
LABEL_170:
                    __break(1u);
LABEL_171:
                    sub_24D169000();
                    __break(1u);
LABEL_172:
                    __break(1u);
LABEL_173:
                    __break(1u);
LABEL_174:
                    __break(1u);
LABEL_175:
                    __break(1u);
LABEL_176:
                    __break(1u);
LABEL_177:
                    __break(1u);
LABEL_178:
                    __break(1u);
LABEL_179:
                    __break(1u);
                    JUMPOUT(0x24D15E1B0);
                  }
                  uint64_t v37 = v36;
                  uint64_t v38 = sub_24D169010();
                  uint64_t v39 = (int)v20 - v38;
                  if (__OFSUB__((int)v20, v38)) {
                    goto LABEL_155;
                  }
                  goto LABEL_84;
                }
                uint64_t v61 = *(void *)(v20 + 16);
                uint64_t v62 = *(void *)(v20 + 24);
                swift_retain();
                swift_retain();
                int64_t v63 = (char *)sub_24D168FF0();
                if (v63)
                {
                  uint64_t v64 = sub_24D169010();
                  if (__OFSUB__(v61, v64)) {
                    goto LABEL_160;
                  }
                  v63 += v61 - v64;
                }
                int64_t v65 = v62 - v61;
                if (__OFSUB__(v62, v61)) {
                  goto LABEL_153;
                }
                uint64_t v66 = sub_24D169000();
                uint64_t v3 = a1;
                if (!v63) {
                  goto LABEL_172;
                }
                goto LABEL_100;
            }
          }
          continue;
        }
LABEL_138:
        sub_24D15A778(v27, v26);
LABEL_139:
        sub_24D15A778(v20, v19);
        return 0;
      case 2:
        uint64_t v33 = *(void *)(v20 + 16);
        uint64_t v32 = *(void *)(v20 + 24);
        BOOL v34 = __OFSUB__(v32, v33);
        uint64_t v31 = v32 - v33;
        if (!v34) {
          goto LABEL_38;
        }
        goto LABEL_145;
      case 3:
        if (!v28) {
          goto LABEL_7;
        }
        goto LABEL_138;
      default:
        uint64_t v31 = BYTE6(v19);
        goto LABEL_38;
    }
  }
}

uint64_t sub_24D15E1E0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return FileMeasurement.init(from:)(a1, a2);
}

uint64_t sub_24D15E1F8(void *a1)
{
  return FileMeasurement.encode(to:)(a1);
}

uint64_t sub_24D15E210(uint64_t *a1, uint64_t *a2)
{
  return sub_24D15D6F4(*a1, *a2);
}

uint64_t sub_24D15E21C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
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
      sub_24D15E490(a2, a3);
      int64_t v10 = (char *)sub_24D168FF0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_24D169010();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_24D169000();
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
        JUMPOUT(0x24D15E480);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_24D15A778(a2, a3);
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
      uint64_t v17 = (char *)sub_24D168FF0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_24D169010();
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
      uint64_t v21 = sub_24D169000();
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

uint64_t sub_24D15E490(uint64_t a1, unint64_t a2)
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

uint64_t sub_24D15E4E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858E90);
  char v6 = a2;
  uint64_t v7 = sub_24D169400();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_24D15E490(v37, *((unint64_t *)&v37 + 1));
      }
      sub_24D169510();
      sub_24D1692B0();
      uint64_t result = sub_24D169540();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      int64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      *int64_t v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_24D15E7F8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858E88);
  char v36 = a2;
  uint64_t v6 = sub_24D169400();
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
    sub_24D169510();
    sub_24D1692B0();
    uint64_t result = sub_24D169540();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
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

void *sub_24D15EB10()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858E90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D1693F0();
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
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v24 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    unint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_24D15E490(v24, *((unint64_t *)&v24 + 1));
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

void *sub_24D15ECD8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858E88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D1693F0();
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

unsigned char *sub_24D15EE90@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_24D160714(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_24D1607D8((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_24D160854((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_24D15EF08(_DWORD *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_24D169510();
  sub_24D169530();
  uint64_t v6 = sub_24D169540();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_24D15F2D4(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(_DWORD *)(v9 + 4 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(_DWORD *)(v9 + 4 * v8) != a2);
  }
  uint64_t result = 0;
  LODWORD(a2) = *(_DWORD *)(*(void *)(*v2 + 48) + 4 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_24D15F028()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858DF0);
  uint64_t result = sub_24D169350();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
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
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                uint64_t v1 = v0;
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
      int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
      sub_24D169510();
      sub_24D169530();
      uint64_t result = sub_24D169540();
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
      *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_24D15F2D4(uint64_t result, unint64_t a2, char a3)
{
  int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_24D15F028();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_24D15F424();
      goto LABEL_14;
    }
    sub_24D15F5BC();
  }
  uint64_t v8 = *v3;
  sub_24D169510();
  sub_24D169530();
  uint64_t result = sub_24D169540();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for SecCSDigestAlgorithm(0);
      uint64_t result = sub_24D1694B0();
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
        if (*(_DWORD *)(v10 + 4 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(void *)(v12 + 48) + 4 * a2) = v5;
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

void *sub_24D15F424()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858DF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24D169340();
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
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
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

uint64_t sub_24D15F5BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858DF0);
  uint64_t result = sub_24D169350();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
    int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
    sub_24D169510();
    sub_24D169530();
    uint64_t result = sub_24D169540();
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
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
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

uint64_t sub_24D15F838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), unint64_t *a6, void (*a7)(uint64_t))
{
  uint64_t result = sub_24D168FF0();
  if (!result || (uint64_t result = sub_24D169010(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_24D169000();
      a5(0);
      sub_24D1606CC(a6, a7);
      return sub_24D1691F0();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24D15F918(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_24D15E21C((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_24D15F9F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_24D168FF0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_24D169010();
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
  sub_24D169000();
  sub_24D15E21C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_24D15FAA8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
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
        JUMPOUT(0x24D15FD10);
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
                  sub_24D15E490(a3, a4);
                  sub_24D15E490(a1, a2);
                  char v17 = sub_24D15F9F0((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_24D15A778(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_24D15E490(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_24D15F9F0(v21, v22, v20, a3, a4);
                  sub_24D15A778(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_24D15E490(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_24D15E490(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_24D15F918(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_24D15A778(v18, v19);
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

uint64_t _s11EDPSecurity20FileMeasurementErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(v4)
  {
    case 1:
      if (v7 != 1) {
        goto LABEL_28;
      }
      sub_24D1601B4(*(void *)a1, v3, 1);
      uint64_t v8 = v5;
      uint64_t v9 = v6;
      char v10 = 1;
      goto LABEL_8;
    case 2:
      if (v7 != 2) {
        goto LABEL_28;
      }
      sub_24D1601B4(*(void *)a1, v3, 2);
      uint64_t v8 = v5;
      uint64_t v9 = v6;
      char v10 = 2;
LABEL_8:
      sub_24D1601B4(v8, v9, v10);
      char v11 = v2 == v5;
      return v11 & 1;
    case 3:
      if (v2 | v3)
      {
        if (v7 == 3 && v5 == 1 && v6 == 0)
        {
          sub_24D1601B4(*(void *)a1, v3, 3);
          char v11 = 1;
          sub_24D1601B4(1, 0, 3);
          return v11 & 1;
        }
      }
      else if (v7 == 3 && (v6 | v5) == 0)
      {
        sub_24D1601B4(*(void *)a1, v3, 3);
        sub_24D1601B4(0, 0, 3);
        char v11 = 1;
        return v11 & 1;
      }
      goto LABEL_28;
    default:
      if (*(unsigned char *)(a2 + 16))
      {
        swift_bridgeObjectRetain();
LABEL_28:
        sub_24D160190(v5, v6, v7);
        sub_24D1601B4(v2, v3, v4);
        sub_24D1601B4(v5, v6, v7);
        char v11 = 0;
      }
      else
      {
        if (v2 == v5 && v3 == v6) {
          char v11 = 1;
        }
        else {
          char v11 = sub_24D1694A0();
        }
        sub_24D160190(v5, v6, 0);
        sub_24D160190(v2, v3, 0);
        sub_24D1601B4(v2, v3, 0);
        sub_24D1601B4(v5, v6, 0);
      }
      return v11 & 1;
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24D15FF84()
{
  unint64_t result = qword_269858E38;
  if (!qword_269858E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858E38);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_24D160028()
{
  unint64_t result = qword_269858E40;
  if (!qword_269858E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858E40);
  }
  return result;
}

unint64_t sub_24D16007C()
{
  unint64_t result = qword_269858E60;
  if (!qword_269858E60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269858E58);
    sub_24D160138();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858E60);
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

unint64_t sub_24D160138()
{
  unint64_t result = qword_269858E68;
  if (!qword_269858E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858E68);
  }
  return result;
}

uint64_t sub_24D160190(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for FileMeasurementError(uint64_t a1)
{
  return sub_24D1601B4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24D1601B4(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s11EDPSecurity20FileMeasurementErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24D160190(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FileMeasurementError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24D160190(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24D1601B4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FileMeasurementError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24D1601B4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileMeasurementError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FileMeasurementError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
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

uint64_t sub_24D160354(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_24D160370(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FileMeasurementError()
{
  return &type metadata for FileMeasurementError;
}

ValueMetadata *type metadata accessor for FileMeasurement()
{
  return &type metadata for FileMeasurement;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FileMeasurement.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FileMeasurement.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24D160514);
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

uint64_t sub_24D16053C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24D160544(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FileMeasurement.CodingKeys()
{
  return &type metadata for FileMeasurement.CodingKeys;
}

unint64_t sub_24D160564()
{
  unint64_t result = qword_269858E70;
  if (!qword_269858E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858E70);
  }
  return result;
}

unint64_t sub_24D1605BC()
{
  unint64_t result = qword_269858E78;
  if (!qword_269858E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858E78);
  }
  return result;
}

unint64_t sub_24D160614()
{
  unint64_t result = qword_269858E80;
  if (!qword_269858E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858E80);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24D1606CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D160714(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
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

uint64_t sub_24D1607D8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24D169020();
  swift_allocObject();
  uint64_t result = sub_24D168FE0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24D169180();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_24D160854(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_24D169020();
  swift_allocObject();
  uint64_t result = sub_24D168FE0();
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

uint64_t PackageSigner.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  uint64_t v4 = sub_24D169160();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t PackageSigner.certificateChain.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D16095C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D1609C8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D160A14(uint64_t a1)
{
  return sub_24D160B68(a1, &OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources, MEMORY[0x263F8EEA0]);
}

uint64_t (*sub_24D160A34())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24D160A90(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_24D160AFC()
{
  return swift_retain();
}

uint64_t sub_24D160B48(uint64_t a1)
{
  return sub_24D160B68(a1, &OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer, MEMORY[0x263F8EED8]);
}

uint64_t sub_24D160B68(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = (uint64_t *)(v3 + *a2);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *uint64_t v6 = a1;
  return a3(v7);
}

uint64_t (*sub_24D160BC8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24D160C24@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  swift_beginAccess();
  uint64_t v4 = sub_24D1691E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_24D160CAC(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_24D1691E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_24D160DC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  swift_beginAccess();
  uint64_t v4 = sub_24D1691E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_24D160E4C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  swift_beginAccess();
  uint64_t v4 = sub_24D1691E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_24D160ED8())()
{
  return j__swift_endAccess;
}

uint64_t PackageSigner.__allocating_init(_:_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  PackageSigner.init(_:_:)(a1, a2);
  return v4;
}

uint64_t PackageSigner.init(_:_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v27 = sub_24D1691E0();
  uint64_t v26 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24D169160();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a2 >> 62))
  {
    if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    type metadata accessor for PackageSignerError(0);
    sub_24D1630D8(&qword_269858EB8, (void (*)(uint64_t))type metadata accessor for PackageSignerError);
    swift_allocError();
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_24D1693E0();
  swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_9;
  }
LABEL_3:
  if ((sub_24D163C64() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for PackageSignerError(0);
    sub_24D1630D8(&qword_269858EB8, (void (*)(uint64_t))type metadata accessor for PackageSignerError);
    swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v18, a1, v9);
LABEL_10:
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
    goto LABEL_11;
  }
  v24[1] = v3;
  sub_24D1690F0();
  uint64_t v13 = v4 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v4 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url, v12, v9);
  id v14 = objc_msgSend(self, sel_defaultManager);
  v24[0] = v13;
  sub_24D169130();
  uint64_t v15 = sub_24D169260();
  uint64_t v25 = a1;
  uint64_t v16 = (void *)v15;
  swift_bridgeObjectRelease();
  LOBYTE(v13) = objc_msgSend(v14, sel_fileExistsAtPath_, v16);

  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for PackageSignerError(0);
    sub_24D1630D8(&qword_269858EB8, (void (*)(uint64_t))type metadata accessor for PackageSignerError);
    swift_allocError();
    uint64_t v19 = v24[0];
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 16))(v20, v24[0], v9);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v21(v25, v9);
    v21(v19, v9);
LABEL_11:
    type metadata accessor for PackageSigner(0);
    swift_deallocPartialClassInstance();
    return v4;
  }
  *(void *)(v4 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_certificateChain) = a2;
  *(void *)(v4 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources) = MEMORY[0x263F8EE80];
  type metadata accessor for FileMeasurer();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_24D15B1C0((uint64_t)&unk_26FF74C08);
  *(void *)(v4 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer) = v17;
  sub_24D1691D0();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v25, v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v4 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime, v8, v27);
  return v4;
}

uint64_t type metadata accessor for PackageSignerError(uint64_t a1)
{
  return sub_24D1614E0(a1, (uint64_t *)&unk_269858ED0);
}

uint64_t type metadata accessor for PackageSigner(uint64_t a1)
{
  return sub_24D1614E0(a1, (uint64_t *)&unk_269858EE0);
}

uint64_t sub_24D1614E0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D161518(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_beginAccess();
  if (*(void *)(*v7 + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_24D15AD30(a1, a2),
        char v9 = v8,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v9 & 1) != 0))
  {
    type metadata accessor for ResourceManifestError();
    sub_24D1630D8((unint64_t *)&qword_269858EC0, (void (*)(uint64_t))type metadata accessor for ResourceManifestError);
    swift_allocError();
    *uint64_t v10 = a1;
    v10[1] = a2;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v7;
    *uint64_t v7 = 0x8000000000000000;
    sub_24D162F68(v6, a1, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v7 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

uint64_t sub_24D1616C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *a3;
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_beginAccess();
  if (*(void *)(*v7 + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_24D15AD30(a1, a2),
        char v9 = v8,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v9 & 1) != 0))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v7;
    *uint64_t v7 = 0x8000000000000000;
    sub_24D162F68(v6, a1, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v7 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  else
  {
    type metadata accessor for PackageSignerError(0);
    sub_24D1630D8(&qword_269858EB8, (void (*)(uint64_t))type metadata accessor for PackageSignerError);
    swift_allocError();
    uint64_t *v12 = a1;
    v12[1] = a2;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
}

uint64_t sub_24D161868(uint64_t a1, uint64_t a2)
{
  uint64_t v104 = a2;
  uint64_t v103 = a1;
  uint64_t v117 = *MEMORY[0x263EF8340];
  uint64_t v100 = sub_24D169100();
  uint64_t v99 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  uint64_t v5 = (char *)v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24D169160();
  uint64_t v101 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24D1691E0();
  uint64_t v102 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)&v2[OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url];
  v108 = v2;
  uint64_t v13 = (uint64_t *)&v2[OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer];
  swift_beginAccess();
  uint64_t v14 = *v13;
  swift_retain();
  uint64_t v15 = sub_24D166364(v12, v14);
  if (!v3)
  {
    uint64_t v16 = (char *)v15;
    __int16 v95 = v11;
    uint64_t v96 = v9;
    v91[1] = v12;
    v92 = v5;
    int64_t v93 = v8;
    uint64_t v94 = v6;
    uint64_t v97 = 0;
    swift_release();
    uint64_t v17 = v108;
    uint64_t v18 = &v108[OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources];
    swift_beginAccess();
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = *(void *)(*(void *)v18 + 64);
    uint64_t v105 = *(void *)v18 + 64;
    uint64_t v21 = 1 << *(unsigned char *)(v19 + 32);
    uint64_t v22 = -1;
    if (v21 < 64) {
      uint64_t v22 = ~(-1 << v21);
    }
    unint64_t v23 = v22 & v20;
    uint64_t v98 = (uint64_t)v16;
    BOOL v24 = v16 + 24;
    uint64_t v107 = v19;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    int64_t v25 = 0;
    int64_t v106 = (unint64_t)(v21 + 63) >> 6;
    while (1)
    {
      if (v23)
      {
        unint64_t v27 = __clz(__rbit64(v23));
        uint64_t v28 = (v23 - 1) & v23;
        unint64_t v29 = v27 | (v25 << 6);
      }
      else
      {
        int64_t v30 = v25 + 1;
        if (__OFADD__(v25, 1)) {
          goto LABEL_47;
        }
        if (v30 >= v106)
        {
LABEL_38:
          swift_release();
          sub_24D1690C0();
          swift_allocObject();
          sub_24D1690B0();
          sub_24D169090();
          uint64_t aBlock = v98;
          type metadata accessor for ResourceManifest();
          sub_24D1630D8(&qword_269858EC8, (void (*)(uint64_t))type metadata accessor for ResourceManifest);
          uint64_t v58 = v97;
          uint64_t v59 = sub_24D1690A0();
          if (!v58)
          {
            uint64_t v62 = v59;
            int64_t v63 = v60;
            uint64_t v97 = 0;
            v108 = (char *)self;
            uint64_t v64 = (void *)sub_24D169190();
            sub_24D16235C(*(void *)&v17[OBJC_IVAR____TtC11EDPSecurity13PackageSigner_certificateChain]);
            int64_t v65 = v63;
            uint64_t v66 = sub_24D169300();
            uint64_t v109 = v62;
            uint64_t v67 = (void *)v66;
            swift_bridgeObjectRelease();
            uint64_t v68 = &v17[OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime];
            swift_beginAccess();
            uint64_t v69 = v102;
            size_t v70 = v95;
            int v71 = v68;
            uint64_t v72 = v96;
            (*(void (**)(char *, char *, uint64_t))(v102 + 16))(v95, v71, v96);
            uint64_t v73 = (void *)sub_24D1691C0();
            (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v72);
            uint64_t v74 = swift_allocObject();
            uint64_t v75 = v104;
            *(void *)(v74 + 16) = v103;
            *(void *)(v74 + 24) = v75;
            uint64_t v76 = swift_allocObject();
            *(void *)(v76 + 16) = sub_24D163130;
            *(void *)(v76 + 24) = v74;
            v114 = sub_24D163148;
            uint64_t v115 = v76;
            uint64_t aBlock = MEMORY[0x263EF8330];
            unint64_t v111 = 1107296256;
            v112 = sub_24D162684;
            v113 = &block_descriptor;
            uint64_t v77 = _Block_copy(&aBlock);
            swift_release();
            uint64_t aBlock = 0;
            id v78 = objc_msgSend(v108, sel_createSignature_withCertChain_withTime_withRemoteHandler_withError_, v64, v67, v73, v77, &aBlock);
            _Block_release(v77);

            id v79 = (id)aBlock;
            if (v78)
            {
              v108 = v65;
              uint64_t v80 = sub_24D1691A0();
              unint64_t v82 = v81;

              uint64_t aBlock = 0x727574616E676973;
              unint64_t v111 = 0xE900000000000065;
              uint64_t v83 = v99;
              int64_t v84 = v92;
              uint64_t v85 = v100;
              (*(void (**)(char *, void, uint64_t))(v99 + 104))(v92, *MEMORY[0x263F06E50], v100);
              sub_24D159624();
              size_t v86 = v93;
              sub_24D169150();
              (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v85);
              swift_bridgeObjectRelease();
              sub_24D1691B0();
              (*(void (**)(char *, uint64_t))(v101 + 8))(v86, v94);
              sub_24D15A778(v109, (unint64_t)v108);
              uint64_t v87 = v80;
              unint64_t v88 = v82;
            }
            else
            {
              v89 = v79;
              sub_24D1690E0();

              swift_willThrow();
              uint64_t v87 = v109;
              unint64_t v88 = (unint64_t)v65;
            }
            sub_24D15A778(v87, v88);
            swift_release();
          }
          swift_release();
          return swift_release();
        }
        unint64_t v31 = *(void *)(v105 + 8 * v30);
        ++v25;
        if (!v31)
        {
          int64_t v25 = v30 + 1;
          if (v30 + 1 >= v106) {
            goto LABEL_38;
          }
          unint64_t v31 = *(void *)(v105 + 8 * v25);
          if (!v31)
          {
            int64_t v25 = v30 + 2;
            if (v30 + 2 >= v106) {
              goto LABEL_38;
            }
            unint64_t v31 = *(void *)(v105 + 8 * v25);
            if (!v31)
            {
              int64_t v32 = v30 + 3;
              if (v32 >= v106) {
                goto LABEL_38;
              }
              unint64_t v31 = *(void *)(v105 + 8 * v32);
              if (!v31)
              {
                while (1)
                {
                  int64_t v25 = v32 + 1;
                  if (__OFADD__(v32, 1)) {
                    goto LABEL_48;
                  }
                  if (v25 >= v106) {
                    goto LABEL_38;
                  }
                  unint64_t v31 = *(void *)(v105 + 8 * v25);
                  ++v32;
                  if (v31) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v25 = v32;
            }
          }
        }
LABEL_22:
        uint64_t v28 = (v31 - 1) & v31;
        unint64_t v29 = __clz(__rbit64(v31)) + (v25 << 6);
      }
      uint64_t v33 = (uint64_t *)(*(void *)(v107 + 48) + 16 * v29);
      uint64_t v34 = *v33;
      uint64_t v35 = v33[1];
      uint64_t v36 = *(void *)(*(void *)(v107 + 56) + 8 * v29);
      uint64_t v37 = *(void *)(*v24 + 16);
      swift_bridgeObjectRetain();
      if (v37)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24D15AD30(v34, v35);
        char v39 = v38;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v39)
        {
          type metadata accessor for ResourceManifestError();
          sub_24D1630D8((unint64_t *)&qword_269858EC0, (void (*)(uint64_t))type metadata accessor for ResourceManifestError);
          swift_allocError();
          *uint64_t v61 = v34;
          v61[1] = v35;
          swift_storeEnumTagMultiPayload();
          swift_bridgeObjectRetain();
          swift_willThrow();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          return swift_release();
        }
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      uint64_t v109 = v28;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v40 = v24;
      uint64_t v41 = v36;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v116 = (void *)*v40;
      uint64_t v43 = v116;
      uint64_t v44 = v40;
      *uint64_t v40 = 0x8000000000000000;
      unint64_t v46 = sub_24D15AD30(v34, v35);
      uint64_t v47 = v43[2];
      BOOL v48 = (v45 & 1) == 0;
      uint64_t v49 = v47 + v48;
      if (__OFADD__(v47, v48))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
      }
      char v50 = v45;
      if (v43[3] >= v49)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          size_t v53 = v116;
          if (v45) {
            goto LABEL_5;
          }
        }
        else
        {
          sub_24D15ECD8();
          size_t v53 = v116;
          if (v50) {
            goto LABEL_5;
          }
        }
      }
      else
      {
        sub_24D15E7F8(v49, isUniquelyReferenced_nonNull_native);
        unint64_t v51 = sub_24D15AD30(v34, v35);
        if ((v50 & 1) != (v52 & 1))
        {
          uint64_t result = sub_24D1694C0();
          __break(1u);
          return result;
        }
        unint64_t v46 = v51;
        size_t v53 = v116;
        if (v50)
        {
LABEL_5:
          uint64_t v26 = v53[7];
          swift_bridgeObjectRelease();
          *(void *)(v26 + 8 * v46) = v41;
          goto LABEL_6;
        }
      }
      v53[(v46 >> 6) + 8] |= 1 << v46;
      uint64_t v54 = (uint64_t *)(v53[6] + 16 * v46);
      *uint64_t v54 = v34;
      v54[1] = v35;
      *(void *)(v53[7] + 8 * v46) = v41;
      uint64_t v55 = v53[2];
      BOOL v56 = __OFADD__(v55, 1);
      uint64_t v57 = v55 + 1;
      if (v56) {
        goto LABEL_46;
      }
      v53[2] = v57;
      swift_bridgeObjectRetain();
LABEL_6:
      BOOL v24 = v44;
      *uint64_t v44 = v53;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = v108;
      unint64_t v23 = v109;
    }
  }
  return swift_release();
}

char *sub_24D16235C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24D1693E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24D162E40(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x25331F020](i, a1);
        type metadata accessor for SecCertificate(0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24D162E40(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_24D162E40((char *)(v6 > 1), v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_24D163C50(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      char v8 = (id *)(a1 + 32);
      type metadata accessor for SecCertificate(0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24D162E40(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_24D162E40((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_24D163C50(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

id sub_24D162590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  id v8 = objc_msgSend(objc_allocWithZone((Class)SignatureResponse), sel_init);
  uint64_t v9 = a4(a1, a2, a3);
  unint64_t v11 = v10;
  uint64_t v12 = (void *)sub_24D169190();
  objc_msgSend(v8, sel_setSignature_, v12);

  sub_24D15A778(v9, v11);
  return v8;
}

id sub_24D162684(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a1 + 32);
  id v5 = a2;
  uint64_t v6 = sub_24D1691A0();
  unint64_t v8 = v7;

  uint64_t v9 = (void *)v4(v6, v8, a3);
  sub_24D15A778(v6, v8);
  return v9;
}

uint64_t static PackageSigner.signPackage(_:_:_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = sub_24D169160();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v14 + 16))(v13, a1);
  type metadata accessor for PackageSigner(0);
  uint64_t v15 = swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t result = PackageSigner.init(_:_:)((uint64_t)v13, a2);
  if (v5) {
    return result;
  }
  uint64_t v58 = 0;
  uint64_t v59 = a5;
  uint64_t v17 = *(void *)(a3 + 64);
  uint64_t v60 = v15;
  uint64_t v61 = a3 + 64;
  uint64_t v18 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & v17;
  uint64_t v21 = (void *)(v15 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  int64_t v22 = 0;
  int64_t v62 = (unint64_t)(v18 + 63) >> 6;
  uint64_t v63 = a4;
  while (1)
  {
    if (v20)
    {
      unint64_t v24 = __clz(__rbit64(v20));
      uint64_t v25 = (v20 - 1) & v20;
      unint64_t v26 = v24 | (v22 << 6);
    }
    else
    {
      int64_t v27 = v22 + 1;
      if (__OFADD__(v22, 1)) {
        goto LABEL_43;
      }
      if (v27 >= v62)
      {
LABEL_38:
        swift_release();
        sub_24D161868(a4, v59);
        return swift_release();
      }
      unint64_t v28 = *(void *)(v61 + 8 * v27);
      ++v22;
      if (!v28)
      {
        int64_t v22 = v27 + 1;
        if (v27 + 1 >= v62) {
          goto LABEL_38;
        }
        unint64_t v28 = *(void *)(v61 + 8 * v22);
        if (!v28)
        {
          int64_t v22 = v27 + 2;
          if (v27 + 2 >= v62) {
            goto LABEL_38;
          }
          unint64_t v28 = *(void *)(v61 + 8 * v22);
          if (!v28)
          {
            int64_t v29 = v27 + 3;
            if (v29 >= v62) {
              goto LABEL_38;
            }
            unint64_t v28 = *(void *)(v61 + 8 * v29);
            if (!v28)
            {
              while (1)
              {
                int64_t v22 = v29 + 1;
                if (__OFADD__(v29, 1)) {
                  goto LABEL_44;
                }
                if (v22 >= v62) {
                  goto LABEL_38;
                }
                unint64_t v28 = *(void *)(v61 + 8 * v22);
                ++v29;
                if (v28) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v22 = v29;
          }
        }
      }
LABEL_22:
      uint64_t v25 = (v28 - 1) & v28;
      unint64_t v26 = __clz(__rbit64(v28)) + (v22 << 6);
    }
    int64_t v30 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v26);
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(a3 + 56) + 8 * v26);
    uint64_t v34 = *(void *)(*v21 + 16);
    swift_bridgeObjectRetain();
    if (v34)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24D15AD30(v31, v32);
      char v36 = v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v36)
      {
        type metadata accessor for ResourceManifestError();
        sub_24D1630D8((unint64_t *)&qword_269858EC0, (void (*)(uint64_t))type metadata accessor for ResourceManifestError);
        swift_allocError();
        *uint64_t v57 = v31;
        v57[1] = v32;
        swift_storeEnumTagMultiPayload();
        swift_bridgeObjectRetain();
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return swift_release();
      }
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    unint64_t v64 = v25;
    int64_t v65 = v22;
    uint64_t v37 = a3;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v38 = v31;
    uint64_t v39 = v33;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = (void *)*v21;
    uint64_t v41 = v66;
    uint64_t v42 = v21;
    *uint64_t v21 = 0x8000000000000000;
    uint64_t v43 = v38;
    unint64_t v45 = sub_24D15AD30(v38, v32);
    uint64_t v46 = v41[2];
    BOOL v47 = (v44 & 1) == 0;
    uint64_t v48 = v46 + v47;
    if (__OFADD__(v46, v47)) {
      break;
    }
    char v49 = v44;
    if (v41[3] >= v48)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        char v52 = v66;
        if (v44) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_24D15ECD8();
        char v52 = v66;
        if (v49) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      sub_24D15E7F8(v48, isUniquelyReferenced_nonNull_native);
      unint64_t v50 = sub_24D15AD30(v43, v32);
      if ((v49 & 1) != (v51 & 1)) {
        goto LABEL_45;
      }
      unint64_t v45 = v50;
      char v52 = v66;
      if (v49)
      {
LABEL_5:
        uint64_t v23 = v52[7];
        swift_bridgeObjectRelease();
        *(void *)(v23 + 8 * v45) = v39;
        goto LABEL_6;
      }
    }
    v52[(v45 >> 6) + 8] |= 1 << v45;
    size_t v53 = (uint64_t *)(v52[6] + 16 * v45);
    *size_t v53 = v43;
    v53[1] = v32;
    *(void *)(v52[7] + 8 * v45) = v39;
    uint64_t v54 = v52[2];
    BOOL v55 = __OFADD__(v54, 1);
    uint64_t v56 = v54 + 1;
    if (v55) {
      goto LABEL_42;
    }
    v52[2] = v56;
    swift_bridgeObjectRetain();
LABEL_6:
    uint64_t v21 = v42;
    *uint64_t v42 = v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v37;
    a4 = v63;
    unint64_t v20 = v64;
    int64_t v22 = v65;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = sub_24D1694C0();
  __break(1u);
  return result;
}

uint64_t PackageSigner.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  uint64_t v2 = sub_24D169160();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  uint64_t v4 = sub_24D1691E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t PackageSigner.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  uint64_t v2 = sub_24D169160();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  uint64_t v4 = sub_24D1691E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

char *sub_24D162E40(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_24D162E60(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_24D162E60(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269858EF0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

uint64_t sub_24D162F68(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24D15AD30(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_24D15ECD8();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24D15E7F8(v15, a4 & 1);
  unint64_t v21 = sub_24D15AD30(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_24D1694C0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D1630D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D163120()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_24D163130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24D162590(a1, a2, a3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
}

uint64_t sub_24D163138()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D163148()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_24D163188@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D1631E4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t *initializeBufferWithCopyOfBuffer for PackageSignerError(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v10 = sub_24D169160();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for PackageSignerError(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v3 = sub_24D169160();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (result <= 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for PackageSignerError(void *a1, void *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = sub_24D169160();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for PackageSignerError(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24D163660((uint64_t)a1);
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v7 = sub_24D169160();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24D163660(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PackageSignerError(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for PackageSignerError(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_24D169160();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for PackageSignerError(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24D163660((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v6 = sub_24D169160();
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

uint64_t getEnumTagSinglePayload for PackageSignerError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for PackageSignerError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24D163890()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24D1638A0()
{
  uint64_t result = sub_24D169160();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24D163934()
{
  return type metadata accessor for PackageSigner(0);
}

uint64_t sub_24D16393C()
{
  uint64_t result = sub_24D169160();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24D1691E0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for PackageSigner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PackageSigner);
}

uint64_t dispatch thunk of PackageSigner.additionalResources.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of PackageSigner.additionalResources.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of PackageSigner.additionalResources.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of PackageSigner.measurer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of PackageSigner.measurer.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of PackageSigner.measurer.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of PackageSigner.signingTime.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of PackageSigner.signingTime.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of PackageSigner.signingTime.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of PackageSigner.__allocating_init(_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of PackageSigner.addResource(_:withMeasurement:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of PackageSigner.updateResource(_:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of PackageSigner.sign(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

_OWORD *sub_24D163C50(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24D163C64()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858F60);
  MEMORY[0x270FA5388]();
  unint64_t v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858F70);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D169CB0;
  uint64_t v3 = (void *)*MEMORY[0x263EFF6A8];
  *(void *)(inited + 32) = *MEMORY[0x263EFF6A8];
  id v4 = v3;
  sub_24D15AF90(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_24D169110();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_24D169050();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v1, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v1, 1, v5) == 1)
  {
    sub_24D166FA4((uint64_t)v1, &qword_269858F60);
  }
  else
  {
    char v8 = sub_24D169040();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v1, v5);
    if (v8 != 2) {
      return v8 & 1;
    }
  }
  return 0;
}

uint64_t sub_24D163E9C()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t sub_24D163ED0(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_24D163F10())()
{
  return j__swift_endAccess;
}

uint64_t sub_24D163F64(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D163FC4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D163FFC(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24D164044())()
{
  return j_j__swift_endAccess;
}

uint64_t ResourceManifest.__allocating_init()()
{
  type metadata accessor for ResourceManifest();
  uint64_t result = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE80];
  *(void *)(result + 16) = 1;
  *(void *)(result + 24) = v1;
  return result;
}

uint64_t type metadata accessor for ResourceManifest()
{
  return self;
}

unint64_t sub_24D1640F0()
{
  return 0xD000000000000014;
}

uint64_t sub_24D16422C()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v4 = v2 + 64;
  uint64_t v3 = v5;
  uint64_t v6 = 1 << *(unsigned char *)(*(void *)(v0 + 24) + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  uint64_t v8 = v7 & v3;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v12 = MEMORY[0x263F8EE88];
  if (v8) {
    goto LABEL_7;
  }
LABEL_8:
  while (2)
  {
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v11 >= v9) {
      goto LABEL_27;
    }
    uint64_t v14 = *(void *)(v4 + 8 * v11);
    if (!v14)
    {
      int64_t v15 = v11 + 1;
      if (v11 + 1 >= v9) {
        goto LABEL_27;
      }
      uint64_t v14 = *(void *)(v4 + 8 * v15);
      if (v14) {
        goto LABEL_17;
      }
      int64_t v15 = v11 + 2;
      if (v11 + 2 >= v9) {
        goto LABEL_27;
      }
      uint64_t v14 = *(void *)(v4 + 8 * v15);
      if (v14)
      {
LABEL_17:
        int64_t v11 = v15;
        goto LABEL_18;
      }
      int64_t v15 = v11 + 3;
      if (v11 + 3 < v9)
      {
        uint64_t v14 = *(void *)(v4 + 8 * v15);
        if (v14) {
          goto LABEL_17;
        }
        while (1)
        {
          int64_t v11 = v15 + 1;
          if (__OFADD__(v15, 1)) {
            break;
          }
          if (v11 >= v9) {
            goto LABEL_27;
          }
          uint64_t v14 = *(void *)(v4 + 8 * v11);
          ++v15;
          if (v14) {
            goto LABEL_18;
          }
        }
LABEL_37:
        __break(1u);
        return result;
      }
LABEL_27:
      swift_release();
      if (*(void *)(v12 + 16))
      {
        if (sub_24D167A00(5, v12))
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else if (sub_24D167A00(2, v12))
        {
          swift_bridgeObjectRelease();
          return 2;
        }
        else
        {
          sub_24D15B8FC();
          swift_allocError();
          *(void *)uint64_t v17 = 0;
          *(void *)(v17 + 8) = 0;
          *(unsigned char *)(v17 + 16) = 3;
          swift_willThrow();
          return swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        type metadata accessor for ResourceManifestError();
        sub_24D164E0C();
        swift_allocError();
        swift_storeEnumTagMultiPayload();
        return swift_willThrow();
      }
    }
LABEL_18:
    uint64_t v8 = (v14 - 1) & v14;
    while (!*(void *)(v12 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v12 = FileMeasurement.hashTypes()();
      uint64_t result = swift_bridgeObjectRelease();
      if (v1) {
        return swift_release();
      }
      if (!v8) {
        goto LABEL_8;
      }
LABEL_7:
      v8 &= v8 - 1;
    }
    swift_bridgeObjectRetain();
    FileMeasurement.hashTypes()();
    if (!v1)
    {
      swift_bridgeObjectRelease();
      uint64_t v16 = swift_bridgeObjectRetain();
      uint64_t v12 = sub_24D164C38(v16, v12);
      uint64_t result = swift_bridgeObjectRelease_n();
      if (!v8) {
        continue;
      }
      goto LABEL_7;
    }
    break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

BOOL sub_24D164518(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24D164530()
{
  return sub_24D169540();
}

uint64_t sub_24D164578()
{
  return sub_24D169520();
}

uint64_t sub_24D1645A4()
{
  return sub_24D169540();
}

uint64_t sub_24D1645E8()
{
  if (*v0) {
    return 0x656372756F736572;
  }
  else {
    return 0x6E6F6973726576;
  }
}

uint64_t sub_24D164628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24D166E3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24D164650(uint64_t a1)
{
  unint64_t v2 = sub_24D164E64();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24D16468C(uint64_t a1)
{
  unint64_t v2 = sub_24D164E64();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ResourceManifest.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ResourceManifest.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_24D164720(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269858EF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24D164E64();
  sub_24D169560();
  swift_beginAccess();
  char v12 = 0;
  sub_24D169470();
  if (!v2)
  {
    swift_beginAccess();
    uint64_t v11 = *(void *)(v3 + 24);
    v10[7] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269858F08);
    sub_24D164F0C(&qword_269858F10, (void (*)(void))sub_24D164EB8);
    sub_24D169480();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ResourceManifest.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  ResourceManifest.init(from:)(a1);
  return v2;
}

uint64_t ResourceManifest.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269858F20);
  uint64_t v5 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v1 + 16) = 1;
  uint64_t v8 = (uint64_t *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24D164E64();
  sub_24D169550();
  if (v2)
  {
    type metadata accessor for ResourceManifest();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v9 = v5;
    char v16 = 0;
    uint64_t v10 = v14;
    uint64_t v11 = sub_24D169440();
    swift_beginAccess();
    uint64_t *v8 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269858F08);
    char v15 = 1;
    sub_24D164F0C(&qword_269858F28, (void (*)(void))sub_24D164F88);
    sub_24D169450();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v10);
    *(void *)(v3 + 24) = v17;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_24D164B98@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for ResourceManifest();
  uint64_t v5 = swift_allocObject();
  uint64_t result = ResourceManifest.init(from:)(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_24D164BF0(void *a1)
{
  return sub_24D164720(a1);
}

unint64_t sub_24D164C14()
{
  return sub_24D1640F0();
}

uint64_t sub_24D164C38(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_24D165C28((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_24D165C28((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x25331F7D0](v8, -1, -1);
  }
  return v7;
}

uint64_t type metadata accessor for ResourceManifestError()
{
  uint64_t result = qword_269858F38;
  if (!qword_269858F38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24D164E0C()
{
  unint64_t result = qword_269858EC0;
  if (!qword_269858EC0)
  {
    type metadata accessor for ResourceManifestError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858EC0);
  }
  return result;
}

unint64_t sub_24D164E64()
{
  unint64_t result = qword_269858F00;
  if (!qword_269858F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858F00);
  }
  return result;
}

unint64_t sub_24D164EB8()
{
  unint64_t result = qword_269858F18;
  if (!qword_269858F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858F18);
  }
  return result;
}

uint64_t sub_24D164F0C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269858F08);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24D164F88()
{
  unint64_t result = qword_269858F30;
  if (!qword_269858F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858F30);
  }
  return result;
}

uint64_t sub_24D164FDC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return result;
}

uint64_t sub_24D165024(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_24D165068@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for ResourceManifest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ResourceManifest);
}

uint64_t dispatch thunk of ResourceManifest.version.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ResourceManifest.version.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ResourceManifest.version.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ResourceManifest.resources.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ResourceManifest.resources.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ResourceManifest.resources.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ResourceManifest.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of ResourceManifest.bestDigestAlgorithm()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of ResourceManifest.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of ResourceManifest.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

unsigned char *storeEnumTagSinglePayload for ResourceManifest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24D165330);
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

ValueMetadata *type metadata accessor for ResourceManifest.CodingKeys()
{
  return &type metadata for ResourceManifest.CodingKeys;
}

uint64_t *sub_24D165368(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_24D169160();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24D1654E0(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    return swift_bridgeObjectRelease();
  }
  else if (result <= 1)
  {
    uint64_t v3 = sub_24D169160();
    unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_24D165588(void *a1, void *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_24D169160();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24D1656BC(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24D165808((uint64_t)a1);
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_24D169160();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24D165808(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ResourceManifestError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_24D165864(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_24D169160();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24D165970(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24D165808((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_24D169160();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24D165A8C()
{
  uint64_t result = sub_24D169160();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_24D165B24()
{
  unint64_t result = qword_269858F48;
  if (!qword_269858F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858F48);
  }
  return result;
}

unint64_t sub_24D165B7C()
{
  unint64_t result = qword_269858F50;
  if (!qword_269858F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858F50);
  }
  return result;
}

unint64_t sub_24D165BD4()
{
  unint64_t result = qword_269858F58;
  if (!qword_269858F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858F58);
  }
  return result;
}

uint64_t sub_24D165C28(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = (unint64_t *)result;
  uint64_t v6 = 0;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v7 = 0;
    uint64_t v8 = a4 + 56;
    uint64_t v9 = 1 << *(unsigned char *)(a4 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(a4 + 56);
    int64_t v45 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = a3 + 56;
    while (1)
    {
LABEL_6:
      if (v11)
      {
        unint64_t v13 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v14 = v13 | (v7 << 6);
      }
      else
      {
        int64_t v15 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
          __break(1u);
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v15 >= v45) {
          goto LABEL_60;
        }
        unint64_t v16 = *(void *)(v8 + 8 * v15);
        ++v7;
        if (!v16)
        {
          int64_t v7 = v15 + 1;
          if (v15 + 1 >= v45) {
            goto LABEL_60;
          }
          unint64_t v16 = *(void *)(v8 + 8 * v7);
          if (!v16)
          {
            int64_t v7 = v15 + 2;
            if (v15 + 2 >= v45) {
              goto LABEL_60;
            }
            unint64_t v16 = *(void *)(v8 + 8 * v7);
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v45)
              {
LABEL_60:
                swift_retain();
                return sub_24D166048(v43, a2, v6, a3);
              }
              unint64_t v16 = *(void *)(v8 + 8 * v17);
              if (!v16)
              {
                while (1)
                {
                  int64_t v7 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    break;
                  }
                  if (v7 >= v45) {
                    goto LABEL_60;
                  }
                  unint64_t v16 = *(void *)(v8 + 8 * v7);
                  ++v17;
                  if (v16) {
                    goto LABEL_21;
                  }
                }
LABEL_63:
                __break(1u);
                goto LABEL_64;
              }
              int64_t v7 = v17;
            }
          }
        }
LABEL_21:
        unint64_t v11 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
      }
      int v18 = *(_DWORD *)(*(void *)(a4 + 48) + 4 * v14);
      sub_24D169510();
      sub_24D169530();
      unint64_t result = sub_24D169540();
      uint64_t v19 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      uint64_t v22 = 1 << v20;
      if (((1 << v20) & *(void *)(v12 + 8 * (v20 >> 6))) != 0)
      {
        uint64_t v23 = *(void *)(a3 + 48);
        if (*(_DWORD *)(v23 + 4 * v20) != v18)
        {
          for (unint64_t i = v20 + 1; ; unint64_t i = v25 + 1)
          {
            unint64_t v25 = i & ~v19;
            if (((*(void *)(v12 + ((v25 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v25) & 1) == 0) {
              goto LABEL_6;
            }
            if (*(_DWORD *)(v23 + 4 * v25) == v18) {
              break;
            }
          }
          unint64_t v21 = v25 >> 6;
          uint64_t v22 = 1 << v25;
        }
        v43[v21] |= v22;
        BOOL v26 = __OFADD__(v6++, 1);
        if (v26) {
          break;
        }
      }
    }
    __break(1u);
  }
  int64_t v27 = 0;
  uint64_t v44 = a3 + 56;
  uint64_t v28 = 1 << *(unsigned char *)(a3 + 32);
  if (v28 < 64) {
    uint64_t v29 = ~(-1 << v28);
  }
  else {
    uint64_t v29 = -1;
  }
  unint64_t v30 = v29 & *(void *)(a3 + 56);
  int64_t v46 = (unint64_t)(v28 + 63) >> 6;
  uint64_t v31 = a4 + 56;
  while (v30)
  {
    unint64_t v32 = __clz(__rbit64(v30));
    v30 &= v30 - 1;
    unint64_t v33 = v32 | (v27 << 6);
LABEL_52:
    int v37 = *(_DWORD *)(*(void *)(a3 + 48) + 4 * v33);
    sub_24D169510();
    sub_24D169530();
    unint64_t result = sub_24D169540();
    uint64_t v38 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v39 = result & ~v38;
    if ((*(void *)(v31 + ((v39 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v39))
    {
      uint64_t v40 = *(void *)(a4 + 48);
      if (*(_DWORD *)(v40 + 4 * v39) == v37)
      {
LABEL_57:
        *(unint64_t *)((char *)v43 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
        BOOL v26 = __OFADD__(v6++, 1);
        if (v26)
        {
          __break(1u);
          goto LABEL_60;
        }
      }
      else
      {
        uint64_t v41 = ~v38;
        while (1)
        {
          unint64_t v39 = (v39 + 1) & v41;
          if (((*(void *)(v31 + ((v39 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v39) & 1) == 0) {
            break;
          }
          if (*(_DWORD *)(v40 + 4 * v39) == v37) {
            goto LABEL_57;
          }
        }
      }
    }
  }
  int64_t v34 = v27 + 1;
  if (__OFADD__(v27, 1)) {
    goto LABEL_62;
  }
  if (v34 >= v46) {
    goto LABEL_60;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v34);
  ++v27;
  if (v35) {
    goto LABEL_51;
  }
  int64_t v27 = v34 + 1;
  if (v34 + 1 >= v46) {
    goto LABEL_60;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v27);
  if (v35) {
    goto LABEL_51;
  }
  int64_t v27 = v34 + 2;
  if (v34 + 2 >= v46) {
    goto LABEL_60;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v27);
  if (v35)
  {
LABEL_51:
    unint64_t v30 = (v35 - 1) & v35;
    unint64_t v33 = __clz(__rbit64(v35)) + (v27 << 6);
    goto LABEL_52;
  }
  int64_t v36 = v34 + 3;
  if (v36 >= v46) {
    goto LABEL_60;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v36);
  if (v35)
  {
    int64_t v27 = v36;
    goto LABEL_51;
  }
  while (1)
  {
    int64_t v27 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v27 >= v46) {
      goto LABEL_60;
    }
    unint64_t v35 = *(void *)(v44 + 8 * v27);
    ++v36;
    if (v35) {
      goto LABEL_51;
    }
  }
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_24D166048(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269858DF0);
  uint64_t result = sub_24D169360();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    int v18 = *(_DWORD *)(*(void *)(v4 + 48) + 4 * v14);
    sub_24D169510();
    sub_24D169530();
    uint64_t result = sub_24D169540();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_DWORD *)(*(void *)(v9 + 48) + 4 * v22) = v18;
    ++*(void *)(v9 + 16);
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
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24D1662B4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F9D8F0]();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  unint64_t v6 = sub_24D1692D0();
  if (v7) {
    unint64_t v6 = v5;
  }
  if (4 * v3 < v6 >> 14) {
    goto LABEL_14;
  }
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24D166364(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v66 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269858F60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v80 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269858F68);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24D169100();
  uint64_t v78 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24D169160();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  id v79 = (char *)&v63 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  unint64_t v22 = (char *)&v63 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v85 = (char *)&v63 - v24;
  MEMORY[0x270FA5388](v23);
  unint64_t v82 = (char *)&v63 - v25;
  uint64_t v69 = a1;
  if ((sub_24D163C64() & 1) == 0) {
    goto LABEL_26;
  }
  uint64_t v73 = (unsigned int (**)(void, void, void))v10;
  uint64_t v77 = v17;
  id v26 = objc_msgSend(self, sel_defaultManager);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_269858F70);
  uint64_t v27 = swift_allocObject();
  long long v75 = xmmword_24D169CB0;
  *(_OWORD *)(v27 + 16) = xmmword_24D169CB0;
  uint64_t v28 = (void *)*MEMORY[0x263EFF6A8];
  *(void *)(v27 + 32) = *MEMORY[0x263EFF6A8];
  id v74 = v28;
  uint64_t v29 = (void *)sub_24D169320();

  swift_bridgeObjectRelease();
  id v81 = v29;
  if (!v29)
  {
LABEL_26:
    type metadata accessor for ResourceManifestError();
    sub_24D164E0C();
    swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v62, v69, v13);
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  v84[0] = 0x727574616E676973;
  v84[1] = 0xE900000000000065;
  uint64_t v30 = v78;
  uint64_t v31 = v73;
  (*(void (**)(char *, void, unsigned int (**)(void, void, void)))(v78 + 104))(v12, *MEMORY[0x263F06E50], v73);
  sub_24D159624();
  sub_24D169150();
  (*(void (**)(char *, unsigned int (**)(void, void, void)))(v30 + 8))(v12, v31);
  swift_bridgeObjectRelease();
  uint64_t v78 = v14 + 56;
  uint64_t v73 = (unsigned int (**)(void, void, void))(v14 + 48);
  int v71 = (void (**)(char *, char *, uint64_t))(v14 + 32);
  unint64_t v32 = (void (**)(void, void, void))(v14 + 16);
  unint64_t v33 = (void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v65 = MEMORY[0x263F8EE80];
  uint64_t v72 = MEMORY[0x263F8EE58] + 8;
  size_t v70 = v32;
  uint64_t v67 = v9;
  while (1)
  {
    if (objc_msgSend(v81, sel_nextObject))
    {
      sub_24D169330();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v83, 0, sizeof(v83));
    }
    sub_24D166F3C((uint64_t)v83, (uint64_t)v84);
    if (!v84[3])
    {
      sub_24D166FA4((uint64_t)v84, &qword_269858F78);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v78)(v9, 1, 1, v13);
LABEL_28:

      (*v33)(v82, v13);
      sub_24D166FA4((uint64_t)v9, &qword_269858F68);
      type metadata accessor for ResourceManifest();
      uint64_t result = swift_allocObject();
      *(void *)(result + 16) = 1;
      *(void *)(result + 24) = v65;
      return result;
    }
    int v34 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))v78)(v9, v34 ^ 1u, 1, v13);
    if ((*v73)(v9, 1, v13) == 1) {
      goto LABEL_28;
    }
    (*v71)(v85, v9, v13);
    sub_24D1690F0();
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v75;
    int64_t v36 = v74;
    *(void *)(inited + 32) = v74;
    id v37 = v36;
    sub_24D15AF90(inited);
    swift_setDeallocating();
    type metadata accessor for URLResourceKey(0);
    swift_arrayDestroy();
    uint64_t v38 = (uint64_t)v80;
    sub_24D169110();
    if (v3)
    {
      MEMORY[0x25331F6C0](v3);
      swift_bridgeObjectRelease();
      uint64_t v39 = sub_24D169050();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v38, 1, 1, v39);
      uint64_t v3 = 0;
LABEL_13:
      sub_24D166FA4(v38, &qword_269858F60);
      uint64_t v43 = (void (*)(char *, char *, uint64_t))*v32;
      uint64_t v44 = v77;
      int64_t v45 = v79;
LABEL_14:
      v43(v45, v22, v13);
      v43(v44, v82, v13);
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
    uint64_t v40 = sub_24D169050();
    uint64_t v41 = v38;
    uint64_t v42 = *(void *)(v40 - 8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v41, 0, 1, v40);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v41, 1, v40) == 1)
    {
      uint64_t v38 = v41;
      goto LABEL_13;
    }
    uint64_t v68 = 0;
    char v48 = sub_24D169040();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v40);
    uint64_t v43 = (void (*)(char *, char *, uint64_t))*v32;
    if (v48 == 2)
    {
      uint64_t v3 = v68;
      uint64_t v44 = v77;
      int64_t v45 = v79;
      uint64_t v9 = v67;
      goto LABEL_14;
    }
    int64_t v45 = v79;
    v43(v79, v22, v13);
    uint64_t v44 = v77;
    v43(v77, v82, v13);
    if (v48)
    {
      BOOL v47 = *v33;
      (*v33)(v44, v13);
      v47(v45, v13);
      uint64_t v3 = v68;
      uint64_t v9 = v67;
LABEL_16:
      v47(v22, v13);
      v47(v85, v13);
      goto LABEL_17;
    }
    uint64_t v3 = v68;
    uint64_t v9 = v67;
LABEL_15:
    char v46 = MEMORY[0x25331EDC0](v45, v44);
    BOOL v47 = *v33;
    (*v33)(v44, v13);
    v47(v45, v13);
    if (v46) {
      goto LABEL_16;
    }
    sub_24D168A38(v84);
    if (v3)
    {

      v47(v22, v13);
      v47(v85, v13);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, uint64_t))v47)(v82, v13);
    }
    uint64_t v64 = v84[0];
    uint64_t v68 = sub_24D169130();
    uint64_t v49 = sub_24D169130();
    unint64_t v51 = v50;
    uint64_t v68 = sub_24D1692C0();
    swift_bridgeObjectRelease();
    uint64_t result = v68 + 1;
    if (__OFADD__(v68, 1)) {
      break;
    }
    uint64_t v53 = sub_24D1662B4(result, v49, v51);
    uint64_t v68 = v54;
    uint64_t v63 = v55;
    uint64_t v57 = v56;
    swift_bridgeObjectRelease();
    uint64_t v68 = MEMORY[0x25331EF40](v53, v68, v63, v57);
    uint64_t v59 = v58;
    swift_bridgeObjectRelease();
    uint64_t v60 = v65;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v84[0] = v60;
    sub_24D162F68(v64, v68, v59, isUniquelyReferenced_nonNull_native);
    uint64_t v65 = v84[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v47(v22, v13);
    v47(v85, v13);
LABEL_17:
    unint64_t v32 = v70;
  }
  __break(1u);
  return result;
}

uint64_t sub_24D166E3C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_24D1694A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656372756F736572 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24D1694A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24D166F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269858F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D166FA4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t PackageValidator.init(signatureData:requireTrust:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v5 = v3;
  v41[1] = *(id *)MEMORY[0x263EF8340];
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  sub_24D167584(a1, a2);
  sub_24D15B304(0, 0xF000000000000000);
  *(unsigned char *)(v3 + 32) = 0;
  unint64_t v9 = *(void *)(v3 + 48);
  if (v9 >> 60 == 15)
  {
    sub_24D1595D0();
    swift_allocError();
    *(void *)(v10 + 8) = 0;
    *(void *)(v10 + 16) = 0;
    *(void *)uint64_t v10 = 1;
    *(unsigned char *)(v10 + 24) = 5;
    swift_willThrow();
    sub_24D15B304(a1, a2);
LABEL_13:
    sub_24D15B304(*(void *)(v5 + 40), *(void *)(v5 + 48));
    type metadata accessor for PackageValidator();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = *(void *)(v3 + 40);
    switch(v9 >> 62)
    {
      case 1uLL:
        uint64_t v25 = (int)v11;
        uint64_t v26 = v11 >> 32;
        goto LABEL_10;
      case 2uLL:
        uint64_t v25 = *(void *)(v11 + 16);
        uint64_t v26 = *(void *)(v11 + 24);
LABEL_10:
        sub_24D15E490(*(void *)(v5 + 40), v9);
        if (v25 == v26) {
          goto LABEL_11;
        }
        goto LABEL_5;
      case 3uLL:
        goto LABEL_11;
      default:
        if ((v9 & 0xFF000000000000) == 0)
        {
LABEL_11:
          sub_24D1595D0();
          swift_allocError();
          *(void *)(v27 + 8) = 0;
          *(void *)(v27 + 16) = 0;
          *(void *)uint64_t v27 = 1;
          *(unsigned char *)(v27 + 24) = 5;
          swift_willThrow();
          sub_24D15B304(a1, a2);
          sub_24D15B304(v11, v9);
          goto LABEL_13;
        }
LABEL_5:
        uint64_t v12 = self;
        uint64_t v13 = sub_24D169190();
        char v14 = a3;
        uint64_t v15 = (void *)v13;
        v41[0] = 0;
        char v38 = v14;
        id v16 = objc_msgSend(v12, sel_validateSignature_requireTrust_withError_, v13, v14 & 1, v41);

        id v17 = v41[0];
        if (!v16)
        {
          id v28 = v41[0];
          uint64_t v29 = (void *)sub_24D1690E0();

          swift_willThrow();
          sub_24D1595D0();
          swift_allocError();
          *(void *)(v30 + 8) = 0;
          *(void *)(v30 + 16) = 0;
          *(void *)uint64_t v30 = v29;
          *(unsigned char *)(v30 + 24) = 0;
          id v31 = v29;
          swift_willThrow();
          sub_24D15B304(a1, a2);
          sub_24D15B304(v11, v9);
          MEMORY[0x25331F6C0](v29);
          goto LABEL_13;
        }
        uint64_t v40 = v11;
        sub_24D169080();
        swift_allocObject();
        id v18 = v17;
        id v19 = v16;
        sub_24D169070();
        type metadata accessor for ResourceManifest();
        id v39 = v19;
        id v20 = objc_msgSend(v19, sel_validatedData);
        uint64_t v21 = sub_24D1691A0();
        unint64_t v23 = v22;

        sub_24D1675BC();
        sub_24D169060();
        sub_24D15A778(v21, v23);
        if (v4)
        {
          sub_24D1595D0();
          swift_allocError();
          *(void *)(v24 + 8) = 0;
          *(void *)(v24 + 16) = 0;
          *(void *)uint64_t v24 = 2;
          *(unsigned char *)(v24 + 24) = 5;
          swift_willThrow();
          sub_24D15B304(a1, a2);

          sub_24D15B304(v40, v9);
          swift_release();
          MEMORY[0x25331F6C0](v4);
          goto LABEL_13;
        }
        *(id *)(v5 + 16) = v41[0];
        *(unsigned char *)(v5 + 32) = objc_msgSend(v39, sel_isTrusted);
        id v33 = objc_msgSend(v39, sel_certificateChain);
        uint64_t v34 = sub_24D169310();

        uint64_t v35 = sub_24D167BC0(v34);
        swift_bridgeObjectRelease();
        if (!v35)
        {
          sub_24D1595D0();
          swift_allocError();
          *(void *)(v36 + 8) = 0;
          *(void *)(v36 + 16) = 0;
          *(void *)uint64_t v36 = 4;
          *(unsigned char *)(v36 + 24) = 5;
          swift_willThrow();
          sub_24D15B304(a1, a2);

          sub_24D15B304(v40, v9);
          swift_release();
          swift_release();
          goto LABEL_13;
        }
        *(void *)(v5 + 24) = v35;
        if ((v38 & 1) != 0 && (*(unsigned char *)(v5 + 32) & 1) == 0)
        {
          sub_24D1595D0();
          swift_allocError();
          *(void *)(v37 + 8) = 0;
          *(void *)(v37 + 16) = 0;
          *(void *)uint64_t v37 = 3;
          *(unsigned char *)(v37 + 24) = 5;
          swift_willThrow();
          sub_24D15B304(a1, a2);

          sub_24D15B304(v40, v9);
          swift_release();

          swift_release();
        }
        else
        {
          swift_release();

          sub_24D15B304(a1, a2);
          sub_24D15B304(v40, v9);
        }
        break;
    }
  }
  return v5;
}

uint64_t sub_24D167584(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24D15E490(a1, a2);
  }
  return a1;
}

uint64_t type metadata accessor for PackageValidator()
{
  return self;
}

unint64_t sub_24D1675BC()
{
  unint64_t result = qword_269858F80;
  if (!qword_269858F80)
  {
    type metadata accessor for ResourceManifest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269858F80);
  }
  return result;
}

uint64_t PackageValidator.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_24D15B304(*(void *)(v0 + 40), *(void *)(v0 + 48));
  return v0;
}

uint64_t sub_24D167644()
{
  return swift_retain();
}

uint64_t sub_24D16767C(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*sub_24D1676C4())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_24D167718())()
{
  return j__swift_endAccess;
}

uint64_t sub_24D16776C()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_24D167774(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  swift_beginAccess();
  uint64_t v10 = *(void *)(v4 + 16);
  swift_beginAccess();
  if (!*(void *)(*(void *)(v10 + 24) + 16)) {
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24D15AD30(a1, a2);
  if ((v11 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    sub_24D1595D0();
    swift_allocError();
    *(void *)uint64_t v19 = a1;
    *(void *)(v19 + 8) = a2;
    *(void *)(v19 + 16) = 0;
    *(unsigned char *)(v19 + 24) = 3;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = FileMeasurement.hashTypes()();
  if (v5) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v13 = v12;
  unsigned int v14 = 5;
  if (sub_24D167A00(5, v12) || (unsigned int v14 = 2, sub_24D167A00(2, v13)))
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_24D15B968(a3, a4, v14);
    unint64_t v17 = v16;
    uint64_t v21 = FileMeasurement.hashData(forDigestAlgorithm:)(v14);
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    char v24 = sub_24D15FAA8(v15, v17, v21, v23);
    if ((v24 & 1) == 0)
    {
      sub_24D1595D0();
      swift_allocError();
      *(void *)uint64_t v25 = a1;
      *(void *)(v25 + 8) = a2;
      *(void *)(v25 + 16) = 0;
      *(unsigned char *)(v25 + 24) = 1;
      swift_bridgeObjectRetain();
      swift_willThrow();
    }
    sub_24D15A778(v21, v23);
    return sub_24D15A778(v15, v17);
  }
  else
  {
    sub_24D15B8FC();
    swift_allocError();
    *(void *)uint64_t v20 = 0;
    *(void *)(v20 + 8) = 0;
    *(unsigned char *)(v20 + 16) = 3;
    swift_willThrow();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

BOOL sub_24D167A00(int a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_24D169510();
  sub_24D169530();
  uint64_t v4 = sub_24D169540();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(_DWORD *)(v8 + 4 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_24D167AF8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_retain();
  return swift_release();
}

uint64_t PackageValidator.__allocating_init(signatureData:requireTrust:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  PackageValidator.init(signatureData:requireTrust:)(a1, a2, a3);
  return v6;
}

uint64_t sub_24D167BC0(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24D1693B0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_24D1684E8(i, (uint64_t)v5);
    type metadata accessor for SecCertificate(0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_24D169390();
    sub_24D1693C0();
    sub_24D1693D0();
    sub_24D1693A0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t PackageValidator.__allocating_init(signatureData:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 216))(a1, a2, 1);
}

uint64_t PackageValidator.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_24D15B304(*(void *)(v0 + 40), *(void *)(v0 + 48));
  return MEMORY[0x270FA0228](v0, 56, 7);
}

BOOL _s11EDPSecurity21PackageValidatorErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  char v8 = *(unsigned char *)(a1 + 24);
  char v9 = *(unsigned char *)(a2 + 24);
  sub_24D1595D0();
  uint64_t v10 = swift_allocError();
  *(void *)uint64_t v11 = v2;
  *(void *)(v11 + 8) = v3;
  *(void *)(v11 + 16) = v4;
  *(unsigned char *)(v11 + 24) = v8;
  sub_24D167FE8(v2, v3, v4, v8);
  int v12 = (void *)sub_24D1690D0();
  MEMORY[0x25331F6C0](v10);
  uint64_t v13 = swift_allocError();
  *(void *)uint64_t v14 = v5;
  *(void *)(v14 + 8) = v6;
  *(void *)(v14 + 16) = v7;
  *(unsigned char *)(v14 + 24) = v9;
  sub_24D167FE8(v5, v6, v7, v9);
  uint64_t v15 = (void *)sub_24D1690D0();
  MEMORY[0x25331F6C0](v13);
  id v16 = objc_msgSend(v12, sel_domain);
  uint64_t v17 = sub_24D169290();
  uint64_t v19 = v18;

  id v20 = objc_msgSend(v15, sel_domain);
  uint64_t v21 = sub_24D169290();
  uint64_t v23 = v22;

  if (v17 == v21 && v19 == v23)
  {
    swift_bridgeObjectRelease_n();
LABEL_5:
    id v25 = objc_msgSend(v12, sel_code);
    id v26 = objc_msgSend(v15, sel_code);

    return v25 == v26;
  }
  char v24 = sub_24D1694A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v24) {
    goto LABEL_5;
  }

  return 0;
}

uint64_t sub_24D167F14@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_retain();
}

uint64_t sub_24D167F64@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t initializeBufferWithCopyOfBuffer for PackageValidatorError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_24D167FE8(id result, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
      BOOL result = result;
      break;
    case 1:
    case 2:
    case 3:
      goto LABEL_6;
    case 4:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_6:
      BOOL result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for PackageValidatorError(uint64_t a1)
{
  return sub_24D1680B4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_24D1680B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
      JUMPOUT(0x25331F6C0);
    case 1:
    case 2:
    case 3:
      goto LABEL_6;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_6:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for PackageValidatorError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24D167FE8(*(id *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for PackageValidatorError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24D167FE8(*(id *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_24D1680B4(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PackageValidatorError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_24D1680B4(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PackageValidatorError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PackageValidatorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 251;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24D168330(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 4u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_24D168348(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 5;
  if (a2 >= 5)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 5;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PackageValidatorError()
{
  return &type metadata for PackageValidatorError;
}

uint64_t method lookup function for PackageValidator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PackageValidator);
}

uint64_t dispatch thunk of PackageValidator.manifest.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of PackageValidator.manifest.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of PackageValidator.manifest.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of PackageValidator.certificateChain.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of PackageValidator.certificateChain.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of PackageValidator.certificateChain.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of PackageValidator.isTrustedSignature.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of PackageValidator.__allocating_init(signatureData:requireTrust:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of PackageValidator.validateResource(_:withData:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t sub_24D1684E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t FileMeasurer.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  FileMeasurer.init(_:)(a1);
  return v2;
}

uint64_t FileMeasurer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_24D15B1C0((uint64_t)&unk_26FF74C30);
  return v0;
}

uint64_t sub_24D1685D8()
{
  uint64_t result = sub_24D15B1C0((uint64_t)&unk_26FF74AC8);
  qword_269858FC0 = result;
  return result;
}

uint64_t sub_24D168600(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D168660()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D168698(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t FileMeasurer.init()()
{
  *(void *)(v0 + 16) = sub_24D15B1C0((uint64_t)&unk_26FF74C58);
  return v0;
}

uint64_t FileMeasurer.init(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = sub_24D15B1C0((uint64_t)&unk_26FF74AF0);
  uint64_t v3 = a1 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
LABEL_5:
  while (v6)
  {
    unint64_t v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_18:
    uint64_t v15 = *(unsigned int *)(*(void *)(a1 + 48) + 4 * v11);
    if (qword_269858D98 != -1) {
      swift_once();
    }
    uint64_t v16 = qword_269858FC0;
    if (!*(void *)(qword_269858FC0 + 16)) {
      goto LABEL_31;
    }
    sub_24D169510();
    sub_24D169530();
    uint64_t result = sub_24D169540();
    uint64_t v17 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v18 = result & ~v17;
    if (((*(void *)(v16 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      goto LABEL_31;
    }
    uint64_t v19 = *(void *)(v16 + 48);
    if (*(_DWORD *)(v19 + 4 * v18) != v15)
    {
      uint64_t v20 = ~v17;
      while (1)
      {
        unint64_t v18 = (v18 + 1) & v20;
        if (((*(void *)(v16 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
          break;
        }
        if (*(_DWORD *)(v19 + 4 * v18) == v15) {
          goto LABEL_5;
        }
      }
LABEL_31:
      uint64_t v21 = v1;
      swift_release();
      swift_bridgeObjectRelease();
      sub_24D15B8FC();
      swift_allocError();
      *(void *)uint64_t v22 = v15;
      *(void *)(v22 + 8) = 0;
      *(unsigned char *)(v22 + 16) = 1;
      swift_willThrow();
      swift_release();
      return v21;
    }
  }
  if (__OFADD__(v9++, 1))
  {
    __break(1u);
    goto LABEL_35;
  }
  if (v9 >= v7) {
    goto LABEL_33;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v9);
  if (v13)
  {
LABEL_17:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_18;
  }
  int64_t v14 = v9 + 1;
  if (v9 + 1 >= v7) {
    goto LABEL_33;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v9 + 2;
  if (v9 + 2 >= v7) {
    goto LABEL_33;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v9 + 3;
  if (v9 + 3 >= v7)
  {
LABEL_33:
    swift_release();
    uint64_t v21 = v1;
    swift_beginAccess();
    *(void *)(v1 + 16) = a1;
    swift_bridgeObjectRelease();
    return v21;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
LABEL_16:
    int64_t v9 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_33;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_17;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t static FileMeasurer.measureFile(_:)@<X0>(void *a1@<X8>)
{
  type metadata accessor for FileMeasurer();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = sub_24D15B1C0((uint64_t)&unk_26FF74C80);
  sub_24D168A38(a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D168A38@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v4 + 56);
  uint64_t v43 = v4 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v44 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v45 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  unint64_t v10 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v9 << 6);
    }
    else
    {
      BOOL v14 = __OFADD__(v9++, 1);
      if (v14) {
        goto LABEL_42;
      }
      if (v9 >= v44)
      {
LABEL_38:
        swift_release();
        return sub_24D15C6D8((uint64_t)v10, a1);
      }
      unint64_t v15 = *(void *)(v43 + 8 * v9);
      if (!v15)
      {
        int64_t v16 = v9 + 1;
        if (v9 + 1 >= v44) {
          goto LABEL_38;
        }
        unint64_t v15 = *(void *)(v43 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 2;
          if (v9 + 2 >= v44) {
            goto LABEL_38;
          }
          unint64_t v15 = *(void *)(v43 + 8 * v16);
          if (!v15)
          {
            int64_t v16 = v9 + 3;
            if (v9 + 3 >= v44) {
              goto LABEL_38;
            }
            unint64_t v15 = *(void *)(v43 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                int64_t v9 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_43;
                }
                if (v9 >= v44) {
                  goto LABEL_38;
                }
                unint64_t v15 = *(void *)(v43 + 8 * v9);
                ++v16;
                if (v15) {
                  goto LABEL_18;
                }
              }
            }
          }
        }
        int64_t v9 = v16;
      }
LABEL_18:
      unint64_t v8 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v9 << 6);
    }
    uint64_t v17 = *(unsigned int *)(*(void *)(v45 + 48) + 4 * v13);
    if (v17 == 2)
    {
      uint64_t v18 = 0x3268736168;
    }
    else
    {
      if (v17 != 5)
      {
        sub_24D15B8FC();
        swift_allocError();
        *(void *)uint64_t v41 = v17;
        *(void *)(v41 + 8) = 0;
        *(unsigned char *)(v41 + 16) = 1;
        swift_willThrow();
        swift_bridgeObjectRelease();
        return swift_release();
      }
      uint64_t v18 = 0x3568736168;
    }
    uint64_t v46 = v18;
    uint64_t v19 = sub_24D169170();
    if (v3)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t v21 = v19;
    unint64_t v22 = v20;
    uint64_t v3 = 0;
    uint64_t v23 = sub_24D15B968(v19, v20, v17);
    unint64_t v25 = v24;
    int64_t v26 = v9;
    sub_24D15A778(v21, v22);
    sub_24D15E490(v23, v25);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v29 = sub_24D15AD30(v46, 0xE500000000000000);
    uint64_t v30 = v10[2];
    BOOL v31 = (v28 & 1) == 0;
    uint64_t v32 = v30 + v31;
    if (__OFADD__(v30, v31)) {
      break;
    }
    char v33 = v28;
    if (v10[3] >= v32)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_24D15EB10();
      }
    }
    else
    {
      sub_24D15E4E8(v32, isUniquelyReferenced_nonNull_native);
      unint64_t v34 = sub_24D15AD30(v46, 0xE500000000000000);
      if ((v33 & 1) != (v35 & 1)) {
        goto LABEL_44;
      }
      unint64_t v29 = v34;
    }
    int64_t v9 = v26;
    if (v33)
    {
      uint64_t v11 = v10[7] + 16 * v29;
      sub_24D15A778(*(void *)v11, *(void *)(v11 + 8));
      *(void *)uint64_t v11 = v23;
      *(void *)(v11 + 8) = v25;
    }
    else
    {
      v10[(v29 >> 6) + 8] |= 1 << v29;
      uint64_t v36 = (uint64_t *)(v10[6] + 16 * v29);
      *uint64_t v36 = v46;
      v36[1] = 0xE500000000000000;
      uint64_t v37 = (uint64_t *)(v10[7] + 16 * v29);
      *uint64_t v37 = v23;
      v37[1] = v25;
      uint64_t v38 = v10[2];
      BOOL v14 = __OFADD__(v38, 1);
      uint64_t v39 = v38 + 1;
      if (v14) {
        goto LABEL_41;
      }
      void v10[2] = v39;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24D15A778(v23, v25);
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  uint64_t result = sub_24D1694C0();
  __break(1u);
  return result;
}

uint64_t FileMeasurer.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FileMeasurer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for FileMeasurer()
{
  return self;
}

uint64_t sub_24D168E98@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for FileMeasurer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FileMeasurer);
}

uint64_t dispatch thunk of FileMeasurer.hashingAlgorithms.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of FileMeasurer.hashingAlgorithms.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of FileMeasurer.hashingAlgorithms.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of FileMeasurer.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FileMeasurer.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of FileMeasurer.measureFile(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_24D168FE0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24D168FF0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24D169000()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24D169010()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24D169020()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24D169030()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_24D169040()
{
  return MEMORY[0x270EEEEF0]();
}

uint64_t sub_24D169050()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_24D169060()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_24D169070()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_24D169080()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_24D169090()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_24D1690A0()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_24D1690B0()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_24D1690C0()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_24D1690D0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24D1690E0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24D1690F0()
{
  return MEMORY[0x270EEFBB0]();
}

uint64_t sub_24D169100()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_24D169110()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_24D169120()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_24D169130()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_24D169140()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_24D169150()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_24D169160()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24D169170()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24D169180()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24D169190()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24D1691A0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24D1691B0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_24D1691C0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24D1691D0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24D1691E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24D1691F0()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_24D169200()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_24D169210()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_24D169220()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_24D169230()
{
  return MEMORY[0x270EEAAC8]();
}

uint64_t sub_24D169240()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_24D169250()
{
  return MEMORY[0x270EEB0B0]();
}

uint64_t sub_24D169260()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D169270()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24D169280()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24D169290()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D1692A0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24D1692B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24D1692C0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24D1692D0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24D1692E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D169300()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24D169310()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24D169320()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_24D169330()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D169340()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24D169350()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24D169360()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24D169370()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D169380()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24D169390()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24D1693A0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24D1693B0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24D1693C0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24D1693D0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24D1693E0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24D1693F0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24D169400()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24D169410()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24D169430()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24D169440()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24D169450()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24D169460()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24D169470()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24D169480()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24D169490()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24D1694A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24D1694B0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24D1694C0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24D1694D0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24D1694E0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24D1694F0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24D169500()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24D169510()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D169520()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24D169530()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24D169540()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24D169550()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24D169560()
{
  return MEMORY[0x270F9FD98]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x270EFD950](identityRef, privateKeyRef);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x270EFD998](key);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x270EFDB48]();
}

uint64_t SecPolicyCreateEDPSigning()
{
  return MEMORY[0x270EFDB68]();
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}