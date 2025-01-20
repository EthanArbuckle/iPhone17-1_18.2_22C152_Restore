uint64_t objectdestroy_53Tm()
{
  uint64_t v0;
  uint64_t vars8;

  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t objectdestroy_57Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
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

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

int main(int argc, const char **argv, const char **envp)
{
  sub_1000049A0(0, (unint64_t *)&unk_1000470E0);
  sub_1000049A0(0, (unint64_t *)&unk_100048360);
  v3 = (void *)sub_10002EAE8();
  uint64_t v4 = sub_10002EB18();

  qword_1000484D8 = v4;
  sub_1000049DC();
  id v6 = [self mainRunLoop];
  [v6 run];

  return 0;
}

uint64_t sub_1000049A0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000049DC()
{
  uint64_t v16 = sub_10002E828();
  uint64_t v0 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10002E848();
  uint64_t v3 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  v7 = (uint64_t *)(v6 + 16);
  swift_getObjectType();
  v21 = sub_100007824;
  uint64_t v22 = v6;
  aBlock = _NSConcreteStackBlock;
  uint64_t v18 = 1107296256;
  v14 = &v19;
  v19 = sub_100006504;
  v20 = &block_descriptor;
  v8 = _Block_copy(&aBlock);
  swift_retain();
  sub_10002E838();
  sub_100004F60();
  sub_10002EB28();
  _Block_release(v8);
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v16);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v15);
  swift_release();
  swift_getObjectType();
  sub_10002EB38();
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    sub_10002EAA8();
    if (qword_100047060 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_10002F990;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = sub_100007844();
    *(void *)(v13 + 32) = 0xD00000000000001ALL;
    *(void *)(v13 + 40) = 0x80000001000309F0;
    sub_10002E768();
    swift_bridgeObjectRelease();
    exit(1);
  }
  sub_100005028();
  sub_1000049A0(0, (unint64_t *)&unk_100048360);
  v9 = sub_10002EAE8();
  v21 = sub_1000057E8;
  uint64_t v22 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v18 = 1107296256;
  v19 = sub_100005D10;
  v20 = &block_descriptor_3;
  v10 = _Block_copy(&aBlock);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v9, v10);
  _Block_release(v10);

  type metadata accessor for MapsSyncDaemon();
  swift_allocObject();
  uint64_t v11 = sub_100008F50();
  swift_beginAccess();
  uint64_t *v7 = v11;
  swift_release();
  if (*v7)
  {
    swift_retain();
    sub_100005520((uint64_t)sub_1000052CC, 0);
    swift_release();
  }
  return swift_release();
}

void sub_100004E48(uint64_t a1)
{
  sub_10002EAA8();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10002F990;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 64) = sub_100007844();
  *(void *)(v2 + 32) = 0xD00000000000001ALL;
  *(void *)(v2 + 40) = 0x8000000100030BB0;
  sub_10002E768();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(a1 + 16) = 0;
  swift_release();
  exit(0);
}

uint64_t sub_100004F60()
{
  return sub_10002EC58();
}

void sub_100005028()
{
  id v0 = [self sharedManager];
  if (!v0)
  {
    __break(1u);
    return;
  }
  uint64_t v1 = v0;
  unsigned __int8 v2 = [v0 isSharedIPad];

  if ((v2 & 1) == 0)
  {
    id v3 = [self currentPersona];
    if (v3)
    {
      id v10 = v3;
      id v4 = [self personaAttributesForPersonaType:0];
      if (v4)
      {
        id v9 = v4;
        if (([v10 isPersonalPersona] & 1) == 0)
        {
          id v5 = [v9 userPersonaUniqueString];
          id v6 = [v10 generateAndRestorePersonaContextWithPersonaUniqueString:v5];

          if (v6)
          {
            sub_10002ECD8(27);
            swift_bridgeObjectRelease();
            swift_getErrorValue();
            v12._countAndFlagsBits = sub_10002EDE8();
            sub_10002E948(v12);
            swift_bridgeObjectRelease();
            sub_10002EAA8();
            if (qword_100047060 != -1) {
              swift_once();
            }
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
            uint64_t v7 = swift_allocObject();
            *(_OWORD *)(v7 + 16) = xmmword_10002F990;
            *(void *)(v7 + 56) = &type metadata for String;
            *(void *)(v7 + 64) = sub_100007844();
            *(void *)(v7 + 32) = 0xD000000000000019;
            *(void *)(v7 + 40) = 0x8000000100030B90;
            swift_bridgeObjectRetain();
            sub_10002E768();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return;
          }
        }

        v8 = v9;
      }
      else
      {
        v8 = v10;
      }
    }
  }
}

uint64_t sub_1000052CC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    swift_errorRetain();
    sub_10002ECD8(28);
    swift_bridgeObjectRelease();
    swift_getErrorValue();
    v5._countAndFlagsBits = sub_10002EDE8();
    sub_10002E948(v5);
    swift_bridgeObjectRelease();
    sub_10002EAA8();
    if (qword_100047060 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_10002F990;
    *(void *)(v3 + 56) = &type metadata for String;
    *(void *)(v3 + 64) = sub_100007844();
    *(void *)(v3 + 32) = 0xD00000000000001ALL;
    *(void *)(v3 + 40) = 0x8000000100030AD0;
    swift_bridgeObjectRetain();
    sub_10002E768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    exit(1);
  }
  sub_10002EAA8();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10002F990;
  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 64) = sub_100007844();
  *(void *)(v1 + 32) = 0xD00000000000001FLL;
  *(void *)(v1 + 40) = 0x8000000100030AF0;
  sub_10002E768();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100005520(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10002E828();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = sub_10002E848();
  uint64_t v10 = *(void *)(v18[0] - 8);
  __chkstk_darwin(v18[0]);
  Swift::String v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)(v3 + 48);
  v14 = (void *)swift_allocObject();
  v14[2] = v3;
  v14[3] = a1;
  v14[4] = a2;
  aBlock[4] = sub_1000078D8;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006504;
  aBlock[3] = &block_descriptor_9;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = v13;
  swift_retain();
  swift_retain();
  sub_10002E838();
  v18[1] = &_swiftEmptyArrayStorage;
  sub_1000078E4(&qword_100047118, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047120);
  sub_10000792C(&qword_100047128, &qword_100047120);
  sub_10002EC58();
  sub_10002EAF8();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void))(v10 + 8))(v12, v18[0]);
  return swift_release();
}

char *sub_1000057E8(void *a1)
{
  uint64_t result = (char *)xpc_dictionary_get_string(a1, _xpc_event_key_name);
  if (result)
  {
    uint64_t result = xpc_dictionary_get_dictionary(a1, "UserInfo");
    if (result)
    {
      uint64_t v3 = result;
      xpc_object_t v4 = xpc_dictionary_get_array(result, "bundleIDs");
      if (v4)
      {
        Swift::String v5 = v4;
        BOOL v6 = xpc_dictionary_get_BOOL(v3, "isPlaceholder");
        v20 = &_swiftEmptySetSingleton;
        uint64_t v7 = swift_allocObject();
        *(void *)(v7 + 16) = &v20;
        uint64_t v8 = swift_allocObject();
        *(void *)(v8 + 16) = sub_100007B98;
        *(void *)(v8 + 24) = v7;
        uint64_t v18 = sub_100007BB0;
        uint64_t v19 = v8;
        aBlock = _NSConcreteStackBlock;
        unint64_t v15 = 1107296256;
        id v16 = sub_100005BF4;
        v17 = &block_descriptor_44;
        id v9 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        xpc_array_apply(v5, v9);
        _Block_release(v9);
        LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if (v9)
        {
          __break(1u);
        }
        else
        {
          char v13 = 0;
          uint64_t v10 = swift_allocObject();
          *(void *)(v10 + 16) = &v13;
          uint64_t v11 = swift_allocObject();
          *(void *)(v11 + 16) = sub_100007BEC;
          *(void *)(v11 + 24) = v10;
          uint64_t v18 = sub_100007CA8;
          uint64_t v19 = v11;
          aBlock = _NSConcreteStackBlock;
          unint64_t v15 = 1107296256;
          id v16 = sub_100005BF4;
          v17 = &block_descriptor_54;
          Swift::String v12 = _Block_copy(&aBlock);
          swift_retain();
          swift_release();
          xpc_array_apply(v5, v12);
          _Block_release(v12);
          LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
          swift_release();
          if ((v12 & 1) == 0)
          {
            if (v6 || (v13 & 1) == 0)
            {
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
              swift_release();
              swift_release();
              return (char *)swift_bridgeObjectRelease();
            }
LABEL_14:
            aBlock = 0;
            unint64_t v15 = 0xE000000000000000;
            sub_10002ECD8(39);
            swift_bridgeObjectRelease();
            aBlock = (void **)0xD000000000000025;
            unint64_t v15 = 0x8000000100030B60;
            v22._countAndFlagsBits = sub_10002E958();
            sub_10002E948(v22);
            swift_bridgeObjectRelease();
            _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0((uint64_t)aBlock, v15);
            swift_bridgeObjectRelease();
            exit(0);
          }
        }
        __break(1u);
        goto LABEL_14;
      }
      return (char *)swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_100005B98(int a1, xpc_object_t xstring)
{
  if (xpc_string_get_string_ptr(xstring))
  {
    uint64_t v2 = sub_10002E958();
    sub_100028AB0(&v5, v2, v3);
    swift_bridgeObjectRelease();
  }
  return 1;
}

uint64_t sub_100005BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t sub_100005C4C(int a1, xpc_object_t xstring, unsigned char *a3)
{
  if (!xpc_string_get_string_ptr(xstring)) {
    return 1;
  }
  uint64_t v4 = sub_10002E958();
  char v6 = v5;
  if (qword_100047080 != -1) {
    swift_once();
  }
  if (v4 == MapsSyncMapsAppIdentifier._countAndFlagsBits && v6 == MapsSyncMapsAppIdentifier._object)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_10002ED98();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return 1;
    }
  }
  uint64_t result = 0;
  *a3 = 1;
  return result;
}

uint64_t sub_100005D10(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t variable initialization expression of MapsSyncDaemon.maxNumberOfAttempts()
{
  return 5;
}

double variable initialization expression of MapsSyncDaemon.initialRetryIntervalSeconds()
{
  return 1.0;
}

double variable initialization expression of MapsSyncDaemon.maxRetryIntervalSeconds()
{
  return 120.0;
}

double variable initialization expression of MapsSyncDaemon.backoffFactor()
{
  return 1.5;
}

uint64_t variable initialization expression of MapsSyncDaemon.dispatchQueue()
{
  uint64_t v0 = sub_10002EAD8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10002EAB8();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10002E848();
  __chkstk_darwin(v5 - 8);
  sub_1000049A0(0, (unint64_t *)&unk_100048360);
  sub_10002E838();
  v7[1] = &_swiftEmptyArrayStorage;
  sub_1000078E4((unint64_t *)&unk_1000470F0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048370);
  sub_10000792C((unint64_t *)&qword_100047100, (uint64_t *)&unk_100048370);
  sub_10002EC58();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return sub_10002EB08();
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

uint64_t variable initialization expression of MapsSyncDaemon.msService()
{
  return 0;
}

uint64_t sub_10000602C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002E878();
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v32 = v6;
  __chkstk_darwin(v6);
  v30 = (uint64_t *)((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v36 = 0;
  unint64_t v37 = 0xE000000000000000;
  sub_10002ECD8(29);
  swift_bridgeObjectRelease();
  uint64_t v36 = 0x626179727465525BLL;
  unint64_t v37 = 0xEB000000003A656CLL;
  uint64_t v35 = type metadata accessor for MapsSyncDaemon();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047130);
  v38._countAndFlagsBits = sub_10002E908();
  sub_10002E948(v38);
  swift_bridgeObjectRelease();
  v39._object = (void *)0x8000000100030A50;
  v39._countAndFlagsBits = 0xD000000000000010;
  sub_10002E948(v39);
  uint64_t v9 = v36;
  unint64_t v8 = v37;
  uint64_t v10 = HIBYTE(v37) & 0xF;
  if ((v37 & 0x2000000000000000) == 0) {
    uint64_t v10 = v36 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
    sub_10002EA98();
    if (qword_100047060 != -1) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  uint64_t v27 = a2;
  uint64_t v28 = a3;
  unint64_t v29 = a1;
  a1 = 0;
  uint64_t v11 = 7;
  if (((v37 >> 60) & ((v36 & 0x800000000000000) == 0)) != 0) {
    uint64_t v11 = 11;
  }
  a2 = v11 | (v10 << 16);
  uint64_t v34 = 4 * v10;
  long long v33 = xmmword_10002F990;
  do
  {
    uint64_t v12 = sub_10002E938();
    if (v13) {
      unint64_t v14 = a2;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14 >> 14 < a1)
    {
      __break(1u);
      goto LABEL_20;
    }
    sub_10002E968();
    a3 = sub_10002E918();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    sub_10002EA98();
    if (qword_100047060 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = v33;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = sub_100007844();
    *(void *)(v17 + 32) = a3;
    *(void *)(v17 + 40) = v16;
    swift_bridgeObjectRetain();
    sub_10002E768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v14 >> 14;
  }
  while (v14 >> 14 != v34);
  a3 = v28;
  a1 = v29;
  a2 = v27;
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void *)(a1 + 24);
    v20 = *(void **)(a1 + 48);
    Swift::String v22 = v30;
    uint64_t v21 = v31;
    void *v30 = v20;
    unint64_t v8 = v32;
    (*(void (**)(void *, void, uint64_t))(v21 + 104))(v22, enum case for DispatchPredicate.onQueue(_:), v32);
    swift_retain();
    id v23 = v20;
    LOBYTE(v20) = sub_10002E898();
    (*(void (**)(void *, unint64_t))(v21 + 8))(v22, v8);
    swift_release();
    if (v20) {
      break;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    swift_once();
LABEL_16:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_10002F990;
    *(void *)(v18 + 56) = &type metadata for String;
    *(void *)(v18 + 64) = sub_100007844();
    *(void *)(v18 + 32) = v9;
    *(void *)(v18 + 40) = v8;
    swift_bridgeObjectRetain();
    sub_10002E768();
    swift_bridgeObjectRelease();
  }
  v24 = (void *)swift_allocObject();
  v24[2] = a1;
  v24[3] = 1;
  v24[4] = a2;
  v24[5] = a3;
  v24[6] = v19;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = sub_100007980;
  *(void *)(v25 + 24) = v24;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100007E5C((void (*)(id, uint64_t))sub_1000079BC, v25);
  swift_release();
  return swift_release();
}

uint64_t sub_100006504(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_100006548(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6, double a7)
{
  uint64_t v68 = a6;
  uint64_t v70 = sub_10002E868();
  uint64_t v66 = *(void *)(v70 - 8);
  uint64_t v13 = __chkstk_darwin(v70);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v65 = (char *)&v59 - v16;
  uint64_t v17 = sub_10002E828();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10002E848();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  v26 = (char *)&v59 - v25;
  if ((a2 & 1) == 0)
  {
    uint64_t v27 = *(void **)(a3 + 48);
    v78 = (void *)a1;
    char v79 = 0;
    *(void *)&long long v69 = v23;
    uint64_t v28 = (char *)&v59 - v25;
    unint64_t v29 = (void *)swift_allocObject();
    v29[2] = a4;
    v29[3] = a5;
    v29[4] = v68;
    sub_100007A10((uint64_t)&v78, (uint64_t)(v29 + 5));
    v76 = sub_100007A78;
    v77 = v29;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v73 = 1107296256;
    v74 = sub_100006504;
    v75 = &block_descriptor_21;
    v30 = _Block_copy(&aBlock);
    id v31 = v27;
    swift_retain();
    sub_10002E838();
    v71 = &_swiftEmptyArrayStorage;
    sub_1000078E4(&qword_100047118, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047120);
    sub_10000792C(&qword_100047128, &qword_100047120);
    sub_10002EC58();
    sub_10002EAF8();
    _Block_release(v30);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    (*(void (**)(char *, void))(v22 + 8))(v28, v69);
    return swift_release();
  }
  v62 = v20;
  uint64_t v63 = v17;
  v64 = a5;
  uint64_t v67 = a1;
  uint64_t v32 = *(void *)(a3 + 16);
  if (v32 < 1 || v32 > a4)
  {
    v47 = *(void **)(a3 + 48);
    *(void *)&long long v69 = v23;
    v48 = v26;
    uint64_t v61 = v22;
    sub_100007A88(v67, 1);
    id v60 = v47;
    sub_10002E858();
    v49 = v65;
    sub_10002E888();
    uint64_t v66 = *(void *)(v66 + 8);
    ((void (*)(char *, uint64_t))v66)(v15, v70);
    uint64_t v50 = swift_allocObject();
    *(void *)(v50 + 16) = a3;
    *(double *)(v50 + 24) = a7;
    v51 = v64;
    *(void *)(v50 + 32) = a4;
    *(void *)(v50 + 40) = v51;
    *(void *)(v50 + 48) = v68;
    v76 = sub_100007AD4;
    v77 = (void *)v50;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v73 = 1107296256;
    v74 = sub_100006504;
    v75 = &block_descriptor_27;
    v52 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    sub_10002E838();
    v78 = &_swiftEmptyArrayStorage;
    sub_1000078E4(&qword_100047118, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047120);
    sub_10000792C(&qword_100047128, &qword_100047120);
    v53 = v62;
    uint64_t v54 = v63;
    sub_10002EC58();
    v55 = v60;
    sub_10002EAC8();
    _Block_release(v52);

    sub_100007A04(v67, 1);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v53, v54);
    (*(void (**)(char *, void))(v61 + 8))(v48, v69);
    ((void (*)(char *, uint64_t))v66)(v49, v70);
    return swift_release();
  }
  uint64_t aBlock = 0;
  unint64_t v73 = 0xE000000000000000;
  uint64_t v33 = v67;
  swift_errorRetain();
  sub_10002ECD8(46);
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0x626179727465525BLL;
  unint64_t v73 = 0xEB000000003A656CLL;
  v78 = (void *)type metadata accessor for MapsSyncDaemon();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047130);
  v80._countAndFlagsBits = sub_10002E908();
  sub_10002E948(v80);
  swift_bridgeObjectRelease();
  v81._object = (void *)0x8000000100030A70;
  v81._countAndFlagsBits = 0xD00000000000001DLL;
  sub_10002E948(v81);
  v78 = *(void **)(a3 + 16);
  v82._countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v82);
  swift_bridgeObjectRelease();
  v83._countAndFlagsBits = 11817;
  v83._object = (void *)0xE200000000000000;
  sub_10002E948(v83);
  uint64_t v34 = aBlock;
  uint64_t v35 = HIBYTE(v73) & 0xF;
  unint64_t v36 = v73;
  if ((v73 & 0x2000000000000000) == 0) {
    uint64_t v35 = aBlock & 0xFFFFFFFFFFFFLL;
  }
  if (v35)
  {
    unint64_t v37 = 0;
    uint64_t v38 = 7;
    if (((v73 >> 60) & ((aBlock & 0x800000000000000) == 0)) != 0) {
      uint64_t v38 = 11;
    }
    uint64_t v39 = v38 | (v35 << 16);
    uint64_t v70 = 4 * v35;
    long long v69 = xmmword_10002F990;
    while (1)
    {
      uint64_t v40 = sub_10002E938();
      unint64_t v42 = (v41 & 1) != 0 ? v39 : v40;
      if (v42 >> 14 < v37) {
        break;
      }
      sub_10002E968();
      uint64_t v43 = sub_10002E918();
      uint64_t v45 = v44;
      swift_bridgeObjectRelease();
      sub_10002EA98();
      if (qword_100047060 != -1) {
        swift_once();
      }
      uint64_t v33 = static OS_os_log.MapsSync;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
      uint64_t v46 = swift_allocObject();
      *(_OWORD *)(v46 + 16) = v69;
      *(void *)(v46 + 56) = &type metadata for String;
      *(void *)(v46 + 64) = sub_100007844();
      *(void *)(v46 + 32) = v43;
      *(void *)(v46 + 40) = v45;
      swift_bridgeObjectRetain();
      sub_10002E768();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v37 = v42 >> 14;
      if (v42 >> 14 == v70)
      {
        uint64_t v33 = v67;
        goto LABEL_23;
      }
    }
    __break(1u);
  }
  else
  {
    sub_10002EA98();
    if (qword_100047060 == -1) {
      goto LABEL_22;
    }
  }
  swift_once();
LABEL_22:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_10002F990;
  *(void *)(v57 + 56) = &type metadata for String;
  *(void *)(v57 + 64) = sub_100007844();
  *(void *)(v57 + 32) = v34;
  *(void *)(v57 + 40) = v36;
  swift_bridgeObjectRetain();
  sub_10002E768();
  swift_bridgeObjectRelease();
LABEL_23:
  v58 = (void (*)(uint64_t *))v64;
  swift_bridgeObjectRelease();
  uint64_t aBlock = v33;
  LOBYTE(v73) = 1;
  sub_100007A88(v33, 1);
  v58(&aBlock);
  sub_100007A04(v33, 1);
  return sub_100007A04(v33, 1);
}

uint64_t sub_100006EB4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, double a5)
{
  uint64_t v10 = sub_10002E878();
  uint64_t v36 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v35 = (uint64_t *)((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (*(double *)(a1 + 40) * a5 >= *(double *)(a1 + 32)) {
    double v12 = *(double *)(a1 + 32);
  }
  else {
    double v12 = *(double *)(a1 + 40) * a5;
  }
  uint64_t v41 = 0;
  unint64_t v42 = 0xE000000000000000;
  sub_10002ECD8(62);
  v43._countAndFlagsBits = 0x626179727465525BLL;
  v43._object = (void *)0xEB000000003A656CLL;
  sub_10002E948(v43);
  uint64_t v40 = type metadata accessor for MapsSyncDaemon();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047130);
  v44._countAndFlagsBits = sub_10002E908();
  sub_10002E948(v44);
  swift_bridgeObjectRelease();
  v45._object = (void *)0x8000000100030A90;
  v45._countAndFlagsBits = 0xD000000000000015;
  sub_10002E948(v45);
  uint64_t v37 = a2;
  uint64_t v40 = a2;
  v46._countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v46);
  swift_bridgeObjectRelease();
  v47._countAndFlagsBits = 0x7972746552202E29;
  v47._object = (void *)0xEF206E6920676E69;
  sub_10002E948(v47);
  sub_10002EA68();
  v48._countAndFlagsBits = 0x73646E6F63657320;
  v48._object = (void *)0xE90000000000002ELL;
  sub_10002E948(v48);
  uint64_t v14 = v41;
  unint64_t v13 = v42;
  uint64_t v15 = HIBYTE(v42) & 0xF;
  if ((v42 & 0x2000000000000000) == 0) {
    uint64_t v15 = v41 & 0xFFFFFFFFFFFFLL;
  }
  if (!v15)
  {
    sub_10002EA98();
    if (qword_100047060 != -1) {
      goto LABEL_26;
    }
    goto LABEL_19;
  }
  uint64_t v31 = v10;
  unint64_t v32 = a3;
  uint64_t v33 = a4;
  uint64_t v34 = a1;
  unint64_t v16 = 0;
  uint64_t v17 = 7;
  if (((v42 >> 60) & ((v41 & 0x800000000000000) == 0)) != 0) {
    uint64_t v17 = 11;
  }
  uint64_t v10 = v17 | (v15 << 16);
  uint64_t v39 = 4 * v15;
  long long v38 = xmmword_10002F990;
  do
  {
    uint64_t v18 = sub_10002E938();
    if (v19) {
      a3 = v10;
    }
    else {
      a3 = v18;
    }
    if (a3 >> 14 < v16)
    {
      __break(1u);
      goto LABEL_24;
    }
    sub_10002E968();
    a4 = sub_10002E918();
    a1 = v20;
    swift_bridgeObjectRelease();
    sub_10002EA98();
    if (qword_100047060 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = v38;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_100007844();
    *(void *)(v21 + 32) = a4;
    *(void *)(v21 + 40) = a1;
    swift_bridgeObjectRetain();
    sub_10002E768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v16 = a3 >> 14;
  }
  while (a3 >> 14 != v39);
  a4 = v33;
  a1 = v34;
  uint64_t v10 = v31;
  a3 = v32;
  while (1)
  {
    swift_bridgeObjectRelease();
    unint64_t v13 = v37 + 1;
    if (!__OFADD__(v37, 1)) {
      break;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    swift_once();
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_10002F990;
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 64) = sub_100007844();
    *(void *)(v22 + 32) = v14;
    *(void *)(v22 + 40) = v13;
    swift_bridgeObjectRetain();
    sub_10002E768();
    swift_bridgeObjectRelease();
  }
  uint64_t v23 = *(void **)(a1 + 48);
  unint64_t v25 = v35;
  uint64_t v24 = v36;
  *uint64_t v35 = v23;
  (*(void (**)(void *, void, uint64_t))(v24 + 104))(v25, enum case for DispatchPredicate.onQueue(_:), v10);
  swift_retain();
  id v26 = v23;
  LOBYTE(v23) = sub_10002E898();
  (*(void (**)(void *, uint64_t))(v24 + 8))(v25, v10);
  swift_release();
  if ((v23 & 1) == 0) {
    goto LABEL_25;
  }
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a1;
  *(void *)(v27 + 24) = v13;
  *(void *)(v27 + 32) = a3;
  *(void *)(v27 + 40) = a4;
  *(double *)(v27 + 48) = v12;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_100007980;
  *(void *)(v28 + 24) = v27;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100007E5C((void (*)(id, uint64_t))sub_1000079BC, v28);
  swift_release();
  return swift_release();
}

uint64_t sub_10000743C(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, char a5)
{
  char v18 = a5 & 1;
  uint64_t v17 = a4;
  sub_10002ECD8(45);
  swift_bridgeObjectRelease();
  type metadata accessor for MapsSyncDaemon();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047130);
  v19._countAndFlagsBits = sub_10002E908();
  sub_10002E948(v19);
  swift_bridgeObjectRelease();
  v20._object = (void *)0x8000000100030AB0;
  v20._countAndFlagsBits = 0xD000000000000013;
  sub_10002E948(v20);
  v21._countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v21);
  swift_bridgeObjectRelease();
  v22._countAndFlagsBits = 0x74706D6574746120;
  v22._object = (void *)0xEB000000002E2973;
  sub_10002E948(v22);
  unint64_t v16 = a2;
  unint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = sub_10002E938();
    unint64_t v9 = (v8 & 1) != 0 ? 720903 : v7;
    if (v9 >> 14 < v6) {
      break;
    }
    sub_10002E968();
    uint64_t v10 = sub_10002E918();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    sub_10002EA98();
    if (qword_100047060 != -1) {
      swift_once();
    }
    a2 = (uint64_t (*)(void))static OS_os_log.MapsSync;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_10002F990;
    *(void *)(v13 + 56) = &type metadata for String;
    *(void *)(v13 + 64) = sub_100007844();
    *(void *)(v13 + 32) = v10;
    *(void *)(v13 + 40) = v12;
    swift_bridgeObjectRetain();
    sub_10002E768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v6 = v9 >> 14;
    if (v9 >> 14 == 44)
    {
      a2 = v16;
      goto LABEL_10;
    }
  }
  __break(1u);
  swift_once();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_10002F990;
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 64) = sub_100007844();
  *(void *)(v14 + 32) = 0x626179727465525BLL;
  *(void *)(v14 + 40) = 0xEB000000003A656CLL;
  swift_bridgeObjectRetain();
  sub_10002E768();
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  return a2(&v17);
}

uint64_t sub_1000077EC()
{
  swift_release();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007824()
{
  sub_100004E48(v0);
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

unint64_t sub_100007844()
{
  unint64_t result = qword_100047110;
  if (!qword_100047110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047110);
  }
  return result;
}

uint64_t sub_100007898()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000078D8()
{
  return sub_10000602C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000078E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000792C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_100007984()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000079C0()
{
  swift_release();
  sub_100007A04(*(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_100007A04(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100007A10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007A78()
{
  return sub_10000743C(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
}

uint64_t sub_100007A88(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_100007A94()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100007AD4()
{
  return sub_100006EB4(*(void *)(v0 + 16), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(double *)(v0 + 24));
}

uint64_t objectdestroy_11Tm()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100007B2C(uint64_t a1)
{
  return sub_100006548(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t sub_100007B48(uint64_t a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_100007B88()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007B98(int a1, void *a2)
{
  return sub_100005B98(a1, a2);
}

uint64_t sub_100007BA0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007BB0()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_100007BDC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007BEC(int a1, void *a2)
{
  return sub_100005C4C(a1, a2, *(unsigned char **)(v2 + 16));
}

uint64_t sub_100007BF4()
{
  return _swift_deallocObject(v0, 32, 7);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for EventType(uint64_t a1)
{
}

void sub_100007C2C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_100007D04()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryTransitItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryTransitItem()
{
  return self;
}

void *sub_100007D5C()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_100007D68@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedCollection();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_100007E04()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistorySearchItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistorySearchItem()
{
  return self;
}

void sub_100007E5C(void (*a1)(id, uint64_t), uint64_t a2)
{
  v108 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  v101 = (char *)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v102 = (char *)&v92 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v92 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v92 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v92 - v14;
  uint64_t v16 = sub_10002E688();
  uint64_t v17 = *(void **)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  v104 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  v105 = (char *)&v92 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v92 - v23;
  __chkstk_darwin(v22);
  id v26 = (char *)&v92 - v25;
  id v27 = [self sharedObject];
  if (v27)
  {
    uint64_t v28 = v27;
    unsigned __int8 v29 = [v27 canAccessFilesWithProtection:3];

    if ((v29 & 1) == 0)
    {
      _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000002CLL, 0x8000000100031080);
      id v107 = sub_100009E08(0xD000000000000013, 0x80000001000310B0);
      v108(v107, 1);
      Swift::String v45 = v107;

      return;
    }
  }
  uint64_t v106 = a2;
  id v107 = v17;
  v103 = v26;
  id v30 = [self mainBundle];
  if (qword_100047078 != -1) {
    swift_once();
  }
  NSString v31 = sub_10002E8E8();
  NSString v32 = sub_10002E8E8();
  id v33 = [v30 URLForResource:v31 withExtension:v32];

  if (!v33)
  {
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v107 + 7))(v15, 1, 1, v16);
    goto LABEL_16;
  }
  sub_10002E668();

  uint64_t v34 = v107;
  uint64_t v35 = (void (*)(char *, char *, uint64_t))*((void *)v107 + 4);
  v35(v15, v24, v16);
  v99 = (void (*)(char *, void, uint64_t, uint64_t))v34[7];
  v99(v15, 0, 1, v16);
  uint64_t v36 = (unsigned int (*)(char *, uint64_t, uint64_t))v34[6];
  if (v36(v15, 1, v16) == 1)
  {
LABEL_16:
    sub_10000B3D0((uint64_t)v15, &qword_100047550);
    id v46 = sub_100009E08(0xD00000000000001BLL, 0x8000000100030F30);
    v108(v46, 1);

    return;
  }
  v96 = (char *)(v34 + 7);
  v98 = v36;
  uint64_t v37 = v103;
  v35(v103, v15, v16);
  id v38 = objc_allocWithZone((Class)NSManagedObjectModel);
  sub_10002E638(v39);
  uint64_t v41 = v40;
  unint64_t v42 = (objc_class *)[v38 initWithContentsOfURL:v40];

  if (!v42)
  {
    id v47 = sub_100009E08(0xD000000000000014, 0x8000000100030F50);
    v108(v47, 1);

    (*((void (**)(char *, uint64_t))v107 + 1))(v37, v16);
    return;
  }
  Class v97 = v42;
  if (qword_100047050 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100016AE8(0, (uint64_t)v13);
  swift_release();
  Swift::String v43 = v98;
  if (v98(v13, 1, v16) == 1)
  {
    sub_10000B3D0((uint64_t)v13, &qword_100047550);
    id v44 = sub_100009E08(0xD00000000000001FLL, 0x8000000100030F70);
    v108(v44, 1);

    (*((void (**)(char *, uint64_t))v107 + 1))(v103, v16);
    return;
  }
  v35(v105, v13, v16);
  swift_retain();
  sub_100016AE8(1, (uint64_t)v10);
  swift_release();
  if (v43(v10, 1, v16) == 1)
  {
    sub_10000B3D0((uint64_t)v10, &qword_100047550);
    id v48 = sub_100009E08(0xD000000000000025, 0x8000000100030F90);
    v108(v48, 1);

    v49 = (void (*)(char *, uint64_t))*((void *)v107 + 1);
    v49(v105, v16);
  }
  else
  {
    v35(v104, v10, v16);
    uint64_t v50 = v105;
    id v51 = sub_1000099C4();
    id v52 = objc_allocWithZone((Class)NSPersistentCloudKitContainer);
    swift_bridgeObjectRetain();
    NSString v53 = sub_10002E8E8();
    swift_bridgeObjectRelease();
    id v54 = [v52 initWithName:v53];

    sub_10000A1C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047558);
    uint64_t v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = xmmword_10002FAB0;
    *(void *)(v55 + 32) = v51;
    aBlock[0] = v55;
    sub_10002E9B8();
    sub_1000049A0(0, &qword_100047560);
    id v56 = v54;
    id v95 = v51;
    Class isa = sub_10002E998().super.isa;
    swift_bridgeObjectRelease();
    [v56 setPersistentStoreDescriptions:isa];
    id v94 = v56;

    v58 = (void (**)(char *, uint64_t))v107;
    uint64_t v59 = v102;
    v93 = (void (*)(char *, char *, uint64_t))*((void *)v107 + 2);
    v93(v102, v50, v16);
    v99(v59, 0, 1, v16);
    id v60 = v97;
    sub_100009C68(0xD00000000000001DLL, 0x8000000100030FC0);
    Class v97 = (Class)type metadata accessor for MapsSyncStoreServerRequestHandlingPolicy();
    id v61 = [objc_allocWithZone(v97) init];
    uint64_t v63 = 0;
    if (v98(v59, 1, v16) != 1)
    {
      sub_10002E638(v62);
      uint64_t v63 = v64;
      v58[1](v59, v16);
    }
    id v65 = objc_allocWithZone((Class)NSXPCStoreServer);
    Class v66 = sub_10002E8A8().super.isa;
    swift_bridgeObjectRelease();
    id v67 = [v65 initForStoreWithURL:v63 usingModel:v60 options:v66 policy:v61];

    if (v67)
    {
      uint64_t v68 = v101;
      v93(v101, v104, v16);
      v99(v68, 0, 1, v16);
      long long v69 = v60;
      sub_100009C68(0xD00000000000001DLL, 0x8000000100031010);
      id v70 = [objc_allocWithZone(v97) init];
      if (v98(v68, 1, v16) == 1)
      {
        v72 = 0;
      }
      else
      {
        sub_10002E638(v71);
        v72 = v74;
        (*((void (**)(char *, uint64_t))v107 + 1))(v68, v16);
      }
      id v75 = objc_allocWithZone((Class)NSXPCStoreServer);
      Class v76 = sub_10002E8A8().super.isa;
      swift_bridgeObjectRelease();
      id v77 = [v75 initForStoreWithURL:v72 usingModel:v69 options:v76 policy:v70];

      uint64_t v78 = v106;
      if (v77)
      {
        char v79 = v100;
        [v67 setDelegate:v100];
        [v77 setDelegate:v79];
        uint64_t v80 = sub_10002D83C("LoadStore", 9, 2, 1);
        Swift::String v81 = (void *)swift_allocObject();
        v81[2] = v80;
        v81[3] = v79;
        id v82 = v94;
        Swift::String v83 = v108;
        v81[4] = v94;
        v81[5] = v83;
        v81[6] = v78;
        v81[7] = v67;
        v81[8] = v77;
        aBlock[4] = sub_10000B48C;
        aBlock[5] = v81;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100008D50;
        aBlock[3] = &block_descriptor_0;
        v84 = _Block_copy(aBlock);
        id v85 = v82;
        id v86 = v67;
        id v87 = v77;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_release();
        [v85 loadPersistentStoresWithCompletionHandler:v84];
        _Block_release(v84);

        swift_release();
        v88 = (void (*)(char *, uint64_t))*((void *)v107 + 1);
        v88(v104, v16);
        v88(v105, v16);
        v88(v103, v16);
        v89 = (void *)v79[9];
        v79[9] = v85;

        v90 = (void *)v79[7];
        v79[7] = v67;

        v91 = (void *)v79[8];
        v79[8] = v77;

        return;
      }
      id v73 = sub_100009E08(0xD000000000000023, 0x8000000100030FE0);
      v108(v73, 1);
    }
    else
    {
      id v73 = sub_100009E08(0xD000000000000023, 0x8000000100030FE0);
      v108(v73, 1);
    }
    v49 = (void (*)(char *, uint64_t))*((void *)v107 + 1);
    v49(v104, v16);
    v49(v105, v16);
  }
  v49(v103, v16);
}

void sub_100008B84(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(uint64_t, uint64_t), uint64_t a7, void *a8, void *a9)
{
  sub_10002DE74("LoadStore", 9, 2u, a3, 1);
  if (a2)
  {
    swift_errorRetain();
    uint64_t v15 = (void *)sub_10002E5E8();
    sub_10000AB80(v15, a1, a5);

    swift_errorRetain();
    a6(a2, 1);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    [a8 startListening];
    [a9 startListening];
    type metadata accessor for MapsSyncDaemonPeriodicActivityHandler();
    swift_allocObject();
    id v16 = a5;
    uint64_t v17 = sub_10002BFC0(v16);

    *(void *)(a4 + 88) = v17;
    swift_release();
    id v18 = objc_allocWithZone((Class)type metadata accessor for MapsSyncDaemonService());
    uint64_t v19 = sub_10000C758(v16);
    uint64_t v20 = *(void **)(a4 + 80);
    *(void *)(a4 + 80) = v19;

    uint64_t v21 = *(void *)(a4 + 88);
    if (v21)
    {
      uint64_t v22 = *(void **)(a4 + 80);
      uint64_t v23 = *(void **)(v21 + 32);
      *(void *)(v21 + 32) = v22;
      id v24 = v22;
    }
    uint64_t v25 = *(void *)(a4 + 80);
    if (v25)
    {
      *(void *)(v25 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_activityHandler) = *(void *)(a4 + 88);
      swift_retain();
      swift_release();
    }
  }
}

void sub_100008D50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

Swift::String __swiftcall MapsSyncDaemon.identifier(for:)(NSXPCConnection a1)
{
  uint64_t v1 = 0x636E79537370614DLL;
  objc_super v2 = (void *)0xEC0000004350582DLL;
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

id *MapsSyncDaemon.deinit()
{
  swift_release();
  return v0;
}

uint64_t MapsSyncDaemon.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_100008F50()
{
  uint64_t v1 = sub_10002EAD8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002EAB8();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10002E848();
  __chkstk_darwin(v6 - 8);
  *(void *)(v0 + 16) = 5;
  *(_OWORD *)(v0 + 24) = xmmword_10002FAC0;
  *(void *)(v0 + 40) = 0x3FF8000000000000;
  sub_1000049A0(0, (unint64_t *)&unk_100048360);
  sub_10002E838();
  v8[1] = &_swiftEmptyArrayStorage;
  sub_10000B540((unint64_t *)&unk_1000470F0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048370);
  sub_10000B588();
  sub_10002EC58();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)(v0 + 48) = sub_10002EB08();
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(void *)(v0 + 88) = 0;
  return v0;
}

void sub_10000921C(void *a1, id a2)
{
  if ((v2[OBJC_IVAR____TtC9mapssyncd40MapsSyncStoreServerRequestHandlingPolicy_mapsInstalled] & 1) == 0)
  {
    if (qword_1000470C0 != -1) {
      swift_once();
    }
    id v11 = objc_allocWithZone((Class)NSError);
    swift_bridgeObjectRetain();
    NSString v12 = sub_10002E8E8();
    swift_bridgeObjectRelease();
    [v11 initWithDomain:v12 code:11 userInfo:0];
LABEL_21:

    swift_willThrow();
    return;
  }
  if (!a2)
  {
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v4 = v2;
  id v6 = [a2 entitlements];
  if (!v6)
  {
LABEL_27:
    __break(1u);
    return;
  }
  id v7 = v6;
  uint64_t v8 = sub_10002E8B8();

  id v27 = (void *)0xD000000000000016;
  unint64_t v28 = 0x8000000100030EF0;
  sub_10002EC98();
  if (*(void *)(v8 + 16) && (unint64_t v9 = sub_100029F2C((uint64_t)&v29), (v10 & 1) != 0))
  {
    sub_10000B374(*(void *)(v8 + 56) + 32 * v9, (uint64_t)&v31);
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000B2CC((uint64_t)&v29);
  if (!*((void *)&v32 + 1))
  {
    sub_10000B3D0((uint64_t)&v31, &qword_100047A60);
    goto LABEL_18;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    id v29 = 0;
    v26.receiver = v4;
    v26.super_class = (Class)type metadata accessor for MapsSyncStoreServerRequestHandlingPolicy();
    id v15 = objc_msgSendSuper2(&v26, "processRequest:fromClientWithContext:error:", a1, a2, &v29);
    id v16 = v29;
    if (v15)
    {
      sub_10002EC48();
      swift_unknownObjectRelease();
      return;
    }
    NSString v12 = v16;
    sub_10002E5F8();
    goto LABEL_21;
  }
  if (!a1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  id v29 = a1;
  id v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047540);
  id v29 = (id)sub_10002EC28();
  unint64_t v30 = v13;
  *(void *)&long long v31 = 0xD000000000000011;
  *((void *)&v31 + 1) = 0x8000000100030F10;
  sub_10000B320();
  char v14 = sub_10002EC38();
  swift_bridgeObjectRelease();
  if (v14)
  {
    swift_bridgeObjectRelease();

    goto LABEL_18;
  }
  id v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  sub_10002ECD8(19);
  swift_bridgeObjectRelease();
  id v29 = v27;
  unint64_t v30 = v28;
  v33._countAndFlagsBits = 0x7473657571657220;
  v33._object = (void *)0xEF203E2D20676E69;
  sub_10002E948(v33);
  id v17 = [v24 description];
  uint64_t v18 = sub_10002E8F8();
  uint64_t v20 = v19;

  v34._countAndFlagsBits = v18;
  v34._object = v20;
  sub_10002E948(v34);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0((uint64_t)v29, v30);
  swift_bridgeObjectRelease();
  id v29 = 0;
  v25.receiver = v4;
  v25.super_class = (Class)type metadata accessor for MapsSyncStoreServerRequestHandlingPolicy();
  id v21 = objc_msgSendSuper2(&v25, "processRequest:fromClientWithContext:error:", v24, a2, &v29);
  id v22 = v29;
  if (v21)
  {
    sub_10002EC48();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v23 = v22;
    sub_10002E5F8();

    swift_willThrow();
  }
}

void sub_100009694(void *a1, uint64_t a2)
{
  id v14 = 0;
  v13.receiver = v2;
  v13.super_class = (Class)type metadata accessor for MapsSyncStoreServerRequestHandlingPolicy();
  id v5 = objc_msgSendSuper2(&v13, "processFaultForObjectWithID:fromClientWithContext:error:", a1, a2, &v14);
  id v6 = v14;
  if (!v5)
  {
    uint64_t v8 = v6;
    sub_10002E5F8();

    swift_willThrow();
    if (!GEOConfigGetBOOL()) {
      return;
    }
    if (a1)
    {
      id v7 = [a1 persistentStore];
      if (!v7) {
        return;
      }
      goto LABEL_9;
    }
LABEL_12:
    __break(1u);
    return;
  }
  sub_10002EC48();
  swift_unknownObjectRelease();
  if (!GEOConfigGetBOOL()) {
    return;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_12;
  }
  id v7 = [a1 persistentStore];
  if (!v7) {
    return;
  }
LABEL_9:
  unint64_t v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000483D0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10002F990;
  *(void *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_100047538);
  *(void *)(v10 + 32) = a1;
  id v11 = a1;
  Class isa = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v9, "_mapsSyncDidUnregisterObjectsWithIDs_112229675:", isa);
}

id sub_100009888(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void (*a6)(void *__return_ptr, void *, void *))
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  a6(v15, a3, a4);

  __swift_project_boxed_opaque_existential_0(v15, v15[3]);
  objc_super v13 = (void *)sub_10002ED88();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return v13;
}

id sub_100009990()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncStoreServerRequestHandlingPolicy();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_1000099C4()
{
  id v0 = objc_allocWithZone((Class)NSPersistentStoreDescription);
  sub_10002E638(v1);
  uint64_t v3 = v2;
  id v4 = [v0 initWithURL:v2];

  [v4 setType:NSSQLiteStoreType];
  sub_10002E8F8();
  NSString v5 = sub_10002E8E8();
  swift_bridgeObjectRelease();
  [v4 setOption:v5 forKey:NSPersistentStoreFileProtectionKey];

  sub_1000049A0(0, &qword_100047588);
  Class isa = sub_10002EBD8(1).super.super.isa;
  [v4 setOption:isa forKey:NSPersistentStoreRemoteChangeNotificationPostOptionKey];

  Class v7 = sub_10002EBD8(1).super.super.isa;
  [v4 setOption:v7 forKey:NSPersistentHistoryTrackingKey];

  Class v8 = sub_10002EBD8(1).super.super.isa;
  [v4 setOption:v8 forKey:NSPersistentStoreServiceConfigurationOptionKey];

  NSString v9 = sub_10002E8E8();
  [v4 setConfiguration:v9];

  id v10 = objc_allocWithZone((Class)NSCloudKitMirroringDelegateOptions);
  NSString v11 = sub_10002E8E8();
  id v12 = [v10 initWithContainerIdentifier:v11];

  NSString v13 = sub_10002E8E8();
  [v12 setApsConnectionMachServiceName:v13];

  [v12 setUseDeviceToDeviceEncryption:1];
  [v12 setAutomaticallyScheduleImportAndExportOperations:1];
  Class v14 = sub_10002EBE8(0x200000).super.super.isa;
  [v12 setOperationMemoryThresholdBytes:v14];

  id v15 = [objc_allocWithZone((Class)NSCloudKitMirroringDelegate) initWithOptions:v12];
  [v4 setMirroringDelegate:v15];

  return v4;
}

unint64_t sub_100009C68(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1000482C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002FAD0;
  sub_10002E8F8();
  sub_10002EC98();
  *(void *)(inited + 96) = &type metadata for Bool;
  *(unsigned char *)(inited + 72) = 1;
  sub_10002E8F8();
  sub_10002EC98();
  *(void *)(inited + 168) = &type metadata for Bool;
  *(unsigned char *)(inited + 144) = 1;
  sub_10002E8F8();
  sub_10002EC98();
  *(void *)(inited + 240) = &type metadata for Bool;
  *(unsigned char *)(inited + 216) = 1;
  sub_10002E8F8();
  sub_10002EC98();
  *(void *)(inited + 312) = &type metadata for Bool;
  *(unsigned char *)(inited + 288) = 1;
  sub_10002E8F8();
  sub_10002EC98();
  *(void *)(inited + 384) = &type metadata for String;
  *(void *)(inited + 360) = a1;
  *(void *)(inited + 368) = a2;
  swift_bridgeObjectRetain();
  return sub_10001765C(inited);
}

id sub_100009E08(uint64_t a1, uint64_t a2)
{
  if (qword_1000470C0 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047590);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002F990;
  *(void *)(inited + 32) = sub_10002E8F8();
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000177A0(inited);
  id v6 = objc_allocWithZone((Class)NSError);
  NSString v7 = sub_10002E8E8();
  swift_bridgeObjectRelease();
  Class isa = sub_10002E8A8().super.isa;
  swift_bridgeObjectRelease();
  id v9 = [v6 initWithDomain:v7 code:-1 userInfo:isa];

  return v9;
}

id sub_100009F64(void *a1)
{
  sub_10002ECD8(25);
  swift_bridgeObjectRelease();
  v17[0] = (id)0xD000000000000017;
  v17[1] = (id)0x80000001000311A0;
  id v2 = [a1 description];
  uint64_t v3 = sub_10002E8F8();
  uint64_t v5 = v4;

  v19._countAndFlagsBits = v3;
  v19._object = v5;
  sub_10002E948(v19);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000017, 0x80000001000311A0);
  swift_bridgeObjectRelease();
  v6.super.super.Class isa = sub_10002E9E8().super.super.isa;
  if (!_kCFURLIsExcludedFromCloudBackupKey)
  {
    __break(1u);
    goto LABEL_12;
  }
  sub_10002E8F8();
  NSString v7 = sub_10002E8E8();
  swift_bridgeObjectRelease();
  v17[0] = 0;
  unsigned int v8 = [a1 setResourceValue:v6.super.super.isa forKey:v7 error:v17];

  if (v8)
  {
    id v9 = v17[0];
  }
  else
  {
    id v10 = v17[0];
    sub_10002E5F8();

    swift_willThrow();
    swift_errorRelease();
  }
  v11.super.super.Class isa = sub_10002E9E8().super.super.isa;
  if (!_kCFURLIsExcludedFromUnencryptedBackupKey) {
LABEL_12:
  }
    __break(1u);
  sub_10002E8F8();
  NSString v12 = sub_10002E8E8();
  swift_bridgeObjectRelease();
  v17[0] = 0;
  unsigned int v13 = [a1 setResourceValue:v11.super.super.isa forKey:v12 error:v17];

  id v14 = v17[0];
  if (v13)
  {
    return v14;
  }
  else
  {
    id v16 = v17[0];
    sub_10002E5F8();

    swift_willThrow();
    return (id)swift_errorRelease();
  }
}

uint64_t sub_10000A1C8()
{
  uint64_t v0 = sub_10002E688();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  sub_10002ECD8(47);
  swift_bridgeObjectRelease();
  uint64_t v8 = 0xD00000000000002DLL;
  unint64_t v9 = 0x8000000100031170;
  sub_10000B540((unint64_t *)&qword_100047580, (void (*)(uint64_t))&type metadata accessor for URL);
  v10._countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v10);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v8, v9);
  swift_bridgeObjectRelease();
  sub_10002E658();
  sub_10002E638(v4);
  NSNumber v6 = v5;
  sub_100009F64(v5);

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_10000A354(unint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (unsigned int (**)(id, uint64_t, uint64_t))((char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_10002E688();
  unint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  Swift::String v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  unsigned int v13 = (char *)&v50 - v12;
  __chkstk_darwin(v11);
  id v15 = (char *)&v50 - v14;
  id v16 = [a2 persistentStoreCoordinator];
  sub_10002E638(v17);
  Swift::String v19 = v18;
  id v70 = 0;
  unsigned int v20 = [v16 destroyPersistentStoreAtURL:v18 withType:NSSQLiteStoreType options:0 error:&v70];

  id v21 = v70;
  if (v20)
  {
    id v22 = v21;
  }
  else
  {
    Class v66 = (void (**)(id, void, uint64_t, uint64_t))v13;
    uint64_t v59 = v10;
    id v60 = v5;
    uint64_t v68 = v70;
    uint64_t v23 = v70;
    uint64_t v24 = sub_10002E5F8();

    swift_willThrow();
    id v70 = 0;
    unint64_t v71 = 0xE000000000000000;
    sub_10002ECD8(36);
    swift_bridgeObjectRelease();
    id v70 = (unsigned int (**)(id, uint64_t, uint64_t))0xD000000000000022;
    unint64_t v71 = 0x8000000100031100;
    uint64_t v69 = v24;
    uint64_t v50 = v24;
    swift_errorRetain();
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
    v73._countAndFlagsBits = sub_10002E908();
    sub_10002E948(v73);
    swift_bridgeObjectRelease();
    objc_super v25 = v70;
    id v26 = (id)v71;
    sub_10002EAA8();
    if (qword_100047060 != -1) {
LABEL_17:
    }
      swift_once();
    uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v27 = swift_allocObject();
    long long v54 = xmmword_10002F990;
    *(_OWORD *)(v27 + 16) = xmmword_10002F990;
    *(void *)(v27 + 56) = &type metadata for String;
    unint64_t v53 = sub_100007844();
    *(void *)(v27 + 64) = v53;
    *(void *)(v27 + 32) = v25;
    *(void *)(v27 + 40) = v26;
    swift_bridgeObjectRetain();
    sub_10002E768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v28 = (unsigned int (**)(id, uint64_t, uint64_t))sub_10002E628();
    uint64_t v63 = v28;
    unint64_t v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047578);
    long long v31 = *(char **)(v7 + 72);
    unint64_t v32 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v68 = (unsigned int (**)(id, uint64_t, uint64_t))(2 * (void)v31);
    v58 = v31;
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_10002FAE0;
    uint64_t v67 = v33;
    unint64_t v34 = v33 + v32;
    v64 = *(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16);
    unint64_t v65 = v7 + 16;
    v64(v33 + v32, a1, v6);
    sub_10002E658();
    id v70 = v28;
    unint64_t v71 = v30;
    swift_bridgeObjectRetain();
    v74._countAndFlagsBits = 1818326829;
    v74._object = (void *)0xE400000000000000;
    sub_10002E948(v74);
    sub_10002E648();
    swift_bridgeObjectRelease();
    a1 = v7 + 8;
    uint64_t v35 = *(void (**)(char *, uint64_t))(v7 + 8);
    v35(v15, v6);
    uint64_t v36 = v66;
    sub_10002E658();
    id v70 = v63;
    unint64_t v71 = v30;
    swift_bridgeObjectRetain();
    v75._countAndFlagsBits = 1835561773;
    v75._object = (void *)0xE400000000000000;
    sub_10002E948(v75);
    swift_bridgeObjectRelease();
    id v26 = v36;
    sub_10002E648();
    swift_bridgeObjectRelease();
    v62 = v35;
    v35((char *)v36, v6);
    uint64_t v68 = (unsigned int (**)(id, uint64_t, uint64_t))[self defaultManager];
    unint64_t v7 = 0;
    Class v66 = (void (**)(id, void, uint64_t, uint64_t))(a1 + 48);
    uint64_t v63 = (unsigned int (**)(id, uint64_t, uint64_t))(a1 + 40);
    id v61 = (void (**)(char *, id, uint64_t))(a1 + 24);
    uint64_t v52 = 0xD000000000000032;
    id v15 = v58;
    id v51 = (void *)0x8000000100031130;
    uint64_t v37 = v59;
    objc_super v25 = v60;
    uint64_t v57 = v6;
    do
    {
      if (v7 >= *(void *)(v67 + 16))
      {
        __break(1u);
        goto LABEL_17;
      }
      v64((unint64_t)v25, v34, v6);
      Swift::String v43 = (void (*)(unsigned int (**)(id, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))*v66;
      (*v66)(v25, 0, 1, v6);
      if ((*v63)(v25, 1, v6) == 1) {
        goto LABEL_15;
      }
      (*v61)(v37, v25, v6);
      sub_10002E678();
      NSString v44 = sub_10002E8E8();
      swift_bridgeObjectRelease();
      id v26 = [v68 fileExistsAtPath:v44];

      if (v26)
      {
        sub_10002E638(v45);
        id v47 = v46;
        id v70 = 0;
        unsigned int v48 = [v68 removeItemAtURL:v46 error:&v70];

        id v26 = v70;
        if (v48)
        {
          v49 = v70;
        }
        else
        {
          id v38 = v70;
          uint64_t v39 = sub_10002E5F8();

          swift_willThrow();
          id v70 = 0;
          unint64_t v71 = 0xE000000000000000;
          sub_10002ECD8(52);
          v76._countAndFlagsBits = v52;
          v76._object = v51;
          sub_10002E948(v76);
          uint64_t v69 = v39;
          swift_errorRetain();
          v77._countAndFlagsBits = sub_10002E908();
          sub_10002E948(v77);
          swift_bridgeObjectRelease();
          uint64_t v40 = v70;
          id v26 = (id)v71;
          sub_10002EAA8();
          uint64_t v41 = swift_allocObject();
          *(_OWORD *)(v41 + 16) = v54;
          unint64_t v42 = v53;
          *(void *)(v41 + 56) = &type metadata for String;
          *(void *)(v41 + 64) = v42;
          *(void *)(v41 + 32) = v40;
          *(void *)(v41 + 40) = v26;
          objc_super v25 = v60;
          swift_bridgeObjectRetain();
          uint64_t v6 = v57;
          sub_10002E768();
          swift_bridgeObjectRelease();
          id v15 = v58;
          swift_bridgeObjectRelease();
          uint64_t v37 = v59;
          swift_errorRelease();
        }
      }
      ++v7;
      v62(v37, v6);
      v34 += (unint64_t)v15;
    }
    while (v7 != 3);
    v43(v25, 1, 1, v6);
LABEL_15:
    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
}

uint64_t sub_10000AB80(void *a1, void *a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v38 - v10;
  uint64_t v12 = sub_10002E688();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v15 = (char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    return sub_10000B3D0((uint64_t)v11, &qword_100047550);
  }
  id v16 = [a2 URL];
  if (v16)
  {
    id v17 = v16;
    sub_10002E668();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v9, 1, 1, v12);
  }
  sub_10000B4D8((uint64_t)v9, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1) {
    return sub_10000B3D0((uint64_t)v11, &qword_100047550);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  if (a1)
  {
    id v19 = [a1 domain];
    uint64_t v20 = sub_10002E8F8();
    uint64_t v22 = v21;

    v38[0] = a1;
    id v23 = [a1 code];
    if (sub_10002E8F8() == v20 && v24 == v22)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v25 = sub_10002ED98();
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0) {
        goto LABEL_14;
      }
    }
    if (v23 == (id)256) {
      goto LABEL_34;
    }
LABEL_14:
    if (sub_10002E8F8() == v20 && v26 == v22)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v27 = sub_10002ED98();
      swift_bridgeObjectRelease();
      if ((v27 & 1) == 0) {
        goto LABEL_19;
      }
    }
    if (v23 == (id)259) {
      goto LABEL_34;
    }
LABEL_19:
    if (sub_10002E8F8() == v20 && v28 == v22)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v29 = sub_10002ED98();
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0)
      {
LABEL_24:
        if (sub_10002E8F8() == v20 && v30 == v22)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v31 = sub_10002ED98();
          swift_bridgeObjectRelease();
          if ((v31 & 1) == 0)
          {
LABEL_29:
            if (sub_10002E8F8() == v20 && v32 == v22)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v33 = sub_10002ED98();
              swift_bridgeObjectRelease();
              if ((v33 & 1) == 0) {
                goto LABEL_37;
              }
            }
            if (v23 == (id)14) {
              goto LABEL_34;
            }
LABEL_37:
            swift_bridgeObjectRelease();
            unint64_t v39 = 0;
            unint64_t v40 = 0xE000000000000000;
            sub_10002ECD8(42);
            swift_bridgeObjectRelease();
            unint64_t v39 = 0xD000000000000028;
            unint64_t v40 = 0x80000001000310D0;
            v38[1] = v38[0];
            id v34 = v38[0];
            __swift_instantiateConcreteTypeFromMangledName(&qword_100047568);
            v41._countAndFlagsBits = sub_10002E908();
            sub_10002E948(v41);
            swift_bridgeObjectRelease();
            unint64_t v36 = v39;
            unint64_t v35 = v40;
            sub_10002EAA8();
            if (qword_100047060 != -1) {
              swift_once();
            }
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
            uint64_t v37 = swift_allocObject();
            *(_OWORD *)(v37 + 16) = xmmword_10002F990;
            *(void *)(v37 + 56) = &type metadata for String;
            *(void *)(v37 + 64) = sub_100007844();
            *(void *)(v37 + 32) = v36;
            *(void *)(v37 + 40) = v35;
            swift_bridgeObjectRetain();
            sub_10002E768();
            swift_bridgeObjectRelease();
            goto LABEL_35;
          }
        }
        if (v23 != (id)26) {
          goto LABEL_29;
        }
LABEL_34:
        sub_10000A354((unint64_t)v15, a3);
LABEL_35:
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      }
    }
    if (v23 == (id)11) {
      goto LABEL_34;
    }
    goto LABEL_24;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t _s9mapssyncd14MapsSyncDaemonC19willPerformRecovery8forError4fromSbs0I0_pSg_So33NSXPCStoreServerConnectionContextCSgtF_0()
{
  sub_10002ECD8(20);
  swift_bridgeObjectRelease();
  swift_errorRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047B40);
  v2._countAndFlagsBits = sub_10002E908();
  sub_10002E948(v2);
  swift_bridgeObjectRelease();
  sub_10002EAA8();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10002F990;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = sub_100007844();
  *(void *)(v0 + 32) = 0xD000000000000012;
  *(void *)(v0 + 40) = 0x8000000100031200;
  swift_bridgeObjectRetain();
  sub_10002E768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t type metadata accessor for MapsSyncDaemon()
{
  return self;
}

uint64_t type metadata accessor for MapsSyncStoreServerRequestHandlingPolicy()
{
  return self;
}

uint64_t sub_10000B2CC(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000B320()
{
  unint64_t result = qword_100047548;
  if (!qword_100047548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047548);
  }
  return result;
}

uint64_t sub_10000B374(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B3D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B42C()
{
  swift_release();
  swift_release();

  swift_release();
  return _swift_deallocObject(v0, 72, 7);
}

void sub_10000B48C(void *a1, uint64_t a2)
{
  sub_100008B84(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), *(void (**)(uint64_t, uint64_t))(v2 + 40), *(void *)(v2 + 48), *(void **)(v2 + 56), *(void **)(v2 + 64));
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

uint64_t sub_10000B4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B540(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000B588()
{
  unint64_t result = qword_100047100;
  if (!qword_100047100)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_100048370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047100);
  }
  return result;
}

id sub_10000B63C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedIncidentReport();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedIncidentReport()
{
  return self;
}

id sub_10000B6EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedMixinMapItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedMixinMapItem()
{
  return self;
}

uint64_t MapsSyncDataBaseDefault.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MapsSyncDataBase_initial()
{
  return self;
}

uint64_t sub_10000B778@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedVehicle();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

uint64_t sub_10000B7BC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedIncidentReport();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

uint64_t sub_10000B800@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedCachedUserReview();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_10000B89C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedReviewedPlace();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedReviewedPlace()
{
  return self;
}

uint64_t sub_10000B8F4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedRAPRecord();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

uint64_t static MapsSyncDataBaseDefault.containerUrl.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100047050 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100016AE8(0, a1);
  return swift_release();
}

uint64_t sub_10000B9B8()
{
  type metadata accessor for MapsSyncDataBase_0_0_1();
  uint64_t result = swift_allocObject();
  qword_1000484E0 = result;
  return result;
}

uint64_t static MapsSyncDataBaseDefault.modelUrl.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100047050 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100017218(a1);
  return swift_release();
}

uint64_t MapsSyncDataBaseDefault.deinit()
{
  return v0;
}

uint64_t type metadata accessor for MapsSyncDataBaseDefault()
{
  return self;
}

id sub_10000BAE8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedAnalyticsIdentifier()
{
  return self;
}

id sub_10000BB98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryEvDirectionsItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryEvDirectionsItem()
{
  return self;
}

id sub_10000BC48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryPlaceItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryPlaceItem()
{
  return self;
}

id sub_10000BCF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedVehicle();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedVehicle()
{
  return self;
}

uint64_t sub_10000BD50@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_10000BDEC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedAnonymousCredential();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedAnonymousCredential()
{
  return self;
}

uint64_t sub_10000BE44(void *a1)
{
  objc_super v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A48);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v52 = (uint64_t)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v53 = (char *)&v51 - v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v51 - v9;
  uint64_t v56 = sub_10002E718();
  uint64_t v11 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v56 - 8);
  uint64_t v12 = __chkstk_darwin(v56);
  uint64_t v55 = (uint64_t (**)(char *, uint64_t))((char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  long long v54 = (char *)&v51 - v14;
  uint64_t v59 = 0;
  unint64_t v60 = 0xE000000000000000;
  sub_10002ECD8(27);
  id v61 = v1;
  type metadata accessor for CKContainerEventState();
  swift_retain();
  v62._countAndFlagsBits = sub_10002E908();
  sub_10002E948(v62);
  swift_bridgeObjectRelease();
  v63._countAndFlagsBits = 8250;
  v63._object = (void *)0xE200000000000000;
  sub_10002E948(v63);
  id v61 = [a1 type];
  type metadata accessor for EventType(0);
  sub_10002ED18();
  v64._countAndFlagsBits = 0x203A746E65766520;
  v64._object = (void *)0xE800000000000000;
  sub_10002E948(v64);
  id v15 = [a1 description];
  uint64_t v16 = sub_10002E8F8();
  uint64_t v18 = v17;

  v65._countAndFlagsBits = v16;
  v65._object = v18;
  sub_10002E948(v65);
  swift_bridgeObjectRelease();
  v66._countAndFlagsBits = 0x3A726F727265202CLL;
  v66._object = (void *)0xE900000000000020;
  sub_10002E948(v66);
  id v19 = [a1 error];
  id v61 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047B40);
  uint64_t v20 = sub_10002EC28();
  uint64_t v22 = v21;

  v67._countAndFlagsBits = v20;
  v67._object = v22;
  sub_10002E948(v67);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v59, v60);
  swift_bridgeObjectRelease();
  id v23 = [a1 error];
  swift_beginAccess();
  id v61 = v23;
  uint64_t v24 = *((void *)v2 + 3);
  v58 = &v61;
  char v25 = (void *)(v24 + 16);
  uint64_t v26 = (os_unfair_lock_s *)(v24 + 24);
  swift_errorRetain();
  os_unfair_lock_lock(v26);
  sub_100013F0C(v25);
  os_unfair_lock_unlock(v26);
  swift_errorRelease();
  swift_endAccess();

  swift_beginAccess();
  LOBYTE(v61) = 1;
  char v27 = (os_unfair_lock_s *)*((void *)v2 + 4);
  uint64_t v57 = &v61;
  uint64_t v28 = v27 + 4;
  char v29 = v27 + 5;
  os_unfair_lock_lock(v27 + 5);
  sub_100013F58(v28);
  os_unfair_lock_unlock(v29);
  swift_endAccess();
  id v30 = [a1 endDate];
  if (!v30)
  {
    v11[7](v10, 1, 1, v56);
    return sub_10000B3D0((uint64_t)v10, &qword_100047A48);
  }
  char v31 = v30;
  uint64_t v32 = v55;
  sub_10002E6F8();

  char v33 = v11[4];
  id v34 = v32;
  uint64_t v35 = v56;
  ((void (*)(char *, uint64_t (**)(char *, uint64_t), uint64_t))v33)(v10, v34, v56);
  id v51 = v11[7];
  v51(v10, 0, 1, v35);
  uint64_t v55 = (uint64_t (**)(char *, uint64_t))v11;
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v11[6])(v10, 1, v35) == 1) {
    return sub_10000B3D0((uint64_t)v10, &qword_100047A48);
  }
  unint64_t v36 = v54;
  ((void (*)(char *, char *, uint64_t))v33)(v54, v10, v56);
  uint64_t v37 = swift_beginAccess();
  LOBYTE(v61) = 0;
  __chkstk_darwin(v37);
  *(&v51 - 2) = (void (*)(char *, uint64_t, uint64_t, uint64_t))&v61;
  unint64_t v39 = v38 + 4;
  unint64_t v40 = v38 + 5;
  os_unfair_lock_lock(v38 + 5);
  sub_1000140B8(v39);
  os_unfair_lock_unlock(v40);
  swift_endAccess();
  if (![a1 succeeded]) {
    return v55[1](v36, v56);
  }
  unint64_t v42 = v55;
  uint64_t v41 = v56;
  Swift::String v43 = v36;
  uint64_t v44 = (uint64_t)v53;
  ((void (*)(char *, char *, uint64_t))v55[2])(v53, v43, v56);
  v51((char *)v44, 0, 1, v41);
  uint64_t v45 = v52;
  sub_100013230(v44, v52);
  uint64_t v46 = swift_beginAccess();
  __chkstk_darwin(v46);
  *(&v51 - 2) = (void (*)(char *, uint64_t, uint64_t, uint64_t))v45;
  uint64_t v48 = v47 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v47 + 16);
  v49 = (os_unfair_lock_s *)(v47 + ((*(unsigned int *)(*(void *)v47 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v49);
  sub_100013F68(v48);
  os_unfair_lock_unlock(v49);
  sub_10000B3D0(v45, &qword_100047A48);
  swift_endAccess();
  sub_10000B3D0(v44, &qword_100047A48);
  return v42[1](v54, v41);
}

uint64_t sub_10000C4F8()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CKContainerEventState()
{
  return self;
}

void *sub_10000C564()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A48);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v12 - v5;
  uint64_t v7 = sub_10002E718();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_100013230((uint64_t)v6, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047B50);
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + ((*(unsigned int *)(*(void *)v8 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_100013230((uint64_t)v4, v8 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v8 + 16));
  sub_10000B3D0((uint64_t)v4, &qword_100047A48);
  sub_10000B3D0((uint64_t)v6, &qword_100047A48);
  v0[2] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047B58);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 24) = 0;
  *(void *)(v9 + 16) = 0;
  v0[3] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047B60);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 20) = 0;
  *(unsigned char *)(v10 + 16) = 0;
  v0[4] = v10;
  return v0;
}

char *sub_10000C758(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kSyncDateSetupThreashold;
  uint64_t v4 = v1;
  GEOConfigGetDouble();
  *(void *)&v1[v3] = v5;
  uint64_t v6 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kInitialSyncCheckEnabled;
  v4[v6] = GEOConfigGetBOOL();
  uint64_t v7 = &v4[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kOSVersionKey];
  *(void *)uint64_t v7 = 0x6F6973726576736FLL;
  *((void *)v7 + 1) = 0xE90000000000006ELL;
  uint64_t v8 = &v4[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kLastSyncDateKey];
  strcpy(&v4[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kLastSyncDateKey], "lastsyncdate");
  v8[13] = 0;
  *((_WORD *)v8 + 7) = -5120;
  *(void *)&v4[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_activityHandler] = 0;
  uint64_t v9 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService__accountStatus;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047B48);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 24) = 0;
  *(void *)(v10 + 16) = 0;
  *(void *)&v4[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_setupState;
  type metadata accessor for CKContainerEventState();
  uint64_t v12 = swift_allocObject();
  sub_10000C564();
  *(void *)&v4[v11] = v12;
  uint64_t v13 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_importState;
  uint64_t v14 = swift_allocObject();
  sub_10000C564();
  *(void *)&v4[v13] = v14;
  uint64_t v15 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_exportState;
  uint64_t v16 = swift_allocObject();
  sub_10000C564();
  *(void *)&v4[v15] = v16;
  id v17 = objc_allocWithZone((Class)NSXPCListener);
  NSString v18 = sub_10002E8E8();
  id v19 = [v17 initWithMachServiceName:v18];

  *(void *)&v4[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_listener] = v19;
  id v20 = [a1 newBackgroundContext];
  *(void *)&v4[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_moc] = v20;
  id v21 = v20;
  [v21 setAutomaticallyMergesChangesFromParent:1];

  v30.receiver = v4;
  v30.super_class = (Class)type metadata accessor for MapsSyncDaemonService();
  uint64_t v22 = (char *)objc_msgSendSuper2(&v30, "init");
  id v23 = *(void **)&v22[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_listener];
  uint64_t v24 = v22;
  [v23 setDelegate:v24];
  [v23 resume];
  char v25 = self;
  id v26 = [v25 defaultCenter];
  [v26 addObserver:v24 selector:"cloudKitContainerEventWithNotification:" name:NSPersistentCloudKitContainerEventChangedNotification object:0];

  id v27 = [v25 defaultCenter];
  uint64_t v28 = v24;
  [v27 addObserver:v28 selector:"cloudKitAccountChangedWithNotification:" name:CKAccountChangedNotification object:0];

  return v28;
}

void sub_10000CB84(void *a1)
{
  uint64_t v2 = v1;
  id v3 = [a1 userInfo];
  if (!v3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
LABEL_11:
    sub_10000B3D0((uint64_t)&v20, &qword_100047A60);
    return;
  }
  uint64_t v4 = v3;
  uint64_t v5 = sub_10002E8B8();

  sub_10002E8F8();
  sub_10002EC98();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_100029F2C((uint64_t)&v18), (v7 & 1) != 0))
  {
    sub_10000B374(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v20);
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10000B2CC((uint64_t)&v18);
  if (!*((void *)&v21 + 1)) {
    goto LABEL_11;
  }
  sub_1000049A0(0, (unint64_t *)&unk_100047AB0);
  if (swift_dynamicCast())
  {
    id v8 = v18;
    if ((unint64_t)[v18 type] > 2)
    {
      id v18 = 0;
      unint64_t v19 = 0xE000000000000000;
      sub_10002ECD8(25);
      id v9 = v2;
      id v10 = [v9 description];
      uint64_t v11 = (void *)sub_10002E8F8();
      unint64_t v13 = v12;
      swift_bridgeObjectRelease();

      id v18 = v11;
      unint64_t v19 = v13;
      v22._object = (void *)0x8000000100031D10;
      v22._countAndFlagsBits = 0xD000000000000014;
      sub_10002E948(v22);
      id v14 = [v8 description];
      uint64_t v15 = sub_10002E8F8();
      id v17 = v16;

      v23._countAndFlagsBits = v15;
      v23._object = v17;
      sub_10002E948(v23);
      swift_bridgeObjectRelease();
      v24._countAndFlagsBits = 41;
      v24._object = (void *)0xE100000000000000;
      sub_10002E948(v24);
      _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0((uint64_t)v18, v19);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_retain();
      sub_10000BE44(v8);
      swift_release();
    }
  }
}

uint64_t sub_10000CE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 96) = a4;
  return _swift_task_switch(sub_10000CEA0, 0, 0);
}

uint64_t sub_10000CEA0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    id v3 = (os_unfair_lock_s **)(Strong + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService__accountStatus);
    swift_beginAccess();
    *(void *)(v0 + 88) = 0;
    uint64_t v4 = *v3;
    *(void *)(swift_task_alloc() + 16) = v0 + 88;
    uint64_t v5 = (id *)&v4[4];
    v4 += 6;
    os_unfair_lock_lock(v4);
    sub_1000140D0(v5);
    os_unfair_lock_unlock(v4);
    swift_task_dealloc();

    swift_endAccess();
  }
  swift_beginAccess();
  uint64_t v6 = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 104) = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v8;
    void *v8 = v0;
    v8[1] = sub_10000D098;
    v8[19] = v7;
    return _swift_task_switch(sub_10000D4DC, 0, 0);
  }
  else
  {
    id v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_10000D098(void *a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  uint64_t v6 = *(void **)(v4 + 104);
  if (v1) {
    swift_errorRelease();
  }
  else {

  }
  uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
  return v7();
}

uint64_t sub_10000D1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002EA38();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10002EA28();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000B3D0(a1, &qword_100048380);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10002E9F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000D4BC()
{
  *(void *)(v1 + 152) = v0;
  return _swift_task_switch(sub_10000D4DC, 0, 0);
}

uint64_t sub_10000D4DC()
{
  uint64_t v15 = v0;
  uint64_t v1 = v0[19];
  uint64_t v2 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService__accountStatus;
  v0[20] = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService__accountStatus;
  id v3 = (os_unfair_lock_s **)(v1 + v2);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = (void **)&(*v3)[4];
  swift_retain();
  os_unfair_lock_lock(v4 + 6);
  sub_100013200(v5, &v14);
  v0[21] = 0;
  os_unfair_lock_unlock(v4 + 6);
  uint64_t v6 = v14;
  swift_release();
  if (v6)
  {
    uint64_t v7 = (uint64_t (*)(void *))v0[1];
    return v7(v6);
  }
  else
  {
    id v9 = objc_allocWithZone((Class)CKContainerID);
    NSString v10 = sub_10002E8E8();
    id v11 = [v9 initWithContainerIdentifier:v10 environment:1];
    v0[22] = v11;

    id v12 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v11];
    v0[23] = v12;
    v0[2] = v0;
    v0[7] = v0 + 18;
    v0[3] = sub_10000D724;
    uint64_t v13 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_10000DADC;
    v0[13] = &block_descriptor_50;
    v0[14] = v13;
    [v12 accountInfoWithCompletionHandler:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
}

uint64_t sub_10000D724()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 192) = v1;
  if (v1) {
    uint64_t v2 = sub_10000DA64;
  }
  else {
    uint64_t v2 = sub_10000D834;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_10000D834()
{
  uint64_t v2 = *(void **)(v0 + 144);
  uint64_t v1 = v0 + 144;
  uint64_t v20 = *(void *)(v1 + 24);
  id v3 = *(char **)(v1 + 8);
  uint64_t v4 = &v3[*(void *)(v1 + 16)];

  sub_10002ECD8(22);
  uint64_t v5 = v3;
  id v6 = [v5 description];
  uint64_t v7 = sub_10002E8F8();
  unint64_t v9 = v8;

  swift_bridgeObjectRelease();
  v22._object = (void *)0x8000000100031CF0;
  v22._countAndFlagsBits = 0xD000000000000012;
  sub_10002E948(v22);
  id v10 = [v2 description];
  uint64_t v11 = sub_10002E8F8();
  uint64_t v13 = v12;

  v23._countAndFlagsBits = v11;
  v23._object = v13;
  sub_10002E948(v23);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v7, v9);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v1 = v2;
  uint64_t v14 = *(void *)v4;
  *(void *)(swift_task_alloc() + 16) = v1;
  uint64_t v15 = (os_unfair_lock_s *)(v14 + 24);
  id v16 = v2;
  os_unfair_lock_lock((os_unfair_lock_t)(v14 + 24));
  sub_1000137AC((id *)(v14 + 16));
  if (v20)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 24));
  }
  else
  {
    id v17 = *(void **)(v19 + 176);
    os_unfair_lock_unlock(v15);
    swift_task_dealloc();

    swift_endAccess();
    id v18 = *(void (**)(id))(v19 + 8);
    v18(v16);
  }
}

uint64_t sub_10000DA64()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = (void *)v0[22];
  swift_willThrow();

  id v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10000DADC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_10000DB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)&v2[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_moc];
  id v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_100013790;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_1000140A0;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100017C10;
  v12[3] = &block_descriptor_49;
  id v8 = _Block_copy(v12);
  unint64_t v9 = v2;
  swift_retain();
  swift_retain();
  swift_release();
  [v5 performBlockAndWait:v8];
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_10000DD14(uint64_t a1, void (*a2)(char *, uint64_t, void), uint64_t a3)
{
  unint64_t v40 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A48);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  __chkstk_darwin(v6);
  id v8 = (char *)&v35 - v7;
  id v9 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v10 = sub_10002E8E8();
  id v11 = [v9 initWithEntityName:v10];

  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  unint64_t v12 = sub_10002EBA8();
  uint64_t v41 = a1;
  uint64_t v42 = 0;
  unint64_t v43 = 0xE000000000000000;
  sub_10002ECD8(19);
  swift_bridgeObjectRelease();
  uint64_t v42 = 0xD000000000000036;
  unint64_t v43 = 0x8000000100031C80;
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_10002ED38();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v44 = v13;
  v45._countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v45);
  swift_bridgeObjectRelease();
  v46._countAndFlagsBits = 1935960352;
  v46._object = (void *)0xE400000000000000;
  sub_10002E948(v46);
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v42, v43);
  swift_bridgeObjectRelease();
  uint64_t v37 = v8;
  uint64_t v38 = 0;
  id v36 = v11;
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = (os_unfair_lock_s *)sub_10002ED38();
    uint64_t v14 = (uint64_t)v15;
  }
  else
  {
    uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v15 = (os_unfair_lock_s *)swift_bridgeObjectRetain();
  }
  uint64_t v16 = v41;
  uint64_t v39 = a3;
  if (v14)
  {
    if (v14 < 1)
    {
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v17 = 0;
    id v18 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v19 = (id)sub_10002ED08();
      }
      else {
        id v19 = *(id *)(v12 + 8 * v17 + 32);
      }
      uint64_t v20 = v19;
      id v21 = [v19 data];
      if (v21)
      {
        Swift::String v22 = v21;
        uint64_t v23 = sub_10002E6A8();
        uint64_t v25 = v24;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v18 = sub_100012D3C(0, *((void *)v18 + 2) + 1, 1, v18);
        }
        unint64_t v27 = *((void *)v18 + 2);
        unint64_t v26 = *((void *)v18 + 3);
        if (v27 >= v26 >> 1) {
          id v18 = sub_100012D3C((char *)(v26 > 1), v27 + 1, 1, v18);
        }
        *((void *)v18 + 2) = v27 + 1;
        uint64_t v28 = &v18[16 * v27];
        *((void *)v28 + 4) = v23;
        *((void *)v28 + 5) = v25;
        uint64_t v16 = v41;
      }
      else
      {
      }
      ++v17;
    }
    while (v14 != v17);
  }
  else
  {
    id v18 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease_n();
  uint64_t v29 = *(void *)(v16 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_importState);
  swift_beginAccess();
  uint64_t v30 = *(void *)(v29 + 16);
  uint64_t v31 = v30 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v30 + 16);
  uint64_t v32 = (os_unfair_lock_s *)(v30 + ((*(unsigned int *)(*(void *)v30 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v32);
  uint64_t v34 = (uint64_t)v37;
  uint64_t v33 = v38;
  sub_10001271C(v31, (uint64_t)v37);
  uint64_t v15 = v32;
  if (!v33)
  {
    os_unfair_lock_unlock(v32);
    swift_release();
    swift_release();
    v40(v18, v34, 0);

    swift_bridgeObjectRelease();
    sub_10000B3D0(v34, &qword_100047A48);
    return;
  }
LABEL_25:
  os_unfair_lock_unlock(v15);
  __break(1u);
}

void sub_10000E424(Class isa, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A48);
  __chkstk_darwin(v8 - 8);
  NSString v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (isa) {
    Class isa = sub_10002E998().super.isa;
  }
  sub_100013230(a2, (uint64_t)v10);
  uint64_t v11 = sub_10002E718();
  uint64_t v12 = *(void *)(v11 - 8);
  Class v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    Class v13 = sub_10002E6C8().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  if (a3) {
    uint64_t v14 = (void *)sub_10002E5E8();
  }
  else {
    uint64_t v14 = 0;
  }
  (*(void (**)(uint64_t, Class, Class, void *))(a4 + 16))(a4, isa, v13, v14);
}

uint64_t sub_10000E59C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(void **)&v5[OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_moc];
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v5;
  v12[4] = a1;
  v12[5] = a2;
  void v12[6] = a4;
  v12[7] = a5;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_100013648;
  *(void *)(v13 + 24) = v12;
  v18[4] = sub_100013668;
  v18[5] = v13;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  void v18[2] = sub_100017C10;
  v18[3] = &block_descriptor_1;
  uint64_t v14 = _Block_copy(v18);
  swift_bridgeObjectRetain();
  uint64_t v15 = v5;
  sub_100013688(a1, a2);
  swift_retain();
  swift_retain();
  swift_release();
  [v11 performBlockAndWait:v14];
  _Block_release(v14);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_10000E740(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(id), uint64_t a6)
{
  uint64_t v44 = a6;
  v41[1] = a3;
  unint64_t v42 = a4;
  uint64_t v43 = sub_10002E758();
  uint64_t v9 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10002E718();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = &MapsSyncConfig_MapsSyncManagedObjectFetchBatchSize;
  if (a1)
  {
    v41[0] = a5;
    type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
    id v17 = [(id)swift_getObjCClassFromMetadata() fetchRequest];
    sub_1000049A0(0, &qword_100047A90);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_10002F990;
    *(void *)(v18 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A98);
    *(void *)(v18 + 64) = sub_1000136F4();
    *(void *)(v18 + 32) = a1;
    swift_bridgeObjectRetain();
    id v19 = (void *)sub_10002EA78();
    [v17 setPredicate:v19];

    id v20 = [objc_allocWithZone((Class)NSBatchDeleteRequest) initWithFetchRequest:v17];
    id v46 = 0;
    unint64_t v47 = 0xE000000000000000;
    sub_10002ECD8(18);
    swift_bridgeObjectRelease();
    id v46 = (id)0xD000000000000046;
    unint64_t v47 = 0x8000000100031BE0;
    uint64_t v45 = *(void *)(a1 + 16);
    v48._countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v48);
    swift_bridgeObjectRelease();
    v49._countAndFlagsBits = 1935960352;
    v49._object = (void *)0xE400000000000000;
    sub_10002E948(v49);
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0((uint64_t)v46, v47);
    swift_bridgeObjectRelease();
    id v21 = *(void **)(a2 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_moc);
    id v46 = 0;
    id v22 = [v21 executeRequest:v20 error:&v46];
    if (!v22)
    {
      id v34 = v46;
      uint64_t v33 = sub_10002E5F8();

      swift_willThrow();
      a5 = (void (*)(id))v41[0];
      goto LABEL_10;
    }
    uint64_t v23 = v22;
    id v24 = v46;

    a5 = (void (*)(id))v41[0];
    uint64_t v16 = &MapsSyncConfig_MapsSyncManagedObjectFetchBatchSize;
  }
  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  uint64_t v25 = *(void **)(a2 + *((void *)v16 + 303));
  id v17 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithContext:v25];
  Class isa = 0;
  if (v42 >> 60 != 15) {
    Class isa = sub_10002E698().super.isa;
  }
  [v17 setData:isa];

  sub_10002E708();
  Class v27 = sub_10002E6C8().super.isa;
  uint64_t v28 = *(void (**)(char *, uint64_t))(v13 + 8);
  v28(v15, v12);
  [v17 setCreateTime:v27];

  sub_10002E708();
  Class v29 = sub_10002E6C8().super.isa;
  v28(v15, v12);
  [v17 setModificationTime:v29];

  sub_10002E748();
  Class v30 = sub_10002E738().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v43);
  [v17 setIdentifier:v30];

  [v17 setPositionIndex:0];
  id v46 = 0;
  if ([v25 save:&v46])
  {
    id v31 = v46;
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000049, 0x8000000100031B90);
    a5(0);

    return;
  }
  id v32 = v46;
  uint64_t v33 = sub_10002E5F8();

  swift_willThrow();
LABEL_10:

  id v46 = 0;
  unint64_t v47 = 0xE000000000000000;
  v50._object = (void *)0x8000000100031B50;
  v50._countAndFlagsBits = 0xD00000000000003CLL;
  sub_10002E948(v50);
  v51._countAndFlagsBits = 0x3A64656C69616620;
  v51._object = (void *)0xE900000000000020;
  sub_10002E948(v51);
  uint64_t v45 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
  sub_10002ED18();
  id v36 = v46;
  unint64_t v35 = v47;
  sub_10002EAA8();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_10002F990;
  *(void *)(v37 + 56) = &type metadata for String;
  *(void *)(v37 + 64) = sub_100007844();
  *(void *)(v37 + 32) = v36;
  *(void *)(v37 + 40) = v35;
  swift_bridgeObjectRetain();
  sub_10002E768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_1000470C0 != -1) {
    swift_once();
  }
  id v38 = objc_allocWithZone((Class)NSError);
  swift_bridgeObjectRetain();
  NSString v39 = sub_10002E8E8();
  swift_bridgeObjectRelease();
  id v40 = [v38 initWithDomain:v39 code:5 userInfo:0];

  a5(v40);
  swift_errorRelease();
}

void sub_10000EF88(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_10002E5E8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_10000EFEC()
{
  *(void *)(v1 + 16) = v0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_10000F07C;
  return sub_100012168();
}

uint64_t sub_10000F07C(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(unsigned char *)(v4 + 56) = a1 & 1;
    return _swift_task_switch(sub_10000F1D8, 0, 0);
  }
}

uint64_t sub_10000F1D8()
{
  if (*(unsigned char *)(v0 + 56) == 1)
  {
    uint64_t v1 = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_activityHandler);
    *(void *)(v0 + 32) = v1;
    if (v1)
    {
      swift_retain();
      uint64_t v2 = (void *)swift_task_alloc();
      *(void *)(v0 + 40) = v2;
      void *v2 = v0;
      v2[1] = sub_10000F37C;
      return sub_100017C38();
    }
    if (qword_1000470C0 != -1) {
      swift_once();
    }
    id v5 = objc_allocWithZone((Class)NSError);
    swift_bridgeObjectRetain();
    NSString v6 = sub_10002E8E8();
    swift_bridgeObjectRelease();
    [v5 initWithDomain:v6 code:5 userInfo:0];

    swift_willThrow();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v4();
}

uint64_t sub_10000F37C()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000F4F4;
  }
  else {
    uint64_t v2 = sub_10000F490;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000F490()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F4F4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F6C0(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000F768;
  return sub_10000EFEC();
}

uint64_t sub_10000F768()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  id v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_10002E5E8();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_10000FA54(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  id v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_10000FB18;
  v5[19] = v4;
  return _swift_task_switch(sub_10000D4DC, 0, 0);
}

uint64_t sub_10000FB18(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  if (v3)
  {
    uint64_t v7 = *(void *)(v5 + 24);

    uint64_t v8 = (void *)sub_10002E5E8();
    swift_errorRelease();
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

    _Block_release(*(const void **)(v5 + 24));
    uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
    return v9();
  }
  else
  {
    *(void *)(v5 + 40) = a1;
    return _swift_task_switch(sub_10000FCA0, 0, 0);
  }
}

uint64_t sub_10000FCA0()
{
  uint64_t v1 = *(void **)(v0 + 40);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  unsigned __int8 v4 = [v1 deviceToDeviceEncryptionAvailability];

  (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, v4 & 1, 0);
  _Block_release(*(const void **)(v0 + 24));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void sub_10000FD44(char *a1@<X8>)
{
  v222 = a1;
  uint64_t v231 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A48);
  v225 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v231 - 8);
  uint64_t v2 = __chkstk_darwin(v231);
  uint64_t v217 = (uint64_t)v211 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v216 = (uint64_t)v211 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  v221 = (char *)v211 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v219 = (uint64_t)v211 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v223 = (char *)v211 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v232 = (uint64_t)v211 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v227 = (uint64_t)v211 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v233 = (uint64_t)v211 - v17;
  __chkstk_darwin(v16);
  v229 = (char *)v211 - v18;
  uint64_t v19 = sub_10002E718();
  uint64_t v234 = *(void *)(v19 - 8);
  uint64_t v235 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  v215 = (char *)v211 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  v220 = (char *)v211 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v224 = (char *)v211 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v218 = (char *)v211 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v228 = (char *)v211 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v226 = (char *)v211 - v31;
  __chkstk_darwin(v30);
  v230 = (char *)v211 - v32;
  id v33 = [self processInfo];
  id v34 = [v33 operatingSystemVersionString];

  NSString v35 = v34;
  NSString v36 = v34;
  NSString v37 = v34;
  if (!v34)
  {
    sub_10002E8F8();
    NSString v37 = sub_10002E8E8();
    swift_bridgeObjectRelease();
    sub_10002E8F8();
    NSString v36 = sub_10002E8E8();
    swift_bridgeObjectRelease();
    sub_10002E8F8();
    NSString v35 = sub_10002E8E8();
    swift_bridgeObjectRelease();
  }
  id v240 = v36;
  id v241 = v35;
  uint64_t v38 = sub_10002E8F8();
  id v40 = v39;
  uint64_t v41 = self;
  id v42 = v34;
  id v238 = v41;
  id v43 = [v41 standardUserDefaults];
  uint64_t v242 = v1;
  uint64_t v44 = *(void *)(v1 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kOSVersionKey + 8);
  uint64_t v236 = *(void *)(v1 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kOSVersionKey);
  uint64_t v237 = v44;
  NSString v45 = sub_10002E8E8();
  id v46 = [v43 objectForKey:v45];

  if (v46)
  {
    sub_10002EC48();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v249 = 0u;
    long long v250 = 0u;
  }
  sub_100013298((uint64_t)&v249, (uint64_t)&v251, &qword_100047A60);
  uint64_t v47 = v242;
  if (!v253)
  {
    sub_10000B3D0((uint64_t)&v251, &qword_100047A60);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    Swift::String v48 = (os_unfair_lock_s *)v239;
LABEL_13:
    uint64_t v251 = 0;
    unint64_t v252 = 0xE000000000000000;
    sub_10002ECD8(45);
    swift_bridgeObjectRelease();
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000039, 0x8000000100031910);
    id v49 = v238;
    id v50 = [v238 standardUserDefaults];
    NSString v51 = sub_10002E8E8();
    [v50 setURL:0 forKey:v51];

    id v52 = [v49 standardUserDefaults];
    NSString v53 = sub_10002E8E8();
    [v52 setObject:v37 forKey:v53];

    goto LABEL_14;
  }
  if (v38 == v247 && v40 == v248)
  {

    swift_bridgeObjectRelease_n();
    Swift::String v48 = (os_unfair_lock_s *)v239;
    goto LABEL_14;
  }
  char v65 = sub_10002ED98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::String v48 = (os_unfair_lock_s *)v239;
  if ((v65 & 1) == 0) {
    goto LABEL_13;
  }

LABEL_14:
  uint64_t v239 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_setupState;
  uint64_t v54 = *(void *)(v47 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_setupState);
  swift_beginAccess();
  uint64_t v55 = *(void *)(v54 + 24);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v55 + 24));
  sub_1000131C4((void *)(v55 + 16), &v251);
  if (v48)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v55 + 24));
    __break(1u);
    os_unfair_lock_unlock(v48);
    __break(1u);
    os_unfair_lock_unlock((os_unfair_lock_t)v54);
    __break(1u);
    os_unfair_lock_unlock(v40);
    __break(1u);
    return;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v55 + 24));
  uint64_t v56 = v251;
  swift_release();
  swift_release();
  if (!v56)
  {
    uint64_t v57 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_importState;
    uint64_t v58 = *(void *)(v47 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_importState);
    swift_beginAccess();
    uint64_t v59 = *(void *)(v58 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v59 + 24));
    sub_1000131C4((void *)(v59 + 16), &v251);
    os_unfair_lock_unlock((os_unfair_lock_t)(v59 + 24));
    uint64_t v56 = v251;
    swift_release();
    swift_release();
    if (!v56)
    {
      uint64_t v214 = OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_exportState;
      uint64_t v60 = *(void *)(v47 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_exportState);
      swift_beginAccess();
      uint64_t v61 = *(void *)(v60 + 24);
      swift_retain();
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v61 + 24));
      sub_1000131C4((void *)(v61 + 16), &v251);
      os_unfair_lock_unlock((os_unfair_lock_t)(v61 + 24));
      uint64_t v56 = v251;
      swift_release();
      swift_release();
      if (!v56)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_100047A68);
        uint64_t v66 = v47;
        uint64_t v67 = *((void *)v225 + 9);
        unint64_t v68 = (*((unsigned __int8 *)v225 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v225 + 80);
        uint64_t v69 = swift_allocObject();
        *(_OWORD *)(v69 + 16) = xmmword_10002FE90;
        v211[2] = v69;
        uint64_t v70 = v69 + v68;
        uint64_t v212 = v57;
        uint64_t v71 = *(void *)(v66 + v57);
        swift_beginAccess();
        uint64_t v72 = *(void *)(v71 + 16);
        uint64_t v73 = v72 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v72 + 16);
        Swift::String v74 = (os_unfair_lock_s *)(v72 + ((*(unsigned int *)(*(void *)v72 + 48) + 3) & 0x1FFFFFFFCLL));
        swift_retain();
        swift_retain();
        os_unfair_lock_lock(v74);
        sub_10001271C(v73, v70);
        os_unfair_lock_unlock(v74);
        swift_release();
        swift_release();
        uint64_t v75 = v242;
        uint64_t v76 = *(void *)(v242 + v214);
        swift_beginAccess();
        uint64_t v77 = *(void *)(v76 + 16);
        uint64_t v78 = v77 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v77 + 16);
        char v79 = (os_unfair_lock_s *)(v77 + ((*(unsigned int *)(*(void *)v77 + 48) + 3) & 0x1FFFFFFFCLL));
        swift_retain();
        swift_retain();
        os_unfair_lock_lock(v79);
        v211[0] = v70 + v67;
        sub_10001271C(v78, v70 + v67);
        uint64_t v80 = v75;
        uint64_t v81 = v70;
        os_unfair_lock_unlock(v79);
        swift_release();
        swift_release();
        uint64_t v82 = v233;
        sub_100013230(v70, v233);
        uint64_t v83 = v227;
        sub_100013298(v82, v227, &qword_100047A48);
        uint64_t v84 = v235;
        id v85 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v234 + 48);
        id v86 = (void (**)(char *, uint64_t, uint64_t))(v234 + 32);
        v211[3] = v234 + 48;
        v225 = v85;
        unsigned int v87 = v85(v83, 1, v235);
        v213 = v86;
        v88 = v228;
        v211[1] = v81;
        if (v87 == 1)
        {
          sub_10000B3D0(v83, &qword_100047A48);
          v89 = _swiftEmptyArrayStorage;
        }
        else
        {
          v90 = *v86;
          v91 = v226;
          (*v86)(v226, v83, v84);
          v90(v88, (uint64_t)v91, v84);
          v89 = _swiftEmptyArrayStorage;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v89 = (void *)sub_100012E4C(0, _swiftEmptyArrayStorage[2] + 1, 1, (unint64_t)_swiftEmptyArrayStorage);
          }
          unint64_t v93 = v89[2];
          unint64_t v92 = v89[3];
          if (v93 >= v92 >> 1) {
            v89 = (void *)sub_100012E4C(v92 > 1, v93 + 1, 1, (unint64_t)v89);
          }
          v89[2] = v93 + 1;
          uint64_t v84 = v235;
          unint64_t v94 = (unint64_t)v89
              + ((*(unsigned __int8 *)(v234 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v234 + 80))
              + *(void *)(v234 + 72) * v93;
          id v86 = v213;
          v90((char *)v94, (uint64_t)v88, v235);
          uint64_t v80 = v242;
        }
        uint64_t v95 = v233;
        sub_100013230(v211[0], v233);
        sub_100013298(v95, v83, &qword_100047A48);
        if (v225(v83, 1, v84) == 1)
        {
          sub_10000B3D0(v83, &qword_100047A48);
          uint64_t v96 = v234;
        }
        else
        {
          Class v97 = *v86;
          v98 = v226;
          (*v86)(v226, v83, v84);
          v97(v88, (uint64_t)v98, v84);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v89 = (void *)sub_100012E4C(0, v89[2] + 1, 1, (unint64_t)v89);
          }
          uint64_t v96 = v234;
          unint64_t v100 = v89[2];
          unint64_t v99 = v89[3];
          if (v100 >= v99 >> 1) {
            v89 = (void *)sub_100012E4C(v99 > 1, v100 + 1, 1, (unint64_t)v89);
          }
          v89[2] = v100 + 1;
          unint64_t v101 = (unint64_t)v89
               + ((*(unsigned __int8 *)(v96 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80))
               + *(void *)(v96 + 72) * v100;
          uint64_t v84 = v235;
          id v86 = v213;
          v97((char *)v101, (uint64_t)v88, v235);
          uint64_t v80 = v242;
        }
        swift_setDeallocating();
        swift_arrayDestroy();
        swift_deallocClassInstance();
        v102 = v229;
        sub_100011D58((uint64_t)v89, v229);
        swift_bridgeObjectRelease();
        v103 = v225;
        if (v225((uint64_t)v102, 1, v84) == 1)
        {

          sub_10000B3D0((uint64_t)v102, &qword_100047A48);
        }
        else
        {
          v104 = *v86;
          (*v86)(v230, (uint64_t)v102, v84);
          uint64_t v105 = *(void *)(v80 + v212);
          swift_beginAccess();
          uint64_t v106 = *(void *)(v105 + 32);
          swift_retain();
          swift_retain();
          os_unfair_lock_lock((os_unfair_lock_t)(v106 + 20));
          sub_1000131F4((unsigned char *)(v106 + 16), &v251);
          os_unfair_lock_unlock((os_unfair_lock_t)(v106 + 20));
          char v107 = v251;
          swift_release();
          swift_release();
          if ((v107 & 1) == 0)
          {
            uint64_t v108 = *(void *)(v242 + v214);
            swift_beginAccess();
            uint64_t v109 = *(void *)(v108 + 32);
            swift_retain();
            swift_retain();
            os_unfair_lock_lock((os_unfair_lock_t)(v109 + 20));
            sub_1000131F4((unsigned char *)(v109 + 16), &v251);
            os_unfair_lock_unlock((os_unfair_lock_t)(v109 + 20));
            char v110 = v251;
            swift_release();
            swift_release();
            if ((v110 & 1) == 0)
            {

              uint64_t v251 = 0;
              unint64_t v252 = 0xE000000000000000;
              sub_10002ECD8(16);
              swift_bridgeObjectRelease();
              uint64_t v251 = 0xD00000000000001ALL;
              unint64_t v252 = 0x8000000100031A10;
              sub_10001354C((unint64_t *)&unk_100047A70);
              v185 = v230;
              uint64_t v186 = v235;
              v267._countAndFlagsBits = sub_10002ED78();
              sub_10002E948(v267);
              swift_bridgeObjectRelease();
              _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v251, v252);
              swift_bridgeObjectRelease();
              id v187 = v238;
              id v188 = [v238 standardUserDefaults];
              Class isa = sub_10002E6C8().super.isa;
              NSString v190 = sub_10002E8E8();
              [v188 setObject:isa forKey:v190];

              id v191 = [v187 standardUserDefaults];
              NSString v192 = sub_10002E8E8();
              id v193 = v240;
              [v191 setObject:v240 forKey:v192];

              v194 = v222;
              v104(v222, (uint64_t)v185, v186);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v234 + 56))(v194, 0, 1, v186);
              return;
            }
          }
          uint64_t v96 = v234;
          (*(void (**)(char *, uint64_t))(v234 + 8))(v230, v235);

          uint64_t v80 = v242;
        }
        id v111 = [v238 standardUserDefaults];
        v112 = *(char **)(v80 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kLastSyncDateKey + 8);
        uint64_t v233 = *(void *)(v80 + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kLastSyncDateKey);
        v230 = v112;
        NSString v113 = sub_10002E8E8();
        id v114 = [v111 objectForKey:v113];

        if (v114)
        {
          sub_10002EC48();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v249 = 0u;
          long long v250 = 0u;
        }
        uint64_t v115 = v232;
        uint64_t v116 = (uint64_t)v223;
        sub_100013298((uint64_t)&v249, (uint64_t)&v251, &qword_100047A60);
        uint64_t v117 = v235;
        if (v253)
        {
          int v118 = swift_dynamicCast();
          v119 = *(void **)(v96 + 56);
          uint64_t v120 = v118 ^ 1u;
          uint64_t v121 = v115;
        }
        else
        {
          sub_10000B3D0((uint64_t)&v251, &qword_100047A60);
          v119 = *(void **)(v96 + 56);
          uint64_t v121 = v115;
          uint64_t v120 = 1;
        }
        id v240 = v119;
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v119)(v121, v120, 1, v117);
        sub_100013230(v115, v116);
        if (v103(v116, 1, v117) == 1)
        {
          sub_10000B3D0(v116, &qword_100047A48);
          sub_10002E708();
          uint64_t v122 = *(void *)(v242 + v239);
          swift_beginAccess();
          uint64_t v123 = *(void *)(v122 + 16);
          uint64_t v124 = v123 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v123 + 16);
          v125 = (os_unfair_lock_s *)(v123 + ((*(unsigned int *)(*(void *)v123 + 48) + 3) & 0x1FFFFFFFCLL));
          swift_retain();
          swift_retain();
          os_unfair_lock_lock(v125);
          uint64_t v126 = v219;
          sub_10001271C(v124, v219);
          os_unfair_lock_unlock(v125);
          swift_release();
          swift_release();
          uint64_t v127 = v235;
          if (v103(v126, 1, v235) == 1)
          {

            sub_10000B3D0(v126, &qword_100047A48);
            uint64_t v128 = (uint64_t)v221;
LABEL_56:
            *(void *)&long long v249 = 0;
            *((void *)&v249 + 1) = 0xE000000000000000;
            sub_10002ECD8(104);
            long long v246 = v249;
            v257._countAndFlagsBits = 0x636E79537473616CLL;
            v257._object = (void *)0xEE00292865746144;
            sub_10002E948(v257);
            v258._object = (void *)0x8000000100031960;
            v258._countAndFlagsBits = 0xD000000000000017;
            sub_10002E948(v258);
            uint64_t v141 = v242;
            uint64_t v142 = *(void *)(v242 + v239);
            swift_beginAccess();
            uint64_t v143 = *(void *)(v142 + 16);
            uint64_t v144 = v143 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v143 + 16);
            v145 = (os_unfair_lock_s *)(v143 + ((*(unsigned int *)(*(void *)v143 + 48) + 3) & 0x1FFFFFFFCLL));
            swift_retain();
            swift_retain();
            os_unfair_lock_lock(v145);
            sub_10001271C(v144, v128);
            os_unfair_lock_unlock(v145);
            swift_release();
            swift_release();
            uint64_t v146 = sub_10002EC28();
            v148 = v147;
            sub_10000B3D0(v128, &qword_100047A48);
            v259._countAndFlagsBits = v146;
            v259._object = v148;
            sub_10002E948(v259);
            swift_bridgeObjectRelease();
            v260._countAndFlagsBits = 0x726F706D69202C22;
            v260._object = (void *)0xEC00000022203A74;
            sub_10002E948(v260);
            uint64_t v149 = *(void *)(v141 + v212);
            swift_beginAccess();
            uint64_t v150 = *(void *)(v149 + 16);
            uint64_t v151 = v150 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v150 + 16);
            v152 = (os_unfair_lock_s *)(v150 + ((*(unsigned int *)(*(void *)v150 + 48) + 3) & 0x1FFFFFFFCLL));
            swift_retain();
            swift_retain();
            os_unfair_lock_lock(v152);
            uint64_t v153 = v216;
            sub_10001271C(v151, v216);
            os_unfair_lock_unlock(v152);
            swift_release();
            swift_release();
            uint64_t v154 = sub_10002EC28();
            v156 = v155;
            sub_10000B3D0(v153, &qword_100047A48);
            v261._countAndFlagsBits = v154;
            v261._object = v156;
            sub_10002E948(v261);
            swift_bridgeObjectRelease();
            v262._countAndFlagsBits = 0x726F707865202C22;
            v262._object = (void *)0xEC00000022203A74;
            sub_10002E948(v262);
            uint64_t v157 = *(void *)(v141 + v214);
            swift_beginAccess();
            uint64_t v158 = *(void *)(v157 + 16);
            uint64_t v159 = v158 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v158 + 16);
            v160 = (os_unfair_lock_s *)(v158 + ((*(unsigned int *)(*(void *)v158 + 48) + 3) & 0x1FFFFFFFCLL));
            swift_retain();
            swift_retain();
            os_unfair_lock_lock(v160);
            uint64_t v161 = v217;
            sub_10001271C(v159, v217);
            os_unfair_lock_unlock(v160);
            swift_release();
            swift_release();
            uint64_t v162 = sub_10002EC28();
            v164 = v163;
            sub_10000B3D0(v161, &qword_100047A48);
            v263._countAndFlagsBits = v162;
            v263._object = v164;
            sub_10002E948(v263);
            swift_bridgeObjectRelease();
            v264._object = (void *)0x8000000100031980;
            v264._countAndFlagsBits = 0xD000000000000017;
            sub_10002E948(v264);
            uint64_t v165 = *(void *)(v141 + v239);
            swift_beginAccess();
            uint64_t v166 = *(void *)(v165 + 32);
            swift_retain();
            swift_retain();
            os_unfair_lock_lock((os_unfair_lock_t)(v166 + 20));
            sub_1000131F4((unsigned char *)(v166 + 16), v245);
            os_unfair_lock_unlock((os_unfair_lock_t)(v166 + 20));
            int v167 = v245[0];
            swift_release();
            swift_release();
            if (v167) {
              v168._countAndFlagsBits = 1702195828;
            }
            else {
              v168._countAndFlagsBits = 0x65736C6166;
            }
            if (v167) {
              v169 = (void *)0xE400000000000000;
            }
            else {
              v169 = (void *)0xE500000000000000;
            }
            v168._object = v169;
            sub_10002E948(v168);
            swift_bridgeObjectRelease();
            v265._countAndFlagsBits = 0x74726F706D69202CLL;
            v265._object = (void *)0xEA0000000000203ALL;
            sub_10002E948(v265);
            uint64_t v170 = *(void *)(v141 + v212);
            swift_beginAccess();
            uint64_t v171 = *(void *)(v170 + 32);
            swift_retain();
            swift_retain();
            os_unfair_lock_lock((os_unfair_lock_t)(v171 + 20));
            sub_1000131F4((unsigned char *)(v171 + 16), v244);
            os_unfair_lock_unlock((os_unfair_lock_t)(v171 + 20));
            int v172 = v244[0];
            swift_release();
            swift_release();
            if (v172) {
              v173._countAndFlagsBits = 1702195828;
            }
            else {
              v173._countAndFlagsBits = 0x65736C6166;
            }
            if (v172) {
              v174 = (void *)0xE400000000000000;
            }
            else {
              v174 = (void *)0xE500000000000000;
            }
            v173._object = v174;
            sub_10002E948(v173);
            swift_bridgeObjectRelease();
            v266._countAndFlagsBits = 0x74726F707865202CLL;
            v266._object = (void *)0xEA0000000000203ALL;
            sub_10002E948(v266);
            uint64_t v175 = *(void *)(v141 + v214);
            swift_beginAccess();
            uint64_t v176 = *(void *)(v175 + 32);
            swift_retain();
            swift_retain();
            os_unfair_lock_lock((os_unfair_lock_t)(v176 + 20));
            sub_1000131F4((unsigned char *)(v176 + 16), &v243);
            os_unfair_lock_unlock((os_unfair_lock_t)(v176 + 20));
            int v177 = v243;
            swift_release();
            swift_release();
            if (v177) {
              v178._countAndFlagsBits = 1702195828;
            }
            else {
              v178._countAndFlagsBits = 0x65736C6166;
            }
            if (v177) {
              v179 = (void *)0xE400000000000000;
            }
            else {
              v179 = (void *)0xE500000000000000;
            }
            v178._object = v179;
            sub_10002E948(v178);
            swift_bridgeObjectRelease();
            long long v180 = v246;
            sub_10002EAA8();
            if (qword_100047060 != -1) {
              swift_once();
            }
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
            uint64_t v181 = swift_allocObject();
            *(_OWORD *)(v181 + 16) = xmmword_10002F990;
            *(void *)(v181 + 56) = &type metadata for String;
            *(void *)(v181 + 64) = sub_100007844();
            *(_OWORD *)(v181 + 32) = v180;
            swift_bridgeObjectRetain();
            sub_10002E768();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v182 = v234;
            if (qword_1000470C0 != -1) {
              swift_once();
            }
            id v183 = objc_allocWithZone((Class)NSError);
            swift_bridgeObjectRetain();
            NSString v184 = sub_10002E8E8();
            swift_bridgeObjectRelease();
            [v183 initWithDomain:v184 code:5 userInfo:0];

            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v182 + 8))(v224, v235);
            goto LABEL_79;
          }
          v134 = *v213;
          (*v213)(v220, v126, v127);
          uint64_t v135 = *(void *)(v242 + v212);
          swift_beginAccess();
          uint64_t v136 = *(void *)(v135 + 32);
          swift_retain();
          swift_retain();
          os_unfair_lock_lock((os_unfair_lock_t)(v136 + 20));
          sub_1000131F4((unsigned char *)(v136 + 16), &v249);
          uint64_t v128 = (uint64_t)v221;
          os_unfair_lock_unlock((os_unfair_lock_t)(v136 + 20));
          char v137 = v249;
          swift_release();
          swift_release();
          if (v137) {
            goto LABEL_55;
          }
          uint64_t v138 = *(void *)(v242 + v214);
          swift_beginAccess();
          uint64_t v139 = *(void *)(v138 + 32);
          swift_retain();
          swift_retain();
          os_unfair_lock_lock((os_unfair_lock_t)(v139 + 20));
          sub_1000131F4((unsigned char *)(v139 + 16), &v249);
          os_unfair_lock_unlock((os_unfair_lock_t)(v139 + 20));
          char v140 = v249;
          swift_release();
          swift_release();
          if (v140)
          {
LABEL_55:
            (*(void (**)(char *, uint64_t))(v234 + 8))(v220, v235);

            goto LABEL_56;
          }
          v195 = v215;
          v196 = v220;
          sub_10002E6B8();
          v197 = v224;
          char v198 = sub_10002E6D8();
          v199 = v195;
          uint64_t v200 = v235;
          v229 = *(char **)(v234 + 8);
          ((void (*)(char *, uint64_t))v229)(v199, v235);
          if ((v198 & 1) == 0)
          {
            ((void (*)(char *, uint64_t))v229)(v196, v200);

            uint64_t v128 = (uint64_t)v221;
            goto LABEL_56;
          }
          *(void *)&long long v249 = 0;
          *((void *)&v249 + 1) = 0xE000000000000000;
          sub_10002ECD8(40);
          v268._countAndFlagsBits = 0x636E79537473616CLL;
          v268._object = (void *)0xEE00292865746144;
          sub_10002E948(v268);
          v269._countAndFlagsBits = 0xD000000000000012;
          v269._object = (void *)0x80000001000319A0;
          sub_10002E948(v269);
          sub_10001354C((unint64_t *)&unk_100047A70);
          v270._countAndFlagsBits = sub_10002ED78();
          sub_10002E948(v270);
          swift_bridgeObjectRelease();
          v271._countAndFlagsBits = 0xD000000000000010;
          v271._object = (void *)0x80000001000319C0;
          sub_10002E948(v271);
          sub_10002EA68();
          _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v249, *((unint64_t *)&v249 + 1));
          swift_bridgeObjectRelease();
          v201 = v197;
          id v202 = v238;
          id v203 = [v238 standardUserDefaults];
          Class v204 = sub_10002E6C8().super.isa;
          NSString v205 = sub_10002E8E8();
          [v203 setObject:v204 forKey:v205];

          id v206 = [v202 standardUserDefaults];
          NSString v207 = sub_10002E8E8();
          id v208 = v241;
          [v206 setObject:v241 forKey:v207];

          uint64_t v209 = v235;
          ((void (*)(char *, uint64_t))v229)(v201, v235);
          v210 = v222;
          v134(v222, (uint64_t)v220, v209);
          v132 = v210;
          uint64_t v133 = v209;
        }
        else
        {

          v129 = *(void (**)(char *, uint64_t, uint64_t))(v96 + 32);
          v130 = v218;
          v129(v218, v116, v117);
          uint64_t v251 = 0;
          unint64_t v252 = 0xE000000000000000;
          sub_10002ECD8(23);
          swift_bridgeObjectRelease();
          uint64_t v251 = 0xD000000000000021;
          unint64_t v252 = 0x80000001000319E0;
          sub_10001354C((unint64_t *)&unk_100047A70);
          v256._countAndFlagsBits = sub_10002ED78();
          sub_10002E948(v256);
          swift_bridgeObjectRelease();
          _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v251, v252);
          swift_bridgeObjectRelease();
          v131 = v222;
          v129(v222, (uint64_t)v130, v117);
          v132 = v131;
          uint64_t v133 = v117;
        }
        ((void (*)(char *, void, uint64_t, uint64_t))v240)(v132, 0, 1, v133);
LABEL_79:
        sub_10000B3D0(v232, &qword_100047A48);
        return;
      }
    }
  }

  uint64_t v251 = 0;
  unint64_t v252 = 0xE000000000000000;
  sub_10002ECD8(35);
  v254._countAndFlagsBits = 0x636E79537473616CLL;
  v254._object = (void *)0xEE00292865746144;
  sub_10002E948(v254);
  v255._countAndFlagsBits = 0xD00000000000001FLL;
  v255._object = (void *)0x8000000100031A30;
  sub_10002E948(v255);
  *(void *)&long long v249 = v56;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
  sub_10002ED18();
  uint64_t v63 = v251;
  unint64_t v62 = v252;
  sub_10002EAA8();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_10002F990;
  *(void *)(v64 + 56) = &type metadata for String;
  *(void *)(v64 + 64) = sub_100007844();
  *(void *)(v64 + 32) = v63;
  *(void *)(v64 + 40) = v62;
  swift_bridgeObjectRetain();
  sub_10002E768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_willThrow();
}

uint64_t sub_100011D58@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A48);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = sub_10002E718();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = *(void *)(a1 + 16);
  if (!v17)
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v19(v9, 1, 1, v10);
    goto LABEL_5;
  }
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  NSString v36 = *(void (**)(char *, unint64_t, uint64_t))(v11 + 16);
  uint64_t v37 = v11 + 16;
  v36(v9, a1 + v18, v10);
  uint64_t v31 = a1;
  uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v38(v9, 0, 1, v10);
  id v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  uint64_t v35 = v11 + 48;
  if (v34(v9, 1, v10) == 1)
  {
    uint64_t v19 = v38;
LABEL_5:
    sub_10000B3D0((uint64_t)v9, &qword_100047A48);
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v19)(a2, 1, 1, v10);
  }
  uint64_t v30 = a2;
  id v33 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v33(v16, v9, v10);
  swift_bridgeObjectRetain();
  uint64_t v21 = v17 - 1;
  if (v21)
  {
    uint64_t v23 = *(void *)(v11 + 72);
    uint64_t v24 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v32 = v23;
    unint64_t v25 = v31 + v23 + v18;
    uint64_t v26 = v33;
    while (1)
    {
      v36(v7, v25, v10);
      v38(v7, 0, 1, v10);
      if (v34(v7, 1, v10) == 1) {
        break;
      }
      v26(v14, v7, v10);
      sub_10001354C(&qword_100047A88);
      char v27 = sub_10002E8D8();
      uint64_t v28 = *v24;
      if (v27)
      {
        v28(v16, v10);
        v26(v16, v14, v10);
      }
      else
      {
        v28(v14, v10);
      }
      v25 += v32;
      if (!--v21) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    v38(v7, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_10000B3D0((uint64_t)v7, &qword_100047A48);
  uint64_t v22 = v30;
  v33(v30, v16, v10);
  return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v38)(v22, 0, 1, v10);
}

uint64_t sub_100012168()
{
  v1[2] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047A48);
  v1[3] = swift_task_alloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v1[4] = v2;
  void *v2 = v1;
  v2[1] = sub_100012244;
  v2[19] = v0;
  return _swift_task_switch(sub_10000D4DC, 0, 0);
}

uint64_t sub_100012244(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5(0);
  }
  else
  {
    return _swift_task_switch(sub_100012398, 0, 0);
  }
}

uint64_t sub_100012398()
{
  if (*(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC9mapssyncd21MapsSyncDaemonService_kInitialSyncCheckEnabled) == 1
    && ([*(id *)(v0 + 40) deviceToDeviceEncryptionAvailability] & 1) != 0
    && [*(id *)(v0 + 40) hasValidCredentials])
  {
    uint64_t v1 = *(void **)(v0 + 40);
    uint64_t v2 = *(void *)(v0 + 48);
    sub_10000FD44(*(char **)(v0 + 24));

    uint64_t v3 = *(void *)(v0 + 24);
    if (v2)
    {
      swift_task_dealloc();
      uint64_t v4 = *(uint64_t (**)(BOOL))(v0 + 8);
      BOOL v5 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = sub_10002E718();
    BOOL v8 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v3, 1, v10) != 1;
    sub_10000B3D0(v3, &qword_100047A48);
  }
  else
  {
    sub_10002ECD8(41);
    swift_bridgeObjectRelease();
    sub_10002EAA8();
    if (qword_100047060 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void **)(v0 + 40);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_10002F990;
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = sub_100007844();
    *(void *)(v7 + 32) = 0xD000000000000043;
    *(void *)(v7 + 40) = 0x80000001000318C0;
    sub_10002E768();
    swift_bridgeObjectRelease();

    BOOL v8 = 1;
  }
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v5 = v8;
LABEL_10:
  return v4(v5);
}

id sub_100012600()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncDaemonService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncDaemonService()
{
  return self;
}

uint64_t sub_10001271C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100013230(a1, a2);
}

uint64_t sub_100012748(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100012824;
  return v6(a1);
}

uint64_t sub_100012824()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001291C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1000140A4;
  return v6();
}

uint64_t sub_1000129E8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  BOOL v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1000140A4;
  return v7();
}

uint64_t sub_100012AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002EA38();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10002EA28();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000B3D0(a1, &qword_100048380);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10002E9F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100012C60(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000140E8;
  return v6(a1);
}

char *sub_100012D3C(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_100047AA8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
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
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_1000132FC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100012E4C(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047A80);
  uint64_t v10 = *(void *)(sub_10002E718() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_10002ED28();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_10002E718() - 8);
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
    sub_1000133F0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_1000130B4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_100047B68);
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
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_100013FB4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000131C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_errorRetain();
}

unsigned char *sub_1000131F4@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_100013200@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = *a1;
  return v2;
}

uint64_t sub_100013230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013298(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000132FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10002ED68();
  __break(1u);
  return result;
}

uint64_t sub_1000133F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_10002E718() - 8);
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
  uint64_t result = sub_10002ED68();
  __break(1u);
  return result;
}

uint64_t sub_10001354C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002E718();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013590()
{
  swift_bridgeObjectRelease();

  unint64_t v1 = *(void *)(v0 + 40);
  if (v1 >> 60 != 15) {
    sub_1000135F0(*(void *)(v0 + 32), v1);
  }
  swift_release();
  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000135F0(uint64_t a1, unint64_t a2)
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

void sub_100013648()
{
  sub_10000E740(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void (**)(id))(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_100013658()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013668()
{
  return sub_100017BE8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_100013688(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001369C(a1, a2);
  }
  return a1;
}

uint64_t sub_10001369C(uint64_t a1, unint64_t a2)
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

unint64_t sub_1000136F4()
{
  unint64_t result = qword_100047AA0;
  if (!qword_100047AA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100047A98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047AA0);
  }
  return result;
}

uint64_t sub_100013750()
{
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

void sub_100013790()
{
  sub_10000DD14(*(void *)(v0 + 16), *(void (**)(char *, uint64_t, void))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10001379C()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_1000137AC(id *a1)
{
  uint64_t v3 = **(void ***)(v1 + 16);

  *a1 = v3;
  return v3;
}

uint64_t sub_1000137F8()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1000138A4;
  unint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_100047AC0 + dword_100047AC0);
  return v5(v2, v3);
}

uint64_t sub_1000138A4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001399C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1000140A4;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100047AD0 + dword_100047AD0);
  return v6(v2, v3, v4);
}

uint64_t sub_100013A60(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_1000140A4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100047AE0 + dword_100047AE0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100013B2C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000140A4;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100047AF0 + dword_100047AF0);
  return v6(a1, v4);
}

uint64_t sub_100013BE8()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1000140A4;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_100047B00 + dword_100047B00);
  return v5(v2, v3);
}

uint64_t sub_100013C9C()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100013CD4(uint64_t a1)
{
  sub_10000EF88(a1, *(void *)(v1 + 16));
}

uint64_t sub_100013CDC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000135F0(a1, a2);
  }
  return a1;
}

void sub_100013CF0(objc_class *a1, uint64_t a2, uint64_t a3)
{
  sub_10000E424(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100013CF8()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100013D30()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100013D70()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1000140A4;
  v3[12] = v2;
  return _swift_task_switch(sub_10000CEA0, 0, 0);
}

uint64_t sub_100013E1C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013E54(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000138A4;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100047B30 + dword_100047B30);
  return v6(a1, v4);
}

uint64_t sub_100013F0C(void *a1)
{
  uint64_t v3 = **(void **)(v1 + 16);
  swift_errorRelease();
  *a1 = v3;
  return swift_errorRetain();
}

unsigned char *sub_100013F58(unsigned char *result)
{
  *unint64_t result = **(unsigned char **)(v1 + 16);
  return result;
}

uint64_t sub_100013F68(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  sub_10000B3D0(a1, &qword_100047A48);
  return sub_100013230(v3, a1);
}

char *sub_100013FB4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  unint64_t result = (char *)sub_10002ED68();
  __break(1u);
  return result;
}

unsigned char *sub_1000140B8(unsigned char *a1)
{
  return sub_100013F58(a1);
}

id sub_1000140D0(id *a1)
{
  return sub_1000137AC(a1);
}

id sub_100014144()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedContactHandle();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedContactHandle()
{
  return self;
}

uint64_t sub_10001419C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedSharedTripBlockedItem();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_100014238()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryMarkedLocation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryMarkedLocation()
{
  return self;
}

id sub_1000142E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedCuratedCollection();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedCuratedCollection()
{
  return self;
}

id sub_100014398()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryCuratedCollection();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryCuratedCollection()
{
  return self;
}

id sub_100014448()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedFavoriteItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedFavoriteItem()
{
  return self;
}

id sub_1000144F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedCollectionTransitItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedCollectionTransitItem()
{
  return self;
}

uint64_t sub_100014550@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002E688();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v18 - v10;
  id v12 = [self defaultManager];
  NSString v13 = sub_10002E8E8();
  id v14 = [v12 containerURLForSecurityApplicationGroupIdentifier:v13];

  if (!v14)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    v16(v4, 1, 1, v5);
LABEL_5:
    sub_100014CBC((uint64_t)v4);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16)(a1, 1, 1, v5);
  }
  sub_10002E668();

  BOOL v15 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v15(v4, v9, v5);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v16(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    goto LABEL_5;
  }
  v15(v11, v4, v5);
  sub_10002E648();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v16)(a1, 0, 1, v5);
}

uint64_t type metadata accessor for MapsSyncUtil()
{
  return self;
}

uint64_t sub_100014838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t type metadata accessor for MapsSyncThreadSafe()
{
  return __swift_instantiateGenericMetadata();
}

id sub_100014858(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_10002E8E8();
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
    sub_10002E5F8();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_100014934()
{
  NSString v0 = sub_10002E8E8();
  int HasEntitlement = BSSelfTaskHasEntitlement();

  if (HasEntitlement)
  {
    if (qword_100047080 != -1) {
      swift_once();
    }
    uint64_t countAndFlagsBits = MapsSyncMapsAppIdentifier._countAndFlagsBits;
    object = MapsSyncMapsAppIdentifier._object;
    objc_allocWithZone((Class)LSApplicationRecord);
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_10002EAA8();
    if (qword_100047060 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_10002F990;
    *(void *)(v4 + 56) = &type metadata for String;
    *(void *)(v4 + 64) = sub_100007844();
    *(void *)(v4 + 32) = 0xD00000000000004BLL;
    *(void *)(v4 + 40) = 0x8000000100031E70;
    sub_10002E768();
    swift_bridgeObjectRelease();
  }
  return 1;
}

uint64_t sub_100014CBC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100014D4C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedFavoriteItem();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_100014DE8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedServerEvaluationStatus();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedServerEvaluationStatus()
{
  return self;
}

id sub_100014E98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryItem()
{
  return self;
}

id sub_100014F48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedRAPRecord();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedRAPRecord()
{
  return self;
}

uint64_t sub_100014FA0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedMixinMapItem();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

uint64_t sub_100014FE4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedReviewedPlace();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_100015080()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryDirectionsItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryDirectionsItem()
{
  return self;
}

id sub_100015130()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedCachedUserReview();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedCachedUserReview()
{
  return self;
}

uint64_t type metadata accessor for MapsSyncPredicate()
{
  return self;
}

uint64_t sub_1000151AC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

double sub_1000151F0()
{
  double result = GEOMapItemEquivalenceDistanceThresholdForPOIDeduplication + 20.0;
  MapsSyncDeduplicationRadiusMeters = GEOMapItemEquivalenceDistanceThresholdForPOIDeduplication + 20.0;
  return result;
}

Swift::Double *MapsSyncDeduplicationRadiusMeters.unsafeMutableAddressor()
{
  if (qword_100047058 != -1) {
    swift_once();
  }
  return &MapsSyncDeduplicationRadiusMeters;
}

Swift::Bool __swiftcall MapsSyncIsHostedByMapsSyncDaemon()()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_10002E8F8();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000018 && v4 == 0x80000001000309D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10002ED98();
    swift_bridgeObjectRelease();
    return v6 & 1;
  }
}

Swift::Bool __swiftcall MapsSyncIsHostedByMapsApp()()
{
  id v0 = self;
  id v1 = [v0 mainBundle];
  id v2 = [v1 bundleIdentifier];

  if (!v2)
  {
    sub_10002E8F8();
    goto LABEL_10;
  }
  uint64_t v3 = sub_10002E8F8();
  uint64_t v5 = v4;

  uint64_t v6 = sub_10002E8F8();
  if (!v5)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (v3 == v6 && v5 == v7)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  char v9 = sub_10002ED98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_18;
  }
LABEL_11:
  id v10 = [v0 mainBundle];
  id v11 = [v10 bundleIdentifier];

  if (!v11) {
    return v11 & 1;
  }
  uint64_t v12 = sub_10002E8F8();
  uint64_t v14 = v13;

  if (v12 == 0xD000000000000012 && v14 == 0x8000000100032240) {
    goto LABEL_17;
  }
  char v15 = sub_10002ED98();
  swift_bridgeObjectRelease();
  LOBYTE(v11) = 0;
  if ((v15 & 1) == 0) {
    return v11 & 1;
  }
LABEL_18:
  uint64_t v16 = self;
  id v17 = [v16 processInfo];
  id v18 = [v17 processName];

  uint64_t v19 = sub_10002E8F8();
  uint64_t v21 = v20;

  if (qword_100047090 != -1) {
    swift_once();
  }
  if (v19 == MapsSyncMapsAppProcessName._countAndFlagsBits && v21 == MapsSyncMapsAppProcessName._object) {
    goto LABEL_22;
  }
  char v22 = sub_10002ED98();
  swift_bridgeObjectRelease();
  if (v22)
  {
    LOBYTE(v11) = 1;
    return v11 & 1;
  }
  id v24 = [v16 processInfo];
  id v25 = [v24 processName];

  uint64_t v26 = sub_10002E8F8();
  uint64_t v28 = v27;

  if (qword_100047098 != -1) {
    swift_once();
  }
  if (v26 == MapsSyncNanoMapsProcessName._countAndFlagsBits && v28 == MapsSyncNanoMapsProcessName._object) {
LABEL_22:
  }
    LOBYTE(v11) = 1;
  else {
    LOBYTE(v11) = sub_10002ED98();
  }
  swift_bridgeObjectRelease();
  return v11 & 1;
}

id MapsSyncCategoryForMapItem(mapItem:)(void *a1)
{
  swift_getObjectType();
  return sub_1000158A4(a1);
}

id MapsSyncClassTypeForMapItem(mapItem:)(void *a1)
{
  id result = [a1 _clientAttributes];
  if (result)
  {
    id v2 = result;
    id v3 = [result mapsSyncAttributes];

    if (!v3) {
      return 0;
    }
    id v4 = [v3 mapsSyncObjectType];

    if (!v4) {
      return 0;
    }
    sub_10002E8F8();

    uint64_t v5 = (NSString *)sub_10002E8E8();
    swift_bridgeObjectRelease();
    Class v6 = NSClassFromString(v5);

    if (v6) {
      return (id)swift_getObjCClassMetadata();
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t MapsSyncObjectIdentifierForMapItem(mapItem:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [a1 _clientAttributes];
  if (v3
    && (id v4 = v3, v5 = [v3 mapsSyncAttributes], v4, v5)
    && (id v6 = [v5 mapsSyncIdentifier], v5, v6))
  {
    sub_10002E8F8();

    sub_10002E728();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = sub_10002E758();
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    return v9(a2, 1, 1, v8);
  }
}

id sub_1000158A4(void *a1)
{
  uint64_t v24 = sub_10002E618();
  v21[0] = *(void *)(v24 - 8);
  uint64_t v2 = __chkstk_darwin(v24);
  id v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  id v6 = (char *)v21 - v5;
  uint64_t v30 = &_swiftEmptySetSingleton;
  id v7 = [a1 _place];
  id v8 = [v7 firstBusiness];

  id v9 = [v8 localizedCategories];
  if (!v9)
  {
    sub_1000049A0(0, (unint64_t *)&unk_100048310);
    id v9 = (id)sub_10002EBB8();
  }
  sub_10002EBC8();

  sub_10002E608();
  if (!v29)
  {
LABEL_16:
    (*(void (**)(char *, uint64_t))(v21[0] + 8))(v6, v24);
    uint64_t v28 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047F38);
    sub_100015C64();
    sub_10000B320();
    uint64_t v20 = sub_10002E978();
    swift_bridgeObjectRelease();
    return (id)v20;
  }
  uint64_t v10 = sub_1000049A0(0, (unint64_t *)&unk_100048330);
  char v22 = (void (**)(char *, uint64_t))(v21[0] + 8);
  uint64_t v23 = v10;
  v21[1] = (char *)&type metadata for Any + 8;
  while (1)
  {
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_6;
    }
    id v11 = v6;
    id v12 = v26;
    id v13 = [v26 localizedNames];
    if (!v13)
    {
      sub_1000049A0(0, (unint64_t *)&unk_100048310);
      id v13 = (id)sub_10002EBB8();
    }
    sub_10002EBC8();

    sub_10002E608();
    if (v27) {
      break;
    }
LABEL_5:
    (*v22)(v4, v24);

    id v6 = v11;
LABEL_6:
    sub_10002E608();
    if (!v29) {
      goto LABEL_16;
    }
  }
  sub_1000049A0(0, &qword_100047F40);
  while ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    sub_10002E608();
    if (!v27) {
      goto LABEL_5;
    }
  }
  id v14 = v25;
  id result = [v25 name];
  if (result)
  {
    uint64_t v16 = result;
    uint64_t v17 = sub_10002E8F8();
    uint64_t v19 = v18;

    sub_100028AB0(&v25, v17, v19);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

unint64_t sub_100015C64()
{
  unint64_t result = qword_100048320;
  if (!qword_100048320)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_100047F38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100048320);
  }
  return result;
}

id sub_100015D18()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedCachedCuratedCollection();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedCachedCuratedCollection()
{
  return self;
}

id sub_100015DC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedCommunityID();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedCommunityID()
{
  return self;
}

uint64_t static OS_os_log.error(_:)(uint64_t a1, uint64_t a2)
{
  return sub_100015E54(a1, a2, (void (*)(void))&static os_log_type_t.error.getter);
}

uint64_t static OS_os_log.info(_:)(uint64_t a1, uint64_t a2)
{
  return sub_100015E54(a1, a2, (void (*)(void))&static os_log_type_t.info.getter);
}

uint64_t sub_100015E54(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10002F990;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100007844();
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_10002E768();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100015F50()
{
  sub_100016584();
  uint64_t result = sub_10002EC18();
  static OS_os_log.MapsSync = result;
  return result;
}

uint64_t *OS_os_log.MapsSync.unsafeMutableAddressor()
{
  if (qword_100047060 != -1) {
    swift_once();
  }
  return &static OS_os_log.MapsSync;
}

id static OS_os_log.MapsSync.getter()
{
  return sub_1000160F4(&qword_100047060, (void **)&static OS_os_log.MapsSync);
}

uint64_t sub_100016020()
{
  sub_100016584();
  uint64_t result = sub_10002EC18();
  static OS_os_log.Signpost = result;
  return result;
}

uint64_t *OS_os_log.Signpost.unsafeMutableAddressor()
{
  if (qword_100047068 != -1) {
    swift_once();
  }
  return &static OS_os_log.Signpost;
}

id static OS_os_log.Signpost.getter()
{
  return sub_1000160F4(&qword_100047068, (void **)&static OS_os_log.Signpost);
}

id sub_1000160F4(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

uint64_t static OS_os_log.info(session:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000161AC(a1, a2, a3, a4, (void (*)(void))&static os_log_type_t.info.getter);
}

uint64_t static OS_os_log.debug(session:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000161AC(a1, a2, a3, a4, (void (*)(void))&static os_log_type_t.debug.getter);
}

uint64_t static OS_os_log.error(session:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000161AC(a1, a2, a3, a4, (void (*)(void))&static os_log_type_t.error.getter);
}

uint64_t sub_1000161AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  a5();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10002FE90;
  *(void *)(v9 + 56) = &type metadata for String;
  unint64_t v10 = sub_100007844();
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  *(void *)(v9 + 96) = &type metadata for String;
  *(void *)(v9 + 104) = v10;
  *(void *)(v9 + 64) = v10;
  *(void *)(v9 + 72) = a3;
  *(void *)(v9 + 80) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10002E768();
  return swift_bridgeObjectRelease();
}

uint64_t _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 7;
    if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0) {
      uint64_t v6 = 11;
    }
    uint64_t v7 = v6 | (v4 << 16);
    uint64_t v17 = 4 * v4;
    while (1)
    {
      uint64_t v8 = sub_10002E938();
      unint64_t v10 = (v9 & 1) != 0 ? v7 : v8;
      if (v10 >> 14 < v5) {
        break;
      }
      sub_10002E968();
      uint64_t v11 = sub_10002E918();
      uint64_t v13 = v12;
      swift_bridgeObjectRelease();
      sub_10002EA98();
      if (qword_100047060 != -1) {
        swift_once();
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_10002F990;
      *(void *)(v14 + 56) = &type metadata for String;
      *(void *)(v14 + 64) = sub_100007844();
      *(void *)(v14 + 32) = v11;
      *(void *)(v14 + 40) = v13;
      swift_bridgeObjectRetain();
      sub_10002E768();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v5 = v10 >> 14;
      if (v10 >> 14 == v17) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_20;
  }
  sub_10002EA98();
  if (qword_100047060 != -1) {
LABEL_20:
  }
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_10002F990;
  *(void *)(v16 + 56) = &type metadata for String;
  *(void *)(v16 + 64) = sub_100007844();
  *(void *)(v16 + 32) = a1;
  *(void *)(v16 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_10002E768();
  return swift_bridgeObjectRelease();
}

unint64_t sub_100016584()
{
  unint64_t result = qword_100047F98;
  if (!qword_100047F98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100047F98);
  }
  return result;
}

id sub_10001661C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedCollectionItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedCollectionItem()
{
  return self;
}

id sub_1000166CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryMultiPointRoute();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryMultiPointRoute()
{
  return self;
}

uint64_t sub_100016724@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedCollectionItem();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

uint64_t sub_100016768@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedContactHandle();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_100016804()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedUserRoute();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedUserRoute()
{
  return self;
}

id sub_1000168B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedCollectionPlaceItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedCollectionPlaceItem()
{
  return self;
}

uint64_t sub_10001690C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedUserRoute();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_1000169A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedCollection();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedCollection()
{
  return self;
}

uint64_t sub_100016A00@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedCommunityID();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

uint64_t sub_100016A44@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedServerEvaluationStatus();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

void sub_100016A88()
{
  algn_100048508[7] = -18;
}

void sub_100016AB8()
{
  qword_100048510 = 0x65646F4D61746144;
  *(void *)algn_100048518 = 0xEF315F305F305F6CLL;
}

uint64_t sub_100016AE8@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v36 = a1;
  uint64_t v39 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10002E688();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v37 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002EA88();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v8 = swift_allocObject();
  long long v38 = xmmword_10002F990;
  *(_OWORD *)(v8 + 16) = xmmword_10002F990;
  *(void *)(v8 + 56) = &type metadata for String;
  unint64_t v9 = sub_100007844();
  *(void *)(v8 + 64) = v9;
  *(void *)(v8 + 32) = 0xD00000000000002FLL;
  *(void *)(v8 + 40) = 0x8000000100032530;
  sub_10002E768();
  swift_bridgeObjectRelease();
  type metadata accessor for MapsSyncUtil();
  sub_100014550((uint64_t)v4);
  uint64_t v10 = v5;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100014CBC((uint64_t)v4);
    sub_10002EAA8();
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = v38;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = v9;
    *(void *)(v11 + 32) = 0xD000000000000031;
    *(void *)(v11 + 40) = 0x8000000100032560;
    sub_10002E768();
    swift_bridgeObjectRelease();
    uint64_t v12 = 1;
    uint64_t v13 = v39;
    uint64_t v14 = v6;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v37, v4, v5);
    uint64_t v14 = v6;
    unint64_t v35 = v9;
    if (v36)
    {
      id v41 = 0;
      unint64_t v42 = 0xE000000000000000;
      sub_10002ECD8(22);
      if (qword_100047070 != -1) {
        swift_once();
      }
      uint64_t v15 = v5;
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_100047070 != -1) {
        swift_once();
      }
      uint64_t v15 = v5;
      swift_bridgeObjectRetain();
    }
    uint64_t v16 = v37;
    id v17 = [self defaultManager];
    sub_10002E638(v18);
    uint64_t v20 = v19;
    id v41 = 0;
    unsigned int v21 = [v17 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v41];

    if (v21)
    {
      id v22 = v41;
      uint64_t v13 = v39;
      sub_10002E648();
      swift_bridgeObjectRelease();
      id v41 = 0;
      unint64_t v42 = 0xE000000000000000;
      sub_10002ECD8(21);
      swift_bridgeObjectRelease();
      id v41 = (id)0xD000000000000013;
      unint64_t v42 = 0x80000001000325D0;
      sub_100017488();
      v43._uint64_t countAndFlagsBits = sub_10002ED78();
      sub_10002E948(v43);
      swift_bridgeObjectRelease();
      id v24 = v41;
      unint64_t v23 = v42;
      sub_10002EA88();
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = v38;
      unint64_t v26 = v35;
      *(void *)(v25 + 56) = &type metadata for String;
      *(void *)(v25 + 64) = v26;
      *(void *)(v25 + 32) = v24;
      *(void *)(v25 + 40) = v23;
      uint64_t v10 = v15;
      swift_bridgeObjectRetain();
      sub_10002E768();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v15);
      uint64_t v12 = 0;
    }
    else
    {
      id v27 = v41;
      swift_bridgeObjectRelease();
      uint64_t v28 = sub_10002E5F8();

      swift_willThrow();
      id v41 = 0;
      unint64_t v42 = 0xE000000000000000;
      sub_10002ECD8(45);
      v44._uint64_t countAndFlagsBits = 0xD000000000000026;
      v44._object = (void *)0x80000001000325A0;
      sub_10002E948(v44);
      sub_100017488();
      v45._uint64_t countAndFlagsBits = sub_10002ED78();
      sub_10002E948(v45);
      swift_bridgeObjectRelease();
      v46._uint64_t countAndFlagsBits = 8236;
      v46._object = (void *)0xE200000000000000;
      sub_10002E948(v46);
      uint64_t v40 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
      sub_10002ED18();
      v47._uint64_t countAndFlagsBits = 46;
      v47._object = (void *)0xE100000000000000;
      sub_10002E948(v47);
      id v30 = v41;
      unint64_t v29 = v42;
      sub_10002EAA8();
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = v38;
      unint64_t v32 = v35;
      *(void *)(v31 + 56) = &type metadata for String;
      *(void *)(v31 + 64) = v32;
      *(void *)(v31 + 32) = v30;
      *(void *)(v31 + 40) = v29;
      swift_bridgeObjectRetain();
      uint64_t v10 = v15;
      sub_10002E768();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v15);
      uint64_t v12 = 1;
      uint64_t v13 = v39;
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, v12, 1, v10);
}

uint64_t sub_100017218@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v5 = sub_10002E8E8();
  id v6 = [self bundleWithIdentifier:v5];

  if (v6)
  {
    if (qword_100047078 != -1) {
      swift_once();
    }
    NSString v7 = sub_10002E8E8();
    NSString v8 = sub_10002E8E8();
    id v9 = [v6 URLForResource:v7 withExtension:v8];

    if (v9)
    {
      sub_10002E668();

      uint64_t v10 = sub_10002E688();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 0, 1, v10);
    }
    else
    {
      uint64_t v14 = sub_10002E688();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
    }
    return sub_10000B4D8((uint64_t)v4, a1);
  }
  else
  {
    uint64_t v11 = sub_10002E688();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    return v12(a1, 1, 1, v11);
  }
}

uint64_t type metadata accessor for MapsSyncDataBase_0_0_1()
{
  return self;
}

unint64_t sub_100017488()
{
  unint64_t result = qword_100047580;
  if (!qword_100047580)
  {
    sub_10002E688();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047580);
  }
  return result;
}

uint64_t sub_1000174E0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedHistoryItem();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

uint64_t sub_100017524@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedCachedCuratedCollection();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

uint64_t sub_100017568@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MapsSyncManagedCuratedCollection();
  uint64_t result = sub_10002ECE8();
  *a1 = result;
  return result;
}

id sub_100017604()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedHistoryRideShareItem()
{
  return self;
}

unint64_t sub_10001765C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000482D8);
  uint64_t v2 = sub_10002ED58();
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
    sub_10002CFF8(v6, (uint64_t)v15, &qword_1000482E0);
    unint64_t result = sub_100029F2C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100029F70(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_1000177A0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_100048498);
  uint64_t v2 = sub_10002ED58();
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
    sub_10002CFF8(v6, (uint64_t)&v15, &qword_1000484A0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100029F80(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100029F70(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void *sub_1000178D8(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  uint64_t v25 = *(void *)(a1 + 24);
  uint64_t v24 = *(void *)(a1 + 32);
  char v23 = *(unsigned char *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  long long v30 = *(_OWORD *)(a1 + 24);
  char v31 = *(unsigned char *)(a1 + 40);
  int v6 = DWORD2(v30);
  uint64_t v5 = v30;
  char v7 = v31;
  uint64_t v32 = v4;
  sub_10002CA0C(v1, v2, v3 & 1);
  uint64_t v28 = v2;
  uint64_t v29 = v1;
  sub_10002CA0C(v1, v2, v3 & 1);
  sub_10002CA18((uint64_t)&v30);
  unint64_t result = (void *)sub_10002CA4C((uint64_t)&v32);
  if ((v3 & 1) == 0 && (v7 & 1) == 0)
  {
    uint64_t v9 = v4;
    uint64_t v27 = v4 + 56;
    uint64_t v10 = v2;
    int64_t v11 = v1;
    int v26 = v6;
    while (v10 == v6)
    {
      if (v11 == v5)
      {
        sub_10002C9CC(v29, v28, 0);
        sub_10002C9CC(v25, v24, v23 & 1);
        swift_bridgeObjectRelease();
        sub_10002C9CC(v5, v10, 0);
        return _swiftEmptyArrayStorage;
      }
      if (v11 < v29) {
        goto LABEL_19;
      }
      if (v6 != v28) {
        goto LABEL_20;
      }
      if (v11 >= v5) {
        goto LABEL_21;
      }
      if (v11 < 0 || v11 >= 1 << *(unsigned char *)(v9 + 32)) {
        goto LABEL_22;
      }
      if (((*(void *)(v27 + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_23;
      }
      if (*(_DWORD *)(v9 + 36) != v6) {
        goto LABEL_24;
      }
      uint64_t v12 = v5;
      uint64_t v13 = *(void *)(v9 + 48) + 16 * v11;
      uint64_t v14 = *(void *)v13;
      int v15 = *(_DWORD *)(v13 + 8);
      uint64_t v16 = v9;
      int64_t v17 = sub_10002B8D4(v11, v10, 0, v9);
      uint64_t v19 = v18;
      char v21 = v20;
      sub_10002C9CC(v11, v10, 0);
      sub_1000049A0(0, &qword_100047A90);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_10002FE90;
      *(void *)(v22 + 56) = &type metadata for Int64;
      *(void *)(v22 + 64) = &protocol witness table for Int64;
      *(void *)(v22 + 32) = v14;
      *(void *)(v22 + 96) = &type metadata for Int32;
      *(void *)(v22 + 104) = &protocol witness table for Int32;
      *(_DWORD *)(v22 + 72) = v15;
      sub_10002EA78();
      sub_10002E988();
      if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10002E9C8();
      }
      sub_10002E9D8();
      unint64_t result = (void *)sub_10002E9B8();
      uint64_t v10 = v19;
      int64_t v11 = v17;
      uint64_t v5 = v12;
      int v6 = v26;
      uint64_t v9 = v16;
      if (v21) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100017BE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100017C10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100017C38()
{
  *(void *)(v1 + 64) = v0;
  return _swift_task_switch(sub_100017C58, 0, 0);
}

uint64_t sub_100017C58()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = v0[8];
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001ALL, 0x8000000100032920);
  id v3 = sub_1000271CC((void (*)(void))type metadata accessor for MapsSyncManagedCollectionPlaceItem);
  uint64_t v4 = *(void *)(v2 + 88);
  swift_retain();
  uint64_t v5 = *(void **)(v2 + 24);
  int v6 = (void *)swift_task_alloc();
  v6[2] = v2;
  v6[3] = v3;
  v6[4] = 0;
  v6[5] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000482F0);
  sub_10002EB88();
  uint64_t result = swift_task_dealloc();
  uint64_t v44 = v4;
  if (v4)
  {
    id v45 = v3;
    int64_t v8 = 0;
    uint64_t v49 = v0[3];
    uint64_t v51 = v0[2];
    int64_t v52 = *(void *)(v49 + 16);
    for (uint64_t i = v4; ; uint64_t i = v16)
    {
      BOOL v10 = v52 >= v8;
      if (i > 0) {
        BOOL v10 = v8 >= v52;
      }
      if (v10) {
        break;
      }
      int64_t v11 = (void *)swift_task_alloc();
      v11[2] = v8;
      v11[3] = i;
      v11[4] = v49;
      v11[5] = v51;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000482F8);
      sub_10002EB88();
      swift_task_dealloc();
      uint64_t v12 = v0[2];
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v12;
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = sub_10002D184;
      *(void *)(v14 + 24) = v13;
      v0[6] = sub_10002BE64;
      v0[7] = v14;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = sub_100017C10;
      v0[5] = &block_descriptor_2;
      int v15 = _Block_copy(v1);
      uint64_t v16 = i;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      [v5 performBlockAndWait:v15];
      _Block_release(v15);
      char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      uint64_t result = swift_bridgeObjectRelease();
      if (isEscapingClosureAtFileLocation)
      {
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      if (__OFADD__(v8, v16)) {
        int64_t v8 = ((v8 + v16) >> 63) ^ 0x8000000000000000;
      }
      else {
        v8 += v16;
      }
      sub_10002EB88();
      uint64_t v1 = v0 + 2;
    }
    uint64_t v18 = v0[8];
    swift_bridgeObjectRelease();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = sub_10002BEC0;
    *(void *)(v19 + 24) = v18;
    v0[6] = sub_10002D128;
    v0[7] = v19;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_100017C10;
    v0[5] = &block_descriptor_39;
    char v20 = _Block_copy(v1);
    swift_retain();
    swift_retain();
    swift_release();
    [v5 performBlockAndWait:v20];
    _Block_release(v20);
    LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if (v18) {
      goto LABEL_29;
    }
    char v21 = v5;
    uint64_t v22 = v0[8];
    sub_10002ECD8(60);
    v55._object = (void *)0x8000000100032940;
    v55._uint64_t countAndFlagsBits = 0xD000000000000014;
    sub_10002E948(v55);
    swift_bridgeObjectRelease();
    v0[2] = v52;
    v56._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v56);
    swift_bridgeObjectRelease();
    v57._uint64_t countAndFlagsBits = 0xD000000000000015;
    v57._object = (void *)0x8000000100032960;
    sub_10002E948(v57);
    v0[2] = i;
    v58._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v58);
    swift_bridgeObjectRelease();
    v59._uint64_t countAndFlagsBits = 0x71657220726F6620;
    v59._object = (void *)0xED00002074736575;
    sub_10002E948(v59);
    id v23 = [v45 description];
    uint64_t v24 = sub_10002E8F8();
    int v26 = v25;

    v60._uint64_t countAndFlagsBits = v24;
    v60._object = v26;
    sub_10002E948(v60);
    swift_bridgeObjectRelease();
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    swift_release_n();

    id v27 = sub_1000271CC((void (*)(void))type metadata accessor for MapsSyncManagedFavoriteItem);
    swift_retain();
    uint64_t v28 = (void *)swift_task_alloc();
    v28[2] = v22;
    v28[3] = v27;
    v28[4] = 0;
    v28[5] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048300);
    sub_10002EB88();
    swift_task_dealloc();
    id v47 = v21;
    id v46 = v27;
    int64_t v29 = 0;
    uint64_t v50 = v0[2];
    uint64_t v48 = v0[3];
    int64_t v53 = *(void *)(v48 + 16);
    while (1)
    {
      BOOL v30 = v53 >= v29;
      if (v44 > 0) {
        BOOL v30 = v29 >= v53;
      }
      if (v30) {
        break;
      }
      char v31 = (void *)swift_task_alloc();
      v31[2] = v29;
      v31[3] = v44;
      v31[4] = v48;
      v31[5] = v50;
      __swift_instantiateConcreteTypeFromMangledName(&qword_100048308);
      sub_10002EB88();
      swift_task_dealloc();
      uint64_t v32 = v0[2];
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = v32;
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = sub_10002BF84;
      *(void *)(v34 + 24) = v33;
      v0[6] = sub_10002D128;
      v0[7] = v34;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = sub_100017C10;
      v0[5] = &block_descriptor_49_0;
      unint64_t v35 = _Block_copy(v1);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      [v47 performBlockAndWait:v35];
      _Block_release(v35);
      LOBYTE(v35) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      uint64_t result = swift_bridgeObjectRelease();
      if (v35) {
        goto LABEL_27;
      }
      if (__OFADD__(v29, v44)) {
        int64_t v29 = ((v29 + v44) >> 63) ^ 0x8000000000000000;
      }
      else {
        v29 += v44;
      }
      sub_10002EB88();
      uint64_t v1 = v0 + 2;
    }
    uint64_t v36 = v0[8];
    swift_bridgeObjectRelease();
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = sub_10002D1D4;
    *(void *)(v37 + 24) = v36;
    v0[6] = sub_10002D128;
    v0[7] = v37;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_100017C10;
    v0[5] = &block_descriptor_58;
    long long v38 = _Block_copy(v1);
    swift_retain();
    swift_retain();
    swift_release();
    [v47 performBlockAndWait:v38];
    _Block_release(v38);
    LOBYTE(v36) = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if ((v36 & 1) == 0)
    {
      sub_10002ECD8(60);
      v61._object = (void *)0x8000000100032940;
      v61._uint64_t countAndFlagsBits = 0xD000000000000014;
      sub_10002E948(v61);
      swift_bridgeObjectRelease();
      v0[2] = v53;
      v62._uint64_t countAndFlagsBits = sub_10002ED78();
      sub_10002E948(v62);
      swift_bridgeObjectRelease();
      v63._uint64_t countAndFlagsBits = 0xD000000000000015;
      v63._object = (void *)0x8000000100032960;
      sub_10002E948(v63);
      v0[2] = v44;
      v64._uint64_t countAndFlagsBits = sub_10002ED78();
      sub_10002E948(v64);
      swift_bridgeObjectRelease();
      v65._uint64_t countAndFlagsBits = 0x71657220726F6620;
      v65._object = (void *)0xED00002074736575;
      sub_10002E948(v65);
      id v39 = [v27 description];
      uint64_t v40 = sub_10002E8F8();
      unint64_t v42 = v41;

      v66._uint64_t countAndFlagsBits = v40;
      v66._object = v42;
      sub_10002E948(v66);
      swift_bridgeObjectRelease();
      _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      swift_release_n();

      _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000023, 0x8000000100032980);
      Swift::String v43 = (uint64_t (*)(void))v0[1];
      return v43();
    }
  }
  else
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_100018734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [self sharedScheduler];
  NSString v8 = sub_10002E8E8();
  uint64_t v9 = *(void *)(v4 + 40);
  v11[4] = a3;
  uint64_t v12 = v4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100019E60;
  v11[3] = a4;
  BOOL v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  [v7 registerForTaskWithIdentifier:v8 usingQueue:v9 launchHandler:v10];
  _Block_release(v10);
}

uint64_t sub_10001883C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047550);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10002E688();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100047050 != -1) {
    swift_once();
  }
  swift_retain();
  sub_100016AE8(1, (uint64_t)v3);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_10000B3D0((uint64_t)v3, &qword_100047550);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  uint64_t v9 = *(void **)(v0 + 16);
  id v10 = [v9 persistentStoreCoordinator];
  sub_10002E638(v11);
  uint64_t v13 = v12;
  id v14 = [v10 persistentStoreForURL:v12];

  if (!v14)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1000482C0);
    uint64_t inited = swift_initStackObject();
    long long v37 = xmmword_10002F990;
    *(_OWORD *)(inited + 16) = xmmword_10002F990;
    id v40 = (id)sub_10002E8F8();
    unint64_t v41 = v16;
    sub_10002EC98();
    *(void *)(inited + 96) = &type metadata for Bool;
    *(unsigned char *)(inited + 72) = 1;
    sub_10001765C(inited);
    id v17 = [v9 persistentStoreCoordinator];
    uint64_t v18 = NSSQLiteStoreType;
    NSString v19 = sub_10002E8E8();
    sub_10002E638(v20);
    uint64_t v22 = v21;
    Class isa = sub_10002E8A8().super.isa;
    swift_bridgeObjectRelease();
    id v40 = 0;
    id v24 = [v17 addPersistentStoreWithType:v18 configuration:v19 URL:v22 options:isa error:&v40];

    if (!v24)
    {
      id v26 = v40;
      uint64_t v27 = sub_10002E5F8();

      swift_willThrow();
      uint64_t v39 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
      sub_1000049A0(0, &qword_1000482D0);
      swift_dynamicCast();
      uint64_t v28 = v38;
      id v40 = 0;
      unint64_t v41 = 0xE000000000000000;
      sub_10002ECD8(23);
      swift_bridgeObjectRelease();
      id v40 = (id)0xD000000000000011;
      unint64_t v41 = 0x8000000100032900;
      id v29 = [v28 description];
      uint64_t v30 = sub_10002E8F8();
      uint64_t v32 = v31;

      v42._uint64_t countAndFlagsBits = v30;
      v42._object = v32;
      sub_10002E948(v42);
      swift_bridgeObjectRelease();
      v43._uint64_t countAndFlagsBits = 8236;
      v43._object = (void *)0xE200000000000000;
      sub_10002E948(v43);
      id v33 = [v28 userInfo];
      sub_10002E8B8();

      v44._uint64_t countAndFlagsBits = sub_10002E8C8();
      sub_10002E948(v44);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v35 = v40;
      unint64_t v34 = v41;
      sub_10002EAA8();
      if (qword_100047060 != -1) {
        swift_once();
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
      uint64_t v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = v37;
      *(void *)(v36 + 56) = &type metadata for String;
      *(void *)(v36 + 64) = sub_100007844();
      *(void *)(v36 + 32) = v35;
      *(void *)(v36 + 40) = v34;
      swift_bridgeObjectRetain();
      sub_10002E768();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_errorRelease();
      return 0;
    }
    id v25 = v40;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 1;
}

uint64_t sub_100018E3C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MapsSyncDaemonPeriodicActivityHandler()
{
  return self;
}

uint64_t sub_100018EB8(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048380);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = sub_10002EA38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a2;
  v9[5] = a1;
  v9[6] = v7;
  swift_retain();
  id v10 = a1;
  int64_t v11 = v7;
  uint64_t v12 = sub_10000D1C8((uint64_t)v6, (uint64_t)&unk_1000483A0, (uint64_t)v9);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v11;
  aBlock[4] = sub_10002C5AC;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006504;
  aBlock[3] = &block_descriptor_87;
  id v14 = _Block_copy(aBlock);
  int v15 = v11;
  swift_retain();
  swift_release();
  [v10 setExpirationHandler:v14];
  _Block_release(v14);

  return swift_release();
}

uint64_t sub_1000190A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  uint64_t v8 = (void *)swift_task_alloc();
  v6[7] = v8;
  void *v8 = v6;
  v8[1] = sub_100019154;
  void v8[2] = a4;
  return _swift_task_switch(sub_100019504, 0, 0);
}

uint64_t sub_100019154()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000192F0;
  }
  else {
    uint64_t v2 = sub_100019268;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100019268()
{
  [*(id *)(v0 + 40) setTaskCompleted];
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000017, 0x8000000100032B60);
  sub_10002EB78();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000192F0()
{
  uint64_t v1 = *(void *)(v0 + 64);
  sub_10002ECD8(37);
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0xE000000000000000;
  v8._uint64_t countAndFlagsBits = 0xD000000000000023;
  v8._object = (void *)0x8000000100032B00;
  sub_10002E948(v8);
  *(void *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
  sub_10002ED18();
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  sub_10002EAA8();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10002F990;
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = sub_100007844();
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v3;
  swift_bridgeObjectRetain();
  sub_10002E768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  [*(id *)(v0 + 40) setTaskCompleted];
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000017, 0x8000000100032B60);
  sub_10002EB78();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000194E4()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_100019504, 0, 0);
}

uint64_t sub_100019504()
{
  uint64_t v1 = v0[2];
  if (*(unsigned char *)(v1 + 99) == 1)
  {
    sub_10001A7E8();
    if (sub_10002EA58()) {
      goto LABEL_13;
    }
    uint64_t v1 = v0[2];
  }
  if (*(unsigned char *)(v1 + 100) == 1)
  {
    sub_10001A9C4();
    if (sub_10002EA58()) {
      goto LABEL_13;
    }
    uint64_t v1 = v0[2];
  }
  uint64_t v2 = *(void **)(v1 + 32);
  v0[3] = v2;
  if (v2)
  {
    v2;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[4] = v3;
    void *v3 = v0;
    v3[1] = sub_100019654;
    return sub_100012168();
  }
  if (*(unsigned char *)(v1 + 96) == 1)
  {
    sub_10002341C();
    sub_10002EA58();
  }
LABEL_13:
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100019654(char a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v5 = sub_100019D1C;
  }
  else
  {
    *(unsigned char *)(v4 + 72) = a1 & 1;
    uint64_t v5 = sub_100019784;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100019784()
{
  if (*(unsigned char *)(v0 + 72) != 1) {
    goto LABEL_16;
  }
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  if (v1[98] == 1)
  {
    sub_10001AA70();
    if (sub_10002EA58())
    {
LABEL_7:

LABEL_18:
      uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
      return v5();
    }
    uint64_t v1 = *(unsigned char **)(v0 + 16);
  }
  if (v1[97] == 1)
  {
    sub_10001ABC8();
    if (sub_10002EA58()) {
      goto LABEL_7;
    }
    uint64_t v1 = *(unsigned char **)(v0 + 16);
  }
  if (v1[101] != 1)
  {
    if (v1[102] == 1)
    {
      uint64_t v4 = (void *)swift_task_alloc();
      *(void *)(v0 + 56) = v4;
      *uint64_t v4 = v0;
      v4[1] = sub_100019B80;
      v4[8] = *(void *)(v0 + 16);
      uint64_t v3 = sub_100017C58;
      goto LABEL_13;
    }
LABEL_16:

    if (*(unsigned char *)(*(void *)(v0 + 16) + 96) == 1)
    {
      sub_10002341C();
      sub_10002EA58();
    }
    goto LABEL_18;
  }
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  void *v2 = v0;
  v2[1] = sub_100019948;
  v2[82] = *(void *)(v0 + 16);
  uint64_t v3 = sub_10001AD40;
LABEL_13:
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100019948()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100019D98;
  }
  else {
    uint64_t v2 = sub_100019A5C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100019A5C()
{
  if (sub_10002EA58())
  {

LABEL_9:
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  if (*(unsigned char *)(*(void *)(v0 + 16) + 102) != 1)
  {

    if (*(unsigned char *)(*(void *)(v0 + 16) + 96) == 1)
    {
      sub_10002341C();
      sub_10002EA58();
    }
    goto LABEL_9;
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100019B80;
  v1[8] = *(void *)(v0 + 16);
  return _swift_task_switch(sub_100017C58, 0, 0);
}

uint64_t sub_100019B80()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100019DFC;
  }
  else {
    uint64_t v2 = sub_100019C94;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100019C94()
{
  uint64_t v1 = (void *)v0[3];
  char v2 = sub_10002EA58();

  if ((v2 & 1) == 0 && *(unsigned char *)(v0[2] + 96) == 1)
  {
    sub_10002341C();
    sub_10002EA58();
  }
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100019D1C()
{
  if (*(unsigned char *)(*(void *)(v0 + 16) + 96) == 1)
  {
    sub_10002341C();
    sub_10002EA58();
  }
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100019D98()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100019DFC()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_100019E60(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100019EC8(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048380);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = sub_10002EA38();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a2;
  v9[5] = a1;
  v9[6] = v7;
  swift_retain();
  id v10 = a1;
  int64_t v11 = v7;
  uint64_t v12 = sub_10000D1C8((uint64_t)v6, (uint64_t)&unk_100048390, (uint64_t)v9);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v11;
  aBlock[4] = sub_10002C5AC;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006504;
  aBlock[3] = &block_descriptor_72;
  id v14 = _Block_copy(aBlock);
  int v15 = v11;
  swift_retain();
  swift_release();
  [v10 setExpirationHandler:v14];
  _Block_release(v14);

  return swift_release();
}

uint64_t sub_10001A0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  return _swift_task_switch(sub_10001A0DC, 0, 0);
}

uint64_t sub_10001A0DC()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 40) + 32);
  *(void *)(v0 + 64) = v1;
  if (v1)
  {
    v1;
    char v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_10001A1E8;
    return sub_100012168();
  }
  else
  {
    [*(id *)(v0 + 48) setTaskCompleted];
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001BLL, 0x8000000100032AE0);
    sub_10002EB78();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_10001A1E8(char a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_errorRelease();
    uint64_t v5 = sub_10001A448;
  }
  else
  {
    *(unsigned char *)(v4 + 96) = a1 & 1;
    uint64_t v5 = sub_10001A318;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10001A318()
{
  if (*(unsigned char *)(v0 + 96) == 1 && *(unsigned char *)(*(void *)(v0 + 40) + 102) == 1)
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_10001A4D8;
    v1[8] = *(void *)(v0 + 40);
    return _swift_task_switch(sub_100017C58, 0, 0);
  }
  else
  {

    [*(id *)(v0 + 48) setTaskCompleted];
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001BLL, 0x8000000100032AE0);
    sub_10002EB78();
    char v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_10001A448()
{
  [*(id *)(v0 + 48) setTaskCompleted];
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001BLL, 0x8000000100032AE0);
  sub_10002EB78();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001A4D8()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    char v2 = sub_10001A5EC;
  }
  else {
    char v2 = sub_10002D1DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001A5EC()
{
  uint64_t v1 = *(void *)(v0 + 88);

  sub_10002ECD8(37);
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0xE000000000000000;
  v8._uint64_t countAndFlagsBits = 0xD000000000000023;
  v8._object = (void *)0x8000000100032B00;
  sub_10002E948(v8);
  *(void *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
  sub_10002ED18();
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  sub_10002EAA8();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10002F990;
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = sub_100007844();
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v3;
  swift_bridgeObjectRetain();
  sub_10002E768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  [*(id *)(v0 + 48) setTaskCompleted];
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001BLL, 0x8000000100032AE0);
  sub_10002EB78();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_10001A7E8()
{
  uint64_t aBlock = 0;
  unint64_t v6 = 0xE000000000000000;
  sub_10002ECD8(55);
  v12._object = (void *)0x8000000100032B80;
  v12._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
  sub_10002E948(v12);
  uint64_t v11 = *(void *)(v0 + 56);
  v13._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v13);
  swift_bridgeObjectRelease();
  v14._uint64_t countAndFlagsBits = 0x297379616420;
  v14._object = (void *)0xE600000000000000;
  sub_10002E948(v14);
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_10002C75C;
  *(void *)(v2 + 24) = v0;
  uint64_t v9 = sub_10002D128;
  uint64_t v10 = v2;
  uint64_t aBlock = _NSConcreteStackBlock;
  unint64_t v6 = 1107296256;
  uint64_t v7 = sub_100017C10;
  Swift::String v8 = &block_descriptor_99;
  uint64_t v3 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  [v1 performBlockAndWait:v3];
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A9C4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10001AA70()
{
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001CLL, 0x8000000100032DA0);
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_10002CA78;
  *(void *)(v2 + 24) = v0;
  v5[4] = sub_10002D128;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_100017C10;
  v5[3] = &block_descriptor_106;
  uint64_t v3 = _Block_copy(v5);
  swift_retain();
  swift_retain();
  swift_release();
  [v1 performBlockAndWait:v3];
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001ABC8()
{
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001ALL, 0x8000000100032E80);
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_10002CAF4;
  *(void *)(v2 + 24) = v0;
  v5[4] = sub_10002D128;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_100017C10;
  v5[3] = &block_descriptor_113;
  uint64_t v3 = _Block_copy(v5);
  swift_retain();
  swift_retain();
  swift_release();
  [v1 performBlockAndWait:v3];
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001AD20()
{
  *(void *)(v1 + 656) = v0;
  return _swift_task_switch(sub_10001AD40, 0, 0);
}

uint64_t sub_10001AD40()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[41].i64[0];
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000014, 0x8000000100032EC0);
  uint64_t v3 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedCollectionPlaceItem);
  v0[41].i64[1] = (uint64_t)v3;
  uint64_t v4 = *(void *)(v2 + 88);
  v1[42].i64[0] = v4;
  swift_retain_n();
  v1[42].i64[1] = *(void *)(v2 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  v5[2] = v2;
  v5[3] = v3;
  v5[4] = sub_10002CB0C;
  v5[5] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000482F0);
  sub_10002EB88();
  swift_task_dealloc();
  uint64_t v13 = v1[27].i64[0];
  uint64_t v14 = v1[27].i64[1];
  v1[43].i64[0] = v13;
  v1[43].i64[1] = v14;
  uint64_t v15 = *(void *)(v14 + 16);
  v1[44].i64[0] = v15;
  if (!v4) {
    goto LABEL_150;
  }
  uint64_t v16 = v1[42].i64[0];
  Class v204 = (uint64_t *)v1;
  if (v16 >= 1 && v15)
  {
    id v17 = 0;
    uint64_t v18 = (unint64_t *)&v1[35];
    id v203 = v1 + 13;
    do
    {
      unint64_t v19 = (unint64_t)v17 + v16;
      if (__OFADD__(v17, v16)) {
        unint64_t v19 = (((uint64_t)v17 + v16) >> 63) ^ 0x8000000000000000;
      }
      v1[45].i64[0] = v19;
      char v20 = (int8x16_t *)swift_task_alloc();
      int8x16_t v21 = v1[43];
      v20[1].i64[0] = (uint64_t)v17;
      v20[1].i64[1] = v16;
      v20[2] = vextq_s8(v21, v21, 8uLL);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000482F8);
      sub_10002EB88();
      swift_task_dealloc();
      unint64_t v22 = v1[38].u64[1];
      v1[45].i64[1] = v22;
      v1[35].i64[0] = (uint64_t)_swiftEmptyArrayStorage;
      if (v22 >> 62)
      {
        swift_bridgeObjectRetain();
        id v24 = (id)sub_10002ED38();
        uint64_t v23 = (uint64_t)v24;
        if (!v24)
        {
LABEL_21:
          swift_bridgeObjectRelease();
          unint64_t v28 = (unint64_t)_swiftEmptyArrayStorage;
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
        id v24 = (id)swift_bridgeObjectRetain();
        if (!v23) {
          goto LABEL_21;
        }
      }
      if (v23 < 1)
      {
        __break(1u);
LABEL_143:
        __break(1u);
LABEL_144:
        id v196 = v24;
        uint64_t v141 = v1 + 39;
        uint64_t v197 = v1[41].i64[0];
        objc_msgSend(v24, "setAnalyticsOptOut:", 1, v201, v202);
        sub_1000049A0(0, &qword_100048450);
        Class isa = sub_10002E998().super.isa;
        id v199 = [v17 ticketForIdentifiers:isa traits:v196];
        v1[66].i64[1] = (uint64_t)v199;

        uint64_t v145 = swift_task_alloc();
        v1[67].i64[0] = v145;
        *(void *)(v145 + 16) = v199;
        *(void *)(v145 + 24) = v197;
        uint64_t v200 = (void *)swift_task_alloc();
        v1[67].i64[1] = (uint64_t)v200;
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
        *uint64_t v200 = v1;
        v200[1] = sub_1000228B4;
        unint64_t v8 = 0xD000000000000019;
        unint64_t v9 = 0x8000000100032EE0;
        v147 = (void (*)(uint64_t))sub_10002D1D8;
LABEL_145:
        uint64_t v10 = v147;
        uint64_t v13 = (uint64_t)v141;
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        uint64_t v11 = v145;
        return withCheckedThrowingContinuation<A>(isolation:function:_:)(v13, v6, v7, v8, v9, v10, v11, v12);
      }
      uint64_t v25 = 0;
      id v17 = (void *)(v22 & 0xC000000000000001);
      do
      {
        if (v17) {
          id v26 = (id)sub_10002ED08();
        }
        else {
          id v26 = *(id *)(v22 + 8 * v25 + 32);
        }
        uint64_t v27 = v26;
        *(void *)(swift_task_alloc() + 16) = v26;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
        sub_10002EB88();

        swift_task_dealloc();
        if (v204[68])
        {
          sub_10002E988();
          if (*(void *)((*v18 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v18 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_10002E9C8();
          }
          sub_10002E9D8();
          sub_10002E9B8();
        }
        ++v25;
      }
      while (v23 != v25);
      swift_bridgeObjectRelease();
      unint64_t v28 = *v18;
      uint64_t v1 = (int8x16_t *)v204;
LABEL_22:
      v1[46].i64[0] = v28;
      if (v28 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_10002ED38();
        swift_bridgeObjectRelease();
        if (!v38)
        {
LABEL_30:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_31;
        }
      }
      else if (!*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_30;
      }
      id v29 = [self sharedService];
      v1[46].i64[1] = (uint64_t)v29;
      if (v29)
      {
        uint64_t v30 = v29;
        id v31 = [v29 defaultTraits];
        v1[47].i64[0] = (uint64_t)v31;
        if (v31)
        {
          id v140 = v31;
          uint64_t v141 = (int8x16_t *)((char *)v1 + 488);
          uint64_t v142 = v1[41].i64[0];
          [v31 setAnalyticsOptOut:1];
          sub_1000049A0(0, &qword_100048450);
          Class v143 = sub_10002E998().super.isa;
          id v144 = [v30 ticketForIdentifiers:v143 traits:v140];
          v1[47].i64[1] = (uint64_t)v144;

          uint64_t v145 = swift_task_alloc();
          v1[48].i64[0] = v145;
          *(void *)(v145 + 16) = v144;
          *(void *)(v145 + 24) = v142;
          uint64_t v146 = (void *)swift_task_alloc();
          v1[48].i64[1] = (uint64_t)v146;
          uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
          *uint64_t v146 = v1;
          v146[1] = sub_10001D188;
          unint64_t v8 = 0xD000000000000019;
          unint64_t v9 = 0x8000000100032EE0;
          v147 = sub_10002CB88;
          goto LABEL_145;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v32 = v1[45].i64[1];
      id v33 = (void *)v1[42].i64[1];
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = v32;
      *(void *)(v34 + 24) = _swiftEmptyArrayStorage;
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = sub_10002CB58;
      *(void *)(v35 + 24) = v34;
      v1[15].i64[0] = (uint64_t)sub_10002D128;
      v1[15].i64[1] = v35;
      v1[13].i64[0] = (uint64_t)_NSConcreteStackBlock;
      v1[13].i64[1] = 1107296256;
      v1[14].i64[0] = (uint64_t)sub_100017C10;
      v1[14].i64[1] = (uint64_t)&block_descriptor_125;
      uint64_t v36 = _Block_copy(v203);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      [v33 performBlockAndWait:v36];
      long long v37 = v36;
      uint64_t v1 = (int8x16_t *)v204;
      _Block_release(v37);
      LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      id v24 = (id)swift_bridgeObjectRelease();
      if (v33) {
        goto LABEL_143;
      }
LABEL_31:
      sub_10002EB88();
      id v17 = (void *)v1[45].i64[0];
      uint64_t v39 = v1[44].i64[0];
      uint64_t v16 = v1[42].i64[0];
      BOOL v40 = v39 >= (uint64_t)v17;
      BOOL v41 = (uint64_t)v17 >= v39;
      if (v16 <= 0) {
        BOOL v41 = v40;
      }
    }
    while (!v41);
  }
  Swift::String v42 = (void *)v1[42].i64[1];
  uint64_t v43 = v1[41].i64[0];
  swift_bridgeObjectRelease();
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = sub_10002D1D4;
  *(void *)(v44 + 24) = v43;
  v1[21].i64[0] = (uint64_t)sub_10002D128;
  v1[21].i64[1] = v44;
  v1[19].i64[0] = (uint64_t)_NSConcreteStackBlock;
  v1[19].i64[1] = 1107296256;
  v1[20].i64[0] = (uint64_t)sub_100017C10;
  v1[20].i64[1] = (uint64_t)&block_descriptor_135;
  id v45 = _Block_copy(&v1[19]);
  swift_retain();
  swift_retain();
  swift_release();
  [v42 performBlockAndWait:v45];
  _Block_release(v45);
  LOBYTE(v45) = swift_isEscapingClosureAtFileLocation();
  uint64_t v13 = swift_release();
  if (v45) {
    goto LABEL_151;
  }
  uint64_t v46 = v1[44].i64[0];
  uint64_t v47 = v204[84];
  uint64_t v48 = (void *)v204[83];
  uint64_t v49 = v204[82];
  sub_10002ECD8(60);
  v206._object = (void *)0x8000000100032940;
  v206._uint64_t countAndFlagsBits = 0xD000000000000014;
  sub_10002E948(v206);
  swift_bridgeObjectRelease();
  v204[59] = v46;
  v207._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v207);
  swift_bridgeObjectRelease();
  v208._uint64_t countAndFlagsBits = 0xD000000000000015;
  v208._object = (void *)0x8000000100032960;
  sub_10002E948(v208);
  v204[64] = v47;
  uint64_t v50 = (int8x16_t *)v204;
  v209._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v209);
  swift_bridgeObjectRelease();
  v210._uint64_t countAndFlagsBits = 0x71657220726F6620;
  v210._object = (void *)0xED00002074736575;
  sub_10002E948(v210);
  id v51 = [v48 description];
  uint64_t v52 = sub_10002E8F8();
  uint64_t v54 = v53;

  v211._uint64_t countAndFlagsBits = v52;
  v211._object = v54;
  sub_10002E948(v211);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  swift_release_n();

  Swift::String v55 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedHistoryPlaceItem);
  v204[89] = (uint64_t)v55;
  swift_retain_n();
  Swift::String v56 = (void *)swift_task_alloc();
  v56[2] = v49;
  v56[3] = v55;
  v56[4] = sub_10002CBA0;
  v56[5] = v49;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100048460);
  sub_10002EB88();
  v201 = "Finished processing ";
  swift_task_dealloc();
  uint64_t v57 = v204[53];
  v204[99] = v204[52];
  v204[100] = v57;
  uint64_t v58 = *(void *)(v57 + 16);
  v204[101] = v58;
  uint64_t v59 = v204[84];
  if (v59 < 1 || !v58)
  {
LABEL_67:
    uint64_t v84 = (void *)v50[42].i64[1];
    uint64_t v85 = v50[41].i64[0];
    swift_bridgeObjectRelease();
    uint64_t v86 = swift_allocObject();
    *(void *)(v86 + 16) = sub_10002D1D4;
    *(void *)(v86 + 24) = v85;
    v50[18].i64[0] = (uint64_t)sub_10002D128;
    v50[18].i64[1] = v86;
    v50[16].i64[0] = (uint64_t)_NSConcreteStackBlock;
    v50[16].i64[1] = 1107296256;
    v50[17].i64[0] = (uint64_t)sub_100017C10;
    v50[17].i64[1] = (uint64_t)&block_descriptor_156;
    unsigned int v87 = _Block_copy(&v50[16]);
    swift_retain();
    swift_retain();
    swift_release();
    [v84 performBlockAndWait:v87];
    _Block_release(v87);
    LOBYTE(v87) = swift_isEscapingClosureAtFileLocation();
    uint64_t v13 = swift_release();
    if (v87) {
      goto LABEL_154;
    }
    uint64_t v88 = v50[50].i64[1];
    v89 = (void *)v204[89];
    uint64_t v90 = v204[84];
    uint64_t v91 = v204[82];
    sub_10002ECD8(60);
    v212._object = (void *)0x8000000100032940;
    v212._uint64_t countAndFlagsBits = 0xD000000000000014;
    sub_10002E948(v212);
    swift_bridgeObjectRelease();
    v204[62] = v88;
    v213._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v213);
    swift_bridgeObjectRelease();
    v214._uint64_t countAndFlagsBits = 0xD000000000000015;
    v214._object = (void *)0x8000000100032960;
    sub_10002E948(v214);
    v204[63] = v90;
    unint64_t v92 = (int8x16_t *)v204;
    v215._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v215);
    swift_bridgeObjectRelease();
    v216._uint64_t countAndFlagsBits = 0x71657220726F6620;
    v216._object = (void *)0xED00002074736575;
    sub_10002E948(v216);
    id v93 = [v89 description];
    uint64_t v94 = sub_10002E8F8();
    uint64_t v96 = v95;

    v217._uint64_t countAndFlagsBits = v94;
    v217._object = v96;
    sub_10002E948(v217);
    swift_bridgeObjectRelease();
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    swift_release_n();

    Class v97 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedFavoriteItem);
    v204[102] = (uint64_t)v97;
    swift_retain_n();
    v98 = (void *)swift_task_alloc();
    v98[2] = v91;
    v98[3] = v97;
    v98[4] = sub_10002CC98;
    v98[5] = v91;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048300);
    sub_10002EB88();
    swift_task_dealloc();
    uint64_t v99 = v204[51];
    v204[112] = v204[50];
    v204[113] = v99;
    uint64_t v100 = *(void *)(v99 + 16);
    v204[114] = v100;
    uint64_t v101 = v204[84];
    if (v101 >= 1 && v100)
    {
      uint64_t v102 = 0;
      v103 = (unint64_t *)(v204 + 66);
      do
      {
        unint64_t v104 = v102 + v101;
        if (__OFADD__(v102, v101)) {
          unint64_t v104 = ((v102 + v101) >> 63) ^ 0x8000000000000000;
        }
        v92[58].i64[0] = v104;
        uint64_t v105 = (int8x16_t *)swift_task_alloc();
        int8x16_t v106 = v92[56];
        v105[1].i64[0] = v102;
        v105[1].i64[1] = v101;
        v105[2] = vextq_s8(v106, v106, 8uLL);
        __swift_instantiateConcreteTypeFromMangledName(&qword_100048308);
        sub_10002EB88();
        swift_task_dealloc();
        unint64_t v107 = v92[32].u64[1];
        v92[58].i64[1] = v107;
        v92[33].i64[0] = (uint64_t)_swiftEmptyArrayStorage;
        if (v107 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v13 = sub_10002ED38();
          uint64_t v108 = v13;
          if (!v13)
          {
LABEL_87:
            swift_bridgeObjectRelease();
            unint64_t v112 = (unint64_t)_swiftEmptyArrayStorage;
            goto LABEL_88;
          }
        }
        else
        {
          uint64_t v108 = *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v13 = swift_bridgeObjectRetain();
          if (!v108) {
            goto LABEL_87;
          }
        }
        if (v108 < 1) {
          goto LABEL_152;
        }
        for (uint64_t i = 0; i != v108; ++i)
        {
          if ((v107 & 0xC000000000000001) != 0) {
            id v110 = (id)sub_10002ED08();
          }
          else {
            id v110 = *(id *)(v107 + 8 * i + 32);
          }
          id v111 = v110;
          *(void *)(swift_task_alloc() + 16) = v110;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
          sub_10002EB88();

          swift_task_dealloc();
          if (v204[67])
          {
            sub_10002E988();
            if (*(void *)((*v103 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v103 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_10002E9C8();
            }
            sub_10002E9D8();
            sub_10002E9B8();
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v112 = *v103;
        unint64_t v92 = (int8x16_t *)v204;
LABEL_88:
        v92[59].i64[0] = v112;
        if (v112 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v122 = sub_10002ED38();
          swift_bridgeObjectRelease();
          if (!v122)
          {
LABEL_96:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_97;
          }
        }
        else if (!*(void *)((v112 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          goto LABEL_96;
        }
        id v113 = [self sharedService];
        v92[59].i64[1] = (uint64_t)v113;
        if (v113)
        {
          id v114 = v113;
          id v115 = [v113 defaultTraits];
          v92[60].i64[0] = (uint64_t)v115;
          if (v115)
          {
            id v178 = v115;
            uint64_t v141 = (int8x16_t *)((char *)v92 + 552);
            uint64_t v179 = v92[41].i64[0];
            [v115 setAnalyticsOptOut:1];
            sub_1000049A0(0, &qword_100048450);
            Class v180 = sub_10002E998().super.isa;
            id v181 = [v114 ticketForIdentifiers:v180 traits:v178];
            v92[60].i64[1] = (uint64_t)v181;

            uint64_t v145 = swift_task_alloc();
            v92[61].i64[0] = v145;
            *(void *)(v145 + 16) = v181;
            *(void *)(v145 + 24) = v179;
            uint64_t v182 = (void *)swift_task_alloc();
            v92[61].i64[1] = (uint64_t)v182;
            uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
            *uint64_t v182 = v92;
            v182[1] = sub_100021440;
            unint64_t v8 = 0xD000000000000019;
            unint64_t v9 = 0x8000000100032EE0;
            v147 = (void (*)(uint64_t))sub_10002D1D8;
            goto LABEL_145;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v116 = v92[58].i64[1];
        uint64_t v117 = (void *)v92[42].i64[1];
        uint64_t v118 = swift_allocObject();
        *(void *)(v118 + 16) = v116;
        *(void *)(v118 + 24) = _swiftEmptyArrayStorage;
        uint64_t v119 = swift_allocObject();
        *(void *)(v119 + 16) = sub_10002CCCC;
        *(void *)(v119 + 24) = v118;
        v92[12].i64[0] = (uint64_t)sub_10002D128;
        v92[12].i64[1] = v119;
        v92[10].i64[0] = (uint64_t)_NSConcreteStackBlock;
        v92[10].i64[1] = 1107296256;
        v92[11].i64[0] = (uint64_t)sub_100017C10;
        v92[11].i64[1] = (uint64_t)&block_descriptor_168;
        uint64_t v120 = _Block_copy(v204 + 20);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_release();
        [v117 performBlockAndWait:v120];
        uint64_t v121 = v120;
        unint64_t v92 = (int8x16_t *)v204;
        _Block_release(v121);
        LOBYTE(v117) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        swift_release();
        uint64_t v13 = swift_bridgeObjectRelease();
        if (v117) {
          goto LABEL_153;
        }
LABEL_97:
        sub_10002EB88();
        uint64_t v102 = v92[58].i64[0];
        uint64_t v123 = v92[57].i64[0];
        uint64_t v101 = v92[42].i64[0];
        BOOL v124 = v123 >= v102;
        BOOL v125 = v102 >= v123;
        if (v101 <= 0) {
          BOOL v125 = v124;
        }
      }
      while (!v125);
    }
    uint64_t v126 = (void *)v92[42].i64[1];
    uint64_t v127 = v92[41].i64[0];
    swift_bridgeObjectRelease();
    uint64_t v128 = swift_allocObject();
    *(void *)(v128 + 16) = sub_10002D1D4;
    *(void *)(v128 + 24) = v127;
    v92[9].i64[0] = (uint64_t)sub_10002D128;
    v92[9].i64[1] = v128;
    v92[7].i64[0] = (uint64_t)_NSConcreteStackBlock;
    v92[7].i64[1] = 1107296256;
    v92[8].i64[0] = (uint64_t)sub_100017C10;
    v92[8].i64[1] = (uint64_t)&block_descriptor_179;
    v129 = _Block_copy(&v92[7]);
    swift_retain();
    swift_retain();
    swift_release();
    [v126 performBlockAndWait:v129];
    _Block_release(v129);
    LOBYTE(v129) = swift_isEscapingClosureAtFileLocation();
    uint64_t v13 = swift_release();
    if (v129) {
      goto LABEL_157;
    }
    uint64_t v130 = v92[57].i64[0];
    v131 = (void *)v204[102];
    uint64_t v132 = v204[84];
    uint64_t v133 = v204[82];
    sub_10002ECD8(60);
    v218._object = (void *)0x8000000100032940;
    v218._uint64_t countAndFlagsBits = 0xD000000000000014;
    sub_10002E948(v218);
    swift_bridgeObjectRelease();
    v204[71] = v130;
    v219._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v219);
    swift_bridgeObjectRelease();
    v220._uint64_t countAndFlagsBits = 0xD000000000000015;
    v220._object = (void *)0x8000000100032960;
    sub_10002E948(v220);
    v204[72] = v132;
    uint64_t v1 = (int8x16_t *)v204;
    v221._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v221);
    swift_bridgeObjectRelease();
    v222._uint64_t countAndFlagsBits = 0x71657220726F6620;
    v222._object = (void *)0xED00002074736575;
    sub_10002E948(v222);
    id v134 = [v131 description];
    uint64_t v135 = sub_10002E8F8();
    char v137 = v136;

    v223._uint64_t countAndFlagsBits = v135;
    v223._object = v137;
    sub_10002E948(v223);
    swift_bridgeObjectRelease();
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    swift_release_n();

    uint64_t v138 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedReviewedPlace);
    v204[115] = (uint64_t)v138;
    swift_retain_n();
    uint64_t v139 = (void *)swift_task_alloc();
    v139[2] = v133;
    v139[3] = v138;
    v139[4] = sub_10002CD0C;
    v139[5] = v133;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048470);
    sub_10002EB88();
    swift_task_dealloc();
    uint64_t v153 = v204[57];
    v204[125] = v204[56];
    v204[126] = v153;
    uint64_t v154 = *(void *)(v153 + 16);
    v204[127] = v154;
    uint64_t v155 = v204[84];
    if (v155 < 1 || !v154)
    {
LABEL_138:
      id v183 = (void *)v1[42].i64[1];
      uint64_t v184 = v1[41].i64[0];
      swift_bridgeObjectRelease();
      uint64_t v185 = swift_allocObject();
      *(void *)(v185 + 16) = sub_10002D1D4;
      *(void *)(v185 + 24) = v184;
      v1[3].i64[0] = (uint64_t)sub_10002D128;
      v1[3].i64[1] = v185;
      v1[1].i64[0] = (uint64_t)_NSConcreteStackBlock;
      v1[1].i64[1] = 1107296256;
      v1[2].i64[0] = (uint64_t)sub_100017C10;
      v1[2].i64[1] = (uint64_t)&block_descriptor_200;
      uint64_t v186 = _Block_copy(&v1[1]);
      swift_retain();
      swift_retain();
      swift_release();
      [v183 performBlockAndWait:v186];
      _Block_release(v186);
      LOBYTE(v186) = swift_isEscapingClosureAtFileLocation();
      uint64_t v13 = swift_release();
      if (v186) {
        goto LABEL_158;
      }
      uint64_t v187 = v1[63].i64[1];
      id v188 = (void *)v1[57].i64[1];
      uint64_t v189 = v1[42].i64[0];
      sub_10002ECD8(60);
      v224._object = (void *)0x8000000100032940;
      v224._uint64_t countAndFlagsBits = 0xD000000000000014;
      sub_10002E948(v224);
      swift_bridgeObjectRelease();
      v1[40].i64[0] = v187;
      v225._uint64_t countAndFlagsBits = sub_10002ED78();
      sub_10002E948(v225);
      swift_bridgeObjectRelease();
      v226._uint64_t countAndFlagsBits = 0xD000000000000015;
      v226._object = (void *)0x8000000100032960;
      sub_10002E948(v226);
      v1[40].i64[1] = v189;
      v227._uint64_t countAndFlagsBits = sub_10002ED78();
      sub_10002E948(v227);
      swift_bridgeObjectRelease();
      v228._uint64_t countAndFlagsBits = 0x71657220726F6620;
      v228._object = (void *)0xED00002074736575;
      sub_10002E948(v228);
      id v190 = [v188 description];
      uint64_t v191 = sub_10002E8F8();
      id v193 = v192;

      v229._uint64_t countAndFlagsBits = v191;
      v229._object = v193;
      sub_10002E948(v229);
      swift_bridgeObjectRelease();
      _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      swift_release_n();

      _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001DLL, 0x8000000100032F00);
      v194 = (uint64_t (*)(void))v1->i64[1];
      return v194();
    }
    uint64_t v156 = 0;
    uint64_t v157 = (unint64_t *)(v204 + 75);
    id v202 = v204 + 10;
    while (1)
    {
      unint64_t v158 = v156 + v155;
      if (__OFADD__(v156, v155)) {
        unint64_t v158 = ((v156 + v155) >> 63) ^ 0x8000000000000000;
      }
      v1[64].i64[0] = v158;
      uint64_t v159 = (int8x16_t *)swift_task_alloc();
      int8x16_t v160 = *(int8x16_t *)(v204 + 125);
      v159[1].i64[0] = v156;
      v159[1].i64[1] = v155;
      v159[2] = vextq_s8(v160, v160, 8uLL);
      __swift_instantiateConcreteTypeFromMangledName(&qword_100048478);
      sub_10002EB88();
      swift_task_dealloc();
      unint64_t v161 = v1[37].u64[0];
      v1[64].i64[1] = v161;
      v1[37].i64[1] = (uint64_t)_swiftEmptyArrayStorage;
      if (v161 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_10002ED38();
        uint64_t v162 = v13;
        if (!v13)
        {
LABEL_123:
          swift_bridgeObjectRelease();
          unint64_t v166 = (unint64_t)_swiftEmptyArrayStorage;
          goto LABEL_124;
        }
      }
      else
      {
        uint64_t v162 = *(void *)((v161 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v13 = swift_bridgeObjectRetain();
        if (!v162) {
          goto LABEL_123;
        }
      }
      if (v162 < 1) {
        goto LABEL_155;
      }
      for (uint64_t j = 0; j != v162; ++j)
      {
        if ((v161 & 0xC000000000000001) != 0) {
          id v164 = (id)sub_10002ED08();
        }
        else {
          id v164 = *(id *)(v161 + 8 * j + 32);
        }
        uint64_t v165 = v164;
        *(void *)(swift_task_alloc() + 16) = v164;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
        sub_10002EB88();

        swift_task_dealloc();
        if (v204[76])
        {
          sub_10002E988();
          if (*(void *)((*v157 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v157 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_10002E9C8();
          }
          sub_10002E9D8();
          sub_10002E9B8();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v166 = *v157;
      uint64_t v1 = (int8x16_t *)v204;
LABEL_124:
      v1[65].i64[0] = v166;
      if (v166 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v174 = sub_10002ED38();
        swift_bridgeObjectRelease();
        if (!v174)
        {
LABEL_132:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_133;
        }
      }
      else if (!*(void *)((v166 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_132;
      }
      id v167 = [self sharedService];
      v1[65].i64[1] = (uint64_t)v167;
      if (v167)
      {
        id v17 = v167;
        id v24 = [v167 defaultTraits];
        v1[66].i64[0] = (uint64_t)v24;
        if (v24) {
          goto LABEL_144;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v168 = v1[64].i64[1];
      v169 = (void *)v1[42].i64[1];
      uint64_t v170 = swift_allocObject();
      *(void *)(v170 + 16) = v168;
      *(void *)(v170 + 24) = _swiftEmptyArrayStorage;
      uint64_t v171 = swift_allocObject();
      *(void *)(v171 + 16) = sub_10002CE58;
      *(void *)(v171 + 24) = v170;
      v1[6].i64[0] = (uint64_t)sub_10002D128;
      v1[6].i64[1] = v171;
      v1[4].i64[0] = (uint64_t)_NSConcreteStackBlock;
      v1[4].i64[1] = 1107296256;
      v1[5].i64[0] = (uint64_t)sub_100017C10;
      v1[5].i64[1] = (uint64_t)&block_descriptor_189;
      int v172 = _Block_copy(v204 + 8);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      [v169 performBlockAndWait:v172];
      Swift::String v173 = v172;
      uint64_t v1 = (int8x16_t *)v204;
      _Block_release(v173);
      LOBYTE(v169) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      uint64_t v13 = swift_bridgeObjectRelease();
      if (v169) {
        goto LABEL_156;
      }
LABEL_133:
      sub_10002EB88();
      uint64_t v156 = v1[64].i64[0];
      uint64_t v175 = v1[63].i64[1];
      uint64_t v155 = v1[42].i64[0];
      BOOL v176 = v175 >= v156;
      BOOL v177 = v156 >= v175;
      if (v155 <= 0) {
        BOOL v177 = v176;
      }
      if (v177) {
        goto LABEL_138;
      }
    }
  }
  uint64_t v60 = 0;
  Swift::String v61 = (unint64_t *)(v204 + 73);
  while (1)
  {
    unint64_t v62 = v60 + v59;
    if (__OFADD__(v60, v59)) {
      unint64_t v62 = ((v60 + v59) >> 63) ^ 0x8000000000000000;
    }
    v50[51].i64[1] = v62;
    Swift::String v63 = (int8x16_t *)swift_task_alloc();
    int8x16_t v64 = *(int8x16_t *)(v204 + 99);
    v63[1].i64[0] = v60;
    v63[1].i64[1] = v59;
    v63[2] = vextq_s8(v64, v64, 8uLL);
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048468);
    sub_10002EB88();
    swift_task_dealloc();
    unint64_t v65 = v50[39].u64[1];
    v50[52].i64[0] = v65;
    v50[36].i64[1] = (uint64_t)_swiftEmptyArrayStorage;
    if (v65 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_10002ED38();
      uint64_t v66 = v13;
      if (!v13)
      {
LABEL_54:
        swift_bridgeObjectRelease();
        unint64_t v70 = (unint64_t)_swiftEmptyArrayStorage;
        goto LABEL_55;
      }
    }
    else
    {
      uint64_t v66 = *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v13 = swift_bridgeObjectRetain();
      if (!v66) {
        goto LABEL_54;
      }
    }
    if (v66 < 1) {
      break;
    }
    for (uint64_t k = 0; k != v66; ++k)
    {
      if ((v65 & 0xC000000000000001) != 0) {
        id v68 = (id)sub_10002ED08();
      }
      else {
        id v68 = *(id *)(v65 + 8 * k + 32);
      }
      uint64_t v69 = v68;
      *(void *)(swift_task_alloc() + 16) = v68;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
      sub_10002EB88();

      swift_task_dealloc();
      if (v204[58])
      {
        sub_10002E988();
        if (*(void *)((*v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10002E9C8();
        }
        sub_10002E9D8();
        sub_10002E9B8();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v70 = *v61;
    uint64_t v50 = (int8x16_t *)v204;
LABEL_55:
    v50[52].i64[1] = v70;
    if (v70 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v80 = sub_10002ED38();
      swift_bridgeObjectRelease();
      if (!v80)
      {
LABEL_63:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
    }
    else if (!*(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_63;
    }
    id v71 = [self sharedService];
    v50[53].i64[0] = (uint64_t)v71;
    if (v71)
    {
      uint64_t v72 = v71;
      id v73 = [v71 defaultTraits];
      v50[53].i64[1] = (uint64_t)v73;
      if (v73)
      {
        id v148 = v73;
        uint64_t v141 = v50 + 30;
        uint64_t v149 = v50[41].i64[0];
        [v73 setAnalyticsOptOut:1];
        sub_1000049A0(0, &qword_100048450);
        Class v150 = sub_10002E998().super.isa;
        id v151 = [v72 ticketForIdentifiers:v150 traits:v148];
        v50[54].i64[0] = (uint64_t)v151;

        uint64_t v145 = swift_task_alloc();
        v50[54].i64[1] = v145;
        *(void *)(v145 + 16) = v151;
        *(void *)(v145 + 24) = v149;
        v152 = (void *)swift_task_alloc();
        v50[55].i64[0] = (uint64_t)v152;
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
        void *v152 = v50;
        v152[1] = sub_10001F764;
        unint64_t v8 = 0xD000000000000019;
        unint64_t v9 = 0x8000000100032EE0;
        v147 = (void (*)(uint64_t))sub_10002D1D8;
        goto LABEL_145;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v74 = v50[52].i64[0];
    uint64_t v75 = (void *)v50[42].i64[1];
    uint64_t v76 = swift_allocObject();
    *(void *)(v76 + 16) = v74;
    *(void *)(v76 + 24) = _swiftEmptyArrayStorage;
    uint64_t v77 = swift_allocObject();
    *(void *)(v77 + 16) = sub_10002CC70;
    *(void *)(v77 + 24) = v76;
    v50[24].i64[0] = (uint64_t)sub_10002D128;
    v50[24].i64[1] = v77;
    v50[22].i64[0] = (uint64_t)_NSConcreteStackBlock;
    v50[22].i64[1] = 1107296256;
    v50[23].i64[0] = (uint64_t)sub_100017C10;
    v50[23].i64[1] = (uint64_t)&block_descriptor_145;
    uint64_t v78 = _Block_copy(v204 + 44);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    [v75 performBlockAndWait:v78];
    char v79 = v78;
    uint64_t v50 = (int8x16_t *)v204;
    _Block_release(v79);
    LOBYTE(v75) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    uint64_t v13 = swift_bridgeObjectRelease();
    if (v75) {
      goto LABEL_149;
    }
LABEL_64:
    sub_10002EB88();
    uint64_t v60 = v50[51].i64[1];
    uint64_t v81 = v50[50].i64[1];
    uint64_t v59 = v50[42].i64[0];
    BOOL v82 = v81 >= v60;
    BOOL v83 = v60 >= v81;
    if (v59 <= 0) {
      BOOL v83 = v82;
    }
    if (v83) {
      goto LABEL_67;
    }
  }
  __break(1u);
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
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v13, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_10001D188()
{
  *(void *)(*(void *)v1 + 784) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10001F684;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10001D2A4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001D2A4()
{
  uint64_t v1 = (int8x16_t *)v0;
  id v203 = (int8x16_t *)(v0 + 792);
  v195 = (void *)(v0 + 16);
  uint64_t v197 = (void *)(v0 + 112);
  char v198 = (void *)(v0 + 64);
  uint64_t aBlock = (void *)(v0 + 208);
  id v199 = (void *)(v0 + 256);
  uint64_t v200 = (void *)(v0 + 160);
  v201 = (void *)(v0 + 304);
  id v202 = (void *)(v0 + 352);
  uint64_t v196 = v0 + 488;
  Swift::String v207 = (unint64_t *)(v0 + 528);
  uint64_t v2 = (unint64_t *)(v0 + 560);
  Swift::String v208 = (unint64_t *)(v0 + 584);
  uint64_t v3 = *(void **)(v0 + 752);
  uint64_t v205 = (unint64_t *)(v0 + 600);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(v0 + 488);
  uint64_t v5 = v1[49].i64[0];
  uint64_t v6 = &off_100045000;
  Swift::String v209 = v1;
LABEL_2:
  uint64_t v7 = v1[45].i64[1];
  Swift::String v206 = (void *)v1[42].i64[1];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v4;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10002CB58;
  *(void *)(v9 + 24) = v8;
  v1[15].i64[0] = (uint64_t)sub_10002D128;
  v1[15].i64[1] = v9;
  v1[13].i64[0] = (uint64_t)_NSConcreteStackBlock;
  v1[13].i64[1] = 1107296256;
  v1[14].i64[0] = (uint64_t)sub_100017C10;
  v1[14].i64[1] = (uint64_t)&block_descriptor_125;
  uint64_t v10 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v206, v6[143], v10);
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  uint64_t v12 = swift_bridgeObjectRelease();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
    goto LABEL_152;
  }
  sub_10002EB88();
  if (v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v39 = (void *)v1[41].i64[1];
    swift_release_n();

    id v188 = (uint64_t (*)(void))v1->i64[1];
LABEL_141:
    return v188();
  }
  while (1)
  {
    uint64_t v20 = v1[45].i64[0];
    uint64_t v21 = v1[44].i64[0];
    uint64_t v22 = v1[42].i64[0];
    BOOL v23 = v21 >= v20;
    BOOL v24 = v20 >= v21;
    if (v22 <= 0) {
      BOOL v24 = v23;
    }
    if (v24) {
      break;
    }
    unint64_t v25 = v20 + v22;
    if (__OFADD__(v20, v22)) {
      unint64_t v25 = ((v20 + v22) >> 63) ^ 0x8000000000000000;
    }
    v1[45].i64[0] = v25;
    id v26 = (int8x16_t *)swift_task_alloc();
    int8x16_t v27 = v1[43];
    v26[1].i64[0] = v20;
    v26[1].i64[1] = v22;
    v26[2] = vextq_s8(v27, v27, 8uLL);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1000482F8);
    uint64_t v5 = 0;
    sub_10002EB88();
    swift_task_dealloc();
    unint64_t v28 = v1[38].u64[1];
    v1[45].i64[1] = v28;
    v1[35].i64[0] = (uint64_t)_swiftEmptyArrayStorage;
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      id v30 = (id)sub_10002ED38();
      uint64_t v29 = (uint64_t)v30;
      if (!v30)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        unint64_t v34 = (unint64_t)_swiftEmptyArrayStorage;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v30 = (id)swift_bridgeObjectRetain();
      if (!v29) {
        goto LABEL_23;
      }
    }
    if (v29 < 1)
    {
      __break(1u);
LABEL_140:
      id v183 = v30;
      uint64_t v135 = (int8x16_t *)((char *)v209 + 552);
      uint64_t v184 = v209[41].i64[0];
      objc_msgSend(v30, "setAnalyticsOptOut:", 1, v195);
      sub_1000049A0(0, &qword_100048450);
      Class isa = sub_10002E998().super.isa;
      id v186 = [(id)v29 ticketForIdentifiers:isa traits:v183];
      v209[60].i64[1] = (uint64_t)v186;

      uint64_t v139 = swift_task_alloc();
      v209[61].i64[0] = v139;
      *(void *)(v139 + 16) = v186;
      *(void *)(v139 + 24) = v184;
      uint64_t v187 = (void *)swift_task_alloc();
      v209[61].i64[1] = (uint64_t)v187;
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
      *uint64_t v187 = v209;
      v187[1] = sub_100021440;
      unint64_t v15 = v28 + 5;
      unint64_t v16 = 0x8000000100032EE0;
      goto LABEL_145;
    }
    for (uint64_t i = 0; i != v29; ++i)
    {
      if ((v28 & 0xC000000000000001) != 0) {
        id v32 = (id)sub_10002ED08();
      }
      else {
        id v32 = *(id *)(v28 + 8 * i + 32);
      }
      id v33 = v32;
      *(void *)(swift_task_alloc() + 16) = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
      sub_10002EB88();

      swift_task_dealloc();
      if (v209[34].i64[0])
      {
        sub_10002E988();
        if (*(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10002E9C8();
        }
        sub_10002E9D8();
        sub_10002E9B8();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v34 = *v2;
    uint64_t v1 = v209;
LABEL_24:
    v1[46].i64[0] = v34;
    if (v34 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_10002ED38();
      swift_bridgeObjectRelease();
      if (!v35) {
        goto LABEL_26;
      }
LABEL_28:
      id v36 = objc_msgSend(self, "sharedService", v195);
      v1[46].i64[1] = (uint64_t)v36;
      if (v36)
      {
        long long v37 = v36;
        id v38 = [v36 defaultTraits];
        v1[47].i64[0] = (uint64_t)v38;
        if (v38)
        {
          id v178 = v38;
          uint64_t v179 = v1[41].i64[0];
          [v38 setAnalyticsOptOut:1];
          sub_1000049A0(0, &qword_100048450);
          Class v180 = sub_10002E998().super.isa;
          id v181 = [v37 ticketForIdentifiers:v180 traits:v178];
          v1[47].i64[1] = (uint64_t)v181;

          uint64_t v139 = swift_task_alloc();
          v1[48].i64[0] = v139;
          *(void *)(v139 + 16) = v181;
          *(void *)(v139 + 24) = v179;
          uint64_t v182 = (void *)swift_task_alloc();
          v1[48].i64[1] = (uint64_t)v182;
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
          *uint64_t v182 = v1;
          v182[1] = sub_10001D188;
          unint64_t v15 = 0xD000000000000019;
          unint64_t v16 = 0x8000000100032EE0;
          id v17 = sub_10002CB88;
          uint64_t v12 = v196;
          goto LABEL_146;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v4 = _swiftEmptyArrayStorage;
      uint64_t v6 = &off_100045000;
      goto LABEL_2;
    }
    if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_28;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10002EB88();
  }
  BOOL v40 = (void *)v1[42].i64[1];
  uint64_t v41 = v1[41].i64[0];
  swift_bridgeObjectRelease();
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = sub_10002D1D4;
  *(void *)(v42 + 24) = v41;
  v1[21].i64[0] = (uint64_t)sub_10002D128;
  v1[21].i64[1] = v42;
  v1[19].i64[0] = (uint64_t)_NSConcreteStackBlock;
  v1[19].i64[1] = 1107296256;
  v1[20].i64[0] = (uint64_t)sub_100017C10;
  v1[20].i64[1] = (uint64_t)&block_descriptor_135;
  uint64_t v43 = _Block_copy(v201);
  uint64_t v44 = (uint64_t *)v1;
  swift_retain();
  swift_retain();
  swift_release();
  [v40 performBlockAndWait:v43];
  _Block_release(v43);
  LOBYTE(v40) = swift_isEscapingClosureAtFileLocation();
  uint64_t v12 = swift_release();
  if (v40)
  {
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
    goto LABEL_159;
  }
  uint64_t v45 = v1[44].i64[0];
  uint64_t v46 = v44[84];
  uint64_t v47 = (void *)v44[83];
  uint64_t v48 = v44[82];
  sub_10002ECD8(60);
  v211._object = (void *)0x8000000100032940;
  v211._uint64_t countAndFlagsBits = 0xD000000000000014;
  sub_10002E948(v211);
  swift_bridgeObjectRelease();
  v44[59] = v45;
  v212._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v212);
  swift_bridgeObjectRelease();
  v213._uint64_t countAndFlagsBits = 0xD000000000000015;
  v213._object = (void *)0x8000000100032960;
  sub_10002E948(v213);
  v44[64] = v46;
  v214._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v214);
  swift_bridgeObjectRelease();
  v215._uint64_t countAndFlagsBits = 0x71657220726F6620;
  v215._object = (void *)0xED00002074736575;
  sub_10002E948(v215);
  id v49 = [v47 description];
  uint64_t v50 = sub_10002E8F8();
  uint64_t v52 = v51;

  v216._uint64_t countAndFlagsBits = v50;
  v216._object = v52;
  sub_10002E948(v216);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  swift_release_n();

  int64_t v53 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedHistoryPlaceItem);
  v44[89] = (uint64_t)v53;
  swift_retain_n();
  uint64_t v54 = (void *)swift_task_alloc();
  v54[2] = v48;
  v54[3] = v53;
  v54[4] = sub_10002CBA0;
  v54[5] = v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100048460);
  sub_10002EB88();
  Swift::String v55 = (int8x16_t *)v44;
  swift_task_dealloc();
  uint64_t v56 = v44[53];
  v44[99] = v44[52];
  v44[100] = v56;
  uint64_t v57 = *(void *)(v56 + 16);
  v44[101] = v57;
  uint64_t v58 = v44[84];
  if (v58 >= 1 && v57)
  {
    uint64_t v59 = 0;
    do
    {
      unint64_t v60 = v59 + v58;
      if (__OFADD__(v59, v58)) {
        unint64_t v60 = ((v59 + v58) >> 63) ^ 0x8000000000000000;
      }
      v55[51].i64[1] = v60;
      Swift::String v61 = (int8x16_t *)swift_task_alloc();
      int8x16_t v62 = *v203;
      v61[1].i64[0] = v59;
      v61[1].i64[1] = v58;
      v61[2] = vextq_s8(v62, v62, 8uLL);
      __swift_instantiateConcreteTypeFromMangledName(&qword_100048468);
      sub_10002EB88();
      swift_task_dealloc();
      unint64_t v63 = v55[39].u64[1];
      v55[52].i64[0] = v63;
      v55[36].i64[1] = (uint64_t)_swiftEmptyArrayStorage;
      if (v63 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = sub_10002ED38();
        uint64_t v64 = v12;
        if (!v12)
        {
LABEL_53:
          swift_bridgeObjectRelease();
          unint64_t v68 = (unint64_t)_swiftEmptyArrayStorage;
          goto LABEL_54;
        }
      }
      else
      {
        uint64_t v64 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v12 = swift_bridgeObjectRetain();
        if (!v64) {
          goto LABEL_53;
        }
      }
      if (v64 < 1) {
        goto LABEL_150;
      }
      for (uint64_t j = 0; j != v64; ++j)
      {
        if ((v63 & 0xC000000000000001) != 0) {
          id v66 = (id)sub_10002ED08();
        }
        else {
          id v66 = *(id *)(v63 + 8 * j + 32);
        }
        uint64_t v67 = v66;
        *(void *)(swift_task_alloc() + 16) = v66;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
        sub_10002EB88();

        swift_task_dealloc();
        if (v209[29].i64[0])
        {
          sub_10002E988();
          if (*(void *)((*v208 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v208 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_10002E9C8();
          }
          sub_10002E9D8();
          sub_10002E9B8();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v68 = *v208;
      Swift::String v55 = v209;
LABEL_54:
      v55[52].i64[1] = v68;
      if (v68 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v77 = sub_10002ED38();
        swift_bridgeObjectRelease();
        if (!v77)
        {
LABEL_62:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_63;
        }
      }
      else if (!*(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_62;
      }
      id v69 = objc_msgSend(self, "sharedService", v195);
      v55[53].i64[0] = (uint64_t)v69;
      if (v69)
      {
        unint64_t v70 = v69;
        id v71 = [v69 defaultTraits];
        v55[53].i64[1] = (uint64_t)v71;
        if (v71)
        {
          id v134 = v71;
          uint64_t v135 = v55 + 30;
          uint64_t v136 = v55[41].i64[0];
          [v71 setAnalyticsOptOut:1];
          sub_1000049A0(0, &qword_100048450);
          Class v137 = sub_10002E998().super.isa;
          id v138 = [v70 ticketForIdentifiers:v137 traits:v134];
          v55[54].i64[0] = (uint64_t)v138;

          uint64_t v139 = swift_task_alloc();
          v55[54].i64[1] = v139;
          *(void *)(v139 + 16) = v138;
          *(void *)(v139 + 24) = v136;
          id v140 = (void *)swift_task_alloc();
          v55[55].i64[0] = (uint64_t)v140;
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
          *id v140 = v55;
          v140[1] = sub_10001F764;
          unint64_t v15 = 0xD000000000000019;
          unint64_t v16 = 0x8000000100032EE0;
          goto LABEL_145;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v72 = v55[52].i64[0];
      id v73 = (void *)v55[42].i64[1];
      uint64_t v74 = swift_allocObject();
      *(void *)(v74 + 16) = v72;
      *(void *)(v74 + 24) = _swiftEmptyArrayStorage;
      uint64_t v75 = swift_allocObject();
      *(void *)(v75 + 16) = sub_10002CC70;
      *(void *)(v75 + 24) = v74;
      v209[24].i64[0] = (uint64_t)sub_10002D128;
      v209[24].i64[1] = v75;
      v209[22].i64[0] = (uint64_t)_NSConcreteStackBlock;
      v209[22].i64[1] = 1107296256;
      v209[23].i64[0] = (uint64_t)sub_100017C10;
      v209[23].i64[1] = (uint64_t)&block_descriptor_145;
      uint64_t v76 = _Block_copy(v202);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      [v73 performBlockAndWait:v76];
      _Block_release(v76);
      LOBYTE(v73) = swift_isEscapingClosureAtFileLocation();
      Swift::String v55 = v209;
      swift_release();
      swift_release();
      uint64_t v12 = swift_bridgeObjectRelease();
      if (v73) {
        goto LABEL_151;
      }
LABEL_63:
      sub_10002EB88();
      uint64_t v59 = v55[51].i64[1];
      uint64_t v78 = v55[50].i64[1];
      uint64_t v58 = v55[42].i64[0];
      BOOL v79 = v78 >= v59;
      BOOL v80 = v59 >= v78;
      if (v58 <= 0) {
        BOOL v80 = v79;
      }
    }
    while (!v80);
  }
  uint64_t v81 = (void *)v55[42].i64[1];
  uint64_t v82 = v55[41].i64[0];
  swift_bridgeObjectRelease();
  uint64_t v83 = swift_allocObject();
  *(void *)(v83 + 16) = sub_10002D1D4;
  *(void *)(v83 + 24) = v82;
  v55[18].i64[0] = (uint64_t)sub_10002D128;
  v55[18].i64[1] = v83;
  v55[16].i64[0] = (uint64_t)_NSConcreteStackBlock;
  v55[16].i64[1] = 1107296256;
  v55[17].i64[0] = (uint64_t)sub_100017C10;
  v55[17].i64[1] = (uint64_t)&block_descriptor_156;
  uint64_t v84 = _Block_copy(v199);
  uint64_t v85 = v55;
  swift_retain();
  swift_retain();
  swift_release();
  [v81 performBlockAndWait:v84];
  _Block_release(v84);
  LOBYTE(v81) = swift_isEscapingClosureAtFileLocation();
  uint64_t v12 = swift_release();
  if (v81) {
    goto LABEL_155;
  }
  uint64_t v86 = v55[50].i64[1];
  unsigned int v87 = (void *)v55[44].i64[1];
  uint64_t v88 = v55[42].i64[0];
  uint64_t v89 = v55[41].i64[0];
  sub_10002ECD8(60);
  v217._object = (void *)0x8000000100032940;
  v217._uint64_t countAndFlagsBits = 0xD000000000000014;
  sub_10002E948(v217);
  swift_bridgeObjectRelease();
  v85[31].i64[0] = v86;
  v218._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v218);
  swift_bridgeObjectRelease();
  v219._uint64_t countAndFlagsBits = 0xD000000000000015;
  v219._object = (void *)0x8000000100032960;
  sub_10002E948(v219);
  v85[31].i64[1] = v88;
  v220._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v220);
  swift_bridgeObjectRelease();
  v221._uint64_t countAndFlagsBits = 0x71657220726F6620;
  v221._object = (void *)0xED00002074736575;
  sub_10002E948(v221);
  id v90 = [v87 description];
  uint64_t v91 = sub_10002E8F8();
  id v93 = v92;

  v222._uint64_t countAndFlagsBits = v91;
  v222._object = v93;
  sub_10002E948(v222);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  swift_release_n();

  uint64_t v94 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedFavoriteItem);
  v85[51].i64[0] = (uint64_t)v94;
  swift_retain_n();
  uint64_t v95 = (void *)swift_task_alloc();
  v95[2] = v89;
  v95[3] = v94;
  v95[4] = sub_10002CC98;
  v95[5] = v89;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100048300);
  sub_10002EB88();
  swift_task_dealloc();
  uint64_t v96 = v85[25].i64[1];
  v85[56].i64[0] = v85[25].i64[0];
  v85[56].i64[1] = v96;
  uint64_t v97 = *(void *)(v96 + 16);
  v85[57].i64[0] = v97;
  uint64_t v98 = v85[42].i64[0];
  if (v98 >= 1)
  {
    unint64_t v28 = 0xD000000000000014;
    if (v97)
    {
      uint64_t v99 = 0;
      uint64_t v100 = v85;
      while (1)
      {
        unint64_t v101 = v99 + v98;
        if (__OFADD__(v99, v98)) {
          unint64_t v101 = ((v99 + v98) >> 63) ^ 0x8000000000000000;
        }
        v100[58].i64[0] = v101;
        uint64_t v102 = (int8x16_t *)swift_task_alloc();
        int8x16_t v103 = v100[56];
        v102[1].i64[0] = v99;
        v102[1].i64[1] = v98;
        v102[2] = vextq_s8(v103, v103, 8uLL);
        __swift_instantiateConcreteTypeFromMangledName(&qword_100048308);
        sub_10002EB88();
        swift_task_dealloc();
        unint64_t v104 = v100[32].u64[1];
        v100[58].i64[1] = v104;
        v100[33].i64[0] = (uint64_t)_swiftEmptyArrayStorage;
        if (v104 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v12 = sub_10002ED38();
          uint64_t v105 = v12;
          if (!v12)
          {
LABEL_86:
            swift_bridgeObjectRelease();
            unint64_t v109 = (unint64_t)_swiftEmptyArrayStorage;
            goto LABEL_87;
          }
        }
        else
        {
          uint64_t v105 = *(void *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v12 = swift_bridgeObjectRetain();
          if (!v105) {
            goto LABEL_86;
          }
        }
        if (v105 < 1) {
          goto LABEL_153;
        }
        for (uint64_t k = 0; k != v105; ++k)
        {
          if ((v104 & 0xC000000000000001) != 0) {
            id v107 = (id)sub_10002ED08();
          }
          else {
            id v107 = *(id *)(v104 + 8 * k + 32);
          }
          uint64_t v108 = v107;
          *(void *)(swift_task_alloc() + 16) = v107;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
          sub_10002EB88();

          swift_task_dealloc();
          if (v209[33].i64[1])
          {
            sub_10002E988();
            if (*(void *)((*v207 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v207 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_10002E9C8();
            }
            sub_10002E9D8();
            sub_10002E9B8();
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v109 = *v207;
        unint64_t v28 = 0xD000000000000014;
LABEL_87:
        v209[59].i64[0] = v109;
        if (v109 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v116 = sub_10002ED38();
          swift_bridgeObjectRelease();
          if (v116)
          {
LABEL_89:
            id v110 = [self sharedService];
            uint64_t v100 = v209;
            v209[59].i64[1] = (uint64_t)v110;
            if (v110)
            {
              uint64_t v29 = (uint64_t)v110;
              id v30 = [v110 defaultTraits];
              v209[60].i64[0] = (uint64_t)v30;
              if (v30) {
                goto LABEL_140;
              }

              uint64_t v100 = v209;
            }
            swift_bridgeObjectRelease();
            uint64_t v111 = v100[58].i64[1];
            unint64_t v112 = (void *)v100[42].i64[1];
            uint64_t v113 = swift_allocObject();
            *(void *)(v113 + 16) = v111;
            *(void *)(v113 + 24) = _swiftEmptyArrayStorage;
            uint64_t v114 = swift_allocObject();
            *(void *)(v114 + 16) = sub_10002CCCC;
            *(void *)(v114 + 24) = v113;
            v100[12].i64[0] = (uint64_t)sub_10002D128;
            v100[12].i64[1] = v114;
            v100[10].i64[0] = (uint64_t)_NSConcreteStackBlock;
            v100[10].i64[1] = 1107296256;
            v100[11].i64[0] = (uint64_t)sub_100017C10;
            v100[11].i64[1] = (uint64_t)&block_descriptor_168;
            id v115 = _Block_copy(v200);
            swift_bridgeObjectRetain();
            swift_retain();
            swift_release();
            [v112 performBlockAndWait:v115];
            _Block_release(v115);
            LOBYTE(v112) = swift_isEscapingClosureAtFileLocation();
            swift_release();
            swift_release();
            uint64_t v12 = swift_bridgeObjectRelease();
            if (v112) {
              goto LABEL_154;
            }
            goto LABEL_96;
          }
        }
        else if (*(void *)((v109 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          goto LABEL_89;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v100 = v209;
LABEL_96:
        sub_10002EB88();
        uint64_t v99 = v100[58].i64[0];
        uint64_t v117 = v100[57].i64[0];
        uint64_t v98 = v100[42].i64[0];
        BOOL v118 = v117 >= v99;
        BOOL v119 = v99 >= v117;
        if (v98 <= 0) {
          BOOL v119 = v118;
        }
        unint64_t v28 = 0xD000000000000014;
        if (v119)
        {
          uint64_t v85 = v100;
          break;
        }
      }
    }
  }
  uint64_t v120 = (void *)v85[42].i64[1];
  uint64_t v121 = v85[41].i64[0];
  swift_bridgeObjectRelease();
  uint64_t v122 = swift_allocObject();
  *(void *)(v122 + 16) = sub_10002D1D4;
  *(void *)(v122 + 24) = v121;
  v85[9].i64[0] = (uint64_t)sub_10002D128;
  v85[9].i64[1] = v122;
  v85[7].i64[0] = (uint64_t)_NSConcreteStackBlock;
  v85[7].i64[1] = 1107296256;
  v85[8].i64[0] = (uint64_t)sub_100017C10;
  v85[8].i64[1] = (uint64_t)&block_descriptor_179;
  uint64_t v123 = _Block_copy(v197);
  swift_retain();
  swift_retain();
  swift_release();
  [v120 performBlockAndWait:v123];
  _Block_release(v123);
  LOBYTE(v120) = swift_isEscapingClosureAtFileLocation();
  uint64_t v12 = swift_release();
  if (v120) {
    goto LABEL_158;
  }
  uint64_t v124 = v85[57].i64[0];
  BOOL v125 = (void *)v85[51].i64[0];
  uint64_t v126 = v85[42].i64[0];
  uint64_t v127 = v85[41].i64[0];
  sub_10002ECD8(60);
  v223._object = (void *)0x8000000100032940;
  v223._uint64_t countAndFlagsBits = 0xD000000000000014;
  sub_10002E948(v223);
  swift_bridgeObjectRelease();
  v85[35].i64[1] = v124;
  v224._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v224);
  swift_bridgeObjectRelease();
  v225._uint64_t countAndFlagsBits = 0xD000000000000015;
  v225._object = (void *)0x8000000100032960;
  sub_10002E948(v225);
  v85[36].i64[0] = v126;
  v226._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v226);
  swift_bridgeObjectRelease();
  v227._uint64_t countAndFlagsBits = 0x71657220726F6620;
  v227._object = (void *)0xED00002074736575;
  sub_10002E948(v227);
  id v128 = [v125 description];
  uint64_t v129 = sub_10002E8F8();
  v131 = v130;

  v228._uint64_t countAndFlagsBits = v129;
  v228._object = v131;
  sub_10002E948(v228);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  swift_release_n();

  uint64_t v132 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedReviewedPlace);
  v85[57].i64[1] = (uint64_t)v132;
  swift_retain_n();
  uint64_t v133 = (void *)swift_task_alloc();
  v133[2] = v127;
  v133[3] = v132;
  v133[4] = sub_10002CD0C;
  v133[5] = v127;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100048470);
  sub_10002EB88();
  swift_task_dealloc();
  uint64_t v141 = v85[28].i64[1];
  v85[62].i64[1] = v85[28].i64[0];
  v85[63].i64[0] = v141;
  uint64_t v142 = *(void *)(v141 + 16);
  v85[63].i64[1] = v142;
  uint64_t v143 = v85[42].i64[0];
  if (v143 < 1 || !v142)
  {
LABEL_136:
    id v167 = (void *)v85[42].i64[1];
    uint64_t v168 = v85[41].i64[0];
    swift_bridgeObjectRelease();
    uint64_t v169 = swift_allocObject();
    *(void *)(v169 + 16) = sub_10002D1D4;
    *(void *)(v169 + 24) = v168;
    v85[3].i64[0] = (uint64_t)sub_10002D128;
    v85[3].i64[1] = v169;
    v85[1].i64[0] = (uint64_t)_NSConcreteStackBlock;
    v85[1].i64[1] = 1107296256;
    v85[2].i64[0] = (uint64_t)sub_100017C10;
    v85[2].i64[1] = (uint64_t)&block_descriptor_200;
    uint64_t v170 = _Block_copy(v195);
    swift_retain();
    swift_retain();
    swift_release();
    [v167 performBlockAndWait:v170];
    _Block_release(v170);
    LOBYTE(v168) = swift_isEscapingClosureAtFileLocation();
    uint64_t v12 = swift_release();
    if ((v168 & 1) == 0)
    {
      uint64_t v171 = v85[63].i64[1];
      int v172 = (void *)v85[57].i64[1];
      uint64_t v173 = v85[42].i64[0];
      sub_10002ECD8(60);
      v229._object = (void *)0x8000000100032940;
      v229._uint64_t countAndFlagsBits = 0xD000000000000014;
      sub_10002E948(v229);
      swift_bridgeObjectRelease();
      v85[40].i64[0] = v171;
      v230._uint64_t countAndFlagsBits = sub_10002ED78();
      sub_10002E948(v230);
      swift_bridgeObjectRelease();
      v231._uint64_t countAndFlagsBits = 0xD000000000000015;
      v231._object = (void *)0x8000000100032960;
      sub_10002E948(v231);
      v85[40].i64[1] = v173;
      v232._uint64_t countAndFlagsBits = sub_10002ED78();
      sub_10002E948(v232);
      swift_bridgeObjectRelease();
      v233._uint64_t countAndFlagsBits = 0x71657220726F6620;
      v233._object = (void *)0xED00002074736575;
      sub_10002E948(v233);
      id v174 = [v172 description];
      uint64_t v175 = sub_10002E8F8();
      BOOL v177 = v176;

      v234._uint64_t countAndFlagsBits = v175;
      v234._object = v177;
      sub_10002E948(v234);
      swift_bridgeObjectRelease();
      _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      swift_release_n();

      _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001DLL, 0x8000000100032F00);
      id v188 = (uint64_t (*)(void))v85->i64[1];
      goto LABEL_141;
    }
LABEL_159:
    __break(1u);
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  uint64_t v144 = 0;
  uint64_t v145 = v85;
  while (1)
  {
    unint64_t v146 = v144 + v143;
    if (__OFADD__(v144, v143)) {
      unint64_t v146 = ((v144 + v143) >> 63) ^ 0x8000000000000000;
    }
    v145[64].i64[0] = v146;
    v147 = (int8x16_t *)swift_task_alloc();
    int8x16_t v148 = v203[13];
    v147[1].i64[0] = v144;
    v147[1].i64[1] = v143;
    v147[2] = vextq_s8(v148, v148, 8uLL);
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048478);
    sub_10002EB88();
    swift_task_dealloc();
    unint64_t v149 = v145[37].u64[0];
    v145[64].i64[1] = v149;
    v145[37].i64[1] = (uint64_t)_swiftEmptyArrayStorage;
    if (v149 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_10002ED38();
      uint64_t v150 = v12;
      if (!v12)
      {
LABEL_122:
        swift_bridgeObjectRelease();
        unint64_t v154 = (unint64_t)_swiftEmptyArrayStorage;
        goto LABEL_123;
      }
    }
    else
    {
      uint64_t v150 = *(void *)((v149 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v12 = swift_bridgeObjectRetain();
      if (!v150) {
        goto LABEL_122;
      }
    }
    if (v150 < 1) {
      goto LABEL_156;
    }
    for (uint64_t m = 0; m != v150; ++m)
    {
      if ((v149 & 0xC000000000000001) != 0) {
        id v152 = (id)sub_10002ED08();
      }
      else {
        id v152 = *(id *)(v149 + 8 * m + 32);
      }
      uint64_t v153 = v152;
      *(void *)(swift_task_alloc() + 16) = v152;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
      sub_10002EB88();

      swift_task_dealloc();
      if (v209[38].i64[0])
      {
        sub_10002E988();
        if (*(void *)((*v205 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v205 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10002E9C8();
        }
        sub_10002E9D8();
        sub_10002E9B8();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v154 = *v205;
LABEL_123:
    v209[65].i64[0] = v154;
    if (v154 >> 62) {
      break;
    }
    if (*(void *)((v154 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_125;
    }
LABEL_131:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v145 = v209;
LABEL_132:
    sub_10002EB88();
    uint64_t v144 = v145[64].i64[0];
    uint64_t v164 = v145[63].i64[1];
    uint64_t v143 = v145[42].i64[0];
    BOOL v165 = v164 >= v144;
    BOOL v166 = v144 >= v164;
    if (v143 <= 0) {
      BOOL v166 = v165;
    }
    if (v166)
    {
      uint64_t v85 = v145;
      goto LABEL_136;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v163 = sub_10002ED38();
  swift_bridgeObjectRelease();
  if (!v163) {
    goto LABEL_131;
  }
LABEL_125:
  id v155 = [self sharedService];
  uint64_t v145 = v209;
  v209[65].i64[1] = (uint64_t)v155;
  if (!v155) {
    goto LABEL_128;
  }
  uint64_t v156 = v155;
  id v157 = [v155 defaultTraits];
  v209[66].i64[0] = (uint64_t)v157;
  if (!v157)
  {

    uint64_t v145 = v209;
LABEL_128:
    swift_bridgeObjectRelease();
    uint64_t v158 = v145[64].i64[1];
    uint64_t v159 = (void *)v145[42].i64[1];
    uint64_t v160 = swift_allocObject();
    *(void *)(v160 + 16) = v158;
    *(void *)(v160 + 24) = _swiftEmptyArrayStorage;
    uint64_t v161 = swift_allocObject();
    *(void *)(v161 + 16) = sub_10002CE58;
    *(void *)(v161 + 24) = v160;
    v145[6].i64[0] = (uint64_t)sub_10002D128;
    v145[6].i64[1] = v161;
    v145[4].i64[0] = (uint64_t)_NSConcreteStackBlock;
    v145[4].i64[1] = 1107296256;
    v145[5].i64[0] = (uint64_t)sub_100017C10;
    v145[5].i64[1] = (uint64_t)&block_descriptor_189;
    uint64_t v162 = _Block_copy(v198);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    [v159 performBlockAndWait:v162];
    _Block_release(v162);
    LOBYTE(v159) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    uint64_t v12 = swift_bridgeObjectRelease();
    if (v159) {
      goto LABEL_157;
    }
    goto LABEL_132;
  }
  id v190 = v157;
  uint64_t v135 = v209 + 39;
  uint64_t v191 = v209[41].i64[0];
  [v157 setAnalyticsOptOut:1];
  sub_1000049A0(0, &qword_100048450);
  Class v192 = sub_10002E998().super.isa;
  id v193 = [v156 ticketForIdentifiers:v192 traits:v190];
  v209[66].i64[1] = (uint64_t)v193;

  uint64_t v139 = swift_task_alloc();
  v209[67].i64[0] = v139;
  *(void *)(v139 + 16) = v193;
  *(void *)(v139 + 24) = v191;
  v194 = (void *)swift_task_alloc();
  v209[67].i64[1] = (uint64_t)v194;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
  void *v194 = v209;
  v194[1] = sub_1000228B4;
  unint64_t v15 = 0xD000000000000019;
  unint64_t v16 = 0x8000000100032EE0;
LABEL_145:
  id v17 = (void (*)(uint64_t))sub_10002D1D8;
  uint64_t v12 = (uint64_t)v135;
LABEL_146:
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v18 = v139;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v12, v13, v14, v15, v16, v17, v18, v19);
}

uint64_t sub_10001F684()
{
  uint64_t v1 = *(void **)(v0 + 752);

  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(v0 + 664);
  swift_release_n();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001F764()
{
  *(void *)(*(void *)v1 + 888) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100021360;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10001F880;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001F880()
{
  uint64_t v158 = (int8x16_t *)(v0 + 99);
  unint64_t v149 = v0 + 2;
  uint64_t v150 = v0 + 14;
  id v151 = v0 + 8;
  uint64_t aBlock = v0 + 32;
  unint64_t v154 = v0 + 20;
  uint64_t v1 = v0 + 44;
  uint64_t v148 = (uint64_t)(v0 + 60);
  uint64_t v159 = v0 + 66;
  uint64_t v2 = (void *)v0[107];
  uint64_t v3 = v0 + 73;
  uint64_t v156 = v0 + 75;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)v0[60];
  uint64_t v5 = v0[111];
  uint64_t v6 = &off_100045000;
  uint64_t v160 = v0;
  id v152 = v0 + 44;
  id v157 = v0 + 46;
LABEL_2:
  uint64_t v7 = v0[104];
  id v155 = (id)v0[85];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v4;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10002CC70;
  *(void *)(v9 + 24) = v8;
  v0[48] = sub_10002D128;
  v0[49] = v9;
  v0[44] = _NSConcreteStackBlock;
  v0[45] = 1107296256;
  v0[46] = sub_100017C10;
  v0[47] = &block_descriptor_145;
  uint64_t v10 = _Block_copy(v1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v155, v6[143], v10);
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  uint64_t v12 = swift_bridgeObjectRelease();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  sub_10002EB88();
  if (v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v41 = (void *)v0[89];
    swift_release_n();

    uint64_t v136 = (uint64_t (*)(void))v0[1];
LABEL_103:
    return v136();
  }
  uint64_t v20 = v157;
  uint64_t v21 = &unk_10003E0A8;
  while (1)
  {
    uint64_t v22 = v0[103];
    uint64_t v23 = v0[101];
    BOOL v24 = (void *)v0[84];
    BOOL v25 = v23 >= v22;
    BOOL v26 = v22 >= v23;
    if ((uint64_t)v24 <= 0) {
      BOOL v26 = v25;
    }
    if (v26)
    {
      uint64_t v42 = (void *)v0[85];
      uint64_t v43 = v0[82];
      swift_bridgeObjectRelease();
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = sub_10002D1D4;
      *(void *)(v44 + 24) = v43;
      v0[36] = sub_10002D128;
      v0[37] = v44;
      v0[32] = _NSConcreteStackBlock;
      v0[33] = 1107296256;
      v0[34] = sub_100017C10;
      v0[35] = &block_descriptor_156;
      uint64_t v45 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      [v42 performBlockAndWait:v45];
      _Block_release(v45);
      LOBYTE(v42) = swift_isEscapingClosureAtFileLocation();
      uint64_t v12 = swift_release();
      if ((v42 & 1) == 0)
      {
        uint64_t v46 = v0[101];
        uint64_t v47 = (void *)v0[89];
        uint64_t v48 = v0[84];
        uint64_t v49 = v0[82];
        sub_10002ECD8(60);
        v162._object = (void *)0x8000000100032940;
        v162._uint64_t countAndFlagsBits = 0xD000000000000014;
        sub_10002E948(v162);
        swift_bridgeObjectRelease();
        v0[62] = v46;
        v163._uint64_t countAndFlagsBits = sub_10002ED78();
        sub_10002E948(v163);
        swift_bridgeObjectRelease();
        v164._uint64_t countAndFlagsBits = 0xD000000000000015;
        v164._object = (void *)0x8000000100032960;
        sub_10002E948(v164);
        v0[63] = v48;
        v165._uint64_t countAndFlagsBits = sub_10002ED78();
        sub_10002E948(v165);
        swift_bridgeObjectRelease();
        v166._uint64_t countAndFlagsBits = 0x71657220726F6620;
        v166._object = (void *)0xED00002074736575;
        sub_10002E948(v166);
        id v50 = [v47 description];
        uint64_t v51 = sub_10002E8F8();
        int64_t v53 = v52;

        v167._uint64_t countAndFlagsBits = v51;
        v167._object = v53;
        sub_10002E948(v167);
        swift_bridgeObjectRelease();
        _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
        swift_bridgeObjectRelease();
        swift_release_n();

        uint64_t v54 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedFavoriteItem);
        v0[102] = v54;
        swift_retain_n();
        Swift::String v55 = (void *)swift_task_alloc();
        v55[2] = v49;
        v55[3] = v54;
        v55[4] = sub_10002CC98;
        v55[5] = v49;
        __swift_instantiateConcreteTypeFromMangledName(&qword_100048300);
        sub_10002EB88();
        swift_task_dealloc();
        uint64_t v56 = v0[51];
        v0[112] = v0[50];
        v0[113] = v56;
        uint64_t v57 = *(void *)(v56 + 16);
        v0[114] = v57;
        uint64_t v58 = v0[84];
        if (v58 >= 1 && v57)
        {
          uint64_t v59 = 0;
          do
          {
            unint64_t v60 = v59 + v58;
            if (__OFADD__(v59, v58)) {
              unint64_t v60 = ((v59 + v58) >> 63) ^ 0x8000000000000000;
            }
            v0[116] = v60;
            Swift::String v61 = (int8x16_t *)swift_task_alloc();
            int8x16_t v62 = *((int8x16_t *)v0 + 56);
            v61[1].i64[0] = v59;
            v61[1].i64[1] = v58;
            v61[2] = vextq_s8(v62, v62, 8uLL);
            __swift_instantiateConcreteTypeFromMangledName(&qword_100048308);
            sub_10002EB88();
            swift_task_dealloc();
            unint64_t v63 = v0[65];
            v0[117] = v63;
            v0[66] = _swiftEmptyArrayStorage;
            if (v63 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v12 = sub_10002ED38();
              uint64_t v64 = v12;
              if (!v12)
              {
LABEL_54:
                swift_bridgeObjectRelease();
                unint64_t v68 = (unint64_t)_swiftEmptyArrayStorage;
                goto LABEL_55;
              }
            }
            else
            {
              uint64_t v64 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
              uint64_t v12 = swift_bridgeObjectRetain();
              if (!v64) {
                goto LABEL_54;
              }
            }
            if (v64 < 1) {
              goto LABEL_114;
            }
            for (uint64_t i = 0; i != v64; ++i)
            {
              if ((v63 & 0xC000000000000001) != 0) {
                id v66 = (id)sub_10002ED08();
              }
              else {
                id v66 = *(id *)(v63 + 8 * i + 32);
              }
              uint64_t v67 = v66;
              *(void *)(swift_task_alloc() + 16) = v66;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
              sub_10002EB88();

              swift_task_dealloc();
              if (v160[67])
              {
                sub_10002E988();
                if (*(void *)((*v159 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v159 & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
                  sub_10002E9C8();
                sub_10002E9D8();
                sub_10002E9B8();
              }
            }
            swift_bridgeObjectRelease();
            unint64_t v68 = *v159;
            uint64_t v0 = v160;
LABEL_55:
            v0[118] = v68;
            if (v68 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v77 = sub_10002ED38();
              swift_bridgeObjectRelease();
              if (!v77)
              {
LABEL_63:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_64;
              }
            }
            else if (!*(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              goto LABEL_63;
            }
            id v69 = [self sharedService];
            v0[119] = v69;
            if (v69)
            {
              unint64_t v70 = v69;
              id v71 = [v69 defaultTraits];
              v0[120] = v71;
              if (v71)
              {
                id v129 = v71;
                uint64_t v130 = v0 + 69;
                uint64_t v131 = v0[82];
                [v71 setAnalyticsOptOut:1];
                sub_1000049A0(0, &qword_100048450);
                Class isa = sub_10002E998().super.isa;
                id v133 = [v70 ticketForIdentifiers:isa traits:v129];
                v0[121] = v133;

                uint64_t v134 = swift_task_alloc();
                v0[122] = v134;
                *(void *)(v134 + 16) = v133;
                *(void *)(v134 + 24) = v131;
                uint64_t v135 = (void *)swift_task_alloc();
                v0[123] = v135;
                uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
                *uint64_t v135 = v0;
                v135[1] = sub_100021440;
                unint64_t v15 = 0xD000000000000019;
                unint64_t v16 = 0x8000000100032EE0;
                goto LABEL_109;
              }
            }
            swift_bridgeObjectRelease();
            uint64_t v72 = v0[117];
            id v73 = (void *)v0[85];
            uint64_t v74 = swift_allocObject();
            *(void *)(v74 + 16) = v72;
            *(void *)(v74 + 24) = _swiftEmptyArrayStorage;
            uint64_t v75 = swift_allocObject();
            *(void *)(v75 + 16) = sub_10002CCCC;
            *(void *)(v75 + 24) = v74;
            v0[24] = sub_10002D128;
            v0[25] = v75;
            v0[20] = _NSConcreteStackBlock;
            v0[21] = 1107296256;
            v0[22] = sub_100017C10;
            v0[23] = &block_descriptor_168;
            uint64_t v76 = _Block_copy(v154);
            swift_bridgeObjectRetain();
            swift_retain();
            uint64_t v0 = v160;
            swift_release();
            [v73 performBlockAndWait:v76];
            _Block_release(v76);
            LOBYTE(v73) = swift_isEscapingClosureAtFileLocation();
            swift_release();
            swift_release();
            uint64_t v12 = swift_bridgeObjectRelease();
            if (v73) {
              goto LABEL_115;
            }
LABEL_64:
            sub_10002EB88();
            uint64_t v59 = v0[116];
            uint64_t v78 = v0[114];
            uint64_t v58 = v0[84];
            BOOL v79 = v78 >= v59;
            BOOL v80 = v59 >= v78;
            if (v58 <= 0) {
              BOOL v80 = v79;
            }
          }
          while (!v80);
        }
        uint64_t v81 = (void *)v0[85];
        uint64_t v82 = v0[82];
        swift_bridgeObjectRelease();
        uint64_t v83 = swift_allocObject();
        *(void *)(v83 + 16) = sub_10002D1D4;
        *(void *)(v83 + 24) = v82;
        v0[18] = sub_10002D128;
        v0[19] = v83;
        v0[14] = _NSConcreteStackBlock;
        v0[15] = 1107296256;
        v0[16] = sub_100017C10;
        v0[17] = &block_descriptor_179;
        uint64_t v84 = _Block_copy(v150);
        swift_retain();
        swift_retain();
        swift_release();
        [v81 performBlockAndWait:v84];
        _Block_release(v84);
        LOBYTE(v81) = swift_isEscapingClosureAtFileLocation();
        uint64_t v12 = swift_release();
        if ((v81 & 1) == 0)
        {
          uint64_t v85 = v0[114];
          uint64_t v86 = (void *)v0[102];
          uint64_t v87 = v0[84];
          uint64_t v88 = v0[82];
          sub_10002ECD8(60);
          v168._object = (void *)0x8000000100032940;
          v168._uint64_t countAndFlagsBits = 0xD000000000000014;
          sub_10002E948(v168);
          swift_bridgeObjectRelease();
          v0[71] = v85;
          v169._uint64_t countAndFlagsBits = sub_10002ED78();
          sub_10002E948(v169);
          swift_bridgeObjectRelease();
          uint64_t v21 = (void *)0xD000000000000014;
          v170._uint64_t countAndFlagsBits = 0xD000000000000015;
          v170._object = (void *)0x8000000100032960;
          sub_10002E948(v170);
          v0[72] = v87;
          v171._uint64_t countAndFlagsBits = sub_10002ED78();
          sub_10002E948(v171);
          swift_bridgeObjectRelease();
          v172._uint64_t countAndFlagsBits = 0x71657220726F6620;
          v172._object = (void *)0xED00002074736575;
          sub_10002E948(v172);
          id v89 = [v86 description];
          uint64_t v90 = sub_10002E8F8();
          unint64_t v92 = v91;

          v173._uint64_t countAndFlagsBits = v90;
          v173._object = v92;
          sub_10002E948(v173);
          swift_bridgeObjectRelease();
          _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
          swift_bridgeObjectRelease();
          swift_release_n();

          id v93 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedReviewedPlace);
          v0[115] = v93;
          swift_retain_n();
          uint64_t v94 = (void *)swift_task_alloc();
          v94[2] = v88;
          v94[3] = v93;
          v94[4] = sub_10002CD0C;
          v94[5] = v88;
          __swift_instantiateConcreteTypeFromMangledName(&qword_100048470);
          sub_10002EB88();
          swift_task_dealloc();
          uint64_t v95 = v0[57];
          v0[125] = v0[56];
          v0[126] = v95;
          uint64_t v96 = *(void *)(v95 + 16);
          v0[127] = v96;
          uint64_t v97 = v0[84];
          if (v97 >= 1 && v96)
          {
            uint64_t v98 = 0;
            do
            {
              unint64_t v99 = v98 + v97;
              if (__OFADD__(v98, v97)) {
                unint64_t v99 = ((v98 + v97) >> 63) ^ 0x8000000000000000;
              }
              v0[128] = v99;
              uint64_t v100 = (int8x16_t *)swift_task_alloc();
              int8x16_t v101 = v158[13];
              v100[1].i64[0] = v98;
              v100[1].i64[1] = v97;
              v100[2] = vextq_s8(v101, v101, 8uLL);
              __swift_instantiateConcreteTypeFromMangledName(&qword_100048478);
              sub_10002EB88();
              swift_task_dealloc();
              unint64_t v102 = v0[74];
              v0[129] = v102;
              v0[75] = _swiftEmptyArrayStorage;
              if (v102 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v12 = sub_10002ED38();
                uint64_t v103 = v12;
                if (!v12)
                {
LABEL_87:
                  swift_bridgeObjectRelease();
                  unint64_t v107 = (unint64_t)_swiftEmptyArrayStorage;
                  goto LABEL_88;
                }
              }
              else
              {
                uint64_t v103 = *(void *)((v102 & 0xFFFFFFFFFFFFFF8) + 0x10);
                uint64_t v12 = swift_bridgeObjectRetain();
                if (!v103) {
                  goto LABEL_87;
                }
              }
              if (v103 < 1) {
                goto LABEL_117;
              }
              for (uint64_t j = 0; j != v103; ++j)
              {
                if ((v102 & 0xC000000000000001) != 0) {
                  id v105 = (id)sub_10002ED08();
                }
                else {
                  id v105 = *(id *)(v102 + 8 * j + 32);
                }
                int8x16_t v106 = v105;
                *(void *)(swift_task_alloc() + 16) = v105;
                __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
                sub_10002EB88();

                swift_task_dealloc();
                if (v160[76])
                {
                  sub_10002E988();
                  if (*(void *)((*v156 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v156 & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
                    sub_10002E9C8();
                  sub_10002E9D8();
                  sub_10002E9B8();
                }
              }
              swift_bridgeObjectRelease();
              unint64_t v107 = *v156;
              uint64_t v21 = (void *)0xD000000000000014;
LABEL_88:
              v160[130] = v107;
              if (v107 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v114 = sub_10002ED38();
                swift_bridgeObjectRelease();
                if (!v114)
                {
LABEL_96:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v0 = v160;
                  goto LABEL_97;
                }
              }
              else if (!*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                goto LABEL_96;
              }
              id v108 = [self sharedService];
              uint64_t v20 = v160;
              v160[131] = v108;
              if (v108)
              {
                BOOL v24 = v108;
                id v32 = [v108 defaultTraits];
                v160[132] = v32;
                if (v32) {
                  goto LABEL_108;
                }
              }
              swift_bridgeObjectRelease();
              uint64_t v109 = v160[129];
              id v110 = (void *)v160[85];
              uint64_t v111 = swift_allocObject();
              *(void *)(v111 + 16) = v109;
              *(void *)(v111 + 24) = _swiftEmptyArrayStorage;
              uint64_t v112 = swift_allocObject();
              *(void *)(v112 + 16) = sub_10002CE58;
              *(void *)(v112 + 24) = v111;
              v160[12] = sub_10002D128;
              v160[13] = v112;
              v160[8] = _NSConcreteStackBlock;
              v160[9] = 1107296256;
              v160[10] = sub_100017C10;
              v160[11] = &block_descriptor_189;
              uint64_t v113 = _Block_copy(v151);
              uint64_t v0 = v160;
              swift_bridgeObjectRetain();
              swift_retain();
              swift_release();
              [v110 performBlockAndWait:v113];
              _Block_release(v113);
              LOBYTE(v110) = swift_isEscapingClosureAtFileLocation();
              swift_release();
              swift_release();
              uint64_t v12 = swift_bridgeObjectRelease();
              if (v110) {
                goto LABEL_118;
              }
LABEL_97:
              sub_10002EB88();
              uint64_t v98 = v0[128];
              uint64_t v115 = v0[127];
              uint64_t v97 = v0[84];
              BOOL v116 = v115 >= v98;
              BOOL v117 = v98 >= v115;
              if (v97 <= 0) {
                BOOL v117 = v116;
              }
              uint64_t v21 = (void *)0xD000000000000014;
            }
            while (!v117);
          }
          BOOL v118 = (void *)v0[85];
          uint64_t v119 = v0[82];
          swift_bridgeObjectRelease();
          uint64_t v120 = swift_allocObject();
          *(void *)(v120 + 16) = sub_10002D1D4;
          *(void *)(v120 + 24) = v119;
          v0[6] = sub_10002D128;
          v0[7] = v120;
          v0[2] = _NSConcreteStackBlock;
          v0[3] = 1107296256;
          v0[4] = sub_100017C10;
          v0[5] = &block_descriptor_200;
          uint64_t v121 = _Block_copy(v149);
          swift_retain();
          swift_retain();
          swift_release();
          [v118 performBlockAndWait:v121];
          _Block_release(v121);
          LOBYTE(v118) = swift_isEscapingClosureAtFileLocation();
          uint64_t v12 = swift_release();
          if ((v118 & 1) == 0)
          {
            uint64_t v122 = v0[127];
            uint64_t v123 = (void *)v0[115];
            uint64_t v124 = v0[84];
            sub_10002ECD8(60);
            v174._object = (void *)0x8000000100032940;
            v174._uint64_t countAndFlagsBits = 0xD000000000000014;
            sub_10002E948(v174);
            swift_bridgeObjectRelease();
            v0[80] = v122;
            v175._uint64_t countAndFlagsBits = sub_10002ED78();
            sub_10002E948(v175);
            swift_bridgeObjectRelease();
            v176._uint64_t countAndFlagsBits = 0xD000000000000015;
            v176._object = (void *)0x8000000100032960;
            sub_10002E948(v176);
            v0[81] = v124;
            v177._uint64_t countAndFlagsBits = sub_10002ED78();
            sub_10002E948(v177);
            swift_bridgeObjectRelease();
            v178._uint64_t countAndFlagsBits = 0x71657220726F6620;
            v178._object = (void *)0xED00002074736575;
            sub_10002E948(v178);
            id v125 = [v123 description];
            uint64_t v126 = sub_10002E8F8();
            id v128 = v127;

            v179._uint64_t countAndFlagsBits = v126;
            v179._object = v128;
            sub_10002E948(v179);
            swift_bridgeObjectRelease();
            _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
            swift_bridgeObjectRelease();
            swift_release_n();

            _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001DLL, 0x8000000100032F00);
            uint64_t v136 = (uint64_t (*)(void))v0[1];
            goto LABEL_103;
          }
LABEL_120:
          __break(1u);
          return withCheckedThrowingContinuation<A>(isolation:function:_:)(v12, v13, v14, v15, v16, v17, v18, v19);
        }
LABEL_119:
        __break(1u);
        goto LABEL_120;
      }
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
      goto LABEL_119;
    }
    unint64_t v27 = (unint64_t)v24 + v22;
    if (__OFADD__(v22, v24)) {
      unint64_t v27 = (((uint64_t)v24 + v22) >> 63) ^ 0x8000000000000000;
    }
    v0[103] = v27;
    unint64_t v28 = (int8x16_t *)swift_task_alloc();
    int8x16_t v29 = *v158;
    v28[1].i64[0] = v22;
    v28[1].i64[1] = (uint64_t)v24;
    v28[2] = vextq_s8(v29, v29, 8uLL);
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048468);
    uint64_t v5 = 0;
    sub_10002EB88();
    swift_task_dealloc();
    unint64_t v30 = v0[79];
    v0[104] = v30;
    v0[73] = _swiftEmptyArrayStorage;
    if (v30 >> 62)
    {
      swift_bridgeObjectRetain();
      id v32 = (id)sub_10002ED38();
      uint64_t v31 = (uint64_t)v32;
      if (!v32)
      {
LABEL_24:
        swift_bridgeObjectRelease();
        unint64_t v36 = (unint64_t)_swiftEmptyArrayStorage;
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v32 = (id)swift_bridgeObjectRetain();
      if (!v31) {
        goto LABEL_24;
      }
    }
    if (v31 < 1) {
      break;
    }
    for (uint64_t k = 0; k != v31; ++k)
    {
      if ((v30 & 0xC000000000000001) != 0) {
        id v34 = (id)sub_10002ED08();
      }
      else {
        id v34 = *(id *)(v30 + 8 * k + 32);
      }
      uint64_t v35 = v34;
      *(void *)(swift_task_alloc() + 16) = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
      sub_10002EB88();

      swift_task_dealloc();
      if (v160[58])
      {
        sub_10002E988();
        if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10002E9C8();
        }
        sub_10002E9D8();
        sub_10002E9B8();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v36 = *v3;
    uint64_t v0 = v160;
    uint64_t v20 = v157;
    uint64_t v21 = &unk_10003E0A8;
LABEL_25:
    v0[105] = v36;
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_10002ED38();
      swift_bridgeObjectRelease();
      if (!v37) {
        goto LABEL_27;
      }
LABEL_29:
      id v38 = [self sharedService];
      v0[106] = v38;
      uint64_t v1 = v152;
      if (!v38) {
        goto LABEL_32;
      }
      uint64_t v39 = v38;
      id v40 = [v38 defaultTraits];
      v0[107] = v40;
      if (v40)
      {
        id v138 = v40;
        uint64_t v139 = v0[82];
        [v40 setAnalyticsOptOut:1];
        sub_1000049A0(0, &qword_100048450);
        Class v140 = sub_10002E998().super.isa;
        id v141 = [v39 ticketForIdentifiers:v140 traits:v138];
        v0[108] = v141;

        uint64_t v134 = swift_task_alloc();
        v0[109] = v134;
        *(void *)(v134 + 16) = v141;
        *(void *)(v134 + 24) = v139;
        uint64_t v142 = (void *)swift_task_alloc();
        v0[110] = v142;
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
        *uint64_t v142 = v0;
        v142[1] = sub_10001F764;
        unint64_t v15 = 0xD000000000000019;
        unint64_t v16 = 0x8000000100032EE0;
        id v17 = sub_10002D1D8;
        uint64_t v12 = v148;
        goto LABEL_110;
      }

LABEL_32:
      swift_bridgeObjectRelease();
      uint64_t v4 = _swiftEmptyArrayStorage;
      uint64_t v6 = &off_100045000;
      goto LABEL_2;
    }
    if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_29;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10002EB88();
  }
  __break(1u);
LABEL_108:
  id v143 = v32;
  uint64_t v130 = v20 + 78;
  uint64_t v144 = v20[82];
  objc_msgSend(v32, "setAnalyticsOptOut:", 1, v148, v149);
  sub_1000049A0(0, &qword_100048450);
  Class v145 = sub_10002E998().super.isa;
  id v146 = [v24 ticketForIdentifiers:v145 traits:v143];
  v20[133] = v146;

  uint64_t v134 = swift_task_alloc();
  v20[134] = v134;
  *(void *)(v134 + 16) = v146;
  *(void *)(v134 + 24) = v144;
  v147 = (void *)swift_task_alloc();
  v20[135] = v147;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
  void *v147 = v20;
  v147[1] = sub_1000228B4;
  unint64_t v15 = (unint64_t)v21 + 5;
  unint64_t v16 = 0x8000000100032EE0;
LABEL_109:
  id v17 = sub_10002D1D8;
  uint64_t v12 = (uint64_t)v130;
LABEL_110:
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v18 = v134;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v12, v13, v14, v15, v16, v17, v18, v19);
}

uint64_t sub_100021360()
{
  uint64_t v1 = *(void **)(v0 + 856);

  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(v0 + 712);
  swift_release_n();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100021440()
{
  *(void *)(*(void *)v1 + 992) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000227D4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10002155C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002155C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (const void *)(v0 + 160);
  uint64_t v3 = (unint64_t *)(v0 + 528);
  uint64_t v103 = v0 + 552;
  uint64_t v4 = *(void **)(v0 + 960);
  id v105 = (unint64_t *)(v0 + 600);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(v0 + 552);
  uint64_t v6 = *(void *)(v0 + 992);
LABEL_2:
  uint64_t v7 = *(void *)(v1 + 936);
  id v104 = *(id *)(v1 + 680);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v5;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10002CCCC;
  *(void *)(v9 + 24) = v8;
  *(void *)(v1 + 192) = sub_10002D128;
  *(void *)(v1 + 200) = v9;
  *(void *)(v1 + 160) = _NSConcreteStackBlock;
  *(void *)(v1 + 168) = 1107296256;
  *(void *)(v1 + 176) = sub_100017C10;
  *(void *)(v1 + 184) = &block_descriptor_168;
  uint64_t v10 = _Block_copy(v2);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v104 performBlockAndWait:v10];
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  uint64_t v12 = swift_bridgeObjectRelease();
  if (isEscapingClosureAtFileLocation) {
    goto LABEL_78;
  }
  sub_10002EB88();
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v38 = *(void **)(v1 + 816);
    swift_release_n();

    uint64_t v54 = *(uint64_t (**)(void))(v1 + 8);
    goto LABEL_35;
  }
  while (1)
  {
    uint64_t v20 = *(void *)(v1 + 928);
    uint64_t v21 = *(void *)(v1 + 912);
    uint64_t v22 = *(void *)(v1 + 672);
    BOOL v23 = v21 >= v20;
    BOOL v24 = v20 >= v21;
    if (v22 <= 0) {
      BOOL v24 = v23;
    }
    if (v24) {
      break;
    }
    unint64_t v25 = v20 + v22;
    if (__OFADD__(v20, v22)) {
      unint64_t v25 = ((v20 + v22) >> 63) ^ 0x8000000000000000;
    }
    *(void *)(v1 + 928) = v25;
    BOOL v26 = (int8x16_t *)swift_task_alloc();
    int8x16_t v27 = *(int8x16_t *)(v1 + 896);
    v26[1].i64[0] = v20;
    v26[1].i64[1] = v22;
    v26[2] = vextq_s8(v27, v27, 8uLL);
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048308);
    uint64_t v6 = 0;
    sub_10002EB88();
    swift_task_dealloc();
    unint64_t v28 = *(void *)(v1 + 520);
    *(void *)(v1 + 936) = v28;
    *(void *)(v1 + 528) = _swiftEmptyArrayStorage;
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_10002ED38();
      uint64_t v29 = v12;
      if (!v12)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        unint64_t v33 = (unint64_t)_swiftEmptyArrayStorage;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v12 = swift_bridgeObjectRetain();
      if (!v29) {
        goto LABEL_23;
      }
    }
    if (v29 < 1)
    {
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
      return withCheckedThrowingContinuation<A>(isolation:function:_:)(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    for (uint64_t i = 0; i != v29; ++i)
    {
      if ((v28 & 0xC000000000000001) != 0) {
        id v31 = (id)sub_10002ED08();
      }
      else {
        id v31 = *(id *)(v28 + 8 * i + 32);
      }
      id v32 = v31;
      *(void *)(swift_task_alloc() + 16) = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
      sub_10002EB88();

      swift_task_dealloc();
      if (*(void *)(v0 + 536))
      {
        sub_10002E988();
        if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10002E9C8();
        }
        sub_10002E9D8();
        sub_10002E9B8();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v33 = *v3;
    uint64_t v1 = v0;
LABEL_24:
    *(void *)(v1 + 944) = v33;
    uint64_t v2 = (const void *)(v0 + 160);
    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_10002ED38();
      swift_bridgeObjectRelease();
      if (!v34) {
        goto LABEL_26;
      }
LABEL_28:
      id v35 = [self sharedService];
      *(void *)(v1 + 952) = v35;
      if (v35)
      {
        unint64_t v36 = v35;
        id v37 = [v35 defaultTraits];
        *(void *)(v1 + 960) = v37;
        if (v37)
        {
          id v98 = v37;
          uint64_t v99 = *(void *)(v1 + 656);
          [v37 setAnalyticsOptOut:1];
          sub_1000049A0(0, &qword_100048450);
          Class isa = sub_10002E998().super.isa;
          id v101 = [v36 ticketForIdentifiers:isa traits:v98];
          *(void *)(v1 + 968) = v101;

          uint64_t v96 = swift_task_alloc();
          *(void *)(v1 + 976) = v96;
          *(void *)(v96 + 16) = v101;
          *(void *)(v96 + 24) = v99;
          unint64_t v102 = (void *)swift_task_alloc();
          *(void *)(v1 + 984) = v102;
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
          void *v102 = v1;
          v102[1] = sub_100021440;
          unint64_t v15 = 0xD000000000000019;
          unint64_t v16 = 0x8000000100032EE0;
          id v17 = sub_10002D1D8;
          uint64_t v12 = v103;
          goto LABEL_74;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v5 = _swiftEmptyArrayStorage;
      goto LABEL_2;
    }
    if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_28;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10002EB88();
  }
  uint64_t v39 = *(void **)(v1 + 680);
  uint64_t v40 = *(void *)(v1 + 656);
  swift_bridgeObjectRelease();
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = sub_10002D1D4;
  *(void *)(v41 + 24) = v40;
  *(void *)(v1 + 144) = sub_10002D128;
  *(void *)(v1 + 152) = v41;
  *(void *)(v1 + 112) = _NSConcreteStackBlock;
  *(void *)(v1 + 120) = 1107296256;
  *(void *)(v1 + 128) = sub_100017C10;
  *(void *)(v1 + 136) = &block_descriptor_179;
  uint64_t v42 = _Block_copy((const void *)(v0 + 112));
  swift_retain();
  swift_retain();
  swift_release();
  [v39 performBlockAndWait:v42];
  _Block_release(v42);
  LOBYTE(v39) = swift_isEscapingClosureAtFileLocation();
  uint64_t v12 = swift_release();
  if (v39) {
    goto LABEL_81;
  }
  uint64_t v43 = *(void *)(v0 + 912);
  uint64_t v44 = *(void **)(v0 + 816);
  uint64_t v45 = *(void *)(v0 + 672);
  uint64_t v46 = *(void *)(v0 + 656);
  sub_10002ECD8(60);
  v107._object = (void *)0x8000000100032940;
  v107._uint64_t countAndFlagsBits = 0xD000000000000014;
  sub_10002E948(v107);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 568) = v43;
  v108._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v108);
  swift_bridgeObjectRelease();
  v109._uint64_t countAndFlagsBits = 0xD000000000000015;
  v109._object = (void *)0x8000000100032960;
  sub_10002E948(v109);
  *(void *)(v0 + 576) = v45;
  v110._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v110);
  swift_bridgeObjectRelease();
  v111._uint64_t countAndFlagsBits = 0x71657220726F6620;
  v111._object = (void *)0xED00002074736575;
  sub_10002E948(v111);
  id v47 = [v44 description];
  uint64_t v48 = sub_10002E8F8();
  id v50 = v49;

  v112._uint64_t countAndFlagsBits = v48;
  v112._object = v50;
  sub_10002E948(v112);
  uint64_t v51 = (void *)v0;
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  swift_release_n();

  uint64_t v52 = sub_100025C24((void (*)(void))type metadata accessor for MapsSyncManagedReviewedPlace);
  *(void *)(v0 + 920) = v52;
  swift_retain_n();
  int64_t v53 = (void *)swift_task_alloc();
  v53[2] = v46;
  v53[3] = v52;
  v53[4] = sub_10002CD0C;
  v53[5] = v46;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100048470);
  sub_10002EB88();
  swift_task_dealloc();
  uint64_t v56 = *(void *)(v0 + 456);
  *(void *)(v0 + 1000) = *(void *)(v0 + 448);
  *(void *)(v0 + 1008) = v56;
  uint64_t v57 = *(void *)(v56 + 16);
  *(void *)(v0 + 1016) = v57;
  uint64_t v58 = *(void *)(v0 + 672);
  if (v58 < 1 || !v57)
  {
LABEL_70:
    uint64_t v81 = (void *)v51[85];
    uint64_t v82 = v51[82];
    swift_bridgeObjectRelease();
    uint64_t v83 = swift_allocObject();
    *(void *)(v83 + 16) = sub_10002D1D4;
    *(void *)(v83 + 24) = v82;
    v51[6] = sub_10002D128;
    v51[7] = v83;
    v51[2] = _NSConcreteStackBlock;
    v51[3] = 1107296256;
    v51[4] = sub_100017C10;
    v51[5] = &block_descriptor_200;
    uint64_t v84 = _Block_copy((const void *)(v0 + 16));
    swift_retain();
    swift_retain();
    swift_release();
    [v81 performBlockAndWait:v84];
    _Block_release(v84);
    LOBYTE(v81) = swift_isEscapingClosureAtFileLocation();
    uint64_t v12 = swift_release();
    if (v81) {
      goto LABEL_82;
    }
    uint64_t v85 = v51[127];
    uint64_t v86 = (void *)v51[115];
    uint64_t v87 = v51[84];
    sub_10002ECD8(60);
    v113._object = (void *)0x8000000100032940;
    v113._uint64_t countAndFlagsBits = 0xD000000000000014;
    sub_10002E948(v113);
    swift_bridgeObjectRelease();
    v51[80] = v85;
    v114._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v114);
    swift_bridgeObjectRelease();
    v115._uint64_t countAndFlagsBits = 0xD000000000000015;
    v115._object = (void *)0x8000000100032960;
    sub_10002E948(v115);
    v51[81] = v87;
    v116._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v116);
    swift_bridgeObjectRelease();
    v117._uint64_t countAndFlagsBits = 0x71657220726F6620;
    v117._object = (void *)0xED00002074736575;
    sub_10002E948(v117);
    id v88 = [v86 description];
    uint64_t v89 = sub_10002E8F8();
    uint64_t v91 = v90;

    v118._uint64_t countAndFlagsBits = v89;
    v118._object = v91;
    sub_10002E948(v118);
    swift_bridgeObjectRelease();
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    swift_release_n();

    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001DLL, 0x8000000100032F00);
    uint64_t v54 = (uint64_t (*)(void))v51[1];
LABEL_35:
    return v54();
  }
  uint64_t v59 = 0;
  while (1)
  {
    unint64_t v60 = v59 + v58;
    if (__OFADD__(v59, v58)) {
      unint64_t v60 = ((v59 + v58) >> 63) ^ 0x8000000000000000;
    }
    v51[128] = v60;
    Swift::String v61 = (int8x16_t *)swift_task_alloc();
    int8x16_t v62 = *(int8x16_t *)(v0 + 1000);
    v61[1].i64[0] = v59;
    v61[1].i64[1] = v58;
    v61[2] = vextq_s8(v62, v62, 8uLL);
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048478);
    sub_10002EB88();
    swift_task_dealloc();
    unint64_t v63 = v51[74];
    v51[129] = v63;
    v51[75] = _swiftEmptyArrayStorage;
    if (v63 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_10002ED38();
      uint64_t v64 = v12;
      if (!v12)
      {
LABEL_57:
        swift_bridgeObjectRelease();
        unint64_t v68 = (unint64_t)_swiftEmptyArrayStorage;
        goto LABEL_58;
      }
    }
    else
    {
      uint64_t v64 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v12 = swift_bridgeObjectRetain();
      if (!v64) {
        goto LABEL_57;
      }
    }
    if (v64 < 1) {
      goto LABEL_79;
    }
    for (uint64_t j = 0; j != v64; ++j)
    {
      if ((v63 & 0xC000000000000001) != 0) {
        id v66 = (id)sub_10002ED08();
      }
      else {
        id v66 = *(id *)(v63 + 8 * j + 32);
      }
      uint64_t v67 = v66;
      *(void *)(swift_task_alloc() + 16) = v66;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
      sub_10002EB88();

      swift_task_dealloc();
      if (*(void *)(v0 + 608))
      {
        sub_10002E988();
        if (*(void *)((*v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10002E9C8();
        }
        sub_10002E9D8();
        sub_10002E9B8();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v68 = *v105;
    uint64_t v51 = (void *)v0;
LABEL_58:
    v51[130] = v68;
    if (v68 >> 62) {
      break;
    }
    if (*(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_60;
    }
LABEL_66:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_67:
    sub_10002EB88();
    uint64_t v59 = v51[128];
    uint64_t v78 = v51[127];
    uint64_t v58 = v51[84];
    BOOL v79 = v78 >= v59;
    BOOL v80 = v59 >= v78;
    if (v58 <= 0) {
      BOOL v80 = v79;
    }
    if (v80) {
      goto LABEL_70;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v77 = sub_10002ED38();
  swift_bridgeObjectRelease();
  if (!v77) {
    goto LABEL_66;
  }
LABEL_60:
  id v69 = [self sharedService];
  v51[131] = v69;
  if (!v69) {
    goto LABEL_63;
  }
  unint64_t v70 = v69;
  id v71 = [v69 defaultTraits];
  v51[132] = v71;
  if (!v71)
  {

LABEL_63:
    swift_bridgeObjectRelease();
    uint64_t v72 = v51[129];
    id v73 = (void *)v51[85];
    uint64_t v74 = swift_allocObject();
    *(void *)(v74 + 16) = v72;
    *(void *)(v74 + 24) = _swiftEmptyArrayStorage;
    uint64_t v75 = swift_allocObject();
    *(void *)(v75 + 16) = sub_10002CE58;
    *(void *)(v75 + 24) = v74;
    *(void *)(v0 + 96) = sub_10002D128;
    *(void *)(v0 + 104) = v75;
    *(void *)(v0 + 64) = _NSConcreteStackBlock;
    *(void *)(v0 + 72) = 1107296256;
    *(void *)(v0 + 80) = sub_100017C10;
    *(void *)(v0 + 88) = &block_descriptor_189;
    uint64_t v76 = _Block_copy((const void *)(v0 + 64));
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    [v73 performBlockAndWait:v76];
    _Block_release(v76);
    LOBYTE(v73) = swift_isEscapingClosureAtFileLocation();
    uint64_t v51 = (void *)v0;
    swift_release();
    swift_release();
    uint64_t v12 = swift_bridgeObjectRelease();
    if (v73) {
      goto LABEL_80;
    }
    goto LABEL_67;
  }
  id v92 = v71;
  uint64_t v93 = v51[82];
  [v71 setAnalyticsOptOut:1];
  sub_1000049A0(0, &qword_100048450);
  Class v94 = sub_10002E998().super.isa;
  id v95 = [v70 ticketForIdentifiers:v94 traits:v92];
  v51[133] = v95;

  uint64_t v96 = swift_task_alloc();
  v51[134] = v96;
  *(void *)(v96 + 16) = v95;
  *(void *)(v96 + 24) = v93;
  uint64_t v97 = (void *)swift_task_alloc();
  v51[135] = v97;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
  *uint64_t v97 = v51;
  v97[1] = sub_1000228B4;
  unint64_t v15 = 0xD000000000000019;
  unint64_t v16 = 0x8000000100032EE0;
  id v17 = sub_10002D1D8;
  uint64_t v12 = (uint64_t)(v51 + 78);
LABEL_74:
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v18 = v96;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v12, v13, v14, v15, v16, v17, v18, v19);
}

uint64_t sub_1000227D4()
{
  uint64_t v1 = *(void **)(v0 + 960);

  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(v0 + 816);
  swift_release_n();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_1000228B4()
{
  *(void *)(*(void *)v1 + 1088) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10002333C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1000229D0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000229D0()
{
  uint64_t v1 = (unint64_t *)(v0 + 600);
  uint64_t v2 = *(void **)(v0 + 1056);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void **)(v0 + 624);
  uint64_t v4 = *(void *)(v0 + 1088);
  uint64_t v5 = &off_100045000;
LABEL_2:
  uint64_t v6 = *(void *)(v0 + 1032);
  id v57 = *(id *)(v0 + 680);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v3;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10002CE58;
  *(void *)(v8 + 24) = v7;
  *(void *)(v0 + 96) = sub_10002D128;
  *(void *)(v0 + 104) = v8;
  *(void *)(v0 + 64) = _NSConcreteStackBlock;
  *(void *)(v0 + 72) = 1107296256;
  *(void *)(v0 + 80) = sub_100017C10;
  *(void *)(v0 + 88) = &block_descriptor_189;
  uint64_t v9 = _Block_copy((const void *)(v0 + 64));
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v57, v5[143], v9);
  _Block_release(v9);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  uint64_t v11 = swift_bridgeObjectRelease();
  if (isEscapingClosureAtFileLocation)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  sub_10002EB88();
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v37 = *(void **)(v0 + 920);
    swift_release_n();

    id v38 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_35;
  }
  while (1)
  {
    uint64_t v19 = *(void *)(v0 + 1024);
    uint64_t v20 = *(void *)(v0 + 1016);
    uint64_t v21 = *(void *)(v0 + 672);
    BOOL v22 = v20 >= v19;
    BOOL v23 = v19 >= v20;
    if (v21 <= 0) {
      BOOL v23 = v22;
    }
    if (v23) {
      break;
    }
    unint64_t v24 = v19 + v21;
    if (__OFADD__(v19, v21)) {
      unint64_t v24 = ((v19 + v21) >> 63) ^ 0x8000000000000000;
    }
    *(void *)(v0 + 1024) = v24;
    unint64_t v25 = (int8x16_t *)swift_task_alloc();
    int8x16_t v26 = *(int8x16_t *)(v0 + 1000);
    v25[1].i64[0] = v19;
    v25[1].i64[1] = v21;
    v25[2] = vextq_s8(v26, v26, 8uLL);
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048478);
    uint64_t v4 = 0;
    sub_10002EB88();
    swift_task_dealloc();
    unint64_t v27 = *(void *)(v0 + 592);
    *(void *)(v0 + 1032) = v27;
    *(void *)(v0 + 600) = _swiftEmptyArrayStorage;
    if (v27 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_10002ED38();
      uint64_t v28 = v11;
      if (!v11)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        unint64_t v32 = (unint64_t)_swiftEmptyArrayStorage;
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v11 = swift_bridgeObjectRetain();
      if (!v28) {
        goto LABEL_23;
      }
    }
    if (v28 < 1)
    {
      __break(1u);
      goto LABEL_42;
    }
    for (uint64_t i = 0; i != v28; ++i)
    {
      if ((v27 & 0xC000000000000001) != 0) {
        id v30 = (id)sub_10002ED08();
      }
      else {
        id v30 = *(id *)(v27 + 8 * i + 32);
      }
      id v31 = v30;
      *(void *)(swift_task_alloc() + 16) = v30;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E8);
      sub_10002EB88();

      swift_task_dealloc();
      if (*(void *)(v0 + 608))
      {
        sub_10002E988();
        if (*(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10002E9C8();
        }
        sub_10002E9D8();
        sub_10002E9B8();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v32 = *v1;
    uint64_t v5 = &off_100045000;
LABEL_24:
    *(void *)(v0 + 1040) = v32;
    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_10002ED38();
      swift_bridgeObjectRelease();
      if (v33)
      {
LABEL_28:
        id v34 = [self sharedService];
        *(void *)(v0 + 1048) = v34;
        if (!v34)
        {
LABEL_31:
          swift_bridgeObjectRelease();
          uint64_t v3 = _swiftEmptyArrayStorage;
          goto LABEL_2;
        }
        id v35 = v34;
        id v36 = [v34 defaultTraits];
        *(void *)(v0 + 1056) = v36;
        if (!v36)
        {

          goto LABEL_31;
        }
        id v51 = v36;
        uint64_t v52 = *(void *)(v0 + 656);
        [v36 setAnalyticsOptOut:1];
        sub_1000049A0(0, &qword_100048450);
        Class isa = sub_10002E998().super.isa;
        id v54 = [v35 ticketForIdentifiers:isa traits:v51];
        *(void *)(v0 + 1064) = v54;

        uint64_t v55 = swift_task_alloc();
        *(void *)(v0 + 1072) = v55;
        *(void *)(v55 + 16) = v54;
        *(void *)(v55 + 24) = v52;
        uint64_t v56 = (void *)swift_task_alloc();
        *(void *)(v0 + 1080) = v56;
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048458);
        *uint64_t v56 = v0;
        v56[1] = sub_1000228B4;
        unint64_t v14 = 0xD000000000000019;
        unint64_t v15 = 0x8000000100032EE0;
        unint64_t v16 = sub_10002D1D8;
        uint64_t v11 = v0 + 624;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v17 = v55;
        return withCheckedThrowingContinuation<A>(isolation:function:_:)(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    else if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_28;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10002EB88();
  }
  uint64_t v39 = *(void **)(v0 + 680);
  uint64_t v40 = *(void *)(v0 + 656);
  swift_bridgeObjectRelease();
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = sub_10002D1D4;
  *(void *)(v41 + 24) = v40;
  *(void *)(v0 + 48) = sub_10002D128;
  *(void *)(v0 + 56) = v41;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_100017C10;
  *(void *)(v0 + 40) = &block_descriptor_200;
  uint64_t v42 = _Block_copy((const void *)(v0 + 16));
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v39, v5[143], v42);
  _Block_release(v42);
  LOBYTE(v39) = swift_isEscapingClosureAtFileLocation();
  uint64_t v11 = swift_release();
  if (v39) {
    goto LABEL_43;
  }
  uint64_t v43 = *(void *)(v0 + 1016);
  uint64_t v44 = *(void **)(v0 + 920);
  uint64_t v45 = *(void *)(v0 + 672);
  sub_10002ECD8(60);
  v59._object = (void *)0x8000000100032940;
  v59._uint64_t countAndFlagsBits = 0xD000000000000014;
  sub_10002E948(v59);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 640) = v43;
  v60._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v60);
  swift_bridgeObjectRelease();
  v61._uint64_t countAndFlagsBits = 0xD000000000000015;
  v61._object = (void *)0x8000000100032960;
  sub_10002E948(v61);
  *(void *)(v0 + 648) = v45;
  v62._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v62);
  swift_bridgeObjectRelease();
  v63._uint64_t countAndFlagsBits = 0x71657220726F6620;
  v63._object = (void *)0xED00002074736575;
  sub_10002E948(v63);
  id v46 = [v44 description];
  uint64_t v47 = sub_10002E8F8();
  uint64_t v49 = v48;

  v64._uint64_t countAndFlagsBits = v47;
  v64._object = v49;
  sub_10002E948(v64);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  swift_release_n();

  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001DLL, 0x8000000100032F00);
  id v38 = *(uint64_t (**)(void))(v0 + 8);
LABEL_35:
  return v38();
}

uint64_t sub_10002333C()
{
  uint64_t v1 = *(void **)(v0 + 1056);

  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(v0 + 920);
  swift_release_n();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10002341C()
{
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001FLL, 0x8000000100032FE0);
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_10002CF98;
  *(void *)(v2 + 24) = v0;
  v5[4] = sub_10002D128;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_100017C10;
  v5[3] = &block_descriptor_214;
  uint64_t v3 = _Block_copy(v5);
  swift_retain();
  swift_retain();
  swift_release();
  [v1 performBlockAndWait:v3];
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v1) {
    __break(1u);
  }
  return result;
}

void sub_100023574(uint64_t a1)
{
  uint64_t v5 = sub_10002E718();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 64);
  if (v9 == 0x8000000000000000)
  {
    __break(1u);
    goto LABEL_22;
  }
  if ((unsigned __int128)(-v9 * (__int128)86400) >> 64 != (-86400 * v9) >> 63)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_10002E6E8();
  uint64_t v10 = self;
  Class isa = sub_10002E6C8().super.isa;
  id v2 = [v10 deleteHistoryBeforeDate:isa];

  [v2 setResultType:0];
  uint64_t v12 = *(void **)(a1 + 24);
  *(void *)&long long v23 = 0;
  id v13 = [v12 executeRequest:v2 error:&v23];
  unint64_t v14 = (void *)v23;
  if (!v13)
  {
    id v18 = (id)v23;
    uint64_t v19 = sub_10002E5F8();

    swift_willThrow();
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = 0xE000000000000000;
    sub_10002ECD8(29);
    v25._object = (void *)0x8000000100032E40;
    v25._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
    sub_10002E948(v25);
    *(void *)&v22[0] = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
    sub_10002ED18();
    uint64_t v1 = *((void *)&v23 + 1);
    uint64_t v3 = v23;
    sub_10002EAA8();
    if (qword_100047060 == -1)
    {
LABEL_8:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_10002F990;
      *(void *)(v20 + 56) = &type metadata for String;
      *(void *)(v20 + 64) = sub_100007844();
      *(void *)(v20 + 32) = v3;
      *(void *)(v20 + 40) = v1;
      swift_bridgeObjectRetain();
      sub_10002E768();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_errorRelease();
LABEL_18:

      goto LABEL_19;
    }
LABEL_23:
    swift_once();
    goto LABEL_8;
  }
  unint64_t v15 = v13;
  self;
  unint64_t v16 = (void *)swift_dynamicCastObjCClass();
  id v17 = v14;
  if (!v16)
  {

    long long v23 = 0u;
    long long v24 = 0u;
LABEL_16:

    sub_10000B3D0((uint64_t)&v23, &qword_100047A60);
    goto LABEL_19;
  }
  if ([v16 result])
  {
    sub_10002EC48();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v22, 0, sizeof(v22));
  }
  sub_10002C7DC((uint64_t)v22, (uint64_t)&v23);
  if (!*((void *)&v24 + 1))
  {

    goto LABEL_16;
  }
  if (!swift_dynamicCast())
  {

    goto LABEL_18;
  }
  if (v22[0])
  {
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = 0xE000000000000000;
    sub_10002ECD8(57);
    v26._uint64_t countAndFlagsBits = 0xD000000000000037;
    v26._object = (void *)0x8000000100033000;
    sub_10002E948(v26);
    sub_10002CFB0((unint64_t *)&unk_100047A70, (void (*)(uint64_t))&type metadata accessor for Date);
    v27._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v27);
    swift_bridgeObjectRelease();
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v23, *((unint64_t *)&v23 + 1));

    swift_bridgeObjectRelease();
LABEL_19:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_100023A48(uint64_t a1)
{
  type metadata accessor for MapsSyncManagedMixinMapItem();
  id v2 = [(id)swift_getObjCClassFromMetadata() entity];
  id v3 = [objc_allocWithZone((Class)NSBatchUpdateRequest) initWithEntity:v2];

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1000482C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002F990;
  *((void *)&v21 + 1) = 0x8000000100030D30;
  sub_10002EC98();
  *(void *)(inited + 96) = sub_10002E718();
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 72));
  sub_10002E708();
  sub_10001765C(inited);
  Class isa = sub_10002E8A8().super.isa;
  swift_bridgeObjectRelease();
  [v3 setPropertiesToUpdate:isa];

  [v3 setResultType:2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047558);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100030570;
  sub_1000049A0(0, &qword_100047A90);
  *(void *)(v6 + 32) = sub_10002EA78();
  *(void *)(v6 + 40) = sub_10002EA78();
  *(void *)(v6 + 48) = sub_10002EA78();
  *(void *)(v6 + 56) = sub_10002EA78();
  *(void *)&long long v21 = v6;
  sub_10002E9B8();
  Class v7 = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [self andPredicateWithSubpredicates:v7];

  [v3 setPredicate:v8];
  uint64_t v9 = *(void **)(a1 + 24);
  *(void *)&long long v21 = 0;
  id v10 = [v9 executeRequest:v3 error:&v21];
  uint64_t v11 = (void *)v21;
  if (v10)
  {
    uint64_t v12 = v10;
    self;
    id v13 = (void *)swift_dynamicCastObjCClass();
    id v14 = v11;
    if (v13)
    {
      if ([v13 result])
      {
        sub_10002EC48();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v20, 0, sizeof(v20));
      }
      sub_10002C7DC((uint64_t)v20, (uint64_t)&v21);
      if (*((void *)&v22 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v19 = *(void *)&v20[0];
          *(void *)&long long v21 = 0;
          *((void *)&v21 + 1) = 0xE000000000000000;
          sub_10002ECD8(35);
          swift_bridgeObjectRelease();
          strcpy((char *)&v21, "Added date to ");
          HIBYTE(v21) = -18;
          *(void *)&v20[0] = v19;
          v24._uint64_t countAndFlagsBits = sub_10002ED78();
          sub_10002E948(v24);
          swift_bridgeObjectRelease();
          v25._object = (void *)0x8000000100032E60;
          v25._uint64_t countAndFlagsBits = 0xD000000000000013;
          sub_10002E948(v25);
          _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v21, *((unint64_t *)&v21 + 1));
          swift_bridgeObjectRelease();
        }
        else
        {
        }
        return;
      }
    }
    else
    {

      long long v21 = 0u;
      long long v22 = 0u;
    }

    sub_10000B3D0((uint64_t)&v21, &qword_100047A60);
    return;
  }
  id v15 = (id)v21;
  uint64_t v16 = sub_10002E5F8();

  swift_willThrow();
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = 0xE000000000000000;
  sub_10002ECD8(29);
  v23._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  v23._object = (void *)0x8000000100032E40;
  sub_10002E948(v23);
  *(void *)&v20[0] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
  sub_10002ED18();
  long long v17 = v21;
  sub_10002EAA8();
  if (qword_100047060 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10002F990;
  *(void *)(v18 + 56) = &type metadata for String;
  *(void *)(v18 + 64) = sub_100007844();
  *(_OWORD *)(v18 + 32) = v17;
  swift_bridgeObjectRetain();
  sub_10002E768();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_errorRelease();
}

void sub_100024034(uint64_t a1)
{
  type metadata accessor for MapsSyncManagedMixinMapItem();
  id v7 = [(id)swift_getObjCClassFromMetadata() fetchRequest];
  uint64_t v8 = *(void *)(a1 + 72);
  if (v8 == 0x8000000000000000)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v9 = -v8;
  uint64_t v10 = -86400 * v8;
  if ((unsigned __int128)(v9 * (__int128)86400) >> 64 != v10 >> 63)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v1 = v7;
  id v11 = [objc_allocWithZone((Class)NSDate) initWithTimeIntervalSinceNow:(double)v10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047558);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100030570;
  sub_1000049A0(0, &qword_100047A90);
  *(void *)(v12 + 32) = sub_10002EA78();
  *(void *)(v12 + 40) = sub_10002EA78();
  *(void *)(v12 + 48) = sub_10002EA78();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v13 = swift_allocObject();
  long long v30 = xmmword_10002F990;
  *(_OWORD *)(v13 + 16) = xmmword_10002F990;
  *(void *)(v13 + 56) = sub_1000049A0(0, &qword_1000483B8);
  *(void *)(v13 + 64) = sub_10002C774();
  *(void *)(v13 + 32) = v11;
  id v3 = v11;
  *(void *)(v12 + 56) = sub_10002EA78();
  *(void *)&long long v32 = v12;
  sub_10002E9B8();
  Class isa = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  id v15 = [self andPredicateWithSubpredicates:isa];

  [v1 setPredicate:v15];
  id v4 = [objc_allocWithZone((Class)NSBatchDeleteRequest) initWithFetchRequest:v1];
  [v4 setResultType:2];
  uint64_t v16 = *(void **)(a1 + 24);
  *(void *)&long long v32 = 0;
  id v17 = [v16 executeRequest:v4 error:&v32];
  uint64_t v18 = (void *)v32;
  if (!v17)
  {
    id v22 = (id)v32;
    uint64_t v23 = sub_10002E5F8();

    swift_willThrow();
    *(void *)&long long v32 = 0;
    *((void *)&v32 + 1) = 0xE000000000000000;
    sub_10002ECD8(29);
    v34._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
    v34._object = (void *)0x8000000100032E40;
    sub_10002E948(v34);
    *(void *)&v31[0] = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
    sub_10002ED18();
    uint64_t v2 = *((void *)&v32 + 1);
    uint64_t v5 = v32;
    sub_10002EAA8();
    if (qword_100047060 == -1)
    {
LABEL_8:
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = v30;
      *(void *)(v24 + 56) = &type metadata for String;
      *(void *)(v24 + 64) = sub_100007844();
      *(void *)(v24 + 32) = v5;
      *(void *)(v24 + 40) = v2;
      swift_bridgeObjectRetain();
      sub_10002E768();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_errorRelease();
      return;
    }
LABEL_19:
    swift_once();
    goto LABEL_8;
  }
  uint64_t v19 = v17;
  self;
  uint64_t v20 = (void *)swift_dynamicCastObjCClass();
  id v21 = v18;
  if (!v20)
  {

    long long v32 = 0u;
    long long v33 = 0u;
LABEL_15:

    sub_10000B3D0((uint64_t)&v32, &qword_100047A60);
    return;
  }
  if ([v20 result])
  {
    sub_10002EC48();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v31, 0, sizeof(v31));
  }
  sub_10002C7DC((uint64_t)v31, (uint64_t)&v32);
  if (!*((void *)&v33 + 1))
  {

    id v3 = v1;
    uint64_t v1 = v20;
    goto LABEL_15;
  }
  if (swift_dynamicCast())
  {
    uint64_t v25 = *(void *)&v31[0];
    *(void *)&long long v32 = 0;
    *((void *)&v32 + 1) = 0xE000000000000000;
    sub_10002ECD8(41);
    swift_bridgeObjectRelease();
    *(void *)&long long v32 = 0x20646574656C6544;
    *((void *)&v32 + 1) = 0xE800000000000000;
    *(void *)&v31[0] = v25;
    v35._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v35);
    swift_bridgeObjectRelease();
    v36._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
    v36._object = (void *)0x8000000100032EA0;
    sub_10002E948(v36);
    id v26 = [v3 description];
    uint64_t v27 = sub_10002E8F8();
    uint64_t v29 = v28;

    v37._uint64_t countAndFlagsBits = v27;
    v37._object = v29;
    sub_10002E948(v37);
    swift_bridgeObjectRelease();
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v32, *((unint64_t *)&v32 + 1));
    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

void sub_10002466C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1 == 0x8000000000000000)
  {
    __break(1u);
LABEL_17:
    __break(1u);
  }
  uint64_t v2 = -v1;
  uint64_t v3 = -86400 * v1;
  if ((unsigned __int128)(v2 * (__int128)86400) >> 64 != v3 >> 63) {
    goto LABEL_17;
  }
  id v5 = [objc_allocWithZone((Class)NSDate) initWithTimeIntervalSinceNow:(double)v3];
  sub_1000049A0(0, &qword_100047A90);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10002F990;
  *(void *)(v6 + 56) = sub_1000049A0(0, &qword_1000483B8);
  *(void *)(v6 + 64) = sub_10002C774();
  *(void *)(v6 + 32) = v5;
  id v36 = v5;
  id v7 = (void *)sub_10002EA78();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10002F990;
  *(void *)(v8 + 56) = &type metadata for Int;
  *(void *)(v8 + 64) = &protocol witness table for Int;
  *(void *)(v8 + 32) = 1;
  uint64_t v9 = (void *)sub_10002EA78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047558);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100030580;
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 40) = v9;
  sub_10002E9B8();
  id v35 = v7;
  id v11 = v9;
  Class isa = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [self andPredicateWithSubpredicates:isa];

  type metadata accessor for MapsSyncManagedFavoriteItem();
  id v14 = [(id)swift_getObjCClassFromMetadata() fetchRequest];
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100030580;
  id v16 = v13;
  *(void *)(v15 + 32) = sub_10002EA78();
  *(void *)(v15 + 40) = v16;
  sub_10002E9B8();
  id v17 = objc_allocWithZone((Class)NSCompoundPredicate);
  id v18 = v16;
  Class v19 = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  id v20 = [v17 initWithType:1 subpredicates:v19];

  [v14 setPredicate:v20];
  id v21 = [objc_allocWithZone((Class)NSBatchDeleteRequest) initWithFetchRequest:v14];
  [v21 setResultType:2];
  sub_10002ECD8(34);
  swift_bridgeObjectRelease();
  *(void *)&long long v38 = 0xD000000000000020;
  *((void *)&v38 + 1) = 0x8000000100032BF0;
  id v22 = [v21 description];
  uint64_t v23 = sub_10002E8F8();
  uint64_t v25 = v24;

  v40._uint64_t countAndFlagsBits = v23;
  v40._object = v25;
  sub_10002E948(v40);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000020, 0x8000000100032BF0);
  swift_bridgeObjectRelease();
  id v26 = *(void **)(a1 + 24);
  *(void *)&long long v38 = 0;
  id v27 = [v26 executeRequest:v21 error:&v38];
  uint64_t v28 = (void *)v38;
  if (!v27)
  {
    id v32 = (id)v38;
    uint64_t v33 = sub_10002E5F8();

    swift_willThrow();
    *(void *)&long long v38 = 0;
    *((void *)&v38 + 1) = 0xE000000000000000;
    sub_10002ECD8(37);
    v41._uint64_t countAndFlagsBits = 0xD000000000000023;
    v41._object = (void *)0x8000000100032C20;
    sub_10002E948(v41);
    *(void *)&v37[0] = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047570);
    sub_10002ED18();
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v38, *((unint64_t *)&v38 + 1));
    swift_bridgeObjectRelease();

    swift_errorRelease();
    return;
  }
  uint64_t v29 = v27;
  self;
  long long v30 = (void *)swift_dynamicCastObjCClass();
  id v31 = v28;
  if (!v30)
  {

    long long v38 = 0u;
    long long v39 = 0u;
LABEL_14:

    sub_10000B3D0((uint64_t)&v38, &qword_100047A60);
    return;
  }
  if ([v30 result])
  {
    sub_10002EC48();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v37, 0, sizeof(v37));
  }
  sub_10002C7DC((uint64_t)v37, (uint64_t)&v38);
  if (!*((void *)&v39 + 1))
  {

    id v18 = v14;
    id v14 = v30;
    goto LABEL_14;
  }
  if (swift_dynamicCast())
  {
    uint64_t v34 = *(void *)&v37[0];
    *(void *)&long long v38 = 0;
    *((void *)&v38 + 1) = 0xE000000000000000;
    sub_10002ECD8(44);
    swift_bridgeObjectRelease();
    *(void *)&long long v38 = 0xD000000000000018;
    *((void *)&v38 + 1) = 0x8000000100032C50;
    *(void *)&v37[0] = v34;
    v42._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v42);
    swift_bridgeObjectRelease();
    v43._uint64_t countAndFlagsBits = 0xD000000000000012;
    v43._object = (void *)0x8000000100032C70;
    sub_10002E948(v43);
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v38, *((unint64_t *)&v38 + 1));
    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

Swift::Int sub_100024D58()
{
  Swift::UInt64 v1 = *(void *)v0;
  Swift::UInt32 v2 = *(_DWORD *)(v0 + 8);
  sub_10002EDF8();
  sub_10002EE18(v1);
  sub_10002EE08(v2);
  return sub_10002EE28();
}

void sub_100024DB8()
{
  Swift::UInt32 v1 = *(_DWORD *)(v0 + 8);
  sub_10002EE18(*(void *)v0);
  sub_10002EE08(v1);
}

Swift::Int sub_100024DF8()
{
  Swift::UInt64 v1 = *(void *)v0;
  Swift::UInt32 v2 = *(_DWORD *)(v0 + 8);
  sub_10002EDF8();
  sub_10002EE18(v1);
  sub_10002EE08(v2);
  return sub_10002EE28();
}

BOOL sub_100024E54(uint64_t a1, uint64_t a2)
{
  return *(void *)a1 == *(void *)a2 && *(_DWORD *)(a1 + 8) == (unint64_t)*(unsigned int *)(a2 + 8);
}

void sub_100024E74(unint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v7 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v8 = sub_10002E8E8();
  uint64_t v9 = (Swift::UInt32 *)[v7 initWithEntityName:v8];

  id v10 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v11 = sub_10002E8E8();
  id v12 = [v10 initWithEntityName:v11];

  id v13 = *(void **)(a1 + 24);
  type metadata accessor for MapsSyncManagedCuratedCollection();
  uint64_t v14 = sub_10002EBA8();
  if (v3)
  {

    return;
  }
  unint64_t v15 = v14;
  uint64_t v85 = a3;
  uint64_t v88 = a2;
  type metadata accessor for MapsSyncManagedHistoryCuratedCollection();
  uint64_t v16 = sub_10002EBA8();
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10002ED38();
  }
  else
  {
    uint64_t v17 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v18 = &off_100045000;
  uint64_t v86 = v9;
  unint64_t v87 = a1;
  uint64_t v84 = v12;
  unint64_t v89 = v16;
  id v83 = v13;
  if (v17)
  {
    if (v17 < 1)
    {
      __break(1u);
      goto LABEL_59;
    }
    a3 = 0;
    a1 = v15 & 0xC000000000000001;
    uint64_t v9 = (Swift::UInt32 *)_swiftEmptyArrayStorage;
    do
    {
      if (a1) {
        Class v19 = (objc_class *)sub_10002ED08();
      }
      else {
        Class v19 = (objc_class *)*(id *)(v15 + 8 * (void)a3 + 32);
      }
      id v20 = v19;
      id v21 = [(objc_class *)v19 curatedCollectionIdentifier];
      unsigned int v22 = [(objc_class *)v20 resultProviderIdentifier];

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = (Swift::UInt32 *)sub_1000130B4(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v24 = *((void *)v9 + 2);
      unint64_t v23 = *((void *)v9 + 3);
      if (v24 >= v23 >> 1) {
        uint64_t v9 = (Swift::UInt32 *)sub_1000130B4((void *)(v23 > 1), v24 + 1, 1, v9);
      }
      a3 = (uint64_t *)((char *)a3 + 1);
      *((void *)v9 + 2) = v24 + 1;
      uint64_t v25 = &v9[4 * v24];
      *((void *)v25 + 4) = v21;
      v25[10] = v22;
      id v18 = &off_100045000;
    }
    while ((uint64_t *)v17 != a3);
  }
  else
  {
    uint64_t v9 = (Swift::UInt32 *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease_n();
  uint64_t v26 = *((void *)v9 + 2);
  if (v26)
  {
    id v27 = v9 + 10;
    do
    {
      Swift::UInt64 v28 = *((void *)v27 - 1);
      Swift::UInt32 v29 = *v27;
      v27 += 4;
      sub_100028C64((uint64_t)&v93, v28, v29);
      --v26;
    }
    while (v26);
  }
  swift_bridgeObjectRelease();
  unint64_t v30 = v89;
  unint64_t v15 = (unint64_t)&_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  if (!(v89 >> 62))
  {
    uint64_t v31 = *(void *)((v89 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v31) {
      goto LABEL_23;
    }
LABEL_36:
    uint64_t v33 = _swiftEmptyArrayStorage;
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_10002ED38();
  if (!v31) {
    goto LABEL_36;
  }
LABEL_23:
  if (v31 < 1)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  uint64_t v32 = 0;
  uint64_t v33 = _swiftEmptyArrayStorage;
  do
  {
    if ((v89 & 0xC000000000000001) != 0) {
      id v34 = (id)sub_10002ED08();
    }
    else {
      id v34 = *(id *)(v30 + 8 * v32 + 32);
    }
    id v35 = v34;
    id v36 = [v34 curatedCollectionIdentifier];
    unsigned int v37 = [v35 resultProviderIdentifier];

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v33 = sub_1000130B4(0, v33[2] + 1, 1, v33);
    }
    unint64_t v39 = v33[2];
    unint64_t v38 = v33[3];
    if (v39 >= v38 >> 1) {
      uint64_t v33 = sub_1000130B4((void *)(v38 > 1), v39 + 1, 1, v33);
    }
    ++v32;
    v33[2] = v39 + 1;
    Swift::String v40 = &v33[2 * v39];
    v40[4] = v36;
    *((_DWORD *)v40 + 10) = v37;
    unint64_t v15 = 0x10003C000;
    unint64_t v30 = v89;
  }
  while (v31 != v32);
LABEL_37:
  swift_bridgeObjectRelease_n();
  uint64_t v41 = v33[2];
  if (v41)
  {
    Swift::String v42 = (Swift::UInt32 *)(v33 + 5);
    do
    {
      Swift::UInt64 v43 = *((void *)v42 - 1);
      Swift::UInt32 v44 = *v42;
      v42 += 4;
      sub_100028C64((uint64_t)&v93, v43, v44);
      --v41;
    }
    while (v41);
  }
  swift_bridgeObjectRelease();
  a1 = v87;
  a3 = 0;
  if (sub_10001883C() & 1) == 0 || (uint64_t v9 = v86, (sub_10002EA58()))
  {

    return;
  }
  id v45 = objc_allocWithZone(*(Class *)(v15 + 2680));
  NSString v46 = sub_10002E8E8();
  unint64_t v15 = (unint64_t)objc_msgSend(v45, v18[155], v46);

  [(id)v15 setResultType:2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000483D0);
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_10002FE90;
  *(void *)(v47 + 32) = 0xD00000000000001BLL;
  *(void *)(v47 + 40) = 0x8000000100032420;
  *(void *)(v47 + 88) = &type metadata for String;
  *(void *)(v47 + 56) = &type metadata for String;
  *(void *)(v47 + 64) = 0xD000000000000018;
  *(void *)(v47 + 72) = 0x8000000100032180;
  Class isa = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  [(id)v15 setPropertiesToFetch:isa];

  sub_1000049A0(0, &qword_1000483D8);
  unint64_t v89 = sub_10002EBA8();
  if (v89 >> 62)
  {
LABEL_60:
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_10002ED38();
    uint64_t v82 = (void *)v15;
    if (v49) {
      goto LABEL_46;
    }
LABEL_61:
    id v51 = _swiftEmptyArrayStorage;
    goto LABEL_62;
  }
  uint64_t v49 = *(void *)((v89 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v82 = (void *)v15;
  if (!v49) {
    goto LABEL_61;
  }
LABEL_46:
  if (v49 < 1) {
    __break(1u);
  }
  uint64_t v50 = 0;
  id v51 = _swiftEmptyArrayStorage;
  do
  {
    if ((v89 & 0xC000000000000001) != 0) {
      id v53 = (id)sub_10002ED08();
    }
    else {
      id v53 = *(id *)(v89 + 8 * v50 + 32);
    }
    id v54 = v53;
    *(void *)&v92[0] = v53;
    uint64_t v55 = a3;
    sub_1000259FC((void **)v92, (uint64_t)&v93);

    if ((BYTE12(v93) & 1) == 0)
    {
      uint64_t v56 = v93;
      int v57 = DWORD2(v93);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v51 = sub_1000130B4(0, v51[2] + 1, 1, v51);
      }
      unint64_t v59 = v51[2];
      unint64_t v58 = v51[3];
      if (v59 >= v58 >> 1) {
        id v51 = sub_1000130B4((void *)(v58 > 1), v59 + 1, 1, v51);
      }
      v51[2] = v59 + 1;
      uint64_t v52 = &v51[2 * v59];
      v52[4] = v56;
      *((_DWORD *)v52 + 10) = v57;
      a3 = v55;
      uint64_t v9 = v86;
      a1 = v87;
    }
    ++v50;
  }
  while (v49 != v50);
LABEL_62:
  swift_bridgeObjectRelease_n();
  uint64_t v60 = v51[2];
  if (v60)
  {
    Swift::String v61 = (Swift::UInt32 *)(v51 + 5);
    Swift::String v62 = v85;
    do
    {
      Swift::UInt64 v63 = *((void *)v61 - 1);
      Swift::UInt32 v64 = *v61;
      v61 += 4;
      sub_100028C64((uint64_t)&v93, v63, v64);
      --v60;
    }
    while (v60);
  }
  else
  {
    Swift::String v62 = v85;
  }
  swift_bridgeObjectRelease();
  uint64_t v65 = *v62;
  if (*(void *)(*(void *)v88 + 16) <= *(void *)(*v62 + 16) >> 3)
  {
    *(void *)&long long v93 = *v62;
    swift_bridgeObjectRetain();
    uint64_t v68 = swift_bridgeObjectRetain();
    sub_10002A200(v68);
    swift_bridgeObjectRelease();
    uint64_t v67 = (void *)v93;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = swift_bridgeObjectRetain();
    uint64_t v67 = sub_10002A37C(v66, v65);
    swift_bridgeObjectRelease();
  }
  sub_10002C864(*(void *)(a1 + 88), (uint64_t)v67, (uint64_t)&v95);
  swift_bridgeObjectRelease();
  sub_1000178D8((uint64_t)&v95);
  type metadata accessor for MapsSyncManagedCachedCuratedCollection();
  id v69 = [(id)swift_getObjCClassFromMetadata() fetchRequest];
  sub_1000049A0(0, &qword_100047A90);
  Class v70 = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  id v71 = [self orPredicateWithSubpredicates:v70];

  [v69 setPredicate:v71];
  id v72 = [objc_allocWithZone((Class)NSBatchDeleteRequest) initWithFetchRequest:v69];
  [v72 setResultType:2];
  *(void *)&long long v93 = 0;
  id v73 = [v83 executeRequest:v72 error:&v93];
  uint64_t v74 = (void *)v93;
  if (!v73)
  {
    id v78 = (id)v93;
    sub_10002E5F8();

    swift_willThrow();
    long long v106 = v95;
    char v107 = v96;
    sub_10002C998((uint64_t)&v106);
    long long v104 = v97;
    char v105 = v98;
    sub_10002C998((uint64_t)&v104);
    uint64_t v91 = v99;
    sub_10002C9D8((uint64_t)&v91);

    return;
  }
  uint64_t v75 = v73;
  self;
  uint64_t v76 = (void *)swift_dynamicCastObjCClass();
  if (v76)
  {
    id v77 = v74;
    if ([v76 result])
    {
      sub_10002EC48();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v92, 0, sizeof(v92));
    }
    BOOL v80 = v83;
    sub_10002C7DC((uint64_t)v92, (uint64_t)&v93);
    if (*((void *)&v94 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v81 = *(void *)&v92[0];
        *(void *)&long long v93 = 0;
        *((void *)&v93 + 1) = 0xE000000000000000;
        sub_10002ECD8(41);
        swift_bridgeObjectRelease();
        *(void *)&long long v93 = 0x20646567727550;
        *((void *)&v93 + 1) = 0xE700000000000000;
        *(void *)&v92[0] = v81;
        v108._uint64_t countAndFlagsBits = sub_10002ED78();
        sub_10002E948(v108);
        swift_bridgeObjectRelease();
        v109._uint64_t countAndFlagsBits = 0xD000000000000020;
        v109._object = (void *)0x8000000100032D20;
        sub_10002E948(v109);
        _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(v93, *((unint64_t *)&v93 + 1));
        swift_bridgeObjectRelease();
      }
      goto LABEL_81;
    }
  }
  else
  {
    id v79 = v74;

    long long v93 = 0u;
    long long v94 = 0u;
    BOOL v80 = v83;
  }
  sub_10000B3D0((uint64_t)&v93, &qword_100047A60);
LABEL_81:
  [v80 reset];

  long long v102 = v95;
  char v103 = v96;
  sub_10002C998((uint64_t)&v102);
  long long v100 = v97;
  char v101 = v98;
  sub_10002C998((uint64_t)&v100);
  uint64_t v90 = v99;
  sub_10002C9D8((uint64_t)&v90);
}

uint64_t sub_1000259FC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  *(void *)&long long v11 = 0xD00000000000001BLL;
  *((void *)&v11 + 1) = 0x8000000100032420;
  id v4 = objc_msgSend(v3, "__swift_objectForKeyedSubscript:", sub_10002EDC8());
  swift_unknownObjectRelease();
  if (v4)
  {
    sub_10002EC48();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_10002C7DC((uint64_t)&v11, (uint64_t)v13);
  if (!v14) {
    goto LABEL_12;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_13:
    uint64_t v6 = 0;
    int v9 = 0;
    char v8 = 1;
    goto LABEL_14;
  }
  uint64_t v6 = v10;
  *(void *)&long long v11 = 0xD000000000000018;
  *((void *)&v11 + 1) = 0x8000000100032180;
  id v7 = objc_msgSend(v3, "__swift_objectForKeyedSubscript:", sub_10002EDC8());
  swift_unknownObjectRelease();
  if (v7)
  {
    sub_10002EC48();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_10002C7DC((uint64_t)&v11, (uint64_t)v13);
  if (!v14)
  {
LABEL_12:
    uint64_t result = sub_10000B3D0((uint64_t)v13, &qword_100047A60);
    goto LABEL_13;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    goto LABEL_13;
  }
  char v8 = 0;
  int v9 = v10;
LABEL_14:
  *(void *)a2 = v6;
  *(_DWORD *)(a2 + 8) = v9;
  *(unsigned char *)(a2 + 12) = v8;
  return result;
}

int64_t sub_100025BE0(int64_t result, uint64_t a2)
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

void (*sub_100025C24(void (*result)(void)))(void)
{
  uint64_t v2 = *(void *)(v1 + 80);
  if (v2 == 0x8000000000000000)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = -v2;
    uint64_t v4 = -86400 * v2;
    if ((unsigned __int128)(v3 * (__int128)86400) >> 64 == v4 >> 63)
    {
      id v5 = result;
      uint64_t v6 = v1;
      id v7 = [objc_allocWithZone((Class)NSDate) initWithTimeIntervalSinceNow:(double)v4];
      __swift_instantiateConcreteTypeFromMangledName(&qword_100047558);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_100030580;
      sub_1000049A0(0, &qword_100047A90);
      *(void *)(v8 + 32) = sub_10002EA78();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_10002F990;
      *(void *)(v9 + 56) = sub_1000049A0(0, &qword_1000483B8);
      *(void *)(v9 + 64) = sub_10002C774();
      *(void *)(v9 + 32) = v7;
      id v10 = v7;
      *(void *)(v8 + 40) = sub_10002EA78();
      sub_10002E9B8();
      id v11 = objc_allocWithZone((Class)NSCompoundPredicate);
      Class isa = sub_10002E998().super.isa;
      swift_bridgeObjectRelease();
      id v13 = [v11 initWithType:2 subpredicates:isa];

      v5(0);
      id v14 = [(id)swift_getObjCClassFromMetadata() fetchRequest];
      [v14 setFetchBatchSize:*(void *)(v6 + 88)];
      [v14 setPredicate:v13];

      return (void (*)(void))v14;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100025E6C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = v2;
  unint64_t v5 = a2(0);
  id v6 = [(id)swift_getObjCClassFromMetadata() fetchRequest];
  [v6 setResultType:4];
  sub_1000049A0(0, &qword_100047A90);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100047A50);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10002F990;
  id v8 = [objc_allocWithZone((Class)NSDate) initWithTimeIntervalSinceNow:-172800.0];
  *(void *)(v7 + 56) = sub_1000049A0(0, &qword_1000483B8);
  *(void *)(v7 + 64) = sub_10002C774();
  *(void *)(v7 + 32) = v8;
  uint64_t v9 = (void *)sub_10002EA78();
  [v6 setPredicate:v9];

  double v10 = ceil((double)*(uint64_t *)(a1 + 16) * 0.25);
  if ((~*(void *)&v10 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v11 = (uint64_t)v10;
  uint64_t result = sub_10002EB98();
  if (result <= 0) {
    goto LABEL_9;
  }
  double v13 = ceil((double)result * 0.5);
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
  if (v13 < 9.22337204e18)
  {
    int64_t v11 = (uint64_t)v13;
    sub_10002ECD8(49);
    swift_bridgeObjectRelease();
    v20._uint64_t countAndFlagsBits = sub_10002ED78();
    sub_10002E948(v20);
    swift_bridgeObjectRelease();
    v21._object = (void *)0x8000000100032F60;
    v21._uint64_t countAndFlagsBits = 0xD000000000000011;
    sub_10002E948(v21);
    _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD00000000000001ELL, 0x8000000100032F40);
    swift_bridgeObjectRelease();
LABEL_9:
    swift_bridgeObjectRetain();
    sub_10002AF9C();
    uint64_t v9 = (void *)sub_100025BE0(v11, a1);
    uint64_t v3 = v14;
    a1 = v15;
    unint64_t v5 = v16;
    if ((v16 & 1) == 0)
    {
LABEL_10:
      uint64_t v17 = sub_10002B340((uint64_t)v9, v3, a1, v5);

LABEL_17:
      swift_unknownObjectRelease();
      return (uint64_t)v17;
    }
    sub_10002EDA8();
    swift_unknownObjectRetain_n();
    id v18 = (void *)swift_dynamicCastClass();
    if (!v18)
    {
      swift_unknownObjectRelease();
      id v18 = _swiftEmptyArrayStorage;
    }
    uint64_t v19 = v18[2];
    swift_release();
    if (!__OFSUB__(v5 >> 1, a1))
    {
      if (v19 == (v5 >> 1) - a1)
      {
        uint64_t v17 = (void *)swift_dynamicCastClass();

        if (!v17)
        {
          swift_unknownObjectRelease();
          uint64_t v17 = _swiftEmptyArrayStorage;
        }
        goto LABEL_17;
      }
      goto LABEL_22;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_10002621C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 mapItemStorage];
  id v3 = v1;
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_10002E6A8();
    unint64_t v7 = v6;

    id v8 = objc_allocWithZone((Class)GEOMapItemStorage);
    Class isa = sub_10002E698().super.isa;
    sub_1000135F0(v5, v7);
    id v10 = [v8 initWithData:isa];

    if (!v10) {
      goto LABEL_6;
    }
    id v3 = [v10 _identifier];

    if (!v3) {
      goto LABEL_6;
    }
    if ([v3 isValid]) {
      return v3;
    }
  }

LABEL_6:
  if ([v1 muid]) {
    return objc_msgSend(objc_allocWithZone((Class)GEOMapItemIdentifier), "initWithMUID:resultProviderID:coordinate:", objc_msgSend(v1, "muid"), 0, -180.0, -180.0);
  }
  else {
    return 0;
  }
}

id sub_100026378(void *a1)
{
  id v1 = a1;
  id v2 = [v1 mapItem];
  if (!v2) {
    goto LABEL_6;
  }
  id v3 = v2;
  id v4 = [v2 mapItemStorage];

  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = sub_10002E6A8();
  unint64_t v7 = v6;

  id v8 = objc_allocWithZone((Class)GEOMapItemStorage);
  sub_10001369C(v5, v7);
  Class isa = sub_10002E698().super.isa;
  sub_1000135F0(v5, v7);
  id v10 = [v8 initWithData:isa];

  sub_1000135F0(v5, v7);
  if (!v10) {
    return 0;
  }
  id v1 = [v10 _identifier];

  if (v1)
  {
    if (([v1 isValid] & 1) == 0)
    {
LABEL_6:

      return 0;
    }
  }
  return v1;
}

uint64_t sub_1000264B0(unint64_t a1, uint64_t a2)
{
  uint64_t v48 = a2;
  uint64_t v3 = sub_10002E718();
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  __chkstk_darwin(v3);
  id v45 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002E708();
  if (a1 >> 62) {
    goto LABEL_42;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v5)
  {
LABEL_3:
    unint64_t v6 = 0;
    unint64_t v7 = a1 & 0xC000000000000001;
    unint64_t v40 = a1 + 32;
    uint64_t v41 = a1 & 0xFFFFFFFFFFFFFF8;
    uint64_t v8 = v48 & 0xFFFFFFFFFFFFFF8;
    unint64_t v42 = a1 & 0xC000000000000001;
    uint64_t v43 = v48 & 0xFFFFFFFFFFFFFF8;
    if (v48 < 0) {
      uint64_t v8 = v48;
    }
    uint64_t v35 = v8;
    unint64_t v47 = v48 & 0xC000000000000001;
    uint64_t v9 = &off_100045000;
    unint64_t v44 = (unint64_t)v48 >> 62;
    uint64_t v38 = v5;
    unint64_t v39 = a1;
    while (1)
    {
      if (v7)
      {
        id v10 = (id)sub_10002ED08();
      }
      else
      {
        if (v6 >= *(void *)(v41 + 16)) {
          goto LABEL_41;
        }
        id v10 = *(id *)(v40 + 8 * v6);
      }
      int64_t v11 = v10;
      if (__OFADD__(v6++, 1)) {
        goto LABEL_40;
      }
      if ((objc_msgSend(v10, v9[239], v35) & 1) == 0) {
        break;
      }

LABEL_7:
      if (v6 == v5) {
        goto LABEL_43;
      }
    }
    Class isa = sub_10002E6C8().super.isa;
    [v11 setMapItemLastRefreshed:isa];

    unint64_t v46 = v6;
    if (!v44)
    {
      uint64_t v14 = *(void *)(v43 + 16);
      swift_bridgeObjectRetain();
      if (v14) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_10002ED38();
    if (!v14)
    {
LABEL_38:

      swift_bridgeObjectRelease();
      unint64_t v6 = v46;
      unint64_t v7 = v42;
      goto LABEL_7;
    }
LABEL_16:
    uint64_t v15 = 4;
    while (1)
    {
      uint64_t v16 = v15 - 4;
      if (v47)
      {
        uint64_t v17 = (void *)sub_10002ED08();
        uint64_t v18 = v15 - 3;
        if (__OFADD__(v16, 1)) {
          goto LABEL_39;
        }
      }
      else
      {
        uint64_t v17 = *(void **)(v48 + 8 * v15);
        swift_unknownObjectRetain();
        uint64_t v18 = v15 - 3;
        if (__OFADD__(v16, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          swift_bridgeObjectRetain();
          uint64_t v5 = sub_10002ED38();
          if (!v5) {
            goto LABEL_43;
          }
          goto LABEL_3;
        }
      }
      id v19 = v11;
      id v20 = [v19 mapItemStorage];
      if (!v20) {
        break;
      }
      Swift::String v21 = v20;
      uint64_t v22 = sub_10002E6A8();
      a1 = v23;

      id v24 = objc_allocWithZone((Class)GEOMapItemStorage);
      Class v25 = sub_10002E698().super.isa;
      sub_1000135F0(v22, a1);
      id v26 = [v24 initWithData:v25];

      if (!v26) {
        goto LABEL_29;
      }
      id v27 = [v26 _identifier];

      if (!v27) {
        goto LABEL_29;
      }
      id v28 = [v17 _identifier];
      if (!v28)
      {
        swift_unknownObjectRelease();

        goto LABEL_32;
      }
      Swift::UInt32 v29 = v28;
      a1 = sub_1000049A0(0, &qword_100048450);
      id v30 = v27;
      id v31 = v29;
      char v32 = sub_10002EBF8();

      if (v32) {
        goto LABEL_35;
      }
LABEL_31:
      swift_unknownObjectRelease();
LABEL_32:
      ++v15;
      if (v18 == v14)
      {

        swift_bridgeObjectRelease();
LABEL_36:
        uint64_t v5 = v38;
        a1 = v39;
        unint64_t v6 = v46;
        unint64_t v7 = v42;
        uint64_t v9 = &off_100045000;
        goto LABEL_7;
      }
    }

LABEL_29:
    a1 = (unint64_t)&off_100045000;
    if ([v19 muid])
    {
      id v33 = [v17 _muid];
      if (v33 == [v19 muid])
      {
LABEL_35:
        swift_bridgeObjectRelease();
        sub_1000287DC(v17);

        swift_unknownObjectRelease();
        goto LABEL_36;
      }
    }
    goto LABEL_31;
  }
LABEL_43:
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v45, v37);
}

uint64_t sub_100026904(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002E718();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  __chkstk_darwin(v4);
  uint64_t v49 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002E708();
  if (a1 >> 62) {
    goto LABEL_43;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v6)
  {
    while (1)
    {
      unint64_t v7 = 0;
      unint64_t v8 = a1 & 0xC000000000000001;
      unint64_t v44 = a1 + 32;
      uint64_t v45 = a1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
      unint64_t v46 = a1 & 0xC000000000000001;
      uint64_t v47 = a2 & 0xFFFFFFFFFFFFFF8;
      if (a2 < 0) {
        uint64_t v9 = a2;
      }
      uint64_t v39 = v9;
      unint64_t v51 = a2 & 0xC000000000000001;
      id v10 = &off_100045000;
      unint64_t v48 = (unint64_t)a2 >> 62;
      uint64_t v42 = v6;
      unint64_t v43 = a1;
      while (1)
      {
        if (v8)
        {
          id v11 = (id)sub_10002ED08();
        }
        else
        {
          if (v7 >= *(void *)(v45 + 16)) {
            goto LABEL_42;
          }
          id v11 = *(id *)(v44 + 8 * v7);
        }
        long long v12 = v11;
        if (__OFADD__(v7++, 1)) {
          goto LABEL_41;
        }
        if ((objc_msgSend(v11, v10[239], v39) & 1) == 0) {
          break;
        }

LABEL_7:
        if (v7 == v6) {
          goto LABEL_44;
        }
      }
      Class isa = sub_10002E6C8().super.isa;
      [v12 setMapItemLastRefreshed:isa];

      unint64_t v50 = v7;
      if (v48)
      {
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_10002ED38();
      }
      else
      {
        uint64_t v15 = *(void *)(v47 + 16);
        swift_bridgeObjectRetain();
      }
      unint64_t v16 = v51;
      uint64_t v52 = v15;
      if (!v15) {
        break;
      }
      uint64_t v17 = 4;
      a1 = v52;
      while (1)
      {
        uint64_t v18 = v17 - 4;
        if (!v16) {
          break;
        }
        id v19 = (void *)sub_10002ED08();
        uint64_t v20 = v17 - 3;
        if (__OFADD__(v18, 1)) {
          goto LABEL_40;
        }
LABEL_25:
        id v21 = v12;
        id v22 = [v21 mapItem];
        if (v22)
        {
          unint64_t v23 = v22;
          id v24 = [v22 mapItemStorage];

          if (v24)
          {
            uint64_t v25 = a2;
            uint64_t v26 = sub_10002E6A8();
            unint64_t v28 = v27;

            id v29 = objc_allocWithZone((Class)GEOMapItemStorage);
            Class v30 = sub_10002E698().super.isa;
            sub_1000135F0(v26, v28);
            id v31 = [v29 initWithData:v30];

            if (!v31) {
              goto LABEL_31;
            }
            id v32 = [v31 _identifier];

            a2 = v25;
            if (v32)
            {
              id v33 = [v19 _identifier];
              if (v33)
              {
                id v34 = v33;
                sub_1000049A0(0, &qword_100048450);
                id v35 = v32;
                id v36 = v34;
                char v37 = sub_10002EBF8();

                if (v37)
                {
                  a2 = v25;
                  swift_bridgeObjectRelease();
                  sub_100028618(v19);

                  swift_unknownObjectRelease();
                  goto LABEL_36;
                }
LABEL_31:
                swift_unknownObjectRelease();
                a2 = v25;
              }
              else
              {
                swift_unknownObjectRelease();
              }
            }
            else
            {
              swift_unknownObjectRelease();
            }
            unint64_t v16 = v51;
            a1 = v52;
            goto LABEL_19;
          }
        }
        swift_unknownObjectRelease();

LABEL_19:
        ++v17;
        if (v20 == a1)
        {

          swift_bridgeObjectRelease();
LABEL_36:
          uint64_t v6 = v42;
          a1 = v43;
          unint64_t v7 = v50;
          unint64_t v8 = v46;
          id v10 = &off_100045000;
          goto LABEL_7;
        }
      }
      id v19 = *(void **)(a2 + 8 * v17);
      swift_unknownObjectRetain();
      uint64_t v20 = v17 - 3;
      if (!__OFADD__(v18, 1)) {
        goto LABEL_25;
      }
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_10002ED38();
      if (!v6) {
        goto LABEL_44;
      }
    }

    swift_bridgeObjectRelease();
    unint64_t v7 = v50;
    unint64_t v8 = v46;
    goto LABEL_7;
  }
LABEL_44:
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v49, v41);
}

uint64_t sub_100026D64(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v41 = a3;
  uint64_t v5 = sub_10002E718();
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  __chkstk_darwin(v5);
  unint64_t v51 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002E708();
  if (a1 >> 62) {
    goto LABEL_43;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      unint64_t v9 = a1 & 0xC000000000000001;
      unint64_t v46 = a1 + 32;
      uint64_t v47 = a1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v10 = a2 & 0xFFFFFFFFFFFFFF8;
      unint64_t v48 = a1 & 0xC000000000000001;
      uint64_t v49 = a2 & 0xFFFFFFFFFFFFFF8;
      if (a2 < 0) {
        uint64_t v10 = a2;
      }
      v40[1] = v10;
      unint64_t v53 = a2 & 0xC000000000000001;
      id v11 = &off_100045000;
      unint64_t v50 = (unint64_t)a2 >> 62;
      uint64_t v44 = v7;
      unint64_t v45 = a1;
      while (1)
      {
        if (v9)
        {
          id v12 = (id)sub_10002ED08();
        }
        else
        {
          if (v8 >= *(void *)(v47 + 16)) {
            goto LABEL_42;
          }
          id v12 = *(id *)(v46 + 8 * v8);
        }
        double v13 = v12;
        if (__OFADD__(v8++, 1)) {
          goto LABEL_41;
        }
        if (([v12 v11[239]] & 1) == 0) {
          break;
        }

LABEL_7:
        if (v8 == v7) {
          goto LABEL_44;
        }
      }
      Class isa = sub_10002E6C8().super.isa;
      [v13 setMapItemLastRefreshed:isa];

      unint64_t v52 = v8;
      if (v50)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_10002ED38();
      }
      else
      {
        uint64_t v16 = *(void *)(v49 + 16);
        swift_bridgeObjectRetain();
      }
      unint64_t v17 = v53;
      uint64_t v54 = v16;
      if (!v16) {
        break;
      }
      uint64_t v18 = 4;
      a1 = v54;
      while (1)
      {
        uint64_t v19 = v18 - 4;
        if (!v17) {
          break;
        }
        uint64_t v20 = (void *)sub_10002ED08();
        uint64_t v21 = v18 - 3;
        if (__OFADD__(v19, 1)) {
          goto LABEL_40;
        }
LABEL_25:
        id v22 = v13;
        id v23 = [v22 mapItem];
        if (v23)
        {
          id v24 = v23;
          id v25 = [v23 mapItemStorage];

          if (v25)
          {
            uint64_t v26 = a2;
            uint64_t v27 = sub_10002E6A8();
            unint64_t v29 = v28;

            id v30 = objc_allocWithZone((Class)GEOMapItemStorage);
            Class v31 = sub_10002E698().super.isa;
            sub_1000135F0(v27, v29);
            id v32 = [v30 initWithData:v31];

            if (!v32) {
              goto LABEL_31;
            }
            id v33 = [v32 _identifier];

            a2 = v26;
            if (v33)
            {
              id v34 = [v20 _identifier];
              if (v34)
              {
                id v35 = v34;
                sub_1000049A0(0, &qword_100048450);
                id v36 = v33;
                id v37 = v35;
                char v38 = sub_10002EBF8();

                if (v38)
                {
                  a2 = v26;
                  swift_bridgeObjectRelease();
                  sub_100027D80(v20, v41);

                  swift_unknownObjectRelease();
                  goto LABEL_36;
                }
LABEL_31:
                swift_unknownObjectRelease();
                a2 = v26;
              }
              else
              {
                swift_unknownObjectRelease();
              }
            }
            else
            {
              swift_unknownObjectRelease();
            }
            unint64_t v17 = v53;
            a1 = v54;
            goto LABEL_19;
          }
        }
        swift_unknownObjectRelease();

LABEL_19:
        ++v18;
        if (v21 == a1)
        {

          swift_bridgeObjectRelease();
LABEL_36:
          uint64_t v7 = v44;
          a1 = v45;
          unint64_t v8 = v52;
          unint64_t v9 = v48;
          id v11 = &off_100045000;
          goto LABEL_7;
        }
      }
      uint64_t v20 = *(void **)(a2 + 8 * v18);
      swift_unknownObjectRetain();
      uint64_t v21 = v18 - 3;
      if (!__OFADD__(v19, 1)) {
        goto LABEL_25;
      }
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_10002ED38();
      if (!v7) {
        goto LABEL_44;
      }
    }

    swift_bridgeObjectRelease();
    unint64_t v8 = v52;
    unint64_t v9 = v48;
    goto LABEL_7;
  }
LABEL_44:
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v51, v43);
}

id sub_1000271CC(void (*a1)(void))
{
  a1(0);
  id v1 = [(id)swift_getObjCClassFromMetadata() fetchRequest];
  __swift_instantiateConcreteTypeFromMangledName(&qword_100047558);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100030580;
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100030590;
  sub_1000049A0(0, &qword_100047A90);
  *(void *)(v3 + 32) = sub_10002EA78();
  *(void *)(v3 + 40) = sub_10002EA78();
  *(void *)(v3 + 48) = sub_10002EA78();
  sub_10002E9B8();
  id v4 = objc_allocWithZone((Class)NSCompoundPredicate);
  Class isa = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithType:1 subpredicates:isa];

  *(void *)(v2 + 32) = v6;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100030590;
  *(void *)(v7 + 32) = sub_10002EA78();
  *(void *)(v7 + 40) = sub_10002EA78();
  *(void *)(v7 + 48) = sub_10002EA78();
  sub_10002E9B8();
  id v8 = objc_allocWithZone((Class)NSCompoundPredicate);
  Class v9 = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [v8 initWithType:1 subpredicates:v9];

  *(void *)(v2 + 40) = v10;
  sub_10002E9B8();
  id v11 = objc_allocWithZone((Class)NSCompoundPredicate);
  Class v12 = sub_10002E998().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithType:2 subpredicates:v12];

  [v1 setPredicate:v13];
  [v1 setFetchBatchSize:*(void *)(v15 + 88)];
  return v1;
}

uint64_t sub_1000274F4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10002ED38();
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_10;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v2; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_10002ED08();
    }
    else {
      id v5 = *(id *)(a1 + 8 * i + 32);
    }
    id v6 = v5;
    sub_100028054();
  }
LABEL_10:
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000275C8(uint64_t a1, unint64_t a2, void (*a3)(uint64_t, int64_t *), uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v8 = a5(0);
  unint64_t v9 = sub_10002EBA8();
  if (v5) {
    return a2;
  }
  a2 = v9;
  if (!(v9 >> 62))
  {
    int64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_4;
  }
  swift_bridgeObjectRetain();
  int64_t v10 = sub_10002ED38();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) == 0)
  {
LABEL_4:
    id v11 = sub_10002B0E4(0, v10);
    if (a3)
    {
      a3(v8, v11);
      swift_release();
    }
    return a2;
  }
  __break(1u);
  return result;
}

void *sub_1000276C4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(void), void (*a6)(void))
{
  if (__OFADD__(a1, a2))
  {
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  int64_t v10 = a6;
  unint64_t v8 = a4;
  uint64_t v7 = a1;
  uint64_t v21 = a5;
  if (*(void *)(a3 + 16) >= a1 + a2) {
    unint64_t v9 = a1 + a2;
  }
  else {
    unint64_t v9 = *(void *)(a3 + 16);
  }
  sub_10002ECD8(30);
  swift_bridgeObjectRelease();
  v22._uint64_t countAndFlagsBits = sub_10002ED78();
  sub_10002E948(v22);
  swift_bridgeObjectRelease();
  v23._uint64_t countAndFlagsBits = 540945696;
  v23._unint64_t object = (void *)0xE400000000000000;
  sub_10002E948(v23);
  v24._uint64_t countAndFlagsBits = sub_10002ED78();
  unint64_t object = (unint64_t)v24._object;
  sub_10002E948(v24);
  swift_bridgeObjectRelease();
  _sSo9OS_os_logC9mapssyncdE5debugyySSFZ_0(0xD000000000000016, 0x80000001000329B0);
  swift_bridgeObjectRelease();
  if ((uint64_t)v9 < v7) {
    goto LABEL_31;
  }
  unint64_t object = v8 >> 62;
  if (!(v8 >> 62))
  {
    uint64_t v11 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11 >= v7) {
      goto LABEL_8;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
LABEL_32:
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_10002ED38();
  swift_bridgeObjectRelease();
  if (v11 < v7) {
    goto LABEL_33;
  }
LABEL_8:
  if (v7 < 0)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (object)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_10002ED38();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v11 < (uint64_t)v9) {
    goto LABEL_35;
  }
  if ((v8 & 0xC000000000000001) != 0 && v9 != v7)
  {
    if (v9 > v7)
    {
      v10(0);
      Swift::Int v12 = v7;
      do
      {
        Swift::Int v13 = v12 + 1;
        sub_10002ECF8(v12);
        Swift::Int v12 = v13;
      }
      while (v9 != v13);
      goto LABEL_18;
    }
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
LABEL_18:
  if (object)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_10002ED48();
    int64_t v10 = v14;
    uint64_t v7 = v15;
    unint64_t v9 = v16;
    swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_23;
    }
LABEL_22:
    unint64_t v17 = sub_10002B1AC(v11, (uint64_t)v10, v7, v9, v21);
    goto LABEL_29;
  }
  uint64_t v11 = v8 & 0xFFFFFFFFFFFFFF8;
  int64_t v10 = (void (*)(void))((v8 & 0xFFFFFFFFFFFFFF8) + 32);
  unint64_t v9 = (2 * v9) | 1;
  swift_bridgeObjectRetain();
  if ((v9 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_23:
  sub_10002EDA8();
  swift_unknownObjectRetain_n();
  uint64_t v18 = (void *)swift_dynamicCastClass();
  if (!v18)
  {
    swift_unknownObjectRelease();
    uint64_t v18 = &_swiftEmptyArrayStorage;
  }
  uint64_t v19 = v18[2];
  swift_release();
  if (__OFSUB__(v9 >> 1, v7)) {
    goto LABEL_37;
  }
  if (v19 != (v9 >> 1) - v7)
  {
LABEL_38:
    swift_unknownObjectRelease();
    goto LABEL_22;
  }
  unint64_t v17 = (void *)swift_dynamicCastClass();
  if (!v17)
  {
    swift_unknownObjectRelease();
    unint64_t v17 = &_swiftEmptyArrayStorage;
  }
LABEL_29:
  swift_unknownObjectRelease();
  return v17;
}

id sub_1000279EC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 24);
  id result = [v1 hasChanges];
  if (result)
  {
    id v4 = 0;
    if ([v1 save:&v4])
    {
      return v4;
    }
    else
    {
      id v3 = v4;
      sub_10002E5F8();

      return (id)swift_willThrow();
    }
  }
  return result;
}

void sub_100027AAC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048480);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  if (a2)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
    unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v10 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    aBlock[4] = sub_10002CF14;
    aBlock[5] = v10;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027CE8;
    aBlock[3] = &block_descriptor_207;
    uint64_t v11 = _Block_copy(aBlock);
    swift_release();
    [a2 submitWithHandler:v11 networkActivity:0 queue:*(void *)(a3 + 48)];
    _Block_release(v11);
  }
}

uint64_t sub_100027C64(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048480);
    return sub_10002EA08();
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_100048480);
    return sub_10002EA18();
  }
}

uint64_t sub_100027CE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048488);
    uint64_t v4 = sub_10002E9A8();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_100027D80(void *a1, uint64_t a2)
{
  id v4 = [self mapItemStorageForGEOMapItem:a1 forUseType:a2];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v7 = sub_100028454();
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [v7 _clientAttributes];
    }
    else
    {
      id v9 = 0;
    }
    [v6 setClientAttributes:v9];
  }
  id v10 = v5;
  sub_10002853C(v5);
  swift_getObjectType();
  id v11 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithUnsignedLongLong:", objc_msgSend(a1, "_muid"));
  [v2 setMuid:v11];

  [a1 coordinate];
  id v13 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v12];
  [v2 setLatitude:v13];

  [a1 coordinate];
  id v15 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v14];
  [v2 setLongitude:v15];

  id v16 = [a1 addressObject];
  NSString v17 = v16;
  if (v16)
  {
    id v18 = [v16 fullAddressWithMultiline:0];

    if (v18)
    {
      sub_10002E8F8();

      NSString v17 = sub_10002E8E8();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v17 = 0;
    }
  }
  [v2 setMapItemAddress:v17];

  id v19 = [a1 name];
  [v2 setMapItemName:v19];

  sub_1000158A4(a1);
  NSString v20 = sub_10002E8E8();
  swift_bridgeObjectRelease();
  [v2 setMapItemCategory:v20];
}

void sub_100028054()
{
  id v1 = [v0 mapItem];
  if (!v1) {
    return;
  }
  uint64_t v2 = v1;
  id v3 = [v1 mapItemStorage];

  if (!v3) {
    return;
  }
  uint64_t v4 = sub_10002E6A8();
  unint64_t v6 = v5;

  id v7 = objc_allocWithZone((Class)GEOMapItemStorage);
  sub_10001369C(v4, v6);
  Class isa = sub_10002E698().super.isa;
  sub_1000135F0(v4, v6);
  id v24 = [v7 initWithData:isa];

  if (v24)
  {
    id v9 = [v0 muid];

    if (!v9)
    {
      id v10 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithUnsignedLongLong:", objc_msgSend(v24, "_muid"));
      [v0 setMuid:v10];
    }
    id v11 = [v0 latitude];

    if (!v11)
    {
      [v24 coordinate];
      id v13 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v12];
      [v0 setLatitude:v13];
    }
    id v14 = [v0 longitude];

    if (!v14)
    {
      [v24 coordinate];
      id v16 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v15];
      [v0 setLongitude:v16];
    }
    id v17 = [v0 mapItemAddress];
    if (!v17)
    {
      id v18 = [v24 addressObject];
      if (!v18)
      {
LABEL_15:
        id v21 = [v0 mapItemName];
        if (!v21)
        {
          id v21 = [v24 name];
          [v0 setMapItemName:v21];
        }

        id v22 = [v0 mapItemCategory];
        if (v22)
        {

          sub_1000135F0(v4, v6);
        }
        else
        {
          id v24 = v24;
          sub_10002B9CC(v24);

          NSString v23 = sub_10002E8E8();
          swift_bridgeObjectRelease();
          [v0 setMapItemCategory:v23];
          sub_1000135F0(v4, v6);
        }

        return;
      }
      id v17 = v18;
      id v19 = [v18 fullAddressWithMultiline:0];
      if (v19)
      {
        id v20 = v19;
        [v0 setMapItemAddress:v19];

        id v17 = v20;
      }
    }

    goto LABEL_15;
  }
  sub_1000135F0(v4, v6);
}

id sub_100028454()
{
  id v1 = [v0 mapItem];
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 mapItemStorage];

    if (v3)
    {
      uint64_t v4 = sub_10002E6A8();
      unint64_t v6 = v5;

      id v7 = objc_allocWithZone((Class)GEOMapItemStorage);
      sub_10001369C(v4, v6);
      Class isa = sub_10002E698().super.isa;
      sub_1000135F0(v4, v6);
      id v2 = [v7 initWithData:isa];

      sub_1000135F0(v4, v6);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_10002853C(void *a1)
{
  id v2 = [v1 mapItem];
  if (v2)
  {
    id v3 = v2;
    if (a1)
    {
      Class isa = (Class)[a1 data];
      if (isa)
      {
        uint64_t v5 = sub_10002E6A8();
        unint64_t v7 = v6;

        Class isa = sub_10002E698().super.isa;
        sub_1000135F0(v5, v7);
      }
    }
    else
    {
      Class isa = 0;
    }
    [v3 setMapItemStorage:isa];
  }
}

void sub_100028618(void *a1)
{
  id v3 = [self mapItemStorageForGEOMapItem:a1 forUseType:4];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = sub_100028454();
    if (v6)
    {
      unint64_t v7 = v6;
      id v8 = [v6 _clientAttributes];
    }
    else
    {
      id v8 = 0;
    }
    [v5 setClientAttributes:v8];
  }
  id v9 = v4;
  sub_10002853C(v4);
  id v10 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithUnsignedLongLong:", objc_msgSend(a1, "_muid"));
  [v1 setMuid:v10];

  [a1 coordinate];
  id v12 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v11];
  [v1 setLatitude:v12];

  [a1 coordinate];
  id v14 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v13];
  [v1 setLongitude:v14];
}

void sub_1000287DC(void *a1)
{
  id v3 = [self mapItemStorageForGEOMapItem:a1 forUseType:4];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = [v1 mapItemStorage];
    if (!v6) {
      goto LABEL_6;
    }
    unint64_t v7 = v6;
    uint64_t v8 = sub_10002E6A8();
    unint64_t v10 = v9;

    id v11 = objc_allocWithZone((Class)GEOMapItemStorage);
    sub_10001369C(v8, v10);
    Class isa = sub_10002E698().super.isa;
    sub_1000135F0(v8, v10);
    id v13 = [v11 initWithData:isa];

    sub_1000135F0(v8, v10);
    if (v13)
    {
      id v14 = [v13 _clientAttributes];
    }
    else
    {
LABEL_6:
      id v14 = 0;
    }
    [v5 setClientAttributes:v14];

    Class v15 = (Class)[v5 data];
    if (v15)
    {
      uint64_t v16 = sub_10002E6A8();
      unint64_t v18 = v17;

      Class v15 = sub_10002E698().super.isa;
      sub_1000135F0(v16, v18);
    }
  }
  else
  {
    Class v15 = 0;
  }
  [v1 setMapItemStorage:v15];

  objc_msgSend(v1, "setMuid:", objc_msgSend(a1, "_muid"));
  [a1 coordinate];
  id v20 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v19];
  [v1 setLatitude:v20];

  [a1 coordinate];
  id v22 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v21];
  [v1 setLongitude:v22];

  id v23 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInt:", objc_msgSend(a1, "_resultProviderID"));
  [v1 setResultProviderIdentifier:v23];
}

uint64_t sub_100028AB4(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10002EDF8();
  swift_bridgeObjectRetain();
  sub_10002E928();
  Swift::Int v8 = sub_10002EE28();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    id v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10002ED98() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_10002ED98() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100029370(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100028C64(uint64_t a1, Swift::UInt64 a2, Swift::UInt32 a3)
{
  uint64_t v7 = *v3;
  sub_10002EDF8();
  sub_10002EE18(a2);
  sub_10002EE08(a3);
  Swift::Int v8 = sub_10002EE28();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    while (1)
    {
      uint64_t v12 = *(void *)(v7 + 48) + 16 * v10;
      uint64_t v13 = *(void *)v12;
      int v14 = *(_DWORD *)(v12 + 8);
      if (v13 == a2 && v14 == a3) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t result = 0;
    uint64_t v18 = *(void *)(*v3 + 48) + 16 * v10;
    a2 = *(void *)v18;
    a3 = *(_DWORD *)(v18 + 8);
  }
  else
  {
LABEL_8:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_10002950C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v19;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
  }
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 8) = a3;
  return result;
}

uint64_t sub_100028DB0()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048340);
  uint64_t v3 = sub_10002ECB8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                id v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
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
      sub_10002EDF8();
      sub_10002E928();
      uint64_t result = sub_10002EE28();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

uint64_t sub_100029090()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E0);
  uint64_t result = sub_10002ECB8();
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
                id v1 = v0;
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
      uint64_t v18 = *(void *)(v2 + 48) + 16 * v14;
      Swift::UInt64 v19 = *(void *)v18;
      Swift::UInt32 v20 = *(_DWORD *)(v18 + 8);
      sub_10002EDF8();
      sub_10002EE18(v19);
      sub_10002EE08(v20);
      uint64_t result = sub_10002EE28();
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
      uint64_t v12 = *(void *)(v4 + 48) + 16 * v11;
      *(void *)uint64_t v12 = v19;
      *(_DWORD *)(v12 + 8) = v20;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

Swift::Int sub_100029370(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  int64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100028DB0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100029674();
      goto LABEL_22;
    }
    sub_1000299D0();
  }
  uint64_t v11 = *v4;
  sub_10002EDF8();
  sub_10002E928();
  uint64_t result = sub_10002EE28();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10002ED98(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10002EDD8();
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
          uint64_t result = sub_10002ED98();
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
  Swift::Int *v21 = v8;
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

Swift::Int sub_10002950C(Swift::Int result, Swift::UInt32 a2, unint64_t a3, char a4)
{
  Swift::UInt64 v7 = result;
  unint64_t v8 = *(void *)(*v4 + 16);
  unint64_t v9 = *(void *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0) {
    goto LABEL_15;
  }
  if (a4)
  {
    sub_100029090();
  }
  else
  {
    if (v9 > v8)
    {
      uint64_t result = (Swift::Int)sub_100029828();
      goto LABEL_15;
    }
    sub_100029C80();
  }
  uint64_t v10 = *v4;
  sub_10002EDF8();
  sub_10002EE18(v7);
  sub_10002EE08(a2);
  uint64_t result = sub_10002EE28();
  uint64_t v11 = -1 << *(unsigned char *)(v10 + 32);
  a3 = result & ~v11;
  if ((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v12 = ~v11;
    do
    {
      uint64_t v13 = *(void *)(v10 + 48) + 16 * a3;
      uint64_t v14 = *(void *)v13;
      int v15 = *(_DWORD *)(v13 + 8);
      if (v14 == v7 && v15 == a2) {
        goto LABEL_18;
      }
      a3 = (a3 + 1) & v12;
    }
    while (((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_15:
  uint64_t v17 = *v4;
  *(void *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v18 = *(void *)(v17 + 48) + 16 * a3;
  *(void *)uint64_t v18 = v7;
  *(_DWORD *)(v18 + 8) = a2;
  uint64_t v19 = *(void *)(v17 + 16);
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (!v20)
  {
    *(void *)(v17 + 16) = v21;
    return result;
  }
  __break(1u);
LABEL_18:
  uint64_t result = sub_10002EDD8();
  __break(1u);
  return result;
}

void *sub_100029674()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048340);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10002ECA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
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

void *sub_100029828()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10002ECA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
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
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void *)v17;
    LODWORD(v17) = *(_DWORD *)(v17 + 8);
    uint64_t v19 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v19 = v18;
    *(_DWORD *)(v19 + 8) = v17;
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

uint64_t sub_1000299D0()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048340);
  uint64_t v3 = sub_10002ECB8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
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
    sub_10002EDF8();
    swift_bridgeObjectRetain();
    sub_10002E928();
    uint64_t result = sub_10002EE28();
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
    id v1 = v0;
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

uint64_t sub_100029C80()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E0);
  uint64_t result = sub_10002ECB8();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
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
    uint64_t v18 = *(void *)(v2 + 48) + 16 * v14;
    Swift::UInt64 v19 = *(void *)v18;
    Swift::UInt32 v20 = *(_DWORD *)(v18 + 8);
    sub_10002EDF8();
    sub_10002EE18(v19);
    sub_10002EE08(v20);
    uint64_t result = sub_10002EE28();
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
    uint64_t v12 = *(void *)(v4 + 48) + 16 * v11;
    *(void *)uint64_t v12 = v19;
    *(_DWORD *)(v12 + 8) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    uint64_t result = swift_release();
    id v1 = v0;
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

unint64_t sub_100029F2C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10002EC78(*(void *)(v2 + 40));
  return sub_100029FF8(a1, v4);
}

_OWORD *sub_100029F70(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100029F80(uint64_t a1, uint64_t a2)
{
  sub_10002EDF8();
  sub_10002E928();
  Swift::Int v4 = sub_10002EE28();
  return sub_10002A11C(a1, a2, v4);
}

unint64_t sub_100029FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10002A0C0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10002EC88();
      sub_10000B2CC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10002A0C0(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_10002A11C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10002ED98() & 1) == 0)
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
      while (!v14 && (sub_10002ED98() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10002A200(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v11 >= v7) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    uint64_t result = sub_10002A760(*(void *)(*(void *)(v2 + 48) + 16 * v10), *(_DWORD *)(*(void *)(v2 + 48) + 16 * v10 + 8));
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

void *sub_10002A37C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (*(void *)(a2 + 16))
  {
    int64_t v4 = 0;
    uint64_t v6 = a1 + 56;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v36 = ~v7;
    if (-v7 < 64) {
      uint64_t v8 = ~(-1 << -(char)v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & v5;
    int64_t v37 = (unint64_t)(63 - v7) >> 6;
    uint64_t v10 = a2 + 56;
    do
    {
LABEL_6:
      if (v9)
      {
        unint64_t v11 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v12 = v11 | (v4 << 6);
      }
      else
      {
        int64_t v13 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_39;
        }
        if (v13 >= v37) {
          goto LABEL_36;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v13);
        int64_t v15 = v4 + 1;
        if (!v14)
        {
          int64_t v15 = v4 + 2;
          if (v4 + 2 >= v37) {
            goto LABEL_36;
          }
          unint64_t v14 = *(void *)(v6 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v4 + 3;
            if (v4 + 3 >= v37) {
              goto LABEL_36;
            }
            unint64_t v14 = *(void *)(v6 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v4 + 4;
              if (v4 + 4 >= v37) {
                goto LABEL_36;
              }
              unint64_t v14 = *(void *)(v6 + 8 * v15);
              if (!v14)
              {
                int64_t v16 = v4 + 5;
                if (v4 + 5 >= v37)
                {
LABEL_36:
                  swift_bridgeObjectRetain();
                  sub_10002CA04();
                  return (void *)v2;
                }
                unint64_t v14 = *(void *)(v6 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      break;
                    }
                    if (v15 >= v37) {
                      goto LABEL_36;
                    }
                    unint64_t v14 = *(void *)(v6 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_23;
                    }
                  }
LABEL_39:
                  __break(1u);
                }
                int64_t v15 = v4 + 5;
              }
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v4 = v15;
      }
      uint64_t v17 = *(void *)(a1 + 48) + 16 * v12;
      Swift::UInt64 v18 = *(void *)v17;
      Swift::UInt32 v19 = *(_DWORD *)(v17 + 8);
      sub_10002EDF8();
      sub_10002EE18(v18);
      sub_10002EE08(v19);
      Swift::Int v20 = sub_10002EE28();
      uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v22 = v20 & ~v21;
    }
    while (((*(void *)(v10 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0);
    while (1)
    {
      uint64_t v23 = *(void *)(v2 + 48) + 16 * v22;
      uint64_t v24 = *(void *)v23;
      int v25 = *(_DWORD *)(v23 + 8);
      if (v24 == v18 && v25 == v19) {
        break;
      }
      unint64_t v22 = (v22 + 1) & ~v21;
      if (((*(void *)(v10 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
        goto LABEL_6;
      }
    }
    v38[0] = a1;
    v38[1] = v6;
    id v38[2] = v36;
    v38[3] = v4;
    v38[4] = v9;
    unint64_t v27 = (unint64_t)(63 - v21) >> 6;
    size_t v28 = 8 * v27;
    uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v27 <= 0x80 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      __chkstk_darwin(isStackAllocationSafe);
      Class v31 = (char *)&v36 - v30;
      memcpy((char *)&v36 - v30, (const void *)(v2 + 56), v28);
      Swift::Int v32 = sub_10002A8B4((Swift::Int)v31, v27, v2, v22, v38);
      swift_release();
      sub_10002CA04();
      return (void *)v32;
    }
    else
    {
      id v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v28);
      Swift::Int v34 = sub_10002A8B4((Swift::Int)v33, v27, v2, v22, v38);
      swift_release();
      sub_10002CA04();
      swift_slowDealloc();
      return (void *)v34;
    }
  }
  else
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
}

uint64_t sub_10002A760(Swift::UInt64 a1, Swift::UInt32 a2)
{
  uint64_t v5 = *v2;
  sub_10002EDF8();
  sub_10002EE18(a1);
  sub_10002EE08(a2);
  Swift::Int v6 = sub_10002EE28();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
    return 0;
  }
  uint64_t v9 = ~v7;
  while (1)
  {
    uint64_t v10 = *(void *)(v5 + 48) + 16 * v8;
    uint64_t v11 = *(void *)v10;
    int v12 = *(_DWORD *)(v10 + 8);
    if (v11 == a1 && v12 == a2) {
      break;
    }
    unint64_t v8 = (v8 + 1) & v9;
    if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
      return 0;
    }
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v2;
  uint64_t v18 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_100029828();
    uint64_t v16 = v18;
  }
  uint64_t v14 = *(void *)(*(void *)(v16 + 48) + 16 * v8);
  sub_10002ADCC(v8);
  uint64_t *v2 = v18;
  swift_bridgeObjectRelease();
  return v14;
}

Swift::Int sub_10002A8B4(Swift::Int result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = (unint64_t *)result;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v9 = v8 - 1;
  uint64_t v10 = a3 + 56;
  while (2)
  {
    uint64_t v34 = v9;
    while (1)
    {
LABEL_4:
      int64_t v15 = a5[3];
      unint64_t v14 = a5[4];
      if (v14)
      {
        uint64_t v16 = (v14 - 1) & v14;
        unint64_t v17 = __clz(__rbit64(v14)) | (v15 << 6);
      }
      else
      {
        int64_t v18 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
          __break(1u);
          goto LABEL_38;
        }
        int64_t v19 = (unint64_t)(a5[2] + 64) >> 6;
        if (v18 >= v19)
        {
          int64_t v18 = a5[3];
LABEL_34:
          a5[3] = v18;
          a5[4] = 0;
          swift_retain();
          return sub_10002AB2C(v7, a2, v34, a3);
        }
        uint64_t v20 = a5[1];
        unint64_t v21 = *(void *)(v20 + 8 * v18);
        if (!v21)
        {
          if (v15 + 2 >= v19) {
            goto LABEL_34;
          }
          unint64_t v21 = *(void *)(v20 + 8 * (v15 + 2));
          if (v21)
          {
            int64_t v18 = v15 + 2;
          }
          else
          {
            if (v15 + 3 >= v19)
            {
              int64_t v18 = v15 + 2;
              goto LABEL_34;
            }
            unint64_t v21 = *(void *)(v20 + 8 * (v15 + 3));
            if (v21)
            {
              int64_t v18 = v15 + 3;
            }
            else
            {
              int64_t v18 = v15 + 4;
              if (v15 + 4 >= v19)
              {
                int64_t v18 = v15 + 3;
                goto LABEL_34;
              }
              unint64_t v21 = *(void *)(v20 + 8 * v18);
              if (!v21)
              {
                int64_t v18 = v19 - 1;
                int64_t v22 = v15 + 5;
                while (v19 != v22)
                {
                  unint64_t v21 = *(void *)(v20 + 8 * v22++);
                  if (v21)
                  {
                    int64_t v18 = v22 - 1;
                    goto LABEL_21;
                  }
                }
                goto LABEL_34;
              }
            }
          }
        }
LABEL_21:
        uint64_t v16 = (v21 - 1) & v21;
        unint64_t v17 = __clz(__rbit64(v21)) + (v18 << 6);
        int64_t v15 = v18;
      }
      uint64_t v23 = *(void *)(*a5 + 48) + 16 * v17;
      Swift::UInt64 v24 = *(void *)v23;
      Swift::UInt32 v25 = *(_DWORD *)(v23 + 8);
      a5[3] = v15;
      a5[4] = v16;
      sub_10002EDF8();
      sub_10002EE18(v24);
      sub_10002EE08(v25);
      uint64_t result = sub_10002EE28();
      uint64_t v26 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v27 = result & ~v26;
      if ((*(void *)(v10 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27))
      {
        uint64_t v28 = ~v26;
        while (1)
        {
          uint64_t v29 = *(void *)(a3 + 48) + 16 * v27;
          uint64_t v30 = *(void *)v29;
          int v31 = *(_DWORD *)(v29 + 8);
          if (v30 == v24 && v31 == v25) {
            break;
          }
          unint64_t v27 = (v27 + 1) & v28;
          if (((*(void *)(v10 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
            goto LABEL_4;
          }
        }
        uint64_t v11 = (v27 >> 3) & 0x1FFFFFFFFFFFFFF8;
        uint64_t v12 = 1 << v27;
        uint64_t v13 = *(unint64_t *)((char *)v7 + v11);
        *(unint64_t *)((char *)v7 + v11) = v13 & ~v12;
        if ((v13 & v12) != 0) {
          break;
        }
      }
    }
    uint64_t v9 = v34 - 1;
    if (__OFSUB__(v34, 1))
    {
LABEL_38:
      __break(1u);
      return result;
    }
    if (v34 != 1) {
      continue;
    }
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_10002AB2C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1000483E0);
  uint64_t result = sub_10002ECC8();
  uint64_t v8 = (unsigned char *)result;
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
    uint64_t v17 = *(void *)(v4 + 48) + 16 * v13;
    Swift::UInt64 v18 = *(void *)v17;
    Swift::UInt32 v19 = *(_DWORD *)(v17 + 8);
    sub_10002EDF8();
    sub_10002EE18(v18);
    sub_10002EE08(v19);
    uint64_t result = sub_10002EE28();
    uint64_t v20 = -1 << v8[32];
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
    uint64_t v28 = *((void *)v8 + 6) + 16 * v23;
    *(void *)uint64_t v28 = v18;
    *(_DWORD *)(v28 + 8) = v19;
    ++*((void *)v8 + 2);
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

unint64_t sub_10002ADCC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_10002EC68();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = 16 * v6;
        uint64_t v11 = *(void *)(v3 + 48) + 16 * v6;
        Swift::UInt64 v12 = *(void *)v11;
        Swift::UInt32 v13 = *(_DWORD *)(v11 + 8);
        sub_10002EDF8();
        sub_10002EE18(v12);
        sub_10002EE08(v13);
        unint64_t v14 = sub_10002EE28() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v14 < v9) {
            goto LABEL_5;
          }
        }
        else if (v14 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v14)
        {
LABEL_11:
          uint64_t v15 = *(void *)(v3 + 48);
          uint64_t v16 = (_OWORD *)(v15 + 16 * v2);
          uint64_t v17 = (_OWORD *)(v15 + v10);
          if (16 * v2 != v10 || (int64_t v2 = v6, v16 >= v17 + 1))
          {
            *uint64_t v16 = *v17;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void sub_10002AF9C()
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
        uint64_t v10 = *(void *)(v1 + 32 + 8 * v4);
        uint64_t v11 = *(void *)(v1 + 32 + 8 * v8);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v1 = sub_10002B9B8(v1);
        }
        unint64_t v12 = *(void *)(v1 + 16);
        if (v4 >= v12) {
          goto LABEL_20;
        }
        *(void *)(v1 + 32 + 8 * v4) = v11;
        if (v8 >= v12) {
          goto LABEL_21;
        }
        *(void *)(v1 + 32 + 8 * v8) = v10;
        *uint64_t v0 = v1;
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

int64_t *sub_10002B0E4(int64_t *result, int64_t a2)
{
  uint64_t v2 = a2 - (void)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    if (!v2) {
      return (int64_t *)&_swiftEmptyArrayStorage;
    }
    int64_t v4 = (int64_t)result;
    if (v2 <= 0)
    {
      uint64_t v5 = (int64_t *)&_swiftEmptyArrayStorage;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048350);
      uint64_t v5 = (int64_t *)swift_allocObject();
      int64_t v6 = _swift_stdlib_malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      v5[2] = v2;
      v5[3] = 2 * (v7 >> 3);
    }
    uint64_t result = sub_10002B60C(v8, v5 + 4, v2, v4, a2);
    if (result == (int64_t *)v2) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

void *sub_10002B1AC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(void))
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v6) {
      return &_swiftEmptyArrayStorage;
    }
    uint64_t v10 = v6;
    if (v6 <= 0)
    {
      uint64_t v11 = &_swiftEmptyArrayStorage;
      if (v5 != a3)
      {
LABEL_7:
        if (v6 < 0) {
          goto LABEL_19;
        }
        unint64_t v14 = a2 + 8 * a3;
        if (v14 < (unint64_t)&v11[v10 + 4] && (unint64_t)(v11 + 4) < v14 + v10 * 8) {
          goto LABEL_19;
        }
        a5(0);
        swift_arrayInitWithCopy();
        return v11;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_100047558);
      uint64_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v6;
      v11[3] = (2 * (v13 >> 3)) | 1;
      if (v5 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = (void *)sub_10002ED68();
  __break(1u);
  return result;
}

char *sub_10002B340(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return (char *)_swiftEmptyArrayStorage;
    }
    uint64_t v8 = 8 * v5;
    if (v5 <= 0)
    {
      unint64_t v9 = (char *)_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        int64_t v12 = v9 + 32;
        uint64_t v13 = (char *)(a2 + 8 * a3);
        if (v13 < &v9[v8 + 32] && v12 < &v13[v8]) {
          goto LABEL_19;
        }
        memcpy(v12, v13, 8 * v5);
        return v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048350);
      unint64_t v9 = (char *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      *((void *)v9 + 2) = v5;
      *((void *)v9 + 3) = 2 * (v11 >> 3);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = (char *)sub_10002ED68();
  __break(1u);
  return result;
}

uint64_t sub_10002B4AC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048350);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
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
  uint64_t result = sub_10002ED68();
  __break(1u);
  return result;
}

int64_t *sub_10002B60C(int64_t *result, int64_t *a2, uint64_t a3, int64_t a4, int64_t a5)
{
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
LABEL_6:
    int64_t v5 = a4;
LABEL_7:
    *uint64_t result = a4;
    result[1] = a5;
    result[2] = v5;
    return (int64_t *)a3;
  }
  if (a3 < 0) {
    goto LABEL_31;
  }
  if (a5 == a4)
  {
LABEL_5:
    a3 = 0;
    goto LABEL_6;
  }
  if (a5 < a4) {
    goto LABEL_32;
  }
  int64_t v6 = a5 - a4;
  if (a5 > a4)
  {
    int64_t v5 = a4 + 1;
    *a2 = a4;
    if (a3 == 1) {
      goto LABEL_7;
    }
    if (v5 == a5)
    {
      a3 = 1;
      int64_t v5 = a5;
      goto LABEL_7;
    }
    unint64_t v7 = v6 - 2;
    if (v6 - 2 >= (unint64_t)(a3 - 2)) {
      unint64_t v7 = a3 - 2;
    }
    if (v7 >= ~a4 + a5) {
      unint64_t v7 = ~a4 + a5;
    }
    unint64_t v8 = v7 + 1;
    if (v8 >= 5)
    {
      uint64_t v11 = v8 & 3;
      if ((v8 & 3) == 0) {
        uint64_t v11 = 4;
      }
      unint64_t v12 = v8 - v11;
      int64_t v13 = v5 + v8 - v11;
      int64_t v10 = &a2[v8 - v11];
      uint64_t v9 = v12 + 2;
      int64x2_t v14 = vaddq_s64(vdupq_n_s64(v5), (int64x2_t)xmmword_1000305A0);
      uint64_t v15 = (int64x2_t *)(a2 + 3);
      int64x2_t v16 = vdupq_n_s64(2uLL);
      do
      {
        v15[-1] = v14;
        *uint64_t v15 = vaddq_s64(v14, v16);
        int64x2_t v14 = vaddq_s64(v14, vdupq_n_s64(4uLL));
        v15 += 2;
        v12 -= 4;
      }
      while (v12);
      int64_t v5 = v13;
    }
    else
    {
      uint64_t v9 = 2;
      int64_t v10 = a2;
    }
    uint64_t v17 = v10 + 1;
    while (v5 < a5)
    {
      int64_t v18 = v5 + 1;
      int64_t *v17 = v5;
      if (a3 == v9)
      {
        ++v5;
        goto LABEL_7;
      }
      ++v9;
      ++v17;
      ++v5;
      if (a5 == v18)
      {
        int64_t v5 = a5;
        a3 = a5 - a4;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10002B74C(uint64_t a1)
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

uint64_t sub_10002B7EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_10002B74C(a2);
  if (v8) {
    goto LABEL_19;
  }
  int v9 = *(_DWORD *)(a2 + 36);
  if (v9 != v7)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v10 = 1 << *(unsigned char *)(a2 + 32);
  if (v10 < result)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 16))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v11 = *(void *)(a1 + 8);
  if (v9 != v11) {
    goto LABEL_15;
  }
  if (*(void *)a1 < result)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 40))
  {
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v9 != v12) {
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(a1 + 24);
  if (v10 < v13)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  *(void *)a3 = *(void *)a1;
  *(void *)(a3 + 8) = v11;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = v13;
  *(void *)(a3 + 32) = v12;
  *(unsigned char *)(a3 + 40) = 0;
  *(void *)(a3 + 48) = a2;
  return swift_bridgeObjectRetain();
}

int64_t sub_10002B8D4(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_10002B9B8(uint64_t a1)
{
  return sub_10002B4AC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

id sub_10002B9CC(void *a1)
{
  uint64_t v24 = sub_10002E618();
  v21[0] = *(void *)(v24 - 8);
  uint64_t v2 = __chkstk_darwin(v24);
  unint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)v21 - v5;
  uint64_t v30 = &_swiftEmptySetSingleton;
  id v7 = [a1 _place];
  id v8 = [v7 firstBusiness];

  id v9 = [v8 localizedCategories];
  if (!v9)
  {
    sub_1000049A0(0, (unint64_t *)&unk_100048310);
    id v9 = (id)sub_10002EBB8();
  }
  sub_10002EBC8();

  sub_10002E608();
  if (!v29)
  {
LABEL_16:
    (*(void (**)(char *, uint64_t))(v21[0] + 8))(v6, v24);
    uint64_t v28 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_100047F38);
    sub_10002C4A4((unint64_t *)&qword_100048320, &qword_100047F38);
    sub_10000B320();
    uint64_t v20 = sub_10002E978();
    swift_bridgeObjectRelease();
    return (id)v20;
  }
  uint64_t v10 = sub_1000049A0(0, (unint64_t *)&unk_100048330);
  unint64_t v22 = (void (**)(char *, uint64_t))(v21[0] + 8);
  uint64_t v23 = v10;
  v21[1] = (char *)&type metadata for Any + 8;
  while (1)
  {
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_6;
    }
    unint64_t v11 = v6;
    id v12 = v26;
    id v13 = [v26 localizedNames];
    if (!v13)
    {
      sub_1000049A0(0, (unint64_t *)&unk_100048310);
      id v13 = (id)sub_10002EBB8();
    }
    sub_10002EBC8();

    sub_10002E608();
    if (v27) {
      break;
    }
LABEL_5:
    (*v22)(v4, v24);

    uint64_t v6 = v11;
LABEL_6:
    sub_10002E608();
    if (!v29) {
      goto LABEL_16;
    }
  }
  sub_1000049A0(0, &qword_100047F40);
  while ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    sub_10002E608();
    if (!v27) {
      goto LABEL_5;
    }
  }
  id v14 = v25;
  id result = [v25 name];
  if (result)
  {
    int64x2_t v16 = result;
    Swift::Int v17 = sub_10002E8F8();
    Swift::Int v19 = v18;

    sub_100028AB4((Swift::Int *)&v25, v17, v19);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002BDB0@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002BF0C((uint64_t (*)(void))type metadata accessor for MapsSyncManagedCollectionPlaceItem, a1);
}

void *sub_10002BDDC@<X0>(void *a1@<X8>)
{
  return sub_10002CDA8((void (*)(void))type metadata accessor for MapsSyncManagedCollectionPlaceItem, (void (*)(void))type metadata accessor for MapsSyncManagedCollectionPlaceItem, a1);
}

uint64_t sub_10002BE1C()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002BE54()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002BE64()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

id sub_10002BEA4()
{
  return sub_1000279EC(v0);
}

id sub_10002BEC0()
{
  return [*(id *)(v0 + 24) reset];
}

uint64_t sub_10002BED0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002BEE0@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002BF0C((uint64_t (*)(void))type metadata accessor for MapsSyncManagedFavoriteItem, a1);
}

uint64_t sub_10002BF0C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000275C8(*(void *)(v2 + 16), *(void *)(v2 + 24), *(void (**)(uint64_t, int64_t *))(v2 + 32), *(void *)(v2 + 40), a1);
  if (!v3)
  {
    *a2 = result;
    a2[1] = v6;
  }
  return result;
}

void *sub_10002BF44@<X0>(void *a1@<X8>)
{
  return sub_10002CDA8((void (*)(void))type metadata accessor for MapsSyncManagedFavoriteItem, (void (*)(void))type metadata accessor for MapsSyncManagedFavoriteItem, a1);
}

uint64_t sub_10002BF84()
{
  return sub_1000274F4(*(void *)(v0 + 16));
}

uint64_t sub_10002BFA0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002BFB0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002BFC0(void *a1)
{
  uint64_t v15 = a1;
  uint64_t v2 = sub_10002EAD8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002EAB8();
  __chkstk_darwin(v6);
  uint64_t v7 = sub_10002E848();
  __chkstk_darwin(v7 - 8);
  *(void *)(v1 + 32) = 0;
  v14[5] = sub_1000049A0(0, (unint64_t *)&unk_100048360);
  sub_10002E838();
  int64x2_t v16 = &_swiftEmptyArrayStorage;
  v14[3] = sub_10002CFB0((unint64_t *)&unk_1000470F0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  v14[2] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_100048370);
  v14[4] = sub_10002C4A4((unint64_t *)&qword_100047100, (uint64_t *)&unk_100048370);
  sub_10002EC58();
  uint64_t v8 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v9 = v3 + 104;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v14[1] = v9;
  v10(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  *(void *)(v1 + 40) = sub_10002EB08();
  sub_10002E838();
  int64x2_t v16 = &_swiftEmptyArrayStorage;
  sub_10002EC58();
  v10(v5, v8, v2);
  *(void *)(v1 + 48) = sub_10002EB08();
  *(void *)(v1 + 56) = GEOConfigGetInteger();
  *(void *)(v1 + 64) = GEOConfigGetInteger();
  *(void *)(v1 + 72) = GEOConfigGetInteger();
  *(void *)(v1 + 80) = GEOConfigGetInteger();
  *(void *)(v1 + 88) = GEOConfigGetInteger();
  *(unsigned char *)(v1 + 96) = GEOConfigGetBOOL();
  *(unsigned char *)(v1 + 97) = GEOConfigGetBOOL();
  *(unsigned char *)(v1 + 98) = GEOConfigGetBOOL();
  *(unsigned char *)(v1 + 99) = GEOConfigGetBOOL();
  *(unsigned char *)(v1 + 100) = GEOConfigGetBOOL();
  *(unsigned char *)(v1 + 101) = GEOConfigGetBOOL();
  *(unsigned char *)(v1 + 102) = GEOConfigGetBOOL();
  *(_OWORD *)(v1 + 104) = xmmword_1000305B0;
  unint64_t v11 = v15;
  *(void *)(v1 + 16) = v15;
  id v12 = [v11 newBackgroundContext];
  *(void *)(v1 + 24) = v12;
  [v12 setAutomaticallyMergesChangesFromParent:1];
  sub_100018734(0xD000000000000020, 0x8000000100032B30, (uint64_t)sub_10002C5B0, (uint64_t)&block_descriptor_77);
  sub_100018734(0xD000000000000021, 0x8000000100032A90, (uint64_t)sub_10002C4E8, (uint64_t)&block_descriptor_62);
  return v1;
}

uint64_t sub_10002C4A4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_10002C4E8(void *a1)
{
  return sub_100019EC8(a1, v1);
}

uint64_t sub_10002C4F4()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_1000140A4;
  *(void *)(v3 + 56) = v2;
  *(_OWORD *)(v3 + 40) = v4;
  return _swift_task_switch(sub_10001A0DC, 0, 0);
}

uint64_t sub_10002C5B0(void *a1)
{
  return sub_100018EB8(a1, v1);
}

uint64_t objectdestroy_64Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002C60C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_1000138A4;
  return sub_1000190A8(a1, v4, v5, v6, v7, v8);
}

uint64_t objectdestroy_68Tm()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002C718()
{
}

void sub_10002C75C()
{
  sub_10002466C(v0);
}

uint64_t sub_10002C764()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10002C774()
{
  unint64_t result = qword_1000483C0;
  if (!qword_1000483C0)
  {
    sub_1000049A0(255, &qword_1000483B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000483C0);
  }
  return result;
}

uint64_t sub_10002C7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_100047A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10002C844()
{
  sub_100024E74(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t sub_10002C864@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (result < 0)
  {
LABEL_16:
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    unint64_t result = sub_10002B74C(a2);
    int64_t v6 = result;
    uint64_t v8 = v7;
    char v10 = v9 & 1;
    if (v4)
    {
      uint64_t v11 = *(unsigned int *)(a2 + 36);
      uint64_t v12 = 1 << *(unsigned char *)(a2 + 32);
      while ((v10 & 1) == 0)
      {
        if (v11 != v8)
        {
          __break(1u);
          goto LABEL_16;
        }
        if (v6 == v12)
        {
          char v10 = 0;
          int64_t v6 = v12;
          uint64_t v8 = v11;
          goto LABEL_10;
        }
        unint64_t result = sub_10002B8D4(v6, v8, 0, a2);
        int64_t v6 = result;
        uint64_t v8 = v13;
        char v10 = v14 & 1;
        if (!--v4) {
          goto LABEL_10;
        }
      }
      goto LABEL_19;
    }
LABEL_10:
    unint64_t result = sub_10002B74C(a2);
    if (v10 & 1) != 0 || (v16) {
      goto LABEL_20;
    }
    if (v8 == v15)
    {
      if (v6 >= result)
      {
        v20[0] = result;
        v20[1] = v15;
        char v21 = 0;
        int64_t v22 = v6;
        uint64_t v23 = v8;
        char v24 = 0;
        unint64_t result = sub_10002B7EC((uint64_t)v20, a2, (uint64_t)v18);
        long long v17 = v18[1];
        *(_OWORD *)a3 = v18[0];
        *(_OWORD *)(a3 + 16) = v17;
        *(_OWORD *)(a3 + 32) = v18[2];
        *(void *)(a3 + 48) = v19;
        return result;
      }
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_10002C998(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002C9CC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10002C9D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002CA04()
{
  return swift_release();
}

uint64_t sub_10002CA0C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10002CA18(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002CA4C(uint64_t a1)
{
  return a1;
}

void sub_10002CA78()
{
  sub_100023A48(v0);
}

uint64_t sub_10002CA80()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_10002CAF4()
{
  sub_100024034(v0);
}

uint64_t sub_10002CAFC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CB0C(uint64_t a1, uint64_t a2)
{
  return sub_100025E6C(a2, (uint64_t (*)(void))type metadata accessor for MapsSyncManagedCollectionPlaceItem);
}

id sub_10002CB3C@<X0>(void *a1@<X8>)
{
  return sub_10002CC3C(a1);
}

uint64_t sub_10002CB58()
{
  return sub_100026D64(*(void *)(v0 + 16), *(void *)(v0 + 24), 6);
}

uint64_t sub_10002CB78()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002CB88(uint64_t a1)
{
  sub_100027AAC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10002CB90()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CBA0(uint64_t a1, uint64_t a2)
{
  return sub_100025E6C(a2, (uint64_t (*)(void))type metadata accessor for MapsSyncManagedHistoryPlaceItem);
}

uint64_t sub_10002CBD0@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002BF0C((uint64_t (*)(void))type metadata accessor for MapsSyncManagedHistoryPlaceItem, a1);
}

void *sub_10002CBFC@<X0>(void *a1@<X8>)
{
  return sub_10002CDA8((void (*)(void))type metadata accessor for MapsSyncManagedHistoryPlaceItem, (void (*)(void))type metadata accessor for MapsSyncManagedHistoryPlaceItem, a1);
}

id sub_10002CC3C@<X0>(void *a1@<X8>)
{
  id result = sub_100026378(*(void **)(v1 + 16));
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_10002CC70()
{
  return sub_100026904(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10002CC78()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CC88()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CC98(uint64_t a1, uint64_t a2)
{
  return sub_100025E6C(a2, (uint64_t (*)(void))type metadata accessor for MapsSyncManagedFavoriteItem);
}

uint64_t sub_10002CCCC()
{
  return sub_100026D64(*(void *)(v0 + 16), *(void *)(v0 + 24), 5);
}

uint64_t sub_10002CCEC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CCFC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CD0C(uint64_t a1, uint64_t a2)
{
  return sub_100025E6C(a2, (uint64_t (*)(void))type metadata accessor for MapsSyncManagedReviewedPlace);
}

uint64_t sub_10002CD3C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002BF0C((uint64_t (*)(void))type metadata accessor for MapsSyncManagedReviewedPlace, a1);
}

void *sub_10002CD68@<X0>(void *a1@<X8>)
{
  return sub_10002CDA8((void (*)(void))type metadata accessor for MapsSyncManagedReviewedPlace, (void (*)(void))type metadata accessor for MapsSyncManagedReviewedPlace, a1);
}

void *sub_10002CDA8@<X0>(void (*a1)(void)@<X0>, void (*a2)(void)@<X1>, void *a3@<X8>)
{
  id result = sub_1000276C4(*(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), a1, a2);
  if (!v4) {
    *a3 = result;
  }
  return result;
}

id sub_10002CDE4@<X0>(void *a1@<X8>)
{
  id result = sub_10002621C(*(void **)(v1 + 16));
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t objectdestroy_117Tm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CE58()
{
  return sub_1000264B0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10002CE60()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CE70()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CE80()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_100048480);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002CF14(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_100048480);
  return sub_100027C64(a1, a2);
}

void sub_10002CF98()
{
  sub_100023574(v0);
}

uint64_t sub_10002CFA0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002CFB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002CFF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_memcpy12_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for MapsSyncDaemonPeriodicActivityHandler.CuratedCollectionId(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MapsSyncDaemonPeriodicActivityHandler.CuratedCollectionId(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)uint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for MapsSyncDaemonPeriodicActivityHandler.CuratedCollectionId()
{
  return &type metadata for MapsSyncDaemonPeriodicActivityHandler.CuratedCollectionId;
}

unint64_t sub_10002D0D4()
{
  unint64_t result = qword_1000484A8;
  if (!qword_1000484A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000484A8);
  }
  return result;
}

id sub_10002D238()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapsSyncManagedSharedTripBlockedItem();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MapsSyncManagedSharedTripBlockedItem()
{
  return self;
}

Swift::String *MapsSyncErrorDomain.unsafeMutableAddressor()
{
  if (qword_1000470C0 != -1) {
    swift_once();
  }
  return &MapsSyncErrorDomain;
}

Swift::String *MapsSyncMapsGroupContainerIdentifier.unsafeMutableAddressor()
{
  return &MapsSyncMapsGroupContainerIdentifier;
}

Swift::String *MapsSyncAppLibraryDirectoryName.unsafeMutableAddressor()
{
  if (qword_1000470A8 != -1) {
    swift_once();
  }
  return &MapsSyncAppLibraryDirectoryName;
}

Swift::String *MapsSyncAppContainersDirectoryName.unsafeMutableAddressor()
{
  if (qword_1000470B0 != -1) {
    swift_once();
  }
  return &MapsSyncAppContainersDirectoryName;
}

Swift::String *MapsSyncMapsAppIdentifier.unsafeMutableAddressor()
{
  if (qword_100047080 != -1) {
    swift_once();
  }
  return &MapsSyncMapsAppIdentifier;
}

Swift::String *MapsSyncAppContainerDataDirectoryName.unsafeMutableAddressor()
{
  if (qword_1000470B8 != -1) {
    swift_once();
  }
  return &MapsSyncAppContainerDataDirectoryName;
}

Swift::String *MapsSyncModelName.unsafeMutableAddressor()
{
  if (qword_1000470D0 != -1) {
    swift_once();
  }
  return &MapsSyncModelName;
}

Swift::String *MapsSyncDaemonIdentifier.unsafeMutableAddressor()
{
  return &MapsSyncDaemonIdentifier;
}

Swift::String *MapsSyncNanoMapsAppIdentifier.unsafeMutableAddressor()
{
  return &MapsSyncNanoMapsAppIdentifier;
}

Swift::String *MapsSyncMapsAppProcessName.unsafeMutableAddressor()
{
  if (qword_100047090 != -1) {
    swift_once();
  }
  return &MapsSyncMapsAppProcessName;
}

Swift::String *MapsSyncNanoMapsProcessName.unsafeMutableAddressor()
{
  if (qword_100047098 != -1) {
    swift_once();
  }
  return &MapsSyncNanoMapsProcessName;
}

void sub_10002D514()
{
  HIBYTE(MapsSyncMapsAppIdentifier._object) = -18;
}

void sub_10002D544()
{
  MapsSyncMapsPushDaemonProcessName._uint64_t countAndFlagsBits = 0x687375707370616DLL;
  MapsSyncMapsPushDaemonProcessName._unint64_t object = (void *)0xE900000000000064;
}

Swift::String *MapsSyncMapsPushDaemonProcessName.unsafeMutableAddressor()
{
  if (qword_100047088 != -1) {
    swift_once();
  }
  return &MapsSyncMapsPushDaemonProcessName;
}

void sub_10002D5B8()
{
  MapsSyncMapsAppProcessName._uint64_t countAndFlagsBits = 1936744781;
  MapsSyncMapsAppProcessName._unint64_t object = (void *)0xE400000000000000;
}

void sub_10002D5D4()
{
  MapsSyncNanoMapsProcessName._uint64_t countAndFlagsBits = 0x7370614D6F6E614ELL;
  MapsSyncNanoMapsProcessName._unint64_t object = (void *)0xE800000000000000;
}

void sub_10002D5F8()
{
  MapsSyncMapsToolProcessName._uint64_t countAndFlagsBits = 0x6C6F6F747370616DLL;
  MapsSyncMapsToolProcessName._unint64_t object = (void *)0xE800000000000000;
}

Swift::String *MapsSyncMapsToolProcessName.unsafeMutableAddressor()
{
  if (qword_1000470A0 != -1) {
    swift_once();
  }
  return &MapsSyncMapsToolProcessName;
}

void sub_10002D668()
{
  MapsSyncAppLibraryDirectoryName._uint64_t countAndFlagsBits = 0x7972617262694CLL;
  MapsSyncAppLibraryDirectoryName._unint64_t object = (void *)0xE700000000000000;
}

void sub_10002D68C()
{
  MapsSyncAppContainersDirectoryName._uint64_t countAndFlagsBits = 0x656E6961746E6F43;
  MapsSyncAppContainersDirectoryName._unint64_t object = (void *)0xEA00000000007372;
}

void sub_10002D6B4()
{
  MapsSyncAppContainerDataDirectoryName._uint64_t countAndFlagsBits = 1635017028;
  MapsSyncAppContainerDataDirectoryName._unint64_t object = (void *)0xE400000000000000;
}

void sub_10002D6D0()
{
  HIWORD(MapsSyncErrorDomain._object) = -4864;
}

void sub_10002D700()
{
  HIBYTE(MapsSyncErrorDatabaseName._object) = -18;
}

Swift::String *MapsSyncErrorDatabaseName.unsafeMutableAddressor()
{
  if (qword_1000470C8 != -1) {
    swift_once();
  }
  return &MapsSyncErrorDatabaseName;
}

void sub_10002D77C()
{
  MapsSyncModelName._uint64_t countAndFlagsBits = 0x65646F4D61746144;
  MapsSyncModelName._unint64_t object = (void *)0xEF315F305F305F6CLL;
}

uint64_t sub_10002D7AC()
{
  uint64_t v0 = sub_10002E7C8();
  __swift_allocate_value_buffer(v0, qword_1000485D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1000485D0);
  if (qword_100047068 != -1) {
    swift_once();
  }
  id v1 = (id)static OS_os_log.Signpost;
  return sub_10002E7A8();
}

uint64_t sub_10002D83C(const char *a1, uint64_t a2, char a3, char a4)
{
  uint64_t v55 = sub_10002E798();
  uint64_t v57 = *(void *)(v55 - 8);
  uint64_t v7 = __chkstk_darwin(v55);
  char v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v54 = (char *)&v50 - v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v50 - v12;
  uint64_t v14 = sub_10002E7C8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  Swift::Int v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  char v21 = (char *)&v50 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v50 - v22;
  if (a4)
  {
    if (qword_1000470D8 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v14, (uint64_t)qword_1000485D0);
    id v25 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v25(v23, v24, v14);
    v25(v21, v24, v14);
    sub_10002E7B8();
    sub_10002E778();
    id v26 = (void (**)(char *, uint64_t))(v15 + 8);
    uint64_t v27 = *v26;
    (*v26)(v21, v14);
    uint64_t v28 = sub_10002E7B8();
    int v52 = sub_10002EB58();
    uint64_t result = sub_10002EC08();
    uint64_t v30 = v57;
    uint64_t v56 = v26;
    unint64_t v53 = v27;
    if ((result & 1) == 0)
    {

      uint64_t v38 = v55;
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v54, v13, v55);
LABEL_21:
      sub_10002E808();
      swift_allocObject();
      uint64_t v44 = sub_10002E7F8();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v38);
      unint64_t v45 = v23;
LABEL_28:
      v53(v45, v14);
      return v44;
    }
    if (a3)
    {
      if (!((unint64_t)a1 >> 32))
      {
        if (a1 >> 11 == 27)
        {
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
        if (a1 >> 16 <= 0x10)
        {
          int v31 = &v58;
          goto LABEL_20;
        }
        goto LABEL_33;
      }
      goto LABEL_31;
    }
    if (a1)
    {
      int v31 = a1;
LABEL_20:
      uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
      uint64_t v41 = v54;
      uint64_t v38 = v55;
      v40(v54, v13, v55);
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      os_signpost_id_t v43 = sub_10002E788();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, (os_signpost_type_t)v52, v43, v31, "enableTelemetry=YES", v42, 2u);
      uint64_t v30 = v57;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v30 + 8))(v41, v38);
      v40(v41, v13, v38);
      goto LABEL_21;
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (qword_1000470D8 != -1) {
    swift_once();
  }
  uint64_t v32 = __swift_project_value_buffer(v14, (uint64_t)qword_1000485D0);
  id v33 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v33(v18, v32, v14);
  v33(v21, v32, v14);
  sub_10002E7B8();
  sub_10002E778();
  uint64_t v34 = (void (**)(char *, uint64_t))(v15 + 8);
  id v35 = *v34;
  (*v34)(v21, v14);
  uint64_t v36 = sub_10002E7B8();
  int v52 = sub_10002EB58();
  uint64_t result = sub_10002EC08();
  uint64_t v37 = v57;
  uint64_t v56 = v34;
  unint64_t v53 = v35;
  if ((result & 1) == 0)
  {

    uint64_t v39 = v55;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v54, v9, v55);
LABEL_27:
    sub_10002E808();
    swift_allocObject();
    uint64_t v44 = sub_10002E7F8();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v39);
    unint64_t v45 = v18;
    goto LABEL_28;
  }
  if ((a3 & 1) == 0)
  {
    if (!a1) {
      goto LABEL_30;
    }
    unint64_t v51 = a1;
    goto LABEL_26;
  }
  if ((unint64_t)a1 >> 32)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (a1 >> 11 != 27)
  {
    if (a1 >> 16 > 0x10)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    unint64_t v51 = &v59;
LABEL_26:
    unint64_t v46 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
    uint64_t v47 = v54;
    uint64_t v39 = v55;
    v46(v54, v9, v55);
    unint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v48 = 0;
    os_signpost_id_t v49 = sub_10002E788();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, (os_signpost_type_t)v52, v49, v51, "", v48, 2u);
    uint64_t v37 = v57;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v37 + 8))(v47, v39);
    v46(v47, v9, v39);
    goto LABEL_27;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10002DE74(const char *a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, char a5)
{
  char v59 = (char *)a1;
  LODWORD(v56) = a3;
  uint64_t v6 = sub_10002E7D8();
  uint64_t v53 = *(void *)(v6 - 8);
  uint64_t v54 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  char v9 = &v51[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v51[-v10];
  uint64_t v12 = sub_10002E798();
  uint64_t v57 = *(void *)(v12 - 8);
  uint64_t v58 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = &v51[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v55 = &v51[-v17];
  __chkstk_darwin(v16);
  uint64_t v19 = &v51[-v18];
  uint64_t v20 = sub_10002E7C8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = &v51[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v22);
  id v26 = &v51[-v25];
  BOOL v27 = qword_1000470D8 == -1;
  if ((a5 & 1) == 0)
  {
LABEL_8:
    if (!v27) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v20, (uint64_t)qword_1000485D0);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v21 + 16))(v24, v30, v20);
    id v26 = sub_10002E7B8();
    sub_10002E7E8();
    int v31 = sub_10002EB48();
    uint64_t result = sub_10002EC08();
    if ((result & 1) == 0)
    {

      (*(void (**)(unsigned char *, uint64_t))(v57 + 8))(v15, v58);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v21 + 8))(v24, v20);
    }
    int v52 = v31;
    if ((v56 & 1) == 0)
    {
      if (!v59)
      {
        __break(1u);
LABEL_14:

        (*(void (**)(unsigned char *, uint64_t))(v57 + 8))(v19, v58);
        return (*(uint64_t (**)(NSObject *, uint64_t))(v21 + 8))(v26, v20);
      }
      goto LABEL_28;
    }
    if (!((unint64_t)v59 >> 32))
    {
      if (v59 >> 11 == 27)
      {
LABEL_39:
        __break(1u);
        return result;
      }
      if (v59 >> 16 <= 0x10)
      {
        char v59 = &v61;
LABEL_28:
        swift_retain();
        sub_10002E818();
        swift_release();
        uint64_t v36 = v53;
        uint64_t v35 = v54;
        if ((*(unsigned int (**)(NSObject *, uint64_t))(v53 + 88))(v9, v54) == enum case for OSSignpostError.doubleEnd(_:))
        {
          uint64_t v37 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(NSObject *, uint64_t))(v36 + 8))(v9, v35);
          uint64_t v37 = "";
        }
        uint64_t v56 = v37;
        uint64_t v45 = v57;
        uint64_t v46 = v58;
        uint64_t v47 = v55;
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v57 + 16))(v55, v15, v58);
        unint64_t v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v48 = 0;
        os_signpost_id_t v49 = sub_10002E788();
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, (os_signpost_type_t)v52, v49, v59, v56, v48, 2u);
        swift_slowDealloc();

        uint64_t v50 = *(void (**)(unsigned char *, uint64_t))(v45 + 8);
        v50(v15, v46);
        (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v24, v20);
        return ((uint64_t (*)(unsigned char *, uint64_t))v50)(v47, v46);
      }
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  if (qword_1000470D8 != -1) {
    swift_once();
  }
  uint64_t v28 = __swift_project_value_buffer(v20, (uint64_t)qword_1000485D0);
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v21 + 16))(v26, v28, v20);
  char v9 = sub_10002E7B8();
  sub_10002E7E8();
  uint64_t v15 = (unsigned char *)sub_10002EB48();
  uint64_t result = sub_10002EC08();
  if ((result & 1) == 0) {
    goto LABEL_14;
  }
  if (v56)
  {
    if ((unint64_t)v59 >> 32)
    {
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    if (v59 >> 11 == 27)
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v59 >> 16 > 0x10) {
      goto LABEL_36;
    }
    char v59 = &v60;
  }
  else if (!v59)
  {
    __break(1u);
    goto LABEL_8;
  }
  swift_retain();
  sub_10002E818();
  swift_release();
  uint64_t v33 = v53;
  uint64_t v32 = v54;
  int v34 = (*(uint64_t (**)(unsigned char *, uint64_t))(v53 + 88))(v11, v54);
  int v52 = (int)v15;
  if (v34 == enum case for OSSignpostError.doubleEnd(_:))
  {
    uint64_t v38 = "[Error] Interval already ended";
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v33 + 8))(v11, v32);
    uint64_t v38 = "enableTelemetry=YES";
  }
  uint64_t v56 = v38;
  uint64_t v39 = v57;
  uint64_t v40 = v58;
  uint64_t v41 = v55;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v57 + 16))(v55, v19, v58);
  uint64_t v42 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v42 = 0;
  os_signpost_id_t v43 = sub_10002E788();
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, (os_signpost_type_t)v52, v43, v59, v56, v42, 2u);
  swift_slowDealloc();

  uint64_t v44 = *(void (**)(unsigned char *, uint64_t))(v39 + 8);
  v44(v19, v40);
  (*(void (**)(NSObject *, uint64_t))(v21 + 8))(v26, v20);
  return ((uint64_t (*)(unsigned char *, uint64_t))v44)(v41, v40);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_10002E5E8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10002E5F8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10002E608()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_10002E618()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_10002E628()
{
  return URL.lastPathComponent.getter();
}

void sub_10002E638(NSURL *retstr@<X8>)
{
}

uint64_t sub_10002E648()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_10002E658()
{
  return URL.deletingLastPathComponent()();
}

uint64_t sub_10002E668()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002E678()
{
  return URL.path.getter();
}

uint64_t sub_10002E688()
{
  return type metadata accessor for URL();
}

NSData sub_10002E698()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10002E6A8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002E6B8()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_10002E6C8()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10002E6D8()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_10002E6E8()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_10002E6F8()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002E708()
{
  return Date.init()();
}

uint64_t sub_10002E718()
{
  return type metadata accessor for Date();
}

uint64_t sub_10002E728()
{
  return UUID.init(uuidString:)();
}

NSUUID sub_10002E738()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10002E748()
{
  return UUID.init()();
}

uint64_t sub_10002E758()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10002E768()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10002E778()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_10002E788()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_10002E798()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_10002E7A8()
{
  return OSSignposter.init(logHandle:)();
}

uint64_t sub_10002E7B8()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_10002E7C8()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_10002E7D8()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_10002E7E8()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_10002E7F8()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_10002E808()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_10002E818()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_10002E828()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10002E838()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10002E848()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10002E858()
{
  return static DispatchTime.now()();
}

uint64_t sub_10002E868()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10002E878()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_10002E888()
{
  return + infix(_:_:)();
}

uint64_t sub_10002E898()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary sub_10002E8A8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10002E8B8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002E8C8()
{
  return Dictionary.description.getter();
}

uint64_t sub_10002E8D8()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString sub_10002E8E8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10002E8F8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002E908()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10002E918()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_10002E928()
{
  return String.hash(into:)();
}

uint64_t sub_10002E938()
{
  return String.index(_:offsetBy:limitedBy:)();
}

void sub_10002E948(Swift::String a1)
{
}

uint64_t sub_10002E958()
{
  return String.init(cString:)();
}

uint64_t sub_10002E968()
{
  return String.subscript.getter();
}

uint64_t sub_10002E978()
{
  return Sequence<>.joined(separator:)();
}

uint64_t sub_10002E988()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10002E998()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10002E9A8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002E9B8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10002E9C8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10002E9D8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_10002E9E8()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_10002E9F8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10002EA08()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_10002EA18()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_10002EA28()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10002EA38()
{
  return type metadata accessor for TaskPriority();
}

void sub_10002EA48()
{
}

uint64_t sub_10002EA58()
{
  return static Task<>.isCancelled.getter();
}

uint64_t sub_10002EA68()
{
  return Double.write<A>(to:)();
}

uint64_t sub_10002EA78()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_10002EA88()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10002EA98()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10002EAA8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10002EAB8()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10002EAC8()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_10002EAD8()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10002EAE8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10002EAF8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10002EB08()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10002EB18()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t sub_10002EB28()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

void sub_10002EB38()
{
}

uint64_t sub_10002EB48()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_10002EB58()
{
  return static os_signpost_type_t.begin.getter();
}

void sub_10002EB68()
{
}

Swift::Int sub_10002EB78()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_10002EB88()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t sub_10002EB98()
{
  return NSManagedObjectContext.count<A>(for:)();
}

uint64_t sub_10002EBA8()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t sub_10002EBB8()
{
  return NSArray.init(arrayLiteral:)();
}

uint64_t sub_10002EBC8()
{
  return NSArray.makeIterator()();
}

NSNumber sub_10002EBD8(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_10002EBE8(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_10002EBF8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10002EC08()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_10002EC18()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10002EC28()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_10002EC38()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_10002EC48()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10002EC58()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10002EC68()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_10002EC78(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10002EC88()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10002EC98()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10002ECA8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10002ECB8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10002ECC8()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10002ECD8(Swift::Int a1)
{
}

uint64_t sub_10002ECE8()
{
  return Identifiable<>.id.getter();
}

void sub_10002ECF8(Swift::Int a1)
{
}

uint64_t sub_10002ED08()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10002ED18()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10002ED28()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10002ED38()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10002ED48()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_10002ED58()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10002ED68()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10002ED78()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10002ED88()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10002ED98()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10002EDA8()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10002EDC8()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_10002EDD8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10002EDE8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10002EDF8()
{
  return Hasher.init(_seed:)();
}

void sub_10002EE08(Swift::UInt32 a1)
{
}

void sub_10002EE18(Swift::UInt64 a1)
{
}

Swift::Int sub_10002EE28()
{
  return Hasher._finalize()();
}

uint64_t BSSelfTaskHasEntitlement()
{
  return _BSSelfTaskHasEntitlement();
}

uint64_t GEOConfigGetBOOL()
{
  return _GEOConfigGetBOOL();
}

uint64_t GEOConfigGetDouble()
{
  return _GEOConfigGetDouble();
}

uint64_t GEOConfigGetInteger()
{
  return _GEOConfigGetInteger();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void exit(int a1)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}