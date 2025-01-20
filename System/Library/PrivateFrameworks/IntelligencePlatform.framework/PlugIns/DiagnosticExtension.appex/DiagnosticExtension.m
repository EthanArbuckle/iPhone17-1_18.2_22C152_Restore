void *sub_10000548C()
{
  return &_swiftEmptyArrayStorage;
}

id sub_1000054F0(uint64_t a1)
{
  id v4 = [objc_allocWithZone((Class)GDXPCSysdiagnoseService) init];
  sub_100007230();
  sub_100005E68((uint64_t)v81, a1, &v82);
  sub_100006024((uint64_t)v81);
  v5 = &_s10Foundation22_convertNSErrorToErrorys0E0_pSo0C0CSgF_ptr;
  if (!v83)
  {
    sub_100006078((uint64_t)&v82);
    goto LABEL_9;
  }
  uint64_t v6 = swift_dynamicCast();
  if (!v6)
  {
LABEL_9:
    sub_100006CE8();
    if (!v14) {
      swift_once();
    }
    uint64_t v15 = sub_100007130();
    sub_10000611C(v15, (uint64_t)static Logging.defaultLog);
    v16 = sub_100007120();
    os_log_type_t v17 = sub_1000071E0();
    uint64_t v8 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (_WORD *)swift_slowAlloc();
      _WORD *v18 = 0;
      sub_100006DA8((void *)&_mh_execute_header, v19, v20, "Skipping collection of entityTagging diagnostic data because user did not consent");
      sub_100006BEC((uint64_t)v18);
    }

    int v21 = 0;
LABEL_14:
    v81[0] = 0;
    id v22 = sub_100006D78(v13, "entityRelevanceRankingSupplementalDiagnosticsWithError:");
    if (v22)
    {
      v23 = v22;
      sub_100007170();
      sub_100006DC8();

      id v24 = objc_allocWithZone((Class)v5[75]);
      id result = sub_100006C94();
      if (!result)
      {
        __break(1u);
        goto LABEL_61;
      }
      sub_100006D60();
      sub_100006C24();
      if (v12) {
        sub_100006BC8(v25);
      }
      sub_100006CCC();
      uint64_t v26 = sub_1000071B0();
      if (v21)
      {
LABEL_19:
        v81[0] = 0;
        id v27 = sub_100006D78(v26, "entityResolutionSupplementalDiagnosticsWithError:");
        if (!v27)
        {
          id v50 = v81[0];
          sub_100006D48();

          swift_willThrow();
          sub_100006CE8();
          if (!v14) {
            swift_once();
          }
          uint64_t v51 = sub_100007130();
          sub_100006D10(v51, (uint64_t)static Logging.defaultLog);
          swift_errorRetain();
          v28 = (void *)sub_100007120();
          os_log_type_t v52 = sub_1000071E0();
          if (sub_100006CB0(v52))
          {
            sub_100006C78();
            uint64_t v53 = sub_100006C5C();
            sub_100006D3C(v53);
            sub_100006CF4(4.8149e-34);
            swift_getErrorValue();
            uint64_t v54 = sub_100007280();
            uint64_t v56 = sub_100006D90(v54, v55);
            sub_100006C38(v56);
            id v4 = v80;
            sub_1000071F0();
            swift_bridgeObjectRelease();
            swift_errorRelease();
            swift_errorRelease();
            sub_100006C04((void *)&_mh_execute_header, v57, v58, "Failed to collect entityResolution diagnostic data: %s");
            sub_100006DE0();
            sub_100006BEC(0x10000C000);
            sub_100006BEC((uint64_t)v2);

            uint64_t v31 = swift_errorRelease();
          }
          else
          {
            swift_errorRelease();
            swift_errorRelease();
            swift_errorRelease();
          }
LABEL_42:
          v81[0] = 0;
          id v59 = sub_100006D78(v31, "viewsSupplementalDiagnosticsWithError:");
          if (!v59)
          {
            id v63 = v81[0];
            sub_100006D48();

            swift_willThrow();
            sub_100006CE8();
            if (!v14) {
              swift_once();
            }
            uint64_t v64 = sub_100007130();
            sub_100006D10(v64, (uint64_t)static Logging.defaultLog);
            swift_errorRetain();
            v65 = (void *)sub_100007120();
            os_log_type_t v66 = sub_1000071E0();
            if (sub_100006CB0(v66))
            {
              sub_100006C78();
              uint64_t v67 = sub_100006C5C();
              sub_100006D3C(v67);
              _DWORD *v2 = 136315138;
              swift_getErrorValue();
              uint64_t v68 = sub_100007280();
              *(void *)&long long v82 = sub_100006D90(v68, v69);
              sub_1000071F0();
              swift_bridgeObjectRelease();
              swift_errorRelease();
              swift_errorRelease();
              sub_100006C04((void *)&_mh_execute_header, v70, v71, "Failed to collect views diagnostic data: %s");
              sub_100006DE0();
              sub_100006BEC(0x10000C000);
              sub_100006BEC((uint64_t)v2);

              swift_errorRelease();
            }
            else
            {

              swift_errorRelease();
              swift_errorRelease();
              swift_errorRelease();
            }
            return &_swiftEmptyArrayStorage;
          }
          v60 = v59;
          sub_100007170();
          sub_100006DC8();

          id v61 = objc_allocWithZone((Class)v5[75]);
          id result = sub_100006C94();
          if (result)
          {
            sub_100006D60();
            sub_100006C24();
            if (v12) {
              sub_100006BC8(v62);
            }
            sub_100006CCC();
            sub_1000071B0();
LABEL_47:

            return &_swiftEmptyArrayStorage;
          }
          goto LABEL_62;
        }
        v28 = v27;
        sub_100007170();
        sub_100006DC8();

        id v29 = objc_allocWithZone((Class)v5[75]);
        id result = sub_100006C94();
        if (result)
        {
          sub_100006D60();
          sub_100006C24();
          if (v12) {
            sub_100006BC8(v30);
          }
          sub_100006CCC();
          uint64_t v31 = sub_1000071B0();
          goto LABEL_42;
        }
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
        goto LABEL_63;
      }
    }
    else
    {
      id v32 = v81[0];
      sub_100006D48();

      swift_willThrow();
      sub_100006CE8();
      if (!v14) {
        swift_once();
      }
      uint64_t v33 = sub_100007130();
      sub_100006D10(v33, (uint64_t)static Logging.defaultLog);
      swift_errorRetain();
      v23 = (void *)sub_100007120();
      os_log_type_t v34 = sub_1000071E0();
      if (sub_100006CB0(v34))
      {
        sub_100006C78();
        uint64_t v35 = sub_100006C5C();
        sub_100006D3C(v35);
        sub_100006CF4(4.8149e-34);
        swift_getErrorValue();
        uint64_t v36 = sub_100007280();
        uint64_t v38 = sub_100006D90(v36, v37);
        sub_100006C38(v38);
        id v4 = v80;
        sub_1000071F0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        sub_100006C04((void *)&_mh_execute_header, v39, v40, "Failed to collect entityRelevanceRanking diagnostic data: %s");
        sub_100006DE0();
        sub_100006BEC(0x10000C000);
        sub_100006BEC((uint64_t)v2);

        uint64_t v26 = swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      if (v21) {
        goto LABEL_19;
      }
    }
    sub_100006CE8();
    if (!v14) {
      swift_once();
    }
    uint64_t v41 = sub_100007130();
    sub_10000611C(v41, (uint64_t)static Logging.defaultLog);
    v42 = sub_100007120();
    os_log_type_t v43 = sub_1000071E0();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Skipping collection of entityResolution diagnostic data because user did not consent", v44, 2u);
      sub_100006BEC((uint64_t)v44);
    }

    v45 = sub_100007120();
    os_log_type_t v46 = sub_1000071E0();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (_WORD *)swift_slowAlloc();
      _WORD *v47 = 0;
      sub_100006DA8((void *)&_mh_execute_header, v48, v49, "Skipping collection of views diagnostic data because user did not consent");
      sub_100006BEC((uint64_t)v47);
    }

    goto LABEL_47;
  }
  v81[0] = 0;
  id v7 = sub_100006D78(v6, "entityTaggingSupplementalDiagnosticsWithError:");
  if (!v7)
  {
    id v72 = v81[0];
    sub_100006D48();

    swift_willThrow();
    sub_100006CE8();
    if (!v14) {
      swift_once();
    }
    uint64_t v73 = sub_100007130();
    sub_100006D10(v73, (uint64_t)static Logging.defaultLog);
    swift_errorRetain();
    uint64_t v8 = sub_100007120();
    os_log_type_t v74 = sub_1000071E0();
    if (sub_100006CB0(v74))
    {
      sub_100006C78();
      uint64_t v75 = sub_100006C5C();
      sub_100006D3C(v75);
      _DWORD *v2 = 136315138;
      swift_getErrorValue();
      uint64_t v76 = sub_100007280();
      *(void *)&long long v82 = sub_100006D90(v76, v77);
      v5 = &_s10Foundation22_convertNSErrorToErrorys0E0_pSo0C0CSgF_ptr;
      sub_1000071F0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      sub_100006C04((void *)&_mh_execute_header, v78, v79, "Failed to collect entityTagging diagnostic data: %s");
      int v21 = 1;
      sub_100006DE0();
      sub_100006BEC(0x10000C000);
      sub_100006BEC((uint64_t)v2);

      uint64_t v13 = swift_errorRelease();
      goto LABEL_14;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    goto LABEL_59;
  }
  uint64_t v8 = (uint64_t)v7;
  sub_100007170();
  sub_100006DC8();

  id v9 = objc_allocWithZone((Class)DEAttachmentItem);
  id result = sub_100006C94();
  if (result)
  {
    sub_100006D60();
    sub_100006C24();
    if (v12) {
      sub_100006BC8(v11);
    }
    sub_100006CCC();
    uint64_t v13 = sub_1000071B0();
LABEL_59:
    int v21 = 1;
    goto LABEL_14;
  }
LABEL_63:
  __break(1u);
  return result;
}

double sub_100005E68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100006A20(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_1000069C0(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id sub_100005F74()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IPDiagnosticExtension();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100005FCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IPDiagnosticExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IPDiagnosticExtension()
{
  return self;
}

uint64_t sub_100006024(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006078(uint64_t a1)
{
  uint64_t v2 = sub_1000060D8(&qword_10000C2A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000060D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000611C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_100006154(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_100007160();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithPath:v3];

  return v4;
}

uint64_t sub_1000061B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000628C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000069C0((uint64_t)v12, *a3);
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
      sub_1000069C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006970(v12);
  return v7;
}

uint64_t sub_10000628C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000063E4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100007200();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_1000064BC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100007250();
    if (!v8)
    {
      uint64_t result = sub_100007260();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_1000063E4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100007270();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_1000064BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100006554(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006730(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006730((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100006554(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100007180();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_1000066C8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100007240();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100007270();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100007260();
  __break(1u);
  return result;
}

void *sub_1000066C8(uint64_t a1, uint64_t a2)
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
  sub_1000060D8(&qword_10000C2A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100006730(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000060D8(&qword_10000C2A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  char v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1000068E0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100006808(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100006808(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100007270();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1000068E0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100007270();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100006970(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000069C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100006A20(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100007210(*(void *)(v2 + 40));

  return sub_100006A64(a1, v4);
}

unint64_t sub_100006A64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100006B2C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100007220();
      sub_100006024((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100006B2C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100006B88()
{
  unint64_t result = qword_10000C2B0;
  if (!qword_10000C2B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C2B0);
  }
  return result;
}

uint64_t sub_100006BC8@<X0>(unint64_t a1@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a1 > 1, v1 + 1, 1);
}

uint64_t sub_100006BEC(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

void sub_100006C04(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_100006C38(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t sub_100006C5C()
{
  return swift_slowAlloc();
}

uint64_t sub_100006C78()
{
  return swift_slowAlloc();
}

id sub_100006C94()
{
  return sub_100006154(v0, v1);
}

BOOL sub_100006CB0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100006CCC()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v1, v0);
}

void sub_100006CF4(float a1)
{
  float *v1 = a1;
}

uint64_t sub_100006D10(uint64_t a1, uint64_t a2)
{
  sub_10000611C(a1, a2);
  return swift_errorRetain();
}

uint64_t sub_100006D3C(uint64_t result)
{
  *(void *)(v1 - 168) = result;
  return result;
}

uint64_t sub_100006D48()
{
  return _convertNSErrorToError(_:)(v0);
}

uint64_t sub_100006D60()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

id sub_100006D78(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3 - 168);
}

uint64_t sub_100006D90(uint64_t a1, unint64_t a2)
{
  return sub_1000061B8(a1, a2, (uint64_t *)(v2 - 168));
}

void sub_100006DA8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

id sub_100006DC8()
{
  return v0;
}

uint64_t sub_100006DE0()
{
  return _swift_arrayDestroy(v0, 1);
}

uint64_t Logging.defaultLog.unsafeMutableAddressor()
{
  if (qword_10000C270 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100007130();

  return sub_10000611C(v0, (uint64_t)static Logging.defaultLog);
}

uint64_t sub_100006E5C()
{
  uint64_t v0 = sub_100007130();
  sub_100006F70(v0, static Logging.defaultLog);
  sub_10000611C(v0, (uint64_t)static Logging.defaultLog);
  id v1 = GDDiagnosticExtensionDefaultLog();
  return sub_100007140();
}

uint64_t static Logging.defaultLog.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C270 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100007130();
  uint64_t v3 = sub_10000611C(v2, (uint64_t)static Logging.defaultLog);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

uint64_t *sub_100006F70(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id GDDiagnosticExtensionDefaultLog()
{
  if (qword_10000C2D8 != -1) {
    dispatch_once(&qword_10000C2D8, &stru_1000083B0);
  }
  uint64_t v0 = (void *)qword_10000C2D0;

  return v0;
}

void sub_100007028(id a1)
{
  qword_10000C2D0 = (uint64_t)os_log_create((const char *)[@"com.apple.intelligenceplatform.DiagnosticExtension" UTF8String], "default");

  _objc_release_x1();
}

uint64_t sub_100007120()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007130()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100007140()
{
  return Logger.init(_:)();
}

uint64_t sub_100007150()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100007160()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100007170()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100007180()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1000071A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000071B0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000071E0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000071F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007200()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_100007210(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100007220()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100007230()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100007240()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007250()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007260()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007270()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007280()
{
  return Error.localizedDescription.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}