uint64_t sub_24A7777A4()
{
  uint64_t v0;

  v0 = sub_24A779C60();
  __swift_allocate_value_buffer(v0, qword_2697B99D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697B99D8);
  return sub_24A779C50();
}

void Logger.ifError(_:message:)(void *a1)
{
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9958);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_24A77A230;
    swift_getErrorValue();
    MEMORY[0x24C5CF410](a1);
    uint64_t v3 = sub_24A779E90();
    uint64_t v5 = v4;
    *(void *)(v2 + 56) = MEMORY[0x263F8D310];
    *(void *)(v2 + 64) = sub_24A777A6C();
    *(void *)(v2 + 32) = v3;
    *(void *)(v2 + 40) = v5;
    uint64_t v6 = sub_24A779DB0();
    unint64_t v8 = v7;
    swift_bridgeObjectRetain();
    v9 = sub_24A779C40();
    os_log_type_t v10 = sub_24A779DF0();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      sub_24A777C7C(v6, v8, &v13);
      sub_24A779E00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A775000, v9, v10, "%s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CF4F0](v12, -1, -1);
      MEMORY[0x24C5CF4F0](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
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

unint64_t sub_24A777A6C()
{
  unint64_t result = qword_2697B9960;
  if (!qword_2697B9960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9960);
  }
  return result;
}

void Logger.ifErrorElse(_:message:debug:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (a1)
  {
    Logger.ifError(_:message:)(a1);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    oslog = sub_24A779C40();
    os_log_type_t v7 = sub_24A779DE0();
    if (os_log_type_enabled(oslog, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v11 = v9;
      *(_DWORD *)unint64_t v8 = 136315138;
      swift_bridgeObjectRetain();
      sub_24A777C7C(a4, a5, &v11);
      sub_24A779E00();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24A775000, oslog, v7, "%s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5CF4F0](v9, -1, -1);
      MEMORY[0x24C5CF4F0](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_24A777C7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24A777D50(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24A7783C0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_24A7783C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24A777D50(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24A779E10();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24A777F0C(a5, a6);
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
  uint64_t v8 = sub_24A779E30();
  if (!v8)
  {
    sub_24A779E40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24A779E50();
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

uint64_t sub_24A777F0C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24A777FA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24A778184(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24A778184(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24A777FA4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24A77811C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24A779E20();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24A779E40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24A779DC0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24A779E50();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24A779E40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24A77811C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9968);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A778184(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9968);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_24A779E50();
  __break(1u);
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_24A7783C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::Void __swiftcall registerWidgetViewDecoders()()
{
}

unint64_t sub_24A778454()
{
  unint64_t result = qword_26B1794A0;
  if (!qword_26B1794A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1794A0);
  }
  return result;
}

uint64_t sub_24A7784A8()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F086E0]);
  uint64_t v1 = (void *)sub_24A779DA0();
  id v2 = objc_msgSend(v0, sel_initWithPath_, v1);

  if (v2)
  {
    uint64_t v3 = (void *)sub_24A779DA0();
    unint64_t v4 = (objc_class *)objc_msgSend(v2, sel_classNamed_, v3);

    if (v4)
    {
      swift_getObjCClassMetadata();
      size_t v5 = &unk_26FE3F098;
      class_addProtocol(v4, (Protocol *)v5);

      return swift_dynamicCastTypeToObjCProtocolConditional();
    }
  }
  if (qword_2697B9950 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24A779C60();
  __swift_project_value_buffer(v7, (uint64_t)qword_2697B99D8);
  int64_t v8 = sub_24A779C40();
  os_log_type_t v9 = sub_24A779DD0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_24A775000, v8, v9, "AVTContactsWidgetCoordinator not available", v10, 2u);
    MEMORY[0x24C5CF4F0](v10, -1, -1);
  }

  return 0;
}

id sub_24A778678()
{
  uint64_t v1 = *v0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F296E0]), sel_init);
  uint64_t v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v3, sel_clearColor);
  objc_msgSend(v4, sel_setBackgroundColor_, v5);

  if (sub_24A7784A8())
  {
    objc_msgSend(objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init), sel_addAvatarDescriptor_forView_, v1, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_2697B9950 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24A779C60();
    __swift_project_value_buffer(v6, (uint64_t)qword_2697B99D8);
    uint64_t v7 = sub_24A779C40();
    os_log_type_t v8 = sub_24A779DF0();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl(&dword_24A775000, v7, v8, "No class found for AVTContactsWidgetCoordinator", v9, 2u);
      MEMORY[0x24C5CF4F0](v9, -1, -1);
    }
  }
  return v4;
}

id AnimatedMemojiView.makeUIView(context:)()
{
  return sub_24A778678();
}

unint64_t sub_24A77883C()
{
  unint64_t result = qword_2697B9970;
  if (!qword_2697B9970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9970);
  }
  return result;
}

id sub_24A778890()
{
  return sub_24A778678();
}

uint64_t sub_24A7788D8()
{
  return sub_24A779CE0();
}

uint64_t sub_24A77891C()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_24A778928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24A778A44();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_24A77898C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24A778A44();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

uint64_t sub_24A7789F0()
{
  return sub_24A779D90();
}

void sub_24A778A0C()
{
}

ValueMetadata *type metadata accessor for AnimatedMemojiView()
{
  return &type metadata for AnimatedMemojiView;
}

unint64_t sub_24A778A44()
{
  unint64_t result = qword_2697B9978;
  if (!qword_2697B9978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9978);
  }
  return result;
}

id sub_24A778A98()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  sub_24A779BDC();
  sub_24A779588(v1, v2);
  id v3 = sub_24A779A88();
  sub_24A7795EC(v1, v2);
  return v3;
}

uint64_t MemojiArchivableView.init(memojiDescriptorData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MemojiArchivableView.body.getter@<X0>(uint64_t a1@<X8>)
{
  long long v4 = *v1;
  sub_24A778A98();
  sub_24A77883C();
  uint64_t result = sub_24A779D80();
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = BYTE8(v4);
  return result;
}

uint64_t sub_24A778D5C()
{
  return 1;
}

uint64_t sub_24A778D64()
{
  return sub_24A779EC0();
}

uint64_t sub_24A778DA8()
{
  return sub_24A779EB0();
}

uint64_t sub_24A778DD0()
{
  return sub_24A779EC0();
}

unint64_t sub_24A778E10()
{
  return 0xD000000000000014;
}

uint64_t sub_24A778E2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24A779B54(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24A778E58()
{
  return 0;
}

void sub_24A778E64(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24A778E70(uint64_t a1)
{
  unint64_t v2 = sub_24A779078();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A778EAC(uint64_t a1)
{
  unint64_t v2 = sub_24A779078();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MemojiArchivableView.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9980);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A779078();
  sub_24A779EE0();
  v10[0] = v8;
  v10[1] = v7;
  sub_24A7790CC();
  sub_24A779E70();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24A779078()
{
  unint64_t result = qword_2697B9988;
  if (!qword_2697B9988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9988);
  }
  return result;
}

unint64_t sub_24A7790CC()
{
  unint64_t result = qword_2697B9990;
  if (!qword_2697B9990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B9990);
  }
  return result;
}

uint64_t MemojiArchivableView.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697B9998);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A779078();
  sub_24A779ED0();
  if (!v2)
  {
    sub_24A77928C();
    sub_24A779E60();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_24A77928C()
{
  unint64_t result = qword_2697B99A0;
  if (!qword_2697B99A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B99A0);
  }
  return result;
}

unint64_t sub_24A7792E4()
{
  unint64_t result = qword_26B1794B8;
  if (!qword_26B1794B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1794B8);
  }
  return result;
}

unint64_t sub_24A77933C()
{
  unint64_t result = qword_26B1794B0;
  if (!qword_26B1794B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1794B0);
  }
  return result;
}

unint64_t sub_24A779394()
{
  unint64_t result = qword_26B1794A8;
  if (!qword_26B1794A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1794A8);
  }
  return result;
}

uint64_t sub_24A7793EC@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return MemojiArchivableView.init(from:)(a1, a2);
}

uint64_t sub_24A779404(void *a1)
{
  return MemojiArchivableView.encode(to:)(a1);
}

uint64_t sub_24A77941C(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of MemojiArchivableView.body>>, 1);
}

uint64_t sub_24A779438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24A778454();
  return MEMORY[0x270F00310](a1, a2, a3, v6);
}

uint64_t sub_24A77949C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24A778454();
  return MEMORY[0x270F00318](a1, a2, a3, v6);
}

uint64_t sub_24A779500()
{
  return sub_24A779CA0();
}

uint64_t *initializeBufferWithCopyOfBuffer for MemojiArchivableView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_24A779588(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_24A779588(uint64_t a1, unint64_t a2)
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

uint64_t destroy for MemojiArchivableView(uint64_t a1)
{
  return sub_24A7795EC(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t sub_24A7795EC(uint64_t a1, unint64_t a2)
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

uint64_t *assignWithCopy for MemojiArchivableView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_24A779588(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_24A7795EC(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for MemojiArchivableView(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_24A7795EC(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MemojiArchivableView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MemojiArchivableView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MemojiArchivableView()
{
  return &type metadata for MemojiArchivableView;
}

unint64_t sub_24A779788()
{
  unint64_t result = qword_2697B99A8;
  if (!qword_2697B99A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697B99B0);
    sub_24A77883C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B99A8);
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

uint64_t getEnumTagSinglePayload for MemojiArchivableView.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MemojiArchivableView.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24A779940);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24A779968()
{
  return 0;
}

ValueMetadata *type metadata accessor for MemojiArchivableView.CodingKeys()
{
  return &type metadata for MemojiArchivableView.CodingKeys;
}

unint64_t sub_24A779984()
{
  unint64_t result = qword_2697B99B8;
  if (!qword_2697B99B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B99B8);
  }
  return result;
}

unint64_t sub_24A7799DC()
{
  unint64_t result = qword_2697B99C0;
  if (!qword_2697B99C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B99C0);
  }
  return result;
}

unint64_t sub_24A779A34()
{
  unint64_t result = qword_2697B99C8;
  if (!qword_2697B99C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697B99C8);
  }
  return result;
}

id sub_24A779A88()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = (void *)sub_24A779C30();
  v5[0] = 0;
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_descriptorWithDataRepresentation_error_, v0, v5);

  if (v1)
  {
    id v2 = v5[0];
  }
  else
  {
    id v3 = v5[0];
    sub_24A779C20();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_24A779B54(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x800000024A77AAD0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24A779E80();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_24A779BDC()
{
  unint64_t result = qword_2697B99D0;
  if (!qword_2697B99D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697B99D0);
  }
  return result;
}

uint64_t sub_24A779C20()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24A779C30()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24A779C40()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A779C50()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24A779C60()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A779C90()
{
  return MEMORY[0x270F00320]();
}

uint64_t sub_24A779CA0()
{
  return MEMORY[0x270F00328]();
}

uint64_t sub_24A779CB0()
{
  return MEMORY[0x270F00330]();
}

uint64_t sub_24A779CC0()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_24A779CD0()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_24A779CE0()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_24A779D00()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_24A779D10()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_24A779D20()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_24A779D30()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_24A779D40()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_24A779D50()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_24A779D70()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_24A779D80()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24A779D90()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24A779DA0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A779DB0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24A779DC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A779DD0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24A779DE0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24A779DF0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24A779E00()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A779E10()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A779E20()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A779E30()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A779E40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A779E50()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A779E60()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24A779E70()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24A779E80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A779E90()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24A779EA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A779EB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A779EC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24A779ED0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24A779EE0()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A418](cls, protocol);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x270FA02A8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}