id HealthDaemonFeaturesProfileExtension.__allocating_init()()
{
  objc_class *v0;
  id v1;
  uint64_t vars8;

  v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void HealthDaemonFeaturesProfileExtension.init()()
{
}

id HealthDaemonFeaturesProfileExtension.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HealthDaemonFeaturesProfileExtension()
{
  return self;
}

uint64_t method lookup function for HealthDaemonFeaturesProfileExtension(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HealthDaemonFeaturesProfileExtension);
}

uint64_t sub_2510512CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2510513A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_251051C94((uint64_t)v12, *a3);
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
      sub_251051C94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t sub_2510513A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_251052270();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25105155C(a5, a6);
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
  uint64_t v8 = sub_251052290();
  if (!v8)
  {
    sub_2510522A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2510522B0();
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

uint64_t sub_25105155C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2510515F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2510517D0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2510517D0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2510515F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25105176C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_251052280();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2510522A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_251052230();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2510522B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2510522A0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25105176C(uint64_t a1, uint64_t a2)
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
  sub_251051CF0();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2510517D0(char a1, int64_t a2, char a3, char *a4)
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
    sub_251051CF0();
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
  v13 = a4 + 32;
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
  uint64_t result = sub_2510522B0();
  __break(1u);
  return result;
}

id sub_25105191C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (qword_26B2114E0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_251052210();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B2114F8);
  id v6 = a1;
  int64_t v7 = sub_2510521F0();
  os_log_type_t v8 = sub_251052240();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v16 = v14;
    *(_DWORD *)uint64_t v9 = 136446466;
    uint64_t v11 = sub_2510522D0();
    sub_2510512CC(v11, v12, &v16);
    sub_251052260();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v15 = objc_msgSend(v6, sel_profileIdentifier);
    sub_251052260();
    *uint64_t v10 = v15;

    _os_log_impl(&dword_25104F000, v7, v8, "[%{public}s] Profile extension loaded for profile %@", (uint8_t *)v9, 0x16u);
    sub_251051BAC();
    swift_arrayDestroy();
    MEMORY[0x253392180](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x253392180](v14, -1, -1);
    MEMORY[0x253392180](v9, -1, -1);
  }
  else
  {
  }
  v17.receiver = v2;
  v17.super_class = ObjectType;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_251051BAC()
{
  if (!qword_26B2114F0)
  {
    sub_251051C04();
    unint64_t v0 = sub_251052250();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2114F0);
    }
  }
}

unint64_t sub_251051C04()
{
  unint64_t result = qword_26B2114E8;
  if (!qword_26B2114E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B2114E8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_251051C94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_251051CF0()
{
  if (!qword_269B1AE30)
  {
    unint64_t v0 = sub_2510522C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B1AE30);
    }
  }
}

uint64_t sub_251051D94()
{
  return 0x654668746C616548;
}

uint64_t sub_251051DB8()
{
  return 0;
}

id sub_251051DC8(void *a1)
{
  if (objc_msgSend(a1, sel_profileType) != (id)1) {
    return 0;
  }
  id v2 = objc_allocWithZone((Class)type metadata accessor for HealthDaemonFeaturesProfileExtension());
  id v3 = a1;
  id v4 = sub_25105191C(v3);

  return v4;
}

id HealthDaemonFeaturesPlugin.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id HealthDaemonFeaturesPlugin.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthDaemonFeaturesPlugin();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HealthDaemonFeaturesPlugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthDaemonFeaturesPlugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HealthDaemonFeaturesPlugin()
{
  return self;
}

uint64_t method lookup function for HealthDaemonFeaturesPlugin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HealthDaemonFeaturesPlugin);
}

uint64_t dispatch thunk of HealthDaemonFeaturesPlugin.pluginIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of HealthDaemonFeaturesPlugin.extension(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t static HealthDaemonFeaturesUtilities.pluginIdentifier.getter()
{
  return 0x654668746C616548;
}

id static HealthDaemonFeaturesUtilities.bundle.getter()
{
  type metadata accessor for HealthDaemonFeaturesPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);

  return v1;
}

ValueMetadata *type metadata accessor for HealthDaemonFeaturesUtilities()
{
  return &type metadata for HealthDaemonFeaturesUtilities;
}

uint64_t sub_251052114()
{
  uint64_t v0 = sub_251052210();
  __swift_allocate_value_buffer(v0, qword_26B2114F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B2114F8);
  return sub_251052200();
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

uint64_t sub_2510521F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_251052200()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_251052210()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_251052220()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_251052230()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_251052240()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_251052250()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_251052260()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_251052270()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_251052280()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_251052290()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2510522A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2510522B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2510522C0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2510522D0()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}