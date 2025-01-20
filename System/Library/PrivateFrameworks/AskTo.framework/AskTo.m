uint64_t sub_24873E278()
{
  uint64_t v0;

  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ATDispatcher()
{
  return self;
}

uint64_t sub_24873E2AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24873E380(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24873F7A4((uint64_t)v12, *a3);
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
      sub_24873F7A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24873E380(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_248741B08();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24873E53C(a5, a6);
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
  uint64_t v8 = sub_248741B38();
  if (!v8)
  {
    sub_248741B58();
    __break(1u);
LABEL_17:
    uint64_t result = sub_248741B68();
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

uint64_t sub_24873E53C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24873E5D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24873E7B4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24873E7B4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24873E5D4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24873E74C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_248741B28();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_248741B58();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_248741AA8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_248741B68();
    __break(1u);
LABEL_14:
    uint64_t result = sub_248741B58();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24873E74C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269323EC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24873E7B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269323EC8);
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
  uint64_t result = sub_248741B68();
  __break(1u);
  return result;
}

uint64_t sub_24873E904(uint64_t a1, __int16 a2, uint64_t a3)
{
  *(_WORD *)(v3 + 88) = a2;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a3;
  return MEMORY[0x270FA2498](sub_24873E928, 0, 0);
}

uint64_t sub_24873E928()
{
  uint64_t v24 = v0;
  sub_248741A48();
  swift_allocObject();
  *(void *)(v0 + 56) = sub_248741A38();
  if (qword_269323E88 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2487419C8();
  __swift_project_value_buffer(v1, (uint64_t)qword_2693240D0);
  uint64_t v2 = sub_2487419A8();
  os_log_type_t v3 = sub_248741AE8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v23 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    *(void *)(v0 + 24) = sub_24873E2AC(0xD00000000000003ALL, 0x8000000248742400, &v23);
    sub_248741AF8();
    *(_WORD *)(v4 + 12) = 2080;
    id v6 = objc_msgSend(self, sel_mainBundle);
    id v7 = objc_msgSend(v6, sel_bundleIdentifier);

    if (v7)
    {
      uint64_t v8 = sub_248741A78();
      unint64_t v10 = v9;
    }
    else
    {
      unint64_t v10 = 0xE300000000000000;
      uint64_t v8 = 7104878;
    }
    *(void *)(v0 + 32) = sub_24873E2AC(v8, v10, &v23);
    sub_248741AF8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24873C000, v2, v3, "%s called with client bundle identifier %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57D6E0](v5, -1, -1);
    MEMORY[0x24C57D6E0](v4, -1, -1);
  }

  id v11 = *(id *)(v0 + 40);
  uint64_t v12 = sub_2487419A8();
  os_log_type_t v13 = sub_248741AE8();
  BOOL v14 = os_log_type_enabled(v12, v13);
  v15 = *(void **)(v0 + 40);
  if (v14)
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = (void *)swift_slowAlloc();
    *(_DWORD *)v16 = 138412290;
    *(void *)(v0 + 16) = v15;
    id v18 = v15;
    sub_248741AF8();
    void *v17 = v15;

    _os_log_impl(&dword_24873C000, v12, v13, "Sending question to daemon: %@", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269323EC0);
    swift_arrayDestroy();
    MEMORY[0x24C57D6E0](v17, -1, -1);
    MEMORY[0x24C57D6E0](v16, -1, -1);
  }
  else
  {

    uint64_t v12 = *(NSObject **)(v0 + 40);
  }

  v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v19;
  void *v19 = v0;
  v19[1] = sub_24873ECFC;
  uint64_t v20 = *(void *)(v0 + 40);
  uint64_t v21 = *(unsigned __int16 *)(v0 + 88);
  return MEMORY[0x270F0EAD8](v20, v21);
}

uint64_t sub_24873ECFC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24873EF40;
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_24873EE2C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24873EE2C()
{
  **(void **)(v0 + 48) = *(void *)(v0 + 80);
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    uint64_t v3 = sub_248741A78();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  id v6 = (void *)sub_2487419D8();
  MEMORY[0x24C57D230](v3, v5, v6, 1900);

  swift_bridgeObjectRelease();
  sub_248741A08();
  swift_release();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24873EF40()
{
  uint64_t v1 = *(void *)(v0 + 72);
  sub_24873F700();
  swift_allocError();
  *id v2 = v1;
  swift_willThrow();
  sub_248741A08();
  swift_release();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24873EFE4(uint64_t a1, __int16 a2, uint64_t a3)
{
  *(_WORD *)(v3 + 136) = a2;
  *(void *)(v3 + 88) = a1;
  uint64_t v7 = sub_248741998();
  *(void *)(v3 + 96) = v7;
  *(void *)(v3 + 104) = *(void *)(v7 - 8);
  *(void *)(v3 + 112) = swift_task_alloc();
  uint64_t v8 = swift_task_alloc();
  *(void *)(v3 + 120) = v8;
  *(void *)uint64_t v8 = v3;
  *(void *)(v8 + 8) = sub_24873F108;
  *(_WORD *)(v8 + 88) = a2;
  *(void *)(v8 + 40) = a1;
  *(void *)(v8 + 48) = a3;
  return MEMORY[0x270FA2498](sub_24873E928, 0, 0);
}

uint64_t sub_24873F108()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_24873F364;
  }
  else {
    id v2 = sub_24873F21C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24873F21C()
{
  sub_2487419E8();
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_248741A78();
  }
  uint64_t v4 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[12];
  sub_2487419F8();
  sub_248741A58();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  id v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24873F364()
{
  id v1 = *(void **)(v0 + 128);
  *(void *)(v0 + 56) = v1;
  id v2 = v1;
  id v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269323EA0);
  if (swift_dynamicCast())
  {
    *(void *)(v0 + 80) = &type metadata for ATDispatchCenter.SendError;
    uint64_t v4 = *(void **)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269323EB0);
    sub_248741A88();
    if (v4 == (void *)1)
    {

      sub_24873F6B8((id)1);
    }
    else
    {

      if (v4) {
        sub_24873F6B8(v4);
      }
      else {
        sub_24873F6B8(0);
      }
    }
  }
  else
  {
    uint64_t v5 = *(void **)(v0 + 128);
    swift_getErrorValue();
    *(void *)(v0 + 40) = swift_getDynamicType();
    *(void *)(v0 + 48) = *(void *)(v0 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269323EA8);
    sub_248741A88();
  }
  sub_2487419E8();
  id v6 = objc_msgSend(self, sel_mainBundle);
  id v7 = objc_msgSend(v6, sel_bundleIdentifier);

  if (v7)
  {
    sub_248741A78();
  }
  uint64_t v8 = *(void *)(v0 + 104);
  uint64_t v9 = *(void *)(v0 + 112);
  uint64_t v10 = *(void *)(v0 + 96);
  sub_2487419F8();
  sub_248741A58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  if (v1) {
    swift_willThrow();
  }
  swift_task_dealloc();
  id v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
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

void sub_24873F6B8(id a1)
{
  if ((unint64_t)a1 >= 2) {
}
  }

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24873F700()
{
  unint64_t result = qword_269323EB8;
  if (!qword_269323EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269323EB8);
  }
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

uint64_t sub_24873F7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t ATDispatchCenter.SendError.id.getter()
{
  uint64_t v1 = 0x72456D6574737973;
  if (*v0 == 1) {
    uint64_t v1 = 0x5164696C61766E69;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

unint64_t ATDispatchCenter.SendError.errorDescription.getter()
{
  unint64_t v1 = 0xD00000000000001ALL;
  id v2 = *v0;
  if (*v0)
  {
    if (v2 == (void *)1)
    {
      return 0xD000000000000022;
    }
    else
    {
      id v3 = v2;
      sub_248741B18();
      sub_248741A98();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269323EA0);
      sub_248741B48();
      sub_24873F6B8(v2);
      return 0;
    }
  }
  return v1;
}

uint64_t sub_24873F96C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ATDispatchCenter.SendError.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24873F9A4()
{
  type metadata accessor for ATDispatcher();
  swift_allocObject();
  uint64_t v0 = (uint64_t *)swift_retain();
  id v1 = sub_248740E50(v0);
  uint64_t result = swift_release();
  qword_269323ED0 = (uint64_t)v1;
  return result;
}

id static ATDispatchCenter.shared.getter()
{
  if (qword_269323E80 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269323ED0;
  return v0;
}

id ATDispatchCenter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ATDispatchCenter.send(_:to:)(uint64_t a1, __int16 a2)
{
  *(void *)(v2 + 16) = 0;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24873FC28;
  return sub_24873EFE4(a1, a2, v2 + 16);
}

uint64_t sub_24873FC28()
{
  *(void *)(*(void *)v1 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24873FD5C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24873FD44;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24873FD44()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24873FD5C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24873FF44(void *a1, __int16 a2, void *aBlock, void *a4)
{
  v4[3] = a1;
  v4[4] = a4;
  v4[5] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a4;
  v4[2] = 0;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_248740014;
  return sub_24873EFE4((uint64_t)v8, a2, (uint64_t)(v4 + 2));
}

uint64_t sub_248740014()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2487401B4;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_248740130;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248740130()
{
  uint64_t v1 = *(void **)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);

  (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  _Block_release(*(const void **)(v0 + 40));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2487401B4()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v3 = *(void **)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);

  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_248741988();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  _Block_release(*(const void **)(v0 + 40));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t ATDispatchCenter.send(_:to:destinationsNotSupportingLegacyAskViaMessages:)(uint64_t a1, __int16 a2, uint64_t a3)
{
  *(_WORD *)(v3 + 40) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a3;
  return MEMORY[0x270FA2498](sub_248740288, 0, 0);
}

uint64_t sub_248740288()
{
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    uint64_t v3 = sub_248741A78();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  id v6 = (void *)sub_2487419D8();
  MEMORY[0x24C57D230](v3, v5, v6, 100);

  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2487403B8;
  uint64_t v9 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + 24);
  __int16 v10 = *(_WORD *)(v0 + 40);
  return sub_24873EFE4(v9, v10, v8);
}

uint64_t sub_2487403B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t ATDispatchCenter.addResponseListener(_:)(uint64_t a1)
{
  return sub_2487404D0(a1, (SEL *)&selRef_addObject_);
}

uint64_t ATDispatchCenter.removeResponseListener(_:)(uint64_t a1)
{
  return sub_2487404D0(a1, (SEL *)&selRef_removeObject_);
}

uint64_t sub_2487404D0(uint64_t a1, SEL *a2)
{
  uint64_t v5 = OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners;
  objc_sync_enter(*(id *)(v2 + OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners));
  objc_msgSend(*(id *)(v2 + v5), *a2, a1);
  id v6 = *(void **)(v2 + v5);
  return objc_sync_exit(v6);
}

void sub_24874053C(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v7 = OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners;
  uint64_t v8 = *(void **)&a1[OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners];
  swift_unknownObjectRetain();
  uint64_t v9 = a1;
  objc_sync_enter(v8);
  objc_msgSend(*(id *)&a1[v7], *a4, a3);
  objc_sync_exit(*(id *)&a1[v7]);
  swift_unknownObjectRelease();
}

uint64_t ATDispatchCenter.screenTimeDidReceiveAnswer(_:forRequestWithID:responderDSID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_2487405FC, 0, 0);
}

uint64_t sub_2487405FC()
{
  sub_248741A48();
  swift_allocObject();
  v0[7] = sub_248741A38();
  id v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *id v1 = v0;
  v1[1] = sub_2487406C0;
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = v0[2];
  return MEMORY[0x270F0EAD0](v6, v4, v5, v2, v3);
}

uint64_t sub_2487406C0()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_248740840;
  }
  else {
    uint64_t v2 = sub_2487407D4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2487407D4()
{
  sub_248741A08();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248740840()
{
  sub_248741A08();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id ATDispatchCenter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ATDispatchCenter.init()()
{
}

uint64_t sub_248740940(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_248741858;
  return v6();
}

uint64_t sub_248740A0C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_248741858;
  return v7();
}

uint64_t sub_248740AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_248741AD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_248741AC8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_248741650(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_248741AB8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_248740C7C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248740D58;
  return v6(a1);
}

uint64_t sub_248740D58()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_248740E50(uint64_t *a1)
{
  uint64_t v1 = *a1;
  v16[3] = v1;
  v16[4] = &off_26FC79E40;
  v16[0] = a1;
  uint64_t v2 = (objc_class *)type metadata accessor for ATDispatchCenter();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v1);
  MEMORY[0x270FA5388](v4, v4);
  uint64_t v6 = (uint64_t *)((char *)&v14 - v5);
  (*(void (**)(char *))(v7 + 16))((char *)&v14 - v5);
  uint64_t v8 = *v6;
  v15[3] = v1;
  v15[4] = &off_26FC79E40;
  v15[0] = v8;
  uint64_t v9 = OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners;
  __int16 v10 = self;
  id v11 = v3;
  *(void *)&v3[v9] = objc_msgSend(v10, sel_weakObjectsHashTable);
  sub_2487417F0((uint64_t)v15, (uint64_t)&v11[OBJC_IVAR____TtC5AskTo16ATDispatchCenter_dispatcher]);

  v14.receiver = v11;
  v14.super_class = v2;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return v12;
}

uint64_t sub_248740FEC()
{
  return MEMORY[0x263F8D320];
}

uint64_t type metadata accessor for ATDispatchCenter()
{
  return self;
}

uint64_t method lookup function for ATDispatchCenter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATDispatchCenter);
}

void *initializeBufferWithCopyOfBuffer for ATDispatchCenter.SendError(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for ATDispatchCenter.SendError(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for ATDispatchCenter.SendError(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF) {
      id v7 = v4;
    }
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    id v5 = v4;
    uint64_t v6 = *a1;
    *a1 = v4;
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for ATDispatchCenter.SendError(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ATDispatchCenter.SendError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ATDispatchCenter.SendError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_248741230(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24874124C(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ATDispatchCenter.SendError()
{
  return &type metadata for ATDispatchCenter.SendError;
}

uint64_t sub_24874127C()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2487412C4()
{
  unsigned int v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 32);
  unsigned int v4 = *(void **)(v0 + 40);
  __int16 v5 = *(_WORD *)(v0 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_248741388;
  id v7 = (uint64_t (*)(void *, __int16, void *, void *))((char *)&dword_269323F08 + dword_269323F08);
  return v7(v2, v5, v3, v4);
}

uint64_t sub_248741388()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248741480()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  __int16 v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *__int16 v5 = v1;
  v5[1] = sub_248741858;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_269323F18 + dword_269323F18);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_11Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_248741584(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_248741858;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_269323F28 + dword_269323F28);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_248741650(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269323F00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2487416B0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2487416E8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248741388;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269323F38 + dword_269323F38);
  return v6(a1, v4);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_2487417F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24874185C()
{
  uint64_t v0 = sub_2487419C8();
  __swift_allocate_value_buffer(v0, qword_2693240D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2693240D0);
  return sub_2487419B8();
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

uint64_t sub_248741948()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_248741958()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_248741968()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_248741978()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_248741988()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_248741998()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2487419A8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2487419B8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2487419C8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2487419D8()
{
  return MEMORY[0x270F0EA30]();
}

uint64_t sub_2487419E8()
{
  return MEMORY[0x270F0EA38]();
}

uint64_t sub_2487419F8()
{
  return MEMORY[0x270F0EA78]();
}

uint64_t sub_248741A08()
{
  return MEMORY[0x270F0EAC8]();
}

uint64_t sub_248741A38()
{
  return MEMORY[0x270F0EAE0]();
}

uint64_t sub_248741A48()
{
  return MEMORY[0x270F0EAE8]();
}

uint64_t sub_248741A58()
{
  return MEMORY[0x270F0EB28]();
}

uint64_t sub_248741A68()
{
  return MEMORY[0x270F0EB30]();
}

uint64_t sub_248741A78()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_248741A88()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_248741A98()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_248741AA8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_248741AB8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_248741AC8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_248741AD8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_248741AE8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_248741AF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_248741B08()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_248741B18()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_248741B28()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_248741B38()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_248741B48()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_248741B58()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_248741B68()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_248741B78()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_248741B88()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_248741B98()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_248741BA8()
{
  return MEMORY[0x270F9FB48]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}