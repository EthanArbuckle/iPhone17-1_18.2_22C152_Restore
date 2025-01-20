uint64_t sub_100003A20()
{
  uint64_t v0;

  v0 = sub_100006908();
  sub_10000587C(v0, qword_10000C8C0);
  sub_100005834(v0, (uint64_t)qword_10000C8C0);
  return sub_1000068F8();
}

uint64_t sub_100003AA0()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v4 = *(void *)(*v0 + 88);
  swift_retain_n();
  swift_bridgeObjectRetain();

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v1, v2, sub_100006548, v0, sub_100006550, v0, v3, v4);
}

uint64_t sub_100003B68@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  v10 = (char *)&v14 - v9;
  (*(void (**)(void))(v8 + 56))();
  v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, v3);
  v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, v3);
  v11(a2, v10, v3);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, v3);
}

void sub_100003CB8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v52 = a3;
  uint64_t v14 = sub_100006908();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = [self currentConnection];
  if (v18)
  {
    uint64_t v51 = a4;
    v53 = v18;
    uint64_t v19 = sub_100005990(v18);
    if (v20)
    {
      unint64_t v21 = v20;
      uint64_t v46 = a7;
      uint64_t v49 = a1;
      uint64_t v50 = v7;
      uint64_t v48 = v19;
      if (qword_10000C630 != -1) {
        swift_once();
      }
      int v44 = a5;
      uint64_t v45 = a6;
      v47 = v17;
      uint64_t v22 = sub_100005834(v14, (uint64_t)qword_10000C8C0);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v23 = sub_1000068E8();
      os_log_type_t v24 = sub_100006978();
      BOOL v25 = os_log_type_enabled(v23, v24);
      uint64_t v41 = v15;
      uint64_t v42 = v14;
      uint64_t v43 = v22;
      if (v25)
      {
        uint64_t v26 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v54 = sub_100004F5C(v49, a2, &v55);
        sub_100006988();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v26 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v54 = sub_100004F5C(v48, v21, &v55);
        uint64_t v14 = v42;
        sub_100006988();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Extension configuring with %s for %s", (uint8_t *)v26, 0x16u);
        swift_arrayDestroy();
        uint64_t v15 = v41;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      uint64_t v30 = v50;
      swift_bridgeObjectRetain();
      sub_100006818();
      swift_bridgeObjectRetain();
      sub_100006868();
      sub_100006808();
      swift_bridgeObjectRetain();
      sub_100006858();
      uint64_t v31 = *(void *)(v30 + 40);
      uint64_t v32 = v46;
      *(void *)(v30 + 40) = v45;
      *(void *)(v30 + 48) = v32;
      swift_retain();
      sub_10000586C(v31);
      sub_100004480(v53);
      if (!v33) {
        swift_bridgeObjectRetain();
      }
      sub_100006838();
      v34 = v47;
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v47, v43, v14);
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      swift_bridgeObjectRetain();
      v35 = sub_1000068E8();
      os_log_type_t v36 = sub_100006978();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315650;
        swift_bridgeObjectRetain();
        uint64_t v54 = sub_100004F5C(v49, a2, &v55);
        sub_100006988();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v37 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v54 = sub_100004F5C(v48, v21, &v55);
        sub_100006988();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v37 + 22) = 2080;
        uint64_t v38 = sub_100006828();
        if (v39)
        {
          uint64_t v54 = sub_100004F5C(v38, v39, &v55);
          sub_100006988();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "Extension configuring with %s for %s (name: %s", (uint8_t *)v37, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v41 + 8))(v47, v42);
        }
        else
        {
          swift_release();
          __break(1u);
        }
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v34, v14);
      }
      return;
    }
  }
  else
  {
    if (qword_10000C630 != -1) {
      swift_once();
    }
    sub_100005834(v14, (uint64_t)qword_10000C8C0);
    v53 = sub_1000068E8();
    os_log_type_t v27 = sub_100006968();
    if (os_log_type_enabled(v53, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, v27, "configureWith called in non-NSXPC context", v28, 2u);
      swift_slowDealloc();
    }
  }
  v29 = v53;
}

uint64_t sub_10000438C(int a1, int a2, int a3, int a4, int a5, void *aBlock)
{
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = sub_100006928();
  unint64_t v10 = v9;
  uint64_t v11 = sub_100006928();
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v7;
  swift_retain();
  sub_100003CB8(v8, v10, v11, v13, a5, (uint64_t)sub_1000066E0, v14);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100004480(void *a1)
{
  [a1 processIdentifier];
  [a1 auditToken];
  uint64_t v2 = sub_100006848();
  if (!v3) {
    __break(1u);
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  id v6 = objc_allocWithZone((Class)LSApplicationRecord);
  id v7 = sub_100004E80(v4, v5, 1);
  id v8 = [v7 localizedName];
  uint64_t v9 = sub_100006928();

  return v9;
}

uint64_t sub_10000498C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_100004A0C()
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000586C(*(void *)(v0 + 40));
  swift_release();
  return v0;
}

uint64_t sub_100004A44()
{
  sub_100004A0C();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t sub_100004A78()
{
  return sub_100003AA0();
}

uint64_t sub_100004AA0@<X0>(void *a1@<X8>)
{
  sub_1000055EC(&qword_10000C4D8);
  uint64_t v2 = (void *)swift_allocObject();
  v2[2] = 0x746C7561666564;
  v2[3] = 0xE700000000000000;
  sub_100006888();
  swift_allocObject();
  uint64_t result = sub_100006878();
  v2[5] = 0;
  v2[6] = 0;
  v2[4] = result;
  v2[7] = sub_100004B38;
  v2[8] = 0;
  *a1 = v2;
  return result;
}

uint64_t sub_100004B38(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  swift_retain();
  swift_retain();

  return LimitedLibraryPickerView.init(viewModel:completion:)(v2, sub_100005678, a1);
}

uint64_t sub_100004BA8()
{
  uint64_t v0 = sub_1000055EC(&qword_10000C4D8);
  uint64_t v1 = sub_1000067B0(&qword_10000C4E0);

  return AppExtensionSceneConfiguration.init<A>(_:)(sub_1000055B4, 0, v0, v1);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100004C8C()
{
  unint64_t result = qword_10000C4A0;
  if (!qword_10000C4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C4A0);
  }
  return result;
}

uint64_t sub_100004CE4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LimitedLibraryPickerScene()
{
  return sub_100006740();
}

ValueMetadata *type metadata accessor for Appex()
{
  return &type metadata for Appex;
}

uint64_t sub_100004D74()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100004D90(uint64_t a1)
{
  unint64_t result = sub_100004C8C();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100004DB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004DFC(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100004E38()
{
  return sub_100006500(&qword_10000C4D0, (void (*)(uint64_t))&type metadata accessor for AppExtensionSceneConfiguration);
}

id sub_100004E80(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_100006918();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_100006898();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_100004F5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005030(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005930((uint64_t)v12, *a3);
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
      sub_100005930((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000058E0((uint64_t)v12);
  return v7;
}

uint64_t sub_100005030(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006998();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000051EC(a5, a6);
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
  uint64_t v8 = sub_1000069B8();
  if (!v8)
  {
    sub_1000069C8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000069D8();
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

uint64_t sub_1000051EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100005284(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005464(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005464(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100005284(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000053FC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000069A8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000069C8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006948();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000069D8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000069C8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000053FC(uint64_t a1, uint64_t a2)
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
  sub_1000055EC(&qword_10000C4E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005464(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000055EC(&qword_10000C4E8);
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
  uint64_t result = sub_1000069D8();
  __break(1u);
  return result;
}

uint64_t sub_1000055B4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100004AA0(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_1000055EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005630(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100005678(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_10000C630 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006908();
  sub_100005834(v4, (uint64_t)qword_10000C8C0);
  size_t v5 = sub_1000068E8();
  os_log_type_t v6 = sub_100006978();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Attempting to dismiss picker", v7, 2u);
    swift_slowDealloc();
  }

  int64_t v8 = *(void (**)(uint64_t))(v2 + 40);
  if (v8)
  {
    swift_retain();
    v8(a1);
    oslog = sub_1000068E8();
    os_log_type_t v9 = sub_100006978();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Called completion", v10, 2u);
      swift_slowDealloc();
    }
    sub_10000586C((uint64_t)v8);
  }
}

uint64_t sub_100005834(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000586C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t *sub_10000587C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000058E0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005930(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005990(void *a1)
{
  [a1 auditToken];
  if (!tcc_server_create())
  {
    if (qword_10000C630 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100006908();
    sub_100005834(v15, (uint64_t)qword_10000C8C0);
    uint64_t v16 = sub_1000068E8();
    os_log_type_t v17 = sub_100006968();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Could not create tcc server", v18, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  if (tcc_message_options_create())
  {
    tcc_message_options_set_reply_handler_policy();
    if (tcc_credential_create_for_process_with_audit_token())
    {
      uint64_t v1 = swift_allocObject();
      *(void *)(v1 + 16) = 0;
      uint64_t v2 = swift_allocObject();
      *(void *)(v2 + 16) = 0;
      uint64_t v3 = (void **)(v2 + 16);
      uint64_t v4 = swift_allocObject();
      *(void *)(v4 + 16) = v1;
      *(void *)(v4 + 24) = v2;
      aBlock[4] = sub_1000063FC;
      aBlock[5] = v4;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10000498C;
      aBlock[3] = &unk_100008668;
      size_t v5 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_unknownObjectRetain();
      swift_release();
      tcc_server_message_get_identity_for_credential();
      _Block_release(v5);
      swift_unknownObjectRelease();
      swift_beginAccess();
      if (*(void *)(v2 + 16))
      {
        if (qword_10000C630 != -1) {
          swift_once();
        }
        uint64_t v6 = sub_100006908();
        sub_100005834(v6, (uint64_t)qword_10000C8C0);
        swift_retain_n();
        int64_t v7 = sub_1000068E8();
        os_log_type_t v8 = sub_100006968();
        if (os_log_type_enabled(v7, v8))
        {
          os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
          uint64_t v10 = (void *)swift_slowAlloc();
          *(_DWORD *)os_log_type_t v9 = 138412290;
          size_t v11 = *v3;
          if (*v3)
          {
            type metadata accessor for CFError();
            sub_100006500(&qword_10000C558, (void (*)(uint64_t))type metadata accessor for CFError);
            swift_allocError();
            *uint64_t v12 = v11;
            id v13 = v11;
            uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
            uint64_t v39 = v14;
            sub_100006988();
          }
          else
          {
            uint64_t v39 = 0;
            sub_100006988();
            uint64_t v14 = 0;
          }
          void *v10 = v14;
          swift_release_n();
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed to get identity, error %@", v9, 0xCu);
          sub_1000055EC(&qword_10000C550);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_release();
          swift_release();
          swift_unknownObjectRelease();

          swift_unknownObjectRelease();
          goto LABEL_41;
        }
        swift_release();

        swift_release_n();
        goto LABEL_31;
      }
      swift_beginAccess();
      if (*(void *)(v1 + 16))
      {
        swift_unknownObjectRetain();
        if (!tcc_identity_get_type())
        {
          tcc_identity_get_identifier();
          uint64_t v36 = sub_100006938();
          swift_release();
          swift_release();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return v36;
        }
        if (qword_10000C630 != -1) {
          swift_once();
        }
        uint64_t v26 = sub_100006908();
        sub_100005834(v26, (uint64_t)qword_10000C8C0);
        swift_unknownObjectRetain_n();
        os_log_type_t v27 = sub_1000068E8();
        os_log_type_t v28 = sub_100006968();
        if (!os_log_type_enabled(v27, v28))
        {
          swift_release();
          swift_release();

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease_n();
          goto LABEL_41;
        }
        uint64_t v29 = swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 134218242;
        tcc_identity_get_type();
        sub_100006988();
        swift_unknownObjectRelease();
        *(_WORD *)(v29 + 12) = 2080;
        tcc_identity_get_identifier();
        uint64_t v30 = sub_100006938();
        sub_100004F5C(v30, v31, &v38);
        sub_100006988();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Client is not an app: %llu %s", (uint8_t *)v29, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_release();
        swift_release();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {
        if (qword_10000C630 != -1) {
          swift_once();
        }
        uint64_t v32 = sub_100006908();
        sub_100005834(v32, (uint64_t)qword_10000C8C0);
        uint64_t v33 = sub_1000068E8();
        os_log_type_t v34 = sub_100006968();
        if (!os_log_type_enabled(v33, v34))
        {
          swift_release();
          swift_release();

LABEL_31:
          swift_unknownObjectRelease();
LABEL_33:
          swift_unknownObjectRelease();
          goto LABEL_41;
        }
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Expected error xor identity", v35, 2u);
        swift_slowDealloc();
        swift_release();
        swift_release();
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
      goto LABEL_41;
    }
    if (qword_10000C630 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_100006908();
    sub_100005834(v23, (uint64_t)qword_10000C8C0);
    unint64_t v20 = sub_1000068E8();
    os_log_type_t v24 = sub_100006968();
    if (!os_log_type_enabled(v20, v24))
    {

      goto LABEL_33;
    }
    BOOL v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v24, "Could not get credential for audit token", v25, 2u);
    swift_slowDealloc();
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_10000C630 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_100006908();
    sub_100005834(v19, (uint64_t)qword_10000C8C0);
    unint64_t v20 = sub_1000068E8();
    os_log_type_t v21 = sub_100006968();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Could not create tcc options", v22, 2u);
      swift_slowDealloc();
    }
  }

LABEL_41:
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_10000634C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006384()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000063BC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000063FC(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  swift_beginAccess();
  *(void *)(v5 + 16) = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  swift_beginAccess();
  int64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = a2;
  id v8 = a2;
}

uint64_t sub_100006490(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000064A0()
{
  return swift_release();
}

void type metadata accessor for CFError()
{
  if (!qword_10000C560)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C560);
    }
  }
}

uint64_t sub_100006500(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006548@<X0>(char *a1@<X8>)
{
  return sub_100003B68(v1, a1);
}

uint64_t sub_100006550(void *a1)
{
  uint64_t v2 = v1;
  if (qword_10000C630 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006908();
  sub_100005834(v4, (uint64_t)qword_10000C8C0);
  uint64_t v5 = sub_1000068E8();
  os_log_type_t v6 = sub_100006978();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Got connection in extension", v7, 2u);
    swift_slowDealloc();
  }

  id v8 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP10ContactsUI37LimitedLibraryPickerExtensionProtocol_];
  [a1 setExportedInterface:v8];

  [a1 setExportedObject:v2];
  [a1 resume];
  return 1;
}

uint64_t sub_1000066A8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000066E0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  isa = sub_100006958().super.isa;
  (*(void (**)(uint64_t, objc_class *))(v1 + 16))(v1, isa);
}

uint64_t sub_100006740()
{
  return swift_getGenericMetadata();
}

void *sub_100006770()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_10000677C()
{
  return sub_1000067B0(&qword_10000C568);
}

uint64_t sub_1000067B0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005630(&qword_10000C4D8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006808()
{
  return dispatch thunk of LimitedLibraryPickerViewModel.showMultiSelectContactsPicker.setter();
}

uint64_t sub_100006818()
{
  return dispatch thunk of LimitedLibraryPickerViewModel.queryString.setter();
}

uint64_t sub_100006828()
{
  return dispatch thunk of LimitedLibraryPickerViewModel.applicationName.getter();
}

uint64_t sub_100006838()
{
  return dispatch thunk of LimitedLibraryPickerViewModel.applicationName.setter();
}

uint64_t sub_100006848()
{
  return dispatch thunk of LimitedLibraryPickerViewModel.bundleIdentifier.getter();
}

uint64_t sub_100006858()
{
  return dispatch thunk of LimitedLibraryPickerViewModel.bundleIdentifier.setter();
}

uint64_t sub_100006868()
{
  return dispatch thunk of LimitedLibraryPickerViewModel.caption.setter();
}

uint64_t sub_100006878()
{
  return LimitedLibraryPickerViewModel.init()();
}

uint64_t sub_100006888()
{
  return type metadata accessor for LimitedLibraryPickerViewModel();
}

uint64_t sub_100006898()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000068C8()
{
  return AppExtensionScene._makeScene(with:)();
}

uint64_t sub_1000068D8()
{
  return static AppExtension<>.main()();
}

uint64_t sub_1000068E8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000068F8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006908()
{
  return type metadata accessor for Logger();
}

NSString sub_100006918()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006928()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006938()
{
  return String.init(cString:)();
}

Swift::Int sub_100006948()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100006958()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006968()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006978()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006988()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006998()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000069A8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000069B8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000069C8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000069D8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

void objc_release(id a1)
{
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return _tcc_credential_create_for_process_with_audit_token();
}

uint64_t tcc_identity_get_identifier()
{
  return _tcc_identity_get_identifier();
}

uint64_t tcc_identity_get_type()
{
  return _tcc_identity_get_type();
}

uint64_t tcc_message_options_create()
{
  return _tcc_message_options_create();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return _tcc_message_options_set_reply_handler_policy();
}

uint64_t tcc_server_create()
{
  return _tcc_server_create();
}

uint64_t tcc_server_message_get_identity_for_credential()
{
  return _tcc_server_message_get_identity_for_credential();
}