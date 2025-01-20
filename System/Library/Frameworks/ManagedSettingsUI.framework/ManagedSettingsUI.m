double sub_226BB88A8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double result;
  void v16[3];
  uint64_t v17;

  v4 = sub_226BBE4E0();
  v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268155F00 != -1) {
    swift_once();
  }
  v8 = sub_226BBE5A0();
  __swift_project_value_buffer(v8, (uint64_t)qword_268155FC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v9 = sub_226BBE580();
  v10 = sub_226BBE630();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v17 = v12;
    *(_DWORD *)v11 = 136642819;
    v16[1] = v11 + 4;
    sub_226BB9DCC(&qword_268155F18, MEMORY[0x263F10770]);
    v13 = sub_226BBE6B0();
    v16[2] = sub_226BB9774(v13, v14, &v17);
    sub_226BBE650();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_226BB7000, v9, v10, "Returning default configuration for application: %{sensitive}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6636A0](v12, -1, -1);
    MEMORY[0x22A6636A0](v11, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  result = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(void *)(a2 + 128) = 0;
  return result;
}

double sub_226BB8B68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_226BBE500();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_226BBE4E0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268155F00 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_226BBE5A0();
  __swift_project_value_buffer(v14, (uint64_t)qword_268155FC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v15 = sub_226BBE580();
  os_log_type_t v16 = sub_226BBE630();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)uint64_t v18 = 136643075;
    int v29 = v17;
    sub_226BB9DCC(&qword_268155F18, MEMORY[0x263F10770]);
    os_log_t v28 = v15;
    uint64_t v19 = sub_226BBE6B0();
    uint64_t v31 = sub_226BB9774(v19, v20, &v32);
    uint64_t v27 = v6;
    sub_226BBE650();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    *(_WORD *)(v18 + 12) = 2085;
    sub_226BB9DCC(&qword_268155F20, MEMORY[0x263F10790]);
    uint64_t v21 = v27;
    uint64_t v22 = sub_226BBE6B0();
    uint64_t v31 = sub_226BB9774(v22, v23, &v32);
    sub_226BBE650();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
    os_log_t v24 = v28;
    _os_log_impl(&dword_226BB7000, v28, (os_log_type_t)v29, "Returning default configuration for application: %{sensitive}s in category: %{sensitive}s", (uint8_t *)v18, 0x16u);
    uint64_t v25 = v30;
    swift_arrayDestroy();
    MEMORY[0x22A6636A0](v25, -1, -1);
    MEMORY[0x22A6636A0](v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  double result = 0.0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(void *)(a3 + 128) = 0;
  return result;
}

double sub_226BB8F84@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_226BBE540();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268155F00 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_226BBE5A0();
  __swift_project_value_buffer(v8, (uint64_t)qword_268155FC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v9 = sub_226BBE580();
  os_log_type_t v10 = sub_226BBE630();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = v12;
    *(_DWORD *)uint64_t v11 = 136642819;
    v16[1] = v11 + 4;
    sub_226BB9DCC(&qword_268155F28, MEMORY[0x263F107D0]);
    uint64_t v13 = sub_226BBE6B0();
    v16[2] = sub_226BB9774(v13, v14, &v17);
    sub_226BBE650();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_226BB7000, v9, v10, "Returning default configuration for web domain: %{sensitive}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6636A0](v12, -1, -1);
    MEMORY[0x22A6636A0](v11, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  double result = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(void *)(a2 + 128) = 0;
  return result;
}

double sub_226BB9244@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_226BBE500();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_226BBE540();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268155F00 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_226BBE5A0();
  __swift_project_value_buffer(v14, (uint64_t)qword_268155FC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v15 = sub_226BBE580();
  os_log_type_t v16 = sub_226BBE630();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)uint64_t v18 = 136643075;
    int v29 = v17;
    sub_226BB9DCC(&qword_268155F28, MEMORY[0x263F107D0]);
    os_log_t v28 = v15;
    uint64_t v19 = sub_226BBE6B0();
    uint64_t v31 = sub_226BB9774(v19, v20, &v32);
    uint64_t v27 = v6;
    sub_226BBE650();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    *(_WORD *)(v18 + 12) = 2085;
    sub_226BB9DCC(&qword_268155F20, MEMORY[0x263F10790]);
    uint64_t v21 = v27;
    uint64_t v22 = sub_226BBE6B0();
    uint64_t v31 = sub_226BB9774(v22, v23, &v32);
    sub_226BBE650();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
    os_log_t v24 = v28;
    _os_log_impl(&dword_226BB7000, v28, (os_log_type_t)v29, "Returning default configuration for web domain: %{sensitive}s in category: %{sensitive}s", (uint8_t *)v18, 0x16u);
    uint64_t v25 = v30;
    swift_arrayDestroy();
    MEMORY[0x22A6636A0](v25, -1, -1);
    MEMORY[0x22A6636A0](v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  double result = 0.0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(void *)(a3 + 128) = 0;
  return result;
}

id ShieldConfigurationDataSource.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ShieldConfigurationDataSource.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShieldConfigurationDataSource();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ShieldConfigurationDataSource.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShieldConfigurationDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_226BB9774(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_226BB9848(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_226BB9F84((uint64_t)v12, *a3);
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
      sub_226BB9F84((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_226BB9848(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_226BBE660();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_226BB9A04(a5, a6);
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
  uint64_t v8 = sub_226BBE680();
  if (!v8)
  {
    sub_226BBE690();
    __break(1u);
LABEL_17:
    uint64_t result = sub_226BBE6A0();
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

uint64_t sub_226BB9A04(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_226BB9A9C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_226BB9C7C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_226BB9C7C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_226BB9A9C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_226BB9C14(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_226BBE670();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_226BBE690();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_226BBE5E0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_226BBE6A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_226BBE690();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_226BB9C14(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155F38);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_226BB9C7C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268155F38);
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
  uint64_t result = sub_226BBE6A0();
  __break(1u);
  return result;
}

uint64_t sub_226BB9DCC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ShieldConfigurationDataSource()
{
  return self;
}

uint64_t method lookup function for ShieldConfigurationDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ShieldConfigurationDataSource);
}

uint64_t dispatch thunk of ShieldConfigurationDataSource.configuration(shielding:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ShieldConfigurationDataSource.configuration(shielding:in:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

void type metadata accessor for Style(uint64_t a1)
{
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

uint64_t sub_226BB9F84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_226BBA03C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_226BBA084()
{
  uint64_t v0 = sub_226BBE5A0();
  __swift_allocate_value_buffer(v0, qword_268155FC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_268155FC8);
  return sub_226BBE590();
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

__n128 ShieldConfiguration.init(backgroundBlurStyle:backgroundColor:icon:title:subtitle:primaryButtonLabel:primaryButtonBackgroundColor:secondaryButtonLabel:)@<Q0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 *a10)
{
  uint64_t v10 = *(void *)(a5 + 16);
  uint64_t v11 = *(void *)(a6 + 16);
  uint64_t v12 = *(void *)(a7 + 16);
  unint64_t v13 = a10[1].n128_u64[0];
  *(void *)a9 = a1;
  *(unsigned char *)(a9 + 8) = a2 & 1;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(_OWORD *)(a9 + 32) = *(_OWORD *)a5;
  *(void *)(a9 + 48) = v10;
  *(_OWORD *)(a9 + 56) = *(_OWORD *)a6;
  *(void *)(a9 + 72) = v11;
  *(_OWORD *)(a9 + 80) = *(_OWORD *)a7;
  *(void *)(a9 + 96) = v12;
  *(void *)(a9 + 104) = a8;
  __n128 result = *a10;
  *(__n128 *)(a9 + 112) = *a10;
  *(void *)(a9 + 128) = v13;
  return result;
}

uint64_t ShieldConfiguration.Label.text.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id ShieldConfiguration.Label.color.getter()
{
  return *(id *)(v0 + 16);
}

ManagedSettingsUI::ShieldConfiguration::Label __swiftcall ShieldConfiguration.Label.init(text:color:)(Swift::String text, UIColor color)
{
  *(Swift::String *)uint64_t v2 = text;
  *(UIColor *)(v2 + 16) = color;
  result.text = text;
  result.color = color;
  return result;
}

uint64_t ShieldConfiguration.backgroundBlurStyle.getter()
{
  return *(void *)v0;
}

void *ShieldConfiguration.backgroundColor.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void *ShieldConfiguration.icon.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void ShieldConfiguration.title.getter(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[4];
  uint64_t v3 = v1[5];
  uint64_t v4 = (void *)v1[6];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  sub_226BBA284(v2, v3, v4);
}

void sub_226BBA284(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v3 = a3;
  }
}

void ShieldConfiguration.subtitle.getter(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[7];
  uint64_t v3 = v1[8];
  uint64_t v4 = (void *)v1[9];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  sub_226BBA284(v2, v3, v4);
}

void ShieldConfiguration.primaryButtonLabel.getter(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[10];
  uint64_t v3 = v1[11];
  uint64_t v4 = (void *)v1[12];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  sub_226BBA284(v2, v3, v4);
}

void *ShieldConfiguration.primaryButtonBackgroundColor.getter()
{
  uint64_t v1 = *(void **)(v0 + 104);
  id v2 = v1;
  return v1;
}

void ShieldConfiguration.secondaryButtonLabel.getter(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[14];
  uint64_t v3 = v1[15];
  uint64_t v4 = (void *)v1[16];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = (uint64_t)v4;
  sub_226BBA284(v2, v3, v4);
}

uint64_t initializeBufferWithCopyOfBuffer for ShieldConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ShieldConfiguration(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRelease();
  }
  if (*(void *)(a1 + 64))
  {
    swift_bridgeObjectRelease();
  }
  if (*(void *)(a1 + 88))
  {
    swift_bridgeObjectRelease();
  }
  if (*(void *)(a1 + 120))
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = *(void **)(a1 + 128);
  }
}

uint64_t initializeWithCopy for ShieldConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  size_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  id v7 = v4;
  id v8 = v5;
  if (v6)
  {
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v6;
    int64_t v9 = *(void **)(a2 + 48);
    *(void *)(a1 + 48) = v9;
    swift_bridgeObjectRetain();
    id v10 = v9;
    uint64_t v11 = *(void *)(a2 + 64);
    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    uint64_t v14 = *(void *)(a2 + 88);
    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 64);
  if (!v11) {
    goto LABEL_6;
  }
LABEL_3:
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v11;
  uint64_t v12 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v12;
  swift_bridgeObjectRetain();
  id v13 = v12;
  uint64_t v14 = *(void *)(a2 + 88);
  if (v14)
  {
LABEL_4:
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = v14;
    v15 = *(void **)(a2 + 96);
    *(void *)(a1 + 96) = v15;
    swift_bridgeObjectRetain();
    id v16 = v15;
    goto LABEL_8;
  }
LABEL_7:
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
LABEL_8:
  int v17 = *(void **)(a2 + 104);
  *(void *)(a1 + 104) = v17;
  uint64_t v18 = *(void *)(a2 + 120);
  id v19 = v17;
  if (v18)
  {
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(void *)(a1 + 120) = v18;
    unint64_t v20 = *(void **)(a2 + 128);
    *(void *)(a1 + 128) = v20;
    swift_bridgeObjectRetain();
    id v21 = v20;
  }
  else
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
  }
  return a1;
}

uint64_t assignWithCopy for ShieldConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  size_t v5 = *(void **)(a1 + 16);
  uint64_t v6 = (void *)a2[2];
  *(void *)(a1 + 16) = v6;
  id v7 = v6;

  id v8 = *(void **)(a1 + 24);
  int64_t v9 = (void *)a2[3];
  *(void *)(a1 + 24) = v9;
  id v10 = v9;

  uint64_t v11 = (_OWORD *)(a1 + 32);
  uint64_t v12 = a2 + 4;
  uint64_t v13 = a2[5];
  if (*(void *)(a1 + 40))
  {
    if (v13)
    {
      *(void *)(a1 + 32) = a2[4];
      *(void *)(a1 + 40) = a2[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v14 = (void *)a2[6];
      v15 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v14;
      id v16 = v14;
    }
    else
    {
      sub_226BBA860(a1 + 32);
      uint64_t v19 = a2[6];
      *uint64_t v11 = *v12;
      *(void *)(a1 + 48) = v19;
    }
  }
  else if (v13)
  {
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = a2[5];
    int v17 = (void *)a2[6];
    *(void *)(a1 + 48) = v17;
    swift_bridgeObjectRetain();
    id v18 = v17;
  }
  else
  {
    long long v20 = *v12;
    *(void *)(a1 + 48) = a2[6];
    *uint64_t v11 = v20;
  }
  id v21 = (_OWORD *)(a1 + 56);
  uint64_t v22 = a2 + 7;
  uint64_t v23 = a2[8];
  if (*(void *)(a1 + 64))
  {
    if (v23)
    {
      *(void *)(a1 + 56) = a2[7];
      *(void *)(a1 + 64) = a2[8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      os_log_t v24 = (void *)a2[9];
      uint64_t v25 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v24;
      id v26 = v24;
    }
    else
    {
      sub_226BBA860(a1 + 56);
      uint64_t v29 = a2[9];
      *id v21 = *v22;
      *(void *)(a1 + 72) = v29;
    }
  }
  else if (v23)
  {
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = a2[8];
    uint64_t v27 = (void *)a2[9];
    *(void *)(a1 + 72) = v27;
    swift_bridgeObjectRetain();
    id v28 = v27;
  }
  else
  {
    long long v30 = *v22;
    *(void *)(a1 + 72) = a2[9];
    *id v21 = v30;
  }
  uint64_t v31 = (_OWORD *)(a1 + 80);
  uint64_t v32 = a2 + 10;
  uint64_t v33 = a2[11];
  if (*(void *)(a1 + 88))
  {
    if (v33)
    {
      *(void *)(a1 + 80) = a2[10];
      *(void *)(a1 + 88) = a2[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v34 = (void *)a2[12];
      v35 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v34;
      id v36 = v34;
    }
    else
    {
      sub_226BBA860(a1 + 80);
      uint64_t v39 = a2[12];
      *uint64_t v31 = *v32;
      *(void *)(a1 + 96) = v39;
    }
  }
  else if (v33)
  {
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = a2[11];
    v37 = (void *)a2[12];
    *(void *)(a1 + 96) = v37;
    swift_bridgeObjectRetain();
    id v38 = v37;
  }
  else
  {
    long long v40 = *v32;
    *(void *)(a1 + 96) = a2[12];
    *uint64_t v31 = v40;
  }
  v41 = *(void **)(a1 + 104);
  v42 = (void *)a2[13];
  *(void *)(a1 + 104) = v42;
  id v43 = v42;

  v44 = (_OWORD *)(a1 + 112);
  v45 = a2 + 14;
  uint64_t v46 = a2[15];
  if (*(void *)(a1 + 120))
  {
    if (v46)
    {
      *(void *)(a1 + 112) = a2[14];
      *(void *)(a1 + 120) = a2[15];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v47 = (void *)a2[16];
      v48 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v47;
      id v49 = v47;
    }
    else
    {
      sub_226BBA860(a1 + 112);
      uint64_t v52 = a2[16];
      _OWORD *v44 = *v45;
      *(void *)(a1 + 128) = v52;
    }
  }
  else if (v46)
  {
    *(void *)(a1 + 112) = a2[14];
    *(void *)(a1 + 120) = a2[15];
    v50 = (void *)a2[16];
    *(void *)(a1 + 128) = v50;
    swift_bridgeObjectRetain();
    id v51 = v50;
  }
  else
  {
    long long v53 = *v45;
    *(void *)(a1 + 128) = a2[16];
    _OWORD *v44 = v53;
  }
  return a1;
}

uint64_t sub_226BBA860(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for ShieldConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  long long v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  size_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = *(void *)(a2 + 40);
    if (v6)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v6;
      swift_bridgeObjectRelease();
      long long v7 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);

      goto LABEL_6;
    }
    sub_226BBA860(a1 + 32);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
LABEL_6:
  if (*(void *)(a1 + 64))
  {
    uint64_t v8 = *(void *)(a2 + 64);
    if (v8)
    {
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v8;
      swift_bridgeObjectRelease();
      int64_t v9 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);

      goto LABEL_11;
    }
    sub_226BBA860(a1 + 56);
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
LABEL_11:
  if (*(void *)(a1 + 88))
  {
    uint64_t v10 = *(void *)(a2 + 88);
    if (v10)
    {
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = v10;
      swift_bridgeObjectRelease();
      uint64_t v11 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);

      goto LABEL_16;
    }
    sub_226BBA860(a1 + 80);
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
LABEL_16:
  uint64_t v12 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);

  if (!*(void *)(a1 + 120))
  {
LABEL_20:
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    return a1;
  }
  uint64_t v13 = *(void *)(a2 + 120);
  if (!v13)
  {
    sub_226BBA860(a1 + 112);
    goto LABEL_20;
  }
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void **)(a1 + 128);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);

  return a1;
}

uint64_t getEnumTagSinglePayload for ShieldConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 136)) {
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

uint64_t storeEnumTagSinglePayload for ShieldConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 136) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 136) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShieldConfiguration()
{
  return &type metadata for ShieldConfiguration;
}

void destroy for ShieldConfiguration.Label(uint64_t a1)
{
  swift_bridgeObjectRelease();
  long long v2 = *(void **)(a1 + 16);
}

void *_s17ManagedSettingsUI19ShieldConfigurationV5LabelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  int v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for ShieldConfiguration.Label(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = (void *)a2[2];
  id v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ShieldConfiguration.Label(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  int v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for ShieldConfiguration.Label(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShieldConfiguration.Label(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShieldConfiguration.Label()
{
  return &type metadata for ShieldConfiguration.Label;
}

void sub_226BBAD2C(uint64_t a1)
{
}

void sub_226BBAD40(uint64_t a1)
{
}

void sub_226BBAD54(uint64_t a1, void **a2, void *a3)
{
  int v4 = *a2;
  id v5 = self;
  id v6 = v4;
  id v7 = objc_msgSend(v5, sel_interfaceWithProtocol_, v6);

  *a3 = v7;
}

id sub_226BBAE08(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  id v5 = *a4;

  return v5;
}

BOOL sub_226BBAE58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_226BBAE70()
{
  return sub_226BBE730();
}

uint64_t sub_226BBAEB8()
{
  return sub_226BBE720();
}

uint64_t sub_226BBAEE4()
{
  return sub_226BBE730();
}

void *sub_226BBAF38()
{
  uint64_t v1 = OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource;
  unint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource];
  uint64_t v3 = v2;
  if (v2 == (void *)1)
  {
    if (objc_msgSend(v0, sel__principalObject))
    {
      type metadata accessor for ShieldConfigurationDataSource();
      uint64_t v3 = (void *)swift_dynamicCastClass();
      if (!v3) {
        swift_unknownObjectRelease();
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    int v4 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v3;
    id v5 = v3;
    sub_226BBC040(v4);
  }
  sub_226BBC050(v2);
  return v3;
}

uint64_t sub_226BBB234(void *a1, int a2, int a3, void *a4, void *a5, void *aBlock, void (*a7)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, id, void *))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = sub_226BBE5C0();
  uint64_t v14 = v13;
  id v15 = a4;
  id v16 = a5;
  id v17 = a1;
  uint64_t v18 = sub_226BBE490();
  unint64_t v20 = v19;

  uint64_t v21 = sub_226BBE5C0();
  uint64_t v23 = v22;

  _Block_copy(v11);
  a7(v12, v14, v18, v20, v21, v23, v17, v11);
  _Block_release(v11);
  _Block_release(v11);
  swift_bridgeObjectRelease();
  sub_226BBDEC4(v18, v20);

  return swift_bridgeObjectRelease();
}

uint64_t sub_226BBB34C(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_226BBE570();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  int64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  [(UIImage *)v3 size];
  if (v10 <= a1)
  {
    [(UIImage *)v3 size];
    if (v11 <= a2)
    {
      v35 = UIImagePNGRepresentation(v3);
      if (v35)
      {
        id v36 = v35;
        uint64_t v30 = sub_226BBE490();

        return v30;
      }
      return 0;
    }
  }
  uint64_t v12 = [(UIImage *)v3 CGImage];
  if (!v12)
  {
    if (qword_268155F00 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_226BBE5A0();
    __swift_project_value_buffer(v31, (uint64_t)qword_268155FC8);
    uint64_t v32 = sub_226BBE580();
    os_log_type_t v33 = sub_226BBE640();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_226BB7000, v32, v33, "Failed to get CGImage from UImage", v34, 2u);
      MEMORY[0x22A6636A0](v34, -1, -1);
    }

    return 0;
  }
  uint64_t v13 = v12;
  uint64_t v14 = (__CFData *)objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF990]), sel_init);
  sub_226BBE560();
  sub_226BBE550();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v15 = objc_allocWithZone(NSString);
  id v16 = (void *)sub_226BBE5B0();
  swift_bridgeObjectRelease();
  id v17 = (__CFString *)objc_msgSend(v15, sel_initWithString_, v16);

  CGImageDestinationRef v18 = CGImageDestinationCreateWithData(v14, v17, 1uLL, 0);
  if (!v18)
  {
    if (qword_268155F00 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_226BBE5A0();
    __swift_project_value_buffer(v37, (uint64_t)qword_268155FC8);
    id v38 = sub_226BBE580();
    os_log_type_t v39 = sub_226BBE640();
    if (!os_log_type_enabled(v38, v39))
    {

      goto LABEL_26;
    }
    long long v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v40 = 0;
    _os_log_impl(&dword_226BB7000, v38, v39, "Failed to create image destination", v40, 2u);
    MEMORY[0x22A6636A0](v40, -1, -1);

    return 0;
  }
  unint64_t v19 = v18;
  if (a2 < a1) {
    a1 = a2;
  }
  id v20 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v20, sel_scale);
  double v22 = v21;

  sub_226BBE158(0, &qword_268155F90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155F98);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_226BBED60;
  os_log_t v24 = (void *)*MEMORY[0x263F0EFE0];
  type metadata accessor for CFString(0);
  *(void *)(v23 + 56) = v25;
  *(void *)(v23 + 32) = v24;
  *(void *)(v23 + 88) = MEMORY[0x263F8EF38];
  *(double *)(v23 + 64) = a1 * v22;
  id v26 = v24;
  uint64_t v27 = (void *)sub_226BBE620();
  CFDictionaryRef v28 = (const __CFDictionary *)sub_226BBE610();

  CGImageDestinationAddImage(v19, v13, v28);
  if (!CGImageDestinationFinalize(v19))
  {
    if (qword_268155F00 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_226BBE5A0();
    __swift_project_value_buffer(v41, (uint64_t)qword_268155FC8);
    v42 = sub_226BBE580();
    os_log_type_t v43 = sub_226BBE640();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_226BB7000, v42, v43, "Failed to finalize image destination", v44, 2u);
      MEMORY[0x22A6636A0](v44, -1, -1);

      return 0;
    }

LABEL_26:
    return 0;
  }
  uint64_t v29 = v14;
  uint64_t v30 = sub_226BBE490();

  return v30;
}

id sub_226BBB91C(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource] = 1;
  if (a1)
  {
    unint64_t v2 = (void *)sub_226BBE5F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ShieldConfigurationExtensionContext();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithInputItems_, v2);

  if (v3) {
  return v3;
  }
}

id sub_226BBBA00(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155F60);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource] = 1;
  if (a1)
  {
    int64_t v9 = (void *)sub_226BBE5F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v9 = 0;
  }
  sub_226BBE194(a2, (uint64_t)v8, &qword_268155F60);
  uint64_t v10 = sub_226BBE4C0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    uint64_t v12 = (void *)sub_226BBE4A0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  uint64_t v13 = (objc_class *)type metadata accessor for ShieldConfigurationExtensionContext();
  v17.receiver = v3;
  v17.super_class = v13;
  id v14 = objc_msgSendSuper2(&v17, sel_initWithInputItems_contextUUID_, v9, v12);

  id v15 = v14;
  sub_226BBE0D4(a2, &qword_268155F60);
  if (v15) {

  }
  return v15;
}

id sub_226BBBCDC(uint64_t a1, void *a2, uint64_t a3)
{
  int v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155F60);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v4[OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource] = 1;
  if (a1)
  {
    uint64_t v11 = (void *)sub_226BBE5F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  sub_226BBE194(a3, (uint64_t)v10, &qword_268155F60);
  uint64_t v12 = sub_226BBE4C0();
  uint64_t v13 = *(void *)(v12 - 8);
  id v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
  {
    id v14 = (void *)sub_226BBE4A0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  id v15 = (objc_class *)type metadata accessor for ShieldConfigurationExtensionContext();
  v19.receiver = v4;
  v19.super_class = v15;
  id v16 = objc_msgSendSuper2(&v19, sel_initWithInputItems_listenerEndpoint_contextUUID_, v11, a2, v14);

  id v17 = v16;
  sub_226BBE0D4(a3, &qword_268155F60);
  if (v17) {

  }
  return v17;
}

id sub_226BBBFD8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShieldConfigurationExtensionContext();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ShieldConfigurationExtensionContext()
{
  return self;
}

void sub_226BBC040(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_226BBC050(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

id sub_226BBC060(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, void *a7, void *a8, void *a9, uint64_t a10, unint64_t a11, void *a12)
{
  uint64_t v13 = v12;
  if (a2 >> 60 == 15)
  {
    objc_super v19 = 0;
  }
  else
  {
    objc_super v19 = (void *)sub_226BBE480();
    sub_226BBE144(a1, a2);
  }
  if (a4 >> 60 == 15)
  {
    double v22 = 0;
  }
  else
  {
    double v22 = (void *)sub_226BBE480();
    sub_226BBE144(a3, a4);
  }
  if (a6 >> 60 == 15)
  {
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = (void *)sub_226BBE480();
    sub_226BBE144(a5, a6);
  }
  if (a11 >> 60 == 15)
  {
    os_log_t v24 = 0;
  }
  else
  {
    os_log_t v24 = (void *)sub_226BBE480();
    sub_226BBE144(a10, a11);
  }
  id v25 = objc_msgSend(v13, sel_initWithBackgroundColorData_backgroundEffectData_iconData_title_subtitle_primaryButtonLabel_primaryButtonColorData_secondaryButtonLabel_, v19, v22, v23, a7, a8, a9, v24, a12);

  return v25;
}

uint64_t sub_226BBC1E8(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  sub_226BBE194(a1, (uint64_t)&v23, &qword_268155F78);
  if (!v24)
  {
    sub_226BBE0D4((uint64_t)&v23, &qword_268155F78);
    return 0;
  }
  sub_226BBE1F8(&v23, &v25);
  uint64_t v1 = self;
  __swift_project_boxed_opaque_existential_0(&v25, v26);
  uint64_t v2 = sub_226BBE6C0();
  *(void *)&long long v23 = 0;
  id v3 = objc_msgSend(v1, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v2, 1, &v23);
  swift_unknownObjectRelease();
  id v4 = (id)v23;
  if (!v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = (void *)sub_226BBE470();

    swift_willThrow();
    if (qword_268155F00 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_226BBE5A0();
    __swift_project_value_buffer(v8, (uint64_t)qword_268155FC8);
    sub_226BB9F84((uint64_t)&v25, (uint64_t)&v23);
    id v9 = v7;
    id v10 = v7;
    uint64_t v11 = sub_226BBE580();
    os_log_type_t v12 = sub_226BBE640();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v22 = v14;
      *(_DWORD *)uint64_t v13 = 136446466;
      sub_226BB9F84((uint64_t)&v23, (uint64_t)v21);
      uint64_t v15 = sub_226BBE5D0();
      v21[0] = sub_226BB9774(v15, v16, &v22);
      sub_226BBE650();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v23);
      *(_WORD *)(v13 + 12) = 2082;
      v21[0] = (uint64_t)v7;
      id v17 = v7;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268155FA0);
      uint64_t v18 = sub_226BBE5D0();
      v21[0] = sub_226BB9774(v18, v19, &v22);
      sub_226BBE650();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_226BB7000, v11, v12, "Failed to archive %{public}s: %{public}s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A6636A0](v14, -1, -1);
      MEMORY[0x22A6636A0](v13, -1, -1);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v23);
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v25);
    return 0;
  }
  uint64_t v5 = sub_226BBE490();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v25);
  return v5;
}

void sub_226BBC558(uint64_t *a1, uint64_t a2)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v5 = (void *)a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = (void *)a1[6];
  uint64_t v9 = a1[8];
  id v10 = (void *)a1[9];
  uint64_t v11 = a1[11];
  v72 = (void *)a1[12];
  uint64_t v74 = a1[10];
  v82 = (void *)a1[13];
  uint64_t v84 = a1[7];
  uint64_t v79 = a1[15];
  uint64_t v81 = a1[14];
  v77 = (void *)a1[16];
  if (v5)
  {
    *((void *)&v93 + 1) = sub_226BBE158(0, &qword_268155F80);
    *(void *)&long long v92 = v5;
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  id v12 = v5;
  uint64_t v90 = sub_226BBC1E8((uint64_t)&v92);
  unint64_t v91 = v13;
  sub_226BBE0D4((uint64_t)&v92, &qword_268155F78);
  if (v3)
  {
    uint64_t v88 = 0;
    unint64_t v89 = 0xF000000000000000;
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    id v28 = objc_msgSend(self, sel_effectWithStyle_, v2);
    *((void *)&v93 + 1) = sub_226BBE158(0, &qword_268155F88);
    *(void *)&long long v92 = v28;
    uint64_t v88 = sub_226BBC1E8((uint64_t)&v92);
    unint64_t v89 = v29;
    sub_226BBE0D4((uint64_t)&v92, &qword_268155F78);
    if (v4)
    {
LABEL_6:
      uint64_t v86 = sub_226BBB34C(120.0, 120.0);
      unint64_t v87 = v14;
      unint64_t v15 = 0x2647D0000;
      if (v7) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  uint64_t v86 = 0;
  unint64_t v87 = 0xF000000000000000;
  unint64_t v15 = 0x2647D0000uLL;
  if (v7)
  {
LABEL_7:
    *((void *)&v93 + 1) = sub_226BBE158(0, &qword_268155F80);
    *(void *)&long long v92 = v8;
    id v16 = v8;
    sub_226BBA284(v6, v7, v8);
    uint64_t v17 = sub_226BBC1E8((uint64_t)&v92);
    unint64_t v19 = v18;
    sub_226BBE0D4((uint64_t)&v92, &qword_268155F78);
    swift_bridgeObjectRetain();
    id v20 = (void *)sub_226BBE5B0();
    swift_bridgeObjectRelease();
    double v21 = 0;
    if (v19 >> 60 != 15)
    {
      double v21 = (void *)sub_226BBE480();
      sub_226BBE144(v17, v19);
    }
    unint64_t v15 = 0x2647D0000uLL;
    id v76 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53EF0]), sel_initWithText_colorData_, v20, v21);

    sub_226BBE090(v6, v7, v8);
    if (v9) {
      goto LABEL_10;
    }
LABEL_16:
    id v71 = 0;
    goto LABEL_17;
  }
LABEL_15:
  id v76 = 0;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_10:
  *((void *)&v93 + 1) = sub_226BBE158(0, &qword_268155F80);
  *(void *)&long long v92 = v10;
  id v22 = v10;
  sub_226BBA284(v84, v9, v10);
  uint64_t v23 = sub_226BBC1E8((uint64_t)&v92);
  unint64_t v25 = v24;
  sub_226BBE0D4((uint64_t)&v92, &qword_268155F78);
  swift_bridgeObjectRetain();
  uint64_t v26 = (void *)sub_226BBE5B0();
  swift_bridgeObjectRelease();
  uint64_t v27 = 0;
  if (v25 >> 60 != 15)
  {
    uint64_t v27 = (void *)sub_226BBE480();
    sub_226BBE144(v23, v25);
  }
  id v71 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53EF0]), *(SEL *)(v15 + 1496), v26, v27);

  sub_226BBE090(v84, v9, v10);
LABEL_17:
  if (v11)
  {
    *((void *)&v93 + 1) = sub_226BBE158(0, &qword_268155F80);
    *(void *)&long long v92 = v72;
    id v30 = v72;
    sub_226BBA284(v74, v11, v72);
    uint64_t v31 = sub_226BBC1E8((uint64_t)&v92);
    unint64_t v33 = v32;
    sub_226BBE0D4((uint64_t)&v92, &qword_268155F78);
    swift_bridgeObjectRetain();
    v34 = (void *)sub_226BBE5B0();
    swift_bridgeObjectRelease();
    v35 = 0;
    if (v33 >> 60 != 15)
    {
      v35 = (void *)sub_226BBE480();
      sub_226BBE144(v31, v33);
    }
    id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53EF0]), *(SEL *)(v15 + 1496), v34, v35);

    sub_226BBE090(v74, v11, v72);
  }
  else
  {
    id v36 = 0;
  }
  if (v82)
  {
    *((void *)&v93 + 1) = sub_226BBE158(0, &qword_268155F80);
    *(void *)&long long v92 = v82;
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  id v37 = v82;
  uint64_t v83 = sub_226BBC1E8((uint64_t)&v92);
  unint64_t v85 = v38;
  sub_226BBE0D4((uint64_t)&v92, &qword_268155F78);
  if (v79)
  {
    *((void *)&v93 + 1) = sub_226BBE158(0, &qword_268155F80);
    *(void *)&long long v92 = v77;
    id v39 = v77;
    sub_226BBA284(v81, v79, v77);
    uint64_t v40 = sub_226BBC1E8((uint64_t)&v92);
    unint64_t v42 = v41;
    sub_226BBE0D4((uint64_t)&v92, &qword_268155F78);
    swift_bridgeObjectRetain();
    os_log_type_t v43 = (void *)sub_226BBE5B0();
    swift_bridgeObjectRelease();
    v44 = 0;
    if (v42 >> 60 != 15)
    {
      v44 = (void *)sub_226BBE480();
      sub_226BBE144(v40, v42);
    }
    id v75 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53EF0]), sel_initWithText_colorData_, v43, v44);

    sub_226BBE090(v81, v79, v77);
  }
  else
  {
    id v75 = 0;
  }
  objc_allocWithZone(MEMORY[0x263F53EE8]);
  sub_226BBE130(v90, v91);
  sub_226BBE130(v88, v89);
  sub_226BBE130(v86, v87);
  id v78 = v36;
  id v69 = v76;
  id v73 = v71;
  sub_226BBE130(v83, v85);
  id v80 = v75;
  id v45 = sub_226BBC060(v90, v91, v88, v89, v86, v87, v76, v71, v36, v83, v85, v75);
  uint64_t v46 = self;
  *(void *)&long long v92 = 0;
  id v47 = objc_msgSend(v46, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v45, 1, &v92);
  id v48 = (id)v92;
  if (v47)
  {
    uint64_t v49 = sub_226BBE490();
    unint64_t v51 = v50;

    switch(v51 >> 62)
    {
      case 1uLL:
        LODWORD(v52) = HIDWORD(v49) - v49;
        if (!__OFSUB__(HIDWORD(v49), v49))
        {
          uint64_t v52 = (int)v52;
          goto LABEL_36;
        }
        __break(1u);
        goto LABEL_51;
      case 2uLL:
        uint64_t v56 = *(void *)(v49 + 16);
        uint64_t v55 = *(void *)(v49 + 24);
        BOOL v57 = __OFSUB__(v55, v56);
        uint64_t v52 = v55 - v56;
        if (v57)
        {
LABEL_51:
          __break(1u);
        }
        else
        {
LABEL_36:
          if (v52 < 1000001) {
            goto LABEL_43;
          }
          if (qword_268155F00 == -1)
          {
LABEL_38:
            uint64_t v58 = sub_226BBE5A0();
            __swift_project_value_buffer(v58, (uint64_t)qword_268155FC8);
            sub_226BBDF70(v49, v51);
            v59 = sub_226BBE580();
            os_log_type_t v60 = sub_226BBE640();
            if (!os_log_type_enabled(v59, v60))
            {
              sub_226BBDEC4(v49, v51);
LABEL_48:

              sub_226BBDF1C();
              v54 = (void *)swift_allocError();
              unsigned char *v66 = 1;
              swift_willThrow();
              sub_226BBDEC4(v49, v51);
              goto LABEL_49;
            }
            v61 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)v61 = 134349056;
            if (v51 >> 62 != 2)
            {
              LODWORD(v64) = HIDWORD(v49) - v49;
              if (__OFSUB__(HIDWORD(v49), v49)) {
                __break(1u);
              }
              uint64_t v64 = (int)v64;
              goto LABEL_47;
            }
            uint64_t v63 = *(void *)(v49 + 16);
            uint64_t v62 = *(void *)(v49 + 24);
            BOOL v57 = __OFSUB__(v62, v63);
            uint64_t v64 = v62 - v63;
            if (!v57)
            {
LABEL_47:
              *(void *)&long long v92 = v64;
              sub_226BBE650();
              sub_226BBDEC4(v49, v51);
              _os_log_impl(&dword_226BB7000, v59, v60, "Serialized shield configuration too large:  %{public}ld bytes", v61, 0xCu);
              MEMORY[0x22A6636A0](v61, -1, -1);
              goto LABEL_48;
            }
            __break(1u);
LABEL_43:
            sub_226BBDF70(v49, v51);
            v65 = (void *)sub_226BBE480();
            (*(void (**)(uint64_t, void *, void))(a2 + 16))(a2, v65, 0);

            sub_226BBE144(v88, v89);
            sub_226BBE144(v90, v91);
            sub_226BBE144(v86, v87);
            sub_226BBE144(v83, v85);

            sub_226BBDEC4(v49, v51);
            sub_226BBDEC4(v49, v51);
            return;
          }
        }
        swift_once();
        goto LABEL_38;
      default:
        goto LABEL_43;
    }
  }
  long long v53 = v48;
  v54 = (void *)sub_226BBE470();

  swift_willThrow();
LABEL_49:
  id v67 = v54;
  v68 = (void *)sub_226BBE460();
  (*(void (**)(uint64_t, void, void *))(a2 + 16))(a2, 0, v68);

  sub_226BBE144(v88, v89);
  sub_226BBE144(v90, v91);
  sub_226BBE144(v86, v87);
  sub_226BBE144(v83, v85);
}

void sub_226BBCF14(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, const void *a8)
{
  uint64_t v32 = a5;
  uint64_t v33 = a6;
  unint64_t v29 = a4;
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268155FB0);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_226BBE4E0();
  uint64_t v34 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155FB8);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = a8;
  _Block_copy(a8);
  unint64_t v19 = sub_226BBAF38();
  if (v19)
  {
    id v20 = v19;
    uint64_t v28 = v12;
    sub_226BBDF70(a3, v29);
    sub_226BBE510();
    double v21 = v18;
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v11, v18, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v11, 0, 1, v15);
    uint64_t v22 = v15;
    uint64_t v23 = v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_226BBE4D0();
    (*(void (**)(_OWORD *__return_ptr, char *))((*MEMORY[0x263F8EED0] & *v20) + 0x50))(v38, v14);
    v36[6] = v38[6];
    v36[7] = v38[7];
    uint64_t v37 = v39;
    v36[2] = v38[2];
    v36[3] = v38[3];
    v36[4] = v38[4];
    v36[5] = v38[5];
    v36[0] = v38[0];
    v36[1] = v38[1];
    _Block_copy(v23);
    sub_226BBC558((uint64_t *)v36, (uint64_t)v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v28);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v22);
    sub_226BBDFC8((uint64_t)v38);
    _Block_release(v23);
  }
  else
  {
    sub_226BBDF1C();
    unint64_t v24 = (void *)swift_allocError();
    *unint64_t v25 = 0;
    uint64_t v26 = (void *)sub_226BBE460();
    uint64_t v27 = v35;
    (*((void (**)(const void *, void, void *))v35 + 2))(v35, 0, v26);

    _Block_release(v27);
  }
}

void sub_226BBD2CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void *a10)
{
  uint64_t v45 = a7;
  uint64_t v46 = a8;
  uint64_t v41 = a5;
  unint64_t v42 = (char *)a6;
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v37 = a1;
  uint64_t v10 = sub_226BBE500();
  uint64_t v48 = *(void *)(v10 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155F68);
  uint64_t v40 = *(void *)(v47 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v34 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155FB0);
  MEMORY[0x270FA5388](v18 - 8);
  id v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_226BBE4E0();
  uint64_t v43 = *(void *)(v21 - 8);
  uint64_t v44 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a10;
  _Block_copy(a10);
  unint64_t v24 = sub_226BBAF38();
  if (v24)
  {
    unint64_t v25 = v24;
    v35 = v15;
    uint64_t v36 = v10;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155FB8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v20, 1, 1, v26);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_226BBE4D0();
    sub_226BBDF70(v41, (unint64_t)v42);
    sub_226BBE510();
    uint64_t v27 = v40;
    uint64_t v28 = v47;
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v35, v17, v47);
    unint64_t v29 = v49;
    unint64_t v42 = v17;
    swift_bridgeObjectRetain();
    sub_226BBE4F0();
    (*(void (**)(_OWORD *__return_ptr, char *, char *))((*MEMORY[0x263F8EED0] & *v25) + 0x58))(v52, v23, v12);
    v50[6] = v52[6];
    v50[7] = v52[7];
    uint64_t v51 = v53;
    v50[2] = v52[2];
    v50[3] = v52[3];
    v50[4] = v52[4];
    v50[5] = v52[5];
    v50[0] = v52[0];
    v50[1] = v52[1];
    _Block_copy(v29);
    sub_226BBC558((uint64_t *)v50, (uint64_t)v29);
    _Block_release(v29);

    (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v36);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v42, v28);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v23, v44);
    sub_226BBDFC8((uint64_t)v52);
    _Block_release(v29);
  }
  else
  {
    sub_226BBDF1C();
    uint64_t v30 = (void *)swift_allocError();
    *uint64_t v31 = 0;
    uint64_t v32 = (void *)sub_226BBE460();
    uint64_t v33 = v49;
    (*((void (**)(const void *, void, void *))v49 + 2))(v49, 0, v32);

    _Block_release(v33);
  }
}

void sub_226BBD784(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, const void *a6)
{
  v27[1] = a1;
  v27[2] = a2;
  uint64_t v9 = sub_226BBE540();
  uint64_t v29 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155FA8);
  uint64_t v12 = *(void *)(v28 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v28);
  uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v27 - v16;
  uint64_t v30 = a6;
  _Block_copy(a6);
  uint64_t v18 = sub_226BBAF38();
  if (v18)
  {
    uint64_t v19 = v18;
    sub_226BBDF70(a3, a4);
    uint64_t v20 = v9;
    sub_226BBE510();
    uint64_t v21 = v28;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v28);
    swift_bridgeObjectRetain();
    sub_226BBE520();
    (*(void (**)(_OWORD *__return_ptr, char *))((*MEMORY[0x263F8EED0] & *v19) + 0x60))(v33, v11);
    v31[6] = v33[6];
    v31[7] = v33[7];
    uint64_t v32 = v34;
    v31[2] = v33[2];
    v31[3] = v33[3];
    v31[4] = v33[4];
    v31[5] = v33[5];
    v31[0] = v33[0];
    v31[1] = v33[1];
    uint64_t v22 = v30;
    _Block_copy(v30);
    sub_226BBC558((uint64_t *)v31, (uint64_t)v22);
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v20);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v21);
    sub_226BBDFC8((uint64_t)v33);
    _Block_release(v22);
  }
  else
  {
    sub_226BBDF1C();
    uint64_t v23 = (void *)swift_allocError();
    *unint64_t v24 = 0;
    unint64_t v25 = (void *)sub_226BBE460();
    uint64_t v26 = v30;
    (*((void (**)(const void *, void, void *))v30 + 2))(v30, 0, v25);

    _Block_release(v26);
  }
}

void sub_226BBDACC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (**a8)(void, void, void))
{
  uint64_t v33 = a5;
  uint64_t v34 = a6;
  uint64_t v31 = a3;
  unint64_t v32 = a4;
  uint64_t v9 = sub_226BBE500();
  uint64_t v37 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268155F68);
  uint64_t v30 = *(void *)(v38 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v38);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v27 - v15;
  uint64_t v17 = sub_226BBE540();
  uint64_t v35 = *(void *)(v17 - 8);
  uint64_t v36 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  _Block_copy(a8);
  uint64_t v20 = sub_226BBAF38();
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v28 = v11;
    uint64_t v29 = v9;
    swift_bridgeObjectRetain();
    sub_226BBE530();
    sub_226BBDF70(v31, v32);
    sub_226BBE510();
    uint64_t v22 = v30;
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v14, v16, v38);
    swift_bridgeObjectRetain();
    uint64_t v23 = v28;
    sub_226BBE4F0();
    (*(void (**)(_OWORD *__return_ptr, char *, char *))((*MEMORY[0x263F8EED0] & *v21) + 0x68))(v41, v19, v23);
    v39[6] = v41[6];
    v39[7] = v41[7];
    uint64_t v40 = v42;
    v39[2] = v41[2];
    v39[3] = v41[3];
    v39[4] = v41[4];
    v39[5] = v41[5];
    v39[0] = v41[0];
    v39[1] = v41[1];
    _Block_copy(a8);
    sub_226BBC558((uint64_t *)v39, (uint64_t)a8);
    _Block_release(a8);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v29);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v38);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v19, v36);
    sub_226BBDFC8((uint64_t)v41);
    _Block_release(a8);
  }
  else
  {
    sub_226BBDF1C();
    unint64_t v24 = (void *)swift_allocError();
    *unint64_t v25 = 0;
    uint64_t v26 = (void *)sub_226BBE460();
    ((void (**)(void, void, void *))a8)[2](a8, 0, v26);

    _Block_release(a8);
  }
}

uint64_t sub_226BBDEC4(uint64_t a1, unint64_t a2)
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

unint64_t sub_226BBDF1C()
{
  unint64_t result = qword_268155F70;
  if (!qword_268155F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155F70);
  }
  return result;
}

uint64_t sub_226BBDF70(uint64_t a1, unint64_t a2)
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

uint64_t sub_226BBDFC8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void **)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v10 = *(void **)(a1 + 96);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(void **)(a1 + 104);
  uint64_t v15 = *(void *)(a1 + 120);
  uint64_t v16 = *(void *)(a1 + 112);
  uint64_t v14 = *(void **)(a1 + 128);

  sub_226BBE090(v3, v4, v5);
  sub_226BBE090(v6, v7, v8);
  sub_226BBE090(v12, v9, v10);

  sub_226BBE090(v16, v15, v14);
  return a1;
}

void sub_226BBE090(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_226BBE0D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_226BBE130(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_226BBDF70(a1, a2);
  }
  return a1;
}

uint64_t sub_226BBE144(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_226BBDEC4(a1, a2);
  }
  return a1;
}

uint64_t sub_226BBE158(uint64_t a1, unint64_t *a2)
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

uint64_t sub_226BBE194(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_226BBE1F8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShieldConfigurationExtensionContext.ExtensionError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ShieldConfigurationExtensionContext.ExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x226BBE3B8);
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

uint64_t sub_226BBE3E0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_226BBE3EC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShieldConfigurationExtensionContext.ExtensionError()
{
  return &type metadata for ShieldConfigurationExtensionContext.ExtensionError;
}

unint64_t sub_226BBE40C()
{
  unint64_t result = qword_268155FC0;
  if (!qword_268155FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268155FC0);
  }
  return result;
}

uint64_t sub_226BBE460()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_226BBE470()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_226BBE480()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_226BBE490()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_226BBE4A0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_226BBE4B0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_226BBE4C0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_226BBE4D0()
{
  return MEMORY[0x270EF5810]();
}

uint64_t sub_226BBE4E0()
{
  return MEMORY[0x270EF5830]();
}

uint64_t sub_226BBE4F0()
{
  return MEMORY[0x270EF5840]();
}

uint64_t sub_226BBE500()
{
  return MEMORY[0x270EF5858]();
}

uint64_t sub_226BBE510()
{
  return MEMORY[0x270EF5868]();
}

uint64_t sub_226BBE520()
{
  return MEMORY[0x270EF5880]();
}

uint64_t sub_226BBE530()
{
  return MEMORY[0x270EF5888]();
}

uint64_t sub_226BBE540()
{
  return MEMORY[0x270EF5898]();
}

uint64_t sub_226BBE550()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_226BBE560()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_226BBE570()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_226BBE580()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_226BBE590()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_226BBE5A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_226BBE5B0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_226BBE5C0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_226BBE5D0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_226BBE5E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_226BBE5F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_226BBE600()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_226BBE610()
{
  return MEMORY[0x270EF1DD0]();
}

uint64_t sub_226BBE620()
{
  return MEMORY[0x270EF1DE8]();
}

uint64_t sub_226BBE630()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_226BBE640()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_226BBE650()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_226BBE660()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_226BBE670()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_226BBE680()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_226BBE690()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_226BBE6A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_226BBE6B0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_226BBE6C0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_226BBE6D0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_226BBE6E0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_226BBE6F0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_226BBE700()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_226BBE710()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_226BBE720()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_226BBE730()
{
  return MEMORY[0x270F9FC90]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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