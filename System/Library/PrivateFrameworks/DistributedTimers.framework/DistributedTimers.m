uint64_t DTXPCCoder.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_24CD75188();
  swift_allocObject();
  v2 = sub_24CD75178();
  sub_24CD75158();
  swift_allocObject();
  result = sub_24CD75148();
  *a1 = v2;
  a1[1] = result;
  return result;
}

xpc_object_t DTXPCCoder.encode<A>(_:)()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v2 = sub_24CD75168();
  if (!v0)
  {
    uint64_t v4 = v2;
    unint64_t v5 = v3;
    v6 = (void *)sub_24CD75318();
    sub_24CD47F6C(v4, v5);
    xpc_dictionary_set_value(empty, "data", v6);
  }
  swift_unknownObjectRelease();
  return empty;
}

uint64_t sub_24CD47F6C(uint64_t a1, unint64_t a2)
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

uint64_t DTXPCCoder.encode<A>(_:into:)(uint64_t a1, void *a2)
{
  uint64_t result = sub_24CD75168();
  if (!v2)
  {
    uint64_t v6 = result;
    unint64_t v7 = v5;
    v8 = (void *)sub_24CD75318();
    sub_24CD47F6C(v6, v7);
    xpc_dictionary_set_value(a2, "data", v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

void DTXPCCoder.encode(_:into:)(void *a1, void *a2)
{
  type metadata accessor for DTError();
  id v5 = a1;
  id v10 = DTError.__allocating_init(_:)(a1);
  sub_24CD48D60(&qword_26982D170);
  uint64_t v6 = sub_24CD75168();
  unint64_t v8 = v7;

  if (!v2)
  {
    v9 = (void *)sub_24CD75318();
    sub_24CD47F6C(v6, v8);
    xpc_dictionary_set_value(a2, "error", v9);
    swift_unknownObjectRelease();
  }
}

uint64_t DTXPCCoder.encode(data:into:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)sub_24CD75318();
  xpc_dictionary_set_value(a3, "data", v4);
  return swift_unknownObjectRelease();
}

uint64_t DTXPCCoder.decode<A>(_:)(void *a1)
{
  length[1] = *MEMORY[0x263EF8340];
  length[0] = 0;
  data = xpc_dictionary_get_data(a1, "data", length);
  if (data)
  {
    uint64_t v4 = sub_24CD48CAC(data, length[0]);
    unint64_t v6 = v5;
    sub_24CD75138();
    return sub_24CD47F6C(v4, v6);
  }
  unint64_t v8 = xpc_dictionary_get_data(a1, "error", length);
  if (!v8)
  {
    uint64_t v13 = sub_24CD754E8();
    swift_unknownObjectRelease();
    if ((void *)v13 == a1)
    {
      type metadata accessor for DTError();
      uint64_t v15 = 0x65746E6920435058;
      unsigned int v17 = 1886745202;
    }
    else
    {
      uint64_t v14 = sub_24CD754D8();
      swift_unknownObjectRelease();
      type metadata accessor for DTError();
      if ((void *)v14 != a1)
      {
        uint64_t v15 = 0x6420435058206F4ELL;
        unint64_t v16 = 0xEB00000000617461;
LABEL_13:
        DTError.__allocating_init(_:_:_:)(3, v15, v16, 0);
        return swift_willThrow();
      }
      uint64_t v15 = 0x61766E6920435058;
      unsigned int v17 = 1633970540;
    }
    unint64_t v16 = v17 | 0xEF64657400000000;
    goto LABEL_13;
  }
  v9 = v8;
  type metadata accessor for DTError();
  uint64_t v10 = sub_24CD48CAC(v9, length[0]);
  unint64_t v12 = v11;
  sub_24CD48D60(&qword_26982D178);
  sub_24CD75138();
  uint64_t result = sub_24CD47F6C(v10, v12);
  if (!v1) {
    return swift_willThrow();
  }
  return result;
}

uint64_t DTXPCEndpoint.xpcEndpoint.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t DTXPCEndpoint.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t DTXPCRequest.context.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

id DTXPCRequest.request.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  char v5 = *(unsigned char *)(v1 + 48);
  *(unsigned char *)(a1 + 24) = v5;
  return sub_24CD48DA4(v2, v3, v4, v5);
}

__n128 DTXPCRequest.init(request:context:)@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = a1[1].n128_u64[0];
  unsigned __int8 v4 = a1[1].n128_u8[8];
  uint64_t v5 = *(void *)(a2 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a2;
  *(void *)(a3 + 16) = v5;
  __n128 result = *a1;
  *(__n128 *)(a3 + 24) = *a1;
  *(void *)(a3 + 40) = v3;
  *(unsigned char *)(a3 + 48) = v4;
  return result;
}

uint64_t DTXPCRequest.description.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  char v5 = *(unsigned char *)(v0 + 48);
  sub_24CD48DA4(v1, v2, v3, v5);
  sub_24CD48E10();
  sub_24CD75A68();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  sub_24CD48E64(v1, v2, v3, v5);
  sub_24CD755C8();
  sub_24CD48ED0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24CD75A68();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x3D74736575716572;
}

BOOL sub_24CD48598(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24CD485B0()
{
  return sub_24CD75B18();
}

uint64_t sub_24CD485F8()
{
  return sub_24CD75B08();
}

uint64_t sub_24CD48624()
{
  return sub_24CD75B18();
}

uint64_t sub_24CD48668()
{
  if (*v0) {
    return 0x74736575716572;
  }
  else {
    return 0x747865746E6F63;
  }
}

uint64_t sub_24CD4869C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CD49CD0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CD486C4()
{
  return 0;
}

void sub_24CD486D0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24CD486DC(uint64_t a1)
{
  unint64_t v2 = sub_24CD48FAC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD48718(uint64_t a1)
{
  unint64_t v2 = sub_24CD48FAC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTXPCRequest.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D190);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v15 = *v1;
  uint64_t v9 = *((void *)v1 + 2);
  uint64_t v8 = *((void *)v1 + 3);
  uint64_t v13 = *((void *)v1 + 4);
  uint64_t v14 = v8;
  uint64_t v12 = *((void *)v1 + 5);
  int v19 = *((unsigned __int8 *)v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD48FAC();
  sub_24CD75B58();
  long long v16 = v15;
  uint64_t v17 = v9;
  char v20 = 0;
  sub_24CD49000();
  sub_24CD75A48();
  if (!v2)
  {
    *(void *)&long long v16 = v14;
    *((void *)&v16 + 1) = v13;
    uint64_t v17 = v12;
    char v18 = v19;
    char v20 = 1;
    sub_24CD49054();
    sub_24CD75A48();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void DTXPCRequest.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D1A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD48FAC();
  sub_24CD75B48();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v21 = 0;
    sub_24CD490F8();
    sub_24CD759D8();
    uint64_t v9 = v18;
    long long v16 = v17;
    uint64_t v10 = v19;
    char v21 = 1;
    sub_24CD4914C();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24CD759D8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v11 = v17;
    uint64_t v12 = v18;
    uint64_t v13 = v19;
    char v14 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24CD48DA4(v11, v12, v13, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)a2 = v16;
    *(void *)(a2 + 8) = v9;
    *(void *)(a2 + 16) = v10;
    *(void *)(a2 + 24) = v11;
    *(void *)(a2 + 32) = v12;
    *(void *)(a2 + 40) = v13;
    *(unsigned char *)(a2 + 48) = v14;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD48E64(v11, v12, v13, v14);
  }
}

void sub_24CD48BB4(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_24CD48BCC(void *a1)
{
  return DTXPCRequest.encode(to:)(a1);
}

uint64_t sub_24CD48BE8(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_24CD48CAC(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_24CD48BE8(__src, &__src[a2]);
  }
  sub_24CD752B8();
  swift_allocObject();
  sub_24CD75278();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_24CD75328();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_24CD48D60(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DTError();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_24CD48DA4(id result, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      uint64_t result = result;
      break;
    case 5:
    case 8:
      uint64_t result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24CD48E10()
{
  unint64_t result = qword_26982D180;
  if (!qword_26982D180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D180);
  }
  return result;
}

void sub_24CD48E64(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:

      break;
    case 5:
    case 8:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

unint64_t sub_24CD48ED0()
{
  unint64_t result = qword_26982D188;
  if (!qword_26982D188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D188);
  }
  return result;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24CD48FAC()
{
  unint64_t result = qword_26982D990[0];
  if (!qword_26982D990[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26982D990);
  }
  return result;
}

unint64_t sub_24CD49000()
{
  unint64_t result = qword_26982D198;
  if (!qword_26982D198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D198);
  }
  return result;
}

unint64_t sub_24CD49054()
{
  unint64_t result = qword_26982D1A0;
  if (!qword_26982D1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D1A0);
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

unint64_t sub_24CD490F8()
{
  unint64_t result = qword_26982D1B0;
  if (!qword_26982D1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D1B0);
  }
  return result;
}

unint64_t sub_24CD4914C()
{
  unint64_t result = qword_26982D1B8;
  if (!qword_26982D1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D1B8);
  }
  return result;
}

uint64_t destroy for DTXPCCoder()
{
  swift_release();

  return swift_release();
}

void *_s17DistributedTimers10DTXPCCoderVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for DTXPCCoder(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for DTXPCCoder(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DTXPCCoder(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DTXPCCoder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTXPCCoder()
{
  return &type metadata for DTXPCCoder;
}

ValueMetadata *type metadata accessor for DTXPCEndpoint()
{
  return &type metadata for DTXPCEndpoint;
}

uint64_t sub_24CD49368(uint64_t a1, unint64_t a2)
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

uint64_t destroy for DTXPCReplyContent(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 2) {
    unsigned int v1 = *(_DWORD *)a1 + 2;
  }
  if (v1 == 1) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else {
    return sub_24CD47F6C(*(void *)a1, *(void *)(a1 + 8));
  }
}

uint64_t initializeWithCopy for DTXPCReplyContent(uint64_t a1, uint64_t *a2)
{
  unsigned int v3 = *((unsigned __int8 *)a2 + 40);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  if (v3 == 1)
  {
    long long v4 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = *a2;
    unint64_t v7 = a2[1];
    sub_24CD49368(*a2, v7);
    char v5 = 0;
    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v7;
  }
  *(unsigned char *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for DTXPCReplyContent(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else {
      sub_24CD47F6C(*(void *)a1, *(void *)(a1 + 8));
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      char v7 = 1;
    }
    else
    {
      uint64_t v9 = *(void *)a2;
      unint64_t v8 = *(void *)(a2 + 8);
      sub_24CD49368(v9, v8);
      char v7 = 0;
      *(void *)a1 = v9;
      *(void *)(a1 + 8) = v8;
    }
    *(unsigned char *)(a1 + 40) = v7;
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DTXPCReplyContent(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a1 + 2;
    }
    if (v4 == 1) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else {
      sub_24CD47F6C(*(void *)a1, *(void *)(a1 + 8));
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2) {
      unsigned int v5 = *(_DWORD *)a2 + 2;
    }
    if (v5 == 1)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      char v7 = 1;
    }
    else
    {
      char v7 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    *(unsigned char *)(a1 + 40) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DTXPCReplyContent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DTXPCReplyContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CD496B8(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t sub_24CD496D8(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DTXPCReplyContent()
{
  return &type metadata for DTXPCReplyContent;
}

uint64_t initializeBufferWithCopyOfBuffer for DTRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for DTXPCRequest(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);

  sub_24CD48E64(v2, v3, v4, v5);
}

uint64_t initializeWithCopy for DTXPCRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  char v7 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24CD48DA4(v4, v5, v6, v7);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v7;
  return a1;
}

uint64_t assignWithCopy for DTXPCRequest(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = v2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)v2[3];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[5];
  LOBYTE(v2) = *((unsigned char *)v2 + 48);
  sub_24CD48DA4(v4, v5, v6, (char)v2);
  char v7 = *(void **)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  char v10 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = (_BYTE)v2;
  sub_24CD48E64(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DTXPCRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  char v5 = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void **)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  char v9 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v5;
  sub_24CD48E64(v6, v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DTXPCRequest(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DTXPCRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 49) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 49) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTXPCRequest()
{
  return &type metadata for DTXPCRequest;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DTXPCRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DTXPCRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CD49B7CLL);
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

uint64_t sub_24CD49BA4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CD49BAC(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DTXPCRequest.CodingKeys()
{
  return &type metadata for DTXPCRequest.CodingKeys;
}

unint64_t sub_24CD49BCC()
{
  unint64_t result = qword_26982DC20[0];
  if (!qword_26982DC20[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26982DC20);
  }
  return result;
}

unint64_t sub_24CD49C24()
{
  unint64_t result = qword_26982DD30;
  if (!qword_26982DD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982DD30);
  }
  return result;
}

unint64_t sub_24CD49C7C()
{
  unint64_t result = qword_26982DD38[0];
  if (!qword_26982DD38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26982DD38);
  }
  return result;
}

uint64_t sub_24CD49CD0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x747865746E6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CD49DC8()
{
  uint64_t v0 = sub_24CD754B8();
  __swift_allocate_value_buffer(v0, qword_26982DDC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26982DDC8);
  sub_24CD5BE68();
  swift_bridgeObjectRetain();
  return sub_24CD754A8();
}

void DTAnalyticsLogEvent(_:)(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v1 = 0xD000000000000021;
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 < 0)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    LOBYTE(v39) = *(void *)a1;
    unint64_t v40 = v2;
    uint64_t v41 = v3;
    long long v42 = *(_OWORD *)(a1 + 24);
    char v43 = v4;
    long long v44 = *(_OWORD *)(a1 + 48);
    uint64_t v45 = v6;
    DTAnalyticsTimerDetails.eventPayload.getter();
    uint64_t v5 = "com.apple.DistributedTimers.timer";
  }
  else
  {
    LOBYTE(v39) = *(void *)a1;
    unint64_t v40 = v2;
    uint64_t v41 = v3;
    DTAnalyticsMonitorDetails.eventPayload.getter();
    uint64_t v1 = 0xD000000000000023;
    uint64_t v5 = "com.apple.DistributedTimers.monitor";
  }
  unint64_t v7 = (unint64_t)(v5 - 32) | 0x8000000000000000;
  int v8 = self;
  sub_24CD4A9AC();
  char v9 = (void *)sub_24CD75528();
  uint64_t v39 = 0;
  id v10 = objc_msgSend(v8, sel_dataWithJSONObject_options_error_, v9, 0, &v39);

  id v11 = (id)v39;
  if (v10)
  {
    uint64_t v12 = sub_24CD75338();
    unint64_t v14 = v13;

    switch(v14 >> 62)
    {
      case 1uLL:
        if (v12 >> 32 < (int)v12) {
          __break(1u);
        }
        swift_retain();
        uint64_t v21 = sub_24CD4B7DC((int)v12, v12 >> 32, v14 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24CD4BA48);
        unint64_t v23 = v22;
        sub_24CD47F6C(v12, v14);
        if (!v23) {
          goto LABEL_12;
        }
        goto LABEL_21;
      case 2uLL:
        uint64_t v24 = *(void *)(v12 + 16);
        uint64_t v25 = *(void *)(v12 + 24);
        swift_retain();
        swift_retain();
        uint64_t v21 = sub_24CD4B7DC(v24, v25, v14 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_24CD4BA48);
        unint64_t v23 = v26;
        swift_release();
        swift_release();
        if (v23) {
          goto LABEL_21;
        }
LABEL_12:
        uint64_t v37 = v12;
        unint64_t v38 = v14;
        sub_24CD49368(v12, v14);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26982D288);
        if (swift_dynamicCast())
        {
          sub_24CD4BAE0(v35, (uint64_t)&v39);
          __swift_project_boxed_opaque_existential_1(&v39, v42);
          if (sub_24CD75958())
          {
            __swift_project_boxed_opaque_existential_1(&v39, v42);
            sub_24CD75948();
            sub_24CD47F6C(v12, v14);
            unint64_t v23 = *((void *)&v35[0] + 1);
            uint64_t v27 = *(void *)&v35[0];
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
            uint64_t v21 = v27;
            break;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
        }
        else
        {
          uint64_t v36 = 0;
          memset(v35, 0, sizeof(v35));
          sub_24CD4BA80((uint64_t)v35);
        }
        uint64_t v15 = sub_24CD4B578(v12, v14);
LABEL_20:
        uint64_t v21 = v15;
        unint64_t v23 = v16;
LABEL_21:
        sub_24CD47F6C(v12, v14);
        break;
      case 3uLL:
        *(void *)((char *)v35 + 6) = 0;
        *(void *)&v35[0] = 0;
        sub_24CD4BA48(&v39);
        sub_24CD47F6C(v12, v14);
        goto LABEL_16;
      default:
        uint64_t v39 = v12;
        LOWORD(v40) = v14;
        BYTE2(v40) = BYTE2(v14);
        BYTE3(v40) = BYTE3(v14);
        BYTE4(v40) = BYTE4(v14);
        BYTE5(v40) = BYTE5(v14);
        uint64_t v15 = sub_24CD75598();
        goto LABEL_20;
    }
  }
  else
  {
    uint64_t v17 = v11;
    uint64_t v18 = v1;
    uint64_t v19 = sub_24CD752D8();

    swift_willThrow();
    uint64_t v39 = 0x22726F727265227BLL;
    unint64_t v40 = 0xE90000000000003ALL;
    swift_getErrorValue();
    sub_24CD75AD8();
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    sub_24CD755C8();
    char v20 = (void *)v19;
    uint64_t v1 = v18;

LABEL_16:
    uint64_t v21 = v39;
    unint64_t v23 = v40;
  }
  if (qword_26982DDC0 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_24CD754B8();
  __swift_project_value_buffer(v28, (uint64_t)qword_26982DDC8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v29 = sub_24CD75498();
  os_log_type_t v30 = sub_24CD75748();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v39 = v32;
    *(_DWORD *)uint64_t v31 = 136446466;
    swift_bridgeObjectRetain();
    *(void *)&v35[0] = sub_24CD4AF20(v1, v7, &v39);
    sub_24CD757C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&v35[0] = sub_24CD4AF20(v21, v23, &v39);
    sub_24CD757C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CD46000, v29, v30, "Event: name=%{public}s, payload=%s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v32, -1, -1);
    MEMORY[0x2533146F0](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v33 = (void *)sub_24CD75558();
  swift_bridgeObjectRelease();
  v34 = (void *)sub_24CD75528();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
}

unint64_t DTAnalyticsEvent.eventName.getter()
{
  if (*(uint64_t *)(v0 + 40) < 0) {
    return 0xD000000000000021;
  }
  else {
    return 0xD000000000000023;
  }
}

unint64_t DTAnalyticsEvent.eventPayload.getter()
{
  if ((*(void *)(v0 + 40) & 0x8000000000000000) != 0) {
    return DTAnalyticsTimerDetails.eventPayload.getter();
  }
  else {
    return DTAnalyticsMonitorDetails.eventPayload.getter();
  }
}

unint64_t DTAnalyticsMonitorDetails.eventPayload.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D298);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CD77F60;
  strcpy((char *)(inited + 32), "accessoryType");
  *(_WORD *)(inited + 46) = -4864;
  *(void *)(inited + 48) = sub_24CD75708();
  *(void *)(inited + 56) = 0x6E6F697461727564;
  *(void *)(inited + 64) = 0xEF73646E6F636553;
  *(void *)(inited + 72) = sub_24CD75B38();
  *(void *)(inited + 80) = 0x646F43726F727265;
  *(void *)(inited + 88) = 0xE900000000000065;
  if (v1)
  {
    objc_msgSend(v1, sel_code);
    *(void *)(inited + 96) = sub_24CD75708();
    *(void *)(inited + 104) = 0x6D6F44726F727265;
    *(void *)(inited + 112) = 0xEB000000006E6961;
    id v3 = objc_msgSend(v1, sel_domain);
    sub_24CD75568();
  }
  else
  {
    *(void *)(inited + 96) = sub_24CD75708();
    *(void *)(inited + 104) = 0x6D6F44726F727265;
    *(void *)(inited + 112) = 0xEB000000006E6961;
  }
  uint64_t v4 = sub_24CD75558();
  swift_bridgeObjectRelease();
  *(void *)(inited + 120) = v4;
  return sub_24CD4AC90(inited);
}

unint64_t DTAnalyticsTimerDetails.eventPayload.getter()
{
  uint64_t v1 = *(void **)(v0 + 8);
  unint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  char v5 = *(unsigned char *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D298);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24CD77F70;
  strcpy((char *)(inited + 32), "accessoryType");
  *(_WORD *)(inited + 46) = -4864;
  *(void *)(inited + 48) = sub_24CD75708();
  *(void *)(inited + 56) = 0x6E6F69746361;
  *(void *)(inited + 64) = 0xE600000000000000;
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  char v11 = v5;
  sub_24CD48DA4(v2, v3, v4, v5);
  DTAnalyticsTimerAction.init(_:)((uint64_t)v10, &v12);
  *(void *)(inited + 72) = sub_24CD75708();
  *(void *)(inited + 80) = 0x646F43726F727265;
  *(void *)(inited + 88) = 0xE900000000000065;
  if (v1)
  {
    objc_msgSend(v1, sel_code);
    *(void *)(inited + 96) = sub_24CD75708();
    *(void *)(inited + 104) = 0x6D6F44726F727265;
    *(void *)(inited + 112) = 0xEB000000006E6961;
    id v7 = objc_msgSend(v1, sel_domain);
    sub_24CD75568();
  }
  else
  {
    *(void *)(inited + 96) = sub_24CD75708();
    *(void *)(inited + 104) = 0x6D6F44726F727265;
    *(void *)(inited + 112) = 0xEB000000006E6961;
  }
  uint64_t v8 = sub_24CD75558();
  swift_bridgeObjectRelease();
  *(void *)(inited + 120) = v8;
  *(void *)(inited + 128) = 0x734D747472;
  *(void *)(inited + 136) = 0xE500000000000000;
  *(void *)(inited + 144) = sub_24CD75B38();
  *(void *)(inited + 152) = 0x656372756F73;
  *(void *)(inited + 160) = 0xE600000000000000;
  *(void *)(inited + 168) = sub_24CD75558();
  return sub_24CD4AC90(inited);
}

unint64_t sub_24CD4A9AC()
{
  unint64_t result = qword_26982D280;
  if (!qword_26982D280)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26982D280);
  }
  return result;
}

unint64_t sub_24CD4A9EC()
{
  if ((*(void *)(v0 + 40) & 0x8000000000000000) != 0) {
    return DTAnalyticsTimerDetails.eventPayload.getter();
  }
  else {
    return DTAnalyticsMonitorDetails.eventPayload.getter();
  }
}

DistributedTimers::DTAnalyticsAccessoryType_optional __swiftcall DTAnalyticsAccessoryType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (DistributedTimers::DTAnalyticsAccessoryType_optional)rawValue;
}

DistributedTimers::DTAnalyticsAccessoryType_optional sub_24CD4AA7C(Swift::Int *a1)
{
  return DTAnalyticsAccessoryType.init(rawValue:)(*a1);
}

void DTAnalyticsTimerAction.init(_:)(uint64_t a1@<X0>, char *a2@<X8>)
{
  unint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v7 = 7;
  switch(*(unsigned char *)(a1 + 24))
  {
    case 1:
      sub_24CD48E64((void *)v4, v5, v6, 1);
      char v7 = 2;
      break;
    case 2:
      sub_24CD48E64((void *)v4, v5, v6, 2);
      char v7 = 3;
      break;
    case 3:
      sub_24CD48E64((void *)v4, v5, v6, 3);
      char v7 = 4;
      break;
    case 4:
      sub_24CD48E64((void *)v4, v5, v6, 4);
      char v7 = 5;
      break;
    case 5:
      sub_24CD48E64((void *)v4, v5, v6, 5);
      goto LABEL_8;
    case 6:
      break;
    case 7:
      char v7 = 8;
      break;
    case 8:
      sub_24CD48E64((void *)v4, v5, v6, 8);
      char v7 = 10;
      break;
    case 9:
LABEL_8:
      char v7 = 0;
      break;
    case 0xA:
      if (v6 | v5) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = v4 == 1;
      }
      if (v8) {
        char v7 = 6;
      }
      else {
        char v7 = 9;
      }
      if (!(v6 | v5 | v4)) {
        char v7 = 0;
      }
      break;
    default:
      sub_24CD48E64((void *)v4, v5, v6, 0);
      char v7 = 1;
      break;
  }
  *a2 = v7;
}

DistributedTimers::DTAnalyticsTimerAction_optional __swiftcall DTAnalyticsTimerAction.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 11;
  if ((unint64_t)rawValue < 0xB) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (DistributedTimers::DTAnalyticsTimerAction_optional)rawValue;
}

uint64_t DTAnalyticsTimerAction.rawValue.getter()
{
  return *v0;
}

BOOL sub_24CD4ABC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

DistributedTimers::DTAnalyticsTimerAction_optional sub_24CD4ABD4(Swift::Int *a1)
{
  return DTAnalyticsTimerAction.init(rawValue:)(*a1);
}

void sub_24CD4ABDC(void *a1@<X8>)
{
  *a1 = *v1;
}

void DTAnalyticsMonitorDetails.accessoryType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t DTAnalyticsMonitorDetails.durationSeconds.getter()
{
  return *(void *)(v0 + 8);
}

void *DTAnalyticsMonitorDetails.error.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void default argument 0 of DTAnalyticsMonitorDetails.init(accessoryType:durationSeconds:error:)(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void DTAnalyticsMonitorDetails.init(accessoryType:durationSeconds:error:)(char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  char v6 = *a1;
  if (a3)
  {
    uint64_t v8 = sub_24CD752C8();
  }
  else
  {
    uint64_t v8 = 0;
  }
  *(unsigned char *)a4 = v6;
  *(void *)(a4 + 8) = a2;
  *(void *)(a4 + 16) = v8;
}

unint64_t sub_24CD4AC90(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D2B0);
  id v2 = (void *)sub_24CD75928();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24CD4B62C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    *char v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

void DTAnalyticsTimerDetails.accessoryType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void *DTAnalyticsTimerDetails.error.getter()
{
  uint64_t v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

id DTAnalyticsTimerDetails.request.getter@<X0>(uint64_t a1@<X8>)
{
  id v2 = *(void **)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  char v5 = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(a1 + 24) = v5;
  return sub_24CD48DA4(v2, v3, v4, v5);
}

uint64_t DTAnalyticsTimerDetails.rttMs.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t DTAnalyticsTimerDetails.source.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

void DTAnalyticsTimerDetails.init(accessoryType:error:request:rttMs:source:)(char *a1@<X0>, void *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  char v11 = *a1;
  long long v12 = *a3;
  uint64_t v13 = *((void *)a3 + 2);
  char v14 = *((unsigned char *)a3 + 24);
  if (a2)
  {
    long long v17 = *a3;
    uint64_t v16 = sub_24CD752C8();

    long long v12 = v17;
  }
  else
  {
    uint64_t v16 = 0;
  }
  *(unsigned char *)a7 = v11;
  *(void *)(a7 + 8) = v16;
  *(_OWORD *)(a7 + 16) = v12;
  *(void *)(a7 + 32) = v13;
  *(unsigned char *)(a7 + 40) = v14;
  *(void *)(a7 + 48) = a4;
  *(void *)(a7 + 56) = a5;
  *(void *)(a7 + 64) = a6;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24CD4AF20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CD4AFF4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CD4C758((uint64_t)v12, *a3);
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
      sub_24CD4C758((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24CD4AFF4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CD757D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CD4B1B0(a5, a6);
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
  uint64_t v8 = sub_24CD758B8();
  if (!v8)
  {
    sub_24CD758D8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CD75938();
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

uint64_t sub_24CD4B1B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CD4B248(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CD4B428(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CD4B428(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CD4B248(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CD4B3C0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CD75878();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CD758D8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CD755D8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CD75938();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CD758D8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CD4B3C0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D910);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CD4B428(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D910);
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
  uint64_t result = sub_24CD75938();
  __break(1u);
  return result;
}

uint64_t sub_24CD4B578(uint64_t a1, unint64_t a2)
{
  sub_24CD49368(a1, a2);
  sub_24CD4B88C(a1, a2);
  sub_24CD47F6C(a1, a2);
  uint64_t v4 = sub_24CD75598();
  swift_release();
  return v4;
}

uint64_t sub_24CD4B5F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CD75598();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_24CD4B62C(uint64_t a1, uint64_t a2)
{
  sub_24CD75AF8();
  sub_24CD755A8();
  uint64_t v4 = sub_24CD75B18();

  return sub_24CD4B6A4(a1, a2, v4);
}

unint64_t sub_24CD4B6A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24CD75AA8() & 1) == 0)
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
      while (!v14 && (sub_24CD75AA8() & 1) == 0);
    }
  }
  return v6;
}

void *sub_24CD4B788(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

uint64_t sub_24CD4B7DC(uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = sub_24CD75288();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = sub_24CD752A8();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = sub_24CD75298();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = (uint64_t)sub_24CD4B788(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

void *sub_24CD4B88C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_24CD75348();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26982D910);
          int64_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_24CD49368(a1, a2);
        uint64_t v13 = sub_24CD75308();
        sub_24CD47F6C(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x24CD4BA38);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_24CD4BA48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24CD75598();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24CD4BA80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D290);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CD4BAE0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_24CD4BAFC()
{
  unint64_t result = qword_26982D2A0;
  if (!qword_26982D2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D2A0);
  }
  return result;
}

unint64_t sub_24CD4BB54()
{
  unint64_t result = qword_26982D2A8;
  if (!qword_26982D2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D2A8);
  }
  return result;
}

id sub_24CD4BBA8(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6 < 0)
  {
    char v8 = a6;
    id v11 = a2;
    sub_24CD48DA4(a3, a4, a5, v8);
    return (id)swift_bridgeObjectRetain();
  }
  else
  {
    return a3;
  }
}

uint64_t destroy for DTAnalyticsEvent(uint64_t a1)
{
  return sub_24CD4BC64(*(void *)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_24CD4BC64(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6 < 0)
  {
    char v7 = a6;

    sub_24CD48E64(a3, a4, a5, v7);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return MEMORY[0x270F9A790]();
  }
}

uint64_t *initializeWithCopy for DTAnalyticsEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)a2[1];
  uint64_t v5 = (void *)a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  sub_24CD4BBA8(*a2, v4, v5, v6, v7, v8);
  *a1 = v3;
  a1[1] = (uint64_t)v4;
  a1[2] = (uint64_t)v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  return a1;
}

uint64_t *assignWithCopy for DTAnalyticsEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)a2[1];
  uint64_t v5 = (void *)a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[8];
  sub_24CD4BBA8(*a2, v4, v5, v6, v7, v8);
  uint64_t v12 = *a1;
  uint64_t v13 = (void *)a1[1];
  uint64_t v14 = (void *)a1[2];
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  uint64_t v17 = a1[5];
  *a1 = v3;
  a1[1] = (uint64_t)v4;
  a1[2] = (uint64_t)v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  sub_24CD4BC64(v12, v13, v14, v15, v16, v17);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for DTAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 64);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void **)(a1 + 8);
  uint64_t v5 = *(void **)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  long long v11 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v11;
  *(void *)(a1 + 64) = v3;
  sub_24CD4BC64(v4, v6, v5, v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DTAnalyticsEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)a1 >> 2;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for DTAnalyticsEvent(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 72) = 1;
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
      *(void *)a1 = 4 * -a2;
      double result = 0.0;
      *(_OWORD *)(a1 + 8) = 0u;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_OWORD *)(a1 + 56) = 0u;
      return result;
    }
    *(unsigned char *)(a1 + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_24CD4BF78(uint64_t a1)
{
  return *(void *)(a1 + 40) >> 63;
}

uint64_t sub_24CD4BF84(uint64_t result)
{
  *(void *)(result + 40) &= ~0x8000000000000000;
  return result;
}

void *sub_24CD4BF94(void *result, uint64_t a2)
{
  uint64_t v2 = result[5] & 0xFLL | (a2 << 63);
  *result &= 3uLL;
  result[5] = v2;
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsEvent()
{
  return &type metadata for DTAnalyticsEvent;
}

uint64_t dispatch thunk of DTAnalyticsPayload.eventPayload.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t getEnumTagSinglePayload for DTAnalyticsAccessoryType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DTAnalyticsAccessoryType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *double result = a2 + 2;
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
        JUMPOUT(0x24CD4C134);
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
          *double result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsAccessoryType()
{
  return &type metadata for DTAnalyticsAccessoryType;
}

uint64_t getEnumTagSinglePayload for DTAnalyticsTimerAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DTAnalyticsTimerAction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *double result = a2 + 10;
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
        JUMPOUT(0x24CD4C2C8);
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
          *double result = a2 + 10;
        break;
    }
  }
  return result;
}

unsigned char *sub_24CD4C2F0(unsigned char *result, char a2)
{
  *double result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsTimerAction()
{
  return &type metadata for DTAnalyticsTimerAction;
}

uint64_t initializeBufferWithCopyOfBuffer for DTAnalyticsMonitorDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  id v4 = v3;
  return a1;
}

void destroy for DTAnalyticsMonitorDetails(uint64_t a1)
{
}

uint64_t assignWithCopy for DTAnalyticsMonitorDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  int v3 = *(void **)(a1 + 16);
  id v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  id v5 = v4;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DTAnalyticsMonitorDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v3 = *(void **)(a1 + 16);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for DTMonitorEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
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

uint64_t storeEnumTagSinglePayload for DTMonitorEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsMonitorDetails()
{
  return &type metadata for DTAnalyticsMonitorDetails;
}

uint64_t destroy for DTAnalyticsTimerDetails(uint64_t a1)
{
  sub_24CD48E64(*(void **)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DTAnalyticsTimerDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  id v9 = v4;
  sub_24CD48DA4(v5, v6, v7, v8);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DTAnalyticsTimerDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v4 = *(void **)(a1 + 8);
  id v5 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v5;
  id v6 = v5;

  uint64_t v7 = *(void **)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  char v10 = *(unsigned char *)(a2 + 40);
  sub_24CD48DA4(v7, v8, v9, v10);
  long long v11 = *(void **)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v10;
  sub_24CD48E64(v11, v12, v13, v14);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DTAnalyticsTimerDetails(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  int v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  uint64_t v5 = *(void *)(a2 + 32);
  char v6 = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(void **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v5;
  char v10 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v6;
  sub_24CD48E64(v7, v8, v9, v10);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DTAnalyticsTimerDetails(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DTAnalyticsTimerDetails(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTAnalyticsTimerDetails()
{
  return &type metadata for DTAnalyticsTimerDetails;
}

uint64_t sub_24CD4C758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t static DTError.domain.getter()
{
  return 0x726F7272455444;
}

uint64_t static DTError.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t DTError.message.getter()
{
  id v1 = objc_msgSend(v0, sel_userInfo);
  uint64_t v2 = sub_24CD75538();

  sub_24CD75448();
  uint64_t v3 = sub_24CD75418();
  if (!*(void *)(v2 + 16) || (unint64_t v5 = sub_24CD4B62C(v3, v4), (v6 & 1) == 0))
  {
    long long v9 = 0u;
    long long v10 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_24CD4C758(*(void *)(v2 + 56) + 32 * v5, (uint64_t)&v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1))
  {
LABEL_9:
    sub_24CD4D5B4((uint64_t)&v9);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v8;
  }
  else {
    return 0;
  }
}

id DTError.__allocating_init(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  return DTError.init(_:_:_:_:)(0x726F7272455444, 0xE700000000000000, a1, a2, a3, a4);
}

id DTError.__allocating_init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v13 = objc_allocWithZone(v6);
  return DTError.init(_:_:_:_:)(a1, a2, a3, a4, a5, a6);
}

id DTError.init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v7 = v6;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (a5)
  {
    sub_24CD75448();
    uint64_t v13 = sub_24CD75418();
    uint64_t v15 = v14;
    unint64_t v39 = MEMORY[0x263F8D310];
    *(void *)&long long v38 = a4;
    *((void *)&v38 + 1) = a5;
    sub_24CD4D654(&v38, v37);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24CD4D964(v37, v13, v15, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = &off_2652F7000;
  if (a6)
  {
    id v18 = a6;
    uint64_t v19 = (void *)sub_24CD752C8();
    uint64_t v20 = sub_24CD75568();
    uint64_t v34 = v21;
    uint64_t v35 = v20;
    id v22 = objc_msgSend(v19, sel_domain);
    sub_24CD75568();

    id v33 = objc_msgSend(v19, sel_code);
    id v23 = objc_msgSend(v19, sel_userInfo);
    uint64_t v36 = a3;
    sub_24CD75538();

    id v24 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v25 = (void *)sub_24CD75558();
    swift_bridgeObjectRelease();
    uint64_t v17 = &off_2652F7000;
    unint64_t v26 = (void *)sub_24CD75528();
    swift_bridgeObjectRelease();
    id v27 = objc_msgSend(v24, sel_initWithDomain_code_userInfo_, v25, v33, v26);

    a3 = v36;
    unint64_t v39 = sub_24CD4D614();
    *(void *)&long long v38 = v27;
    sub_24CD4D654(&v38, v37);
    char v28 = swift_isUniquelyReferenced_nonNull_native();
    sub_24CD4D964(v37, v35, v34, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v29 = (void *)sub_24CD75558();
  swift_bridgeObjectRelease();
  os_log_type_t v30 = (void *)sub_24CD75528();
  swift_bridgeObjectRelease();
  v40.receiver = v7;
  v40.super_class = ObjectType;
  id v31 = objc_msgSendSuper2(&v40, (SEL)v17[78], v29, a3, v30);

  return v31;
}

id DTError.__allocating_init(_:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DTError.init(_:)(a1);
}

{
  objc_class *v1;
  objc_class *v2;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  objc_super v14;

  uint64_t v2 = v1;
  uint64_t v4 = objc_allocWithZone(v1);
  if (a1)
  {
    uint64_t v13 = v4;
    unint64_t v5 = a1;
    char v6 = (void *)sub_24CD752C8();
    uint64_t v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_24CD75568();
      uint64_t v7 = (id)sub_24CD75558();
      swift_bridgeObjectRelease();
    }
    uint64_t v8 = objc_msgSend(v6, sel_code);
    id v9 = objc_msgSend(v6, sel_userInfo);
    sub_24CD75538();

    long long v10 = (void *)sub_24CD75528();
    swift_bridgeObjectRelease();
    v14.receiver = v13;
    v14.super_class = v2;
    long long v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

id DTError.init(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (void *)sub_24CD752C8();
  id v5 = objc_msgSend(v4, sel_domain);
  if (!v5)
  {
    sub_24CD75568();
    id v5 = (id)sub_24CD75558();
    swift_bridgeObjectRelease();
  }
  id v6 = objc_msgSend(v4, sel_code);
  id v7 = objc_msgSend(v4, sel_userInfo);
  sub_24CD75538();

  uint64_t v8 = (void *)sub_24CD75528();
  swift_bridgeObjectRelease();
  v12.receiver = v2;
  v12.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v12, sel_initWithDomain_code_userInfo_, v5, v6, v8);

  return v9;
}

{
  void *v1;
  void *v2;
  uint64_t ObjectType;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_class *v13;
  objc_super v14;

  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  if (a1)
  {
    uint64_t v13 = (objc_class *)ObjectType;
    id v5 = a1;
    id v6 = (void *)sub_24CD752C8();
    id v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_24CD75568();
      id v7 = (id)sub_24CD75558();
      swift_bridgeObjectRelease();
    }
    uint64_t v8 = objc_msgSend(v6, sel_code);
    id v9 = objc_msgSend(v6, sel_userInfo);
    sub_24CD75538();

    long long v10 = (void *)sub_24CD75528();
    swift_bridgeObjectRelease();
    v14.receiver = v2;
    v14.super_class = v13;
    long long v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

uint64_t DTError.__allocating_init(from:)(uint64_t a1)
{
  id v3 = v1;
  uint64_t v5 = sub_24CD75448();
  sub_24CD4DAB8(a1, (uint64_t)v10);
  uint64_t v6 = sub_24CD75428();
  if (!v2)
  {
    id v7 = (void *)v6;
    id v8 = objc_allocWithZone(v3);
    uint64_t v5 = (uint64_t)DTError.init(_:)(v7);
  }
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v5;
}

void DTError.encode(to:)()
{
  id v1 = objc_allocWithZone((Class)sub_24CD75448());
  id v2 = v0;
  id v3 = (void *)sub_24CD75458();
  sub_24CD75438();
}

id DTError.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  id v8 = (void *)sub_24CD75558();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v9 = (void *)sub_24CD75528();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_code_userInfo_, v8, a3, v9);

  return v10;
}

void DTError.init(domain:code:userInfo:)()
{
}

id DTError.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24CD4D4A4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v2;
  sub_24CD75448();
  sub_24CD4DAB8(a1, (uint64_t)v12);
  uint64_t v7 = sub_24CD75428();
  if (v3) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  id v9 = (void *)v7;
  id v10 = objc_allocWithZone(v4);
  id v11 = DTError.init(_:)(v9);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1);
  *a2 = v11;
  return result;
}

void sub_24CD4D550()
{
  id v1 = *v0;
  id v2 = objc_allocWithZone((Class)sub_24CD75448());
  id v3 = v1;
  uint64_t v4 = (void *)sub_24CD75458();
  sub_24CD75438();
}

uint64_t sub_24CD4D5B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D2B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24CD4D614()
{
  unint64_t result = qword_26982D2C0;
  if (!qword_26982D2C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26982D2C0);
  }
  return result;
}

_OWORD *sub_24CD4D654(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24CD4D664(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D2C8);
  uint64_t v6 = sub_24CD75918();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              id v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      id v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_24CD4D654(v24, v35);
      }
      else
      {
        sub_24CD4C758((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_24CD75AF8();
      sub_24CD755A8();
      uint64_t result = sub_24CD75B18();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_24CD4D654(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

_OWORD *sub_24CD4D964(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24CD4B62C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_24CD4DC00();
      goto LABEL_7;
    }
    sub_24CD4D664(v15, a4 & 1);
    unint64_t v21 = sub_24CD4B62C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_24CD75AC8();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_24CD4D654(a1, v19);
  }
LABEL_13:
  sub_24CD4DB94(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_24CD4DAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for DTError()
{
  return self;
}

uint64_t method lookup function for DTError(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DTError);
}

uint64_t dispatch thunk of DTError.__allocating_init(_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of DTError.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_OWORD *sub_24CD4DB94(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24CD4D654(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_24CD4DC00()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D2C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CD75908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *id v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_24CD4C758(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_24CD4D654(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    id v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

uint64_t DTTimer.description.getter()
{
  id v1 = objc_msgSend(v0, sel_mtAlarm);
  if (!v1)
  {
    id v5 = objc_msgSend(v0, sel_mtAlarmID);
    if (v5)
    {
      uint64_t v6 = v5;
      sub_24CD75568();

      uint64_t v7 = 0x2C6D72616C61;
    }
    else
    {
      id v9 = objc_msgSend(v0, sel_mtTimer);
      if (v9)
      {
        uint64_t v2 = v9;
        uint64_t v3 = (uint64_t)MTTimer.summary.getter();
        goto LABEL_3;
      }
      id v10 = objc_msgSend(v0, sel_mtTimerID);
      if (!v10) {
        return 63;
      }
      uint64_t v11 = v10;
      sub_24CD75568();

      uint64_t v7 = 0x2C72656D6974;
    }
    uint64_t v12 = v7 & 0xFFFFFFFFFFFFLL | 0x6920000000000000;
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    return v12;
  }
  uint64_t v2 = v1;
  uint64_t v3 = MTAlarm.summary.getter();
LABEL_3:
  uint64_t v4 = v3;

  return v4;
}

uint64_t MTAlarm.summary.getter()
{
  id v1 = v0;
  uint64_t v2 = sub_24CD753E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CD75398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = 0;
  unint64_t v27 = 0xE000000000000000;
  sub_24CD75868();
  swift_bridgeObjectRelease();
  uint64_t v26 = 0x69202C6D72616C61;
  unint64_t v27 = 0xEA00000000003D64;
  id v10 = objc_msgSend(v0, sel_alarmID);
  sub_24CD75388();

  sub_24CD4EDC0();
  sub_24CD75A68();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_24CD755C8();
  uint64_t v24 = (uint64_t)objc_msgSend(v1, sel_hour);
  sub_24CD75A68();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  sub_24CD755C8();
  uint64_t v24 = (uint64_t)objc_msgSend(v1, sel_minute);
  sub_24CD75A68();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  uint64_t v24 = 0x656C62616E65202CLL;
  unint64_t v25 = 0xEA00000000003D64;
  objc_msgSend(v1, sel_isEnabled);
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  if (objc_msgSend(v1, sel_repeatSchedule))
  {
    sub_24CD755C8();
    sub_24CD753D8();
    swift_bridgeObjectRetain();
    if (objc_msgSend(v1, sel_repeatSchedule)) {
      sub_24CD75588();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 2) != 0) {
      sub_24CD75588();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 4) != 0) {
      sub_24CD75588();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 8) != 0) {
      sub_24CD75588();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 0x10) != 0) {
      sub_24CD75588();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 0x20) != 0) {
      sub_24CD75588();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((objc_msgSend(v1, sel_repeatSchedule) & 0x40) != 0) {
      sub_24CD75588();
    }
    swift_bridgeObjectRelease();
    sub_24CD755C8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  id v11 = objc_msgSend(v1, sel_title);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_24CD75568();

    uint64_t v24 = 0x3D656C746974202CLL;
    unint64_t v25 = 0xE900000000000022;
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    sub_24CD755C8();
    sub_24CD755C8();
    swift_bridgeObjectRelease();
  }
  MTAlarm.targetAccessory.getter();
  if (v13)
  {
    uint64_t v24 = 0x746567726174202CLL;
    unint64_t v25 = 0xE90000000000003DLL;
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    sub_24CD755C8();
    swift_bridgeObjectRelease();
  }
  id v14 = objc_msgSend(v1, sel_sound);
  id v15 = objc_msgSend(v14, sel_soundType);

  if (v15 == (id)2)
  {
    uint64_t v24 = 0;
    unint64_t v25 = 0xE000000000000000;
    sub_24CD75868();
    sub_24CD755C8();
    id v16 = objc_msgSend(v1, sel_sound);
    id v17 = objc_msgSend(v16, sel_toneIdentifier);

    if (v17)
    {
      sub_24CD75568();

      uint64_t v18 = sub_24CD755B8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v22 = v18;
    BOOL v23 = v17 == 0;
    sub_24CD75A88();
    sub_24CD755C8();
    id v19 = objc_msgSend(v1, sel_sound);
    id v20 = objc_msgSend(v19, sel_soundVolume);

    uint64_t v22 = (uint64_t)v20;
    sub_24CD53A2C(0, &qword_26982D2F8);
    sub_24CD52648();
    sub_24CD75A88();

    sub_24CD755C8();
    swift_bridgeObjectRelease();
  }
  return v26;
}

id MTTimer.summary.getter()
{
  id v1 = v0;
  uint64_t v2 = sub_24CD75A78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24CD75398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = 0x69202C72656D6974;
  unint64_t v30 = 0xEA00000000003D64;
  id v10 = objc_msgSend(v0, sel_timerID);
  sub_24CD75388();

  sub_24CD4EDC0();
  sub_24CD75A68();
  sub_24CD755C8();
  id v11 = v1;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_24CD755C8();
  id result = objc_msgSend(v1, sel_duration);
  double v14 = fabs(v13);
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v14 <= -1.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v14 >= 1.84467441e19)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v26 = (unint64_t)v14;
  uint64_t v15 = *MEMORY[0x263F386A0];
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v16(v5, v15, v2);
  sub_24CD526B0();
  sub_24CD75A98();
  id v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v24[1] = v3 + 8;
  uint64_t v25 = v2;
  v17(v5, v2);
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  uint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  sub_24CD755C8();
  id result = objc_msgSend(v11, sel_remainingTime);
  double v19 = fabs(v18);
  if ((~*(void *)&v19 & 0x7FF0000000000000) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v19 <= -1.0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v19 >= 1.84467441e19)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  unint64_t v26 = (unint64_t)v19;
  uint64_t v20 = v25;
  v16(v5, v15, v25);
  sub_24CD75A98();
  v17(v5, v20);
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v11, sel_title);
  if (v21)
  {
    uint64_t v22 = v21;
    sub_24CD75568();

    uint64_t v27 = 0x3D656C746974202CLL;
    unint64_t v28 = 0xE900000000000022;
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    sub_24CD755C8();
    sub_24CD755C8();
    swift_bridgeObjectRelease();
  }
  uint64_t v27 = 0x3D6574617473202CLL;
  unint64_t v28 = 0xE800000000000000;
  MTTimerState.summary.getter((uint64_t)objc_msgSend(v11, sel_state));
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  MTTimer.targetAccessory.getter();
  if (v23)
  {
    uint64_t v27 = 0x746567726174202CLL;
    unint64_t v28 = 0xE90000000000003DLL;
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    sub_24CD755C8();
    swift_bridgeObjectRelease();
  }
  return (id)v29;
}

unint64_t sub_24CD4EDC0()
{
  unint64_t result = qword_26982D2F0;
  if (!qword_26982D2F0)
  {
    sub_24CD75398();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D2F0);
  }
  return result;
}

id sub_24CD4EE30(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  id v5 = (void *)sub_24CD75558();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_24CD4EEA0()
{
  id v1 = objc_msgSend(v0, sel_mtAlarm);
  if (!v1)
  {
    id v6 = objc_msgSend(v0, sel_mtAlarmID);
    if (!v6)
    {
      id v8 = objc_msgSend(v0, sel_mtTimer);
      if (v8)
      {
        uint64_t v2 = v8;
        id v3 = objc_msgSend(v8, sel_timerIDString);
        goto LABEL_3;
      }
      id v6 = objc_msgSend(v0, sel_mtTimerID);
      if (!v6) {
        return 63;
      }
    }
    id v4 = v6;
    uint64_t v5 = sub_24CD75568();
    goto LABEL_6;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_alarmIDString);
LABEL_3:
  id v4 = v3;
  uint64_t v5 = sub_24CD75568();

LABEL_6:
  return v5;
}

id sub_24CD4EFDC(void *a1, uint64_t a2, SEL *a3, SEL *a4, void *a5)
{
  id v8 = a1;
  id v9 = [v8 *a3];
  if (v9)
  {
    id v10 = v9;
    id v11 = [v9 *a4];

    sub_24CD75568();
LABEL_4:
    double v13 = (void *)sub_24CD75558();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  uint64_t v12 = *(void *)&v8[*a5 + 8];
  swift_bridgeObjectRetain();

  if (v12) {
    goto LABEL_4;
  }
  double v13 = 0;
LABEL_5:

  return v13;
}

uint64_t DTTimer.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = sub_24CD53D58(a1, (uint64_t)v27, &qword_26982D2B8);
  if (!v28)
  {
    sub_24CD53DBC((uint64_t)v27, &qword_26982D2B8);
    goto LABEL_8;
  }
  type metadata accessor for DTTimer(v2);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    unsigned __int8 v7 = 0;
    return v7 & 1;
  }
  id v3 = objc_msgSend(v26, sel_mtAlarm);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v1, sel_mtAlarm);
    if (v5)
    {
      id v6 = v5;
      unsigned __int8 v7 = objc_msgSend(v5, sel_isEqual_, v4);

LABEL_6:
      return v7 & 1;
    }

    goto LABEL_8;
  }
  id v9 = objc_msgSend(v26, sel_mtAlarmID);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = sub_24CD75568();
    uint64_t v13 = v12;

    id v14 = objc_msgSend(v1, sel_mtAlarmID);
    if (v14) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
  id v19 = objc_msgSend(v26, sel_mtTimer);
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = objc_msgSend(v1, sel_mtTimer);
    if (v21)
    {
      uint64_t v22 = v21;
      id v4 = v20;
      unsigned __int8 v7 = objc_msgSend(v22, sel_isEqual_, v4);

      goto LABEL_6;
    }

    goto LABEL_8;
  }
  id v23 = objc_msgSend(v26, sel_mtTimerID);
  if (!v23)
  {
LABEL_24:

    goto LABEL_8;
  }
  uint64_t v24 = v23;
  uint64_t v11 = sub_24CD75568();
  uint64_t v13 = v25;

  id v14 = objc_msgSend(v1, sel_mtTimerID);
  if (!v14)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v15 = v14;
  uint64_t v16 = sub_24CD75568();
  uint64_t v18 = v17;

  if (v11 == v16 && v13 == v18) {
    unsigned __int8 v7 = 1;
  }
  else {
    unsigned __int8 v7 = sub_24CD75AA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7 & 1;
}

void __swiftcall DTTimer.init()(DTTimer *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void DTTimer.init()()
{
}

uint64_t DTTimer.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D310);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned __int8 v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD52718();
  sub_24CD75B58();
  id v8 = objc_msgSend(v2, sel_mtAlarm);
  if (!v8)
  {
    id v19 = objc_msgSend(v2, sel_mtAlarmID);
    if (v19)
    {
      uint64_t v20 = v19;
      sub_24CD75568();

      char v21 = 1;
    }
    else
    {
      id v22 = objc_msgSend(v2, sel_mtTimer);
      if (v22)
      {
        id v9 = v22;
        id v23 = self;
        id v32 = 0;
        id v24 = objc_msgSend(v23, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v9, 1, &v32);
        id v12 = v32;
        if (v24)
        {
          uint64_t v25 = (void *)sub_24CD75338();
          unint64_t v27 = v26;

          id v32 = v25;
          unint64_t v33 = v27;
          HIBYTE(v31) = 2;
          sub_24CD5276C();
          sub_24CD75A48();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

          uint64_t v16 = (uint64_t)v25;
          unint64_t v17 = v27;
          return sub_24CD47F6C(v16, v17);
        }
        goto LABEL_11;
      }
      id v29 = objc_msgSend(v2, sel_mtTimerID);
      if (!v29) {
        return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      unint64_t v30 = v29;
      sub_24CD75568();

      char v21 = 3;
    }
    LOBYTE(v32) = v21;
    sub_24CD75A28();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }
  id v9 = v8;
  id v10 = self;
  id v32 = 0;
  id v11 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v9, 1, &v32);
  id v12 = v32;
  if (v11)
  {
    uint64_t v13 = (void *)sub_24CD75338();
    unint64_t v15 = v14;

    id v32 = v13;
    unint64_t v33 = v15;
    HIBYTE(v31) = 0;
    sub_24CD5276C();
    sub_24CD75A48();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

    uint64_t v16 = (uint64_t)v13;
    unint64_t v17 = v15;
    return sub_24CD47F6C(v16, v17);
  }
LABEL_11:
  uint64_t v28 = v12;
  sub_24CD752D8();

  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id DTTimer.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D328);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD52718();
  sub_24CD75B48();
  if (!v1)
  {
    char v28 = 0;
    sub_24CD527C0();
    sub_24CD759A8();
    unint64_t v9 = v27;
    if (v27 >> 60 == 15)
    {
      LOBYTE(v26) = 1;
      sub_24CD75998();
      if (v10)
      {
        id v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        id v12 = (void *)sub_24CD75558();
        swift_bridgeObjectRelease();
        id v13 = objc_msgSend(v11, sel_initWithMTAlarmID_, v12);
LABEL_8:
        id v7 = v13;

LABEL_12:
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
        return v7;
      }
      char v28 = 2;
      sub_24CD759A8();
      unint64_t v9 = v27;
      if (v27 >> 60 == 15)
      {
        LOBYTE(v26) = 3;
        sub_24CD75998();
        if (!v19)
        {
          id v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
          goto LABEL_12;
        }
        id v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        id v12 = (void *)sub_24CD75558();
        swift_bridgeObjectRelease();
        id v13 = objc_msgSend(v20, sel_initWithMTTimerID_, v12);
        goto LABEL_8;
      }
      uint64_t v22 = v26;
      sub_24CD53A2C(0, &qword_26982D338);
      sub_24CD53A2C(0, &qword_26982D340);
      uint64_t v23 = sub_24CD75758();
      uint64_t v16 = (void *)v23;
      uint64_t v25 = v22;
      if (v23)
      {
        id v17 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithMTTimer_, v23);
        goto LABEL_11;
      }
      id v7 = (id)type metadata accessor for DTError();
      char v21 = "Decode MTTimer failed";
    }
    else
    {
      uint64_t v14 = v26;
      sub_24CD53A2C(0, &qword_26982D338);
      sub_24CD53A2C(0, &qword_26982D348);
      uint64_t v15 = sub_24CD75758();
      uint64_t v16 = (void *)v15;
      uint64_t v25 = v14;
      if (v15)
      {
        id v17 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithMTAlarm_, v15);
LABEL_11:
        uint64_t v18 = v16;
        id v7 = v17;
        sub_24CD52814(v25, v9);

        goto LABEL_12;
      }
      id v7 = (id)type metadata accessor for DTError();
      char v21 = "Decode MTAlarm failed";
    }
    DTError.__allocating_init(_:_:_:)(3, 0xD000000000000015, (unint64_t)(v21 - 32) | 0x8000000000000000, 0);
    swift_willThrow();
    sub_24CD52814(v25, v9);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

uint64_t sub_24CD4FCF4(unsigned __int8 *a1, char *a2)
{
  return sub_24CD4FD00(*a1, *a2);
}

uint64_t sub_24CD4FD00(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6D72616C41746DLL;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6D72616C41746DLL;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x496D72616C41746DLL;
      goto LABEL_5;
    case 2:
      uint64_t v5 = 0x72656D6954746DLL;
      break;
    case 3:
      uint64_t v5 = 0x4972656D6954746DLL;
LABEL_5:
      unint64_t v3 = 0xE900000000000044;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      uint64_t v2 = 0x496D72616C41746DLL;
      goto LABEL_10;
    case 2:
      uint64_t v2 = 0x72656D6954746DLL;
      break;
    case 3:
      uint64_t v2 = 0x4972656D6954746DLL;
LABEL_10:
      unint64_t v6 = 0xE900000000000044;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24CD75AA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24CD4FE78()
{
  return sub_24CD75B18();
}

uint64_t sub_24CD4FF50()
{
  sub_24CD755A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24CD50010()
{
  return sub_24CD75B18();
}

uint64_t sub_24CD500E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CD539E0();
  *a1 = result;
  return result;
}

void sub_24CD50114(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6D72616C41746DLL;
  switch(*v1)
  {
    case 1:
      uint64_t v3 = 0x496D72616C41746DLL;
      goto LABEL_6;
    case 2:
      uint64_t v2 = 0x72656D6954746DLL;
      goto LABEL_4;
    case 3:
      uint64_t v3 = 0x4972656D6954746DLL;
LABEL_6:
      *a1 = v3;
      a1[1] = 0xE900000000000044;
      return;
    default:
LABEL_4:
      *a1 = v2;
      a1[1] = 0xE700000000000000;
      return;
  }
}

uint64_t sub_24CD501A8()
{
  uint64_t result = 0x6D72616C41746DLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x496D72616C41746DLL;
      break;
    case 2:
      uint64_t result = 0x72656D6954746DLL;
      break;
    case 3:
      uint64_t result = 0x4972656D6954746DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CD50234@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24CD539E0();
  *a1 = result;
  return result;
}

void sub_24CD5025C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24CD50268(uint64_t a1)
{
  unint64_t v2 = sub_24CD52718();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD502A4(uint64_t a1)
{
  unint64_t v2 = sub_24CD52718();

  return MEMORY[0x270FA00B8](a1, v2);
}

id sub_24CD502E0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = DTTimer.init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24CD5030C(void *a1)
{
  return DTTimer.encode(to:)(a1);
}

unint64_t static DTTimer._siriContextAlarmTargetReferenceKey.getter()
{
  return 0xD000000000000024;
}

unint64_t static DTTimer._siriContextTimerTargetReferenceKey.getter()
{
  return 0xD000000000000024;
}

uint64_t DTTimer.siriContext.getter()
{
  id v1 = objc_msgSend(v0, sel_mtAlarm);
  if (!v1)
  {
    id v6 = objc_msgSend(v0, sel_mtTimer);
    if (!v6) {
      return 0;
    }
    uint64_t v2 = v6;
    id v3 = objc_msgSend(v6, sel_siriContext);
    if (v3) {
      goto LABEL_3;
    }
LABEL_6:

    return 0;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_siriContext);
  if (!v3) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = v3;
  uint64_t v5 = sub_24CD75538();

  return v5;
}

void __swiftcall DTTimer.setSiriContext(siriContext:)(DTTimer *__return_ptr retstr, Swift::OpaquePointer_optional siriContext)
{
  if (siriContext.value._rawValue)
  {
    if (*((void *)siriContext.value._rawValue + 2)) {
      rawValue = siriContext.value._rawValue;
    }
    else {
      rawValue = 0;
    }
  }
  else
  {
    rawValue = 0;
  }
  id v4 = objc_msgSend(v2, sel_mtAlarm, v2);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_mutableCopy);
    sub_24CD757F8();
    swift_unknownObjectRelease();
    sub_24CD53A2C(0, &qword_26982D358);
    if (swift_dynamicCast())
    {
      id v6 = v10;
      if (rawValue) {
        rawValue = (void *)sub_24CD75528();
      }
      objc_msgSend(v10, sel_setSiriContext_, rawValue);

      objc_msgSend(objc_allocWithZone((Class)DTTimer), sel_initWithMTAlarm_, v10);
LABEL_16:

      return;
    }
LABEL_17:

    goto LABEL_18;
  }
  id v7 = objc_msgSend(v9, sel_mtTimer);
  if (v7)
  {
    uint64_t v5 = v7;
    objc_msgSend(v7, sel_mutableCopy);
    sub_24CD757F8();
    swift_unknownObjectRelease();
    sub_24CD53A2C(0, &qword_26982D350);
    if (swift_dynamicCast())
    {
      id v6 = v10;
      if (rawValue) {
        rawValue = (void *)sub_24CD75528();
      }
      objc_msgSend(v10, sel_setSiriContext_, rawValue);

      objc_msgSend(objc_allocWithZone((Class)DTTimer), sel_initWithMTTimer_, v10);
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_18:

  id v8 = v9;
}

uint64_t DTTimer.targetReference.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = DTTimer.siriContext.getter();
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v1, sel_mtAlarm);

    if ((v5 || (id v6 = objc_msgSend(v1, sel_mtTimer), v6, v6))
      && ((id v7 = objc_msgSend(v1, sel_mtAlarm), v7, v7)
       || (id v11 = objc_msgSend(v1, sel_mtTimer), v11, v11)))
    {
      sub_24CD75858();
      if (*(void *)(v4 + 16) && (unint64_t v12 = sub_24CD52828((uint64_t)v16), (v13 & 1) != 0))
      {
        sub_24CD4C758(*(void *)(v4 + 56) + 32 * v12, (uint64_t)&v17);
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_24CD53A68((uint64_t)v16);
      if (*((void *)&v18 + 1))
      {
        if (swift_dynamicCast())
        {
          sub_24CD75248();
          return swift_bridgeObjectRelease();
        }
      }
      else
      {
        sub_24CD53DBC((uint64_t)&v17, &qword_26982D2B8);
      }
      uint64_t v15 = sub_24CD75268();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a1, 1, 1, v15);
    }
    else
    {
      uint64_t v14 = sub_24CD75268();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 1, 1, v14);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v8 = sub_24CD75268();
    id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    return v9(a1, 1, 1, v8);
  }
}

id DTTimer.setTargetReference(_:)(uint64_t a1)
{
  uint64_t v52 = sub_24CD752F8();
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24CD75268();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D360);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  id v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v13 = (char *)&v50 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D368);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  long long v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v50 - v18;
  id v20 = objc_msgSend(v53, sel_mtAlarm);

  if (v20)
  {
    v50 = v3;
    char v21 = "COAlarmSiriContextTargetReferenceKey";
  }
  else
  {
    id v22 = objc_msgSend(v53, sel_mtTimer);

    if (!v22) {
      goto LABEL_16;
    }
    v50 = v3;
    char v21 = "COTimerSiriContextTargetReferenceKey";
  }
  unint64_t v23 = (unint64_t)(v21 - 32) | 0x8000000000000000;
  uint64_t v24 = DTTimer.siriContext.getter();
  if (v24)
  {
    v59 = (void *)v24;
    *(void *)&long long v56 = 0xD000000000000024;
    *((void *)&v56 + 1) = v23;
    uint64_t v25 = MEMORY[0x263F8D310];
    sub_24CD75858();
    sub_24CD53D58(a1, (uint64_t)v13, &qword_26982D360);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) == 1)
    {
      uint64_t v26 = &qword_26982D360;
      uint64_t v27 = (uint64_t)v13;
    }
    else
    {
      sub_24CD751F8();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      uint64_t v30 = v51;
      uint64_t v31 = v52;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v19, 1, v52) != 1)
      {
        uint64_t v38 = sub_24CD752E8();
        uint64_t v57 = v25;
        *(void *)&long long v56 = v38;
        *((void *)&v56 + 1) = v39;
        (*(void (**)(char *, uint64_t))(v30 + 8))(v19, v31);
        sub_24CD4D654(&v56, v55);
        objc_super v40 = v59;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v54 = v40;
        sub_24CD52F14(v55, (uint64_t)v58, isUniquelyReferenced_nonNull_native);
        unint64_t v33 = v54;
        swift_bridgeObjectRelease();
        sub_24CD53A68((uint64_t)v58);
        goto LABEL_20;
      }
      uint64_t v26 = &qword_26982D368;
      uint64_t v27 = (uint64_t)v19;
    }
    sub_24CD53DBC(v27, v26);
    sub_24CD52934((uint64_t)v58, &v56);
    sub_24CD53A68((uint64_t)v58);
    sub_24CD53DBC((uint64_t)&v56, &qword_26982D2B8);
    unint64_t v33 = v59;
LABEL_20:
    v32.value._rawValue = v33;
    DTTimer.setSiriContext(siriContext:)((DTTimer *)_118, v32);
    uint64_t v43 = v42;
    swift_bridgeObjectRelease();
    return (id)v43;
  }
  sub_24CD53D58(a1, (uint64_t)v11, &qword_26982D360);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4) == 1)
  {
    swift_bridgeObjectRelease();
    char v28 = &qword_26982D360;
    uint64_t v29 = (uint64_t)v11;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
    sub_24CD751F8();
    uint64_t v34 = v51;
    uint64_t v35 = v52;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v17, 1, v52) != 1)
    {
      long long v44 = v50;
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v50, v17, v35);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26982D370);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24CD782B0;
      *(void *)(inited + 32) = 0xD000000000000024;
      *(void *)(inited + 40) = v23;
      *(void *)(inited + 48) = sub_24CD752E8();
      *(void *)(inited + 56) = v46;
      unint64_t v47 = sub_24CD50F70(inited);
      v48 = (void *)sub_24CD51094(v47);
      swift_bridgeObjectRelease();
      v62.value._rawValue = v48;
      DTTimer.setSiriContext(siriContext:)((DTTimer *)_118, v62);
      uint64_t v43 = v49;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v44, v35);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return (id)v43;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_bridgeObjectRelease();
    char v28 = &qword_26982D368;
    uint64_t v29 = (uint64_t)v17;
  }
  sub_24CD53DBC(v29, v28);
LABEL_16:
  id v36 = v53;

  return v36;
}

unint64_t sub_24CD50F70(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D3B0);
  uint64_t v2 = (void *)sub_24CD75928();
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
    unint64_t result = sub_24CD4B62C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
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

uint64_t sub_24CD51094(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D3A8);
    uint64_t v2 = sub_24CD75928();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
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
  uint64_t v6 = v2 + 64;
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
    long long v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
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
    sub_24CD4D654(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_24CD4D654(v35, v36);
    sub_24CD4D654(v36, &v32);
    uint64_t result = sub_24CD75838();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_24CD4D654(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_24CD53E74();
    return v2;
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

uint64_t DTTimer.targetAccessory.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D360);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  DTTimer.targetReference.getter((uint64_t)v2);
  uint64_t v3 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v2);
  sub_24CD53DBC((uint64_t)v2, &qword_26982D360);
  return v3;
}

void __swiftcall DTTimer.setTargetAccessory(accessoryId:)(DTTimer *__return_ptr retstr, Swift::String_optional accessoryId)
{
  object = accessoryId.value._object;
  uint64_t countAndFlagsBits = accessoryId.value._countAndFlagsBits;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D360);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)v19 - v8;
  DTTimer.targetReference.getter((uint64_t)v19 - v8);
  uint64_t v10 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v9);
  unint64_t v12 = v11;
  sub_24CD53DBC((uint64_t)v9, &qword_26982D360);
  if (object)
  {
    if (!v12)
    {
LABEL_8:
      sub_24CD75258();
      sub_24CD75238();
      sub_24CD75218();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26982D378);
      sub_24CD751C8();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_24CD782B0;
      sub_24CD75198();
      sub_24CD751E8();
      uint64_t v15 = sub_24CD75268();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 0, 1, v15);
LABEL_11:
      DTTimer.setTargetReference(_:)((uint64_t)v7);
      sub_24CD53DBC((uint64_t)v7, &qword_26982D360);
      return;
    }
    if (v10 == countAndFlagsBits && v12 == object)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v14 = sub_24CD75AA8();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  else if (v12)
  {
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_24CD75268();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 1, 1, v16);
    goto LABEL_11;
  }
  long long v17 = (void *)v19[1];

  id v18 = v17;
}

uint64_t static DTTimer.makeTargetReference(for:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  if (a1)
  {
    sub_24CD75258();
    sub_24CD75238();
    sub_24CD75218();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D378);
    sub_24CD751C8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_24CD782B0;
    sub_24CD75198();
    sub_24CD751E8();
    uint64_t v3 = sub_24CD75268();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    uint64_t v5 = v3;
    uint64_t v6 = a2;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = sub_24CD75268();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v5 = v8;
    uint64_t v6 = a2;
    uint64_t v7 = 1;
  }

  return v4(v6, v7, 1, v5);
}

void __swiftcall DTTimer.setTargetAccessoryIfNeeded(defaultTargetID:)(DTTimer *__return_ptr retstr, Swift::String defaultTargetID)
{
  object = defaultTargetID._object;
  uint64_t countAndFlagsBits = defaultTargetID._countAndFlagsBits;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D360);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  DTTimer.targetReference.getter((uint64_t)v6);
  _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v6);
  uint64_t v8 = v7;
  sub_24CD53DBC((uint64_t)v6, &qword_26982D360);
  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v10 = (void *)v13[1];
    id v11 = v10;
  }
  else
  {
    v12.value._uint64_t countAndFlagsBits = countAndFlagsBits;
    v12.value._object = object;
    DTTimer.setTargetAccessory(accessoryId:)(v9, v12);
  }
}

BOOL DTTimer.isTargeting(accessoryId:alternateAccessoryIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D360);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  DTTimer.targetReference.getter((uint64_t)v8);
  uint64_t v9 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v8);
  uint64_t v11 = v10;
  sub_24CD53DBC((uint64_t)v8, &qword_26982D360);
  if (!v11) {
    return !a2;
  }
  if (!a2)
  {
    swift_bridgeObjectRelease();
    DTTimer.targetReference.getter((uint64_t)v8);
    uint64_t v14 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v8);
    uint64_t v16 = v15;
    sub_24CD53DBC((uint64_t)v8, &qword_26982D360);
    if (v16)
    {
      char v17 = sub_24CD51C04(v14, v16, a3);
      swift_bridgeObjectRelease();
      if (v17) {
        return 1;
      }
    }
    return 0;
  }
  if (v9 != a1 || v11 != a2)
  {
    char v13 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    return (v13 & 1) != 0;
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_24CD51C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24CD75AF8();
    sub_24CD755A8();
    uint64_t v6 = sub_24CD75B18();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24CD75AA8() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24CD75AA8() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t DTTimer.isExpired(before:)(uint64_t a1)
{
  id v3 = objc_msgSend(v1, sel_mtAlarm);
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = MTAlarm.isExpired(before:)(a1);
  }
  else
  {
    id v6 = objc_msgSend(v1, sel_mtTimer);
    if (!v6)
    {
      char v7 = 0;
      return v7 & 1;
    }
    uint64_t v4 = v6;
    char v5 = MTTimer.isExpired(before:)();
  }
  char v7 = v5;

  return v7 & 1;
}

uint64_t MTAlarm.isExpired(before:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24CD75378();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if (objc_msgSend(v2, sel_isEnabled))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a1, v4);
  }
  else
  {
    unsigned __int8 v11 = objc_msgSend(v2, sel_repeats);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, a1, v4);
    if ((v11 & 1) == 0)
    {
      id v13 = objc_msgSend(v2, sel_lastModifiedDate);
      sub_24CD75368();

      char v12 = sub_24CD75358();
      uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
      v14(v8, v4);
      v14(v10, v4);
      return v12 & 1;
    }
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  char v12 = 0;
  return v12 & 1;
}

uint64_t MTTimer.isExpired(before:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D380);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24CD75378();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unsigned __int8 v11 = (char *)&v17 - v10;
  if (objc_msgSend(v1, sel_state) != (id)2 && objc_msgSend(v1, sel_state) != (id)1) {
    goto LABEL_8;
  }
  id v12 = objc_msgSend(v1, sel_lastModifiedDate);
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_7;
  }
  id v13 = v12;
  sub_24CD75368();

  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_7:
    sub_24CD53DBC((uint64_t)v4, &qword_26982D380);
LABEL_8:
    char v15 = 0;
    return v15 & 1;
  }
  v14(v11, v4, v5);
  char v15 = sub_24CD75358();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v15 & 1;
}

uint64_t MTAlarm.targetAccessory.getter()
{
  return sub_24CD52338(0x800000024CD768A0);
}

uint64_t MTTimerState.summary.getter(uint64_t a1)
{
  uint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x646570706F7473;
      break;
    case 2:
      uint64_t result = 0x6573756170;
      break;
    case 3:
      uint64_t result = 0x676E696E6E7572;
      break;
    case 4:
      uint64_t result = 0x746E756F63;
      break;
    default:
      sub_24CD75A68();
      sub_24CD755C8();
      swift_bridgeObjectRelease();
      uint64_t result = 2629695;
      break;
  }
  return result;
}

uint64_t MTTimer.targetAccessory.getter()
{
  return sub_24CD52338(0x800000024CD768D0);
}

uint64_t sub_24CD52338(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D360);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v22 - v7;
  uint64_t v9 = sub_24CD75268();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(v1, sel_siriContext);
  if (!v13) {
    return 0;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_24CD75538();

  v22[1] = 0xD000000000000024;
  v22[2] = a1;
  sub_24CD75858();
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_24CD52828((uint64_t)v23), (v17 & 1) != 0))
  {
    sub_24CD4C758(*(void *)(v15 + 56) + 32 * v16, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24CD53A68((uint64_t)v23);
  if (!*((void *)&v25 + 1))
  {
    id v18 = &qword_26982D2B8;
    uint64_t v19 = (char *)&v24;
LABEL_11:
    sub_24CD53DBC((uint64_t)v19, v18);
    return 0;
  }
  if (swift_dynamicCast())
  {
    sub_24CD75248();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v6, v12, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
      uint64_t v20 = _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0((uint64_t)v6);
      sub_24CD53DBC((uint64_t)v6, &qword_26982D360);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return v20;
    }
    id v18 = &qword_26982D360;
    uint64_t v19 = v8;
    goto LABEL_11;
  }
  return 0;
}

unint64_t sub_24CD52648()
{
  unint64_t result = qword_26982D300;
  if (!qword_26982D300)
  {
    sub_24CD53A2C(255, &qword_26982D2F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D300);
  }
  return result;
}

unint64_t sub_24CD526B0()
{
  unint64_t result = qword_26982D308;
  if (!qword_26982D308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D308);
  }
  return result;
}

uint64_t type metadata accessor for DTTimer(uint64_t a1)
{
  return sub_24CD53A2C(a1, (unint64_t *)&unk_26982E5E0);
}

unint64_t sub_24CD52718()
{
  unint64_t result = qword_26982D318;
  if (!qword_26982D318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D318);
  }
  return result;
}

unint64_t sub_24CD5276C()
{
  unint64_t result = qword_26982D320;
  if (!qword_26982D320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D320);
  }
  return result;
}

unint64_t sub_24CD527C0()
{
  unint64_t result = qword_26982D330;
  if (!qword_26982D330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D330);
  }
  return result;
}

uint64_t sub_24CD52814(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CD47F6C(a1, a2);
  }
  return a1;
}

unint64_t sub_24CD52828(uint64_t a1)
{
  uint64_t v2 = sub_24CD75838();

  return sub_24CD5286C(a1, v2);
}

unint64_t sub_24CD5286C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24CD53E18(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x253313DF0](v9, a1);
      sub_24CD53A68((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_24CD52934@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24CD52828(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24CD530DC();
      uint64_t v9 = v11;
    }
    sub_24CD53A68(*(void *)(v9 + 48) + 40 * v6);
    sub_24CD4D654((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_24CD52D48(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_24CD52A30(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D3A8);
  uint64_t v6 = sub_24CD75918();
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
    char v22 = (void *)(v5 + 64);
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
      sub_24CD4D654((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_24CD53E18(v25, (uint64_t)&v38);
      sub_24CD4C758(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_24CD75838();
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
    uint64_t result = (uint64_t)sub_24CD4D654(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_24CD52D48(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24CD75828();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24CD53E18(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        uint64_t v10 = sub_24CD75838();
        uint64_t result = sub_24CD53A68((uint64_t)v28);
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            uint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            int64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *unint64_t v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    char v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    char v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *char v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_24CD52F14(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_24CD52828(a2);
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
      sub_24CD530DC();
      goto LABEL_7;
    }
    sub_24CD52A30(v13, a3 & 1);
    unint64_t v19 = sub_24CD52828(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_24CD53E18(a2, (uint64_t)v21);
      return sub_24CD53060(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_24CD75AC8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);

  return sub_24CD4D654(a1, v17);
}

_OWORD *sub_24CD53060(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_24CD4D654(a3, (_OWORD *)(a4[7] + 32 * a1));
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

void *sub_24CD530DC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D3A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CD75908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    sub_24CD53E18(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_24CD4C758(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_24CD4D654(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
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

uint64_t _sSo7DTTimerC17DistributedTimersE27accessoryForTargetReferenceySSSg10Foundation13URLComponentsVSgFZ_0(uint64_t a1)
{
  uint64_t v54 = sub_24CD751C8();
  uint64_t v2 = *(void *)(v54 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)v47 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D3A0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  id v53 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)v47 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D360);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24CD75268();
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  long long v19 = (char *)v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  int64_t v21 = (char *)v47 - v20;
  uint64_t v23 = v22;
  sub_24CD53D58(a1, (uint64_t)v15, &qword_26982D360);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v15, 1, v16) == 1)
  {
    sub_24CD53DBC((uint64_t)v15, &qword_26982D360);
    return 0;
  }
  uint64_t v51 = v12;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v21, v15, v16);
  uint64_t v24 = sub_24CD75228();
  if (!v25)
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v19, v21, v16);
    goto LABEL_11;
  }
  if (v24 != 0x2D6B682D69726973 || v25 != 0xEE00746567726174)
  {
    char v27 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v19, v21, v16);
    if (v27) {
      goto LABEL_16;
    }
LABEL_11:
    uint64_t v28 = *(void (**)(char *, uint64_t))(v23 + 8);
    v28(v19, v16);
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v19, v21, v16);
LABEL_16:
  v50 = v5;
  if (sub_24CD75208() != 0x726F737365636361 || v31 != 0xE900000000000079)
  {
    char v32 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v23 + 8);
    v28(v19, v16);
    if (v32)
    {
      uint64_t v49 = v28;
      goto LABEL_21;
    }
LABEL_12:
    v28(v21, v16);
    return 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v49 = *(void (**)(char *, uint64_t))(v23 + 8);
  v49(v19, v16);
LABEL_21:
  uint64_t v33 = sub_24CD751D8();
  uint64_t v34 = v50;
  if (v33)
  {
    uint64_t v35 = *(void *)(v33 + 16);
    if (v35)
    {
      v47[2] = v23;
      uint64_t v48 = v2;
      uint64_t v52 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
      unint64_t v36 = v33 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
      uint64_t v37 = (void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v38 = *(void *)(v2 + 72);
      v47[1] = v33;
      swift_bridgeObjectRetain();
      uint64_t v39 = v54;
      while (1)
      {
        v52(v7, v36, v39);
        if (sub_24CD751A8() == 0x696669746E656469 && v40 == 0xEA00000000007265)
        {
          swift_bridgeObjectRelease();
          uint64_t v34 = v50;
          goto LABEL_34;
        }
        char v41 = sub_24CD75AA8();
        swift_bridgeObjectRelease();
        if (v41) {
          break;
        }
        uint64_t v39 = v54;
        (*v37)(v7, v54);
        v36 += v38;
        if (!--v35)
        {
          swift_bridgeObjectRelease();
          uint64_t v42 = 1;
          uint64_t v2 = v48;
          uint64_t v34 = v50;
          uint64_t v43 = (uint64_t)v51;
          goto LABEL_35;
        }
      }
      uint64_t v34 = v50;
LABEL_34:
      swift_bridgeObjectRelease();
      uint64_t v2 = v48;
      uint64_t v43 = (uint64_t)v51;
      uint64_t v39 = v54;
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v51, v7, v54);
      uint64_t v42 = 0;
    }
    else
    {
      uint64_t v42 = 1;
      uint64_t v39 = v54;
      uint64_t v43 = (uint64_t)v51;
    }
LABEL_35:
    uint64_t v44 = (uint64_t)v53;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v43, v42, 1, v39);
    swift_bridgeObjectRelease();
    sub_24CD53D58(v43, v44, &qword_26982D3A0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v44, 1, v39) == 1)
    {
      uint64_t v29 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v34, v44, v39);
      uint64_t v45 = v34;
      uint64_t v46 = v39;
      uint64_t v29 = sub_24CD751B8();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v45, v46);
    }
    sub_24CD53DBC(v43, &qword_26982D3A0);
  }
  else
  {
    uint64_t v29 = 0;
  }
  v49(v21, v16);
  return v29;
}

uint64_t sub_24CD539E0()
{
  unint64_t v0 = sub_24CD75968();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_24CD53A2C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24CD53A68(uint64_t a1)
{
  return a1;
}

unint64_t sub_24CD53AC0()
{
  unint64_t result = qword_26982D388;
  if (!qword_26982D388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D388);
  }
  return result;
}

unint64_t sub_24CD53B18()
{
  unint64_t result = qword_26982D390;
  if (!qword_26982D390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D390);
  }
  return result;
}

unint64_t sub_24CD53B70()
{
  unint64_t result = qword_26982D398;
  if (!qword_26982D398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D398);
  }
  return result;
}

uint64_t _s10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x24CD53D20);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

uint64_t sub_24CD53D58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CD53DBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24CD53E18(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24CD53E74()
{
  return swift_release();
}

uint64_t sub_24CD53E7C()
{
  uint64_t v0 = sub_24CD754B8();
  __swift_allocate_value_buffer(v0, qword_26982E5F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26982E5F8);
  sub_24CD5BE68();
  swift_bridgeObjectRetain();
  return sub_24CD754A8();
}

uint64_t DTTimerClient._clientID.getter()
{
  return *(void *)(v0 + OBJC_IVAR___DTTimerClient__clientID);
}

void sub_24CD540B4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t DTTimerClient._requestContext.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___DTTimerClient__requestContext + 16);
  *a1 = *(void *)(v1 + OBJC_IVAR___DTTimerClient__requestContext);
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_24CD54220@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = OBJC_IVAR___DTTimerClient__xpcClientCached;
  uint64_t v5 = *(void *)(a1 + OBJC_IVAR___DTTimerClient__xpcClientCached);
  if (v5)
  {
    uint64_t v6 = v5;
  }
  else
  {
    type metadata accessor for DTXPCClient();
    uint64_t v8 = *(void *)(a1 + OBJC_IVAR___DTTimerClient__environment);
    swift_bridgeObjectRetain();
    uint64_t v6 = DTXPCClient.__allocating_init(environment:xpcEndpoint:)(&v8);
    *(void *)(a1 + v4) = v6;
    swift_retain();
    swift_release();
  }
  *a2 = v6;

  return swift_retain();
}

id sub_24CD542CC()
{
  v0[OBJC_IVAR___DTTimerClient__activateCalled] = 0;
  uint64_t v1 = OBJC_IVAR___DTTimerClient__clientID;
  uint64_t v2 = v0;
  *(void *)&v0[v1] = CUNextID64();
  *(void *)&v2[OBJC_IVAR___DTTimerClient__error] = 0;
  uint64_t v3 = &v2[OBJC_IVAR___DTTimerClient_eventHandler];
  *uint64_t v3 = 0;
  v3[1] = 0;
  uint64_t v4 = OBJC_IVAR___DTTimerClient__initTicks;
  *(void *)&v2[v4] = sub_24CD75468();
  v2[OBJC_IVAR___DTTimerClient__invalidateCalled] = 0;
  uint64_t v5 = OBJC_IVAR___DTTimerClient__lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D3D0);
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(void *)&v2[v5] = v6;
  v2[OBJC_IVAR___DTTimerClient__monitorMode] = 0;
  v2[OBJC_IVAR___DTTimerClient__monitorSessionStarted] = 0;
  *(void *)&v2[OBJC_IVAR___DTTimerClient__timerMap] = MEMORY[0x263F8EE80];
  *(void *)&v2[OBJC_IVAR___DTTimerClient__xpcClientCached] = 0;
  DTEnvironmentValues.init()();
  sub_24CD53A2C(0, (unint64_t *)&qword_26982D840);
  uint64_t v7 = sub_24CD75788();
  DTEnvironmentValues.dispatchQueue.setter(v7);
  *(void *)&v2[OBJC_IVAR___DTTimerClient__environment] = v15;
  __n128 v12 = 0uLL;
  DTRequestContext.init(endpoint:)(&v12, &v13);
  unint64_t v8 = v14;
  uint64_t v9 = (__n128 *)&v2[OBJC_IVAR___DTTimerClient__requestContext];
  __n128 *v9 = v13;
  v9[1].n128_u64[0] = v8;

  v11.receiver = v2;
  v11.super_class = (Class)DTTimerClient;
  return objc_msgSendSuper2(&v11, sel_init);
}

void sub_24CD544F8()
{
  uint64_t v1 = v0;
  LOBYTE(v13[0]) = 0;
  if ((unint64_t)sub_24CD75468() >= *(void *)(v0 + OBJC_IVAR___DTTimerClient__initTicks))
  {
    uint64_t v2 = sub_24CD753A8();
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR___DTTimerClient__error);
    id v4 = v3;
    DTAnalyticsMonitorDetails.init(accessoryType:durationSeconds:error:)((char *)v13, v2, v3, (uint64_t)v17);
    uint64_t v5 = v19;
    v13[0] = v17[0];
    v13[1] = v18;
    void v13[2] = v19;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    DTAnalyticsLogEvent(_:)((uint64_t)v13);

    if (*(unsigned char *)(v1 + OBJC_IVAR___DTTimerClient__monitorSessionStarted) == 1)
    {
      uint64_t v7 = MEMORY[0x270FA5388](v6);
      MEMORY[0x270FA5388](v7);
      uint64_t v9 = v8 + 4;
      os_unfair_lock_lock(v8 + 4);
      sub_24CD5A964(v13);
      os_unfair_lock_unlock(v9);
      DTXPCClient.monitorStop(client:completionHandler:)(v1, (uint64_t)nullsub_1, 0);
      uint64_t v6 = swift_release();
    }
    uint64_t v10 = MEMORY[0x270FA5388](v6);
    MEMORY[0x270FA5388](v10);
    __n128 v12 = v11 + 4;
    os_unfair_lock_lock(v11 + 4);
    sub_24CD5B79C();
    os_unfair_lock_unlock(v12);
  }
  else
  {
    __break(1u);
  }
}

void sub_24CD5480C()
{
  uint64_t v1 = sub_24CD754B8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(v0, sel_eventHandler);
  unint64_t v6 = 0x26982D000uLL;
  if (v5)
  {
    _Block_release(v5);
    *((unsigned char *)v0 + OBJC_IVAR___DTTimerClient__monitorMode) = 1;
  }
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v1, (uint64_t)qword_26982E5F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  unint64_t v8 = v0;
  uint64_t v9 = sub_24CD75498();
  os_log_type_t v10 = sub_24CD75748();
  unint64_t v11 = 0x26982D000uLL;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v22 = v13;
    *(_DWORD *)uint64_t v12 = 67109634;
    int v14 = v8[OBJC_IVAR___DTTimerClient__monitorMode];
    uint64_t v25 = v13;
    LODWORD(v23) = v14;
    sub_24CD757C8();
    *(_WORD *)(v12 + 8) = 2080;
    uint64_t v15 = *(void *)&v8[OBJC_IVAR___DTTimerClient__requestContext + 16];
    long long v23 = *(_OWORD *)&v8[OBJC_IVAR___DTTimerClient__requestContext];
    uint64_t v24 = v15;
    sub_24CD48ED0();
    uint64_t v16 = sub_24CD75A68();
    *(void *)&long long v23 = sub_24CD4AF20(v16, v17, &v25);
    sub_24CD757C8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 18) = 2080;
    if (v8[OBJC_IVAR___DTTimerClient__activateCalled]) {
      uint64_t v18 = 0x2970756428202CLL;
    }
    else {
      uint64_t v18 = 0;
    }
    if (v8[OBJC_IVAR___DTTimerClient__activateCalled]) {
      unint64_t v19 = 0xE700000000000000;
    }
    else {
      unint64_t v19 = 0xE000000000000000;
    }
    *(void *)&long long v23 = sub_24CD4AF20(v18, v19, &v25);
    unint64_t v6 = 0x26982D000;
    sub_24CD757C8();

    unint64_t v11 = 0x26982D000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v9, v10, "Activate: monitor=%{BOOL}d %s%s", (uint8_t *)v12, 0x1Cu);
    uint64_t v20 = v22;
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v20, -1, -1);
    MEMORY[0x2533146F0](v12, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v8[*(void *)(v11 + 992)] = 1;
  if (v8[*(void *)(v6 + 1024)] == 1) {
    DTTimerClient._monitorStart(restart:)(0);
  }
}

uint64_t sub_24CD54B98(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t default argument 0 of DTTimerClient._monitorStart(restart:)()
{
  return 0;
}

Swift::Void __swiftcall DTTimerClient._monitorStart(restart:)(Swift::Bool restart)
{
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)&v1[OBJC_IVAR___DTTimerClient__lock] + 16);
  os_unfair_lock_lock(v3);
  sub_24CD5A964(&v5);
  os_unfair_lock_unlock(v3);
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  DTXPCClient.monitorStart(client:restart:completionHandler:)(v1, restart, (uint64_t)sub_24CD5A9B4, v4);
  swift_release();
  swift_release_n();
}

uint64_t sub_24CD54D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v4 = sub_24CD754F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24CD75518();
  uint64_t v8 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  os_log_type_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = *(void *)&v3[OBJC_IVAR___DTTimerClient__environment];
  unint64_t v11 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v3;
  aBlock[4] = v16;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24CD54B98;
  aBlock[3] = v17;
  uint64_t v13 = _Block_copy(aBlock);
  int v14 = v3;
  sub_24CD75508();
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_24CD5B544(&qword_26982D428, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D8F0);
  sub_24CD5A894();
  sub_24CD75818();
  MEMORY[0x253313D20](0, v10, v7, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  return swift_release();
}

void sub_24CD54FE8()
{
  uint64_t v1 = sub_24CD754B8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)qword_26982E5F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  uint64_t v6 = v0;
  uint64_t v7 = sub_24CD75498();
  os_log_type_t v8 = sub_24CD75748();
  unint64_t v9 = 0x26982D000uLL;
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)os_log_type_t v10 = 136315138;
    uint64_t v20 = v11;
    if (v6[OBJC_IVAR___DTTimerClient__invalidateCalled]) {
      uint64_t v12 = 0x297075642820;
    }
    else {
      uint64_t v12 = 0;
    }
    if (v6[OBJC_IVAR___DTTimerClient__invalidateCalled]) {
      unint64_t v13 = 0xE600000000000000;
    }
    else {
      unint64_t v13 = 0xE000000000000000;
    }
    uint64_t v19 = sub_24CD4AF20(v12, v13, &v20);
    unint64_t v9 = 0x26982D000;
    sub_24CD757C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v7, v8, "Invalidate%s", v10, 0xCu);
    uint64_t v14 = v18;
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v14, -1, -1);
    MEMORY[0x2533146F0](v10, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v15 = *(void *)(v9 + 1016);
  v6[v15] = 1;
  uint64_t v16 = OBJC_IVAR___DTTimerClient__monitorMode;
  if (v6[OBJC_IVAR___DTTimerClient__monitorMode] != 1 || (sub_24CD544F8(), v6[v16] = 0, v6[v15] == 1))
  {
    sub_24CD55330(2, 0);
    objc_msgSend(v6, sel_setEventHandler_, 0);
  }
}

void sub_24CD55330(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24CD754B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_26982E5F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  id v11 = a2;
  id v12 = a2;
  unint64_t v13 = sub_24CD75498();
  int v14 = sub_24CD75748();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    int v26 = v14;
    uint64_t v24 = v2;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v29 = v25;
    *(_DWORD *)uint64_t v15 = 136315650;
    uint64_t v27 = a1;
    uint64_t v16 = DTTimerClientEventType.description.getter();
    uint64_t v28 = sub_24CD4AF20(v16, v17, &v29);
    sub_24CD757C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    unint64_t v18 = 0xE300000000000000;
    uint64_t v28 = sub_24CD4AF20(7104878, 0xE300000000000000, &v29);
    sub_24CD757C8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2080;
    if (a2)
    {
      swift_getErrorValue();
      uint64_t v19 = sub_24CD75AD8();
      unint64_t v18 = v20;
      uint64_t v3 = v24;
    }
    else
    {
      uint64_t v3 = v24;
      uint64_t v19 = 7104878;
    }
    uint64_t v28 = sub_24CD4AF20(v19, v18, &v29);
    sub_24CD757C8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24CD46000, v13, (os_log_type_t)v26, "Event: type=%s, timer=%s, error=%s", (uint8_t *)v15, 0x20u);
    uint64_t v21 = v25;
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v21, -1, -1);
    MEMORY[0x2533146F0](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    a1 = v27;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  id v22 = objc_msgSend(v3, sel_eventHandler);
  if (v22)
  {
    long long v23 = v22;
    (*((void (**)(id, uint64_t, void))v22 + 2))(v22, a1, 0);
    _Block_release(v23);
  }
}

void sub_24CD556B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  char v3 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x2533147C0](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    if (v3)
    {
      uint64_t v7 = *(os_unfair_lock_s **)(v5 + OBJC_IVAR___DTTimerClient__lock);
      uint64_t v8 = MEMORY[0x270FA5388](v5);
      MEMORY[0x270FA5388](v8);
      sub_24CD5BA0C(v2, 1);
      swift_retain();
      os_unfair_lock_lock(v7 + 4);
      sub_24CD5BD08();
      os_unfair_lock_unlock(v7 + 4);
      swift_release();
      id v9 = v2;
      sub_24CD55330(4, v2);

      sub_24CD5BA18(v2, 1);
      sub_24CD5BA18(v2, 1);
    }
    else
    {
      *(unsigned char *)(v5 + OBJC_IVAR___DTTimerClient__monitorSessionStarted) = 1;
      uint64_t v10 = *(os_unfair_lock_s **)(v5 + OBJC_IVAR___DTTimerClient__lock);
      uint64_t v11 = MEMORY[0x270FA5388](v5);
      MEMORY[0x270FA5388](v11);
      swift_retain();
      os_unfair_lock_lock(v10 + 4);
      sub_24CD5BD08();
      os_unfair_lock_unlock(v10 + 4);
      swift_release();
      sub_24CD55330(1, 0);
    }
  }
}

unint64_t sub_24CD558C0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4B0);
  uint64_t v2 = (void *)sub_24CD75928();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24CD4B62C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

void DTTimerClient._monitorEvent(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CD754B8();
  __swift_project_value_buffer(v5, (uint64_t)qword_26982E5F8);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24CD75498();
  os_log_type_t v7 = sub_24CD75748();
  if (!os_log_type_enabled(v6, v7))
  {

    uint64_t v12 = swift_bridgeObjectRelease_n();
    if (v3 > 0xC) {
      goto LABEL_10;
    }
LABEL_7:
    if (((1 << v3) & 0x1760) != 0)
    {
      MEMORY[0x270FA5388](v12);
      uint64_t v14 = v13 + 4;
      os_unfair_lock_lock(v13 + 4);
      sub_24CD5ABD0((BOOL *)&v23);
    }
    else
    {
      if (v3 != 7) {
        goto LABEL_10;
      }
      MEMORY[0x270FA5388](v12);
      uint64_t v14 = v21 + 4;
      os_unfair_lock_lock(v21 + 4);
      sub_24CD5A9E0((BOOL *)&v23);
    }
    os_unfair_lock_unlock(v14);
    goto LABEL_10;
  }
  id v22 = v1;
  id v8 = (uint8_t *)swift_slowAlloc();
  uint64_t v9 = swift_slowAlloc();
  *(_DWORD *)id v8 = 136315138;
  uint64_t v25 = v4;
  uint64_t v26 = v9;
  unint64_t v24 = v3;
  sub_24CD5AE7C();
  uint64_t v10 = sub_24CD75A68();
  uint64_t v23 = sub_24CD4AF20(v10, v11, &v26);
  sub_24CD757C8();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_24CD46000, v6, v7, "Event: %s", v8, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x2533146F0](v9, -1, -1);
  uint64_t v2 = v1;
  MEMORY[0x2533146F0](v8, -1, -1);

  if (v3 <= 0xC) {
    goto LABEL_7;
  }
LABEL_10:
  id v15 = objc_msgSend(v2, sel_eventHandler, v22, v23, v24, v25, v26);
  if (!v15) {
    return;
  }
  uint64_t v16 = (void (**)(void, void, void))v15;
  if (v4)
  {
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_24CD758F8();
      if (v17) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v17)
      {
LABEL_14:
        if (v17 < 1)
        {
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v17; ++i)
        {
          if ((v4 & 0xC000000000000001) != 0) {
            id v19 = (id)MEMORY[0x253313E30](i, v4);
          }
          else {
            id v19 = *(id *)(v4 + 8 * i + 32);
          }
          unint64_t v20 = v19;
          ((void (**)(void, unint64_t, id))v16)[2](v16, v3, v19);
        }
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  (*((void (**)(id, unint64_t, void))v15 + 2))(v15, v3, 0);
LABEL_25:
  _Block_release(v16);
}

uint64_t sub_24CD55E44@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  unint64_t v3 = sub_24CD5A268(v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

id sub_24CD55F80(uint64_t a1, SEL *a2)
{
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v10 << 6);
LABEL_22:
    id result = [*(id *)(*(void *)(a1 + 56) + 8 * v12) *a2];
    if (result)
    {
      MEMORY[0x253313BD0]();
      if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24CD75658();
      }
      sub_24CD75668();
      id result = (id)sub_24CD75648();
    }
  }
  int64_t v13 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v13 >= v8) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  ++v10;
  if (v14) {
    goto LABEL_21;
  }
  int64_t v10 = v13 + 1;
  if (v13 + 1 >= v8) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14) {
    goto LABEL_21;
  }
  int64_t v10 = v13 + 2;
  if (v13 + 2 >= v8) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14) {
    goto LABEL_21;
  }
  int64_t v10 = v13 + 3;
  if (v13 + 3 >= v8) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14)
  {
LABEL_21:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_22;
  }
  int64_t v15 = v13 + 4;
  if (v15 >= v8)
  {
LABEL_26:
    swift_release();
    return (id)v16;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_21;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24CD56224@<X0>(SEL *a1@<X1>, void *a2@<X8>)
{
  swift_beginAccess();
  uint64_t v4 = swift_bridgeObjectRetain();
  id v5 = sub_24CD55F80(v4, a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5;
  return result;
}

uint64_t sub_24CD562B0(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v4 = sub_24CD754F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24CD75518();
  uint64_t v8 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  int64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = *(void *)&v2[OBJC_IVAR___DTTimerClient__environment];
  unint64_t v11 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  unint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = v18;
  v12[2] = v2;
  uint64_t v12[3] = v13;
  v12[4] = a2;
  aBlock[4] = sub_24CD5B33C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24CD54B98;
  aBlock[3] = &block_descriptor_15;
  unint64_t v14 = _Block_copy(aBlock);
  int64_t v15 = v2;
  swift_retain();
  sub_24CD75508();
  uint64_t v20 = MEMORY[0x263F8EE78];
  sub_24CD5B544(&qword_26982D428, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D8F0);
  sub_24CD5A894();
  sub_24CD75818();
  MEMORY[0x253313D20](0, v10, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);
  return swift_release();
}

void sub_24CD56578(void (*a1)(unint64_t, void), uint64_t a2)
{
  if (*((unsigned char *)v2 + OBJC_IVAR___DTTimerClient__monitorSessionStarted) == 1)
  {
    swift_beginAccess();
    uint64_t v5 = swift_bridgeObjectRetain();
    unint64_t v6 = (unint64_t)sub_24CD5A268(v5);
    swift_bridgeObjectRelease();
    if (qword_26982E5F0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_24CD754B8();
    __swift_project_value_buffer(v7, (uint64_t)qword_26982E5F8);
    swift_retain_n();
    uint64_t v8 = v2;
    uint64_t v9 = sub_24CD75498();
    os_log_type_t v10 = sub_24CD75748();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v40 = a1;
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v45[0] = v12;
      *(_DWORD *)uint64_t v11 = 134218242;
      if ((v6 & 0x8000000000000000) != 0 || (v6 & 0x4000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_24CD758F8();
        swift_release();
      }
      else
      {
        uint64_t v13 = *(void *)(v6 + 16);
      }
      swift_release();
      v41.n128_u64[0] = v13;
      sub_24CD757C8();
      swift_release();
      *(_WORD *)(v11 + 12) = 2080;
      uint64_t v14 = *(void *)&v8[OBJC_IVAR___DTTimerClient__requestContext + 16];
      __n128 v41 = *(__n128 *)&v8[OBJC_IVAR___DTTimerClient__requestContext];
      *(void *)&long long v42 = v14;
      sub_24CD48ED0();
      uint64_t v15 = sub_24CD75A68();
      v41.n128_u64[0] = sub_24CD4AF20(v15, v16, v45);
      sub_24CD757C8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CD46000, v9, v10, "fetchTimers: cached, timers=%ld, %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533146F0](v12, -1, -1);
      MEMORY[0x2533146F0](v11, -1, -1);

      v40(v6, 0);
    }
    else
    {

      swift_release_n();
      a1(v6, 0);
    }
    swift_release();
  }
  else
  {
    if (qword_26982E5F0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_24CD754B8();
    __swift_project_value_buffer(v17, (uint64_t)qword_26982E5F8);
    uint64_t v18 = v2;
    uint64_t v19 = sub_24CD75498();
    os_log_type_t v20 = sub_24CD75748();
    unint64_t v21 = 0x26982D000uLL;
    if (os_log_type_enabled(v19, v20))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v41.n128_u64[0] = v23;
      *(_DWORD *)id v22 = 136315138;
      uint64_t v24 = *(void *)&v18[OBJC_IVAR___DTTimerClient__requestContext + 16];
      __n128 v46 = *(__n128 *)&v18[OBJC_IVAR___DTTimerClient__requestContext];
      *(void *)&long long v47 = v24;
      sub_24CD48ED0();
      uint64_t v25 = sub_24CD75A68();
      v46.n128_u64[0] = sub_24CD4AF20(v25, v26, (uint64_t *)&v41);
      sub_24CD757C8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CD46000, v19, v20, "fetchTimers: %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v27 = v23;
      unint64_t v21 = 0x26982D000;
      MEMORY[0x2533146F0](v27, -1, -1);
      MEMORY[0x2533146F0](v22, -1, -1);
    }
    else
    {
    }
    uint64_t v29 = MEMORY[0x270FA5388](v28);
    MEMORY[0x270FA5388](v29);
    uint64_t v31 = v30 + 4;
    os_unfair_lock_lock(v30 + 4);
    sub_24CD5A964(&v46);
    os_unfair_lock_unlock(v31);
    *(void *)&long long v42 = 0;
    __n128 v41 = (__n128)1uLL;
    BYTE8(v42) = 10;
    char v32 = (uint64_t *)&v18[*(void *)(v21 + 984)];
    uint64_t v33 = v32[1];
    uint64_t v34 = v32[2];
    v45[0] = *v32;
    v45[1] = v33;
    v45[2] = v34;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    DTXPCRequest.init(request:context:)(&v41, (uint64_t)v45, (uint64_t)&v46);
    __n128 v41 = v46;
    long long v42 = v47;
    long long v43 = v48;
    char v44 = v49;
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = a1;
    *(void *)(v35 + 24) = a2;
    unint64_t v36 = sub_24CD5B8D4();
    swift_retain();
    DTXPCClient.sendNonisolated<A>(request:replyHandler:)((long long *)&v41, (uint64_t)sub_24CD5B868, v35, (uint64_t)&type metadata for DTFetchTimersResponse, v36);
    swift_release();
    swift_release();
    uint64_t v37 = (void *)*((void *)&v42 + 1);
    long long v38 = v43;
    char v39 = v44;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD48E64(v37, v38, *((uint64_t *)&v38 + 1), v39);
  }
}

void sub_24CD56BF4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1)
  {
    type metadata accessor for DTTimer(0);
    uint64_t v5 = (void *)sub_24CD75638();
  }
  if (a2) {
    uint64_t v6 = sub_24CD752C8();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

void sub_24CD56C90(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24CD754B8();
  __swift_project_value_buffer(v7, (uint64_t)qword_26982E5F8);
  id v8 = a1;
  id v9 = v3;
  id v10 = v8;
  uint64_t v11 = (char *)v9;
  uint64_t v12 = sub_24CD75498();
  os_log_type_t v13 = sub_24CD75748();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v34.n128_u64[0] = v33;
    *(_DWORD *)uint64_t v14 = 138412546;
    v41.n128_u64[0] = (unint64_t)v10;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    id v18 = v10;
    sub_24CD757C8();
    *uint64_t v15 = v10;

    a3 = v17;
    a2 = v16;
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v19 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
    __n128 v41 = *(__n128 *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
    uint64_t v42 = v19;
    sub_24CD48ED0();
    uint64_t v20 = sub_24CD75A68();
    v41.n128_u64[0] = sub_24CD4AF20(v20, v21, (uint64_t *)&v34);
    sub_24CD757C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v12, v13, "addTimer: %@, %s", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D440);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v33, -1, -1);
    MEMORY[0x2533146F0](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = v24 + 4;
  os_unfair_lock_lock(v24 + 4);
  sub_24CD5A964(&v41);
  os_unfair_lock_unlock(v25);
  uint64_t v35 = 0;
  __n128 v34 = (__n128)(unint64_t)v10;
  LOBYTE(v36) = 0;
  uint64_t v26 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 8];
  uint64_t v27 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
  v40[0] = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
  v40[1] = v26;
  v40[2] = v27;
  swift_bridgeObjectRetain();
  id v28 = v10;
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v34, (uint64_t)v40, (uint64_t)&v41);
  uint64_t v29 = v43;
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  char v32 = v46;
  __n128 v34 = v41;
  uint64_t v35 = v42;
  unint64_t v36 = v43;
  uint64_t v37 = v44;
  uint64_t v38 = v45;
  char v39 = v46;
  DTXPCClient.send(request:completionHandler:)((long long *)&v34, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(v29, v30, v31, v32);
}

void sub_24CD57090(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_24CD752C8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_24CD570F4(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24CD754B8();
  __swift_project_value_buffer(v7, (uint64_t)qword_26982E5F8);
  id v8 = a1;
  id v9 = v3;
  id v10 = v8;
  uint64_t v11 = (char *)v9;
  uint64_t v12 = sub_24CD75498();
  os_log_type_t v13 = sub_24CD75748();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v34.n128_u64[0] = v33;
    *(_DWORD *)uint64_t v14 = 138412546;
    v41.n128_u64[0] = (unint64_t)v10;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    id v18 = v10;
    sub_24CD757C8();
    *uint64_t v15 = v10;

    a3 = v17;
    a2 = v16;
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v19 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
    __n128 v41 = *(__n128 *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
    uint64_t v42 = v19;
    sub_24CD48ED0();
    uint64_t v20 = sub_24CD75A68();
    v41.n128_u64[0] = sub_24CD4AF20(v20, v21, (uint64_t *)&v34);
    sub_24CD757C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v12, v13, "updateTimer: %@, %s", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D440);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v33, -1, -1);
    MEMORY[0x2533146F0](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = v24 + 4;
  os_unfair_lock_lock(v24 + 4);
  sub_24CD5A964(&v41);
  os_unfair_lock_unlock(v25);
  uint64_t v35 = 0;
  __n128 v34 = (__n128)(unint64_t)v10;
  LOBYTE(v36) = 1;
  uint64_t v26 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 8];
  uint64_t v27 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
  v40[0] = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
  v40[1] = v26;
  v40[2] = v27;
  swift_bridgeObjectRetain();
  id v28 = v10;
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v34, (uint64_t)v40, (uint64_t)&v41);
  uint64_t v29 = v43;
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  char v32 = v46;
  __n128 v34 = v41;
  uint64_t v35 = v42;
  unint64_t v36 = v43;
  uint64_t v37 = v44;
  uint64_t v38 = v45;
  char v39 = v46;
  DTXPCClient.send(request:completionHandler:)((long long *)&v34, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(v29, v30, v31, v32);
}

void sub_24CD574F8(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24CD754B8();
  __swift_project_value_buffer(v7, (uint64_t)qword_26982E5F8);
  id v8 = a1;
  id v9 = v3;
  id v10 = v8;
  uint64_t v11 = (char *)v9;
  uint64_t v12 = sub_24CD75498();
  os_log_type_t v13 = sub_24CD75748();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v34.n128_u64[0] = v33;
    *(_DWORD *)uint64_t v14 = 138412546;
    v41.n128_u64[0] = (unint64_t)v10;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    id v18 = v10;
    sub_24CD757C8();
    *uint64_t v15 = v10;

    a3 = v17;
    a2 = v16;
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v19 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
    __n128 v41 = *(__n128 *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
    uint64_t v42 = v19;
    sub_24CD48ED0();
    uint64_t v20 = sub_24CD75A68();
    v41.n128_u64[0] = sub_24CD4AF20(v20, v21, (uint64_t *)&v34);
    sub_24CD757C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v12, v13, "removeTimer: %@, %s", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D440);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v33, -1, -1);
    MEMORY[0x2533146F0](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = v24 + 4;
  os_unfair_lock_lock(v24 + 4);
  sub_24CD5A964(&v41);
  os_unfair_lock_unlock(v25);
  uint64_t v35 = 0;
  __n128 v34 = (__n128)(unint64_t)v10;
  LOBYTE(v36) = 2;
  uint64_t v26 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 8];
  uint64_t v27 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
  v40[0] = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
  v40[1] = v26;
  v40[2] = v27;
  swift_bridgeObjectRetain();
  id v28 = v10;
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v34, (uint64_t)v40, (uint64_t)&v41);
  uint64_t v29 = v43;
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  char v32 = v46;
  __n128 v34 = v41;
  uint64_t v35 = v42;
  unint64_t v36 = v43;
  uint64_t v37 = v44;
  uint64_t v38 = v45;
  char v39 = v46;
  DTXPCClient.send(request:completionHandler:)((long long *)&v34, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(v29, v30, v31, v32);
}

void sub_24CD578FC(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24CD754B8();
  __swift_project_value_buffer(v7, (uint64_t)qword_26982E5F8);
  id v8 = a1;
  id v9 = v3;
  id v10 = v8;
  uint64_t v11 = (char *)v9;
  uint64_t v12 = sub_24CD75498();
  os_log_type_t v13 = sub_24CD75748();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v34.n128_u64[0] = v33;
    *(_DWORD *)uint64_t v14 = 138412546;
    v41.n128_u64[0] = (unint64_t)v10;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    id v18 = v10;
    sub_24CD757C8();
    *uint64_t v15 = v10;

    a3 = v17;
    a2 = v16;
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v19 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
    __n128 v41 = *(__n128 *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
    uint64_t v42 = v19;
    sub_24CD48ED0();
    uint64_t v20 = sub_24CD75A68();
    v41.n128_u64[0] = sub_24CD4AF20(v20, v21, (uint64_t *)&v34);
    sub_24CD757C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v12, v13, "snoozeTimer: %@, %s", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D440);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v33, -1, -1);
    MEMORY[0x2533146F0](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = v24 + 4;
  os_unfair_lock_lock(v24 + 4);
  sub_24CD5A964(&v41);
  os_unfair_lock_unlock(v25);
  uint64_t v35 = 0;
  __n128 v34 = (__n128)(unint64_t)v10;
  LOBYTE(v36) = 3;
  uint64_t v26 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 8];
  uint64_t v27 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
  v40[0] = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
  v40[1] = v26;
  v40[2] = v27;
  swift_bridgeObjectRetain();
  id v28 = v10;
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v34, (uint64_t)v40, (uint64_t)&v41);
  uint64_t v29 = v43;
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  char v32 = v46;
  __n128 v34 = v41;
  uint64_t v35 = v42;
  unint64_t v36 = v43;
  uint64_t v37 = v44;
  uint64_t v38 = v45;
  char v39 = v46;
  DTXPCClient.send(request:completionHandler:)((long long *)&v34, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(v29, v30, v31, v32);
}

void sub_24CD57D00(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24CD754B8();
  __swift_project_value_buffer(v7, (uint64_t)qword_26982E5F8);
  id v8 = a1;
  id v9 = v3;
  id v10 = v8;
  uint64_t v11 = (char *)v9;
  uint64_t v12 = sub_24CD75498();
  os_log_type_t v13 = sub_24CD75748();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v34.n128_u64[0] = v33;
    *(_DWORD *)uint64_t v14 = 138412546;
    v41.n128_u64[0] = (unint64_t)v10;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    id v18 = v10;
    sub_24CD757C8();
    *uint64_t v15 = v10;

    a3 = v17;
    a2 = v16;
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v19 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
    __n128 v41 = *(__n128 *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
    uint64_t v42 = v19;
    sub_24CD48ED0();
    uint64_t v20 = sub_24CD75A68();
    v41.n128_u64[0] = sub_24CD4AF20(v20, v21, (uint64_t *)&v34);
    sub_24CD757C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v12, v13, "dismissTimer: %@, %s", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D440);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v33, -1, -1);
    MEMORY[0x2533146F0](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = v24 + 4;
  os_unfair_lock_lock(v24 + 4);
  sub_24CD5A964(&v41);
  os_unfair_lock_unlock(v25);
  uint64_t v35 = 0;
  __n128 v34 = (__n128)(unint64_t)v10;
  LOBYTE(v36) = 4;
  uint64_t v26 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 8];
  uint64_t v27 = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext + 16];
  v40[0] = *(void *)&v11[OBJC_IVAR___DTTimerClient__requestContext];
  v40[1] = v26;
  v40[2] = v27;
  swift_bridgeObjectRetain();
  id v28 = v10;
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v34, (uint64_t)v40, (uint64_t)&v41);
  uint64_t v29 = v43;
  uint64_t v30 = v44;
  uint64_t v31 = v45;
  char v32 = v46;
  __n128 v34 = v41;
  uint64_t v35 = v42;
  unint64_t v36 = v43;
  uint64_t v37 = v44;
  uint64_t v38 = v45;
  char v39 = v46;
  DTXPCClient.send(request:completionHandler:)((long long *)&v34, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(v29, v30, v31, v32);
}

uint64_t sub_24CD58104(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a1;
  a7(v13, a6, v12);

  return swift_release();
}

uint64_t DTTimerClient.diagnostics(request:)(unsigned char *a1)
{
  *(void *)(v2 + 152) = v1;
  *(unsigned char *)(v2 + 66) = *a1;
  return MEMORY[0x270FA2498](sub_24CD581D4, 0, 0);
}

uint64_t sub_24CD581D4()
{
  uint64_t v31 = v0;
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CD754B8();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982E5F8);
  uint64_t v2 = sub_24CD75498();
  os_log_type_t v3 = sub_24CD75748();
  if (os_log_type_enabled(v2, v3))
  {
    char v4 = *(unsigned char *)(v0 + 66);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v27.n128_u64[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    *(unsigned char *)(v0 + 65) = v4;
    sub_24CD5B3BC();
    uint64_t v7 = sub_24CD75A68();
    *(void *)(v0 + 144) = sub_24CD4AF20(v7, v8, (uint64_t *)&v27);
    sub_24CD757C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v2, v3, "diagnostics: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v6, -1, -1);
    MEMORY[0x2533146F0](v5, -1, -1);
  }

  uint64_t v9 = *(void *)(v0 + 152);
  id v10 = *(os_unfair_lock_s **)(v9 + OBJC_IVAR___DTTimerClient__lock);
  uint64_t v11 = swift_task_alloc();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = swift_task_alloc();
  *(void *)(v12 + 16) = sub_24CD5BC74;
  *(void *)(v12 + 24) = v11;
  v10 += 4;
  os_unfair_lock_lock(v10);
  sub_24CD5A964(&v27);
  os_unfair_lock_unlock(v10);
  unint64_t v13 = *(unsigned __int8 *)(v0 + 66);
  uint64_t v14 = *(void *)(v0 + 152);
  *(void *)(v0 + 160) = v27.n128_u64[0];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = 0;
  __n128 v27 = (__n128)v13;
  char v29 = 9;
  uint64_t v15 = *(void *)(v14 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  uint64_t v16 = *(void *)(v14 + OBJC_IVAR___DTTimerClient__requestContext + 16);
  v30[0] = *(void *)(v14 + OBJC_IVAR___DTTimerClient__requestContext);
  v30[1] = v15;
  v30[2] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v27, (uint64_t)v30, v0 + 16);
  uint64_t v17 = *(void *)(v0 + 16);
  uint64_t v18 = *(void *)(v0 + 24);
  uint64_t v19 = *(void *)(v0 + 32);
  uint64_t v20 = *(void *)(v0 + 40);
  *(void *)(v0 + 168) = v18;
  *(void *)(v0 + 176) = v19;
  uint64_t v21 = *(void *)(v0 + 48);
  uint64_t v22 = *(void *)(v0 + 56);
  *(void *)(v0 + 184) = v20;
  *(void *)(v0 + 192) = v21;
  *(void *)(v0 + 200) = v22;
  char v23 = *(unsigned char *)(v0 + 64);
  *(unsigned char *)(v0 + 67) = v23;
  *(void *)(v0 + 72) = v17;
  *(void *)(v0 + 80) = v18;
  *(void *)(v0 + 88) = v19;
  *(void *)(v0 + 96) = v20;
  *(void *)(v0 + 104) = v21;
  *(void *)(v0 + 112) = v22;
  *(unsigned char *)(v0 + 120) = v23;
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v24;
  unint64_t v25 = sub_24CD5B368();
  *uint64_t v24 = v0;
  v24[1] = sub_24CD58538;
  return DTXPCClient.send<A>(request:)(v0 + 128, v0 + 72, (uint64_t)&type metadata for DTShowResponse, v25);
}

uint64_t sub_24CD58538()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(void *)(v2 + 192);
    uint64_t v3 = *(void *)(v2 + 200);
    uint64_t v5 = *(void **)(v2 + 184);
    char v6 = *(unsigned char *)(v2 + 67);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD48E64(v5, v4, v3, v6);
    swift_release();
    uint64_t v7 = sub_24CD586E8;
  }
  else
  {
    uint64_t v9 = *(void *)(v2 + 192);
    uint64_t v8 = *(void *)(v2 + 200);
    id v10 = *(void **)(v2 + 184);
    char v11 = *(unsigned char *)(v2 + 67);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD48E64(v10, v9, v8, v11);
    swift_release();
    uint64_t v7 = sub_24CD586CC;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_24CD586CC()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 128), *(void *)(v0 + 136));
}

uint64_t sub_24CD586E8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DTTimerClient.echo(message:)(uint64_t a1, uint64_t a2)
{
  v3[24] = a2;
  v3[25] = v2;
  v3[23] = a1;
  return MEMORY[0x270FA2498](sub_24CD58724, 0, 0);
}

uint64_t sub_24CD58724()
{
  uint64_t v38 = v0;
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = sub_24CD754B8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26982E5F8);
  swift_bridgeObjectRetain_n();
  id v3 = v1;
  uint64_t v4 = sub_24CD75498();
  os_log_type_t v5 = sub_24CD75748();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v8 = *(void *)(v0 + 192);
  uint64_t v7 = *(char **)(v0 + 200);
  if (v6)
  {
    uint64_t v9 = *(void *)(v0 + 184);
    uint64_t v10 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v34.n128_u64[0] = v33;
    *(_DWORD *)uint64_t v10 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 168) = sub_24CD4AF20(v9, v8, (uint64_t *)&v34);
    sub_24CD757C8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v11 = *(void *)&v7[OBJC_IVAR___DTTimerClient__requestContext + 16];
    *(_OWORD *)(v0 + 128) = *(_OWORD *)&v7[OBJC_IVAR___DTTimerClient__requestContext];
    *(void *)(v0 + 144) = v11;
    sub_24CD48ED0();
    uint64_t v12 = sub_24CD75A68();
    *(void *)(v0 + 176) = sub_24CD4AF20(v12, v13, (uint64_t *)&v34);
    sub_24CD757C8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24CD46000, v4, v5, "echo: message=%s, %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v33, -1, -1);
    MEMORY[0x2533146F0](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v14 = *(void *)(v0 + 200);
  uint64_t v15 = *(os_unfair_lock_s **)(v14 + OBJC_IVAR___DTTimerClient__lock);
  uint64_t v16 = swift_task_alloc();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_task_alloc();
  *(void *)(v17 + 16) = sub_24CD5BC74;
  *(void *)(v17 + 24) = v16;
  v15 += 4;
  os_unfair_lock_lock(v15);
  sub_24CD5A964(&v34);
  os_unfair_lock_unlock(v15);
  unint64_t v18 = *(void *)(v0 + 192);
  uint64_t v19 = *(void *)(v0 + 200);
  unint64_t v20 = *(void *)(v0 + 184);
  *(void *)(v0 + 208) = v34.n128_u64[0];
  swift_task_dealloc();
  swift_task_dealloc();
  v34.n128_u64[0] = v20;
  v34.n128_u64[1] = v18;
  uint64_t v35 = 0;
  char v36 = 5;
  uint64_t v21 = *(void *)(v19 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  uint64_t v22 = *(void *)(v19 + OBJC_IVAR___DTTimerClient__requestContext + 16);
  v37[0] = *(void *)(v19 + OBJC_IVAR___DTTimerClient__requestContext);
  v37[1] = v21;
  _OWORD v37[2] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v34, (uint64_t)v37, v0 + 16);
  uint64_t v23 = *(void *)(v0 + 16);
  uint64_t v24 = *(void *)(v0 + 24);
  uint64_t v25 = *(void *)(v0 + 32);
  uint64_t v26 = *(void *)(v0 + 40);
  *(void *)(v0 + 216) = v24;
  *(void *)(v0 + 224) = v25;
  uint64_t v27 = *(void *)(v0 + 48);
  uint64_t v28 = *(void *)(v0 + 56);
  *(void *)(v0 + 232) = v26;
  *(void *)(v0 + 240) = v27;
  *(void *)(v0 + 248) = v28;
  char v29 = *(unsigned char *)(v0 + 64);
  *(unsigned char *)(v0 + 65) = v29;
  *(void *)(v0 + 72) = v23;
  *(void *)(v0 + 80) = v24;
  *(void *)(v0 + 88) = v25;
  *(void *)(v0 + 96) = v26;
  *(void *)(v0 + 104) = v27;
  *(void *)(v0 + 112) = v28;
  *(unsigned char *)(v0 + 120) = v29;
  uint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v30;
  unint64_t v31 = sub_24CD5B410();
  *uint64_t v30 = v0;
  v30[1] = sub_24CD58B3C;
  return DTXPCClient.send<A>(request:)(v0 + 152, v0 + 72, (uint64_t)&type metadata for DTEchoResponse, v31);
}

uint64_t sub_24CD58B3C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 264) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(void *)(v2 + 240);
    uint64_t v3 = *(void *)(v2 + 248);
    os_log_type_t v5 = *(void **)(v2 + 232);
    char v6 = *(unsigned char *)(v2 + 65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD48E64(v5, v4, v3, v6);
    swift_release();
    uint64_t v7 = sub_24CD58CEC;
  }
  else
  {
    uint64_t v9 = *(void *)(v2 + 240);
    uint64_t v8 = *(void *)(v2 + 248);
    uint64_t v10 = *(void **)(v2 + 232);
    char v11 = *(unsigned char *)(v2 + 65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD48E64(v10, v9, v8, v11);
    swift_release();
    uint64_t v7 = sub_24CD58CD0;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_24CD58CD0()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 152), *(void *)(v0 + 160));
}

uint64_t sub_24CD58CEC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DTTimerClient.show()()
{
  *(void *)(v1 + 176) = v0;
  return MEMORY[0x270FA2498](sub_24CD58D24, 0, 0);
}

uint64_t sub_24CD58D24()
{
  uint64_t v35 = v0;
  if (qword_26982E5F0 != -1) {
    swift_once();
  }
  uint64_t v1 = (uint64_t *)(v0 + 176);
  uint64_t v2 = *(void **)(v0 + 176);
  uint64_t v3 = sub_24CD754B8();
  __swift_project_value_buffer(v3, (uint64_t)qword_26982E5F8);
  id v4 = v2;
  os_log_type_t v5 = sub_24CD75498();
  os_log_type_t v6 = sub_24CD75748();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(char **)(v0 + 176);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v31.n128_u64[0] = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v11 = *(void *)&v8[OBJC_IVAR___DTTimerClient__requestContext + 16];
    *(_OWORD *)(v0 + 128) = *(_OWORD *)&v8[OBJC_IVAR___DTTimerClient__requestContext];
    *(void *)(v0 + 144) = v11;
    sub_24CD48ED0();
    uint64_t v12 = sub_24CD75A68();
    *(void *)(v0 + 168) = sub_24CD4AF20(v12, v13, (uint64_t *)&v31);
    sub_24CD757C8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24CD46000, v5, v6, "show, %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v10, -1, -1);
    MEMORY[0x2533146F0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = *v1;
  uint64_t v15 = *(os_unfair_lock_s **)(*v1 + OBJC_IVAR___DTTimerClient__lock);
  uint64_t v16 = swift_task_alloc();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_task_alloc();
  *(void *)(v17 + 16) = sub_24CD5BC74;
  *(void *)(v17 + 24) = v16;
  v15 += 4;
  os_unfair_lock_lock(v15);
  sub_24CD5A964(&v31);
  os_unfair_lock_unlock(v15);
  uint64_t v18 = *(void *)(v0 + 176);
  *(void *)(v0 + 184) = v31.n128_u64[0];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = 0;
  __n128 v31 = (__n128)0x80uLL;
  char v33 = 9;
  uint64_t v19 = *(void *)(v18 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  uint64_t v20 = *(void *)(v18 + OBJC_IVAR___DTTimerClient__requestContext + 16);
  v34[0] = *(void *)(v18 + OBJC_IVAR___DTTimerClient__requestContext);
  v34[1] = v19;
  v34[2] = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v31, (uint64_t)v34, v0 + 16);
  uint64_t v21 = *(void *)(v0 + 16);
  uint64_t v22 = *(void *)(v0 + 24);
  uint64_t v23 = *(void *)(v0 + 32);
  uint64_t v24 = *(void *)(v0 + 40);
  *(void *)(v0 + 192) = v22;
  *(void *)(v0 + 200) = v23;
  uint64_t v25 = *(void *)(v0 + 48);
  uint64_t v26 = *(void *)(v0 + 56);
  *(void *)(v0 + 208) = v24;
  *(void *)(v0 + 216) = v25;
  *(void *)(v0 + 224) = v26;
  char v27 = *(unsigned char *)(v0 + 64);
  *(unsigned char *)(v0 + 65) = v27;
  *(void *)(v0 + 72) = v21;
  *(void *)(v0 + 80) = v22;
  *(void *)(v0 + 88) = v23;
  *(void *)(v0 + 96) = v24;
  *(void *)(v0 + 104) = v25;
  *(void *)(v0 + 112) = v26;
  *(unsigned char *)(v0 + 120) = v27;
  uint64_t v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v28;
  unint64_t v29 = sub_24CD5B368();
  *uint64_t v28 = v0;
  v28[1] = sub_24CD590C8;
  return DTXPCClient.send<A>(request:)(v0 + 152, v0 + 72, (uint64_t)&type metadata for DTShowResponse, v29);
}

uint64_t sub_24CD590C8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(void *)(v2 + 216);
    uint64_t v3 = *(void *)(v2 + 224);
    os_log_type_t v5 = *(void **)(v2 + 208);
    char v6 = *(unsigned char *)(v2 + 65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD48E64(v5, v4, v3, v6);
    swift_release();
    BOOL v7 = sub_24CD5925C;
  }
  else
  {
    uint64_t v9 = *(void *)(v2 + 216);
    uint64_t v8 = *(void *)(v2 + 224);
    uint64_t v10 = *(void **)(v2 + 208);
    char v11 = *(unsigned char *)(v2 + 65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24CD48E64(v10, v9, v8, v11);
    swift_release();
    BOOL v7 = sub_24CD58CD0;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_24CD5925C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DTTimerClientEventType.description.getter()
{
  return 63;
}

uint64_t sub_24CD59448()
{
  return sub_24CD75608();
}

uint64_t sub_24CD594D8()
{
  return sub_24CD755E8();
}

uint64_t sub_24CD59558()
{
  return DTTimerClientEventType.description.getter();
}

uint64_t DTTimerClientStatusFlags.description.getter(char a1)
{
  uint64_t v2 = sub_24CD753E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  os_log_type_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  sub_24CD753D8();
  if (a1)
  {
    sub_24CD75588();
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  sub_24CD75588();
  if ((a1 & 4) != 0) {
LABEL_4:
  }
    sub_24CD75588();
LABEL_5:
  uint64_t v6 = v9;
  uint64_t v7 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v7 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = 1701736270;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t sub_24CD596D4()
{
  return sub_24CD75618();
}

uint64_t sub_24CD59764()
{
  return sub_24CD755F8();
}

uint64_t sub_24CD597E4()
{
  return DTTimerClientStatusFlags.description.getter(*v0);
}

void *sub_24CD597EC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24CD597FC(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_24CD59808@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_24CD59814(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24CD5981C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_24CD59830@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_24CD59844@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_24CD59858(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24CD59888@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_24CD598B4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_24CD598D8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24CD598EC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_24CD59900(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_24CD59914@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24CD59928(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_24CD5993C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_24CD59950(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_24CD59964()
{
  return *v0 == 0;
}

uint64_t sub_24CD59974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_24CD5998C(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL sub_24CD599A0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24CD599B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_24CD5B664(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

id sub_24CD599F4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CD75908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

uint64_t sub_24CD59BA8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4B0);
  char v38 = a2;
  uint64_t v6 = sub_24CD75918();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_24CD75AF8();
    sub_24CD755A8();
    uint64_t result = sub_24CD75B18();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24CD59EB8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24CD59ED8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24CD59ED8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4D8);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    void v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4E0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24CD75938();
  __break(1u);
  return result;
}

unint64_t sub_24CD5A080(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24CD75828();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24CD75AF8();
        swift_bridgeObjectRetain();
        sub_24CD755A8();
        uint64_t v9 = sub_24CD75B18();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24CD5A258(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void *sub_24CD5A268(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4C8);
  int64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  unint64_t v6 = sub_24CD5A354(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24CD53E74();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_24CD5A354(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

id sub_24CD5A550()
{
  v0[OBJC_IVAR___DTTimerClient__activateCalled] = 0;
  uint64_t v1 = OBJC_IVAR___DTTimerClient__clientID;
  uint64_t v2 = v0;
  *(void *)&v0[v1] = CUNextID64();
  *(void *)&v2[OBJC_IVAR___DTTimerClient__error] = 0;
  int64_t v3 = &v2[OBJC_IVAR___DTTimerClient_eventHandler];
  *int64_t v3 = 0;
  v3[1] = 0;
  uint64_t v4 = OBJC_IVAR___DTTimerClient__initTicks;
  *(void *)&v2[v4] = sub_24CD75468();
  v2[OBJC_IVAR___DTTimerClient__invalidateCalled] = 0;
  uint64_t v5 = OBJC_IVAR___DTTimerClient__lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D3D0);
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(void *)&v2[v5] = v6;
  v2[OBJC_IVAR___DTTimerClient__monitorMode] = 0;
  v2[OBJC_IVAR___DTTimerClient__monitorSessionStarted] = 0;
  *(void *)&v2[OBJC_IVAR___DTTimerClient__timerMap] = MEMORY[0x263F8EE80];
  *(void *)&v2[OBJC_IVAR___DTTimerClient__xpcClientCached] = 0;
  DTEnvironmentValues.init()();
  uint64_t v7 = sub_24CD75768();
  DTEnvironmentValues.dispatchQueue.setter(v7);
  *(void *)&v2[OBJC_IVAR___DTTimerClient__environment] = v15;
  __n128 v12 = 0uLL;
  DTRequestContext.init(endpoint:)(&v12, &v13);
  unint64_t v8 = v14;
  unint64_t v9 = (__n128 *)&v2[OBJC_IVAR___DTTimerClient__requestContext];
  __n128 *v9 = v13;
  v9[1].n128_u64[0] = v8;

  v11.receiver = v2;
  v11.super_class = (Class)DTTimerClient;
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_24CD5A6B0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  v3[OBJC_IVAR___DTTimerClient__activateCalled] = 0;
  uint64_t v6 = OBJC_IVAR___DTTimerClient__clientID;
  uint64_t v7 = v3;
  *(void *)&v3[v6] = CUNextID64();
  *(void *)&v7[OBJC_IVAR___DTTimerClient__error] = 0;
  unint64_t v8 = &v7[OBJC_IVAR___DTTimerClient_eventHandler];
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = OBJC_IVAR___DTTimerClient__initTicks;
  *(void *)&v7[v9] = sub_24CD75468();
  v7[OBJC_IVAR___DTTimerClient__invalidateCalled] = 0;
  uint64_t v10 = OBJC_IVAR___DTTimerClient__lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D3D0);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = 0;
  *(void *)&v7[v10] = v11;
  v7[OBJC_IVAR___DTTimerClient__monitorMode] = 0;
  v7[OBJC_IVAR___DTTimerClient__monitorSessionStarted] = 0;
  *(void *)&v7[OBJC_IVAR___DTTimerClient__timerMap] = MEMORY[0x263F8EE80];
  *(void *)&v7[OBJC_IVAR___DTTimerClient__xpcClientCached] = 0;
  DTEnvironmentValues.init()();
  uint64_t v12 = sub_24CD75768();
  DTEnvironmentValues.dispatchQueue.setter(v12);
  *(void *)&v7[OBJC_IVAR___DTTimerClient__environment] = v20;
  v17.n128_u64[0] = a2;
  v17.n128_u64[1] = a3;
  DTRequestContext.init(endpoint:)(&v17, &v18);
  unint64_t v13 = v19;
  unint64_t v14 = (__n128 *)&v7[OBJC_IVAR___DTTimerClient__requestContext];
  *unint64_t v14 = v18;
  v14[1].n128_u64[0] = v13;

  v16.receiver = v7;
  v16.super_class = (Class)DTTimerClient;
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t sub_24CD5A820()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24CD5A858()
{
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

unint64_t sub_24CD5A894()
{
  unint64_t result = qword_26982D430;
  if (!qword_26982D430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26982D8F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D430);
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

uint64_t sub_24CD5A938@<X0>(uint64_t *a1@<X8>)
{
  return sub_24CD54220(*(void *)(v1 + 16), a1);
}

void *sub_24CD5A964@<X0>(void *a1@<X8>)
{
  return sub_24CD5B6E4(a1);
}

uint64_t sub_24CD5A97C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24CD5A9B4(uint64_t a1)
{
  sub_24CD556B8(a1, v1);
}

void sub_24CD5A9BC()
{
}

void sub_24CD5A9E0(BOOL *a1@<X8>)
{
  unint64_t v2 = *(void *)(v1 + 32);
  if (!v2) {
    goto LABEL_16;
  }
  __n128 v18 = a1;
  uint64_t v3 = *(void *)(v1 + 40);
  if (!(v2 >> 62))
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v4) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    a1 = v18;
LABEL_16:
    *a1 = v2 == 0;
    return;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_24CD758F8();
  if (!v4) {
    goto LABEL_15;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v3 + OBJC_IVAR___DTTimerClient__timerMap);
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x253313E30](v5, v2);
      }
      else {
        id v8 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_identifier, v18);
      uint64_t v11 = sub_24CD75568();
      uint64_t v13 = v12;

      swift_beginAccess();
      swift_bridgeObjectRetain();
      unint64_t v14 = sub_24CD4B62C(v11, v13);
      LOBYTE(v11) = v15;
      swift_bridgeObjectRelease();
      if (v11)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v17 = *v6;
        uint64_t v19 = *v6;
        uint64_t *v6 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_24CD599F4();
          uint64_t v17 = v19;
        }
        swift_bridgeObjectRelease();
        uint64_t v7 = *(void **)(*(void *)(v17 + 56) + 8 * v14);
        sub_24CD5A080(v14, v17);
        uint64_t *v6 = v17;
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      ++v5;
      swift_endAccess();
    }
    while (v4 != v5);
    goto LABEL_15;
  }
  __break(1u);
}

void sub_24CD5ABD0(BOOL *a1@<X8>)
{
  unint64_t v2 = *(void *)(v1 + 32);
  if (!v2) {
    goto LABEL_27;
  }
  uint64_t v3 = *(void **)(v1 + 40);
  uint64_t v28 = a1;
  if (v2 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain_n();
    uint64_t v4 = sub_24CD758F8();
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_26;
  }
  uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v4)
  {
LABEL_26:
    swift_bridgeObjectRelease_n();
    a1 = v28;
LABEL_27:
    *a1 = v2 == 0;
    return;
  }
LABEL_4:
  uint64_t v5 = (void *)((char *)v3 + OBJC_IVAR___DTTimerClient__timerMap);
  unint64_t v30 = v2;
  unint64_t v31 = v2 & 0xC000000000000001;
  uint64_t v6 = 4;
  uint64_t v29 = v4;
  while (1)
  {
    uint64_t v3 = (void *)(v6 - 4);
    if (v31) {
      id v9 = (id)MEMORY[0x253313E30](v6 - 4, v2);
    }
    else {
      id v9 = *(id *)(v2 + 8 * v6);
    }
    id v10 = v9;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v32 = v6 - 3;
    id v11 = objc_msgSend(v9, sel_identifier);
    uint64_t v12 = sub_24CD75568();
    uint64_t v14 = v13;

    swift_beginAccess();
    id v15 = v10;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v3 = (void *)*v5;
    id v33 = (void *)*v5;
    *uint64_t v5 = 0x8000000000000000;
    unint64_t v18 = sub_24CD4B62C(v12, v14);
    uint64_t v19 = v3[2];
    BOOL v20 = (v17 & 1) == 0;
    uint64_t v21 = v19 + v20;
    if (__OFADD__(v19, v20)) {
      goto LABEL_23;
    }
    unint64_t v2 = v17;
    if (v3[3] < v21) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v3 = v33;
      if (v17) {
        goto LABEL_5;
      }
    }
    else
    {
      sub_24CD599F4();
      uint64_t v3 = v33;
      if (v2)
      {
LABEL_5:
        uint64_t v7 = v3[7];
        id v8 = *(void **)(v7 + 8 * v18);
        *(void *)(v7 + 8 * v18) = v15;

        goto LABEL_6;
      }
    }
LABEL_18:
    v3[(v18 >> 6) + 8] |= 1 << v18;
    int64_t v24 = (uint64_t *)(v3[6] + 16 * v18);
    *int64_t v24 = v12;
    v24[1] = v14;
    *(void *)(v3[7] + 8 * v18) = v15;
    uint64_t v25 = v3[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_24;
    }
    v3[2] = v27;
    swift_bridgeObjectRetain();
LABEL_6:
    *uint64_t v5 = v3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();

    ++v6;
    unint64_t v2 = v30;
    if (v32 == v29) {
      goto LABEL_26;
    }
  }
  sub_24CD59BA8(v21, isUniquelyReferenced_nonNull_native);
  unint64_t v22 = sub_24CD4B62C(v12, v14);
  if ((v2 & 1) == (v23 & 1))
  {
    unint64_t v18 = v22;
    uint64_t v3 = v33;
    if (v2) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  sub_24CD75AC8();
  __break(1u);
}

unint64_t sub_24CD5AE7C()
{
  unint64_t result = qword_26982D438;
  if (!qword_26982D438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D438);
  }
  return result;
}

uint64_t sub_24CD5AED0@<X0>(void *a1@<X8>)
{
  return sub_24CD55E44(a1);
}

uint64_t sub_24CD5AEFC@<X0>(void *a1@<X8>)
{
  return sub_24CD56224((SEL *)&selRef_mtAlarm, a1);
}

uint64_t sub_24CD5AF20@<X0>(void *a1@<X8>)
{
  return sub_24CD56224((SEL *)&selRef_mtTimer, a1);
}

void *sub_24CD5AF44(void *result, char a2, void *a3)
{
  uint64_t v3 = result[2];
  if (v3)
  {
    uint64_t v6 = result;
    uint64_t v8 = result[4];
    uint64_t v7 = result[5];
    id v9 = (void *)result[6];
    id v10 = (void *)*a3;
    swift_bridgeObjectRetain();
    id v45 = v9;
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_24CD4B62C(v8, v7);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    char v16 = v11;
    if (v10[3] < v15)
    {
      sub_24CD59BA8(v15, a2 & 1);
      unint64_t v17 = sub_24CD4B62C(v8, v7);
      if ((v16 & 1) != (v18 & 1))
      {
LABEL_28:
        unint64_t result = (void *)sub_24CD75AC8();
        __break(1u);
        return result;
      }
      unint64_t v12 = v17;
      uint64_t v19 = (void *)*a3;
      if ((v16 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_9:
      swift_bridgeObjectRelease();
      uint64_t v20 = v19[7];

      *(void *)(v20 + 8 * v12) = v45;
      uint64_t v21 = v3 - 1;
      if (v3 == 1) {
        return (void *)swift_bridgeObjectRelease();
      }
LABEL_16:
      for (uint64_t i = (void **)(v6 + 9); ; i += 3)
      {
        uint64_t v29 = (uint64_t)*(i - 2);
        uint64_t v28 = (uint64_t)*(i - 1);
        unint64_t v30 = *i;
        unint64_t v31 = (void *)*a3;
        swift_bridgeObjectRetain();
        id v32 = v30;
        unint64_t v34 = sub_24CD4B62C(v29, v28);
        uint64_t v35 = v31[2];
        BOOL v36 = (v33 & 1) == 0;
        uint64_t v37 = v35 + v36;
        if (__OFADD__(v35, v36)) {
          break;
        }
        char v38 = v33;
        if (v31[3] < v37)
        {
          sub_24CD59BA8(v37, 1);
          unint64_t v39 = sub_24CD4B62C(v29, v28);
          if ((v38 & 1) != (v40 & 1)) {
            goto LABEL_28;
          }
          unint64_t v34 = v39;
        }
        __n128 v41 = (void *)*a3;
        if (v38)
        {
          swift_bridgeObjectRelease();
          uint64_t v27 = v41[7];

          *(void *)(v27 + 8 * v34) = v32;
        }
        else
        {
          v41[(v34 >> 6) + 8] |= 1 << v34;
          uint64_t v42 = (uint64_t *)(v41[6] + 16 * v34);
          *uint64_t v42 = v29;
          v42[1] = v28;
          *(void *)(v41[7] + 8 * v34) = v32;
          uint64_t v43 = v41[2];
          BOOL v24 = __OFADD__(v43, 1);
          uint64_t v44 = v43 + 1;
          if (v24) {
            goto LABEL_27;
          }
          v41[2] = v44;
        }
        if (!--v21) {
          return (void *)swift_bridgeObjectRelease();
        }
      }
      goto LABEL_26;
    }
    if (a2)
    {
      uint64_t v19 = (void *)*a3;
      if (v11) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_24CD599F4();
      uint64_t v19 = (void *)*a3;
      if (v16) {
        goto LABEL_9;
      }
    }
LABEL_12:
    v19[(v12 >> 6) + 8] |= 1 << v12;
    unint64_t v22 = (uint64_t *)(v19[6] + 16 * v12);
    *unint64_t v22 = v8;
    v22[1] = v7;
    *(void *)(v19[7] + 8 * v12) = v45;
    uint64_t v23 = v19[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    void v19[2] = v25;
    uint64_t v21 = v3 - 1;
    if (v3 == 1) {
      return (void *)swift_bridgeObjectRelease();
    }
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_24CD5B2FC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24CD5B33C()
{
  sub_24CD56578(*(void (**)(unint64_t, void))(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_24CD5B368()
{
  unint64_t result = qword_26982D450;
  if (!qword_26982D450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D450);
  }
  return result;
}

unint64_t sub_24CD5B3BC()
{
  unint64_t result = qword_26982D458;
  if (!qword_26982D458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D458);
  }
  return result;
}

unint64_t sub_24CD5B410()
{
  unint64_t result = qword_26982D468;
  if (!qword_26982D468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D468);
  }
  return result;
}

uint64_t type metadata accessor for DTTimerClient(uint64_t a1)
{
  return sub_24CD53A2C(a1, qword_26982E910);
}

void type metadata accessor for DTTimerClientStatusFlags(uint64_t a1)
{
}

void type metadata accessor for DTTimerClientEventType(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_24CD5B4B4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24CD5B4FC()
{
  return sub_24CD5B544(&qword_26982D490, type metadata accessor for DTTimerClientStatusFlags);
}

uint64_t sub_24CD5B544(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24CD5B58C()
{
  return sub_24CD5B544(&qword_26982D498, type metadata accessor for DTTimerClientStatusFlags);
}

uint64_t sub_24CD5B5D4()
{
  return sub_24CD5B544(&qword_26982D4A0, type metadata accessor for DTTimerClientStatusFlags);
}

uint64_t sub_24CD5B61C()
{
  return sub_24CD5B544(&qword_26982D4A8, type metadata accessor for DTTimerClientStatusFlags);
}

uint64_t sub_24CD5B664(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_24CD5B69C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24CD5B6D4(uint64_t a1)
{
  sub_24CD57090(a1, *(void *)(v1 + 16));
}

void sub_24CD5B6DC(void *a1, uint64_t a2)
{
  sub_24CD56BF4(a1, a2, *(void *)(v2 + 16));
}

void *sub_24CD5B6E4@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_24CD5B728()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = sub_24CD558C0(MEMORY[0x263F8EE78]);
  uint64_t v3 = (unint64_t *)(v1 + OBJC_IVAR___DTTimerClient__timerMap);
  swift_beginAccess();
  *uint64_t v3 = v2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CD5B79C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24CD5B7C4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

id sub_24CD5B7DC@<X0>(void *a1@<X8>)
{
  return sub_24CD5B7F4(a1);
}

id sub_24CD5B7F4@<X0>(void *a1@<X8>)
{
  unint64_t v2 = *(void **)(*(void *)(v1 + 16) + OBJC_IVAR___DTTimerClient__error);
  *a1 = v2;
  return v2;
}

uint64_t sub_24CD5B830()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24CD5B868(uint64_t a1)
{
  unint64_t v2 = *(void (**)(void, void *))(v1 + 16);
  uint64_t v3 = *(void **)a1;
  if (*(unsigned char *)(a1 + 8))
  {
    id v4 = v3;
    v2(0, v3);
    sub_24CD5BA18(v3, 1);
  }
  else
  {
    v2(*(void *)a1, 0);
  }
}

unint64_t sub_24CD5B8D4()
{
  unint64_t result = qword_26982D4C0;
  if (!qword_26982D4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D4C0);
  }
  return result;
}

unint64_t sub_24CD5B928()
{
  unint64_t result = qword_26982D4D0;
  if (!qword_26982D4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D4D0);
  }
  return result;
}

uint64_t sub_24CD5B97C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR___DTTimerClient__error);
  *(void *)(v2 + OBJC_IVAR___DTTimerClient__error) = v1;

  id v4 = v1;
  unint64_t v5 = sub_24CD558C0(MEMORY[0x263F8EE78]);
  uint64_t v6 = (unint64_t *)(v2 + OBJC_IVAR___DTTimerClient__timerMap);
  swift_beginAccess();
  unint64_t *v6 = v5;
  return swift_bridgeObjectRelease();
}

id sub_24CD5BA0C(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

void sub_24CD5BA18(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24CD5BA24()
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v0 + 16);
  unint64_t v3 = *(void *)(v0 + 24);
  unint64_t v5 = *(void **)(v4 + OBJC_IVAR___DTTimerClient__error);
  *(void *)(v4 + OBJC_IVAR___DTTimerClient__error) = 0;

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24CD758F8();
    if (v6)
    {
LABEL_3:
      unint64_t v26 = v3;
      uint64_t v27 = (void *)MEMORY[0x263F8EE78];
      sub_24CD59EB8(0, v6 & ~(v6 >> 63), 0);
      if (v6 < 0)
      {
        __break(1u);
        goto LABEL_19;
      }
      uint64_t v24 = v1;
      uint64_t v25 = v4;
      uint64_t v7 = 0;
      unint64_t v8 = v3;
      id v9 = v27;
      unint64_t v28 = v3 & 0xC000000000000001;
      uint64_t v10 = v6;
      do
      {
        if (v28) {
          id v11 = (id)MEMORY[0x253313E30](v7, v8);
        }
        else {
          id v11 = *(id *)(v8 + 8 * v7 + 32);
        }
        id v12 = v11;
        id v13 = objc_msgSend(v11, sel_identifier, v24, v25);
        uint64_t v14 = sub_24CD75568();
        uint64_t v16 = v15;

        uint64_t v27 = v9;
        unint64_t v18 = v9[2];
        unint64_t v17 = v9[3];
        if (v18 >= v17 >> 1)
        {
          sub_24CD59EB8(v17 > 1, v18 + 1, 1);
          unint64_t v8 = v26;
          id v9 = v27;
        }
        ++v7;
        v9[2] = v18 + 1;
        uint64_t v19 = &v9[3 * v18];
        v19[4] = v14;
        v19[5] = v16;
        v19[6] = v12;
      }
      while (v10 != v7);
      swift_bridgeObjectRelease();
      uint64_t v2 = v24;
      uint64_t v4 = v25;
      if (v9[2]) {
        goto LABEL_12;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  id v9 = (void *)MEMORY[0x263F8EE78];
  if (*(void *)(MEMORY[0x263F8EE78] + 16))
  {
LABEL_12:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4B0);
    uint64_t v20 = sub_24CD75928();
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v20 = MEMORY[0x263F8EE80];
LABEL_16:
  uint64_t v27 = (void *)v20;
  sub_24CD5AF44(v9, 1, &v27);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = v27;
    unint64_t v22 = (void *)(v4 + OBJC_IVAR___DTTimerClient__timerMap);
    swift_beginAccess();
    *unint64_t v22 = v21;
    return swift_bridgeObjectRelease();
  }
LABEL_19:
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_24CD5BC74@<X0>(uint64_t *a1@<X8>)
{
  return sub_24CD5A938(a1);
}

uint64_t sub_24CD5BC8C@<X0>(void *a1@<X8>)
{
  return sub_24CD5AF20(a1);
}

uint64_t sub_24CD5BCA4@<X0>(void *a1@<X8>)
{
  return sub_24CD5AEFC(a1);
}

uint64_t sub_24CD5BCBC@<X0>(void *a1@<X8>)
{
  return sub_24CD5AED0(a1);
}

uint64_t sub_24CD5BD08()
{
  return sub_24CD5B79C();
}

uint64_t sub_24CD5BD30(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA1E38](a1, a2, WitnessTable);
}

uint64_t sub_24CD5BD90(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA1E40](a1, a2, WitnessTable);
}

unint64_t static DTConstants.appSupportDirectoryName.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static DTConstants.entitlementCoordinationAlarms.getter()
{
  return 0xD000000000000025;
}

unint64_t static DTConstants.entitlementCoordinationTimers.getter()
{
  return 0xD000000000000025;
}

unint64_t static DTConstants.entitlementMain.getter()
{
  return 0xD00000000000001BLL;
}

void *sub_24CD5BE68()
{
  return &unk_2652F7108;
}

unint64_t static DTConstants.logSubsystem.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static DTConstants.transactionPrefix.getter()
{
  return 0xD00000000000001BLL;
}

unint64_t static DTConstants.prefsDomain.getter()
{
  return 0xD00000000000001BLL;
}

void *sub_24CD5BEC8()
{
  return &unk_2652F7118;
}

unint64_t static DTConstants.xpcServiceName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t DTEndpoint.init(homeKitAccessoryID:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a2) {
    uint64_t v3 = result;
  }
  else {
    uint64_t v3 = 0;
  }
  *a3 = v3;
  a3[1] = a2;
  return result;
}

uint64_t DTEndpoint.description.getter()
{
  if (v0[1]) {
    uint64_t v1 = *v0;
  }
  else {
    uint64_t v1 = 0x6C61636F6CLL;
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DTEndpoint._homeKitAccessoryID.getter()
{
  if (v0[1]) {
    uint64_t v1 = *v0;
  }
  else {
    uint64_t v1 = 0;
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DTEndpoint.hash(into:)()
{
  if (!*(void *)(v0 + 8)) {
    return sub_24CD75B08();
  }
  sub_24CD75B08();

  return sub_24CD755A8();
}

uint64_t sub_24CD5C000()
{
  if (*v0) {
    return 0xD000000000000012;
  }
  else {
    return 0x6C61636F6CLL;
  }
}

uint64_t sub_24CD5C03C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CD68750(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CD5C064(uint64_t a1)
{
  unint64_t v2 = sub_24CD643AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5C0A0(uint64_t a1)
{
  unint64_t v2 = sub_24CD643AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5C0DC()
{
  return 1;
}

uint64_t sub_24CD5C0EC()
{
  return 12383;
}

void sub_24CD5C0FC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24CD5C108(uint64_t a1)
{
  unint64_t v2 = sub_24CD64400();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5C144(uint64_t a1)
{
  unint64_t v2 = sub_24CD64400();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5C180()
{
  return 0;
}

uint64_t sub_24CD5C18C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24CD5C1BC(uint64_t a1)
{
  unint64_t v2 = sub_24CD64454();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5C1F8(uint64_t a1)
{
  unint64_t v2 = sub_24CD64454();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTEndpoint.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4E8);
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4F0);
  uint64_t v18 = *(void *)(v6 - 8);
  uint64_t v19 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v17 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D4F8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v1[1];
  uint64_t v20 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD643AC();
  sub_24CD75B58();
  if (v12)
  {
    char v24 = 1;
    sub_24CD64400();
    sub_24CD75A08();
    uint64_t v13 = v22;
    sub_24CD75A28();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v13);
  }
  else
  {
    char v23 = 0;
    sub_24CD64454();
    uint64_t v15 = v17;
    sub_24CD75A08();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v19);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t DTEndpoint.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_24CD75AF8();
  sub_24CD75B08();
  if (v1) {
    sub_24CD755A8();
  }
  return sub_24CD75B18();
}

uint64_t DTEndpoint.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v32 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D500);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  uint64_t v31 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D508);
  uint64_t v34 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D510);
  uint64_t v33 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD643AC();
  uint64_t v13 = v35;
  sub_24CD75B48();
  if (v13) {
    goto LABEL_7;
  }
  uint64_t v14 = v34;
  uint64_t v29 = v7;
  uint64_t v35 = a1;
  uint64_t v15 = sub_24CD759F8();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24CD758A8();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D518);
    *uint64_t v22 = &type metadata for DTEndpoint;
    sub_24CD75988();
    sub_24CD75898();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v10);
    a1 = v35;
LABEL_7:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  if (*(unsigned char *)(v15 + 32))
  {
    char v37 = 1;
    sub_24CD64400();
    sub_24CD75978();
    uint64_t v16 = v30;
    uint64_t v17 = sub_24CD759B8();
    uint64_t v18 = v6;
    uint64_t v19 = v33;
    uint64_t v26 = v25;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v18, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v10);
  }
  else
  {
    char v36 = 0;
    sub_24CD64454();
    sub_24CD75978();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v10);
    uint64_t v17 = 0;
    uint64_t v26 = 0;
  }
  uint64_t v27 = v32;
  *id v32 = v17;
  v27[1] = v26;
  uint64_t v23 = (uint64_t)v35;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24CD5CA38@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTEndpoint.init(from:)(a1, a2);
}

uint64_t sub_24CD5CA50(void *a1)
{
  return DTEndpoint.encode(to:)(a1);
}

uint64_t sub_24CD5CA68()
{
  if (v0[1]) {
    uint64_t v1 = *v0;
  }
  else {
    uint64_t v1 = 0x6C61636F6CLL;
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24CD5CAB4()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_24CD75AF8();
  sub_24CD75B08();
  if (v1) {
    sub_24CD755A8();
  }
  return sub_24CD75B18();
}

uint64_t sub_24CD5CB24()
{
  if (!*(void *)(v0 + 8)) {
    return sub_24CD75B08();
  }
  sub_24CD75B08();

  return sub_24CD755A8();
}

uint64_t sub_24CD5CB9C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  sub_24CD75AF8();
  sub_24CD75B08();
  if (v1) {
    sub_24CD755A8();
  }
  return sub_24CD75B18();
}

const char *DTFeatures.domain.getter()
{
  return "DistributedTimers";
}

const char *DTFeatures.feature.getter()
{
  if (*v0) {
    return "ReplaceCoordination";
  }
  else {
    return "AllowHH1";
  }
}

BOOL static DTFeatures.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DTFeatures.hash(into:)()
{
  return sub_24CD75B08();
}

uint64_t DTFeatures.hashValue.getter()
{
  return sub_24CD75B18();
}

const char *sub_24CD5CCDC()
{
  return "DistributedTimers";
}

const char *sub_24CD5CCF0()
{
  if (*v0) {
    return "ReplaceCoordination";
  }
  else {
    return "AllowHH1";
  }
}

DistributedTimers::DTPrefKey_optional __swiftcall DTPrefKey.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  uint64_t v3 = sub_24CD75968();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *unint64_t v2 = v5;
  return result;
}

void *static DTPrefKey.allCases.getter()
{
  return &unk_26FF36BC0;
}

uint64_t DTPrefKey.rawValue.getter()
{
  if (*v0) {
    return 0x67694D64756F6C63;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_24CD5CDDC(char *a1, char *a2)
{
  return sub_24CD5CDE8(*a1, *a2);
}

uint64_t sub_24CD5CDE8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x67694D64756F6C63;
  }
  else {
    unint64_t v3 = 0xD000000000000010;
  }
  if (v2) {
    unint64_t v4 = 0x800000024CD76CB0;
  }
  else {
    unint64_t v4 = 0xED00006465746172;
  }
  if (a2) {
    unint64_t v5 = 0x67694D64756F6C63;
  }
  else {
    unint64_t v5 = 0xD000000000000010;
  }
  if (a2) {
    unint64_t v6 = 0xED00006465746172;
  }
  else {
    unint64_t v6 = 0x800000024CD76CB0;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24CD75AA8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24CD5CEA0()
{
  return sub_24CD75B18();
}

uint64_t sub_24CD5CF34()
{
  sub_24CD755A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24CD5CFB4()
{
  return sub_24CD75B18();
}

DistributedTimers::DTPrefKey_optional sub_24CD5D044(Swift::String *a1)
{
  return DTPrefKey.init(rawValue:)(*a1);
}

void sub_24CD5D050(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0xD000000000000010;
  if (*v1) {
    unint64_t v2 = 0x67694D64756F6C63;
  }
  unint64_t v3 = 0x800000024CD76CB0;
  if (*v1) {
    unint64_t v3 = 0xED00006465746172;
  }
  *a1 = v2;
  a1[1] = v3;
}

void sub_24CD5D0A0(void *a1@<X8>)
{
  *a1 = &unk_26FF36BE8;
}

uint64_t DTRequest.description.getter()
{
  unint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  switch(*(unsigned char *)(v0 + 24))
  {
    case 1:
      id v9 = (id)v1;
      sub_24CD75868();
      swift_bridgeObjectRelease();
      v20[0] = 0xD000000000000010;
      v20[1] = 0x800000024CD76DA0;
      id v10 = objc_msgSend(v9, sel_identifier);
      sub_24CD75568();

      sub_24CD755C8();
      swift_bridgeObjectRelease();
      unint64_t v5 = (void *)v1;
      uint64_t v6 = v2;
      uint64_t v7 = v3;
      char v8 = 1;
      goto LABEL_7;
    case 2:
      id v11 = (id)v1;
      sub_24CD75868();
      swift_bridgeObjectRelease();
      v20[0] = 0xD000000000000010;
      v20[1] = 0x800000024CD76D80;
      id v12 = objc_msgSend(v11, sel_identifier);
      sub_24CD75568();

      sub_24CD755C8();
      swift_bridgeObjectRelease();
      unint64_t v5 = (void *)v1;
      uint64_t v6 = v2;
      uint64_t v7 = v3;
      char v8 = 2;
      goto LABEL_7;
    case 3:
      id v13 = (id)v1;
      sub_24CD75868();
      swift_bridgeObjectRelease();
      v20[0] = 0xD000000000000010;
      v20[1] = 0x800000024CD76D60;
      id v14 = objc_msgSend(v13, sel_identifier);
      sub_24CD75568();

      sub_24CD755C8();
      swift_bridgeObjectRelease();
      unint64_t v5 = (void *)v1;
      uint64_t v6 = v2;
      uint64_t v7 = v3;
      char v8 = 3;
      goto LABEL_7;
    case 4:
      id v15 = (id)v1;
      sub_24CD75868();
      swift_bridgeObjectRelease();
      v20[0] = 0xD000000000000011;
      v20[1] = 0x800000024CD76D40;
      id v16 = objc_msgSend(v15, sel_identifier);
      sub_24CD75568();

      sub_24CD755C8();
      swift_bridgeObjectRelease();
      unint64_t v5 = (void *)v1;
      uint64_t v6 = v2;
      uint64_t v7 = v3;
      char v8 = 4;
      goto LABEL_7;
    case 5:
      strcpy((char *)v20, "echo: '");
      v20[1] = 0xE700000000000000;
      sub_24CD755C8();
      sub_24CD755C8();
      return v20[0];
    case 6:
      v20[0] = 0;
      v20[1] = 0xE000000000000000;
      sub_24CD75868();
      swift_bridgeObjectRelease();
      unint64_t v17 = 0xEE00203A74726174;
      goto LABEL_11;
    case 7:
      unint64_t v17 = 0xED0000203A706F74;
LABEL_11:
      v20[0] = 0x53726F74696E6F6DLL;
      v20[1] = v17;
      strcpy((char *)v21, "clientID=");
      WORD1(v21[1]) = 0;
      HIDWORD(v21[1]) = -385875968;
      sub_24CD75A68();
      sub_24CD755C8();
      swift_bridgeObjectRelease();
      goto LABEL_13;
    case 8:
      sub_24CD75868();
      swift_bridgeObjectRelease();
      strcpy((char *)v21, "monitorEvent: ");
      HIBYTE(v21[1]) = -18;
      v20[0] = v1;
      v20[1] = v2;
      v20[2] = v3;
      DTMonitorEvent.description.getter();
      sub_24CD755C8();
      swift_bridgeObjectRelease();
      return v21[0];
    case 9:
      strcpy((char *)v20, "diagnostics: ");
      HIWORD(v20[1]) = -4864;
      LOBYTE(v21[0]) = v1;
      DTDiagnosticsRequest.description.getter();
LABEL_13:
      sub_24CD755C8();
      swift_bridgeObjectRelease();
      return v20[0];
    case 0xA:
      unint64_t v19 = 0xD000000000000010;
      if (v1 == 1 && (v3 | v2) == 0) {
        unint64_t v19 = 0x6D69546863746566;
      }
      if (v3 | v2 | v1) {
        return v19;
      }
      else {
        return 0x6174536863746566;
      }
    default:
      strcpy((char *)v20, "addTimer: id=");
      HIWORD(v20[1]) = -4864;
      sub_24CD48DA4((id)v1, v2, v3, 0);
      id v4 = objc_msgSend((id)v1, sel_identifier);
      sub_24CD75568();

      sub_24CD755C8();
      swift_bridgeObjectRelease();
      unint64_t v5 = (void *)v1;
      uint64_t v6 = v2;
      uint64_t v7 = v3;
      char v8 = 0;
LABEL_7:
      sub_24CD48E64(v5, v6, v7, v8);
      return v20[0];
  }
}

uint64_t DTRequest.monitorID.getter()
{
  uint64_t result = *v0;
  int v2 = 1 << *((unsigned char *)v0 + 24);
  if ((v2 & 0x33F) != 0 || (v2 & 0xC0) == 0) {
    return 0;
  }
  return result;
}

BOOL DTRequest.isMulticastable.getter()
{
  return *(unsigned __int8 *)(v0 + 24) < 5u;
}

uint64_t DTRequest.isSyncable.getter()
{
  return (*(unsigned __int8 *)(v0 + 24) < 5u) & (0x17u >> *(unsigned char *)(v0 + 24));
}

uint64_t DTRequest.isTargetable.getter()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 > 0xA) {
    return 0;
  }
  uint64_t result = 1;
  if (((1 << v1) & 0xC3) == 0)
  {
    if (v1 != 10) {
      return 0;
    }
    if (*(void *)v0 != 1 || *(_OWORD *)(v0 + 8) != 0) {
      return 0;
    }
  }
  return result;
}

void DTRequest.setTargetAccessoryIfNeeded(defaultTargetID:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void **)v3;
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v7 = *(void *)(v3 + 16);
  char v8 = *(unsigned char *)(v3 + 24);
  if (a2)
  {
    switch(*(unsigned char *)(v3 + 24))
    {
      case 1:
        id v16 = v6;
        v17._uint64_t countAndFlagsBits = a1;
        v17._object = a2;
        DTTimer.setTargetAccessoryIfNeeded(defaultTargetID:)(v18, v17);
        uint64_t v20 = v19;
        char v21 = 1;
        uint64_t v22 = v6;
        uint64_t v23 = v5;
        uint64_t v24 = v7;
        char v25 = 1;
        goto LABEL_11;
      case 2:
        id v34 = v6;
        v35._uint64_t countAndFlagsBits = a1;
        v35._object = a2;
        DTTimer.setTargetAccessoryIfNeeded(defaultTargetID:)(v36, v35);
        uint64_t v20 = v37;
        char v21 = 2;
        uint64_t v22 = v6;
        uint64_t v23 = v5;
        uint64_t v24 = v7;
        char v25 = 2;
        goto LABEL_11;
      case 3:
        id v26 = v6;
        v27._uint64_t countAndFlagsBits = a1;
        v27._object = a2;
        DTTimer.setTargetAccessoryIfNeeded(defaultTargetID:)(v28, v27);
        uint64_t v20 = v29;
        char v21 = 3;
        uint64_t v22 = v6;
        uint64_t v23 = v5;
        uint64_t v24 = v7;
        char v25 = 3;
        goto LABEL_11;
      case 4:
        id v30 = v6;
        v31._uint64_t countAndFlagsBits = a1;
        v31._object = a2;
        DTTimer.setTargetAccessoryIfNeeded(defaultTargetID:)(v32, v31);
        uint64_t v20 = v33;
        char v21 = 4;
        uint64_t v22 = v6;
        uint64_t v23 = v5;
        uint64_t v24 = v7;
        char v25 = 4;
LABEL_11:
        sub_24CD48E64(v22, v23, v24, v25);
        *(void *)(a3 + 8) = 0;
        *(void *)(a3 + 16) = 0;
        *(void *)a3 = v20;
        *(unsigned char *)(a3 + 24) = v21;
        break;
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 0xA:
        goto LABEL_3;
      default:
        id v11 = v6;
        v12._uint64_t countAndFlagsBits = a1;
        v12._object = a2;
        DTTimer.setTargetAccessoryIfNeeded(defaultTargetID:)(v13, v12);
        uint64_t v15 = v14;
        sub_24CD48E64(v6, v5, v7, 0);
        *(void *)(a3 + 8) = 0;
        *(void *)(a3 + 16) = 0;
        *(void *)a3 = v15;
        *(unsigned char *)(a3 + 24) = 0;
        break;
    }
  }
  else
  {
LABEL_3:
    *(void *)a3 = v6;
    *(void *)(a3 + 8) = v5;
    *(void *)(a3 + 16) = v7;
    *(unsigned char *)(a3 + 24) = v8;
    sub_24CD48DA4(v6, v5, v7, v8);
  }
}

uint64_t sub_24CD5D8F8(char a1)
{
  uint64_t result = 0x72656D6954646461;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x657461647075;
      goto LABEL_5;
    case 2:
      uint64_t v3 = 0x65766F6D6572;
      goto LABEL_5;
    case 3:
      uint64_t v3 = 0x657A6F6F6E73;
LABEL_5:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6954000000000000;
      break;
    case 4:
      uint64_t result = 0x547373696D736964;
      break;
    case 5:
      uint64_t result = 0x6174536863746566;
      break;
    case 6:
      uint64_t result = 0x6D69546863746566;
      break;
    case 7:
      uint64_t result = 1869112165;
      break;
    case 8:
    case 9:
      uint64_t result = 0x53726F74696E6F6DLL;
      break;
    case 10:
      uint64_t result = 0xD000000000000010;
      break;
    case 11:
      uint64_t result = 0x45726F74696E6F6DLL;
      break;
    case 12:
      uint64_t result = 0x74736F6E67616964;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24CD5DAA8(uint64_t a1)
{
  unint64_t v2 = sub_24CD649E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DAE4(uint64_t a1)
{
  unint64_t v2 = sub_24CD649E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DB20()
{
  return sub_24CD5D8F8(*v0);
}

uint64_t sub_24CD5DB28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CD68838(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CD5DB50(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_24CD5DB5C(uint64_t a1)
{
  unint64_t v2 = sub_24CD644A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DB98(uint64_t a1)
{
  unint64_t v2 = sub_24CD644A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DBD4(uint64_t a1)
{
  unint64_t v2 = sub_24CD644FC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DC10(uint64_t a1)
{
  unint64_t v2 = sub_24CD644FC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DC4C(uint64_t a1)
{
  unint64_t v2 = sub_24CD64898();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DC88(uint64_t a1)
{
  unint64_t v2 = sub_24CD64898();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DCC4(uint64_t a1)
{
  unint64_t v2 = sub_24CD6479C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DD00(uint64_t a1)
{
  unint64_t v2 = sub_24CD6479C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DD3C(uint64_t a1)
{
  unint64_t v2 = sub_24CD64844();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DD78(uint64_t a1)
{
  unint64_t v2 = sub_24CD64844();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DDB4(uint64_t a1)
{
  unint64_t v2 = sub_24CD647F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DDF0(uint64_t a1)
{
  unint64_t v2 = sub_24CD647F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DE2C(uint64_t a1)
{
  unint64_t v2 = sub_24CD645A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DE68(uint64_t a1)
{
  unint64_t v2 = sub_24CD645A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DEA4(uint64_t a1)
{
  unint64_t v2 = sub_24CD6464C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DEE0(uint64_t a1)
{
  unint64_t v2 = sub_24CD6464C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DF1C(uint64_t a1)
{
  unint64_t v2 = sub_24CD64748();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DF58(uint64_t a1)
{
  unint64_t v2 = sub_24CD64748();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5DF94(uint64_t a1)
{
  unint64_t v2 = sub_24CD646A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5DFD0(uint64_t a1)
{
  unint64_t v2 = sub_24CD646A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5E00C(uint64_t a1)
{
  unint64_t v2 = sub_24CD64940();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5E048(uint64_t a1)
{
  unint64_t v2 = sub_24CD64940();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5E084(uint64_t a1)
{
  unint64_t v2 = sub_24CD648EC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5E0C0(uint64_t a1)
{
  unint64_t v2 = sub_24CD648EC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD5E0FC(uint64_t a1)
{
  unint64_t v2 = sub_24CD64994();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD5E138(uint64_t a1)
{
  unint64_t v2 = sub_24CD64994();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DTRequest.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D520);
  uint64_t v100 = *(void *)(v3 - 8);
  uint64_t v101 = v3;
  MEMORY[0x270FA5388](v3);
  v99 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D528);
  uint64_t v97 = *(void *)(v5 - 8);
  uint64_t v98 = v5;
  MEMORY[0x270FA5388](v5);
  v96 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D530);
  uint64_t v71 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  v70 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D538);
  uint64_t v94 = *(void *)(v8 - 8);
  uint64_t v95 = v8;
  MEMORY[0x270FA5388](v8);
  v93 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D540);
  uint64_t v91 = *(void *)(v10 - 8);
  uint64_t v92 = v10;
  MEMORY[0x270FA5388](v10);
  v90 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D548);
  uint64_t v88 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  v87 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D550);
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  v67 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D558);
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  v73 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D560);
  uint64_t v85 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  v84 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D568);
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  v81 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D570);
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  v78 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D578);
  uint64_t v77 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D580);
  uint64_t v76 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D588);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v105 = v24;
  uint64_t v106 = v25;
  MEMORY[0x270FA5388](v24);
  Swift::String v27 = (char *)&v66 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v28 = *(void *)v1;
  *((void *)&v102 + 1) = *(void *)(v1 + 8);
  unint64_t v103 = v28;
  *(void *)&long long v102 = *(void *)(v1 + 16);
  uint64_t v29 = *(unsigned __int8 *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD644A8();
  v104 = v27;
  sub_24CD75B58();
  switch(v29)
  {
    case 1:
      LOBYTE(v107) = 1;
      sub_24CD64994();
      id v34 = (id)v103;
      id v35 = (id)v103;
      uint64_t v37 = v104;
      uint64_t v36 = v105;
      sub_24CD75A08();
      unint64_t v107 = (unint64_t)v35;
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D5A8, (void (*)(uint64_t))type metadata accessor for DTTimer);
      sub_24CD75A48();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v20, v18);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v37, v36);
      sub_24CD48E64(v34, *((uint64_t *)&v102 + 1), v102, 1);
      return;
    case 2:
      LOBYTE(v107) = 2;
      sub_24CD64940();
      id v38 = (id)v103;
      id v39 = (id)v103;
      char v40 = v78;
      uint64_t v42 = v104;
      uint64_t v41 = v105;
      sub_24CD75A08();
      unint64_t v107 = (unint64_t)v39;
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D5A8, (void (*)(uint64_t))type metadata accessor for DTTimer);
      uint64_t v43 = v80;
      sub_24CD75A48();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v40, v43);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v42, v41);
      sub_24CD48E64(v38, *((uint64_t *)&v102 + 1), v102, 2);
      return;
    case 3:
      LOBYTE(v107) = 3;
      sub_24CD648EC();
      id v44 = (id)v103;
      id v45 = (id)v103;
      char v46 = v81;
      long long v48 = v104;
      uint64_t v47 = v105;
      sub_24CD75A08();
      unint64_t v107 = (unint64_t)v45;
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D5A8, (void (*)(uint64_t))type metadata accessor for DTTimer);
      uint64_t v49 = v83;
      sub_24CD75A48();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v46, v49);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v48, v47);
      sub_24CD48E64(v44, *((uint64_t *)&v102 + 1), v102, 3);
      return;
    case 4:
      LOBYTE(v107) = 4;
      sub_24CD64898();
      id v50 = (id)v103;
      id v51 = (id)v103;
      uint64_t v52 = v84;
      uint64_t v54 = v104;
      uint64_t v53 = v105;
      sub_24CD75A08();
      unint64_t v107 = (unint64_t)v51;
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D5A8, (void (*)(uint64_t))type metadata accessor for DTTimer);
      uint64_t v55 = v86;
      sub_24CD75A48();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v52, v55);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v54, v53);
      sub_24CD48E64(v50, *((uint64_t *)&v102 + 1), v102, 4);
      return;
    case 5:
      LOBYTE(v107) = 7;
      sub_24CD6479C();
      long long v56 = v87;
      v58 = v104;
      uint64_t v57 = v105;
      sub_24CD75A08();
      uint64_t v59 = v89;
      sub_24CD75A28();
      uint64_t v60 = v88;
      goto LABEL_12;
    case 6:
      LOBYTE(v107) = 8;
      sub_24CD64748();
      long long v56 = v90;
      v58 = v104;
      uint64_t v57 = v105;
      sub_24CD75A08();
      unint64_t v107 = v103;
      sub_24CD646F4();
      uint64_t v59 = v92;
      sub_24CD75A48();
      uint64_t v60 = v91;
      goto LABEL_12;
    case 7:
      LOBYTE(v107) = 9;
      sub_24CD646A0();
      long long v56 = v93;
      v58 = v104;
      uint64_t v57 = v105;
      sub_24CD75A08();
      unint64_t v107 = v103;
      sub_24CD646F4();
      uint64_t v59 = v95;
      sub_24CD75A48();
      uint64_t v60 = v94;
      goto LABEL_12;
    case 8:
      LOBYTE(v107) = 11;
      sub_24CD645A4();
      long long v56 = v96;
      v58 = v104;
      uint64_t v57 = v105;
      sub_24CD75A08();
      unint64_t v107 = v103;
      uint64_t v108 = *((void *)&v102 + 1);
      uint64_t v109 = v102;
      sub_24CD645F8();
      uint64_t v59 = v98;
      sub_24CD75A48();
      uint64_t v60 = v97;
      goto LABEL_12;
    case 9:
      LOBYTE(v107) = 12;
      sub_24CD644FC();
      long long v56 = v99;
      v58 = v104;
      uint64_t v57 = v105;
      sub_24CD75A08();
      LOBYTE(v107) = v103;
      sub_24CD64550();
      uint64_t v59 = v101;
      sub_24CD75A48();
      uint64_t v60 = v100;
LABEL_12:
      (*(void (**)(char *, uint64_t))(v60 + 8))(v56, v59);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v58, v57);
      break;
    case 10:
      if ((unint64_t)v102 | *((void *)&v102 + 1) | v103)
      {
        Swift::OpaquePointer_optional v62 = v104;
        uint64_t v61 = v105;
        if (v103 == 1 && v102 == 0)
        {
          LOBYTE(v107) = 6;
          sub_24CD647F0();
          v63 = v67;
          sub_24CD75A08();
          (*(void (**)(char *, uint64_t))(v68 + 8))(v63, v69);
        }
        else
        {
          LOBYTE(v107) = 10;
          sub_24CD6464C();
          v65 = v70;
          sub_24CD75A08();
          (*(void (**)(char *, uint64_t))(v71 + 8))(v65, v72);
        }
      }
      else
      {
        LOBYTE(v107) = 5;
        sub_24CD64844();
        v64 = v73;
        Swift::OpaquePointer_optional v62 = v104;
        uint64_t v61 = v105;
        sub_24CD75A08();
        (*(void (**)(char *, uint64_t))(v74 + 8))(v64, v75);
      }
      (*(void (**)(char *, uint64_t))(v106 + 8))(v62, v61);
      break;
    default:
      LOBYTE(v107) = 0;
      sub_24CD649E8();
      id v30 = (id)v103;
      id v31 = (id)v103;
      uint64_t v33 = v104;
      uint64_t v32 = v105;
      sub_24CD75A08();
      unint64_t v107 = (unint64_t)v31;
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D5A8, (void (*)(uint64_t))type metadata accessor for DTTimer);
      sub_24CD75A48();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v23, v21);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v33, v32);
      sub_24CD48E64(v30, *((uint64_t *)&v102 + 1), v102, 0);
      break;
  }
}

uint64_t DTRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v118 = a2;
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5B0);
  uint64_t v94 = *(void *)(v110 - 8);
  MEMORY[0x270FA5388](v110);
  v116 = (char *)&v83 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5B8);
  uint64_t v93 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388](v111);
  v123 = (char *)&v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5C0);
  uint64_t v107 = *(void *)(v5 - 8);
  uint64_t v108 = v5;
  MEMORY[0x270FA5388](v5);
  v122 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5C8);
  uint64_t v92 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109);
  v117 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5D0);
  uint64_t v91 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  v121 = (char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5D8);
  uint64_t v90 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  v120 = (char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5E0);
  uint64_t v103 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  v115 = (char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5E8);
  uint64_t v100 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  v113 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5F0);
  uint64_t v89 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  v114 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D5F8);
  uint64_t v88 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  v119 = (char *)&v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D600);
  uint64_t v87 = *(void *)(v98 - 8);
  MEMORY[0x270FA5388](v98);
  v112 = (char *)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D608);
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v16 = (char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D610);
  uint64_t v95 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D618);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v83 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = a1[3];
  v124 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_24CD644A8();
  uint64_t v25 = v127;
  sub_24CD75B48();
  if (v25) {
    goto LABEL_29;
  }
  v84 = v19;
  uint64_t v83 = v17;
  uint64_t v85 = v16;
  uint64_t v26 = v119;
  Swift::String v27 = v120;
  uint64_t v29 = v121;
  unint64_t v28 = v122;
  id v30 = v123;
  uint64_t v86 = 0;
  uint64_t v127 = v21;
  uint64_t v31 = sub_24CD759F8();
  if (*(void *)(v31 + 16) != 1)
  {
    uint64_t v38 = v20;
    uint64_t v39 = sub_24CD758A8();
    swift_allocError();
    char v40 = v23;
    uint64_t v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D518);
    *uint64_t v42 = &type metadata for DTRequest;
    sub_24CD75988();
    sub_24CD75898();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v39 - 8) + 104))(v42, *MEMORY[0x263F8DCB0], v39);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v127 + 8))(v40, v38);
LABEL_29:
    uint64_t v81 = (uint64_t)v124;
    return __swift_destroy_boxed_opaque_existential_1(v81);
  }
  switch(*(unsigned char *)(v31 + 32))
  {
    case 1:
      LOBYTE(v125) = 1;
      sub_24CD64994();
      uint64_t v43 = v85;
      uint64_t v44 = v86;
      sub_24CD75978();
      if (v44) {
        goto LABEL_28;
      }
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D638, (void (*)(uint64_t))type metadata accessor for DTTimer);
      uint64_t v45 = v97;
      sub_24CD759D8();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v43, v45);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
      uint64_t v36 = v125;
      long long v37 = 0uLL;
      char v35 = 1;
      goto LABEL_35;
    case 2:
      LOBYTE(v125) = 2;
      sub_24CD64940();
      char v46 = v112;
      uint64_t v47 = v86;
      sub_24CD75978();
      if (v47) {
        goto LABEL_28;
      }
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D638, (void (*)(uint64_t))type metadata accessor for DTTimer);
      uint64_t v48 = v98;
      sub_24CD759D8();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v46, v48);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
      uint64_t v36 = v125;
      long long v37 = 0uLL;
      char v35 = 2;
      goto LABEL_35;
    case 3:
      LOBYTE(v125) = 3;
      sub_24CD648EC();
      uint64_t v49 = v86;
      sub_24CD75978();
      if (v49) {
        goto LABEL_28;
      }
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D638, (void (*)(uint64_t))type metadata accessor for DTTimer);
      uint64_t v50 = v101;
      sub_24CD759D8();
      (*(void (**)(char *, uint64_t))(v88 + 8))(v26, v50);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
      uint64_t v36 = v125;
      long long v37 = 0uLL;
      char v35 = 3;
      goto LABEL_35;
    case 4:
      LOBYTE(v125) = 4;
      sub_24CD64898();
      id v51 = v114;
      uint64_t v52 = v86;
      sub_24CD75978();
      if (v52) {
        goto LABEL_28;
      }
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D638, (void (*)(uint64_t))type metadata accessor for DTTimer);
      uint64_t v53 = v99;
      sub_24CD759D8();
      (*(void (**)(char *, uint64_t))(v89 + 8))(v51, v53);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
      uint64_t v36 = v125;
      long long v37 = 0uLL;
      char v35 = 4;
      goto LABEL_35;
    case 5:
      LOBYTE(v125) = 5;
      sub_24CD64844();
      uint64_t v54 = v113;
      uint64_t v55 = v86;
      sub_24CD75978();
      if (v55) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v100 + 8))(v54, v102);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
      uint64_t v36 = 0;
      long long v37 = 0uLL;
      char v35 = 10;
      goto LABEL_35;
    case 6:
      LOBYTE(v125) = 6;
      sub_24CD647F0();
      long long v56 = v115;
      uint64_t v57 = v86;
      sub_24CD75978();
      if (v57) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v103 + 8))(v56, v104);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
      long long v37 = 0uLL;
      char v35 = 10;
      uint64_t v36 = 1;
      goto LABEL_35;
    case 7:
      LOBYTE(v125) = 7;
      sub_24CD6479C();
      v58 = v27;
      uint64_t v59 = v86;
      sub_24CD75978();
      if (v59) {
        goto LABEL_28;
      }
      uint64_t v60 = v23;
      uint64_t v61 = v20;
      uint64_t v62 = v105;
      uint64_t v36 = sub_24CD759B8();
      unint64_t v80 = v79;
      (*(void (**)(char *, uint64_t))(v90 + 8))(v58, v62);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v60, v61);
      long long v37 = v80;
      char v35 = 5;
      uint64_t v81 = (uint64_t)v124;
      uint64_t v82 = v118;
      goto LABEL_36;
    case 8:
      LOBYTE(v125) = 8;
      sub_24CD64748();
      uint64_t v63 = v86;
      sub_24CD75978();
      if (v63) {
        goto LABEL_28;
      }
      sub_24CD64AE4();
      uint64_t v64 = v106;
      sub_24CD759D8();
      uint64_t v65 = v127;
      (*(void (**)(char *, uint64_t))(v91 + 8))(v29, v64);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v23, v20);
      uint64_t v36 = v125;
      long long v37 = 0uLL;
      char v35 = 6;
      goto LABEL_35;
    case 9:
      LOBYTE(v125) = 9;
      sub_24CD646A0();
      uint64_t v66 = v117;
      uint64_t v67 = v86;
      sub_24CD75978();
      if (v67) {
        goto LABEL_28;
      }
      sub_24CD64AE4();
      uint64_t v68 = v109;
      sub_24CD759D8();
      uint64_t v69 = v127;
      (*(void (**)(char *, uint64_t))(v92 + 8))(v66, v68);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v23, v20);
      uint64_t v36 = v125;
      long long v37 = 0uLL;
      char v35 = 7;
      goto LABEL_35;
    case 0xA:
      LOBYTE(v125) = 10;
      sub_24CD6464C();
      uint64_t v70 = v86;
      sub_24CD75978();
      if (v70) {
        goto LABEL_28;
      }
      (*(void (**)(char *, uint64_t))(v107 + 8))(v28, v108);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
      long long v37 = 0uLL;
      char v35 = 10;
      uint64_t v36 = 2;
      goto LABEL_35;
    case 0xB:
      LOBYTE(v125) = 11;
      sub_24CD645A4();
      uint64_t v71 = v86;
      sub_24CD75978();
      if (v71) {
        goto LABEL_28;
      }
      sub_24CD64A90();
      uint64_t v75 = v111;
      sub_24CD759D8();
      uint64_t v76 = v127;
      (*(void (**)(char *, uint64_t))(v93 + 8))(v30, v75);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v23, v20);
      uint64_t v36 = v125;
      long long v37 = v126;
      char v35 = 8;
      goto LABEL_35;
    case 0xC:
      LOBYTE(v125) = 12;
      sub_24CD644FC();
      v73 = v116;
      uint64_t v74 = v86;
      sub_24CD75978();
      if (v74)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
        uint64_t v81 = (uint64_t)v124;
        return __swift_destroy_boxed_opaque_existential_1(v81);
      }
      sub_24CD64A3C();
      uint64_t v77 = v110;
      sub_24CD759D8();
      uint64_t v78 = v127;
      (*(void (**)(char *, uint64_t))(v94 + 8))(v73, v77);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v78 + 8))(v23, v20);
      uint64_t v36 = v125;
      long long v37 = 0uLL;
      char v35 = 9;
      goto LABEL_35;
    default:
      LOBYTE(v125) = 0;
      sub_24CD649E8();
      uint64_t v32 = v84;
      uint64_t v33 = v86;
      sub_24CD75978();
      if (v33)
      {
LABEL_28:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
        goto LABEL_29;
      }
      type metadata accessor for DTTimer(0);
      sub_24CD64B38(&qword_26982D638, (void (*)(uint64_t))type metadata accessor for DTTimer);
      uint64_t v34 = v83;
      sub_24CD759D8();
      (*(void (**)(char *, uint64_t))(v95 + 8))(v32, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v20);
      char v35 = 0;
      uint64_t v36 = v125;
      long long v37 = 0uLL;
LABEL_35:
      uint64_t v81 = (uint64_t)v124;
      uint64_t v82 = v118;
LABEL_36:
      *(void *)uint64_t v82 = v36;
      *(_OWORD *)(v82 + 8) = v37;
      *(unsigned char *)(v82 + 24) = v35;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v81);
}

uint64_t sub_24CD60874@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DTRequest.init(from:)(a1, a2);
}

void sub_24CD6088C(void *a1)
{
}

uint64_t DTRequestContext.endpoint.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t DTRequestContext.targetIDs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*DTRequestContext.targetIDs.modify())()
{
  return nullsub_1;
}

__n128 DTRequestContext.init(endpoint:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  a2[1].n128_u64[0] = 0;
  return result;
}

uint64_t DTRequestContext.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain_n();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = 0x746E696F70646E65;
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D640);
    sub_24CD65384(&qword_26982D648, &qword_26982D640);
    sub_24CD75548();
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    sub_24CD755C8();
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    return 0x746E696F70646E65;
  }
  return result;
}

uint64_t sub_24CD60A70()
{
  if (*v0) {
    return 0x4449746567726174;
  }
  else {
    return 0x746E696F70646E65;
  }
}

uint64_t sub_24CD60AB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CD68E20(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CD60AD8(uint64_t a1)
{
  unint64_t v2 = sub_24CD64B80();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD60B14(uint64_t a1)
{
  unint64_t v2 = sub_24CD64B80();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTRequestContext.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D650);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  v11[0] = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64B80();
  sub_24CD75B58();
  uint64_t v12 = v8;
  uint64_t v13 = v7;
  char v14 = 0;
  sub_24CD64BD4();
  uint64_t v9 = v11[1];
  sub_24CD75A48();
  if (!v9)
  {
    uint64_t v12 = v11[0];
    char v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D640);
    sub_24CD64C7C(&qword_26982D660);
    sub_24CD75A18();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DTRequestContext.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D668);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64B80();
  sub_24CD75B48();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v14 = 0;
    sub_24CD64C28();
    sub_24CD759D8();
    uint64_t v11 = v13[0];
    uint64_t v10 = v13[1];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D640);
    char v14 = 1;
    sub_24CD64C7C(&qword_26982D678);
    swift_bridgeObjectRetain();
    sub_24CD759A8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = v13[0];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v11;
    a2[1] = v10;
    a2[2] = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24CD60F74@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DTRequestContext.init(from:)(a1, a2);
}

uint64_t sub_24CD60F8C(void *a1)
{
  return DTRequestContext.encode(to:)(a1);
}

uint64_t DTDiagnosticsRequest.description.getter()
{
  int v1 = *v0 >> 6;
  if (!v1)
  {
    sub_24CD75868();
    swift_bridgeObjectRelease();
    unint64_t v3 = 0xD000000000000016;
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    sub_24CD75868();
    swift_bridgeObjectRelease();
    unint64_t v3 = 0xD000000000000013;
LABEL_5:
    sub_24CD755C8();
    swift_bridgeObjectRelease();
    return v3;
  }
  return 2003789939;
}

uint64_t sub_24CD610D8()
{
  uint64_t v1 = 0x7267694D636E7973;
  if (*v0 != 1) {
    uint64_t v1 = 2003789939;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x666E6F43636E7973;
  }
}

uint64_t sub_24CD61140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CD68F20(a1, a2);
  *a3 = result;
  return result;
}

void sub_24CD61168(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24CD61174(uint64_t a1)
{
  unint64_t v2 = sub_24CD64CE0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD611B0(uint64_t a1)
{
  unint64_t v2 = sub_24CD64CE0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD611EC(uint64_t a1)
{
  unint64_t v2 = sub_24CD64D34();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD61228(uint64_t a1)
{
  unint64_t v2 = sub_24CD64D34();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD61264(uint64_t a1)
{
  unint64_t v2 = sub_24CD64DDC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD612A0(uint64_t a1)
{
  unint64_t v2 = sub_24CD64DDC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD612DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24CD75AA8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24CD6135C(uint64_t a1)
{
  unint64_t v2 = sub_24CD64D88();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD61398(uint64_t a1)
{
  unint64_t v2 = sub_24CD64D88();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTDiagnosticsRequest.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D680);
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v22 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D688);
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D690);
  uint64_t v21 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D698);
  uint64_t v12 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  char v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64CE0();
  sub_24CD75B58();
  if (!(v15 >> 6))
  {
    char v28 = 0;
    sub_24CD64DDC();
    uint64_t v16 = v27;
    sub_24CD75A08();
    sub_24CD75A38();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v16);
  }
  if (v15 >> 6 == 1)
  {
    char v29 = 1;
    sub_24CD64D88();
    uint64_t v16 = v27;
    sub_24CD75A08();
    uint64_t v17 = v24;
    sub_24CD75A38();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v17);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v16);
  }
  char v30 = 2;
  sub_24CD64D34();
  uint64_t v19 = v22;
  uint64_t v20 = v27;
  sub_24CD75A08();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v19, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v20);
}

uint64_t DTDiagnosticsRequest.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6A0);
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x270FA5388](v3);
  long long v37 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6A8);
  uint64_t v35 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6B0);
  uint64_t v32 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6B8);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_24CD64CE0();
  uint64_t v15 = v39;
  sub_24CD75B48();
  if (v15) {
    goto LABEL_9;
  }
  uint64_t v16 = v37;
  uint64_t v39 = v11;
  uint64_t v17 = sub_24CD759F8();
  if (*(void *)(v17 + 16) != 1)
  {
    uint64_t v22 = sub_24CD758A8();
    swift_allocError();
    uint64_t v23 = v13;
    uint64_t v24 = v10;
    uint64_t v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D518);
    *uint64_t v26 = &type metadata for DTDiagnosticsRequest;
    sub_24CD75988();
    sub_24CD75898();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v26, *MEMORY[0x263F8DCB0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v23, v24);
LABEL_9:
    uint64_t v21 = (uint64_t)v38;
    return __swift_destroy_boxed_opaque_existential_1(v21);
  }
  if (*(unsigned char *)(v17 + 32))
  {
    if (*(unsigned char *)(v17 + 32) == 1)
    {
      char v41 = 1;
      sub_24CD64D88();
      uint64_t v18 = v6;
      sub_24CD75978();
      uint64_t v19 = v31;
      char v20 = sub_24CD759C8();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v19);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
      uint64_t v21 = (uint64_t)v38;
      *uint64_t v36 = v20 & 1 | 0x40;
    }
    else
    {
      char v42 = 2;
      sub_24CD64D34();
      sub_24CD75978();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v16, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
      uint64_t v21 = (uint64_t)v38;
      *uint64_t v36 = 0x80;
    }
  }
  else
  {
    char v40 = 0;
    sub_24CD64DDC();
    sub_24CD75978();
    uint64_t v27 = v36;
    char v28 = sub_24CD759C8();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v7);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
    uint64_t v21 = (uint64_t)v38;
    *uint64_t v27 = v28 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1(v21);
}

uint64_t sub_24CD61D68@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return DTDiagnosticsRequest.init(from:)(a1, a2);
}

uint64_t sub_24CD61D80(void *a1)
{
  return DTDiagnosticsRequest.encode(to:)(a1);
}

uint64_t DTMonitorContext.clientID.getter()
{
  return *(void *)v0;
}

uint64_t DTMonitorContext.init(clientID:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t DTMonitorContext.description.getter()
{
  return 0x4449746E65696C63;
}

uint64_t sub_24CD61E24()
{
  return 0x4449746E65696C63;
}

uint64_t sub_24CD61E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x4449746E65696C63 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24CD75AA8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24CD61ED4(uint64_t a1)
{
  unint64_t v2 = sub_24CD64E30();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD61F10(uint64_t a1)
{
  unint64_t v2 = sub_24CD64E30();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTMonitorContext.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6C0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64E30();
  sub_24CD75B58();
  sub_24CD75A58();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t DTMonitorContext.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64E30();
  sub_24CD75B48();
  if (!v2)
  {
    uint64_t v9 = sub_24CD759E8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CD621D0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTMonitorContext.init(from:)(a1, a2);
}

uint64_t sub_24CD621E8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6C0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64E30();
  sub_24CD75B58();
  sub_24CD75A58();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24CD6231C()
{
  return 0x4449746E65696C63;
}

uint64_t DTMonitorEvent.clientID.getter()
{
  return *(void *)v0;
}

uint64_t DTMonitorEvent.eventType.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t DTMonitorEvent.timers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DTMonitorEvent.init(clientID:eventType:timers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t DTMonitorEvent.description.getter()
{
  unint64_t v1 = *(void *)(v0 + 16);
  sub_24CD75868();
  swift_bridgeObjectRelease();
  sub_24CD75A68();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  sub_24CD755C8();
  type metadata accessor for DTTimerClientEventType(0);
  sub_24CD64B38(&qword_26982D6D0, type metadata accessor for DTTimerClientEventType);
  sub_24CD75A68();
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  sub_24CD755C8();
  if (v1)
  {
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_24CD758F8();
      swift_bridgeObjectRelease();
    }
    sub_24CD64E84();
    sub_24CD757E8();
  }
  sub_24CD755C8();
  swift_bridgeObjectRelease();
  return 0x4449746E65696C63;
}

uint64_t sub_24CD62580()
{
  uint64_t v1 = 0x707954746E657665;
  if (*v0 != 1) {
    uint64_t v1 = 0x7372656D6974;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4449746E65696C63;
  }
}

uint64_t sub_24CD625DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CD690A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24CD62604(uint64_t a1)
{
  unint64_t v2 = sub_24CD64ED8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD62640(uint64_t a1)
{
  unint64_t v2 = sub_24CD64ED8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTMonitorEvent.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6E0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 8);
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64ED8();
  sub_24CD75B58();
  LOBYTE(v15) = 0;
  sub_24CD75A58();
  if (!v2)
  {
    uint64_t v9 = v12;
    uint64_t v15 = v13;
    char v14 = 1;
    type metadata accessor for DTTimerClientEventType(0);
    sub_24CD64B38(&qword_26982D6E8, type metadata accessor for DTTimerClientEventType);
    sub_24CD75A48();
    uint64_t v15 = v9;
    char v14 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6F0);
    sub_24CD64F2C(&qword_26982D6F8, &qword_26982D5A8);
    sub_24CD75A18();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t DTMonitorEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D700);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64ED8();
  sub_24CD75B48();
  if (!v2)
  {
    LOBYTE(v15) = 0;
    uint64_t v9 = sub_24CD759E8();
    type metadata accessor for DTTimerClientEventType(0);
    char v14 = 1;
    sub_24CD64B38(&qword_26982D708, type metadata accessor for DTTimerClientEventType);
    sub_24CD759D8();
    uint64_t v11 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6F0);
    char v14 = 2;
    sub_24CD64F2C(&qword_26982D710, &qword_26982D638);
    sub_24CD759A8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = v15;
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CD62B34@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTMonitorEvent.init(from:)(a1, a2);
}

uint64_t sub_24CD62B4C(void *a1)
{
  return DTMonitorEvent.encode(to:)(a1);
}

uint64_t DTAckResponse.description.getter()
{
  return 7037793;
}

uint64_t sub_24CD62B7C(uint64_t a1)
{
  unint64_t v2 = sub_24CD64FC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD62BB8(uint64_t a1)
{
  unint64_t v2 = sub_24CD64FC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTAckResponse.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D718);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64FC0();
  sub_24CD75B58();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t DTAckResponse.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_24CD62D2C(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_24CD62D54(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D718);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD64FC0();
  sub_24CD75B58();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24CD62E64()
{
  return 7037793;
}

uint64_t DTEchoResponse.message.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

DistributedTimers::DTEchoResponse __swiftcall DTEchoResponse.init(message:)(DistributedTimers::DTEchoResponse message)
{
  *uint64_t v1 = message;
  return message;
}

uint64_t DTEchoResponse.description.getter()
{
  return 1869112165;
}

uint64_t sub_24CD62EBC()
{
  return 0x6567617373656DLL;
}

uint64_t sub_24CD62ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24CD75AA8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24CD62F6C(uint64_t a1)
{
  unint64_t v2 = sub_24CD65014();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD62FA8(uint64_t a1)
{
  unint64_t v2 = sub_24CD65014();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTEchoResponse.encode(to:)(void *a1)
{
  return sub_24CD63E84(a1, &qword_26982D720, (void (*)(void))sub_24CD65014);
}

uint64_t DTEchoResponse.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24CD64008(a1, &qword_26982D728, (void (*)(void))sub_24CD65014, a2);
}

uint64_t sub_24CD6305C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTEchoResponse.init(from:)(a1, a2);
}

uint64_t sub_24CD63074(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD641DC(a1, a2, a3, &qword_26982D720, (void (*)(void))sub_24CD65014);
}

uint64_t sub_24CD630B0()
{
  return 1869112165;
}

uint64_t DTFetchStatusResponse.statusFlags.getter()
{
  return *(void *)v0;
}

DistributedTimers::DTFetchStatusResponse __swiftcall DTFetchStatusResponse.init(statusFlags:)(DistributedTimers::DTFetchStatusResponse statusFlags)
{
  v1->statusFlags.rawValue = statusFlags.statusFlags.rawValue;
  return statusFlags;
}

uint64_t DTFetchStatusResponse.description.getter()
{
  return 0x6174536863746566;
}

uint64_t sub_24CD630F0()
{
  return 0x6C46737574617473;
}

uint64_t sub_24CD63110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6C46737574617473 && a2 == 0xEB00000000736761)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24CD75AA8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24CD631C0(uint64_t a1)
{
  unint64_t v2 = sub_24CD65068();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD631FC(uint64_t a1)
{
  unint64_t v2 = sub_24CD65068();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTFetchStatusResponse.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D730);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD65068();
  sub_24CD75B58();
  v9[1] = v7;
  type metadata accessor for DTTimerClientStatusFlags(0);
  sub_24CD64B38(&qword_26982D738, type metadata accessor for DTTimerClientStatusFlags);
  sub_24CD75A48();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DTFetchStatusResponse.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D740);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD65068();
  sub_24CD75B48();
  if (!v2)
  {
    type metadata accessor for DTTimerClientStatusFlags(0);
    sub_24CD64B38(&qword_26982D748, type metadata accessor for DTTimerClientStatusFlags);
    sub_24CD759D8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CD63558@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DTFetchStatusResponse.init(from:)(a1, a2);
}

uint64_t sub_24CD63570(void *a1)
{
  return DTFetchStatusResponse.encode(to:)(a1);
}

uint64_t sub_24CD63588()
{
  return 0x6174536863746566;
}

uint64_t DTFetchTimersResponse.timers.getter()
{
  return swift_bridgeObjectRetain();
}

DistributedTimers::DTFetchTimersResponse __swiftcall DTFetchTimersResponse.init(timers:)(DistributedTimers::DTFetchTimersResponse timers)
{
  v1->timers._rawValue = timers.timers._rawValue;
  return timers;
}

uint64_t DTFetchTimersResponse.description.getter()
{
  return 0x6D69546863746566;
}

uint64_t sub_24CD635D8()
{
  return sub_24CD75B08();
}

uint64_t sub_24CD63600()
{
  return 0x7372656D6974;
}

uint64_t sub_24CD63618(uint64_t a1)
{
  unint64_t v2 = sub_24CD650BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD63654(uint64_t a1)
{
  unint64_t v2 = sub_24CD650BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTFetchTimersResponse.encode(to:)(void *a1)
{
  return sub_24CD638BC(a1, &qword_26982D750, (uint64_t)sub_24CD650BC);
}

uint64_t DTFetchTimersResponse.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_24CD63A8C(a1, &qword_26982D758, (void (*)(void))sub_24CD650BC, a2);
}

uint64_t sub_24CD63708@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DTFetchTimersResponse.init(from:)(a1, a2);
}

uint64_t sub_24CD63720(void *a1)
{
  return DTFetchTimersResponse.encode(to:)(a1);
}

uint64_t sub_24CD63738()
{
  return 0x6D69546863746566;
}

uint64_t DTMonitorStartResponse.description.getter()
{
  return 0x53726F74696E6F6DLL;
}

uint64_t sub_24CD63778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7372656D6974 && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24CD75AA8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24CD63808(uint64_t a1)
{
  unint64_t v2 = sub_24CD65110();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD63844(uint64_t a1)
{
  unint64_t v2 = sub_24CD65110();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTMonitorStartResponse.encode(to:)(void *a1)
{
  return sub_24CD638BC(a1, &qword_26982D760, (uint64_t)sub_24CD65110);
}

uint64_t sub_24CD638BC(void *a1, uint64_t *a2, uint64_t a3)
{
  v11[0] = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  ((void (*)(void))v11[0])();
  sub_24CD75B58();
  v11[3] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6F0);
  sub_24CD64F2C(&qword_26982D6F8, &qword_26982D5A8);
  sub_24CD75A48();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DTMonitorStartResponse.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_24CD63A8C(a1, &qword_26982D768, (void (*)(void))sub_24CD65110, a2);
}

uint64_t sub_24CD63A8C@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, void *a4@<X8>)
{
  uint64_t v12 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v13 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24CD75B48();
  if (!v4)
  {
    uint64_t v10 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D6F0);
    sub_24CD64F2C(&qword_26982D710, &qword_26982D638);
    sub_24CD759D8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v7);
    *uint64_t v10 = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CD63C48@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DTMonitorStartResponse.init(from:)(a1, a2);
}

uint64_t sub_24CD63C60(void *a1)
{
  return DTMonitorStartResponse.encode(to:)(a1);
}

uint64_t sub_24CD63C78()
{
  return 0x53726F74696E6F6DLL;
}

uint64_t DTShowResponse.description.getter()
{
  return 2003789939;
}

uint64_t sub_24CD63CA8()
{
  return sub_24CD75B18();
}

uint64_t sub_24CD63CEC()
{
  return sub_24CD75B18();
}

uint64_t sub_24CD63D2C()
{
  return 0x74757074756FLL;
}

uint64_t sub_24CD63D40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x74757074756FLL && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24CD75AA8();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24CD63DD0(uint64_t a1)
{
  unint64_t v2 = sub_24CD65164();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD63E0C(uint64_t a1)
{
  unint64_t v2 = sub_24CD65164();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DTShowResponse.encode(to:)(void *a1)
{
  return sub_24CD63E84(a1, &qword_26982D770, (void (*)(void))sub_24CD65164);
}

uint64_t sub_24CD63E84(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v11 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11();
  sub_24CD75B58();
  sub_24CD75A28();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DTShowResponse.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24CD64008(a1, &qword_26982D778, (void (*)(void))sub_24CD65164, a2);
}

uint64_t sub_24CD64008@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v18 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v17 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_24CD75B48();
  if (!v4)
  {
    uint64_t v10 = v17;
    uint64_t v11 = v18;
    uint64_t v12 = sub_24CD759B8();
    uint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v7);
    *uint64_t v11 = v12;
    v11[1] = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24CD64188@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return DTShowResponse.init(from:)(a1, a2);
}

uint64_t sub_24CD641A0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD641DC(a1, a2, a3, &qword_26982D770, (void (*)(void))sub_24CD65164);
}

uint64_t sub_24CD641DC(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v13 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v13();
  sub_24CD75B58();
  sub_24CD75A28();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24CD64324()
{
  return 2003789939;
}

uint64_t _s17DistributedTimers10DTEndpointO2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (!v3)
  {
    if (!v4)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    return 0;
  }
  if (!v4) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v4) {
    return 1;
  }

  return sub_24CD75AA8();
}

unint64_t sub_24CD643AC()
{
  unint64_t result = qword_26982EC20;
  if (!qword_26982EC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC20);
  }
  return result;
}

unint64_t sub_24CD64400()
{
  unint64_t result = qword_26982EC28;
  if (!qword_26982EC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC28);
  }
  return result;
}

unint64_t sub_24CD64454()
{
  unint64_t result = qword_26982EC30;
  if (!qword_26982EC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC30);
  }
  return result;
}

unint64_t sub_24CD644A8()
{
  unint64_t result = qword_26982EC38;
  if (!qword_26982EC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC38);
  }
  return result;
}

unint64_t sub_24CD644FC()
{
  unint64_t result = qword_26982EC40;
  if (!qword_26982EC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC40);
  }
  return result;
}

unint64_t sub_24CD64550()
{
  unint64_t result = qword_26982D590;
  if (!qword_26982D590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D590);
  }
  return result;
}

unint64_t sub_24CD645A4()
{
  unint64_t result = qword_26982EC48;
  if (!qword_26982EC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC48);
  }
  return result;
}

unint64_t sub_24CD645F8()
{
  unint64_t result = qword_26982D598;
  if (!qword_26982D598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D598);
  }
  return result;
}

unint64_t sub_24CD6464C()
{
  unint64_t result = qword_26982EC50;
  if (!qword_26982EC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC50);
  }
  return result;
}

unint64_t sub_24CD646A0()
{
  unint64_t result = qword_26982EC58;
  if (!qword_26982EC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC58);
  }
  return result;
}

unint64_t sub_24CD646F4()
{
  unint64_t result = qword_26982D5A0;
  if (!qword_26982D5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D5A0);
  }
  return result;
}

unint64_t sub_24CD64748()
{
  unint64_t result = qword_26982EC60;
  if (!qword_26982EC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC60);
  }
  return result;
}

unint64_t sub_24CD6479C()
{
  unint64_t result = qword_26982EC68;
  if (!qword_26982EC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC68);
  }
  return result;
}

unint64_t sub_24CD647F0()
{
  unint64_t result = qword_26982EC70;
  if (!qword_26982EC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC70);
  }
  return result;
}

unint64_t sub_24CD64844()
{
  unint64_t result = qword_26982EC78;
  if (!qword_26982EC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC78);
  }
  return result;
}

unint64_t sub_24CD64898()
{
  unint64_t result = qword_26982EC80;
  if (!qword_26982EC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC80);
  }
  return result;
}

unint64_t sub_24CD648EC()
{
  unint64_t result = qword_26982EC88;
  if (!qword_26982EC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC88);
  }
  return result;
}

unint64_t sub_24CD64940()
{
  unint64_t result = qword_26982EC90;
  if (!qword_26982EC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC90);
  }
  return result;
}

unint64_t sub_24CD64994()
{
  unint64_t result = qword_26982EC98;
  if (!qword_26982EC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982EC98);
  }
  return result;
}

unint64_t sub_24CD649E8()
{
  unint64_t result = qword_26982ECA0;
  if (!qword_26982ECA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECA0);
  }
  return result;
}

unint64_t sub_24CD64A3C()
{
  unint64_t result = qword_26982D620;
  if (!qword_26982D620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D620);
  }
  return result;
}

unint64_t sub_24CD64A90()
{
  unint64_t result = qword_26982D628;
  if (!qword_26982D628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D628);
  }
  return result;
}

unint64_t sub_24CD64AE4()
{
  unint64_t result = qword_26982D630;
  if (!qword_26982D630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D630);
  }
  return result;
}

uint64_t sub_24CD64B38(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24CD64B80()
{
  unint64_t result = qword_26982ECA8;
  if (!qword_26982ECA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECA8);
  }
  return result;
}

unint64_t sub_24CD64BD4()
{
  unint64_t result = qword_26982D658;
  if (!qword_26982D658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D658);
  }
  return result;
}

unint64_t sub_24CD64C28()
{
  unint64_t result = qword_26982D670;
  if (!qword_26982D670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D670);
  }
  return result;
}

uint64_t sub_24CD64C7C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982D640);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CD64CE0()
{
  unint64_t result = qword_26982ECB0;
  if (!qword_26982ECB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECB0);
  }
  return result;
}

unint64_t sub_24CD64D34()
{
  unint64_t result = qword_26982ECB8;
  if (!qword_26982ECB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECB8);
  }
  return result;
}

unint64_t sub_24CD64D88()
{
  unint64_t result = qword_26982ECC0;
  if (!qword_26982ECC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECC0);
  }
  return result;
}

unint64_t sub_24CD64DDC()
{
  unint64_t result = qword_26982ECC8;
  if (!qword_26982ECC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECC8);
  }
  return result;
}

unint64_t sub_24CD64E30()
{
  unint64_t result = qword_26982ECD0;
  if (!qword_26982ECD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECD0);
  }
  return result;
}

unint64_t sub_24CD64E84()
{
  unint64_t result = qword_26982D6D8;
  if (!qword_26982D6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D6D8);
  }
  return result;
}

unint64_t sub_24CD64ED8()
{
  unint64_t result = qword_26982ECD8;
  if (!qword_26982ECD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECD8);
  }
  return result;
}

uint64_t sub_24CD64F2C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982D6F0);
    sub_24CD64B38(a2, (void (*)(uint64_t))type metadata accessor for DTTimer);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24CD64FC0()
{
  unint64_t result = qword_26982ECE0;
  if (!qword_26982ECE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECE0);
  }
  return result;
}

unint64_t sub_24CD65014()
{
  unint64_t result = qword_26982ECE8;
  if (!qword_26982ECE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECE8);
  }
  return result;
}

unint64_t sub_24CD65068()
{
  unint64_t result = qword_26982ECF0;
  if (!qword_26982ECF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECF0);
  }
  return result;
}

unint64_t sub_24CD650BC()
{
  unint64_t result = qword_26982ECF8;
  if (!qword_26982ECF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ECF8);
  }
  return result;
}

unint64_t sub_24CD65110()
{
  unint64_t result = qword_26982ED00;
  if (!qword_26982ED00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ED00);
  }
  return result;
}

unint64_t sub_24CD65164()
{
  unint64_t result = qword_26982ED08[0];
  if (!qword_26982ED08[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26982ED08);
  }
  return result;
}

uint64_t sub_24CD651B8()
{
  return sub_24CD64B38(&qword_26982D780, (void (*)(uint64_t))sub_24CD65200);
}

unint64_t sub_24CD65200()
{
  unint64_t result = qword_26982D788;
  if (!qword_26982D788)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26982D788);
  }
  return result;
}

unint64_t sub_24CD65244()
{
  unint64_t result = qword_26982D790;
  if (!qword_26982D790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D790);
  }
  return result;
}

unint64_t sub_24CD6529C()
{
  unint64_t result = qword_26982D798;
  if (!qword_26982D798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D798);
  }
  return result;
}

unint64_t sub_24CD652F4()
{
  unint64_t result = qword_26982D7A0;
  if (!qword_26982D7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7A0);
  }
  return result;
}

uint64_t sub_24CD65348()
{
  return sub_24CD65384(&qword_26982D7A8, &qword_26982D7B0);
}

uint64_t sub_24CD65384(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24CD653C8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD65938(a1, a2, a3, (uint64_t (*)(void))sub_24CD65408, (uint64_t (*)(void))sub_24CD6545C, (uint64_t (*)(void))sub_24CD654B0);
}

unint64_t sub_24CD65408()
{
  unint64_t result = qword_26982D7B8;
  if (!qword_26982D7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7B8);
  }
  return result;
}

unint64_t sub_24CD6545C()
{
  unint64_t result = qword_26982D900;
  if (!qword_26982D900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D900);
  }
  return result;
}

unint64_t sub_24CD654B0()
{
  unint64_t result = qword_26982D7C0;
  if (!qword_26982D7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7C0);
  }
  return result;
}

uint64_t sub_24CD65504(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD65938(a1, a2, a3, (uint64_t (*)(void))sub_24CD65544, (uint64_t (*)(void))sub_24CD5B410, (uint64_t (*)(void))sub_24CD65598);
}

unint64_t sub_24CD65544()
{
  unint64_t result = qword_26982D7C8;
  if (!qword_26982D7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7C8);
  }
  return result;
}

unint64_t sub_24CD65598()
{
  unint64_t result = qword_26982D7D0;
  if (!qword_26982D7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7D0);
  }
  return result;
}

uint64_t sub_24CD655EC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD65938(a1, a2, a3, (uint64_t (*)(void))sub_24CD6562C, (uint64_t (*)(void))sub_24CD5B928, (uint64_t (*)(void))sub_24CD65680);
}

unint64_t sub_24CD6562C()
{
  unint64_t result = qword_26982D7D8;
  if (!qword_26982D7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7D8);
  }
  return result;
}

unint64_t sub_24CD65680()
{
  unint64_t result = qword_26982D7E0;
  if (!qword_26982D7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7E0);
  }
  return result;
}

uint64_t sub_24CD656D4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD65938(a1, a2, a3, (uint64_t (*)(void))sub_24CD65714, (uint64_t (*)(void))sub_24CD5B8D4, (uint64_t (*)(void))sub_24CD65768);
}

unint64_t sub_24CD65714()
{
  unint64_t result = qword_26982D7E8;
  if (!qword_26982D7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7E8);
  }
  return result;
}

unint64_t sub_24CD65768()
{
  unint64_t result = qword_26982D7F0;
  if (!qword_26982D7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7F0);
  }
  return result;
}

uint64_t sub_24CD657BC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD65938(a1, a2, a3, (uint64_t (*)(void))sub_24CD657FC, (uint64_t (*)(void))sub_24CD65850, (uint64_t (*)(void))sub_24CD658A4);
}

unint64_t sub_24CD657FC()
{
  unint64_t result = qword_26982D7F8;
  if (!qword_26982D7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D7F8);
  }
  return result;
}

unint64_t sub_24CD65850()
{
  unint64_t result = qword_26982D950;
  if (!qword_26982D950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D950);
  }
  return result;
}

unint64_t sub_24CD658A4()
{
  unint64_t result = qword_26982D800;
  if (!qword_26982D800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D800);
  }
  return result;
}

uint64_t sub_24CD658F8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD65938(a1, a2, a3, (uint64_t (*)(void))sub_24CD6598C, (uint64_t (*)(void))sub_24CD5B368, (uint64_t (*)(void))sub_24CD659E0);
}

uint64_t sub_24CD65938(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  uint64_t result = a6();
  a1[3] = result;
  return result;
}

unint64_t sub_24CD6598C()
{
  unint64_t result = qword_26982D808;
  if (!qword_26982D808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D808);
  }
  return result;
}

unint64_t sub_24CD659E0()
{
  unint64_t result = qword_26982D810;
  if (!qword_26982D810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D810);
  }
  return result;
}

ValueMetadata *type metadata accessor for DTConstants()
{
  return &type metadata for DTConstants;
}

void *initializeBufferWithCopyOfBuffer for DTEndpoint(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DTEndpoint()
{
  return swift_bridgeObjectRelease();
}

void *assignWithTake for DTEndpoint(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DTEndpoint(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DTEndpoint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_24CD65B58(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24CD65B70(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DTEndpoint()
{
  return &type metadata for DTEndpoint;
}

ValueMetadata *type metadata accessor for DTFeatures()
{
  return &type metadata for DTFeatures;
}

ValueMetadata *type metadata accessor for DTPrefKey()
{
  return &type metadata for DTPrefKey;
}

void destroy for DTRequest(uint64_t a1)
{
}

uint64_t initializeWithCopy for DTRequest(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24CD48DA4(*(id *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for DTRequest(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_24CD48DA4(*(id *)a2, v4, v5, v6);
  uint64_t v7 = *(void **)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_24CD48E64(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DTRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_24CD48E64(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DTRequest(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF6 && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 246);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 0xA) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DTRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF5)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 246;
    if (a3 >= 0xF6) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF6) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24CD65DA0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 9u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 10);
  }
}

uint64_t sub_24CD65DB8(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 10;
  if (a2 >= 0xA)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 10;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DTRequest()
{
  return &type metadata for DTRequest;
}

uint64_t destroy for DTRequestContext()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s17DistributedTimers16DTRequestContextVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DTRequestContext(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DTRequestContext(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DTRequestContext(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DTRequestContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTRequestContext()
{
  return &type metadata for DTRequestContext;
}

uint64_t getEnumTagSinglePayload for DTDiagnosticsRequest(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7E) {
    goto LABEL_17;
  }
  if (a2 + 130 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 130) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 130;
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
      return (*a1 | (v4 << 8)) - 130;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 130;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7D) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for DTDiagnosticsRequest(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 130 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 130) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7E) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7D)
  {
    unsigned int v6 = ((a2 - 126) >> 8) + 1;
    *__n128 result = a2 - 126;
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
        JUMPOUT(0x24CD6614CLL);
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
          *__n128 result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_24CD66174(unsigned char *a1)
{
  int v1 = (char)*a1;
  if (v1 >= 0) {
    return *a1 >> 6;
  }
  else {
    return v1 & 1 | 2u;
  }
}

unsigned char *sub_24CD66190(unsigned char *result)
{
  *result &= 0x3Fu;
  return result;
}

unsigned char *sub_24CD661A0(unsigned char *result, unsigned int a2)
{
  if (a2 < 2) {
    *__n128 result = *result & 1 | ((_BYTE)a2 << 6);
  }
  else {
    *__n128 result = a2 & 1 | 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest()
{
  return &type metadata for DTDiagnosticsRequest;
}

ValueMetadata *type metadata accessor for DTMonitorContext()
{
  return &type metadata for DTMonitorContext;
}

uint64_t initializeBufferWithCopyOfBuffer for DTMonitorEvent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DTMonitorEvent()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for DTMonitorEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DTMonitorEvent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for DTMonitorEvent()
{
  return &type metadata for DTMonitorEvent;
}

ValueMetadata *type metadata accessor for DTAckResponse()
{
  return &type metadata for DTAckResponse;
}

ValueMetadata *type metadata accessor for DTEchoResponse()
{
  return &type metadata for DTEchoResponse;
}

ValueMetadata *type metadata accessor for DTFetchStatusResponse()
{
  return &type metadata for DTFetchStatusResponse;
}

ValueMetadata *type metadata accessor for DTFetchTimersResponse()
{
  return &type metadata for DTFetchTimersResponse;
}

ValueMetadata *type metadata accessor for DTMonitorStartResponse()
{
  return &type metadata for DTMonitorStartResponse;
}

void *_s17DistributedTimers10DTEndpointOwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17DistributedTimers14DTEchoResponseVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24CD663A8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTShowResponse()
{
  return &type metadata for DTShowResponse;
}

uint64_t sub_24CD66400()
{
  return 0;
}

ValueMetadata *type metadata accessor for DTShowResponse.CodingKeys()
{
  return &type metadata for DTShowResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTMonitorStartResponse.CodingKeys()
{
  return &type metadata for DTMonitorStartResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTFetchTimersResponse.CodingKeys()
{
  return &type metadata for DTFetchTimersResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTFetchStatusResponse.CodingKeys()
{
  return &type metadata for DTFetchStatusResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTEchoResponse.CodingKeys()
{
  return &type metadata for DTEchoResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTAckResponse.CodingKeys()
{
  return &type metadata for DTAckResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DTMonitorEvent.CodingKeys()
{
  return &type metadata for DTMonitorEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for DTMonitorContext.CodingKeys()
{
  return &type metadata for DTMonitorContext.CodingKeys;
}

unsigned char *_s17DistributedTimers14DTMonitorEventV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x24CD6655CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest.CodingKeys()
{
  return &type metadata for DTDiagnosticsRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest.SyncConfigureCodingKeys()
{
  return &type metadata for DTDiagnosticsRequest.SyncConfigureCodingKeys;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest.SyncMigrateCodingKeys()
{
  return &type metadata for DTDiagnosticsRequest.SyncMigrateCodingKeys;
}

ValueMetadata *type metadata accessor for DTDiagnosticsRequest.ShowCodingKeys()
{
  return &type metadata for DTDiagnosticsRequest.ShowCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequestContext.CodingKeys()
{
  return &type metadata for DTRequestContext.CodingKeys;
}

uint64_t getEnumTagSinglePayload for DTRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DTRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *__n128 result = a2 + 12;
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
        JUMPOUT(0x24CD66730);
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
          *__n128 result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DTRequest.CodingKeys()
{
  return &type metadata for DTRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.AddTimerCodingKeys()
{
  return &type metadata for DTRequest.AddTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.UpdateTimerCodingKeys()
{
  return &type metadata for DTRequest.UpdateTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.RemoveTimerCodingKeys()
{
  return &type metadata for DTRequest.RemoveTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.SnoozeTimerCodingKeys()
{
  return &type metadata for DTRequest.SnoozeTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.DismissTimerCodingKeys()
{
  return &type metadata for DTRequest.DismissTimerCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.FetchStatusCodingKeys()
{
  return &type metadata for DTRequest.FetchStatusCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.FetchTimersCodingKeys()
{
  return &type metadata for DTRequest.FetchTimersCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.EchoCodingKeys()
{
  return &type metadata for DTRequest.EchoCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.MonitorStartCodingKeys()
{
  return &type metadata for DTRequest.MonitorStartCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.MonitorStopCodingKeys()
{
  return &type metadata for DTRequest.MonitorStopCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.MonitorKeepAliveCodingKeys()
{
  return &type metadata for DTRequest.MonitorKeepAliveCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.MonitorEventCodingKeys()
{
  return &type metadata for DTRequest.MonitorEventCodingKeys;
}

ValueMetadata *type metadata accessor for DTRequest.DiagnosticsCodingKeys()
{
  return &type metadata for DTRequest.DiagnosticsCodingKeys;
}

unsigned char *_s17DistributedTimers10DTFeaturesOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CD66904);
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

ValueMetadata *type metadata accessor for DTEndpoint.CodingKeys()
{
  return &type metadata for DTEndpoint.CodingKeys;
}

ValueMetadata *type metadata accessor for DTEndpoint.LocalCodingKeys()
{
  return &type metadata for DTEndpoint.LocalCodingKeys;
}

uint64_t _s17DistributedTimers14DTShowResponseV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s17DistributedTimers14DTShowResponseV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24CD66A38);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DTEndpoint.HomeKitAccessoryIDCodingKeys()
{
  return &type metadata for DTEndpoint.HomeKitAccessoryIDCodingKeys;
}

unint64_t sub_24CD66A74()
{
  unint64_t result = qword_269830810[0];
  if (!qword_269830810[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269830810);
  }
  return result;
}

unint64_t sub_24CD66ACC()
{
  unint64_t result = qword_269830B20[0];
  if (!qword_269830B20[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269830B20);
  }
  return result;
}

unint64_t sub_24CD66B24()
{
  unint64_t result = qword_269830D30[0];
  if (!qword_269830D30[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269830D30);
  }
  return result;
}

unint64_t sub_24CD66B7C()
{
  unint64_t result = qword_269830F40[0];
  if (!qword_269830F40[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269830F40);
  }
  return result;
}

unint64_t sub_24CD66BD4()
{
  unint64_t result = qword_269831250[0];
  if (!qword_269831250[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269831250);
  }
  return result;
}

unint64_t sub_24CD66C2C()
{
  unint64_t result = qword_269831460[0];
  if (!qword_269831460[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269831460);
  }
  return result;
}

unint64_t sub_24CD66C84()
{
  unint64_t result = qword_269831670[0];
  if (!qword_269831670[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269831670);
  }
  return result;
}

unint64_t sub_24CD66CDC()
{
  unint64_t result = qword_269831A80[0];
  if (!qword_269831A80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269831A80);
  }
  return result;
}

unint64_t sub_24CD66D34()
{
  unint64_t result = qword_269831C90[0];
  if (!qword_269831C90[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269831C90);
  }
  return result;
}

unint64_t sub_24CD66D8C()
{
  unint64_t result = qword_269831EA0[0];
  if (!qword_269831EA0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269831EA0);
  }
  return result;
}

unint64_t sub_24CD66DE4()
{
  unint64_t result = qword_2698320B0[0];
  if (!qword_2698320B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698320B0);
  }
  return result;
}

unint64_t sub_24CD66E3C()
{
  unint64_t result = qword_2698322C0[0];
  if (!qword_2698322C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698322C0);
  }
  return result;
}

unint64_t sub_24CD66E94()
{
  unint64_t result = qword_2698324D0[0];
  if (!qword_2698324D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698324D0);
  }
  return result;
}

unint64_t sub_24CD66EEC()
{
  unint64_t result = qword_2698326E0[0];
  if (!qword_2698326E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698326E0);
  }
  return result;
}

unint64_t sub_24CD66F44()
{
  unint64_t result = qword_2698329F0;
  if (!qword_2698329F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698329F0);
  }
  return result;
}

unint64_t sub_24CD66F9C()
{
  unint64_t result = qword_269832C00[0];
  if (!qword_269832C00[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269832C00);
  }
  return result;
}

unint64_t sub_24CD66FF4()
{
  unint64_t result = qword_269832E10[0];
  if (!qword_269832E10[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269832E10);
  }
  return result;
}

unint64_t sub_24CD6704C()
{
  unint64_t result = qword_269833020[0];
  if (!qword_269833020[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833020);
  }
  return result;
}

unint64_t sub_24CD670A4()
{
  unint64_t result = qword_269833230[0];
  if (!qword_269833230[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833230);
  }
  return result;
}

unint64_t sub_24CD670FC()
{
  unint64_t result = qword_269833540[0];
  if (!qword_269833540[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833540);
  }
  return result;
}

unint64_t sub_24CD67154()
{
  unint64_t result = qword_269833750[0];
  if (!qword_269833750[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833750);
  }
  return result;
}

unint64_t sub_24CD671AC()
{
  unint64_t result = qword_269833960[0];
  if (!qword_269833960[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833960);
  }
  return result;
}

unint64_t sub_24CD67204()
{
  unint64_t result = qword_269833B70[0];
  if (!qword_269833B70[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833B70);
  }
  return result;
}

unint64_t sub_24CD6725C()
{
  unint64_t result = qword_269833D80[0];
  if (!qword_269833D80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833D80);
  }
  return result;
}

unint64_t sub_24CD672B4()
{
  unint64_t result = qword_269833E90;
  if (!qword_269833E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269833E90);
  }
  return result;
}

unint64_t sub_24CD6730C()
{
  unint64_t result = qword_269833E98[0];
  if (!qword_269833E98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833E98);
  }
  return result;
}

unint64_t sub_24CD67364()
{
  unint64_t result = qword_269833F20;
  if (!qword_269833F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269833F20);
  }
  return result;
}

unint64_t sub_24CD673BC()
{
  unint64_t result = qword_269833F28[0];
  if (!qword_269833F28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833F28);
  }
  return result;
}

unint64_t sub_24CD67414()
{
  unint64_t result = qword_269833FB0;
  if (!qword_269833FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269833FB0);
  }
  return result;
}

unint64_t sub_24CD6746C()
{
  unint64_t result = qword_269833FB8[0];
  if (!qword_269833FB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269833FB8);
  }
  return result;
}

unint64_t sub_24CD674C4()
{
  unint64_t result = qword_269834040;
  if (!qword_269834040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834040);
  }
  return result;
}

unint64_t sub_24CD6751C()
{
  unint64_t result = qword_269834048[0];
  if (!qword_269834048[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834048);
  }
  return result;
}

unint64_t sub_24CD67574()
{
  unint64_t result = qword_2698340D0;
  if (!qword_2698340D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698340D0);
  }
  return result;
}

unint64_t sub_24CD675CC()
{
  unint64_t result = qword_2698340D8[0];
  if (!qword_2698340D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698340D8);
  }
  return result;
}

unint64_t sub_24CD67624()
{
  unint64_t result = qword_269834160;
  if (!qword_269834160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834160);
  }
  return result;
}

unint64_t sub_24CD6767C()
{
  unint64_t result = qword_269834168[0];
  if (!qword_269834168[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834168);
  }
  return result;
}

unint64_t sub_24CD676D4()
{
  unint64_t result = qword_2698341F0;
  if (!qword_2698341F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698341F0);
  }
  return result;
}

unint64_t sub_24CD6772C()
{
  unint64_t result = qword_2698341F8[0];
  if (!qword_2698341F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698341F8);
  }
  return result;
}

unint64_t sub_24CD67784()
{
  unint64_t result = qword_269834280;
  if (!qword_269834280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834280);
  }
  return result;
}

unint64_t sub_24CD677DC()
{
  unint64_t result = qword_269834288[0];
  if (!qword_269834288[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834288);
  }
  return result;
}

unint64_t sub_24CD67834()
{
  unint64_t result = qword_269834310;
  if (!qword_269834310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834310);
  }
  return result;
}

unint64_t sub_24CD6788C()
{
  unint64_t result = qword_269834318[0];
  if (!qword_269834318[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834318);
  }
  return result;
}

unint64_t sub_24CD678E4()
{
  unint64_t result = qword_2698343A0;
  if (!qword_2698343A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698343A0);
  }
  return result;
}

unint64_t sub_24CD6793C()
{
  unint64_t result = qword_2698343A8[0];
  if (!qword_2698343A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698343A8);
  }
  return result;
}

unint64_t sub_24CD67994()
{
  unint64_t result = qword_269834430;
  if (!qword_269834430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834430);
  }
  return result;
}

unint64_t sub_24CD679EC()
{
  unint64_t result = qword_269834438[0];
  if (!qword_269834438[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834438);
  }
  return result;
}

unint64_t sub_24CD67A44()
{
  unint64_t result = qword_2698344C0;
  if (!qword_2698344C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698344C0);
  }
  return result;
}

unint64_t sub_24CD67A9C()
{
  unint64_t result = qword_2698344C8[0];
  if (!qword_2698344C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698344C8);
  }
  return result;
}

unint64_t sub_24CD67AF4()
{
  unint64_t result = qword_269834550;
  if (!qword_269834550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834550);
  }
  return result;
}

unint64_t sub_24CD67B4C()
{
  unint64_t result = qword_269834558[0];
  if (!qword_269834558[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834558);
  }
  return result;
}

unint64_t sub_24CD67BA4()
{
  unint64_t result = qword_2698345E0;
  if (!qword_2698345E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698345E0);
  }
  return result;
}

unint64_t sub_24CD67BFC()
{
  unint64_t result = qword_2698345E8[0];
  if (!qword_2698345E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698345E8);
  }
  return result;
}

unint64_t sub_24CD67C54()
{
  unint64_t result = qword_269834670;
  if (!qword_269834670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834670);
  }
  return result;
}

unint64_t sub_24CD67CAC()
{
  unint64_t result = qword_269834678;
  if (!qword_269834678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834678);
  }
  return result;
}

unint64_t sub_24CD67D04()
{
  unint64_t result = qword_269834700;
  if (!qword_269834700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834700);
  }
  return result;
}

unint64_t sub_24CD67D5C()
{
  unint64_t result = qword_269834708[0];
  if (!qword_269834708[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834708);
  }
  return result;
}

unint64_t sub_24CD67DB4()
{
  unint64_t result = qword_269834790;
  if (!qword_269834790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834790);
  }
  return result;
}

unint64_t sub_24CD67E0C()
{
  unint64_t result = qword_269834798[0];
  if (!qword_269834798[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834798);
  }
  return result;
}

unint64_t sub_24CD67E64()
{
  unint64_t result = qword_269834820;
  if (!qword_269834820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834820);
  }
  return result;
}

unint64_t sub_24CD67EBC()
{
  unint64_t result = qword_269834828[0];
  if (!qword_269834828[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834828);
  }
  return result;
}

unint64_t sub_24CD67F14()
{
  unint64_t result = qword_2698348B0;
  if (!qword_2698348B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698348B0);
  }
  return result;
}

unint64_t sub_24CD67F6C()
{
  unint64_t result = qword_2698348B8[0];
  if (!qword_2698348B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698348B8);
  }
  return result;
}

unint64_t sub_24CD67FC4()
{
  unint64_t result = qword_269834940;
  if (!qword_269834940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834940);
  }
  return result;
}

unint64_t sub_24CD6801C()
{
  unint64_t result = qword_269834948[0];
  if (!qword_269834948[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834948);
  }
  return result;
}

unint64_t sub_24CD68074()
{
  unint64_t result = qword_2698349D0;
  if (!qword_2698349D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698349D0);
  }
  return result;
}

unint64_t sub_24CD680CC()
{
  unint64_t result = qword_2698349D8[0];
  if (!qword_2698349D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698349D8);
  }
  return result;
}

unint64_t sub_24CD68124()
{
  unint64_t result = qword_269834A60;
  if (!qword_269834A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834A60);
  }
  return result;
}

unint64_t sub_24CD6817C()
{
  unint64_t result = qword_269834A68[0];
  if (!qword_269834A68[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834A68);
  }
  return result;
}

unint64_t sub_24CD681D4()
{
  unint64_t result = qword_269834AF0;
  if (!qword_269834AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834AF0);
  }
  return result;
}

unint64_t sub_24CD6822C()
{
  unint64_t result = qword_269834AF8[0];
  if (!qword_269834AF8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834AF8);
  }
  return result;
}

unint64_t sub_24CD68284()
{
  unint64_t result = qword_269834B80;
  if (!qword_269834B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834B80);
  }
  return result;
}

unint64_t sub_24CD682DC()
{
  unint64_t result = qword_269834B88[0];
  if (!qword_269834B88[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834B88);
  }
  return result;
}

unint64_t sub_24CD68334()
{
  unint64_t result = qword_269834C10;
  if (!qword_269834C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834C10);
  }
  return result;
}

unint64_t sub_24CD6838C()
{
  unint64_t result = qword_269834C18[0];
  if (!qword_269834C18[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834C18);
  }
  return result;
}

unint64_t sub_24CD683E4()
{
  unint64_t result = qword_269834CA0;
  if (!qword_269834CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834CA0);
  }
  return result;
}

unint64_t sub_24CD6843C()
{
  unint64_t result = qword_269834CA8[0];
  if (!qword_269834CA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834CA8);
  }
  return result;
}

unint64_t sub_24CD68494()
{
  unint64_t result = qword_269834D30;
  if (!qword_269834D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834D30);
  }
  return result;
}

unint64_t sub_24CD684EC()
{
  unint64_t result = qword_269834D38[0];
  if (!qword_269834D38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834D38);
  }
  return result;
}

unint64_t sub_24CD68544()
{
  unint64_t result = qword_269834DC0;
  if (!qword_269834DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834DC0);
  }
  return result;
}

unint64_t sub_24CD6859C()
{
  unint64_t result = qword_269834DC8[0];
  if (!qword_269834DC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834DC8);
  }
  return result;
}

unint64_t sub_24CD685F4()
{
  unint64_t result = qword_269834E50;
  if (!qword_269834E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834E50);
  }
  return result;
}

unint64_t sub_24CD6864C()
{
  unint64_t result = qword_269834E58[0];
  if (!qword_269834E58[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834E58);
  }
  return result;
}

unint64_t sub_24CD686A4()
{
  unint64_t result = qword_269834EE0;
  if (!qword_269834EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269834EE0);
  }
  return result;
}

unint64_t sub_24CD686FC()
{
  unint64_t result = qword_269834EE8[0];
  if (!qword_269834EE8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269834EE8);
  }
  return result;
}

uint64_t sub_24CD68750(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024CD76E00)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CD68838(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x72656D6954646461 && a2 == 0xE800000000000000;
  if (v2 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6954657461647075 && a2 == 0xEB0000000072656DLL || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x695465766F6D6572 && a2 == 0xEB0000000072656DLL || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6954657A6F6F6E73 && a2 == 0xEB0000000072656DLL || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x547373696D736964 && a2 == 0xEC00000072656D69 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6174536863746566 && a2 == 0xEB00000000737574 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6D69546863746566 && a2 == 0xEB00000000737265 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1869112165 && a2 == 0xE400000000000000 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x53726F74696E6F6DLL && a2 == 0xEC00000074726174 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x53726F74696E6F6DLL && a2 == 0xEB00000000706F74 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024CD76D20 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x45726F74696E6F6DLL && a2 == 0xEC000000746E6576 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x74736F6E67616964 && a2 == 0xEB00000000736369)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else
  {
    char v6 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 12;
    }
    else {
      return 13;
    }
  }
}

uint64_t sub_24CD68E20(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E696F70646E65 && a2 == 0xE800000000000000;
  if (v2 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4449746567726174 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24CD68F20(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x666E6F43636E7973 && a2 == 0xED00006572756769;
  if (v2 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7267694D636E7973 && a2 == 0xEB00000000657461 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 2003789939 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24CD690A4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4449746E65696C63 && a2 == 0xE800000000000000;
  if (v2 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x707954746E657665 && a2 == 0xE900000000000065 || (sub_24CD75AA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7372656D6974 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24CD75AA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24CD69234()
{
  uint64_t v0 = sub_24CD754B8();
  __swift_allocate_value_buffer(v0, qword_269834F78);
  __swift_project_value_buffer(v0, (uint64_t)qword_269834F78);
  sub_24CD5BE68();
  swift_bridgeObjectRetain();
  return sub_24CD754A8();
}

uint64_t DTXPCClient.unownedExecutor.getter()
{
  uint64_t v0 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v1 = sub_24CD75798();

  return v1;
}

uint64_t DTXPCClient.__allocating_init(environment:xpcEndpoint:)(uint64_t *a1)
{
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectRelease();
  uint64_t v3 = *a1;
  *(unsigned char *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = MEMORY[0x263F8EE80];
  DTXPCCoder.init()((uint64_t *)(v2 + 40));
  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 56) = 0;
  *(void *)(v2 + 64) = 0;
  return v2;
}

uint64_t DTXPCClient.init(environment:xpcEndpoint:)(uint64_t *a1)
{
  swift_unknownObjectRelease();
  uint64_t v3 = *a1;
  *(unsigned char *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = MEMORY[0x263F8EE80];
  DTXPCCoder.init()((uint64_t *)(v1 + 40));
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  return v1;
}

Swift::Void __swiftcall DTXPCClient.invalidate()()
{
  *(unsigned char *)(v0 + 24) = 1;
  uint64_t v1 = *(_xpc_connection_s **)(v0 + 56);
  if (v1) {
    xpc_connection_cancel(v1);
  }
}

uint64_t default argument 1 of DTXPCClient.monitorStart(client:restart:completionHandler:)()
{
  return 0;
}

uint64_t DTXPCClient.monitorStart(client:restart:completionHandler:)(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D820);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v22 - v12;
  uint64_t v29 = *(void *)(v4 + 16);
  uint64_t v24 = DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v14 = sub_24CD756E8();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v4;
  *(void *)(v16 + 24) = a1;
  *(unsigned char *)(v16 + 32) = a2;
  *(void *)(v16 + 40) = v23;
  *(void *)(v16 + 48) = a4;
  sub_24CD6F7F8((uint64_t)v13, (uint64_t)v11, &qword_26982D820);
  int v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14);
  swift_retain();
  id v18 = a1;
  swift_retain();
  if (v17 == 1)
  {
    sub_24CD53DBC((uint64_t)v11, &qword_26982D820);
  }
  else
  {
    sub_24CD756D8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v14);
  }
  uint64_t v19 = sub_24CD6FD00(&qword_26982D838, 255, (void (*)(uint64_t))sub_24CD69E8C);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = &unk_26982D830;
  *(void *)(v20 + 24) = v16;
  uint64_t v25 = 6;
  uint64_t v26 = 0;
  uint64_t v27 = v24;
  uint64_t v28 = v19;
  swift_task_create();
  return swift_release();
}

uint64_t sub_24CD69698(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a6;
  v6[17] = a2;
  v6[18] = a5;
  uint64_t v9 = sub_24CD754F8();
  v6[20] = v9;
  v6[21] = *(void *)(v9 - 8);
  v6[22] = swift_task_alloc();
  uint64_t v10 = sub_24CD75518();
  v6[23] = v10;
  v6[24] = *(void *)(v10 - 8);
  v6[25] = swift_task_alloc();
  uint64_t v11 = (void *)swift_task_alloc();
  v6[26] = v11;
  *uint64_t v11 = v6;
  v11[1] = sub_24CD69814;
  return DTXPCClient._monitorStart(client:restart:)((uint64_t)(v6 + 14), a3, a4);
}

uint64_t sub_24CD69814()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CD69B50;
  }
  else {
    uint64_t v2 = sub_24CD69928;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD69928()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[22];
  uint64_t v13 = v0[24];
  uint64_t v14 = v0[23];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[21];
  uint64_t v6 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v7 = v0[14];
  uint64_t v12 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v5;
  v8[4] = v7;
  v0[12] = sub_24CD72458;
  v0[13] = v8;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_24CD54B98;
  v0[11] = &block_descriptor_121;
  uint64_t v9 = _Block_copy(v0 + 8);
  swift_retain();
  sub_24CD75508();
  v0[16] = MEMORY[0x263F8EE78];
  sub_24CD6FD00(&qword_26982D428, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D8F0);
  sub_24CD5A894();
  sub_24CD75818();
  MEMORY[0x253313D20](0, v1, v2, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v14);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24CD69B50()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[22];
  uint64_t v14 = v0[24];
  uint64_t v15 = v0[23];
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[21];
  uint64_t v6 = v0[18];
  uint64_t v7 = v0[19];
  uint64_t v13 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = v1;
  v0[6] = sub_24CD72384;
  v0[7] = v8;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24CD54B98;
  v0[5] = &block_descriptor_114;
  uint64_t v9 = _Block_copy(v0 + 2);
  swift_retain();
  id v10 = v1;
  sub_24CD75508();
  v0[15] = MEMORY[0x263F8EE78];
  sub_24CD6FD00(&qword_26982D428, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D8F0);
  sub_24CD5A894();
  sub_24CD75818();
  MEMORY[0x253313D20](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v15);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24CD69D88()
{
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CD69DD0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24CD724C0;
  return sub_24CD69698((uint64_t)v7, v2, v3, v4, v6, v5);
}

unint64_t sub_24CD69E8C()
{
  unint64_t result = qword_26982D840;
  if (!qword_26982D840)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26982D840);
  }
  return result;
}

uint64_t DTXPCClient._monitorStart(client:restart:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 104) = a2;
  *(void *)(v4 + 112) = v3;
  *(unsigned char *)(v4 + 65) = a3;
  *(void *)(v4 + 96) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D860);
  *(void *)(v4 + 120) = swift_task_alloc();
  *(void *)(v4 + 128) = sub_24CD6FD00(&qword_26982D868, v5, (void (*)(uint64_t))type metadata accessor for DTXPCClient);
  uint64_t v7 = sub_24CD75678();
  *(void *)(v4 + 136) = v7;
  *(void *)(v4 + 144) = v6;
  return MEMORY[0x270FA2498](sub_24CD69FDC, v7, v6);
}

uint64_t sub_24CD69FDC()
{
  uint64_t v21 = v0;
  if ((*(unsigned char *)(v0 + 65) & 1) == 0)
  {
    uint64_t v1 = *(void *)(v0 + 120);
    uint64_t v2 = *(char **)(v0 + 104);
    uint64_t v3 = *(void *)&v2[OBJC_IVAR___DTTimerClient__clientID];
    type metadata accessor for DTTimerClient(0);
    uint64_t v4 = v2;
    sub_24CD75488();
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v1, 0, 1, v5);
    swift_beginAccess();
    sub_24CD6A3D0(v1, v3);
    swift_endAccess();
  }
  uint64_t v6 = *(void *)(v0 + 128);
  uint64_t v8 = *(void *)(v0 + 104);
  uint64_t v7 = *(void *)(v0 + 112);
  DTMonitorContext.init(clientID:)(*(void *)(v8 + OBJC_IVAR___DTTimerClient__clientID), &v17);
  v17.n128_u64[1] = 0;
  uint64_t v18 = 0;
  char v19 = 6;
  uint64_t v9 = v8 + OBJC_IVAR___DTTimerClient__requestContext;
  uint64_t v10 = *(void *)(v8 + OBJC_IVAR___DTTimerClient__requestContext);
  uint64_t v11 = *(void *)(v8 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  uint64_t v12 = *(void *)(v9 + 16);
  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v17, (uint64_t)v20, v0 + 16);
  uint64_t v13 = swift_task_alloc();
  *(void *)(v0 + 152) = v13;
  *(void *)(v13 + 16) = v7;
  *(void *)(v13 + 24) = v0 + 16;
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_24CD6A200;
  uint64_t v15 = *(void *)(v0 + 96);
  return MEMORY[0x270FA2360](v15, v7, v6, 0x71657228646E6573, 0xEE00293A74736575, sub_24CD6F474, v13, &type metadata for DTMonitorStartResponse);
}

uint64_t sub_24CD6A200()
{
  uint64_t v2 = (void *)*v1;
  v2[21] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[17];
    uint64_t v4 = v2[18];
    return MEMORY[0x270FA2498](sub_24CD6A354, v3, v4);
  }
  else
  {
    sub_24CD6F47C((uint64_t)(v2 + 2));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_24CD6A354()
{
  sub_24CD6F47C(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CD6A3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D860);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_24CD53DBC(a1, &qword_26982D860);
    unint64_t v13 = sub_24CD70E7C(a2);
    if (v14)
    {
      unint64_t v15 = v13;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v3;
      uint64_t v21 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24CD71704();
        uint64_t v17 = v21;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(void *)(v17 + 56) + *(void *)(v10 + 72) * v15, v9);
      sub_24CD7126C(v15, v17);
      *uint64_t v3 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_24CD53DBC((uint64_t)v8, &qword_26982D860);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24CD7144C((uint64_t)v12, a2, v18);
    *uint64_t v3 = v21;
    return swift_bridgeObjectRelease();
  }
}

uint64_t DTXPCClient.send<A>(request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 88) = a4;
  *(void *)(v5 + 96) = v4;
  *(void *)(v5 + 72) = a1;
  *(void *)(v5 + 80) = a3;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v5 + 48) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(v5 + 64) = *(unsigned char *)(a2 + 48);
  *(void *)(v5 + 104) = sub_24CD6FD00(&qword_26982D868, a2, (void (*)(uint64_t))type metadata accessor for DTXPCClient);
  uint64_t v8 = sub_24CD75678();
  *(void *)(v5 + 112) = v8;
  *(void *)(v5 + 120) = v7;
  return MEMORY[0x270FA2498](sub_24CD6A724, v8, v7);
}

uint64_t sub_24CD6A724()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 128) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 80);
  *(void *)(v3 + 32) = v1;
  *(void *)(v3 + 40) = v0 + 16;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CD6A828;
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 80);
  return MEMORY[0x270FA2360](v5, v1, v2, 0x71657228646E6573, 0xEE00293A74736575, sub_24CD6F4E0, v3, v6);
}

uint64_t sub_24CD6A828()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[14];
    uint64_t v4 = v2[15];
    return MEMORY[0x270FA2498](sub_24CD6A960, v3, v4);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_24CD6A960()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DTXPCClient.monitorStop(client:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D820);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v25 = *(void *)(a1 + OBJC_IVAR___DTTimerClient__clientID);
  uint64_t v11 = a1 + OBJC_IVAR___DTTimerClient__requestContext;
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR___DTTimerClient__requestContext);
  uint64_t v12 = *(void *)(a1 + OBJC_IVAR___DTTimerClient__requestContext + 8);
  uint64_t v14 = *(void *)(v11 + 16);
  uint64_t v33 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v28 = DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v15 = sub_24CD756E8();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v10, 1, 1, v15);
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = v25;
  v17[2] = v3;
  v17[3] = v18;
  v17[4] = v13;
  v17[5] = v12;
  uint64_t v19 = v26;
  uint64_t v20 = v27;
  v17[6] = v14;
  v17[7] = v19;
  unsigned char v17[8] = v20;
  sub_24CD6F7F8((uint64_t)v10, (uint64_t)v8, &qword_26982D820);
  LODWORD(v12) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v8, 1, v15);
  swift_retain();
  swift_retain();
  if (v12 == 1)
  {
    sub_24CD53DBC((uint64_t)v8, &qword_26982D820);
  }
  else
  {
    sub_24CD756D8();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v15);
  }
  uint64_t v21 = sub_24CD6FD00(&qword_26982D838, 255, (void (*)(uint64_t))sub_24CD69E8C);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = &unk_26982D888;
  *(void *)(v22 + 24) = v17;
  uint64_t v29 = 6;
  uint64_t v30 = 0;
  uint64_t v31 = v28;
  uint64_t v32 = v21;
  swift_task_create();
  return swift_release();
}

uint64_t sub_24CD6AC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[20] = a7;
  v8[21] = a8;
  v8[19] = a2;
  uint64_t v13 = sub_24CD754F8();
  v8[22] = v13;
  v8[23] = *(void *)(v13 - 8);
  v8[24] = swift_task_alloc();
  uint64_t v14 = sub_24CD75518();
  v8[25] = v14;
  v8[26] = *(void *)(v14 - 8);
  v8[27] = swift_task_alloc();
  v8[14] = a4;
  v8[15] = a5;
  v8[16] = a6;
  uint64_t v15 = (void *)swift_task_alloc();
  v8[28] = v15;
  *uint64_t v15 = v8;
  v15[1] = sub_24CD6AE18;
  return DTXPCClient._monitorStop(clientID:context:)(a3, (uint64_t)(v8 + 14));
}

uint64_t sub_24CD6AE18()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CD6B148;
  }
  else {
    uint64_t v2 = sub_24CD6AF2C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD6AF2C()
{
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[22];
  uint64_t v5 = v0[23];
  uint64_t v7 = v0[20];
  uint64_t v6 = v0[21];
  uint64_t v13 = v0[25];
  uint64_t v12 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  v0[12] = sub_24CD71B8C;
  v0[13] = v8;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_24CD54B98;
  v0[11] = &block_descriptor_95;
  uint64_t v9 = _Block_copy(v0 + 8);
  swift_retain();
  sub_24CD75508();
  v0[18] = MEMORY[0x263F8EE78];
  sub_24CD6FD00(&qword_26982D428, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D8F0);
  sub_24CD5A894();
  sub_24CD75818();
  MEMORY[0x253313D20](0, v1, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v13);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24CD6B148()
{
  uint64_t v1 = (void *)v0[29];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[24];
  uint64_t v14 = v0[26];
  uint64_t v15 = v0[25];
  uint64_t v4 = v0[22];
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[21];
  uint64_t v13 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = v1;
  v0[6] = sub_24CD6FCFC;
  v0[7] = v8;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24CD54B98;
  v0[5] = &block_descriptor_88;
  uint64_t v9 = _Block_copy(v0 + 2);
  swift_retain();
  id v10 = v1;
  sub_24CD75508();
  v0[17] = MEMORY[0x263F8EE78];
  sub_24CD6FD00(&qword_26982D428, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D8F0);
  sub_24CD5A894();
  sub_24CD75818();
  MEMORY[0x253313D20](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v15);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t DTXPCClient._monitorStop(clientID:context:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D860);
  *(void *)(v3 + 112) = swift_task_alloc();
  *(_OWORD *)(v3 + 120) = *(_OWORD *)a2;
  *(void *)(v3 + 136) = *(void *)(a2 + 16);
  *(void *)(v3 + 144) = sub_24CD6FD00(&qword_26982D868, v5, (void (*)(uint64_t))type metadata accessor for DTXPCClient);
  uint64_t v7 = sub_24CD75678();
  *(void *)(v3 + 152) = v7;
  *(void *)(v3 + 160) = v6;
  return MEMORY[0x270FA2498](sub_24CD6B4A4, v7, v6);
}

uint64_t sub_24CD6B4A4()
{
  uint64_t v16 = v0;
  uint64_t v1 = v0[17];
  uint64_t v11 = v0[18];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v5 = v0[13];
  uint64_t v4 = v0[14];
  uint64_t v6 = v0[12];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  swift_beginAccess();
  sub_24CD6A3D0(v4, v6);
  swift_endAccess();
  DTMonitorContext.init(clientID:)(v6, &v12);
  v12.n128_u64[1] = 0;
  uint64_t v13 = 0;
  char v14 = 7;
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  DTXPCRequest.init(request:context:)(&v12, (uint64_t)v15, (uint64_t)(v0 + 2));
  uint64_t v8 = swift_task_alloc();
  v0[21] = v8;
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v0 + 2;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[22] = v9;
  void *v9 = v0;
  v9[1] = sub_24CD6B680;
  return MEMORY[0x270FA2360](v9, v5, v11, 0x71657228646E6573, 0xEE00293A74736575, sub_24CD6F7F0, v8, &type metadata for DTAckResponse);
}

uint64_t sub_24CD6B680()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_24CD6B80C;
  }
  else
  {
    sub_24CD6F47C(v2 + 16);
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_24CD6B7A8;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_24CD6B7A8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CD6B80C()
{
  sub_24CD6F47C(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DTXPCClient._monitorEvent(_:)(uint64_t *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D8A0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  id v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  __n128 v12 = (char *)&v36 - v11;
  uint64_t v48 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v40 = a1[2];
  uint64_t v41 = v13;
  swift_beginAccess();
  uint64_t v14 = *(void *)(v1 + 32);
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v39 = v14 + 64;
  uint64_t v16 = 1 << *(unsigned char *)(v14 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v15;
  unint64_t v19 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v43 = v4 + 16;
  uint64_t v44 = v4;
  char v46 = (uint64_t (**)(char *, uint64_t))(v4 + 8);
  uint64_t v47 = (void (**)(char *, char *, uint64_t))(v4 + 32);
  unint64_t v36 = v19 - 1;
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v21 = 0;
  int64_t v42 = v19;
  uint64_t v45 = result;
  uint64_t v37 = result + 104;
  unint64_t v38 = v19 - 5;
  uint64_t v22 = v44;
  while (1)
  {
    if (v18)
    {
      unint64_t v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_7;
    }
    int64_t v28 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v28 >= v42)
    {
      unint64_t v30 = v21;
    }
    else
    {
      unint64_t v29 = *(void *)(v39 + 8 * v28);
      if (v29) {
        goto LABEL_11;
      }
      unint64_t v30 = v21 + 1;
      if ((uint64_t)(v21 + 2) < v42)
      {
        unint64_t v29 = *(void *)(v39 + 8 * (v21 + 2));
        if (v29)
        {
          int64_t v28 = v21 + 2;
          goto LABEL_11;
        }
        unint64_t v30 = v21 + 2;
        if ((uint64_t)(v21 + 3) < v42)
        {
          unint64_t v29 = *(void *)(v39 + 8 * (v21 + 3));
          if (v29)
          {
            int64_t v28 = v21 + 3;
LABEL_11:
            unint64_t v18 = (v29 - 1) & v29;
            unint64_t v24 = __clz(__rbit64(v29)) + (v28 << 6);
            unint64_t v21 = v28;
LABEL_7:
            uint64_t v25 = *(void *)(v45 + 56);
            *(void *)id v10 = *(void *)(*(void *)(v45 + 48) + 8 * v24);
            uint64_t v26 = v25 + *(void *)(v22 + 72) * v24;
            uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D8A8);
            (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(&v10[*(int *)(v27 + 48)], v26, v3);
            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v10, 0, 1, v27);
            goto LABEL_14;
          }
          int64_t v28 = v21 + 4;
          unint64_t v30 = v21 + 3;
          if ((uint64_t)(v21 + 4) < v42)
          {
            unint64_t v29 = *(void *)(v39 + 8 * v28);
            if (v29) {
              goto LABEL_11;
            }
            while (v38 != v21)
            {
              unint64_t v29 = *(void *)(v37 + 8 * v21++);
              if (v29)
              {
                int64_t v28 = v21 + 4;
                goto LABEL_11;
              }
            }
            unint64_t v30 = v36;
          }
        }
      }
    }
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D8A8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v10, 1, 1, v31);
    unint64_t v18 = 0;
    unint64_t v21 = v30;
LABEL_14:
    sub_24CD6F7F8((uint64_t)v10, (uint64_t)v12, &qword_26982D8A0);
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D8A8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48))(v12, 1, v32) == 1) {
      return swift_release();
    }
    uint64_t v33 = *(void *)v12;
    (*v47)(v6, &v12[*(int *)(v32 + 48)], v3);
    if (v33 == v48)
    {
      uint64_t v34 = sub_24CD75478();
      if (v34)
      {
        uint64_t v35 = (void *)v34;
        v49[0] = v48;
        v49[1] = v41;
        v49[2] = v40;
        DTTimerClient._monitorEvent(_:)((uint64_t)v49);
      }
    }
    uint64_t result = (*v46)(v6, v3);
  }
  __break(1u);
  return result;
}

void sub_24CD6BD10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = v7;
  uint64_t v41 = a3;
  uint64_t v10 = v6[5];
  uint64_t v11 = v6[6];
  if (qword_269834F70 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24CD754B8();
  __swift_project_value_buffer(v12, (uint64_t)qword_269834F78);
  sub_24CD6F85C(a1);
  sub_24CD6F85C(a1);
  uint64_t v13 = sub_24CD75498();
  os_log_type_t v14 = sub_24CD75728();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = v11;
    uint64_t v16 = swift_slowAlloc();
    v40[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    long long v17 = *(_OWORD *)(a1 + 16);
    long long aBlock = *(_OWORD *)a1;
    long long v37 = v17;
    long long v38 = *(_OWORD *)(a1 + 32);
    char v39 = *(unsigned char *)(a1 + 48);
    sub_24CD6F9B0();
    uint64_t v18 = sub_24CD75A68();
    *(void *)&long long aBlock = sub_24CD4AF20(v18, v19, v40);
    sub_24CD757C8();
    swift_bridgeObjectRelease();
    sub_24CD6F47C(a1);
    sub_24CD6F47C(a1);
    _os_log_impl(&dword_24CD46000, v13, v14, "XPC request start: %s", v15, 0xCu);
    swift_arrayDestroy();
    uint64_t v20 = v16;
    uint64_t v11 = v30;
    MEMORY[0x2533146F0](v20, -1, -1);
    unint64_t v21 = v15;
    uint64_t v8 = v7;
    MEMORY[0x2533146F0](v21, -1, -1);
  }
  else
  {
    sub_24CD6F47C(a1);
    sub_24CD6F47C(a1);
  }

  uint64_t v22 = sub_24CD6C460();
  if (!v8)
  {
    unint64_t v23 = v22;
    v40[0] = v10;
    v40[1] = v11;
    long long v24 = *(_OWORD *)(a1 + 16);
    long long aBlock = *(_OWORD *)a1;
    long long v37 = v24;
    long long v38 = *(_OWORD *)(a1 + 32);
    char v39 = *(unsigned char *)(a1 + 48);
    sub_24CD6F8C0();
    xpc_object_t v25 = DTXPCCoder.encode<A>(_:)();
    *(void *)&long long aBlock = v6[2];
    uint64_t v32 = v25;
    uint64_t v31 = DTEnvironmentValues.dispatchQueue.getter();
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v10;
    *(void *)(v26 + 24) = v11;
    long long v27 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v26 + 32) = *(_OWORD *)a1;
    *(_OWORD *)(v26 + 48) = v27;
    *(_OWORD *)(v26 + 64) = *(_OWORD *)(a1 + 32);
    *(unsigned char *)(v26 + 80) = *(unsigned char *)(a1 + 48);
    uint64_t v28 = v41;
    *(void *)(v26 + 88) = a2;
    *(void *)(v26 + 96) = v28;
    *(void *)(v26 + 104) = v6;
    *(void *)&long long v38 = a5;
    *((void *)&v38 + 1) = v26;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v37 = sub_24CD6CDD4;
    *((void *)&v37 + 1) = a6;
    unint64_t v29 = _Block_copy(&aBlock);
    sub_24CD6F85C(a1);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    xpc_connection_send_message_with_reply(v23, v32, v31, v29);
    _Block_release(v29);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

void DTXPCClient.send<A>(request:replyHandler:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = v6;
  uint64_t v41 = a3;
  long long v8 = a1[1];
  long long v37 = *a1;
  long long v38 = v8;
  long long v39 = a1[2];
  char v40 = *((unsigned char *)a1 + 48);
  uint64_t v10 = *(void *)(v5 + 40);
  uint64_t v9 = *(void *)(v5 + 48);
  if (qword_269834F70 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24CD754B8();
  __swift_project_value_buffer(v11, (uint64_t)qword_269834F78);
  sub_24CD6F85C((uint64_t)&v37);
  sub_24CD6F85C((uint64_t)&v37);
  uint64_t v12 = sub_24CD75498();
  os_log_type_t v13 = sub_24CD75728();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v27 = v9;
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v36[0] = v15;
    *(_DWORD *)os_log_type_t v14 = 136315138;
    *((void *)&aBlock + 1) = *((void *)&v37 + 1);
    long long v33 = v38;
    long long v34 = v39;
    char v35 = v40;
    sub_24CD6F9B0();
    uint64_t v16 = sub_24CD75A68();
    *(void *)&long long aBlock = sub_24CD4AF20(v16, v17, v36);
    sub_24CD757C8();
    swift_bridgeObjectRelease();
    sub_24CD6F47C((uint64_t)&v37);
    sub_24CD6F47C((uint64_t)&v37);
    _os_log_impl(&dword_24CD46000, v12, v13, "XPC request start: %s", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v15;
    uint64_t v7 = v6;
    MEMORY[0x2533146F0](v18, -1, -1);
    unint64_t v19 = v14;
    uint64_t v9 = v27;
    MEMORY[0x2533146F0](v19, -1, -1);
  }
  else
  {
    sub_24CD6F47C((uint64_t)&v37);
    sub_24CD6F47C((uint64_t)&v37);
  }

  uint64_t v20 = sub_24CD6C460();
  if (!v7)
  {
    unint64_t v21 = v20;
    v36[0] = v10;
    v36[1] = v9;
    long long aBlock = v37;
    long long v33 = v38;
    long long v34 = v39;
    char v35 = v40;
    sub_24CD6F8C0();
    xpc_object_t v22 = DTXPCCoder.encode<A>(_:)();
    replyq = DTEnvironmentValues.dispatchQueue.getter();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = a4;
    *(void *)(v23 + 24) = a5;
    *(void *)(v23 + 32) = v10;
    *(void *)(v23 + 40) = v9;
    long long v24 = v38;
    *(_OWORD *)(v23 + 48) = v37;
    *(_OWORD *)(v23 + 64) = v24;
    *(_OWORD *)(v23 + 80) = v39;
    *(unsigned char *)(v23 + 96) = v40;
    uint64_t v25 = v41;
    *(void *)(v23 + 104) = a2;
    *(void *)(v23 + 112) = v25;
    *(void *)(v23 + 120) = v5;
    *(void *)&long long v34 = sub_24CD6F984;
    *((void *)&v34 + 1) = v23;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v33 = sub_24CD6CDD4;
    *((void *)&v33 + 1) = &block_descriptor_0;
    uint64_t v26 = _Block_copy(&aBlock);
    sub_24CD6F85C((uint64_t)&v37);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    xpc_connection_send_message_with_reply(v21, v22, replyq, v26);
    _Block_release(v26);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

_xpc_connection_s *sub_24CD6C460()
{
  if (v0[7])
  {
    mach_service = (_xpc_connection_s *)v0[7];
  }
  else
  {
    uint64_t v2 = v0;
    if (v0[8])
    {
      uint64_t v3 = (_xpc_endpoint_s *)swift_unknownObjectRetain();
      mach_service = xpc_connection_create_from_endpoint(v3);
      v10[0] = v0[2];
      swift_unknownObjectRetain();
      uint64_t v4 = DTEnvironmentValues.dispatchQueue.getter();
      xpc_connection_set_target_queue(mach_service, v4);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      sub_24CD5BEC8();
      v10[0] = v0[2];
      swift_bridgeObjectRetain();
      uint64_t v5 = DTEnvironmentValues.dispatchQueue.getter();
      uint64_t v6 = sub_24CD75578();
      swift_bridgeObjectRelease();
      mach_service = xpc_connection_create_mach_service((const char *)(v6 + 32), v5, 0);

      swift_release();
    }
    v2[7] = mach_service;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    uint64_t v7 = swift_allocObject();
    swift_weakInit();
    v10[4] = sub_24CD702F4;
    v10[5] = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    void v10[2] = sub_24CD6CDD4;
    void v10[3] = &block_descriptor_73;
    long long v8 = _Block_copy(v10);
    swift_release();
    xpc_connection_set_event_handler(mach_service, v8);
    _Block_release(v8);
    xpc_connection_activate(mach_service);
  }
  swift_unknownObjectRetain();
  return mach_service;
}

uint64_t sub_24CD6C628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v52 = a6;
  uint64_t v53 = a5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982D908);
  uint64_t v14 = sub_24CD75B28();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  unint64_t v17 = (void **)((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v50 - v18;
  uint64_t v54 = a7;
  uint64_t v55 = a8;
  uint64_t v56 = a2;
  uint64_t v57 = a3;
  uint64_t v58 = a1;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  sub_24CD6CC20((void (*)(unsigned char *))sub_24CD70270, (uint64_t)&v50 - v18);
  (*(void (**)(void **, char *, uint64_t))(v23 + 16))(v17, v19, v21);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    long long v24 = *v17;
    if (qword_269834F70 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_24CD754B8();
    __swift_project_value_buffer(v25, (uint64_t)qword_269834F78);
    sub_24CD6F85C(a4);
    id v26 = v24;
    sub_24CD6F85C(a4);
    id v27 = v24;
    uint64_t v28 = sub_24CD75498();
    os_log_type_t v29 = sub_24CD75738();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v51 = v21;
      uint64_t v32 = v31;
      v63[0] = v31;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v50 = v23;
      long long v33 = *(_OWORD *)(a4 + 16);
      long long v59 = *(_OWORD *)a4;
      long long v60 = v33;
      long long v61 = *(_OWORD *)(a4 + 32);
      char v62 = *(unsigned char *)(a4 + 48);
      sub_24CD6F9B0();
      uint64_t v34 = sub_24CD75A68();
      *(void *)&long long v59 = sub_24CD4AF20(v34, v35, v63);
      sub_24CD757C8();
      swift_bridgeObjectRelease();
      sub_24CD6F47C(a4);
      sub_24CD6F47C(a4);
      *(_WORD *)(v30 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v36 = sub_24CD75AD8();
      *(void *)&long long v59 = sub_24CD4AF20(v36, v37, v63);
      uint64_t v23 = v50;
      sub_24CD757C8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24CD46000, v28, v29, "### Request failed: %s, error=%s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      uint64_t v38 = v32;
      uint64_t v21 = v51;
      MEMORY[0x2533146F0](v38, -1, -1);
      MEMORY[0x2533146F0](v30, -1, -1);
    }
    else
    {

      sub_24CD6F47C(a4);
      sub_24CD6F47C(a4);
    }
  }
  else
  {
    if (qword_269834F70 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_24CD754B8();
    __swift_project_value_buffer(v39, (uint64_t)qword_269834F78);
    sub_24CD6F85C(a4);
    sub_24CD6F85C(a4);
    char v40 = sub_24CD75498();
    os_log_type_t v41 = sub_24CD75728();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v51 = v21;
      uint64_t v43 = (uint8_t *)v42;
      uint64_t v44 = swift_slowAlloc();
      v63[0] = v44;
      uint64_t v50 = v23;
      *(_DWORD *)uint64_t v43 = 136315138;
      long long v45 = *(_OWORD *)(a4 + 16);
      long long v59 = *(_OWORD *)a4;
      long long v60 = v45;
      long long v61 = *(_OWORD *)(a4 + 32);
      char v62 = *(unsigned char *)(a4 + 48);
      sub_24CD6F9B0();
      uint64_t v46 = sub_24CD75A68();
      *(void *)&long long v59 = sub_24CD4AF20(v46, v47, v63);
      uint64_t v23 = v50;
      sub_24CD757C8();
      swift_bridgeObjectRelease();
      sub_24CD6F47C(a4);
      sub_24CD6F47C(a4);
      _os_log_impl(&dword_24CD46000, v40, v41, "XPC request succeeded: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533146F0](v44, -1, -1);
      uint64_t v48 = v43;
      uint64_t v21 = v51;
      MEMORY[0x2533146F0](v48, -1, -1);
    }
    else
    {
      sub_24CD6F47C(a4);
      sub_24CD6F47C(a4);
    }

    (*(void (**)(void **, uint64_t))(v23 + 8))(v17, v21);
  }
  v53(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v19, v21);
}

uint64_t sub_24CD6CC20@<X0>(void (*a1)(unsigned char *)@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_24CD75B28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v11[-v8];
  a1(v5);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v7 + 32))(a2, v9, v6);
}

uint64_t sub_24CD6CDD4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_24CD6CE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D948);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, v8, v5);
  sub_24CD6BD10(a3, (uint64_t)sub_24CD71D94, v10, (uint64_t)&unk_26FF38560, (uint64_t)sub_24CD71EAC, (uint64_t)&block_descriptor_107);
  return swift_release();
}

uint64_t sub_24CD6CFC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D940);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, v8, v5);
  sub_24CD6BD10(a3, (uint64_t)sub_24CD71B24, v10, (uint64_t)&unk_26FF38308, (uint64_t)sub_24CD6FD4C, (uint64_t)&block_descriptor_61);
  return swift_release();
}

uint64_t sub_24CD6D14C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982D908);
  uint64_t v9 = sub_24CD756A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v17[-v11];
  long long v13 = *(_OWORD *)(a3 + 16);
  v18[0] = *(_OWORD *)a3;
  v18[1] = v13;
  v18[2] = *(_OWORD *)(a3 + 32);
  char v19 = *(unsigned char *)(a3 + 48);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(&v17[-v11], a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = a5;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v10 + 32))(v15 + v14, v12, v9);
  DTXPCClient.send<A>(request:replyHandler:)(v18, (uint64_t)sub_24CD71C68, v15, a4, a5);
  return swift_release();
}

uint64_t sub_24CD6D30C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24CD75B28();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_24CD75688();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_24CD75698();
  }
}

uint64_t DTXPCClient.sendNonisolated<A>(request:replyHandler:)(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v26 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D820);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v25 - v15;
  long long v17 = a1[1];
  long long v33 = *a1;
  long long v34 = v17;
  long long v35 = a1[2];
  char v36 = *((unsigned char *)a1 + 48);
  uint64_t v32 = *(void *)(v6 + 16);
  uint64_t v27 = DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v18 = sub_24CD756E8();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v16, 1, 1, v18);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a4;
  *(void *)(v20 + 24) = a5;
  *(void *)(v20 + 32) = v6;
  long long v21 = v34;
  *(_OWORD *)(v20 + 40) = v33;
  *(_OWORD *)(v20 + 56) = v21;
  *(_OWORD *)(v20 + 72) = v35;
  *(unsigned char *)(v20 + 88) = v36;
  *(void *)(v20 + 96) = v26;
  *(void *)(v20 + 104) = a3;
  sub_24CD6F7F8((uint64_t)v16, (uint64_t)v14, &qword_26982D820);
  LODWORD(a4) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v14, 1, v18);
  swift_retain();
  sub_24CD6F85C((uint64_t)&v33);
  swift_retain();
  if (a4 == 1)
  {
    sub_24CD53DBC((uint64_t)v14, &qword_26982D820);
  }
  else
  {
    sub_24CD756D8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v18);
  }
  uint64_t v22 = sub_24CD6FD00(&qword_26982D838, 255, (void (*)(uint64_t))sub_24CD69E8C);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = &unk_26982D8C8;
  *(void *)(v23 + 24) = v20;
  uint64_t v28 = 6;
  uint64_t v29 = 0;
  uint64_t v30 = v27;
  uint64_t v31 = v22;
  swift_task_create();
  return swift_release();
}

uint64_t sub_24CD6D81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 152) = a6;
  *(void *)(v7 + 160) = a7;
  *(void *)(v7 + 136) = a4;
  *(void *)(v7 + 144) = a5;
  *(void *)(v7 + 128) = a2;
  uint64_t v9 = sub_24CD754F8();
  *(void *)(v7 + 168) = v9;
  *(void *)(v7 + 176) = *(void *)(v9 - 8);
  *(void *)(v7 + 184) = swift_task_alloc();
  uint64_t v10 = sub_24CD75518();
  *(void *)(v7 + 192) = v10;
  *(void *)(v7 + 200) = *(void *)(v10 - 8);
  *(void *)(v7 + 208) = swift_task_alloc();
  long long v11 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v7 + 32) = v11;
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(a3 + 32);
  *(unsigned char *)(v7 + 64) = *(unsigned char *)(a3 + 48);
  type metadata accessor for DTXPCClient();
  sub_24CD6FD00(&qword_26982D868, v12, (void (*)(uint64_t))type metadata accessor for DTXPCClient);
  uint64_t v14 = sub_24CD75678();
  return MEMORY[0x270FA2498](sub_24CD6D9B0, v14, v13);
}

uint64_t sub_24CD6D9B0()
{
  DTXPCClient.send<A>(request:replyHandler:)((long long *)(v0 + 16), *(void *)(v0 + 136), *(void *)(v0 + 144), *(void *)(v0 + 152), *(void *)(v0 + 160));
  *(void *)(v0 + 216) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CD6DA80()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = (void *)v0[27];
  uint64_t v3 = v0[23];
  uint64_t v15 = v0[25];
  uint64_t v16 = v0[24];
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[22];
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[18];
  long long v13 = *(_OWORD *)(v0 + 19);
  uint64_t v14 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = v13;
  *(void *)(v8 + 32) = v6;
  *(void *)(v8 + 40) = v7;
  *(void *)(v8 + 48) = v2;
  v0[13] = sub_24CD70260;
  v0[14] = v8;
  v0[9] = MEMORY[0x263EF8330];
  v0[10] = 1107296256;
  v0[11] = sub_24CD54B98;
  v0[12] = &block_descriptor_67;
  uint64_t v9 = _Block_copy(v0 + 9);
  swift_retain();
  id v10 = v2;
  sub_24CD75508();
  v0[15] = MEMORY[0x263F8EE78];
  sub_24CD6FD00(&qword_26982D428, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D8F0);
  sub_24CD5A894();
  sub_24CD75818();
  MEMORY[0x253313D20](0, v1, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v1, v16);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24CD6DCC8(void (*a1)(char *), uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982D908);
  uint64_t v5 = sub_24CD75B28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - v7;
  *(uint64_t *)((char *)&v11 - v7) = (uint64_t)a3;
  swift_storeEnumTagMultiPayload();
  id v9 = a3;
  a1(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DTXPCClient.send(request:completionHandler:)(long long *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D820);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  id v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v22 - v11;
  long long v13 = a1[1];
  long long v23 = *a1;
  long long v24 = v13;
  long long v25 = a1[2];
  char v26 = *((unsigned char *)a1 + 48);
  v22[5] = *(void *)(v3 + 16);
  v22[0] = DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v14 = sub_24CD756E8();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v12, 1, 1, v14);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v3;
  long long v17 = v24;
  *(_OWORD *)(v16 + 24) = v23;
  *(_OWORD *)(v16 + 40) = v17;
  *(_OWORD *)(v16 + 56) = v25;
  *(unsigned char *)(v16 + 72) = v26;
  *(void *)(v16 + 80) = a2;
  *(void *)(v16 + 88) = a3;
  sub_24CD6F7F8((uint64_t)v12, (uint64_t)v10, &qword_26982D820);
  int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14);
  swift_retain();
  sub_24CD6F85C((uint64_t)&v23);
  swift_retain();
  if (v18 == 1)
  {
    sub_24CD53DBC((uint64_t)v10, &qword_26982D820);
  }
  else
  {
    sub_24CD756D8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v14);
  }
  uint64_t v19 = sub_24CD6FD00(&qword_26982D838, 255, (void (*)(uint64_t))sub_24CD69E8C);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = &unk_26982D8E0;
  *(void *)(v20 + 24) = v16;
  v22[1] = 6;
  v22[2] = 0;
  void v22[3] = v22[0];
  v22[4] = v19;
  swift_task_create();
  return swift_release();
}

uint64_t sub_24CD6E0A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  uint64_t v6 = sub_24CD754F8();
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  uint64_t v7 = sub_24CD75518();
  v5[16] = v7;
  v5[17] = *(void *)(v7 - 8);
  v5[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CD6E1C0, 0, 0);
}

uint64_t sub_24CD6E1C0()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = swift_allocObject();
  v0[19] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  type metadata accessor for DTXPCClient();
  sub_24CD6FD00(&qword_26982D868, v4, (void (*)(uint64_t))type metadata accessor for DTXPCClient);
  swift_retain();
  uint64_t v6 = sub_24CD75678();
  return MEMORY[0x270FA2498](sub_24CD6E2A8, v6, v5);
}

uint64_t sub_24CD6E2A8()
{
  sub_24CD6BD10(v0[10], (uint64_t)sub_24CD6FC64, v0[19], (uint64_t)&unk_26FF38308, (uint64_t)sub_24CD6FD4C, (uint64_t)&block_descriptor_61);
  v0[20] = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CD6E3B0()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[15];
  uint64_t v14 = v0[17];
  uint64_t v15 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[12];
  long long v13 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = v1;
  v0[6] = sub_24CD6FCFC;
  v0[7] = v8;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24CD54B98;
  v0[5] = &block_descriptor_55;
  uint64_t v9 = _Block_copy(v0 + 2);
  swift_retain();
  id v10 = v1;
  sub_24CD75508();
  v0[8] = MEMORY[0x263F8EE78];
  sub_24CD6FD00(&qword_26982D428, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D8F0);
  sub_24CD5A894();
  sub_24CD75818();
  MEMORY[0x253313D20](0, v2, v3, v9);
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v15);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t static DTXPCClient.sendSync<A>(request:)(long long *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a3;
  long long v14 = a1[1];
  long long v15 = *a1;
  uint64_t v5 = (uint64_t (*)())*((void *)a1 + 4);
  uint64_t v4 = *((void *)a1 + 5);
  char v6 = *((unsigned char *)a1 + 48);
  sub_24CD5BEC8();
  uint64_t v7 = sub_24CD75578();
  mach_service = xpc_connection_create_mach_service((const char *)(v7 + 32), 0, 0);
  swift_release();
  int v18 = nullsub_1;
  uint64_t v19 = 0;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v17 = sub_24CD6CDD4;
  *((void *)&v17 + 1) = &block_descriptor_44;
  uint64_t v9 = _Block_copy(&aBlock);
  xpc_connection_set_event_handler(mach_service, v9);
  _Block_release(v9);
  xpc_connection_activate(mach_service);
  DTXPCCoder.init()((uint64_t *)&aBlock);
  long long v10 = aBlock;
  long long v21 = aBlock;
  long long aBlock = v15;
  long long v17 = v14;
  int v18 = v5;
  uint64_t v19 = v4;
  char v20 = v6;
  sub_24CD6F8C0();
  xpc_object_t v11 = DTXPCCoder.encode<A>(_:)();
  if (v3)
  {
    swift_release();
    swift_release();
  }
  else
  {
    xpc_object_t v12 = xpc_connection_send_message_with_reply_sync(mach_service, v11);
    swift_unknownObjectRelease();
    long long aBlock = v10;
    DTXPCCoder.decode<A>(_:)(v12);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

uint64_t sub_24CD6E7CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D918);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    v8[2] = a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D920);
    uint64_t v7 = sub_24CD753C8();
    MEMORY[0x270FA5388](v7);
    v8[-2] = v5;
    sub_24CD6E950((uint64_t)sub_24CD702FC, (uint64_t)&v8[-4]);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_24CD6E950(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  v12[0] = *(void *)(v2 + 16);
  uint64_t v7 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  sub_24CD75798();

  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_24CD70E54;
  *(void *)(v9 + 24) = v8;
  swift_retain();
  v12[0] = v4;
  sub_24CD71A84(v12);
  if (v3)
  {
    swift_release();
    return swift_release();
  }
  swift_release();
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_24CD75868();
    sub_24CD755C8();
    uint64_t v12[3] = v4;
    sub_24CD758C8();
    sub_24CD755C8();
    uint64_t result = sub_24CD758E8();
    __break(1u);
  }
  return result;
}

uint64_t sub_24CD6EB74()
{
  unint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
  uint64_t v44 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D8A0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  long long v10 = (uint64_t *)((char *)&v37 - v9);
  if (qword_269834F70 != -1) {
LABEL_34:
  }
    swift_once();
  uint64_t v11 = sub_24CD754B8();
  __swift_project_value_buffer(v11, (uint64_t)qword_269834F78);
  xpc_object_t v12 = sub_24CD75498();
  os_log_type_t v13 = sub_24CD75738();
  if (os_log_type_enabled(v12, v13))
  {
    long long v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v14 = 0;
    _os_log_impl(&dword_24CD46000, v12, v13, "### Interrupted", v14, 2u);
    MEMORY[0x2533146F0](v14, -1, -1);
  }

  swift_beginAccess();
  uint64_t v15 = *(void *)(v1 + 32);
  uint64_t v16 = *(void *)(v15 + 64);
  uint64_t v40 = v15 + 64;
  uint64_t v17 = 1 << *(unsigned char *)(v15 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v1 = v18 & v16;
  unint64_t v19 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v42 = v44 + 16;
  long long v45 = (void (**)(char *, uint64_t))(v44 + 8);
  uint64_t v46 = (void (**)(char *, char *, uint64_t))(v44 + 32);
  unint64_t v37 = v19 - 1;
  uint64_t v20 = swift_bridgeObjectRetain();
  unint64_t v21 = 0;
  int64_t v41 = v19;
  uint64_t v43 = v20;
  uint64_t v38 = v20 + 104;
  unint64_t v39 = v19 - 5;
  uint64_t v22 = v44;
  while (1)
  {
    if (v1)
    {
      unint64_t v23 = __clz(__rbit64(v1));
      v1 &= v1 - 1;
      unint64_t v24 = v23 | (v21 << 6);
LABEL_10:
      uint64_t v25 = *(void *)(v43 + 56);
      *(void *)uint64_t v8 = *(void *)(*(void *)(v43 + 48) + 8 * v24);
      uint64_t v26 = v25 + *(void *)(v22 + 72) * v24;
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D8A8);
      (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(&v8[*(int *)(v27 + 48)], v26, v2);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 0, 1, v27);
      goto LABEL_17;
    }
    int64_t v28 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v28 >= v41)
    {
      unint64_t v30 = v21;
    }
    else
    {
      unint64_t v29 = *(void *)(v40 + 8 * v28);
      if (v29) {
        goto LABEL_14;
      }
      unint64_t v30 = v21 + 1;
      if ((uint64_t)(v21 + 2) < v41)
      {
        unint64_t v29 = *(void *)(v40 + 8 * (v21 + 2));
        if (v29)
        {
          int64_t v28 = v21 + 2;
LABEL_14:
          unint64_t v1 = (v29 - 1) & v29;
          unint64_t v24 = __clz(__rbit64(v29)) + (v28 << 6);
          unint64_t v21 = v28;
          goto LABEL_10;
        }
        unint64_t v30 = v21 + 2;
        if ((uint64_t)(v21 + 3) < v41)
        {
          unint64_t v29 = *(void *)(v40 + 8 * (v21 + 3));
          if (v29)
          {
            int64_t v28 = v21 + 3;
            goto LABEL_14;
          }
          int64_t v28 = v21 + 4;
          unint64_t v30 = v21 + 3;
          if ((uint64_t)(v21 + 4) < v41)
          {
            unint64_t v29 = *(void *)(v40 + 8 * v28);
            if (v29) {
              goto LABEL_14;
            }
            while (v39 != v21)
            {
              unint64_t v29 = *(void *)(v38 + 8 * v21++);
              if (v29)
              {
                int64_t v28 = v21 + 4;
                goto LABEL_14;
              }
            }
            unint64_t v30 = v37;
          }
        }
      }
    }
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D8A8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v8, 1, 1, v31);
    unint64_t v1 = 0;
    unint64_t v21 = v30;
LABEL_17:
    sub_24CD6F7F8((uint64_t)v8, (uint64_t)v10, &qword_26982D8A0);
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D8A8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48))(v10, 1, v32) == 1) {
      return swift_release();
    }
    uint64_t v33 = *v10;
    (*v46)(v4, (char *)v10 + *(int *)(v32 + 48), v2);
    uint64_t v34 = sub_24CD75478();
    if (v34)
    {
      long long v35 = (void *)v34;
      DTMonitorEvent.init(clientID:eventType:timers:)(v33, 3, 0, &v49);
      long long v47 = v49;
      uint64_t v48 = v50;
      DTTimerClient._monitorEvent(_:)((uint64_t)&v47);
      swift_bridgeObjectRelease();
      DTTimerClient._monitorStart(restart:)(1);
    }
    (*v45)(v4, v2);
  }
}

uint64_t DTXPCClient.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t DTXPCClient.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t sub_24CD6F16C()
{
  uint64_t v0 = (void *)DTEnvironmentValues.dispatchQueue.getter();
  uint64_t v1 = sub_24CD75798();

  return v1;
}

uint64_t sub_24CD6F1C4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CD6F2A0;
  return v6(a1);
}

uint64_t sub_24CD6F2A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CD6F398(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CD724C0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26982D848 + dword_26982D848);
  return v6(a1, v4);
}

uint64_t type metadata accessor for DTXPCClient()
{
  return self;
}

uint64_t sub_24CD6F474(uint64_t a1)
{
  return sub_24CD6CE34(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24CD6F47C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_24CD6F4E0(uint64_t a1)
{
  return sub_24CD6D14C(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_24CD6F4EC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24CD6F53C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  void *v9 = v1;
  v9[1] = sub_24CD6F60C;
  return sub_24CD6AC94((uint64_t)v9, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24CD6F60C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CD6F700()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CD6F738(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CD6F60C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26982D848 + dword_26982D848);
  return v6(a1, v4);
}

uint64_t sub_24CD6F7F0(uint64_t a1)
{
  return sub_24CD6CFC0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24CD6F7F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24CD6F85C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24CD48DA4(v2, v3, v4, v5);
  return a1;
}

unint64_t sub_24CD6F8C0()
{
  unint64_t result = qword_26982D8B0;
  if (!qword_26982D8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982D8B0);
  }
  return result;
}

uint64_t sub_24CD6F914()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(*(void **)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(unsigned char *)(v0 + 96));
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_24CD6F984(uint64_t a1)
{
  return sub_24CD6C628(a1, *(void *)(v1 + 32), *(void *)(v1 + 40), v1 + 48, *(void (**)(char *))(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 16), *(void *)(v1 + 24));
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

unint64_t sub_24CD6F9B0()
{
  unint64_t result = qword_26982D8B8;
  if (!qword_26982D8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26982D8B8);
  }
  return result;
}

uint64_t sub_24CD6FA04()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(*(void **)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(unsigned char *)(v0 + 88));
  swift_release();

  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_24CD6FA64()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (uint64_t)(v0 + 5);
  uint64_t v7 = v0[12];
  uint64_t v6 = v0[13];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  void *v8 = v1;
  v8[1] = sub_24CD724C0;
  return sub_24CD6D81C((uint64_t)v8, v4, v5, v7, v6, v2, v3);
}

uint64_t sub_24CD6FB28()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(*(void **)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_24CD6FB88()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (uint64_t)(v0 + 3);
  uint64_t v5 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_24CD724C0;
  return sub_24CD6E0A0((uint64_t)v6, v2, v3, v5, v4);
}

uint64_t method lookup function for DTXPCClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DTXPCClient);
}

uint64_t dispatch thunk of DTXPCClient.__allocating_init(environment:xpcEndpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

void sub_24CD6FC64(uint64_t a1)
{
  uint64_t v2 = *(void (**)(id))(v1 + 16);
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    id v3 = *(id *)a1;
    id v4 = *(id *)a1;
    v2(v3);
    sub_24CD70214(v3, 1);
  }
  else
  {
    v2(0);
  }
}

uint64_t sub_24CD6FCE4()
{
  return objectdestroy_51Tm(MEMORY[0x263F8EEB0]);
}

uint64_t sub_24CD6FD00(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_24CD6FD4C(void *a1)
{
  uint64_t v3 = v1 + 32;
  id v4 = *(void (**)(id *))(v1 + 88);
  sub_24CD6545C();
  DTXPCCoder.decode<A>(_:)(a1);
  char v14 = 0;
  if (qword_269834F70 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24CD754B8();
  __swift_project_value_buffer(v5, (uint64_t)qword_269834F78);
  sub_24CD6F85C(v3);
  sub_24CD6F85C(v3);
  uint64_t v6 = sub_24CD75498();
  os_log_type_t v7 = sub_24CD75728();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v12 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_24CD6F9B0();
    uint64_t v10 = sub_24CD75A68();
    sub_24CD4AF20(v10, v11, &v12);
    sub_24CD757C8();
    swift_bridgeObjectRelease();
    sub_24CD6F47C(v3);
    sub_24CD6F47C(v3);
    _os_log_impl(&dword_24CD46000, v6, v7, "XPC request succeeded: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v9, -1, -1);
    MEMORY[0x2533146F0](v8, -1, -1);
  }
  else
  {
    sub_24CD6F47C(v3);
    sub_24CD6F47C(v3);
  }

  v4(&v13);
  sub_24CD70214(v13, v14);
}

id sub_24CD70208(id result, char a2)
{
  if (a2) {
    return result;
  }
  return result;
}

void sub_24CD70214(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_24CD70220()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24CD70260()
{
  return sub_24CD6DCC8(*(void (**)(char *))(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_24CD70270(void *a1)
{
  uint64_t result = DTXPCCoder.decode<A>(_:)(*(void **)(v1 + 48));
  if (v2) {
    *a1 = v2;
  }
  return result;
}

uint64_t sub_24CD702BC()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CD702F4(uint64_t a1)
{
  return sub_24CD6E7CC(a1);
}

void sub_24CD702FC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D918);
  sub_24CD753B8();
  uint64_t v2 = (void *)v39;
  uint64_t v3 = MEMORY[0x2533148F0](v39);
  if (v3 == sub_24CD754C8())
  {
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    *(void *)&long long v36 = v14;
    *((void *)&v36 + 1) = v13;
    sub_24CD4914C();
    swift_retain();
    swift_retain();
    DTXPCCoder.decode<A>(_:)((void *)v39);
    swift_release();
    swift_release();
    uint64_t v19 = v40;
    char v20 = BYTE8(v40);
    long long v33 = v39;
    if (BYTE8(v40) == 8)
    {
      long long v36 = v39;
      uint64_t v37 = v40;
      long long v32 = v39;
      swift_bridgeObjectRetain();
      DTXPCClient._monitorEvent(_:)((uint64_t *)&v36);
      sub_24CD48E64((void *)v32, *((uint64_t *)&v32 + 1), v19, 8);
      long long v39 = 0u;
      long long v40 = 0u;
      unint64_t v41 = 0;
    }
    else
    {
      *((void *)&v40 + 1) = &type metadata for DTAckResponse;
      unint64_t v41 = sub_24CD654B0();
      DTAckResponse.init()();
    }
    sub_24CD71AB0((uint64_t)&v39, (uint64_t)&v34);
    if (v35)
    {
      sub_24CD4BAE0(&v34, (uint64_t)&v36);
      unint64_t v21 = *(_xpc_connection_s **)(a1 + 56);
      if (v21)
      {
        swift_unknownObjectRetain();
        xpc_object_t reply = xpc_dictionary_create_reply(v2);
        if (!reply)
        {
          uint64_t v25 = v19;
          if (qword_269834F70 != -1) {
            swift_once();
          }
          uint64_t v26 = sub_24CD754B8();
          __swift_project_value_buffer(v26, (uint64_t)qword_269834F78);
          uint64_t v27 = sub_24CD75498();
          os_log_type_t v28 = sub_24CD75738();
          if (os_log_type_enabled(v27, v28))
          {
            char v29 = v20;
            unint64_t v30 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v30 = 0;
            _os_log_impl(&dword_24CD46000, v27, v28, "### XPC create reply failed", v30, 2u);
            uint64_t v31 = v30;
            char v20 = v29;
            MEMORY[0x2533146F0](v31, -1, -1);
          }

          sub_24CD53DBC((uint64_t)&v39, (uint64_t *)&unk_26982D930);
          swift_unknownObjectRelease();
          sub_24CD48E64((void *)v33, *((uint64_t *)&v33 + 1), v25, v20);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
          goto LABEL_33;
        }
        unint64_t v23 = reply;
        unint64_t v24 = __swift_project_boxed_opaque_existential_1(&v36, v38);
        *(void *)&long long v34 = v14;
        *((void *)&v34 + 1) = v13;
        swift_retain();
        swift_retain();
        DTXPCCoder.encode<A>(_:into:)((uint64_t)v24, v23);
        swift_release();
        swift_release();
        xpc_connection_send_message(v21, v23);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        sub_24CD48E64((void *)v33, *((uint64_t *)&v33 + 1), v19, v20);
        sub_24CD53DBC((uint64_t)&v39, (uint64_t *)&unk_26982D930);
      }
      else
      {
        sub_24CD53DBC((uint64_t)&v39, (uint64_t *)&unk_26982D930);
        sub_24CD48E64((void *)v33, *((uint64_t *)&v33 + 1), v19, v20);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
    }
    else
    {
      sub_24CD53DBC((uint64_t)&v39, (uint64_t *)&unk_26982D930);
      sub_24CD48E64((void *)v33, *((uint64_t *)&v33 + 1), v19, v20);
      sub_24CD53DBC((uint64_t)&v34, (uint64_t *)&unk_26982D930);
    }
LABEL_33:
    swift_unknownObjectRelease();
    return;
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v4 = sub_24CD754E8();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if ((void)v39 == v4)
  {
    if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
      sub_24CD6EB74();
    }
    goto LABEL_33;
  }
  swift_unknownObjectRetain();
  uint64_t v5 = sub_24CD754D8();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if ((void)v39 == v5)
  {
    if ((*(unsigned char *)(a1 + 24) & 1) == 0)
    {
      if (qword_269834F70 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_24CD754B8();
      __swift_project_value_buffer(v15, (uint64_t)qword_269834F78);
      uint64_t v16 = sub_24CD75498();
      os_log_type_t v17 = sub_24CD75738();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_24CD46000, v16, v17, "### Invalidated unexpectedly", v18, 2u);
        MEMORY[0x2533146F0](v18, -1, -1);
      }
    }
    swift_unknownObjectRelease();
    *(void *)(a1 + 56) = 0;
    goto LABEL_33;
  }
  if (qword_269834F70 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24CD754B8();
  __swift_project_value_buffer(v6, (uint64_t)qword_269834F78);
  swift_unknownObjectRetain_n();
  os_log_type_t v7 = sub_24CD75498();
  os_log_type_t v8 = sub_24CD75738();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(void *)&long long v39 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v11 = sub_24CD75718();
    *(void *)&long long v36 = sub_24CD4AF20(v11, v12, (uint64_t *)&v39);
    sub_24CD757C8();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24CD46000, v7, v8, "### XPC event error: error=%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v10, -1, -1);
    MEMORY[0x2533146F0](v9, -1, -1);
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
}

uint64_t sub_24CD70E44()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CD70E54()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_24CD70E7C(uint64_t a1)
{
  uint64_t v2 = sub_24CD75AE8();

  return sub_24CD71668(a1, v2);
}

uint64_t sub_24CD70EC0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
  uint64_t v5 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  os_log_type_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D958);
  int v40 = a2;
  uint64_t result = sub_24CD75918();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    long long v36 = v3;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v38 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v37 = (unint64_t)(v13 + 63) >> 6;
    long long v39 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v17 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v19 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v20 = v19 | (v11 << 6);
      }
      else
      {
        int64_t v21 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v38;
        if (v21 >= v37) {
          goto LABEL_34;
        }
        unint64_t v22 = v38[v21];
        ++v11;
        if (!v22)
        {
          int64_t v11 = v21 + 1;
          if (v21 + 1 >= v37) {
            goto LABEL_34;
          }
          unint64_t v22 = v38[v11];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v37)
            {
LABEL_34:
              if ((v40 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v36;
                goto LABEL_41;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
              if (v35 >= 64) {
                bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v38 = -1 << v35;
              }
              uint64_t v3 = v36;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v22 = v38[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v11 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_43;
                }
                if (v11 >= v37) {
                  goto LABEL_34;
                }
                unint64_t v22 = v38[v11];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v11 = v23;
          }
        }
LABEL_21:
        unint64_t v15 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v11 << 6);
      }
      uint64_t v24 = *(void *)(*(void *)(v8 + 48) + 8 * v20);
      uint64_t v25 = v5;
      uint64_t v26 = *(void *)(v5 + 72);
      unint64_t v27 = *(void *)(v8 + 56) + v26 * v20;
      if (v40) {
        (*v16)(v7, v27, v41);
      }
      else {
        (*v39)(v7, v27, v41);
      }
      uint64_t result = sub_24CD75AE8();
      uint64_t v28 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v17 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v29) & ~*(void *)(v17 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v34 = *(void *)(v17 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v18 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v17 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v10 + 48) + 8 * v18) = v24;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v10 + 56) + v26 * v18, v7, v41);
      ++*(void *)(v10 + 16);
      uint64_t v5 = v25;
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_24CD7126C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24CD75828();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_24CD75AE8();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        uint64_t v14 = (void *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *uint64_t v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t v16 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26982D870) - 8) + 72);
        int64_t v17 = v16 * v3;
        uint64_t result = v15 + v16 * v3;
        int64_t v18 = v16 * v6;
        unint64_t v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v17 == v18) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *int64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24CD7144C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_24CD70E7C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_24CD71704();
      goto LABEL_7;
    }
    sub_24CD70EC0(v13, a3 & 1);
    unint64_t v24 = sub_24CD70E7C(a2);
    if ((v14 & 1) == (v25 & 1))
    {
      unint64_t v10 = v24;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24CD75AC8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
    uint64_t v19 = *(void *)(v18 - 8);
    unint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v21 = v18;
    uint64_t v22 = v17 + *(void *)(v19 + 72) * v10;
    return v20(v22, a1, v21);
  }
LABEL_13:

  return sub_24CD715B8(v10, a2, a1, v16);
}

uint64_t sub_24CD715B8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

unint64_t sub_24CD71668(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_24CD71704()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D870);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D958);
  uint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24CD75908();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *uint64_t v23 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v5 + 48) + 8 * v15);
    unint64_t v18 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v18, v1);
    *(void *)(*(void *)(v7 + 48) + v16) = v17;
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 56) + v18, v4, v1);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24CD71998(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (*(unsigned char *)(a1 + 8))
  {
    id v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D948);
    return sub_24CD75688();
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D948);
    return sub_24CD75698();
  }
}

uint64_t sub_24CD71A14(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    id v1 = *(id *)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D940);
    return sub_24CD75688();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D940);
    return sub_24CD75698();
  }
}

uint64_t sub_24CD71A84(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_24CD71AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26982D930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CD71B18()
{
  return objectdestroy_81Tm(&qword_26982D940);
}

uint64_t sub_24CD71B24(uint64_t a1)
{
  return sub_24CD71DB4(a1, &qword_26982D940, (uint64_t (*)(uint64_t, uint64_t))sub_24CD71A14);
}

uint64_t sub_24CD71B44()
{
  return objectdestroy_51Tm(MEMORY[0x263F8EEB0]);
}

uint64_t sub_24CD71B5C()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

uint64_t sub_24CD71B8C()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t sub_24CD71BB8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982D908);
  uint64_t v1 = sub_24CD756A8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24CD71C68(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26982D908);
  uint64_t v2 = sub_24CD756A8();
  return sub_24CD6D30C(a1, v2);
}

uint64_t sub_24CD71CFC()
{
  return objectdestroy_81Tm(&qword_26982D948);
}

uint64_t objectdestroy_81Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_24CD71D94(uint64_t a1)
{
  return sub_24CD71DB4(a1, &qword_26982D948, (uint64_t (*)(uint64_t, uint64_t))sub_24CD71998);
}

uint64_t sub_24CD71DB4(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

uint64_t objectdestroy_57Tm()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24CD48E64(*(void **)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 112, 7);
}

void sub_24CD71EAC(void *a1)
{
  uint64_t v3 = v1 + 32;
  unint64_t v13 = *(void (**)(id *))(v1 + 88);
  sub_24CD65850();
  DTXPCCoder.decode<A>(_:)(a1);
  id v4 = v15;
  char v16 = 0;
  uint64_t v5 = qword_269834F70;
  swift_bridgeObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24CD754B8();
  __swift_project_value_buffer(v6, (uint64_t)qword_269834F78);
  sub_24CD6F85C(v3);
  sub_24CD6F85C(v3);
  uint64_t v7 = sub_24CD75498();
  os_log_type_t v8 = sub_24CD75728();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v10;
    *(_DWORD *)unint64_t v9 = 136315138;
    sub_24CD6F9B0();
    uint64_t v11 = sub_24CD75A68();
    sub_24CD4AF20(v11, v12, &v14);
    sub_24CD757C8();
    swift_bridgeObjectRelease();
    sub_24CD6F47C(v3);
    sub_24CD6F47C(v3);
    _os_log_impl(&dword_24CD46000, v7, v8, "XPC request succeeded: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533146F0](v10, -1, -1);
    MEMORY[0x2533146F0](v9, -1, -1);
  }
  else
  {
    sub_24CD6F47C(v3);
    sub_24CD6F47C(v3);
  }

  sub_24CD5BA18(v4, 0);
  v13(&v15);
  sub_24CD5BA18(v15, v16);
}

uint64_t sub_24CD7236C()
{
  return objectdestroy_51Tm(MEMORY[0x263F8EEB0]);
}

void sub_24CD72384()
{
  uint64_t v1 = *(void (**)(void **))(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 32);
  id v4 = v2;
  char v5 = 1;
  id v3 = v2;
  v1(&v4);
}

uint64_t sub_24CD723F0()
{
  return objectdestroy_51Tm(MEMORY[0x263F8EEA0]);
}

uint64_t objectdestroy_51Tm(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 32));

  return MEMORY[0x270FA0238](v1, 40, 7);
}

uint64_t sub_24CD72458()
{
  uint64_t v1 = *(void (**)(uint64_t *))(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 32);
  char v4 = 0;
  swift_bridgeObjectRetain();
  v1(&v3);

  return swift_bridgeObjectRelease();
}

DistributedTimers::DTEnvironmentValues __swiftcall DTEnvironmentValues.init()()
{
  uint64_t v1 = v0;
  result._values._rawValue = (void *)sub_24CD74E44(MEMORY[0x263F8EE78]);
  v1->_values._rawValue = result._values._rawValue;
  return result;
}

uint64_t sub_24CD7255C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D980);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16) && (unint64_t v7 = sub_24CD745A0((uint64_t)&type metadata for ClockDTEnvironmentKey), (v8 & 1) != 0)) {
    sub_24CD4C758(*(void *)(a1 + 56) + 32 * v7, (uint64_t)v15);
  }
  else {
    memset(v15, 0, sizeof(v15));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D960);
  uint64_t v9 = sub_24CD75408();
  int v10 = swift_dynamicCast();
  uint64_t v11 = *(void *)(v9 - 8);
  unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  if (v10)
  {
    v12(v6, 0, 1, v9);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2, v6, v9);
  }
  else
  {
    v12(v6, 1, 1, v9);
    sub_24CD53DBC((uint64_t)v6, &qword_26982D980);
    if (qword_269835010 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v9, (uint64_t)qword_269835018);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a2, v14, v9);
  }
}

uint64_t sub_24CD7273C(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_24CD745A0((uint64_t)&type metadata for CloudKitAutomaticallySyncDTEnvironmentKey), (v3 & 1) != 0))
  {
    sub_24CD4C758(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D960);
  return v5 & 1 | ((swift_dynamicCast() & 1) == 0);
}

uint64_t sub_24CD727CC(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_24CD745A0((uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey), (v3 & 1) != 0))
  {
    sub_24CD4C758(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D960);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D968);
  if (swift_dynamicCast()) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_24CD72868(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_24CD745A0((uint64_t)&type metadata for CloudSyncEnabledDTEnvironmentKey), (v3 & 1) != 0))
  {
    sub_24CD4C758(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D960);
  if (swift_dynamicCast()) {
    return v5 & 1;
  }
  if (qword_269835030 != -1) {
    swift_once();
  }
  return byte_269835038;
}

uint64_t sub_24CD72934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D970);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16)
    && (unint64_t v7 = sub_24CD745A0((uint64_t)&type metadata for DatabaseURLDTEnvironmentKey), (v8 & 1) != 0))
  {
    sub_24CD4C758(*(void *)(a1 + 56) + 32 * v7, (uint64_t)v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D960);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D368);
  int v10 = swift_dynamicCast();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  if (v10)
  {
    v11(v6, 0, 1, v9);
    return sub_24CD750D0((uint64_t)v6, a2);
  }
  else
  {
    v11(v6, 1, 1, v9);
    sub_24CD53DBC((uint64_t)v6, &qword_26982D970);
    if (qword_269835040 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v9, (uint64_t)qword_269835048);
    return sub_24CD53D58(v13, a2, &qword_26982D368);
  }
}

id sub_24CD72AE4(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_24CD745A0((uint64_t)&type metadata for DispatchQueueDTEnvironmentKey), (v3 & 1) != 0))
  {
    sub_24CD4C758(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v7);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D960);
  sub_24CD69E8C();
  if (swift_dynamicCast()) {
    return (id)v6;
  }
  if (qword_269835060 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_269835068;

  return v5;
}

uint64_t DTEnvironmentValues.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_24CD757B8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v21 - v12;
  uint64_t v14 = *v4;
  if (*(void *)(v14 + 16) && (unint64_t v15 = sub_24CD745A0(a1), (v16 & 1) != 0)) {
    sub_24CD4C758(*(void *)(v14 + 56) + 32 * v15, (uint64_t)v21);
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D960);
  char v17 = swift_dynamicCast();
  unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);
  if (v17)
  {
    uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
    v18(v13, 0, 1, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(a4, v13, AssociatedTypeWitness);
  }
  else
  {
    v18(v13, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  }
}

uint64_t DTEnvironmentValues.subscript.setter(uint64_t a1, uint64_t a2)
{
  sub_24CD74F48(a1, a2);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);

  return v4(a1, AssociatedTypeWitness);
}

uint64_t sub_24CD72E6C(uint64_t a1, uint64_t a2)
{
  char v3 = v2;
  if (*(void *)(a1 + 24))
  {
    sub_24CD4D654((_OWORD *)a1, v14);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v2;
    *unint64_t v2 = 0x8000000000000000;
    sub_24CD74ADC(v14, a2, isUniquelyReferenced_nonNull_native);
    *unint64_t v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24CD53DBC(a1, &qword_26982D960);
    unint64_t v7 = sub_24CD745A0(a2);
    if (v8)
    {
      unint64_t v9 = v7;
      char v10 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = *v2;
      uint64_t v13 = *v3;
      *char v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_24CD74C80();
        uint64_t v11 = v13;
      }
      sub_24CD4D654((_OWORD *)(*(void *)(v11 + 56) + 32 * v9), v14);
      sub_24CD74944(v9, v11);
      *char v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      memset(v14, 0, sizeof(v14));
    }
    return sub_24CD53DBC((uint64_t)v14, &qword_26982D960);
  }
}

void (*DTEnvironmentValues.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t **a1, char a2)
{
  unint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  void v9[2] = a4;
  v9[3] = v4;
  void *v9 = a2;
  v9[1] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[4] = AssociatedTypeWitness;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v9[7] = v13;
  DTEnvironmentValues.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return sub_24CD7309C;
}

void sub_24CD7309C(uint64_t **a1, char a2)
{
  unint64_t v2 = *a1;
  char v3 = (void *)(*a1)[6];
  uint64_t v4 = (void *)(*a1)[7];
  uint64_t v5 = (*a1)[4];
  uint64_t v6 = (*a1)[5];
  uint64_t v7 = **a1;
  if (a2)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[6], v4, v5);
    sub_24CD74F48((uint64_t)v3, v7);
    char v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
    v8(v4, v5);
  }
  else
  {
    sub_24CD74F48((*a1)[7], v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t sub_24CD731A4()
{
  uint64_t v0 = sub_24CD75408();
  __swift_allocate_value_buffer(v0, qword_269835018);
  __swift_project_value_buffer(v0, (uint64_t)qword_269835018);
  return sub_24CD753F8();
}

uint64_t sub_24CD731F0@<X0>(uint64_t a1@<X8>)
{
  if (qword_269835010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24CD75408();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269835018);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t DTEnvironmentValues.clock.getter()
{
  return sub_24CD73E88((void (*)(uint64_t))sub_24CD7255C);
}

uint64_t sub_24CD732B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD73EF8(a1, a2, a3, (void (*)(uint64_t))sub_24CD7255C);
}

uint64_t sub_24CD732C8(uint64_t a1)
{
  uint64_t v2 = sub_24CD75408();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return DTEnvironmentValues.clock.setter(v4);
}

uint64_t DTEnvironmentValues.clock.setter(char *a1)
{
  uint64_t v2 = sub_24CD75408();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v6(v5, a1, v2);
  void v10[3] = v2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
  v6((char *)boxed_opaque_existential_0, v5, v2);
  sub_24CD72E6C((uint64_t)v10, (uint64_t)&type metadata for ClockDTEnvironmentKey);
  char v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  return ((uint64_t (*)(char *, uint64_t))v8)(a1, v2);
}

void (*DTEnvironmentValues.clock.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[8] = v1;
  uint64_t v4 = sub_24CD75408();
  v3[9] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[10] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[11] = malloc(v6);
  v3[12] = malloc(v6);
  uint64_t v7 = malloc(v6);
  v3[13] = v7;
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_24CD7255C(v8, (uint64_t)v7);
  swift_bridgeObjectRelease();
  return sub_24CD735AC;
}

void sub_24CD735AC(uint64_t **a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))((*a1)[10] + 16);
  v4((*a1)[12], v3[13], v3[9]);
  size_t v6 = (void *)v3[12];
  uint64_t v5 = (void *)v3[13];
  if (a2)
  {
    uint64_t v8 = v3[10];
    uint64_t v7 = (void *)v3[11];
    uint64_t v9 = v3[9];
    v4((uint64_t)v7, v3[12], v9);
    v3[3] = v9;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
    v4((uint64_t)boxed_opaque_existential_0, (uint64_t)v7, v9);
    sub_24CD72E6C((uint64_t)v3, (uint64_t)&type metadata for ClockDTEnvironmentKey);
    uint64_t v11 = *(void (**)(void *, uint64_t))(v8 + 8);
    v11(v7, v9);
    v11(v6, v9);
    v11(v5, v9);
  }
  else
  {
    uint64_t v12 = v3[10];
    uint64_t v7 = (void *)v3[11];
    uint64_t v13 = v3[9];
    v3[7] = v13;
    uint64_t v14 = __swift_allocate_boxed_opaque_existential_0(v3 + 4);
    v4((uint64_t)v14, (uint64_t)v6, v13);
    sub_24CD72E6C((uint64_t)(v3 + 4), (uint64_t)&type metadata for ClockDTEnvironmentKey);
    unint64_t v15 = *(void (**)(void *, uint64_t))(v12 + 8);
    v15(v6, v13);
    v15(v5, v13);
  }
  free(v5);
  free(v6);
  free(v7);

  free(v3);
}

uint64_t DTEnvironmentValues.cloudKitAutomaticallySync.getter()
{
  return sub_24CD73B70(sub_24CD7273C);
}

uint64_t sub_24CD73754@<X0>(unsigned char *a1@<X8>)
{
  return sub_24CD73BCC(sub_24CD7273C, a1);
}

uint64_t sub_24CD7376C(char *a1)
{
  char v1 = *a1;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_24CD72E6C((uint64_t)v3, (uint64_t)&type metadata for CloudKitAutomaticallySyncDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.cloudKitAutomaticallySync.setter(char a1)
{
  uint64_t v3 = MEMORY[0x263F8D4F8];
  v2[0] = a1;
  return sub_24CD72E6C((uint64_t)v2, (uint64_t)&type metadata for CloudKitAutomaticallySyncDTEnvironmentKey);
}

uint64_t (*DTEnvironmentValues.cloudKitAutomaticallySync.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_24CD7273C(v3);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return sub_24CD73860;
}

uint64_t sub_24CD73860(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_24CD72E6C((uint64_t)v3, (uint64_t)&type metadata for CloudKitAutomaticallySyncDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.cloudKitContainer.getter()
{
  return sub_24CD74380(sub_24CD727CC);
}

uint64_t sub_24CD738C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_24CD727CC(v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_24CD7390C(void **a1)
{
  char v1 = *a1;
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D968);
  v4[0] = v1;
  id v2 = v1;
  return sub_24CD72E6C((uint64_t)v4, (uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.cloudKitContainer.setter(uint64_t a1)
{
  v3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D968);
  v3[0] = a1;
  return sub_24CD72E6C((uint64_t)v3, (uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey);
}

void (*DTEnvironmentValues.cloudKitContainer.modify(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_24CD727CC(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_24CD73A14;
}

void sub_24CD73A14(void **a1, char a2)
{
  id v2 = *a1;
  if (a2)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D968);
    v4[0] = v2;
    id v3 = v2;
    sub_24CD72E6C((uint64_t)v4, (uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D968);
    v4[0] = v2;
    sub_24CD72E6C((uint64_t)v4, (uint64_t)&type metadata for CloudKitContainerDTEnvironmentKey);
  }
}

void sub_24CD73AAC()
{
  id v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    uint64_t v1 = v0;
    int deviceClassNumber = MobileGestalt_get_deviceClassNumber();

    byte_269835038 = deviceClassNumber == 7;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24CD73AFC@<X0>(unsigned char *a1@<X8>)
{
  if (qword_269835030 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = byte_269835038;
  return result;
}

uint64_t DTEnvironmentValues.cloudSyncEnabled.getter()
{
  return sub_24CD73B70(sub_24CD72868);
}

uint64_t sub_24CD73B70(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = swift_bridgeObjectRetain();
  LOBYTE(a1) = a1(v2);
  swift_bridgeObjectRelease();
  return a1 & 1;
}

uint64_t sub_24CD73BB4@<X0>(unsigned char *a1@<X8>)
{
  return sub_24CD73BCC(sub_24CD72868, a1);
}

uint64_t sub_24CD73BCC@<X0>(uint64_t (*a1)(uint64_t)@<X3>, unsigned char *a2@<X8>)
{
  uint64_t v4 = swift_bridgeObjectRetain();
  LOBYTE(a1) = a1(v4);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = a1 & 1;
  return result;
}

uint64_t sub_24CD73C20(char *a1)
{
  char v1 = *a1;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_24CD72E6C((uint64_t)v3, (uint64_t)&type metadata for CloudSyncEnabledDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.cloudSyncEnabled.setter(char a1)
{
  uint64_t v3 = MEMORY[0x263F8D4F8];
  v2[0] = a1;
  return sub_24CD72E6C((uint64_t)v2, (uint64_t)&type metadata for CloudSyncEnabledDTEnvironmentKey);
}

uint64_t (*DTEnvironmentValues.cloudSyncEnabled.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_24CD72868(v3);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return sub_24CD73D14;
}

uint64_t sub_24CD73D14(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_24CD72E6C((uint64_t)v3, (uint64_t)&type metadata for CloudSyncEnabledDTEnvironmentKey);
}

uint64_t sub_24CD73D60()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D368);
  __swift_allocate_value_buffer(v0, qword_269835048);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_269835048);
  uint64_t v2 = sub_24CD752F8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

uint64_t sub_24CD73DF8@<X0>(uint64_t a1@<X8>)
{
  if (qword_269835040 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D368);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269835048);
  return sub_24CD53D58(v3, a1, &qword_26982D368);
}

uint64_t DTEnvironmentValues.databaseURL.getter()
{
  return sub_24CD73E88((void (*)(uint64_t))sub_24CD72934);
}

uint64_t sub_24CD73E88(void (*a1)(uint64_t))
{
  uint64_t v2 = swift_bridgeObjectRetain();
  a1(v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24CD73EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CD73EF8(a1, a2, a3, (void (*)(uint64_t))sub_24CD72934);
}

uint64_t sub_24CD73EF8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = swift_bridgeObjectRetain();
  a4(v5);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24CD73F50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D368);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CD53D58(a1, (uint64_t)v4, &qword_26982D368);
  return DTEnvironmentValues.databaseURL.setter((uint64_t)v4);
}

uint64_t DTEnvironmentValues.databaseURL.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D368);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24CD53D58(a1, (uint64_t)v4, &qword_26982D368);
  v7[3] = v2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  sub_24CD53D58((uint64_t)v4, (uint64_t)boxed_opaque_existential_0, &qword_26982D368);
  sub_24CD72E6C((uint64_t)v7, (uint64_t)&type metadata for DatabaseURLDTEnvironmentKey);
  sub_24CD53DBC((uint64_t)v4, &qword_26982D368);
  return sub_24CD53DBC(a1, &qword_26982D368);
}

void (*DTEnvironmentValues.databaseURL.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[8] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D368);
  v3[9] = v4;
  size_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  v3[10] = malloc(v5);
  v3[11] = malloc(v5);
  uint64_t v6 = malloc(v5);
  v3[12] = v6;
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_24CD72934(v7, (uint64_t)v6);
  swift_bridgeObjectRelease();
  return sub_24CD74184;
}

void sub_24CD74184(uint64_t **a1, char a2)
{
  uint64_t v3 = *a1;
  sub_24CD53D58((*a1)[12], (*a1)[11], &qword_26982D368);
  size_t v5 = (void *)v3[11];
  uint64_t v4 = (void *)v3[12];
  if (a2)
  {
    uint64_t v7 = v3[9];
    uint64_t v6 = (void *)v3[10];
    sub_24CD53D58(v3[11], (uint64_t)v6, &qword_26982D368);
    v3[3] = v7;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
    sub_24CD53D58((uint64_t)v6, (uint64_t)boxed_opaque_existential_0, &qword_26982D368);
    sub_24CD72E6C((uint64_t)v3, (uint64_t)&type metadata for DatabaseURLDTEnvironmentKey);
    sub_24CD53DBC((uint64_t)v6, &qword_26982D368);
  }
  else
  {
    uint64_t v6 = (void *)v3[10];
    v3[7] = v3[9];
    uint64_t v9 = __swift_allocate_boxed_opaque_existential_0(v3 + 4);
    sub_24CD53D58((uint64_t)v5, (uint64_t)v9, &qword_26982D368);
    sub_24CD72E6C((uint64_t)(v3 + 4), (uint64_t)&type metadata for DatabaseURLDTEnvironmentKey);
  }
  sub_24CD53DBC((uint64_t)v5, &qword_26982D368);
  sub_24CD53DBC((uint64_t)v4, &qword_26982D368);
  free(v4);
  free(v5);
  free(v6);

  free(v3);
}

uint64_t sub_24CD742C8()
{
  sub_24CD69E8C();
  uint64_t result = sub_24CD75788();
  qword_269835068 = result;
  return result;
}

id sub_24CD742FC@<X0>(void *a1@<X8>)
{
  if (qword_269835060 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_269835068;
  *a1 = qword_269835068;

  return v2;
}

uint64_t DTEnvironmentValues.dispatchQueue.getter()
{
  return sub_24CD74380((uint64_t (*)(uint64_t))sub_24CD72AE4);
}

uint64_t sub_24CD74380(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = a1(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24CD743C4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = swift_bridgeObjectRetain();
  id v3 = sub_24CD72AE4(v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_24CD7440C(void **a1)
{
  uint64_t v1 = *a1;
  void v4[3] = sub_24CD69E8C();
  v4[0] = v1;
  id v2 = v1;
  return sub_24CD72E6C((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueDTEnvironmentKey);
}

uint64_t DTEnvironmentValues.dispatchQueue.setter(uint64_t a1)
{
  v3[3] = sub_24CD69E8C();
  v3[0] = a1;
  return sub_24CD72E6C((uint64_t)v3, (uint64_t)&type metadata for DispatchQueueDTEnvironmentKey);
}

void (*DTEnvironmentValues.dispatchQueue.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  id v4 = sub_24CD72AE4(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_24CD7450C;
}

void sub_24CD7450C(void **a1, char a2)
{
  id v2 = *a1;
  if (a2)
  {
    unint64_t v5 = sub_24CD69E8C();
    v4[0] = v2;
    id v3 = v2;
    sub_24CD72E6C((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueDTEnvironmentKey);
  }
  else
  {
    unint64_t v5 = sub_24CD69E8C();
    v4[0] = v2;
    sub_24CD72E6C((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueDTEnvironmentKey);
  }
}

unint64_t sub_24CD745A0(uint64_t a1)
{
  uint64_t v2 = sub_24CD75AE8();

  return sub_24CD745E4(a1, v2);
}

unint64_t sub_24CD745E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_24CD74680(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D978);
  uint64_t result = sub_24CD75918();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v31 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_34;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_34;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                id v3 = v31;
                goto LABEL_41;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v9 = -1 << v30;
              }
              id v3 = v31;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_43;
                }
                if (v8 >= v13) {
                  goto LABEL_34;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
      uint64_t v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2) {
        sub_24CD4D654(v22, v32);
      }
      else {
        sub_24CD4C758((uint64_t)v22, (uint64_t)v32);
      }
      uint64_t result = sub_24CD75AE8();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v7 + 48) + 8 * v15) = v21;
      uint64_t result = (uint64_t)sub_24CD4D654(v32, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *id v3 = v7;
  return result;
}

unint64_t sub_24CD74944(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24CD75828();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v10 = *(void *)(a2 + 48);
        uint64_t v11 = (void *)(v10 + 8 * v6);
        uint64_t result = sub_24CD75AE8();
        unint64_t v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            unint64_t v15 = (void *)(v10 + 8 * v3);
            if (v3 != v6 || v15 >= v11 + 1) {
              *unint64_t v15 = *v11;
            }
            uint64_t v16 = *(void *)(a2 + 56);
            unint64_t v17 = (_OWORD *)(v16 + 32 * v3);
            int64_t v18 = (_OWORD *)(v16 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 2))
            {
              long long v9 = v18[1];
              *unint64_t v17 = *v18;
              v17[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v8 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_24CD74ADC(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_24CD745A0(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_24CD74C80();
      goto LABEL_7;
    }
    sub_24CD74680(v13, a3 & 1);
    unint64_t v19 = sub_24CD745A0(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_24CD75AC8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    unint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    return sub_24CD4D654(a1, v17);
  }
LABEL_13:

  return sub_24CD74C18(v10, a2, a1, v16);
}

_OWORD *sub_24CD74C18(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_24CD4D654(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

void *sub_24CD74C80()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982D978);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CD75908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_24CD4C758(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t result = sub_24CD4D654(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_24CD74E44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982D978);
    uint64_t v3 = (void *)sub_24CD75928();
    for (uint64_t i = a1 + 32; ; i += 40)
    {
      sub_24CD53D58(i, (uint64_t)&v11, &qword_26982D988);
      uint64_t v5 = v11;
      unint64_t result = sub_24CD745A0(v11);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      unint64_t result = (unint64_t)sub_24CD4D654(&v12, (_OWORD *)(v3[7] + 32 * result));
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_24CD74F48(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_0, a1, AssociatedTypeWitness);
  return sub_24CD72E6C((uint64_t)v7, a2);
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

uint64_t dispatch thunk of static DTEnvironmentKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for DTEnvironmentValues()
{
  return &type metadata for DTEnvironmentValues;
}

ValueMetadata *type metadata accessor for DispatchQueueDTEnvironmentKey()
{
  return &type metadata for DispatchQueueDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for DatabaseURLDTEnvironmentKey()
{
  return &type metadata for DatabaseURLDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for CloudSyncEnabledDTEnvironmentKey()
{
  return &type metadata for CloudSyncEnabledDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for CloudKitContainerDTEnvironmentKey()
{
  return &type metadata for CloudKitContainerDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for CloudKitAutomaticallySyncDTEnvironmentKey()
{
  return &type metadata for CloudKitAutomaticallySyncDTEnvironmentKey;
}

ValueMetadata *type metadata accessor for ClockDTEnvironmentKey()
{
  return &type metadata for ClockDTEnvironmentKey;
}

uint64_t sub_24CD750D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982D368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CD75138()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24CD75148()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24CD75158()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24CD75168()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24CD75178()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24CD75188()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24CD75198()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_24CD751A8()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_24CD751B8()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_24CD751C8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_24CD751D8()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_24CD751E8()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_24CD751F8()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_24CD75208()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_24CD75218()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_24CD75228()
{
  return MEMORY[0x270EEE5A0]();
}

uint64_t sub_24CD75238()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_24CD75248()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_24CD75258()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_24CD75268()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_24CD75278()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24CD75288()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24CD75298()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24CD752A8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24CD752B8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24CD752C8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24CD752D8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24CD752E8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_24CD752F8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CD75308()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_24CD75318()
{
  return MEMORY[0x270F24928]();
}

uint64_t sub_24CD75328()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24CD75338()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24CD75348()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_24CD75358()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24CD75368()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24CD75378()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24CD75388()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24CD75398()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24CD753A8()
{
  return MEMORY[0x270F24948]();
}

uint64_t sub_24CD753B8()
{
  return MEMORY[0x270F24950]();
}

uint64_t sub_24CD753C8()
{
  return MEMORY[0x270F24958]();
}

uint64_t sub_24CD753D8()
{
  return MEMORY[0x270F249C8]();
}

uint64_t sub_24CD753E8()
{
  return MEMORY[0x270F249D8]();
}

uint64_t sub_24CD753F8()
{
  return MEMORY[0x270F24A08]();
}

uint64_t sub_24CD75408()
{
  return MEMORY[0x270F24A38]();
}

uint64_t sub_24CD75418()
{
  return MEMORY[0x270F24A40]();
}

uint64_t sub_24CD75428()
{
  return MEMORY[0x270F24A48]();
}

uint64_t sub_24CD75438()
{
  return MEMORY[0x270F24A58]();
}

uint64_t sub_24CD75448()
{
  return MEMORY[0x270F24A60]();
}

uint64_t sub_24CD75458()
{
  return MEMORY[0x270F24A68]();
}

uint64_t sub_24CD75468()
{
  return MEMORY[0x270F24A70]();
}

uint64_t sub_24CD75478()
{
  return MEMORY[0x270F24A78]();
}

uint64_t sub_24CD75488()
{
  return MEMORY[0x270F24A80]();
}

uint64_t sub_24CD75498()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CD754A8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CD754B8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CD754C8()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_24CD754D8()
{
  return MEMORY[0x270FA1A58]();
}

uint64_t sub_24CD754E8()
{
  return MEMORY[0x270FA1A68]();
}

uint64_t sub_24CD754F8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24CD75508()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24CD75518()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24CD75528()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24CD75538()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24CD75548()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24CD75558()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CD75568()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CD75578()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24CD75588()
{
  return MEMORY[0x270F24A90]();
}

uint64_t sub_24CD75598()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_24CD755A8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24CD755B8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24CD755C8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CD755D8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CD755E8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24CD755F8()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_24CD75608()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24CD75618()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_24CD75628()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24CD75638()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CD75648()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CD75658()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24CD75668()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24CD75678()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CD75688()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24CD75698()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24CD756A8()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_24CD756D8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CD756E8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CD756F8()
{
  return MEMORY[0x270FA2078]();
}

uint64_t sub_24CD75708()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_24CD75718()
{
  return MEMORY[0x270F24AA8]();
}

uint64_t sub_24CD75728()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24CD75738()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CD75748()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CD75758()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_24CD75768()
{
  return MEMORY[0x270F24AC8]();
}

uint64_t sub_24CD75778()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24CD75788()
{
  return MEMORY[0x270F24AD8]();
}

uint64_t sub_24CD75798()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_24CD757A8()
{
  return MEMORY[0x270FA0FB0]();
}

uint64_t sub_24CD757B8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CD757C8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CD757D8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CD757E8()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_24CD757F8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24CD75818()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24CD75828()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24CD75838()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24CD75848()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24CD75858()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24CD75868()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CD75878()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CD75888()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CD75898()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24CD758A8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24CD758B8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CD758C8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24CD758D8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CD758E8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24CD758F8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CD75908()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CD75918()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CD75928()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24CD75938()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CD75948()
{
  return MEMORY[0x270F9F0D8]();
}

uint64_t sub_24CD75958()
{
  return MEMORY[0x270F9F0E0]();
}

uint64_t sub_24CD75968()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24CD75978()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24CD75988()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24CD75998()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24CD759A8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24CD759B8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24CD759C8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24CD759D8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24CD759E8()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_24CD759F8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24CD75A08()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24CD75A18()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24CD75A28()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24CD75A38()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24CD75A48()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24CD75A58()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_24CD75A68()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CD75A78()
{
  return MEMORY[0x270F24B00]();
}

uint64_t sub_24CD75A88()
{
  return MEMORY[0x270F24B10]();
}

uint64_t sub_24CD75A98()
{
  return MEMORY[0x270F24B18]();
}

uint64_t sub_24CD75AA8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CD75AC8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CD75AD8()
{
  return MEMORY[0x270F24B20]();
}

uint64_t sub_24CD75AE8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_24CD75AF8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CD75B08()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CD75B18()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CD75B28()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_24CD75B38()
{
  return MEMORY[0x270EF27A0]();
}

uint64_t sub_24CD75B48()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24CD75B58()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t CUNextID64()
{
  return MEMORY[0x270F23F70]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x270F960F0]();
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

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x270EDC030]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}