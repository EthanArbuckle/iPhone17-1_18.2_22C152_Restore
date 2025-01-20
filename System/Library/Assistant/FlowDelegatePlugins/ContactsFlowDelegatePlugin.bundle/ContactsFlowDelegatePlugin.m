uint64_t sub_5278@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unsigned char v5[24];

  v3 = v1 + 16;
  sub_7204(v3, (uint64_t)v5);
  return sub_6644(v3, a1, &qword_C128);
}

uint64_t sub_52C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5308(uint64_t a1)
{
  uint64_t v3 = v1 + 16;
  sub_71A0(v3, (uint64_t)v5);
  sub_565C(a1, v3, &qword_C128);
  return swift_endAccess();
}

uint64_t (*sub_535C(uint64_t a1))()
{
  sub_71A0(v1 + 16, a1);
  return j_j__swift_endAccess;
}

uint64_t sub_53A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + 136;
  sub_7204(v3, (uint64_t)v5);
  return sub_6644(v3, a1, &qword_C130);
}

uint64_t sub_53F4(uint64_t a1)
{
  uint64_t v3 = v1 + 136;
  sub_71A0(v3, (uint64_t)v5);
  sub_565C(a1, v3, &qword_C130);
  return swift_endAccess();
}

uint64_t (*sub_5448(uint64_t a1))()
{
  sub_71A0(v1 + 136, a1);
  return j__swift_endAccess;
}

uint64_t sub_5498(long long *a1, long long *a2, long long *a3, long long *a4)
{
  uint64_t v8 = swift_allocObject();
  sub_5500(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_5500(long long *a1, long long *a2, long long *a3, long long *a4)
{
  bzero((void *)(v4 + 16), 0xA0uLL);
  sub_5644(a1, (uint64_t)v11);
  sub_71A0(v4 + 16, (uint64_t)v10);
  sub_565C((uint64_t)v11, v4 + 16, &qword_C128);
  swift_endAccess();
  sub_5644(a2, (uint64_t)v11);
  sub_71A0(v4 + 136, (uint64_t)v10);
  sub_565C((uint64_t)v11, v4 + 136, &qword_C130);
  swift_endAccess();
  sub_5644(a3, (uint64_t)v11);
  sub_71A0(v4 + 56, (uint64_t)v10);
  sub_565C((uint64_t)v11, v4 + 56, &qword_C138);
  swift_endAccess();
  sub_5644(a4, (uint64_t)v11);
  sub_71A0(v4 + 96, (uint64_t)v10);
  sub_565C((uint64_t)v11, v4 + 96, &qword_C140);
  swift_endAccess();
  return v4;
}

uint64_t sub_5644(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_565C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_52C4(a3);
  sub_71D4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t sub_56B8()
{
  uint64_t v0 = swift_allocObject();
  sub_56F0();
  return v0;
}

uint64_t sub_56F0()
{
  uint64_t v1 = sub_7230();
  sub_7164();
  uint64_t v30 = v2;
  ((void (*)(void))__chkstk_darwin)();
  sub_7190();
  uint64_t v5 = v4 - v3;
  sub_52C4(&qword_C148);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v30 - v9;
  uint64_t v11 = sub_7270();
  sub_7164();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  sub_7190();
  v17 = (char *)(v16 - v15);
  uint64_t v31 = v0;
  sub_7400();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  bzero((void *)(v0 + 16), 0xA0uLL);
  v19 = self;
  id v20 = [v19 bundleForClass:ObjCClassFromMetadata];
  id v21 = [v20 resourceURL];
  if (v21)
  {
    v22 = v21;
    sub_7240();

    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = 1;
  }
  sub_5A64((uint64_t)v8, v23, 1, v11);
  sub_5A8C((uint64_t)v8, (uint64_t)v10);
  if (sub_5AF4((uint64_t)v10, 1, v11) == 1)
  {
    sub_6804((uint64_t)v10, &qword_C148);
    sub_7390();
    type metadata accessor for ContactsFlowDelegatePlugin();
    id v24 = [v19 bundleForClass:swift_getObjCClassFromMetadata()];
    sub_7380();
    v25 = v20;
  }
  else
  {
    uint64_t v32 = 0x6574616C706D6554;
    unint64_t v33 = 0xE900000000000073;
    uint64_t v26 = v30;
    (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v5, enum case for URL.DirectoryHint.inferFromPath(_:), v1);
    sub_5B40();
    v25 = v20;
    sub_7260();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v5, v1);
    swift_bridgeObjectRelease();
    v27 = *(void (**)(char *, uint64_t))(v13 + 8);
    v27(v10, v11);
    sub_7250(1);
    v27(v17, v11);
    sub_7390();
    type metadata accessor for ContactsFlowDelegatePlugin();
    id v24 = [v19 bundleForClass:swift_getObjCClassFromMetadata()];
    sub_7370();
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = v31;

  return v28;
}

uint64_t sub_5A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_5A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_52C4(&qword_C148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_5AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t type metadata accessor for ContactsFlowDelegatePlugin()
{
  return self;
}

unint64_t sub_5B40()
{
  unint64_t result = qword_C150;
  if (!qword_C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C150);
  }
  return result;
}

uint64_t sub_5B8C@<X0>(void (*a1)(uint64_t, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  void (*v34)(long long *__return_ptr, uint64_t);
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(void);
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  void (*v48)(void);
  void (*v49)(void);
  uint64_t (*v50)(void);
  void v52[5];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  long long v61;
  uint64_t v62;
  char v63[24];
  long long v64;
  uint64_t v65;
  char v66[24];
  long long v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;

  uint64_t v3 = v2;
  v56 = a1;
  v60 = a2;
  v55 = sub_74F0();
  sub_7164();
  v54 = v4;
  __chkstk_darwin(v5);
  sub_721C();
  sub_71F4();
  __chkstk_darwin(v6);
  v52[3] = (char *)v52 - v7;
  uint64_t v8 = sub_7340();
  sub_7164();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_721C();
  sub_71F4();
  __chkstk_darwin(v12);
  sub_71F4();
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v52 - v14;
  uint64_t v16 = sub_7420();
  sub_7164();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  sub_7190();
  uint64_t v22 = v21 - v20;
  v59 = sub_74A0();
  sub_7164();
  v58 = v23;
  __chkstk_darwin(v24);
  sub_7190();
  uint64_t v27 = v26 - v25;
  sub_7410();
  v57 = v27;
  sub_74B0();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v16);
  uint64_t v28 = *(void (**)(void))(v10 + 16);
  sub_71B8();
  v28();
  LODWORD(v22) = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v15, v8);
  LODWORD(v18) = enum case for Parse.NLv3IntentOnly(_:);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  uint64_t v30 = v10 + 8;
  v29 = v31;
  uint64_t v32 = ((uint64_t (*)(char *, uint64_t))v31)(v15, v8);
  if (v22 == v18)
  {
    v52[1] = v30;
    uint64_t v33 = v52[4];
    v34 = *(void (**)(long long *__return_ptr, uint64_t))(*(void *)v3 + 184);
    v52[0] = v3;
    v34(&v67, v32);
    if (v68)
    {
      sub_5644(&v67, (uint64_t)&v69);
    }
    else
    {
      v70 = &type metadata for FindMyFriendFlowProvider;
      v71 = (void *)sub_6748();
      v69 = swift_allocObject();
      sub_7290();
      sub_6804((uint64_t)&v67, &qword_C130);
    }
    sub_66A0(&v69, (uint64_t)v70);
    if (sub_7460())
    {
      v56 = v29;
      sub_709C((uint64_t)&v69);
      sub_7480();
      sub_71B8();
      v28();
      v35 = sub_74E0();
      v36 = sub_7520();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        v53 = swift_slowAlloc();
        v69 = v53;
        *(_DWORD *)v37 = 136315138;
        v52[0] = v37 + 4;
        sub_71B8();
        v28();
        v38 = sub_7500();
        *(void *)&v67 = sub_6854(v38, v39, &v69);
        sub_7530();
        swift_bridgeObjectRelease();
        sub_71C8();
        v40();
        _os_log_impl(&dword_0, v35, v36, "[ContactsFlowDelegatePlugin] SiriFindMy provided a flow for parse: %s", v37, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v56(v33, v8);
      }

      sub_71E4();
      sub_71C8();
      v49();
      sub_72B0();
      swift_release();
      goto LABEL_25;
    }
    sub_709C((uint64_t)&v69);
    uint64_t v3 = v52[0];
  }
  sub_7204(v3 + 56, (uint64_t)v66);
  sub_6644(v3 + 56, (uint64_t)&v67, &qword_C138);
  if (v68)
  {
    sub_5644(&v67, (uint64_t)&v69);
  }
  else
  {
    v41 = (void *)sub_7440();
    swift_allocObject();
    v42 = sub_7430();
    v70 = v41;
    v71 = &protocol witness table for PluginPrewarmProvider;
    v69 = v42;
    sub_6804((uint64_t)&v67, &qword_C138);
  }
  sub_7204(v3 + 96, (uint64_t)v63);
  sub_6644(v3 + 96, (uint64_t)&v64, &qword_C140);
  if (v65)
  {
    sub_5644(&v64, (uint64_t)&v67);
  }
  else
  {
    sub_7320();
    sub_6804((uint64_t)&v64, &qword_C140);
  }
  sub_66A0(&v67, v68);
  v43 = sub_7330();
  if (v44)
  {
    sub_7480();
    v45 = sub_74E0();
    v46 = sub_7520();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_0, v45, v46, "[ContactsFlowDelegatePlugin] Prewarming plugin...", v47, 2u);
      swift_slowDealloc();
    }

    sub_71E4();
    sub_71C8();
    v48();
    sub_66A0(&v69, (uint64_t)v70);
    sub_7450();
    v43 = swift_bridgeObjectRelease();
  }
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v3 + 112))(&v61, v43);
  if (v62)
  {
    sub_5644(&v61, (uint64_t)&v64);
  }
  else
  {
    sub_63F8((uint64_t *)&v64);
    sub_6804((uint64_t)&v61, &qword_C128);
  }
  sub_66E4((uint64_t)&v64, (uint64_t)&v61);
  sub_73E0();
  swift_allocObject();
  *(void *)&v61 = sub_73D0();
  sub_7054(&qword_C158, 255, (void (*)(uint64_t))&type metadata accessor for ContactsDelegateFlow);
  sub_72A0();
  swift_release();
  sub_72B0();
  swift_release();
  sub_709C((uint64_t)&v64);
  sub_709C((uint64_t)&v67);
  sub_709C((uint64_t)&v69);
LABEL_25:
  sub_7490();
  sub_71C8();
  return v50();
}

uint64_t sub_63F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_73B0();
  __chkstk_darwin(v2 - 8);
  sub_7190();
  sub_74D0();
  sub_74C0();
  sub_7350();
  sub_73C0();
  sub_73A0();
  sub_7360();
  sub_7470();
  sub_73A0();
  sub_7360();
  sub_7310();
  uint64_t v3 = sub_7400();
  swift_allocObject();
  uint64_t result = sub_73F0();
  a1[3] = v3;
  a1[4] = (uint64_t)&protocol witness table for FlowFactory;
  *a1 = result;
  return result;
}

uint64_t sub_6524()
{
  sub_6804(v0 + 16, &qword_C128);
  sub_6804(v0 + 56, &qword_C138);
  sub_6804(v0 + 96, &qword_C140);
  sub_6804(v0 + 136, &qword_C130);
  return v0;
}

uint64_t sub_657C()
{
  sub_6524();

  return _swift_deallocClassInstance(v0, 176, 7);
}

uint64_t sub_65B0()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 224))();
}

uint64_t sub_65F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 216))();
  *a1 = result;
  return result;
}

uint64_t sub_6644(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_52C4(a3);
  sub_71D4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

void *sub_66A0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_66E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_6748()
{
  unint64_t result = qword_C160;
  if (!qword_C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C160);
  }
  return result;
}

uint64_t sub_6794()
{
  sub_709C(v0 + 16);
  sub_709C(v0 + 56);
  sub_709C(v0 + 96);
  sub_709C(v0 + 136);
  sub_709C(v0 + 176);
  sub_709C(v0 + 216);
  sub_709C(v0 + 256);
  sub_709C(v0 + 312);

  return _swift_deallocObject(v0, 352, 7);
}

uint64_t sub_6804(uint64_t a1, uint64_t *a2)
{
  sub_52C4(a2);
  sub_71D4();
  sub_71C8();
  v3();
  return a1;
}

uint64_t sub_6854(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_6928(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_70EC((uint64_t)v12, *a3);
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
      sub_70EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_709C((uint64_t)v12);
  return v7;
}

uint64_t sub_6928(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_6A80((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_7540();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_6B58(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_7560();
    if (!v8)
    {
      uint64_t result = sub_7570();
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

void *sub_6A80(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_7580();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_6B58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_6BF0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6DCC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6DCC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_6BF0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_7510();
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
  unint64_t v3 = sub_6D64(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_7550();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_7580();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_7570();
  __break(1u);
  return result;
}

void *sub_6D64(uint64_t a1, uint64_t a2)
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
  sub_52C4((uint64_t *)&unk_C2A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_6DCC(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_52C4((uint64_t *)&unk_C2A0);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_6F7C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_6EA4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_6EA4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_7580();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_6F7C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_7580();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_700C(uint64_t a1, uint64_t a2)
{
  return sub_7054(&qword_C168, a2, (void (*)(uint64_t))type metadata accessor for ContactsFlowDelegatePlugin);
}

uint64_t sub_7054(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_709C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_70EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_714C()
{
}

double sub_7180@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_71A0(uint64_t a1, uint64_t a2)
{
  return _swift_beginAccess(a1, a2, 33, 0);
}

void sub_71F4()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_7204(uint64_t a1, uint64_t a2)
{
  return _swift_beginAccess(a1, a2, 0, 0);
}

uint64_t sub_7230()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_7240()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_7250(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_7260()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_7270()
{
  return type metadata accessor for URL();
}

uint64_t sub_7280()
{
  return FindMyFriendFlowProvider.makeFlow(parse:)();
}

uint64_t sub_7290()
{
  return FindMyFriendFlowProvider.init()();
}

uint64_t sub_72A0()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_72B0()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_72C0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_72D0()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_72E0()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_72F0(Swift::String refId)
{
}

void sub_7300()
{
}

uint64_t sub_7310()
{
  return static SiriKitEventSender.current.getter();
}

uint64_t sub_7320()
{
  return static AceService.currentAsync.getter();
}

uint64_t sub_7330()
{
  return dispatch thunk of AceServiceInvokerAsync.currentStartRequestId()();
}

uint64_t sub_7340()
{
  return type metadata accessor for Parse();
}

uint64_t sub_7350()
{
  return static Device.current.getter();
}

uint64_t sub_7360()
{
  return CATWrapper.__allocating_init(options:globals:)();
}

uint64_t sub_7370()
{
  return static CATExecutor.registerBundle(bundle:templateDir:)();
}

uint64_t sub_7380()
{
  return static CATExecutor.registerBundle(bundle:)();
}

uint64_t sub_7390()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_73A0()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_73B0()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_73C0()
{
  return type metadata accessor for ContactsCommonCATs();
}

uint64_t sub_73D0()
{
  return ContactsDelegateFlow.init(flowFactory:)();
}

uint64_t sub_73E0()
{
  return type metadata accessor for ContactsDelegateFlow();
}

uint64_t sub_73F0()
{
  return FlowFactory.init(referenceResolver:deviceState:commonCATs:modifyAttributeCATs:sirikitEventSender:)();
}

uint64_t sub_7400()
{
  return type metadata accessor for FlowFactory();
}

uint64_t sub_7410()
{
  return static SignpostName.makeFlowForParse.getter();
}

uint64_t sub_7420()
{
  return type metadata accessor for SignpostName();
}

uint64_t sub_7430()
{
  return PluginPrewarmProvider.init()();
}

uint64_t sub_7440()
{
  return type metadata accessor for PluginPrewarmProvider();
}

uint64_t sub_7450()
{
  return dispatch thunk of PluginPrewarmProviding.prewarm(refId:)();
}

uint64_t sub_7460()
{
  return dispatch thunk of FindMyFriendFlowProviding.makeFlow(parse:)();
}

uint64_t sub_7470()
{
  return type metadata accessor for ModifyContactAttributeCATs();
}

uint64_t sub_7480()
{
  return static Logger.siriContacts.getter();
}

void sub_7490()
{
}

uint64_t sub_74A0()
{
  return type metadata accessor for Signpost.OpenSignpost();
}

uint64_t sub_74B0()
{
  return static Signpost.begin(_:)();
}

uint64_t sub_74C0()
{
  return ReferenceResolutionClient.__allocating_init()();
}

uint64_t sub_74D0()
{
  return type metadata accessor for ReferenceResolutionClient();
}

uint64_t sub_74E0()
{
  return Logger.logObject.getter();
}

uint64_t sub_74F0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_7500()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_7510()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_7520()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_7530()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_7540()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_7550()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_7560()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_7570()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_7580()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}