BOOL static Understandable.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Understandable.hash(into:)()
{
  return sub_21F078390();
}

uint64_t Understandable.hashValue.getter()
{
  return sub_21F0783A0();
}

BOOL sub_21F068B30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21F068B48()
{
  return sub_21F0783A0();
}

uint64_t sub_21F068B90()
{
  return sub_21F078390();
}

uint64_t sub_21F068BBC()
{
  return sub_21F0783A0();
}

uint64_t AnyFrame.__allocating_init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21F068C30(a1, a2, a3, (uint64_t (*)(void))sub_21F06A0DC);
}

uint64_t AnyFrame.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21F068C30(a1, a2, a3, (uint64_t (*)(void))sub_21F069CB0);
}

uint64_t sub_21F068C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v6;
}

uint64_t sub_21F068C9C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v26[1] = a5;
  v27 = a3;
  uint64_t v28 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = sub_21F0781C0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v17 = (char *)v26 - v16;
  uint64_t v18 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v15);
  v20 = (char *)v26 - v19;
  sub_21F06A138(a1, (uint64_t)&v29);
  char v21 = swift_dynamicCast();
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  if (v21)
  {
    v22(v17, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v17, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, void (*)(uint64_t *), uint64_t, uint64_t, uint64_t))(a8 + 56))(v20, a2, v27, v28, a7, a8);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, AssociatedTypeWitness);
  }
  else
  {
    v22(v17, 1, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    sub_21F06A8E8();
    uint64_t v24 = swift_allocError();
    void *v25 = 0xD00000000000001BLL;
    v25[1] = 0x800000021F079290;
    uint64_t v29 = v24;
    char v30 = 1;
    v27(&v29);
    return MEMORY[0x223C41B10](v24);
  }
}

uint64_t sub_21F068F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v16 = &v20[-v15];
  sub_21F06A138(a1, (uint64_t)v20);
  swift_dynamicCast();
  v17 = (void *)swift_allocObject();
  v17[2] = a5;
  v17[3] = a6;
  v17[4] = a7;
  v17[5] = a2;
  v17[6] = a3;
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(a7 + 64);
  swift_retain();
  v18(v16, sub_21F06A834, v17, a6, a7);
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v14 + 8))(v16, AssociatedTypeWitness);
}

uint64_t sub_21F0690E8(uint64_t a1, void (*a2)(uint64_t *))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v7 = (char *)&v16[-1] - v6;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EBA1C0);
  uint64_t v8 = sub_21F0783B0();
  MEMORY[0x270FA5388](v8);
  v10 = (uint64_t *)((char *)&v16[-1] - v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v16[-1] - v9, a1, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16[0] = *v10;
    uint64_t v12 = v16[0];
    char v17 = 1;
    MEMORY[0x223C41B20](v16[0]);
    a2(v16);
    MEMORY[0x223C41B10](v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v10, AssociatedTypeWitness);
    v16[3] = AssociatedTypeWitness;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v16);
    (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(boxed_opaque_existential_0, v7, AssociatedTypeWitness);
    char v17 = 0;
    a2(v16);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  }
  return sub_21F06A88C((uint64_t)v16, &qword_267EBA1C8);
}

uint64_t sub_21F069330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v22 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)&v21 - v14;
  uint64_t v16 = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v21 - v18;
  sub_21F06A138(a1, (uint64_t)v26);
  swift_dynamicCast();
  sub_21F06A138(a2, (uint64_t)v25);
  swift_dynamicCast();
  (*(void (**)(char *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 72))(v19, v15, v22, v23, a7, a8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, AssociatedTypeWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_21F069554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = &v14[-v10];
  sub_21F06A138(a1, (uint64_t)v14);
  swift_dynamicCast();
  uint64_t v12 = *(void (**)(unsigned char *, uint64_t, uint64_t))(a3 + 80);
  a4[3] = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_0(a4);
  v12(v11, a2, a3);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
}

uint64_t sub_21F0696CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v5 + 32);
  v14[3] = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
  v11(v14, a2, a3, a4);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
}

uint64_t sub_21F06977C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 48);
  v12[3] = a4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_0, a1, a4);
  v9(v12, a2, a3);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
}

uint64_t sub_21F06981C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v5 + 64);
  v14[3] = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
  v11(v14, a2, a3, a4);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
}

uint64_t sub_21F0698CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void (**)(uint64_t *))(v2 + 80);
  v8[3] = a2;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(boxed_opaque_existential_0, a1, a2);
  v5(v8);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v8);
}

unint64_t sub_21F069964()
{
  return 0xD000000000000018;
}

uint64_t sub_21F069A50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_21F0781C0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v14[-v7];
  sub_21F06A138(v2 + 112, (uint64_t)v14);
  int v9 = swift_dynamicCast();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56);
  if (v9)
  {
    uint64_t v11 = *(void *)(a1 - 8);
    v10((uint64_t)v8, 0, 1, a1);
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a2, v8, a1);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
    v10((uint64_t)v8, 1, 1, a1);
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v10(a2, v12, 1, a1);
}

uint64_t AnyFrame.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 112);
  return v0;
}

uint64_t AnyFrame.__deallocating_deinit()
{
  AnyFrame.deinit();
  return MEMORY[0x270FA0228](v0, 144, 7);
}

unint64_t sub_21F069C88()
{
  return sub_21F069964();
}

void *sub_21F069CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v43 = *v3;
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  v40 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v38 - v11;
  v4[17] = v13;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v4 + 14);
  uint64_t v15 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16);
  v15(boxed_opaque_existential_0, a1, a2);
  uint64_t v16 = a1;
  v46 = (void (*)(char *, uint64_t, uint64_t))v15;
  uint64_t v47 = v8 + 16;
  v15((uint64_t *)v12, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA1B0);
  if (swift_dynamicCast())
  {
    sub_21F06A750(v48, (uint64_t)v50);
    __swift_project_boxed_opaque_existential_1(v50, v50[3]);
    v4[12] = sub_21F078310();
    v4[13] = v17;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v50);
  }
  else
  {
    uint64_t v49 = 0;
    memset(v48, 0, sizeof(v48));
    sub_21F06A88C((uint64_t)v48, &qword_267EBA1B8);
    v50[0] = swift_getDynamicType();
    swift_getMetatypeMetadata();
    v4[12] = sub_21F077F50();
    v4[13] = v18;
  }
  uint64_t v19 = a3;
  v4[2] = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  v4[3] = v20;
  uint64_t v21 = v40;
  v46(v40, v16, a2);
  uint64_t v22 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v23 = v19;
  uint64_t v24 = (v22 + 40) & ~v22;
  uint64_t v41 = v24 + v9;
  uint64_t v45 = v24;
  uint64_t v25 = v22 | 7;
  v26 = (char *)swift_allocObject();
  uint64_t v27 = v16;
  uint64_t v44 = v16;
  uint64_t v39 = *(void *)(v43 + 80);
  *((void *)v26 + 2) = v39;
  *((void *)v26 + 3) = a2;
  *((void *)v26 + 4) = v23;
  uint64_t v28 = v21;
  v42 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v43 = v8 + 32;
  v42(&v26[v24], v21, a2);
  v4[4] = sub_21F06A5AC;
  v4[5] = v26;
  uint64_t v29 = v46;
  v46(v21, v27, a2);
  uint64_t v38 = v25;
  char v30 = (char *)swift_allocObject();
  uint64_t v31 = v39;
  *((void *)v30 + 2) = v39;
  *((void *)v30 + 3) = a2;
  *((void *)v30 + 4) = v23;
  v42(&v30[v45], v21, a2);
  v4[6] = sub_21F06A5F4;
  v4[7] = v30;
  v29(v21, v44, a2);
  v32 = (char *)swift_allocObject();
  *((void *)v32 + 2) = v31;
  *((void *)v32 + 3) = a2;
  *((void *)v32 + 4) = v23;
  uint64_t v33 = v23;
  uint64_t v34 = v45;
  v35 = v42;
  v42(&v32[v45], v28, a2);
  v4[8] = sub_21F06A63C;
  v4[9] = v32;
  v46(v28, v44, a2);
  v36 = (char *)swift_allocObject();
  *((void *)v36 + 2) = v31;
  *((void *)v36 + 3) = a2;
  *((void *)v36 + 4) = v33;
  v35(&v36[v34], v28, a2);
  v4[10] = sub_21F06A70C;
  v4[11] = v36;
  return v4;
}

void *sub_21F06A0DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21F069CB0(a1, a2, a3);
}

uint64_t sub_21F06A138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21F06A198()
{
  unint64_t result = qword_267EBA128[0];
  if (!qword_267EBA128[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267EBA128);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Understandable(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Understandable(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x21F06A358);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_21F06A380(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21F06A38C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Understandable()
{
  return &type metadata for Understandable;
}

uint64_t sub_21F06A3AC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AnyFrame()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AnyFrame(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnyFrame);
}

uint64_t dispatch thunk of AnyFrame.__allocating_init<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AnyFrame.debugDescription.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of AnyFrame.unbox<A>()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of FlowFrameProtocol.namespace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FlowFrameProtocol.onInput(controller:input:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 56))();
}

uint64_t dispatch thunk of FlowFrameProtocol.execute(controller:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of FlowFrameProtocol.action(renderer:args:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t dispatch thunk of FlowFrameProtocol.exit(controller:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
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

uint64_t sub_21F06A5AC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4)
{
  return sub_21F068C9C(a1, a2, a3, a4, (uint64_t)v4+ ((*(unsigned __int8 *)(*(void *)(v4[3] - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4[3] - 8) + 80)), v4[2], v4[3], v4[4]);
}

uint64_t sub_21F06A5F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21F068F4C(a1, a2, a3, (uint64_t)v3+ ((*(unsigned __int8 *)(*(void *)(v3[3] - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3[3] - 8) + 80)), v3[2], v3[3], v3[4]);
}

uint64_t sub_21F06A63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F069330(a1, a2, a3, a4, (uint64_t)v4+ ((*(unsigned __int8 *)(*(void *)(v4[3] - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4[3] - 8) + 80)), v4[2], v4[3], v4[4]);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_21F06A70C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_21F069554(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_21F06A750(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_21F06A7FC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_21F06A834(uint64_t a1)
{
  return sub_21F0690E8(a1, *(void (**)(uint64_t *))(v1 + 40));
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

uint64_t sub_21F06A88C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_21F06A8E8()
{
  unint64_t result = qword_267EBA1D0[0];
  if (!qword_267EBA1D0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267EBA1D0);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t NonUnderstanding.input.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 28));
}

uint64_t NonUnderstanding.localizedDescription.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21F06A9E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  BOOL v7 = (char *)a5 + *(int *)(type metadata accessor for NonUnderstanding() + 28);
  int v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32);
  return v8(v7, a3, a4);
}

uint64_t TimedOutError.message.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for IllegalStateError()
{
  return &type metadata for IllegalStateError;
}

uint64_t sub_21F06AAC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_21F06AAC8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21F06AB64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_21F06AC6C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return v5(v6);
}

void *sub_21F06ACE0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_bridgeObjectRetain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_21F06AD70(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_21F06AE08(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_21F06AE78(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_21F06AF00(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
      }
      unint64_t v15 = *((void *)a1 + 1);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_21F06B0A0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 16) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x21F06B300);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 16] & ~v9;
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = a2 - 1;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for NonUnderstanding()
{
  return __swift_instantiateGenericMetadata();
}

void *initializeBufferWithCopyOfBuffer for TimedOutError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TimedOutError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithTake for TimedOutError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for TimedOutError()
{
  return &type metadata for TimedOutError;
}

void *_s12FlowFrameKit17IllegalStateErrorVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12FlowFrameKit17IllegalStateErrorVwet_0(uint64_t a1, int a2)
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

uint64_t sub_21F06B448(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for CancelledError()
{
  return &type metadata for CancelledError;
}

uint64_t AnyFlowFrameFactory.namespace.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21F06B4DC()
{
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t sub_21F06B504()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t AnyFlowFrameFactory.__allocating_init<A>(_:)(char *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  AnyFlowFrameFactory.init<A>(_:)(a1, a2);
  return v4;
}

void *AnyFlowFrameFactory.init<A>(_:)(char *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  char v30 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v32 = *v2;
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v10;
  v2[2] = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(a2, v10);
  v2[3] = v11;
  unsigned int v12 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v12(v9, a1, a2);
  int v13 = v12;
  uint64_t v14 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v27 = v12;
  uint64_t v28 = ((v14 + 40) & ~v14) + v8;
  uint64_t v15 = (v14 + 40) & ~v14;
  v26[1] = v14 | 7;
  unsigned int v16 = (char *)swift_allocObject();
  uint64_t v32 = *(void *)(v32 + 80);
  *((void *)v16 + 2) = v32;
  *((void *)v16 + 3) = a2;
  uint64_t v17 = v29;
  *((void *)v16 + 4) = v29;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v31(&v16[v15], v9, a2);
  v3[8] = sub_21F06B8FC;
  v3[9] = v16;
  unint64_t v18 = v30;
  v13(v9, v30, a2);
  uint64_t v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = v32;
  *((void *)v19 + 3) = a2;
  *((void *)v19 + 4) = v17;
  v31(&v19[v15], v9, a2);
  v3[10] = sub_21F06B99C;
  v3[11] = v19;
  v27(v9, v18, a2);
  uint64_t v20 = (char *)swift_allocObject();
  uint64_t v22 = v31;
  uint64_t v21 = v32;
  *((void *)v20 + 2) = v32;
  *((void *)v20 + 3) = a2;
  uint64_t v23 = v29;
  *((void *)v20 + 4) = v29;
  v22(&v20[v15], v9, a2);
  v3[4] = sub_21F06BA04;
  v3[5] = v20;
  v22(v9, v30, a2);
  uint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = v21;
  *((void *)v24 + 3) = a2;
  *((void *)v24 + 4) = v23;
  v22(&v24[v15], v9, a2);
  v3[6] = sub_21F06BA78;
  v3[7] = v24;
  return v3;
}

uint64_t sub_21F06B874@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 40);
  a3[3] = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_0(a3);
  return v6(a1, a2);
}

uint64_t sub_21F06B8FC()
{
  return sub_21F06B9B4((uint64_t (*)(unint64_t, void))sub_21F06B874);
}

uint64_t sub_21F06B914@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 48);
  a3[3] = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_0(a3);
  return v6(a1, a2);
}

uint64_t sub_21F06B99C()
{
  return sub_21F06B9B4((uint64_t (*)(unint64_t, void))sub_21F06B914);
}

uint64_t sub_21F06B9B4(uint64_t (*a1)(unint64_t, void))
{
  return a1(v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80)), *(void *)(v1 + 16));
}

uint64_t sub_21F06BA04()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 32) + 56))() & 1;
}

uint64_t sub_21F06BA78()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 32) + 64))();
}

uint64_t sub_21F06BAE4()
{
  return (*(uint64_t (**)(void))(v0 + 32))() & 1;
}

uint64_t sub_21F06BB10()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t AnyFlowFrameFactory.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t AnyFlowFrameFactory.__deallocating_deinit()
{
  AnyFlowFrameFactory.deinit();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.namespace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.controller.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.renderer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.hasFrameAbleToHandle(givenInput:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of FlowFrameFactoryProtocol.makeFrameAbleToHandle(givenInput:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_21F06BC10()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AnyFlowFrameFactory()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AnyFlowFrameFactory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnyFlowFrameFactory);
}

uint64_t dispatch thunk of AnyFlowFrameFactory.controller.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.renderer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.__allocating_init<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.hasFrameAbleToHandle(givenInput:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of AnyFlowFrameFactory.makeFrameAbleToHandle(givenInput:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of FlowFrameFactoryLoaderProtocol.loadFactory(fromNamespace:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of FlowFrameFactoryLoaderProtocol.loadFactory(forInput:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_21F06BD64()
{
  uint64_t v0 = sub_21F077E40();
  __swift_allocate_value_buffer(v0, qword_26AD3D078);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AD3D078);
  if (qword_26AD3CD00 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26AD3D070;
  return sub_21F077E50();
}

void sub_21F06BDF0()
{
  algn_267EBA8C8[5] = 0;
  *(_WORD *)&algn_267EBA8C8[6] = -5120;
}

uint64_t sub_21F06BE1C()
{
  sub_21F06BEBC();
  if (qword_267EBA120 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_21F0781B0();
  qword_26AD3D070 = result;
  return result;
}

unint64_t sub_21F06BEBC()
{
  unint64_t result = qword_26AD3CCF0;
  if (!qword_26AD3CCF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD3CCF0);
  }
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

BOOL static FrameOperationType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FrameOperationType.hash(into:)()
{
  return sub_21F078390();
}

uint64_t FrameOperationType.hashValue.getter()
{
  return sub_21F0783A0();
}

BOOL sub_21F06C020(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void FrameOperation.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t FrameOperation.next.getter()
{
  return swift_retain();
}

uint64_t FrameOperation.requireInput.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t FrameOperation.onChildFrameCompletion.getter()
{
  return swift_retain();
}

unsigned char *FrameOperation.init(type:next:onChildFrameCompletion:requireInput:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = *result;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a4;
  *(void *)(a5 + 24) = a3;
  return result;
}

uint64_t static FrameOperation.ongoing(requireInput:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = result;
  *(void *)(a2 + 24) = 0;
  return result;
}

void *static FrameOperation.ongoing<A>(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  type metadata accessor for AnyFrame();
  unint64_t result = sub_21F06A0DC(a1, a2, a3);
  *(unsigned char *)a4 = 0;
  *(void *)(a4 + 8) = result;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  return result;
}

uint64_t static FrameOperation.ongoing<A, B>(next:childCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  type metadata accessor for AnyFrame();
  uint64_t v14 = sub_21F06A0DC(a1, a4, a6);
  type metadata accessor for AnyChildCompletion();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a5;
  v17[3] = AssociatedTypeWitness;
  v17[4] = a2;
  v17[5] = a3;
  *(void *)(v16 + 16) = sub_21F06CCC8;
  *(void *)(v16 + 24) = v17;
  *(unsigned char *)a7 = 0;
  *(void *)(a7 + 8) = v14;
  *(unsigned char *)(a7 + 16) = 0;
  *(void *)(a7 + 24) = v16;
  return swift_retain();
}

uint64_t AnyChildCompletion.__allocating_init<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  *(void *)(v8 + 16) = sub_21F06CCC8;
  *(void *)(v8 + 24) = v9;
  return v8;
}

uint64_t static FrameOperation.ongoing(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = a1;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return swift_retain();
}

void static FrameOperation.complete()(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
}

void *static FrameOperation.complete<A>(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  type metadata accessor for AnyFrame();
  unint64_t result = sub_21F06A0DC(a1, a2, a3);
  *(unsigned char *)a4 = 1;
  *(void *)(a4 + 8) = result;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  return result;
}

uint64_t static FrameOperation.complete<A, B>(next:childCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  type metadata accessor for AnyFrame();
  uint64_t v14 = sub_21F06A0DC(a1, a4, a6);
  type metadata accessor for AnyChildCompletion();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a5;
  v17[3] = AssociatedTypeWitness;
  v17[4] = a2;
  v17[5] = a3;
  *(void *)(v16 + 16) = sub_21F06CCC8;
  *(void *)(v16 + 24) = v17;
  *(unsigned char *)a7 = 1;
  *(void *)(a7 + 8) = v14;
  *(unsigned char *)(a7 + 16) = 0;
  *(void *)(a7 + 24) = v16;
  return swift_retain();
}

uint64_t static FrameOperation.complete(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 1;
  *(void *)(a2 + 8) = a1;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return swift_retain();
}

uint64_t static FrameOperation.replan(requireInput:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 2;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = result;
  *(void *)(a2 + 24) = 0;
  return result;
}

void *static FrameOperation.replan<A>(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  type metadata accessor for AnyFrame();
  unint64_t result = sub_21F06A0DC(a1, a2, a3);
  *(unsigned char *)a4 = 2;
  *(void *)(a4 + 8) = result;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  return result;
}

uint64_t static FrameOperation.replan<A, B>(next:childCompletion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  type metadata accessor for AnyFrame();
  uint64_t v14 = sub_21F06A0DC(a1, a4, a6);
  type metadata accessor for AnyChildCompletion();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a5;
  v17[3] = AssociatedTypeWitness;
  v17[4] = a2;
  v17[5] = a3;
  *(void *)(v16 + 16) = sub_21F06CCC8;
  *(void *)(v16 + 24) = v17;
  *(unsigned char *)a7 = 2;
  *(void *)(a7 + 8) = v14;
  *(unsigned char *)(a7 + 16) = 0;
  *(void *)(a7 + 24) = v16;
  return swift_retain();
}

uint64_t static FrameOperation.replan(next:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = 2;
  *(void *)(a2 + 8) = a1;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return swift_retain();
}

uint64_t AnyChildCompletion.init<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = a1;
  v9[5] = a2;
  *(void *)(v4 + 16) = sub_21F06CCC8;
  *(void *)(v4 + 24) = v9;
  return v4;
}

uint64_t sub_21F06C64C(uint64_t a1, uint64_t a2, void (*a3)(char *, char *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v36 = a4;
  v37 = a3;
  uint64_t v35 = a2;
  uint64_t v9 = sub_21F0781C0();
  uint64_t v32 = *(void *)(v9 - 8);
  uint64_t v33 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unsigned int v12 = (char *)&v30 - v11;
  uint64_t v13 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_21F0781C0();
  uint64_t v31 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v30 - v18;
  uint64_t v20 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a1;
  sub_21F06A138(a1, (uint64_t)v41);
  char v23 = swift_dynamicCast();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  if (v23)
  {
    v24(v19, 0, 1, a5);
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v19, a5);
    uint64_t v25 = v35;
    sub_21F06A138(v35, (uint64_t)v41);
    char v26 = swift_dynamicCast();
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
    if (v26)
    {
      v27(v12, 0, 1, a6);
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, a6);
      v37(v22, v15);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, a6);
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, a5);
    }
    uint64_t v29 = v25;
    v27(v12, 1, 1, a6);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, a5);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v33);
  }
  else
  {
    uint64_t v29 = v35;
    v24(v19, 1, 1, a5);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v16);
  }
  sub_21F06A138(v34, (uint64_t)v41);
  sub_21F06A138(v29, (uint64_t)v40);
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_21F078230();
  sub_21F077F70();
  sub_21F0783C0();
  sub_21F077F70();
  swift_bridgeObjectRelease();
  sub_21F077F70();
  sub_21F0783C0();
  sub_21F077F70();
  swift_bridgeObjectRelease();
  sub_21F077F70();
  sub_21F0782C0();
  sub_21F077F70();
  sub_21F0782C0();
  uint64_t result = sub_21F0782E0();
  __break(1u);
  return result;
}

uint64_t sub_21F06CB7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void (**)(uint64_t *, uint64_t))(v3 + 16);
  v10[3] = a3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_0, a1, a3);
  v7(v10, a2);
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
}

uint64_t AnyChildCompletion.deinit()
{
  swift_release();
  return v0;
}

uint64_t AnyChildCompletion.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for AnyChildCompletion()
{
  return self;
}

uint64_t sub_21F06CC90()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21F06CCC8(uint64_t a1, uint64_t a2)
{
  return sub_21F06C64C(a1, a2, *(void (**)(char *, char *))(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 16), *(void *)(v2 + 24));
}

unint64_t sub_21F06CCD8()
{
  unint64_t result = qword_267EBA258[0];
  if (!qword_267EBA258[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267EBA258);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FrameOperationType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FrameOperationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x21F06CE88);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_21F06CEB0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FrameOperationType()
{
  return &type metadata for FrameOperationType;
}

uint64_t sub_21F06CEC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_21F06CED0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_21F06CF04()
{
  swift_release();
  return swift_release();
}

uint64_t sub_21F06CF40(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_21F06CF90(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_21F06D00C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_21F06D064(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
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

uint64_t sub_21F06D0C0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t type metadata accessor for FrameOperation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for AnyChildCompletion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnyChildCompletion);
}

uint64_t dispatch thunk of AnyChildCompletion.__allocating_init<A, B>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AnyChildCompletion.completion<A>(controller:exitValue:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t sub_21F06D17C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_21F06D1D4(a1, a2, a3);
  return v6;
}

uint64_t sub_21F06D1D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = qword_26AD3D0A0;
  *(void *)(v3 + v7) = dispatch_semaphore_create(0);
  uint64_t v8 = qword_26AD3D0A8;
  *(void *)(v3 + v8) = dispatch_semaphore_create(0);
  uint64_t v9 = qword_26AD3D098;
  *(void *)(v3 + v9) = dispatch_semaphore_create(0);
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  uint64_t v10 = v3 + qword_26AD3D0B0;
  uint64_t v11 = sub_21F077E60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, a3, v11);
  *(unsigned char *)(v3 + qword_26AD3D090) = 0;
  return v3;
}

uint64_t sub_21F06D2A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v65 = a2;
  uint64_t v66 = a3;
  uint64_t v64 = a1;
  v69 = a4;
  uint64_t v6 = sub_21F077ED0();
  uint64_t v67 = *(void *)(v6 - 8);
  uint64_t v68 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v62 - v10;
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_21F077E40();
  __swift_project_value_buffer(v12, (uint64_t)qword_26AD3D078);
  swift_retain_n();
  uint64_t v13 = sub_21F077E30();
  os_log_type_t v14 = sub_21F078100();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v63 = v9;
    uint64_t v17 = v16;
    uint64_t v71 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    unint64_t v18 = sub_21F069964();
    uint64_t v70 = sub_21F07428C(v18, v19, &v71);
    sub_21F0781E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F067000, v13, v14, "FlowFrameRuntime MegaFrame.onInput. %s", v15, 0xCu);
    swift_arrayDestroy();
    uint64_t v9 = v63;
    MEMORY[0x223C41CC0](v17, -1, -1);
    MEMORY[0x223C41CC0](v15, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v20 = qword_26AD3D090;
  if (*(unsigned char *)(v4 + qword_26AD3D090) == 1)
  {
    uint64_t v21 = sub_21F077E30();
    os_log_type_t v22 = sub_21F078100();
    if (os_log_type_enabled(v21, v22))
    {
      char v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v23 = 0;
      _os_log_impl(&dword_21F067000, v21, v22, "MegaFrame.onInput Cancelled before.", v23, 2u);
      MEMORY[0x223C41CC0](v23, -1, -1);
    }

    uint64_t v71 = 0;
    unint64_t v72 = 0xE000000000000000;
    sub_21F078230();
    uint64_t v24 = *(void *)(v5 + 16);
    uint64_t v26 = *(void *)(v24 + 96);
    unint64_t v25 = *(void *)(v24 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v71 = v26;
    unint64_t v72 = v25;
    sub_21F077F70();
    uint64_t v27 = v71;
    unint64_t v28 = v72;
    sub_21F076788();
    uint64_t result = swift_allocError();
    uint64_t v30 = result;
    *uint64_t v31 = v27;
    v31[1] = v28;
    goto LABEL_22;
  }
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = 0;
  *(unsigned char *)(v32 + 24) = -1;
  uint64_t v33 = *(void *)(v4 + 16);
  uint64_t v34 = (void *)swift_allocObject();
  uint64_t v35 = v66;
  v34[2] = v66;
  v34[3] = v5;
  v34[4] = v32;
  swift_retain();
  swift_retain();
  uint64_t v66 = v33;
  sub_21F0696CC(v64, v65, (uint64_t)sub_21F076A58, (uint64_t)v34, v35);
  swift_release();
  uint64_t v36 = sub_21F077E30();
  os_log_type_t v37 = sub_21F078100();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v38 = 0;
    _os_log_impl(&dword_21F067000, v36, v37, "FlowFrameRuntime MegaFrame.onInput wait.", v38, 2u);
    MEMORY[0x223C41CC0](v38, -1, -1);
  }

  sub_21F077EC0();
  MEMORY[0x223C413D0](v9, v5 + qword_26AD3D0B0);
  unint64_t v39 = *(void (**)(char *, uint64_t))(v67 + 8);
  v40 = v9;
  uint64_t v41 = v68;
  v39(v40, v68);
  sub_21F078180();
  v39(v11, v41);
  if (sub_21F077E70())
  {
    v42 = sub_21F077E30();
    os_log_type_t v43 = sub_21F078100();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_21F067000, v42, v43, "FlowFrameRuntime MegaFrame.onInput wait timeout.", v44, 2u);
      MEMORY[0x223C41CC0](v44, -1, -1);
    }

    uint64_t v71 = 0;
    unint64_t v72 = 0xE000000000000000;
    sub_21F078230();
    uint64_t v46 = *(void *)(v66 + 96);
    unint64_t v45 = *(void *)(v66 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v71 = v46;
    unint64_t v72 = v45;
    sub_21F077F70();
    uint64_t v47 = v71;
    unint64_t v48 = v72;
    sub_21F07520C();
  }
  else
  {
    if (*(unsigned char *)(v5 + v20) != 1)
    {
      swift_beginAccess();
      int v57 = *(unsigned __int8 *)(v32 + 24);
      if (v57 != 255)
      {
        uint64_t v30 = *(void *)(v32 + 16);
        char v55 = v57 & 1;
        sub_21F076544(v30, v57 & 1);
        uint64_t result = swift_release();
        goto LABEL_23;
      }
      v58 = sub_21F077E30();
      os_log_type_t v59 = sub_21F078100();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_21F067000, v58, v59, "MegaFrame.onInput result not set.", v60, 2u);
        MEMORY[0x223C41CC0](v60, -1, -1);
      }

      sub_21F06A8E8();
      uint64_t v30 = swift_allocError();
      void *v61 = 0xD000000000000020;
      v61[1] = 0x800000021F0796D0;
      goto LABEL_21;
    }
    uint64_t v49 = sub_21F077E30();
    os_log_type_t v50 = sub_21F078100();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_21F067000, v49, v50, "FlowFrameRuntime MegaFrame.onInput Cancelled after.", v51, 2u);
      MEMORY[0x223C41CC0](v51, -1, -1);
    }

    uint64_t v71 = 0;
    unint64_t v72 = 0xE000000000000000;
    sub_21F078230();
    uint64_t v53 = *(void *)(v66 + 96);
    unint64_t v52 = *(void *)(v66 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v71 = v53;
    unint64_t v72 = v52;
    sub_21F077F70();
    uint64_t v47 = v71;
    unint64_t v48 = v72;
    sub_21F076788();
  }
  uint64_t v30 = swift_allocError();
  uint64_t *v54 = v47;
  v54[1] = v48;
LABEL_21:
  uint64_t result = swift_release();
LABEL_22:
  char v55 = 1;
LABEL_23:
  v56 = v69;
  uint64_t *v69 = v30;
  *((unsigned char *)v56 + 8) = v55;
  return result;
}

uint64_t sub_21F06DA7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)a1;
  char v5 = *(unsigned char *)(a1 + 8);
  swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 24) != 255) {
    sub_21F07499C(0x7475706E496E6FLL, 0xE700000000000000);
  }
  swift_beginAccess();
  uint64_t v6 = *(void *)(a3 + 16);
  int v7 = *(unsigned __int8 *)(a3 + 24);
  if (v7 == 255)
  {
    sub_21F076544(v4, v5);
  }
  else
  {
    char v5 = v7 & 1;
    uint64_t v4 = *(void *)(a3 + 16);
  }
  swift_beginAccess();
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(a3 + 16) = v4;
  unsigned __int8 v9 = *(unsigned char *)(a3 + 24);
  *(unsigned char *)(a3 + 24) = v5;
  sub_21F076A64(v6, v7);
  sub_21F076A7C(v8, v9);
  return sub_21F0781A0();
}

uint64_t sub_21F06DBB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v64 = a1;
  uint64_t v65 = a2;
  uint64_t v68 = a3;
  uint64_t v5 = sub_21F077ED0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v66 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v67 = (char *)&v63 - v9;
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_21F077E40();
  __swift_project_value_buffer(v10, (uint64_t)qword_26AD3D078);
  swift_retain_n();
  uint64_t v11 = sub_21F077E30();
  os_log_type_t v12 = sub_21F078100();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v63 = v6;
    uint64_t v15 = v14;
    uint64_t v71 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    unint64_t v16 = sub_21F069964();
    v69[0] = sub_21F07428C(v16, v17, &v71);
    sub_21F0781E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F067000, v11, v12, "FlowFrameRuntime MegaFrame.execute. %s", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v6 = v63;
    MEMORY[0x223C41CC0](v15, -1, -1);
    MEMORY[0x223C41CC0](v13, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v18 = qword_26AD3D090;
  if (*(unsigned char *)(v3 + qword_26AD3D090) != 1)
  {
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = 0u;
    uint64_t v31 = v30 + 16;
    *(_OWORD *)(v30 + 32) = 0u;
    *(unsigned char *)(v30 + 48) = -1;
    uint64_t v32 = *(void *)(v3 + 16);
    uint64_t v33 = (void *)swift_allocObject();
    uint64_t v34 = v65;
    v33[2] = v65;
    v33[3] = v4;
    v33[4] = v30;
    swift_retain();
    uint64_t v63 = v30;
    swift_retain();
    uint64_t v65 = v32;
    sub_21F06977C(v64, (uint64_t)sub_21F07688C, (uint64_t)v33, v34);
    swift_release();
    uint64_t v35 = sub_21F077E30();
    os_log_type_t v36 = sub_21F078100();
    if (os_log_type_enabled(v35, v36))
    {
      os_log_type_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v37 = 0;
      _os_log_impl(&dword_21F067000, v35, v36, "FlowFrameRuntime MegaFrame.execute wait.", v37, 2u);
      MEMORY[0x223C41CC0](v37, -1, -1);
    }

    uint64_t v38 = v66;
    sub_21F077EC0();
    unint64_t v39 = v67;
    MEMORY[0x223C413D0](v38, v4 + qword_26AD3D0B0);
    v40 = *(void (**)(char *, uint64_t))(v6 + 8);
    v40(v38, v5);
    sub_21F078180();
    v40(v39, v5);
    if (sub_21F077E70())
    {
      uint64_t v41 = sub_21F077E30();
      os_log_type_t v42 = sub_21F078100();
      if (os_log_type_enabled(v41, v42))
      {
        os_log_type_t v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v43 = 0;
        _os_log_impl(&dword_21F067000, v41, v42, "FlowFrameRuntime MegaFrame.execute wait timeout.", v43, 2u);
        MEMORY[0x223C41CC0](v43, -1, -1);
      }

      uint64_t v71 = 0;
      unint64_t v72 = 0xE000000000000000;
      sub_21F078230();
      uint64_t v45 = *(void *)(v65 + 96);
      unint64_t v44 = *(void *)(v65 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v71 = v45;
      unint64_t v72 = v44;
      sub_21F077F70();
      uint64_t v46 = v71;
      unint64_t v47 = v72;
      sub_21F07520C();
    }
    else
    {
      int v48 = *(unsigned __int8 *)(v4 + v18);
      uint64_t v49 = sub_21F077E30();
      os_log_type_t v50 = sub_21F078100();
      BOOL v51 = os_log_type_enabled(v49, v50);
      if (v48 != 1)
      {
        if (v51)
        {
          v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v58 = 0;
          _os_log_impl(&dword_21F067000, v49, v50, "FlowFrameRuntime MegaFrame.execute wait complete.", v58, 2u);
          MEMORY[0x223C41CC0](v58, -1, -1);
        }

        swift_beginAccess();
        sub_21F076898(v31, (uint64_t)v69, &qword_267EBA330);
        if (v70 != 255)
        {
          sub_21F0768FC((uint64_t)v69, (uint64_t)&v71);
          sub_21F0768FC((uint64_t)&v71, (uint64_t)v68);
          return swift_release();
        }
        sub_21F06A88C((uint64_t)v69, &qword_267EBA330);
        os_log_type_t v59 = sub_21F077E30();
        os_log_type_t v60 = sub_21F078100();
        if (os_log_type_enabled(v59, v60))
        {
          v61 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v61 = 0;
          _os_log_impl(&dword_21F067000, v59, v60, "MegaFrame.execute result not set.", v61, 2u);
          MEMORY[0x223C41CC0](v61, -1, -1);
        }

        sub_21F06A8E8();
        uint64_t v55 = swift_allocError();
        *uint64_t v62 = 0xD000000000000020;
        v62[1] = 0x800000021F079650;
LABEL_21:
        int v57 = v68;
        *uint64_t v68 = v55;
        *((unsigned char *)v57 + 32) = 1;
        return swift_release();
      }
      if (v51)
      {
        unint64_t v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v52 = 0;
        _os_log_impl(&dword_21F067000, v49, v50, "FlowFrameRuntime MegaFrame.execute Cancelled after.", v52, 2u);
        MEMORY[0x223C41CC0](v52, -1, -1);
      }

      uint64_t v71 = 0;
      unint64_t v72 = 0xE000000000000000;
      sub_21F078230();
      uint64_t v54 = *(void *)(v65 + 96);
      unint64_t v53 = *(void *)(v65 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v71 = v54;
      unint64_t v72 = v53;
      sub_21F077F70();
      uint64_t v46 = v71;
      unint64_t v47 = v72;
      sub_21F076788();
    }
    uint64_t v55 = swift_allocError();
    uint64_t *v56 = v46;
    v56[1] = v47;
    goto LABEL_21;
  }
  unint64_t v19 = sub_21F077E30();
  os_log_type_t v20 = sub_21F078100();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_21F067000, v19, v20, "MegaFrame.execute Cancelled before.", v21, 2u);
    MEMORY[0x223C41CC0](v21, -1, -1);
  }

  uint64_t v71 = 0;
  unint64_t v72 = 0xE000000000000000;
  sub_21F078230();
  uint64_t v22 = *(void *)(v4 + 16);
  uint64_t v24 = *(void *)(v22 + 96);
  unint64_t v23 = *(void *)(v22 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v71 = v24;
  unint64_t v72 = v23;
  sub_21F077F70();
  uint64_t v25 = v71;
  unint64_t v26 = v72;
  sub_21F076788();
  uint64_t result = swift_allocError();
  *unint64_t v28 = v25;
  v28[1] = v26;
  uint64_t v29 = v68;
  *uint64_t v68 = result;
  *((unsigned char *)v29 + 32) = 1;
  return result;
}

uint64_t sub_21F06E418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  sub_21F076898(v4, (uint64_t)v9, &qword_267EBA330);
  int v5 = v9[32];
  sub_21F06A88C((uint64_t)v9, &qword_267EBA330);
  if (v5 != 255) {
    sub_21F07499C(0x65747563657865, 0xE700000000000000);
  }
  swift_beginAccess();
  sub_21F076898(v4, (uint64_t)v8, &qword_267EBA330);
  sub_21F076898(a1, (uint64_t)v7, &qword_267EBA1C8);
  if (v8[32] == 255)
  {
    sub_21F0768FC((uint64_t)v7, (uint64_t)v9);
    sub_21F06A88C((uint64_t)v8, &qword_267EBA330);
  }
  else
  {
    sub_21F06A88C((uint64_t)v7, &qword_267EBA1C8);
    sub_21F0768FC((uint64_t)v8, (uint64_t)v9);
  }
  swift_beginAccess();
  sub_21F076964((uint64_t)v9, v4);
  return sub_21F0781A0();
}

uint64_t sub_21F06E594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21F077E40();
  __swift_project_value_buffer(v8, (uint64_t)qword_26AD3D078);
  swift_retain_n();
  uint64_t v9 = sub_21F077E30();
  os_log_type_t v10 = sub_21F078100();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = a4;
    uint64_t v13 = a3;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v56 = v14;
    *(_DWORD *)uint64_t v11 = 136315138;
    unint64_t v15 = sub_21F069964();
    sub_21F07428C(v15, v16, &v56);
    sub_21F0781E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F067000, v9, v10, "FlowFrameRuntime MegaFrame.action. %s", v11, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v14;
    a3 = v13;
    a4 = v12;
    MEMORY[0x223C41CC0](v17, -1, -1);
    MEMORY[0x223C41CC0](v11, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v18 = qword_26AD3D090;
  if (*(unsigned char *)(v4 + qword_26AD3D090) == 1)
  {
    unint64_t v19 = sub_21F077E30();
    os_log_type_t v20 = sub_21F078100();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_21F067000, v19, v20, "MegaFrame.action Cancelled before.", v21, 2u);
      MEMORY[0x223C41CC0](v21, -1, -1);
    }

    uint64_t v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    sub_21F078230();
    uint64_t v22 = *(void *)(v5 + 16);
    uint64_t v24 = *(void *)(v22 + 96);
    unint64_t v23 = *(void *)(v22 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v56 = v24;
    unint64_t v57 = v23;
    sub_21F077F70();
    uint64_t v25 = v56;
    unint64_t v26 = v57;
    sub_21F076788();
    uint64_t result = swift_allocError();
    *unint64_t v28 = v25;
    v28[1] = v26;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = 0;
    *(void *)a4 = result;
    *(void *)(a4 + 8) = 0;
    goto LABEL_21;
  }
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = 0u;
  *(_OWORD *)(v29 + 32) = 0u;
  *(unsigned char *)(v29 + 48) = -1;
  uint64_t v30 = *(void *)(v4 + 16);
  uint64_t v31 = (void *)swift_allocObject();
  v31[2] = a3;
  v31[3] = v4;
  v31[4] = v29;
  swift_retain();
  swift_retain();
  sub_21F06981C(a1, a2, (uint64_t)sub_21F07672C, (uint64_t)v31, a3);
  swift_release();
  uint64_t v32 = sub_21F077E30();
  os_log_type_t v33 = sub_21F078100();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_21F067000, v32, v33, "FlowFrameRuntime MegaFrame.action wait.", v34, 2u);
    MEMORY[0x223C41CC0](v34, -1, -1);
  }

  sub_21F078190();
  if (*(unsigned char *)(v5 + v18) == 1)
  {
    uint64_t v35 = sub_21F077E30();
    os_log_type_t v36 = sub_21F078100();
    if (os_log_type_enabled(v35, v36))
    {
      os_log_type_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v37 = 0;
      _os_log_impl(&dword_21F067000, v35, v36, "MegaFrame.action Cancelled after.", v37, 2u);
      MEMORY[0x223C41CC0](v37, -1, -1);
    }

    uint64_t v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    sub_21F078230();
    uint64_t v39 = *(void *)(v30 + 96);
    unint64_t v38 = *(void *)(v30 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v56 = v39;
    unint64_t v57 = v38;
    sub_21F077F70();
    uint64_t v40 = v56;
    unint64_t v41 = v57;
    sub_21F076788();
    uint64_t v42 = swift_allocError();
    *os_log_type_t v43 = v40;
    v43[1] = v41;
LABEL_20:
    uint64_t result = swift_release();
    *(void *)a4 = v42;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = 0;
LABEL_21:
    *(unsigned char *)(a4 + 32) = 1;
    return result;
  }
  swift_beginAccess();
  int v44 = *(unsigned __int8 *)(v29 + 48);
  if (v44 == 255)
  {
    uint64_t v45 = sub_21F077E30();
    os_log_type_t v46 = sub_21F078100();
    if (os_log_type_enabled(v45, v46))
    {
      unint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v47 = 0;
      _os_log_impl(&dword_21F067000, v45, v46, "MegaFrame.action result not set.", v47, 2u);
      MEMORY[0x223C41CC0](v47, -1, -1);
    }

    sub_21F06A8E8();
    uint64_t v42 = swift_allocError();
    *int v48 = 0xD00000000000001FLL;
    v48[1] = 0x800000021F0795D0;
    goto LABEL_20;
  }
  uint64_t v50 = *(void *)(v29 + 32);
  uint64_t v49 = *(void *)(v29 + 40);
  char v51 = v44 & 1;
  uint64_t v53 = *(void *)(v29 + 16);
  uint64_t v52 = *(void *)(v29 + 24);
  sub_21F076738(v53, v52, v50, v49, v44 & 1);
  uint64_t result = swift_release();
  *(void *)a4 = v53;
  *(void *)(a4 + 8) = v52;
  *(void *)(a4 + 16) = v50;
  *(void *)(a4 + 24) = v49;
  *(unsigned char *)(a4 + 32) = v51;
  return result;
}

uint64_t sub_21F06EBA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 48) != 255) {
    sub_21F07499C(0x6E6F69746361, 0xE600000000000000);
  }
  swift_beginAccess();
  int v9 = *(unsigned __int8 *)(a3 + 48);
  uint64_t v20 = *(void *)(a3 + 24);
  uint64_t v21 = *(void *)(a3 + 16);
  uint64_t v18 = *(void *)(a3 + 40);
  uint64_t v19 = *(void *)(a3 + 32);
  if (v9 == 255)
  {
    sub_21F076738(v4, v5, v7, v6, v8);
    char v17 = v8;
    uint64_t v10 = v4;
  }
  else
  {
    char v17 = v9 & 1;
    uint64_t v10 = *(void *)(a3 + 16);
    uint64_t v5 = *(void *)(a3 + 24);
    uint64_t v7 = *(void *)(a3 + 32);
    uint64_t v6 = *(void *)(a3 + 40);
  }
  swift_beginAccess();
  uint64_t v12 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(a3 + 24);
  uint64_t v14 = *(void *)(a3 + 32);
  uint64_t v13 = *(void *)(a3 + 40);
  *(void *)(a3 + 16) = v10;
  *(void *)(a3 + 24) = v5;
  *(void *)(a3 + 32) = v7;
  *(void *)(a3 + 40) = v6;
  unsigned __int8 v15 = *(unsigned char *)(a3 + 48);
  *(unsigned char *)(a3 + 48) = v17;
  sub_21F0767DC(v21, v20, v19, v18, v9);
  sub_21F076808(v12, v11, v14, v13, v15);
  return sub_21F0781A0();
}

uint64_t sub_21F06ED38(uint64_t a1, uint64_t a2)
{
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21F077E40();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AD3D078);
  swift_retain_n();
  uint64_t v5 = sub_21F077E30();
  os_log_type_t v6 = sub_21F078100();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    unint64_t v9 = sub_21F069964();
    sub_21F07428C(v9, v10, &v12);
    sub_21F0781E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F067000, v5, v6, "FlowFrameRuntime MegaFrame.exit. %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C41CC0](v8, -1, -1);
    MEMORY[0x223C41CC0](v7, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return sub_21F0698CC(a1, a2);
}

uint64_t sub_21F06EF20()
{
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21F077E40();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AD3D078);
  swift_retain_n();
  uint64_t v2 = sub_21F077E30();
  os_log_type_t v3 = sub_21F078100();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    unint64_t v6 = sub_21F069964();
    sub_21F07428C(v6, v7, &v9);
    sub_21F0781E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F067000, v2, v3, "FlowFrameRuntime MegaFrame.cancel. %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C41CC0](v5, -1, -1);
    MEMORY[0x223C41CC0](v4, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  *(unsigned char *)(v0 + qword_26AD3D090) = 1;
  sub_21F0781A0();
  sub_21F0781A0();
  return sub_21F0781A0();
}

uint64_t sub_21F06F108()
{
  return 0;
}

uint64_t sub_21F06F2C8()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0 + qword_26AD3D0B0;
  uint64_t v2 = sub_21F077E60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t sub_21F06F36C()
{
  return sub_21F0741EC((void (*)(void))sub_21F06F2C8);
}

uint64_t sub_21F06F384()
{
  return sub_21F06F108();
}

uint64_t sub_21F06F3A8(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t sub_21F06F3B0()
{
  uint64_t v0 = sub_21F076BC0();
  return MEMORY[0x270FA0228](v0, 41, 7);
}

uint64_t sub_21F06F3E0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_21F06F4CC(a1);
  *a2 = v4;
  a2[1] = v5;
  uint64_t Strong = swift_weakLoadStrong();
  sub_21F06F4CC(Strong);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  swift_release();
  a2[2] = v8;
  a2[3] = v10;
  uint64_t v11 = *(void **)(*(void *)(a1 + 16) + 16);
  uint64_t v12 = v11[3];
  a2[4] = v11[2];
  a2[5] = v12;
  uint64_t v13 = v11[13];
  a2[6] = v11[12];
  a2[7] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a2[8] = sub_21F06F590();
  type metadata accessor for InstrumentedCancellableStack.TrackedFrame();
  sub_21F077E20();
  return swift_release();
}

uint64_t sub_21F06F4CC(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  swift_retain();
  uint64_t v1 = sub_21F077F20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA318);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = MEMORY[0x263F8E970];
  *(_OWORD *)(v2 + 16) = xmmword_21F078E20;
  uint64_t v4 = MEMORY[0x263F8E9C0];
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 32) = v1;
  sub_21F077F40();
  swift_release();
  return v1;
}

uint64_t sub_21F06F590()
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = sub_21F06F590();
    swift_release();
    uint64_t result = v1 + 1;
    if (__OFADD__(v1, 1)) {
      __break(1u);
    }
  }
  return result;
}

BOOL sub_21F06F5D8()
{
  type metadata accessor for InstrumentedCancellableStack.TrackedFrame();
  uint64_t v0 = sub_21F06F630();
  return v0 == sub_21F06F630();
}

uint64_t sub_21F06F630()
{
  return sub_21F0783A0();
}

uint64_t sub_21F06F678()
{
  swift_bridgeObjectRetain();
  sub_21F077F60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F06F6D0()
{
  uint64_t v1 = v0;
  unint64_t v3 = v0[4];
  unint64_t v2 = v0[5];
  swift_bridgeObjectRetain();
  sub_21F077F70();
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  swift_bridgeObjectRetain();
  sub_21F077F70();
  swift_bridgeObjectRelease();
  char v6 = sub_21F06F8D8(0, v3, v2);
  swift_bridgeObjectRelease();
  sub_21F078160();
  if (qword_26AD3CD00 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA318);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21F078E30;
  uint64_t v8 = MEMORY[0x263F8D310];
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  unint64_t v9 = sub_21F076600();
  *(void *)(v7 + 32) = v3;
  *(void *)(v7 + 40) = v2;
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = v9;
  *(void *)(v7 + 64) = v9;
  *(void *)(v7 + 72) = v5;
  *(void *)(v7 + 80) = v4;
  uint64_t v10 = v1[8];
  uint64_t v11 = MEMORY[0x263F8D750];
  *(void *)(v7 + 136) = MEMORY[0x263F8D6C8];
  *(void *)(v7 + 144) = v11;
  *(void *)(v7 + 112) = v10;
  uint64_t v12 = *v1;
  uint64_t v13 = v1[1];
  *(void *)(v7 + 176) = v8;
  *(void *)(v7 + 184) = v9;
  *(void *)(v7 + 152) = v12;
  *(void *)(v7 + 160) = v13;
  uint64_t v14 = v1[2];
  uint64_t v15 = v1[3];
  *(void *)(v7 + 216) = v8;
  *(void *)(v7 + 224) = v9;
  uint64_t v16 = MEMORY[0x263F8E778];
  *(void *)(v7 + 192) = v14;
  *(void *)(v7 + 200) = v15;
  uint64_t v17 = MEMORY[0x263F8E7C0];
  *(void *)(v7 + 256) = v16;
  *(void *)(v7 + 264) = v17;
  *(unsigned char *)(v7 + 232) = -v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21F077DE0();
  return swift_bridgeObjectRelease();
}

unint64_t sub_21F06F8D8(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if ((a3 & 0x2000000000000000) != 0) {
    unint64_t v4 = HIBYTE(a3) & 0xF;
  }
  else {
    unint64_t v4 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return a1;
  }
  uint64_t v7 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v7) = 1;
  }
  uint64_t v8 = 4 << v7;
  uint64_t v16 = a3 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v14 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
  unint64_t v9 = 15;
  while (1)
  {
    unint64_t v10 = v9 & 0xC;
    unint64_t result = v9;
    if (v10 == v8) {
      unint64_t result = sub_21F074794(v9, a2, a3);
    }
    unint64_t v12 = result >> 16;
    if (result >> 16 >= v4) {
      break;
    }
    if ((a3 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_21F077FB0();
      int v13 = result;
      if (v10 != v8) {
        goto LABEL_20;
      }
    }
    else if ((a3 & 0x2000000000000000) != 0)
    {
      v15[0] = a2;
      v15[1] = v16;
      int v13 = *((unsigned __int8 *)v15 + v12);
      if (v10 != v8) {
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t result = v14;
      if ((a2 & 0x1000000000000000) == 0) {
        unint64_t result = sub_21F078260();
      }
      int v13 = *(unsigned __int8 *)(result + v12);
      if (v10 != v8)
      {
LABEL_20:
        if ((a3 & 0x1000000000000000) == 0) {
          goto LABEL_8;
        }
        goto LABEL_21;
      }
    }
    unint64_t result = sub_21F074794(v9, a2, a3);
    unint64_t v9 = result;
    if ((a3 & 0x1000000000000000) == 0)
    {
LABEL_8:
      unint64_t v9 = (v9 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_9;
    }
LABEL_21:
    if (v4 <= v9 >> 16) {
      goto LABEL_28;
    }
    unint64_t v9 = sub_21F077F90();
LABEL_9:
    a1 = (v13 + a1);
    if (4 * v4 == v9 >> 14) {
      return a1;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21F06FA70()
{
  sub_21F078150();
  if (qword_26AD3CD00 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA318);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_21F078E20;
  uint64_t v3 = *v0;
  uint64_t v2 = v0[1];
  *(void *)(v1 + 56) = MEMORY[0x263F8D310];
  *(void *)(v1 + 64) = sub_21F076600();
  *(void *)(v1 + 32) = v3;
  *(void *)(v1 + 40) = v2;
  swift_bridgeObjectRetain();
  sub_21F077DE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F06FB9C()
{
  return sub_21F0783A0();
}

BOOL sub_21F06FBE0()
{
  return sub_21F06F5D8();
}

uint64_t sub_21F06FBE8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F06FBF0()
{
  uint64_t v0 = type metadata accessor for InstrumentedCancellableStack.TrackedFrame();
  uint64_t v1 = sub_21F078040();
  if (MEMORY[0x223C41580](v1, v0))
  {
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v3 = sub_21F074D14(v1, v0, WitnessTable);
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
  }
  swift_bridgeObjectRelease();
  sub_21F070528(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_21F076BC0();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21F06FCB8()
{
  uint64_t v0 = sub_21F06FBF0();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_21F06FCE8()
{
  v7[2] = *(void *)(*(void *)v0 + 376);
  uint64_t v1 = type metadata accessor for InstrumentedCancellableStack();
  uint64_t v2 = (char *)type metadata accessor for InstrumentedCancellableStack.TrackedFrame();
  uint64_t WitnessTable = swift_getWitnessTable();
  v7[5] = sub_21F06FE2C((void (*)(char *, char *))sub_21F076654, (uint64_t)v7, v1, v2, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v4);
  sub_21F0780A0();
  swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v5 = sub_21F0780D0();
  sub_21F070528(v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F06FE2C(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  os_log_type_t v59 = a4;
  unint64_t v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v55 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v53 = (char *)&v40 - v13;
  uint64_t v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v41 = (char *)&v40 - v17;
  uint64_t v18 = sub_21F0781C0();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  char v51 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v40 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v50 = *((void *)v15 - 1);
  MEMORY[0x270FA5388](v26);
  unint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  uint64_t v52 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v30 = (char *)&v40 - v29;
  uint64_t v31 = sub_21F077FE0();
  uint64_t v61 = sub_21F0782A0();
  uint64_t v56 = sub_21F0782B0();
  sub_21F078280();
  (*(void (**)(char *, uint64_t, void))(v50 + 16))(v28, v48, v52);
  os_log_type_t v59 = v30;
  uint64_t result = sub_21F077FD0();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    os_log_type_t v33 = (uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
    uint64_t v34 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_21F0781D0();
      uint64_t result = (*v33)(v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v34)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v34)(v23, AssociatedTypeWitness);
      sub_21F078290();
      if (!--v31)
      {
        uint64_t v35 = v54;
        os_log_type_t v36 = v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v35 = v54;
  os_log_type_t v36 = v51;
LABEL_9:
  sub_21F0781D0();
  uint64_t v55 = *(char **)(v35 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
  {
    os_log_type_t v37 = v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    return v61;
  }
  else
  {
    uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v54 = v35 + 32;
    unint64_t v38 = (void (**)(char *, uint64_t))(v35 + 8);
    uint64_t v39 = v41;
    os_log_type_t v37 = v51;
    while (1)
    {
      v52(v39, v37, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_21F078290();
      sub_21F0781D0();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v37, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

uint64_t sub_21F070528(uint64_t a1)
{
  type metadata accessor for InstrumentedCancellableStack.TrackedFrame();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_21F0780B0();
  swift_bridgeObjectRelease();
  sub_21F0780C0();
  swift_getWitnessTable();
  sub_21F078010();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21F0780B0();
  sub_21F078010();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F0706CC()
{
  sub_21F076C00();
  return sub_21F06FCE8();
}

uint64_t *sub_21F0706F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1;
  uint64_t v2 = sub_21F076C30((uint64_t)&v4, a2);
  sub_21F06FCE8();
  return v2;
}

uint64_t *sub_21F070730(uint64_t a1)
{
  uint64_t v1 = sub_21F076D2C(a1);
  sub_21F06FCE8();
  return v1;
}

uint64_t sub_21F07075C(uint64_t a1)
{
  uint64_t v1 = sub_21F077C04(a1);
  swift_retain();
  sub_21F06FCE8();
  return v1;
}

void *sub_21F07078C()
{
  return sub_21F0707C0();
}

void *sub_21F0707C0()
{
  type metadata accessor for InstrumentedCancellableStack.TrackedFrame();
  swift_retain();
  swift_getWitnessTable();
  *(void *)(v0 + 48) = sub_21F077EF0();
  swift_release();
  *(unsigned char *)(v0 + 40) = 0;
  return sub_21F0775C0();
}

uint64_t *sub_21F07084C(uint64_t *a1, uint64_t a2)
{
  return sub_21F0706F4(*a1, a2);
}

uint64_t RuntimeConfiguration.perFrameOperationTimeout.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21F077E60();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t RuntimeConfiguration.init()@<X0>(void *a1@<X8>)
{
  *a1 = 300;
  uint64_t v2 = *MEMORY[0x263F8F018];
  uint64_t v3 = sub_21F077E60();
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t RuntimeConfiguration.init(perFrameOperationTimeout:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21F077E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t sub_21F0709A4(uint64_t a1)
{
  *(void *)(v1 + *(void *)(*(void *)v1 + 136)) = a1;
  return swift_release();
}

uint64_t sub_21F0709C8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v11 = *(uint64_t *)((char *)v0 + *(void *)(*v0 + 120));
  v8[1] = *(_OWORD *)(v2 + 80);
  uint64_t v9 = *(void *)(v1 + 96);
  uint64_t v3 = type metadata accessor for CancellableStack();
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v6 = sub_21F06FE2C((void (*)(char *, char *))sub_21F074960, (uint64_t)v8, v3, MEMORY[0x263F8D310], MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v5);
  swift_release();
  uint64_t v11 = 0x203A73656D617246;
  unint64_t v12 = 0xE90000000000005BLL;
  uint64_t v10 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA2E0);
  sub_21F075500(&qword_267EBA2E8, &qword_267EBA2E0);
  sub_21F077F10();
  swift_bridgeObjectRelease();
  sub_21F077F70();
  swift_bridgeObjectRelease();
  sub_21F077F70();
  return v11;
}

uint64_t sub_21F070B8C@<X0>(void *a1@<X8>)
{
  if (swift_weakLoadStrong())
  {
    v4[0] = 0;
    v4[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21F078230();
    sub_21F077F70();
    sub_21F077F70();
    swift_bridgeObjectRelease();
    sub_21F077F70();
    sub_21F077F70();
    swift_bridgeObjectRelease();
    sub_21F077F70();
    sub_21F077F70();
    swift_bridgeObjectRelease();
    sub_21F077F70();
    sub_21F077F70();
    swift_bridgeObjectRelease();
    sub_21F077F70();
    uint64_t result = swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21F078230();
    swift_bridgeObjectRelease();
    strcpy((char *)v4, "{namespace: ");
    BYTE5(v4[1]) = 0;
    HIWORD(v4[1]) = -5120;
    sub_21F077F70();
    swift_bridgeObjectRelease();
    sub_21F077F70();
    sub_21F077F70();
    swift_bridgeObjectRelease();
    uint64_t result = sub_21F077F70();
  }
  uint64_t v3 = v4[1];
  *a1 = v4[0];
  a1[1] = v3;
  return result;
}

char *FlowFrameRuntime.__allocating_init(frameFactoryLoader:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_allocObject();
  uint64_t v6 = sub_21F0750D0(a1, a2);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 88) - 8) + 8))(a1);
  return v6;
}

char *FlowFrameRuntime.init(frameFactoryLoader:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  uint64_t v5 = sub_21F0750D0(a1, a2);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v4 + 88) - 8) + 8))(a1);
  return v5;
}

void *sub_21F070F0C()
{
  return sub_21F0707C0();
}

uint64_t sub_21F070F48()
{
  uint64_t v0 = sub_21F077E60();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (uint64_t *)((char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_21F077ED0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - v9;
  sub_21F077EC0();
  void *v3 = 250;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F000], v0);
  MEMORY[0x223C413D0](v8, v3);
  (*(void (**)(void *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, v4);
  LOBYTE(v3) = sub_21F078180();
  v11(v10, v4);
  if ((v3 & 1) == 0) {
    return sub_21F0781A0();
  }
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_21F077E40();
  __swift_project_value_buffer(v13, (uint64_t)qword_26AD3D078);
  uint64_t v14 = sub_21F077E30();
  os_log_type_t v15 = sub_21F078110();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_21F067000, v14, v15, "FlowFrameRuntime is blocked: attempting to reset it.", v16, 2u);
    MEMORY[0x223C41CC0](v16, -1, -1);
  }

  return sub_21F071220();
}

uint64_t sub_21F071220()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F077E10();
  uint64_t v57 = *(void *)(v2 - 8);
  uint64_t v58 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v56 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21F077E60();
  uint64_t v68 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (uint64_t *)((char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v66 = sub_21F077ED0();
  uint64_t v7 = *(void *)(v66 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v66);
  uint64_t v64 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v65 = (char *)&v55 - v10;
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v63 = v7;
  uint64_t v11 = sub_21F077E40();
  uint64_t v67 = __swift_project_value_buffer(v11, (uint64_t)qword_26AD3D078);
  unint64_t v12 = sub_21F077E30();
  os_log_type_t v13 = sub_21F078100();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = v1;
    os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v15 = 0;
    _os_log_impl(&dword_21F067000, v12, v13, "FlowFrameRuntime reset, cancel stack.", v15, 2u);
    uint64_t v16 = v15;
    uint64_t v1 = v14;
    MEMORY[0x223C41CC0](v16, -1, -1);
  }

  *(unsigned char *)(*(void *)(v1 + *(void *)(*(void *)v1 + 120)) + 40) = 1;
  uint64_t v17 = *(void *)(v1 + *(void *)(*(void *)v1 + 112));
  uint64_t v18 = v64;
  sub_21F077EC0();
  *uint64_t v6 = 250;
  uint64_t v19 = v68;
  uint64_t v20 = *(void (**)(void))(v68 + 104);
  unsigned int v61 = *MEMORY[0x263F8F000];
  uint64_t v60 = (void (*)(void *, void, uint64_t))v20;
  v20(v6);
  uint64_t v21 = v65;
  MEMORY[0x223C413D0](v18, v6);
  uint64_t v22 = *(void (**)(void *, uint64_t))(v19 + 8);
  uint64_t v62 = v4;
  uint64_t v68 = v19 + 8;
  os_log_type_t v59 = v22;
  v22(v6, v4);
  unint64_t v23 = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v24 = v18;
  uint64_t v25 = v66;
  v23(v24, v66);
  uint64_t v63 = v17;
  sub_21F078180();
  v23(v21, v25);
  if ((sub_21F077E70() & 1) == 0) {
    goto LABEL_14;
  }
  uint64_t v26 = sub_21F077E30();
  os_log_type_t v27 = sub_21F078100();
  if (os_log_type_enabled(v26, v27))
  {
    unint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = v1;
    uint64_t v29 = v28;
    *(_WORD *)unint64_t v28 = 0;
    _os_log_impl(&dword_21F067000, v26, v27, "FlowFrameRuntime reset semaphone locked. Attempting cancel.", v28, 2u);
    uint64_t v30 = v29;
    uint64_t v1 = v55;
    MEMORY[0x223C41CC0](v30, -1, -1);
  }

  if (*(void *)(v1 + *(void *)(*(void *)v1 + 136)))
  {
    swift_retain();
    sub_21F06EF20();
    swift_release();
  }
  uint64_t v31 = v64;
  sub_21F077EC0();
  *uint64_t v6 = 250;
  uint64_t v32 = v62;
  v60(v6, v61, v62);
  os_log_type_t v33 = v65;
  MEMORY[0x223C413D0](v31, v6);
  v59(v6, v32);
  uint64_t v34 = v66;
  v23(v31, v66);
  sub_21F078180();
  v23(v33, v34);
  if (sub_21F077E70())
  {
    if (*(void *)(v1 + *(void *)(*(void *)v1 + 136)))
    {
      swift_retain_n();
      uint64_t v35 = sub_21F077E30();
      os_log_type_t v36 = sub_21F078110();
      if (os_log_type_enabled(v35, v36))
      {
        os_log_type_t v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        uint64_t v70 = v38;
        *(_DWORD *)os_log_type_t v37 = 136315138;
        uint64_t v39 = sub_21F06F108();
        uint64_t v69 = sub_21F07428C(v39, v40, &v70);
        sub_21F0781E0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21F067000, v35, v36, "'%s' is stuck on the stack! This flow may not have exited properly by calling its completion handler", v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C41CC0](v38, -1, -1);
        MEMORY[0x223C41CC0](v37, -1, -1);
        swift_release();
      }
      else
      {

        swift_release_n();
      }
    }
    uint64_t v50 = sub_21F077E30();
    os_log_type_t v51 = sub_21F078100();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl(&dword_21F067000, v50, v51, "FlowFrameRuntime reset semaphone locked. Unable to continue.", v52, 2u);
      MEMORY[0x223C41CC0](v52, -1, -1);
    }

    sub_21F078170();
    if (qword_26AD3CD00 != -1) {
      swift_once();
    }
    uint64_t v53 = v56;
    sub_21F077E00();
    sub_21F077DF0();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v58);
    sub_21F07520C();
    swift_allocError();
    void *v54 = 0xD000000000000029;
    v54[1] = 0x800000021F079440;
    swift_willThrow();
    return sub_21F0781A0();
  }
  else
  {
LABEL_14:
    unint64_t v41 = sub_21F077E30();
    os_log_type_t v42 = sub_21F078100();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_21F067000, v41, v42, "FlowFrameRuntime reset, clear stack.", v43, 2u);
      MEMORY[0x223C41CC0](v43, -1, -1);
    }

    uint64_t v44 = *(void (**)(uint64_t))(**(void **)(v1 + *(void *)(*(void *)v1 + 120)) + 200);
    uint64_t v45 = swift_retain();
    v44(v45);
    swift_release();
    uint64_t v46 = sub_21F077E30();
    os_log_type_t v47 = sub_21F078100();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_21F067000, v46, v47, "FlowFrameRuntime reset finished.", v48, 2u);
      MEMORY[0x223C41CC0](v48, -1, -1);
    }

    return sub_21F0781A0();
  }
}

uint64_t sub_21F071B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v37 = a3;
  uint64_t v38 = a1;
  uint64_t v35 = a2;
  uint64_t v39 = *v3;
  uint64_t v5 = v39;
  uint64_t v6 = sub_21F077E80();
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  MEMORY[0x270FA5388](v6);
  os_log_type_t v42 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_21F077EB0();
  uint64_t v41 = *(void *)(v43 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v43);
  unint64_t v40 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v5 + 80);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v36 = (char *)&v35 - v13;
  uint64_t v14 = sub_21F077E90();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_21F077E40();
  __swift_project_value_buffer(v18, (uint64_t)qword_26AD3D078);
  uint64_t v19 = sub_21F077E30();
  os_log_type_t v20 = sub_21F078100();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_21F067000, v19, v20, "FlowFrameRuntime handle.", v21, 2u);
    MEMORY[0x223C41CC0](v21, -1, -1);
  }

  uint64_t v22 = (uint64_t (*)(uint64_t))swift_allocObject();
  uint64_t v23 = v35;
  *((void *)v22 + 2) = v4;
  *((void *)v22 + 3) = v23;
  *((void *)v22 + 4) = v37;
  *(unsigned char *)(*(void *)((char *)v4 + *(void *)(*v4 + 120)) + 40) = 1;
  sub_21F0752FC();
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F8F060], v14);
  swift_retain();
  swift_retain();
  uint64_t v24 = (void *)sub_21F078140();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v25 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v36, v38, v10);
  unint64_t v26 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  os_log_type_t v27 = (char *)swift_allocObject();
  *((void *)v27 + 2) = v10;
  uint64_t v28 = v39;
  *((void *)v27 + 3) = *(void *)(v39 + 88);
  *((void *)v27 + 4) = *(void *)(v28 + 96);
  *((void *)v27 + 5) = v4;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v27[v26], v25, v10);
  uint64_t v29 = (uint64_t (**)(uint64_t))&v27[(v12 + v26 + 7) & 0xFFFFFFFFFFFFFFF8];
  *uint64_t v29 = sub_21F0752A0;
  v29[1] = v22;
  aBlock[4] = sub_21F075420;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F0724E0;
  aBlock[3] = &block_descriptor;
  uint64_t v30 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  uint64_t v31 = v40;
  sub_21F077EA0();
  uint64_t v46 = MEMORY[0x263F8EE78];
  sub_21F0754A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA308);
  sub_21F075500(&qword_267EBA310, &qword_267EBA308);
  uint64_t v32 = v42;
  uint64_t v33 = v45;
  sub_21F078200();
  MEMORY[0x223C41620](0, v31, v32, v30);
  _Block_release(v30);
  swift_release();

  (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v31, v43);
  return swift_release();
}

uint64_t sub_21F072104(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *), uint64_t a4)
{
  uint64_t v8 = *(void *)(*(void *)a1 + 80);
  uint64_t v32 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v27 - v9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EBA1C0);
  uint64_t v11 = sub_21F0783B0();
  uint64_t v33 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v27 - v12);
  sub_21F078190();
  *(unsigned char *)(*(void *)(a1 + *(void *)(*(void *)a1 + 120)) + 40) = 0;
  uint64_t v14 = sub_21F072524(a2);
  uint64_t v15 = v14;
  if (v16)
  {
    *uint64_t v13 = v14;
    swift_storeEnumTagMultiPayload();
    MEMORY[0x223C41B20](v15);
    a3(v13);
    uint64_t v19 = v15;
    char v20 = 1;
    goto LABEL_5;
  }
  uint64_t v28 = a2;
  uint64_t v29 = v11;
  uint64_t v30 = a4;
  uint64_t v31 = a3;
  uint64_t v34 = v14;
  type metadata accessor for MegaFrame();
  type metadata accessor for Node();
  sub_21F0780A0();
  swift_getWitnessTable();
  if (sub_21F0780F0())
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v10, v28, v8);
    type metadata accessor for NonUnderstanding();
    swift_getWitnessTable();
    uint64_t v17 = swift_allocError();
    sub_21F06A9E4(0xD000000000000024, 0x800000021F079780, (uint64_t)v10, v8, v18);
    *uint64_t v13 = v17;
    uint64_t v11 = v29;
    swift_storeEnumTagMultiPayload();
    v31(v13);
    uint64_t v19 = v15;
    char v20 = 0;
LABEL_5:
    sub_21F076A94(v19, v20);
    uint64_t v21 = v33;
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v21 + 8))(v13, v11);
  }
  uint64_t v23 = sub_21F0732BC(v15);
  uint64_t v24 = v31;
  uint64_t v11 = v29;
  uint64_t v21 = v33;
  if (v25)
  {
    uint64_t v26 = v23;
    *uint64_t v13 = v23;
    swift_storeEnumTagMultiPayload();
    MEMORY[0x223C41B20](v26);
    v24(v13);
    sub_21F076A94(v15, 0);
    sub_21F076550(v26, 1);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v32 + 16))(v13, v28, v8);
    swift_storeEnumTagMultiPayload();
    v24(v13);
    sub_21F076A94(v15, 0);
  }
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v21 + 8))(v13, v11);
}

uint64_t sub_21F0724E0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_21F072524(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v83 = *v1;
  uint64_t v72 = sub_21F077E60();
  uint64_t v71 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  v73 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for RuntimeConfiguration();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v70 = (uint64_t)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = type metadata accessor for MegaFrame();
  uint64_t v7 = type metadata accessor for Node();
  uint64_t v91 = sub_21F078040();
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21F077E40();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26AD3D078);
  swift_retain();
  uint64_t v79 = v9;
  uint64_t v10 = sub_21F077E30();
  os_log_type_t v11 = sub_21F078100();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v84 = a1;
  if (v12)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134217984;
    v87[0] = *(void *)(*(void *)((char *)v2 + *(void *)(*v2 + 120)) + 32);
    sub_21F0781E0();
    swift_release();
    _os_log_impl(&dword_21F067000, v10, v11, "FlowFrameRuntime onInput. Stack size %ld", v13, 0xCu);
    MEMORY[0x223C41CC0](v13, -1, -1);
  }
  else
  {

    swift_release();
  }
  uint64_t v90 = sub_21F076BF8();
  v82 = (char *)v2 + *(void *)(*v2 + 104);
  uint64_t v14 = type metadata accessor for NodeIterator();
  uint64_t v15 = sub_21F0772E0();
  if (v15)
  {
    uint64_t v17 = v15;
    v75 = &v86;
    uint64_t v81 = MEMORY[0x263F8EE58] + 8;
    *(void *)&long long v16 = 136315138;
    long long v74 = v16;
    uint64_t v80 = v14;
    do
    {
      if ((*(unsigned char *)(*(void *)((char *)v2 + *(void *)(*v2 + 120)) + 40) & 1) != 0
        || (v87[0] = v91, sub_21F0780A0(), swift_getWitnessTable(), (sub_21F0780F0() & 1) == 0))
      {
        swift_release();
      }
      else
      {
        uint64_t v18 = v7;
        uint64_t v19 = *(void *)(*(void *)(v17 + 16) + 16);
        uint64_t v20 = *(void *)(v19 + 16);
        uint64_t v21 = *(void *)(v19 + 24);
        uint64_t v23 = *(void *)(v83 + 88);
        uint64_t v22 = *(void *)(v83 + 96);
        uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 16);
        swift_bridgeObjectRetain();
        v24(v20, v21, v23, v22);
        swift_bridgeObjectRelease();
        sub_21F06B4DC();
        *(void *)((char *)v2 + *(void *)(*v2 + 136)) = *(void *)(v17 + 16);
        swift_retain();
        swift_release();
        swift_retain();
        sub_21F06D2A4((uint64_t)v87, v84, v81, &v88);
        swift_release();
        uint64_t v25 = v88;
        LOBYTE(v20) = v89;
        *(void *)((char *)v2 + *(void *)(*v2 + 136)) = 0;
        swift_release();
        if (v20)
        {
          swift_release();
          swift_release();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v87);
          swift_release();
          swift_bridgeObjectRelease();
          return v25;
        }
        if (v25)
        {
          swift_release();
        }
        else
        {
          swift_retain_n();
          uint64_t v26 = sub_21F077E30();
          os_log_type_t v27 = sub_21F078100();
          if (os_log_type_enabled(v26, v27))
          {
            uint64_t v28 = (uint8_t *)swift_slowAlloc();
            uint64_t v77 = swift_slowAlloc();
            uint64_t v88 = v77;
            *(_DWORD *)uint64_t v28 = v74;
            v76 = v28 + 4;
            uint64_t v29 = sub_21F06F108();
            uint64_t v85 = sub_21F07428C(v29, v30, &v88);
            sub_21F0781E0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21F067000, v26, v27, "FlowFrameRuntime found Understandable frame. %s", v28, 0xCu);
            uint64_t v31 = v77;
            swift_arrayDestroy();
            MEMORY[0x223C41CC0](v31, -1, -1);
            MEMORY[0x223C41CC0](v28, -1, -1);
          }
          else
          {

            swift_release_n();
          }
          uint64_t v88 = v17;
          swift_retain();
          sub_21F078070();
          swift_release();
        }
        swift_release();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v87);
        uint64_t v7 = v18;
      }
      uint64_t v17 = sub_21F0772E0();
    }
    while (v17);
  }
  swift_release();
  v87[0] = v91;
  sub_21F0780A0();
  swift_getWitnessTable();
  if (sub_21F0780F0() & 1) == 0 || (*(unsigned char *)(*(void *)((char *)v2 + *(void *)(*v2 + 120)) + 40)) {
    return v91;
  }
  BOOL v32 = sub_21F076BE8();
  uint64_t v33 = v84;
  if (!v32)
  {
    uint64_t v34 = sub_21F077E30();
    os_log_type_t v35 = sub_21F078100();
    if (os_log_type_enabled(v34, v35))
    {
      os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v36 = 0;
      _os_log_impl(&dword_21F067000, v34, v35, "FlowFrameRuntime found no frames supporting input. Clearing existing stack frames.", v36, 2u);
      MEMORY[0x223C41CC0](v36, -1, -1);
    }

    uint64_t v37 = *(void (**)(uint64_t))(**(void **)((char *)v2 + *(void *)(*v2 + 120)) + 200);
    uint64_t v38 = swift_retain();
    v37(v38);
    swift_release();
  }
  if (!(*(uint64_t (**)(uint64_t, void))(*(void *)(v83 + 96) + 24))(v33, *(void *)(v83 + 88)))
  {
    uint64_t v55 = sub_21F077E30();
    os_log_type_t v56 = sub_21F078110();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl(&dword_21F067000, v55, v56, "FlowFrameRuntime frameFactoryLoader.loadFactory failed.", v57, 2u);
      MEMORY[0x223C41CC0](v57, -1, -1);
    }

    return v91;
  }
  uint64_t v39 = sub_21F06BB10();
  if (!v39)
  {
    uint64_t v58 = sub_21F077E30();
    os_log_type_t v59 = sub_21F078110();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v60 = 0;
      _os_log_impl(&dword_21F067000, v58, v59, "FlowFrameRuntime factory.makeFrameAbleToHandle failed.", v60, 2u);
      MEMORY[0x223C41CC0](v60, -1, -1);
    }

    goto LABEL_50;
  }
  uint64_t v40 = v39;
  uint64_t v41 = sub_21F077E30();
  os_log_type_t v42 = sub_21F078100();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v43 = 0;
    _os_log_impl(&dword_21F067000, v41, v42, "FlowFrameRuntime created frame to handle input.", v43, 2u);
    MEMORY[0x223C41CC0](v43, -1, -1);
  }

  uint64_t v44 = v70;
  sub_21F0764A8((uint64_t)v2 + *(void *)(*v2 + 128), v70);
  uint64_t v45 = (uint64_t)v73;
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v73, v44, v72);
  uint64_t v46 = swift_allocObject();
  uint64_t v47 = swift_retain();
  sub_21F06D1D4(v47, 0, v45);
  *(void *)((char *)v2 + *(void *)(*v2 + 136)) = v46;
  swift_retain();
  swift_release();
  sub_21F06B4DC();
  sub_21F06D2A4((uint64_t)v87, v33, MEMORY[0x263F8EE58] + 8, &v88);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v87);
  uint64_t v25 = v88;
  LODWORD(v45) = v89;
  *(void *)((char *)v2 + *(void *)(*v2 + 136)) = 0;
  swift_release();
  if (v45 != 1)
  {
    unsigned int v61 = sub_21F077E30();
    if (v25)
    {
      os_log_type_t v67 = sub_21F078110();
      if (os_log_type_enabled(v61, v67))
      {
        uint64_t v68 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v68 = 0;
        _os_log_impl(&dword_21F067000, v61, v67, "FlowFrameRuntime frame created handle input does not understand input.", v68, 2u);
        MEMORY[0x223C41CC0](v68, -1, -1);
        swift_release();
        swift_release();

LABEL_50:
        swift_release();
        return v91;
      }

      swift_release();
    }
    else
    {
      os_log_type_t v62 = sub_21F078100();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v63 = 0;
        _os_log_impl(&dword_21F067000, v61, v62, "FlowFrameRuntime frame created handle input understands input.", v63, 2u);
        MEMORY[0x223C41CC0](v63, -1, -1);
      }

      uint64_t v64 = *(void *)((char *)v2 + *(void *)(*v2 + 120));
      v87[0] = v46;
      uint64_t v65 = *(uint64_t (**)(uint64_t *, void))(*(void *)v64 + 208);
      swift_retain();
      uint64_t v66 = v65(v87, 0);
      swift_release();
      v87[0] = v66;
      swift_retain();
      sub_21F078070();
      swift_release();
      swift_release();
    }
    swift_release();
    goto LABEL_50;
  }
  sub_21F076544(v25, 1);
  MEMORY[0x223C41B20](v25);
  MEMORY[0x223C41B20](v25);
  uint64_t v48 = sub_21F077E30();
  os_log_type_t v49 = sub_21F078110();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    uint64_t v84 = v40;
    uint64_t v52 = v51;
    v87[0] = v51;
    *(_DWORD *)uint64_t v50 = 136315138;
    swift_getErrorValue();
    uint64_t v53 = sub_21F078330();
    uint64_t v88 = sub_21F07428C(v53, v54, v87);
    sub_21F0781E0();
    swift_bridgeObjectRelease();
    sub_21F076550(v25, 1);
    sub_21F076550(v25, 1);
    _os_log_impl(&dword_21F067000, v48, v49, "FlowFrameRuntime error calling onInput for new frame. %s", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C41CC0](v52, -1, -1);
    MEMORY[0x223C41CC0](v50, -1, -1);

    swift_release();
    sub_21F076550(v25, 1);
  }
  else
  {

    swift_release();
    sub_21F076550(v25, 1);
    sub_21F076550(v25, 1);
    MEMORY[0x223C41B10](v25);
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_21F0732BC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v83 = *v1;
  uint64_t v79 = sub_21F077E60();
  uint64_t v4 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v78 = (char *)v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RuntimeConfiguration();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v77 = (uint64_t)v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_21F077E40();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26AD3D078);
  swift_bridgeObjectRetain();
  uint64_t v86 = v9;
  uint64_t v10 = sub_21F077E30();
  os_log_type_t v11 = sub_21F078100();
  if (os_log_type_enabled(v10, v11))
  {
    BOOL v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)BOOL v12 = 134217984;
    uint64_t v13 = type metadata accessor for MegaFrame();
    uint64_t v14 = type metadata accessor for Node();
    uint64_t v98 = MEMORY[0x223C41550](a1, v14);
    sub_21F0781E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F067000, v10, v11, "FlowFrameRuntime action with understandableFrames count %ld.", v12, 0xCu);
    MEMORY[0x223C41CC0](v12, -1, -1);

    uint64_t v15 = v13;
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v15 = type metadata accessor for MegaFrame();
  }
  uint64_t v98 = a1;
  uint64_t v76 = v15;
  type metadata accessor for Node();
  sub_21F0780A0();
  swift_getWitnessTable();
  sub_21F0780E0();
  if (!sub_21F076BE8())
  {
    uint64_t v21 = *v2;
    uint64_t v81 = (char *)v2 + *(void *)(*v2 + 104);
    uint64_t v75 = (uint64_t)v2 + *(void *)(v21 + 128);
    v73[3] = (char *)&v93 + 8;
    v73[1] = &v92;
    long long v74 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
    *(void *)&long long v16 = 136315138;
    long long v80 = v16;
    v73[2] = MEMORY[0x263F8EE58] + 8;
    do
    {
      if (*(unsigned char *)(*(void *)((char *)v2 + *(void *)(*v2 + 120)) + 40)) {
        break;
      }
      uint64_t v22 = v101;
      if (!v101)
      {
        uint64_t v23 = sub_21F077920();
        if (!v23) {
          break;
        }
        uint64_t v22 = v23;
        swift_retain();
      }
      uint64_t v101 = 0;
      uint64_t v24 = *(void *)(v22 + 16);
      swift_retain_n();
      uint64_t v25 = sub_21F077E30();
      os_log_type_t v26 = sub_21F078100();
      BOOL v27 = os_log_type_enabled(v25, v26);
      uint64_t v89 = v22;
      if (v27)
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        uint64_t v98 = v29;
        *(_DWORD *)uint64_t v28 = v80;
        uint64_t v30 = sub_21F06F108();
        *(void *)&long long v93 = sub_21F07428C(v30, v31, &v98);
        sub_21F0781E0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21F067000, v25, v26, "FlowFrameRuntime action active frame. %s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C41CC0](v29, -1, -1);
        MEMORY[0x223C41CC0](v28, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      uint64_t v32 = *(void *)(v24 + 16);
      uint64_t v33 = *(void *)(v32 + 16);
      uint64_t v34 = *(void *)(v32 + 24);
      uint64_t v35 = *(void *)(v83 + 88);
      uint64_t v36 = *(void *)(v83 + 96);
      uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 16);
      swift_bridgeObjectRetain();
      uint64_t v38 = v37(v33, v34, v35, v36);
      swift_bridgeObjectRelease();
      sub_21F06B4DC();
      sub_21F06B504();
      *(void *)((char *)v2 + *(void *)(*v2 + 136)) = v24;
      swift_retain();
      swift_release();
      uint64_t v39 = MEMORY[0x263F8EE58] + 8;
      sub_21F06DBB8((uint64_t)v100, MEMORY[0x263F8EE58] + 8, &v98);
      *(void *)((char *)v2 + *(void *)(*v2 + 136)) = 0;
      swift_release();
      sub_21F076898((uint64_t)&v98, (uint64_t)&v93, &qword_267EBA1C8);
      if (v96 == 1)
      {
        swift_release();
        swift_release();
        swift_release();
        sub_21F06A88C((uint64_t)&v98, &qword_267EBA1C8);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v99);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v100);
        swift_release();
        return v93;
      }
      uint64_t v84 = v38;
      sub_21F076498(&v93, &v97);
      *(void *)((char *)v2 + *(void *)(*v2 + 136)) = v24;
      swift_retain();
      swift_release();
      uint64_t v40 = v24;
      sub_21F06E594((uint64_t)v99, (uint64_t)&v97, v39, (uint64_t)&v93);
      uint64_t v87 = *((void *)&v93 + 1);
      uint64_t v41 = v93;
      uint64_t v42 = v94;
      uint64_t v43 = v95;
      int v44 = v96;
      *(void *)((char *)v2 + *(void *)(*v2 + 136)) = 0;
      swift_release();
      if (v44 == 1)
      {
        swift_release();
        swift_release();
        swift_release();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v97);
        sub_21F06A88C((uint64_t)&v98, &qword_267EBA1C8);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v99);
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v100);
        swift_release();
        return v41;
      }
      uint64_t v88 = v41;
      uint64_t v85 = v40;
      if ((_BYTE)v41)
      {
        if (v41 == 1)
        {
          uint64_t v45 = v41;
          uint64_t v46 = v43;
          sub_21F076738(v45, v87, v42, v43, 0);
          swift_retain();
          swift_retain();
          sub_21F06ED38((uint64_t)v100, MEMORY[0x263F8EE58] + 8);
          uint64_t Strong = swift_weakLoadStrong();
          if (Strong)
          {
            uint64_t v48 = *(void *)(Strong + 16);
            swift_retain();
            swift_release();
            uint64_t v49 = *(void *)(v85 + 24);
            if (v49)
            {
              uint64_t v50 = *(void *)(v48 + 16);
              uint64_t v82 = v42;
              uint64_t v51 = *(void *)(v50 + 16);
              uint64_t v52 = *(void *)(v50 + 24);
              swift_bridgeObjectRetain();
              swift_retain();
              v37(v51, v52, v35, v36);
              uint64_t v42 = v82;
              swift_bridgeObjectRelease();
              sub_21F06B4DC();
              uint64_t v53 = *(void (**)(void *, long long *))(v49 + 16);
              v90[3] = MEMORY[0x263F8EE58] + 8;
              v90[0] = swift_allocObject();
              sub_21F06A138((uint64_t)&v91, v90[0] + 16);
              v53(v90, &v93);
              __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v90);
              swift_release();
              swift_release();
              swift_release();
              __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v91);
            }
            else
            {
              swift_release();
            }
          }
          uint64_t v71 = *(void (**)(uint64_t))(**(void **)((char *)v2 + *(void *)(*v2 + 120)) + 240);
          swift_retain();
          uint64_t v56 = v89;
          v71(v89);
          swift_release();
          swift_release();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v93);
          uint64_t v55 = v87;
          if (v87)
          {
LABEL_28:
            uint64_t v82 = v42;
            swift_retain_n();
            os_log_type_t v59 = sub_21F077E30();
            os_log_type_t v60 = sub_21F078100();
            if (os_log_type_enabled(v59, v60))
            {
              unsigned int v61 = (uint8_t *)swift_slowAlloc();
              uint64_t v62 = swift_slowAlloc();
              *(void *)&long long v93 = v62;
              *(_DWORD *)unsigned int v61 = v80;
              unint64_t v63 = sub_21F069964();
              uint64_t v91 = sub_21F07428C(v63, v64, (uint64_t *)&v93);
              sub_21F0781E0();
              swift_release_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_21F067000, v59, v60, "FlowFrameRuntime action activeFrame.action pushing next frame. %s", v61, 0xCu);
              swift_arrayDestroy();
              uint64_t v56 = v89;
              MEMORY[0x223C41CC0](v62, -1, -1);
              MEMORY[0x223C41CC0](v61, -1, -1);
            }
            else
            {

              swift_release_n();
            }
            if (v88 == 1)
            {
              uint64_t v65 = 0;
            }
            else
            {
              swift_retain();
              uint64_t v65 = v56;
            }
            uint64_t v66 = *(void *)((char *)v2 + *(void *)(*v2 + 120));
            uint64_t v67 = v77;
            sub_21F0764A8(v75, v77);
            uint64_t v68 = (uint64_t)v78;
            (*v74)(v78, v67, v79);
            uint64_t v69 = swift_allocObject();
            swift_retain();
            swift_retain();
            sub_21F06D1D4(v55, v46, v68);
            *(void *)&long long v93 = v69;
            (*(void (**)(long long *, uint64_t))(*(void *)v66 + 208))(&v93, v65);
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            uint64_t v70 = v88;
            uint64_t v42 = v82;
            sub_21F0766D8(v88, v55, v82, v46, 0);
            sub_21F0766D8(v70, v55, v42, v46, 0);
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v57 = *(void (**)(uint64_t))(**(void **)((char *)v2 + *(void *)(*v2 + 120)) + 232);
          uint64_t v58 = v41;
          uint64_t v55 = v87;
          uint64_t v46 = v43;
          sub_21F076738(v58, v87, v42, v43, 0);
          swift_retain();
          swift_retain();
          swift_retain();
          uint64_t v56 = v89;
          v57(v89);
          swift_release();
          swift_release();
          if (v55) {
            goto LABEL_28;
          }
        }
      }
      else
      {
        uint64_t v54 = v41;
        uint64_t v55 = v87;
        uint64_t v46 = v43;
        sub_21F076738(v54, v87, v42, v43, 0);
        swift_retain();
        swift_retain();
        uint64_t v56 = v89;
        if (v55) {
          goto LABEL_28;
        }
      }
      swift_release();
      uint64_t v72 = v88;
      sub_21F0766D8(v88, 0, v42, v46, 0);
      swift_release();
      swift_release();
      swift_release();
      sub_21F0766D8(v72, 0, v42, v46, 0);
LABEL_38:
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v97);
      sub_21F06A88C((uint64_t)&v98, &qword_267EBA1C8);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v99);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v100);
    }
    while ((v42 & 1) == 0 && !sub_21F076BE8());
  }
  uint64_t v17 = sub_21F077E30();
  os_log_type_t v18 = sub_21F078100();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_21F067000, v17, v18, "FlowFrameRuntime action complete.", v19, 2u);
    MEMORY[0x223C41CC0](v19, -1, -1);
  }

  swift_release();
  return 0;
}

uint64_t FlowFrameRuntime.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 88) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 104));

  swift_release();
  sub_21F075544(v0 + *(void *)(*(void *)v0 + 128));
  swift_release();
  return v0;
}

uint64_t FlowFrameRuntime.__deallocating_deinit()
{
  return sub_21F0741EC((void (*)(void))FlowFrameRuntime.deinit);
}

uint64_t sub_21F0741EC(void (*a1)(void))
{
  a1();
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v1 + 52);
  return MEMORY[0x270FA0228](v1, v2, v3);
}

uint64_t sub_21F074248()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 192))();
}

uint64_t sub_21F07428C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21F074360(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21F06A138((uint64_t)v12, *a3);
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
      sub_21F06A138((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_21F074360(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21F0781F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21F07451C(a5, a6);
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
  uint64_t v8 = sub_21F078260();
  if (!v8)
  {
    sub_21F0782D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21F0782F0();
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

uint64_t sub_21F07451C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21F0745B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21F074810(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21F074810(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21F0745B4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21F07472C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21F078240();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21F0782D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21F077F80();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21F0782F0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21F0782D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21F07472C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA338);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21F074794(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_21F077FC0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x223C41490](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_21F074810(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA338);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_21F0782F0();
  __break(1u);
  return result;
}

uint64_t sub_21F074960@<X0>(void *a1@<X8>)
{
  return sub_21F070B8C(a1);
}

uint64_t type metadata accessor for CancellableStack()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F07499C(uint64_t a1, unint64_t a2)
{
  id v4 = objc_msgSend(self, sel_callStackSymbols);
  uint64_t v5 = sub_21F078020();

  if (qword_26AD3CCF8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_21F077E40();
  __swift_project_value_buffer(v6, (uint64_t)qword_26AD3D078);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  int64_t v7 = sub_21F077E30();
  os_log_type_t v8 = sub_21F078120();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v20 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    sub_21F07428C(a1, a2, &v20);
    sub_21F0781E0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 2048;
    swift_bridgeObjectRelease();
    sub_21F0781E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F067000, v7, v8, "MegaFrame.%s repeated completion invocation. Logging %ld callstack symbols.", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C41CC0](v10, -1, -1);
    MEMORY[0x223C41CC0](v9, -1, -1);

    uint64_t v11 = *(void *)(v5 + 16);
    if (!v11) {
      return swift_bridgeObjectRelease();
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v11 = *(void *)(v5 + 16);
    if (!v11) {
      return swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = (unint64_t *)(v5 + 40);
  do
  {
    uint64_t v14 = *(v12 - 1);
    unint64_t v13 = *v12;
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_21F077E30();
    os_log_type_t v16 = sub_21F078120();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v17 + 4) = sub_21F07428C(v14, v13, &v20);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21F067000, v15, v16, "%s", (uint8_t *)v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C41CC0](v18, -1, -1);
      MEMORY[0x223C41CC0](v17, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v12 += 2;
    --v11;
  }
  while (v11);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F074D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v51 = (char *)&v39 - v11;
  uint64_t v40 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v39 - v14;
  if (MEMORY[0x223C41550](v13))
  {
    sub_21F078220();
    uint64_t v16 = sub_21F078210();
  }
  else
  {
    uint64_t v16 = MEMORY[0x263F8EE88];
  }
  uint64_t v44 = MEMORY[0x223C41580](v5, a2);
  if (!v44) {
    return v16;
  }
  uint64_t v17 = 0;
  uint64_t v49 = (void (**)(char *, uint64_t *, uint64_t))(v6 + 16);
  uint64_t v50 = v16 + 56;
  uint64_t v46 = v6 + 32;
  uint64_t v48 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v41 = v6;
  uint64_t v42 = v5;
  uint64_t v43 = v15;
  while (1)
  {
    char v18 = sub_21F078050();
    sub_21F078030();
    if (v18)
    {
      uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v6 + 16);
      v19(v15, (uint64_t *)(v5+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v17), a2);
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t result = sub_21F078250();
      if (v40 != 8) {
        goto LABEL_23;
      }
      uint64_t v52 = result;
      uint64_t v19 = *v49;
      (*v49)(v15, &v52, a2);
      swift_unknownObjectRelease();
      BOOL v20 = __OFADD__(v17, 1);
      uint64_t v21 = v17 + 1;
      if (v20)
      {
LABEL_20:
        __break(1u);
        return v16;
      }
    }
    uint64_t v47 = v21;
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v45(v51, v15, a2);
    uint64_t v22 = sub_21F077F00();
    uint64_t v23 = v16;
    uint64_t v24 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v25 = v22 & ~v24;
    unint64_t v26 = v25 >> 6;
    uint64_t v27 = *(void *)(v50 + 8 * (v25 >> 6));
    uint64_t v28 = 1 << v25;
    uint64_t v29 = *(void *)(v6 + 72);
    if (((1 << v25) & v27) != 0)
    {
      uint64_t v30 = ~v24;
      do
      {
        v19(v9, (uint64_t *)(*(void *)(v23 + 48) + v29 * v25), a2);
        uint64_t v31 = a3;
        char v32 = sub_21F077F30();
        uint64_t v33 = *v48;
        (*v48)(v9, a2);
        if (v32)
        {
          v33(v51, a2);
          a3 = v31;
          uint64_t v6 = v41;
          uint64_t v5 = v42;
          uint64_t v16 = v23;
          goto LABEL_7;
        }
        unint64_t v25 = (v25 + 1) & v30;
        unint64_t v26 = v25 >> 6;
        uint64_t v27 = *(void *)(v50 + 8 * (v25 >> 6));
        uint64_t v28 = 1 << v25;
        a3 = v31;
      }
      while ((v27 & (1 << v25)) != 0);
      uint64_t v6 = v41;
      uint64_t v5 = v42;
    }
    uint64_t v34 = v51;
    *(void *)(v50 + 8 * v26) = v28 | v27;
    unint64_t v35 = *(void *)(v23 + 48) + v29 * v25;
    uint64_t v16 = v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v45)(v35, v34, a2);
    uint64_t v37 = *(void *)(v23 + 16);
    BOOL v20 = __OFADD__(v37, 1);
    uint64_t v38 = v37 + 1;
    if (v20) {
      break;
    }
    *(void *)(v23 + 16) = v38;
LABEL_7:
    uint64_t v15 = v43;
    uint64_t v17 = v47;
    if (v47 == v44) {
      return v16;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

char *sub_21F0750D0(uint64_t a1, uint64_t a2)
{
  char v3 = v2;
  uint64_t v5 = *(void *)v2;
  *(void *)&v3[*(void *)(v5 + 136)] = 0;
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)(v5 + 88) - 8) + 16))(&v3[*(void *)(*(void *)v3 + 104)], a1, *(void *)(v5 + 88));
  type metadata accessor for FlowFrameRuntime();
  *(void *)&v3[*(void *)(*(void *)v3 + 120)] = sub_21F070F0C();
  *(void *)&v3[*(void *)(*(void *)v3 + 112)] = dispatch_semaphore_create(1);
  sub_21F076AA4(a2, (uint64_t)&v3[*(void *)(*(void *)v3 + 128)]);
  return v3;
}

unint64_t sub_21F07520C()
{
  unint64_t result = qword_267EBA2F0;
  if (!qword_267EBA2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBA2F0);
  }
  return result;
}

uint64_t sub_21F075260()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21F0752A0(uint64_t a1)
{
  char v3 = *(uint64_t (**)(uint64_t))(v1 + 24);
  sub_21F0781A0();
  return v3(a1);
}

unint64_t sub_21F0752FC()
{
  unint64_t result = qword_267EBA2F8;
  if (!qword_267EBA2F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EBA2F8);
  }
  return result;
}

uint64_t sub_21F07533C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_21F075420()
{
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80);
  unint64_t v2 = (*(void *)(*(void *)(*(void *)(v0 + 16) - 8) + 64) + v1 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_21F072104(*(void *)(v0 + 40), v0 + v1, *(void (**)(uint64_t *))(v0 + v2), *(void *)(v0 + v2 + 8));
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

unint64_t sub_21F0754A8()
{
  unint64_t result = qword_267EBA300;
  if (!qword_267EBA300)
  {
    sub_21F077E80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBA300);
  }
  return result;
}

uint64_t sub_21F075500(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_21F075544(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RuntimeConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for RuntimeConfiguration()
{
  uint64_t result = qword_26AD3CF88;
  if (!qword_26AD3CF88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21F0755EC()
{
  uint64_t result = sub_21F077E60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for MegaFrame()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F0756C8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21F07570C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for InstrumentedCancellableStack()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F077E60();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for RuntimeConfiguration(uint64_t a1)
{
  uint64_t v2 = sub_21F077E60();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F077E60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F077E60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F077E60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for RuntimeConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F077E60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RuntimeConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21F0759E0);
}

uint64_t sub_21F0759E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F077E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RuntimeConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21F075A60);
}

uint64_t sub_21F075A60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21F077E60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_21F075AD0()
{
  uint64_t result = sub_21F077E60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21F075B5C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_21F077E60();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for FlowFrameRuntime()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for FlowFrameRuntime(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FlowFrameRuntime);
}

uint64_t dispatch thunk of FlowFrameRuntime.debugDescription.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of FlowFrameRuntime.__allocating_init(frameFactoryLoader:configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of FlowFrameRuntime.ensureReady()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of FlowFrameRuntime.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of FlowFrameRuntime.handle(input:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t sub_21F075D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_21F075D54()
{
  uint64_t result = sub_21F077E10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21F075E00(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v9 = *(int *)(a3 + 44);
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = (char *)a1 + v9;
    a1[8] = a2[8];
    uint64_t v12 = sub_21F077E10();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v10, v12);
  }
  return v3;
}

uint64_t sub_21F075F28(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_21F077E10();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_21F075FB8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v8 = *(int *)(a3 + 44);
  uint64_t v9 = (char *)a2 + v8;
  uint64_t v10 = (char *)a1 + v8;
  a1[8] = a2[8];
  uint64_t v11 = sub_21F077E10();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v9, v11);
  return a1;
}

void *sub_21F076090(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  uint64_t v6 = *(int *)(a3 + 44);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_21F077E10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_21F076194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v6 = *(int *)(a3 + 44);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_21F077E10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

void *sub_21F076220(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  uint64_t v10 = *(int *)(a3 + 44);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_21F077E10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_21F0762E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21F0762F8);
}

uint64_t sub_21F0762F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_21F077E10();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_21F0763A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21F0763BC);
}

uint64_t sub_21F0763BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_21F077E10();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for InstrumentedCancellableStack.TrackedFrame()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F07647C()
{
  return swift_getWitnessTable();
}

_OWORD *sub_21F076498(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21F0764A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RuntimeConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F07650C()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_21F076544(uint64_t a1, char a2)
{
  if (a2) {
    JUMPOUT(0x223C41B20);
  }
}

void sub_21F076550(uint64_t a1, char a2)
{
  if (a2) {
    JUMPOUT(0x223C41B10);
  }
}

uint64_t sub_21F07655C(uint64_t a1)
{
  return sub_21F0765B4(a1, (uint64_t (*)(uint64_t))sub_21F06F6D0);
}

uint64_t sub_21F076588(uint64_t a1)
{
  return sub_21F0765B4(a1, (uint64_t (*)(uint64_t))sub_21F06FA70);
}

uint64_t sub_21F0765B4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = type metadata accessor for InstrumentedCancellableStack.TrackedFrame();
  return a2(v3);
}

unint64_t sub_21F076600()
{
  unint64_t result = qword_267EBA320;
  if (!qword_267EBA320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBA320);
  }
  return result;
}

uint64_t sub_21F076654@<X0>(void *a1@<X8>)
{
  uint64_t v2 = swift_retain();
  return sub_21F06F3E0(v2, a1);
}

uint64_t sub_21F07668C()
{
  int v1 = *(unsigned __int8 *)(v0 + 48);
  if (v1 != 255) {
    sub_21F0766D8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), v1 & 1);
  }
  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_21F0766D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    JUMPOUT(0x223C41B10);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_21F07672C(uint64_t a1)
{
  return sub_21F06EBA4(a1, *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_21F076738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5)
  {
    JUMPOUT(0x223C41B20);
  }
  swift_retain();
  return swift_retain();
}

unint64_t sub_21F076788()
{
  unint64_t result = qword_267EBA328;
  if (!qword_267EBA328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBA328);
  }
  return result;
}

uint64_t sub_21F0767DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255) {
    return sub_21F076738(result, a2, a3, a4, a5 & 1);
  }
  return result;
}

uint64_t sub_21F076808(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255) {
    return sub_21F0766D8(result, a2, a3, a4, a5 & 1);
  }
  return result;
}

uint64_t sub_21F076834()
{
  int v1 = *(unsigned __int8 *)(v0 + 48);
  if (v1 != 255)
  {
    uint64_t v2 = (void *)(v0 + 16);
    if (v1) {
      MEMORY[0x223C41B10](*v2);
    }
    else {
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
    }
  }
  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_21F07688C(uint64_t a1)
{
  return sub_21F06E418(a1, *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_21F076898(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21F0768FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA1C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F076964(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBA330);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F0769CC()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 != 255) {
    sub_21F076550(*(void *)(v0 + 16), v1 & 1);
  }
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t objectdestroy_17Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21F076A58(uint64_t a1)
{
  return sub_21F06DA7C(a1, *(void *)(v1 + 24), *(void *)(v1 + 32));
}

void sub_21F076A64(uint64_t a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_21F076544(a1, a2 & 1);
  }
}

void sub_21F076A7C(uint64_t a1, unsigned __int8 a2)
{
  if (a2 != 255) {
    sub_21F076550(a1, a2 & 1);
  }
}

uint64_t sub_21F076A94(uint64_t a1, char a2)
{
  if (a2) {
    JUMPOUT(0x223C41B10);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F076AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RuntimeConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F076B08()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21F076BC0()
{
  swift_release();
  swift_release();
  return v0;
}

BOOL sub_21F076BE8()
{
  return *(void *)(v0 + 32) == 0;
}

uint64_t sub_21F076BF8()
{
  return swift_retain();
}

uint64_t sub_21F076C00()
{
  v0[2] = 0;
  swift_release();
  v0[3] = 0;
  uint64_t result = swift_release();
  v0[4] = 0;
  return result;
}

uint64_t *sub_21F076C30(uint64_t a1, uint64_t a2)
{
  type metadata accessor for Node();
  swift_retain();
  uint64_t v4 = sub_21F0778CC(a1);
  if (a2)
  {
    swift_beginAccess();
    sub_21F0780A0();
    swift_retain();
    swift_retain();
    sub_21F078070();
    swift_endAccess();
    swift_release();
  }
  sub_21F076FE4((uint64_t)v4);
  return v4;
}

uint64_t *sub_21F076D2C(uint64_t a1)
{
  type metadata accessor for Node();
  uint64_t v2 = a1 + *(void *)(*(void *)a1 + 88);
  swift_weakLoadStrong();
  uint64_t v3 = sub_21F0778CC(v2);
  sub_21F077928(a1);
  uint64_t v4 = (uint64_t *)(a1 + *(void *)(*(void *)a1 + 104));
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = (uint64_t *)((char *)v3 + *(void *)(*v3 + 104));
  swift_beginAccess();
  *uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *uint64_t v4 = sub_21F078040();
  swift_bridgeObjectRelease();
  sub_21F076FE4(a1);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (uint64_t *)(Strong + *(void *)(*(void *)Strong + 104));
    swift_beginAccess();
    sub_21F0780A0();
    swift_getWitnessTable();
    if ((sub_21F0780F0() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      *uint64_t v8 = sub_21F078270();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      swift_retain();
      sub_21F078070();
      swift_endAccess();
    }
    swift_release();
  }
  return v3;
}

uint64_t sub_21F076FBC(uint64_t a1)
{
  sub_21F077C04(a1);
  return swift_retain();
}

uint64_t sub_21F076FE4(uint64_t a1)
{
  uint64_t v3 = v1[3];
  if (v1[2] && v3)
  {
    swift_weakAssign();
    *(void *)(v3 + *(void *)(*(void *)v3 + 120)) = a1;
    swift_retain();
    swift_release();
    v1[3] = a1;
  }
  else
  {
    v1[3] = a1;
    swift_retain();
    swift_release();
    v1[2] = a1;
  }
  swift_retain();
  uint64_t result = swift_release();
  uint64_t v5 = v1[4];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    v1[4] = v7;
  }
  return result;
}

uint64_t sub_21F0770B0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v3 = v1[3];
  if (v4) {
    BOOL v5 = v4 == a1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (v3) {
      BOOL v8 = v3 == a1;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      v1[2] = 0;
      swift_release();
      v1[3] = 0;
    }
    else
    {
      v1[2] = *(void *)(a1 + *(void *)(*(void *)a1 + 120));
      swift_retain();
    }
    goto LABEL_23;
  }
  if (v3) {
    BOOL v6 = v3 == a1;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      *(void *)(Strong + *(void *)(*(void *)Strong + 120)) = 0;
      swift_retain();
      swift_release();
      swift_release();
    }
    else
    {
      swift_retain();
    }
    uint64_t v10 = swift_weakLoadStrong();
    swift_release();
    v1[3] = v10;
    goto LABEL_23;
  }
  uint64_t v7 = swift_weakLoadStrong();
  if (v7)
  {
    *(void *)(v7 + *(void *)(*(void *)v7 + 120)) = *(void *)(a1 + *(void *)(*(void *)a1 + 120));
    swift_retain();
    swift_release();
    swift_release();
  }
  if (*(void *)(a1 + *(void *)(*(void *)a1 + 120)))
  {
    swift_weakLoadStrong();
    swift_weakAssign();
LABEL_23:
    swift_release();
  }
  swift_weakAssign();
  *(void *)(a1 + *(void *)(*(void *)a1 + 120)) = 0;
  uint64_t result = swift_release();
  uint64_t v12 = v1[4];
  BOOL v13 = __OFSUB__(v12, 1);
  uint64_t v14 = v12 - 1;
  if (v13) {
    __break(1u);
  }
  else {
    v1[4] = v14;
  }
  return result;
}

uint64_t sub_21F0772E0()
{
  uint64_t v1 = *v0;
  if (*v0) {
    *uint64_t v0 = swift_weakLoadStrong();
  }
  return v1;
}

uint64_t sub_21F077328()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  uint64_t v1 = *(void *)(*(void *)v0 + 120);
  uint64_t v2 = *(void *)(v0 + v1);
  *(void *)(v0 + v1) = 0;
  if (v2)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native()) {
        break;
      }
      uint64_t v3 = *(void *)(v2 + *(void *)(*(void *)v2 + 120));
      swift_retain();
      swift_release();
      uint64_t v2 = v3;
    }
    while (v3);
  }
  swift_release();
  return v0;
}

uint64_t sub_21F077460()
{
  sub_21F077328();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for Node()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F0774D0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21F077524@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21F0772E0();
  *a1 = result;
  return result;
}

uint64_t sub_21F07754C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for OrderedForest()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21F0775A4()
{
  return swift_getWitnessTable();
}

void *sub_21F0775C0()
{
  uint64_t result = v0;
  v0[2] = 0;
  v0[3] = 0;
  v0[4] = 0;
  return result;
}

uint64_t sub_21F0775D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21F076BF8();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t sub_21F077610()
{
  return 0;
}

uint64_t sub_21F077618()
{
  return 2;
}

uint64_t sub_21F077620()
{
  type metadata accessor for OrderedForest();
  uint64_t v0 = sub_21F077C34();
  swift_release();
  return v0;
}

void sub_21F07766C()
{
  type metadata accessor for OrderedForest();
  JUMPOUT(0x223C414E0);
}

uint64_t sub_21F0776D8()
{
  return sub_21F078000();
}

uint64_t *sub_21F077748(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_weakInit();
  swift_weakInit();
  *(uint64_t *)((char *)v1 + *(void *)(*v1 + 120)) = 0;
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)(*(void *)(v3 + 80) - 8) + 16))((uint64_t)v1 + *(void *)(*v1 + 88), a1, *(void *)(v3 + 80));
  swift_weakAssign();
  type metadata accessor for Node();
  uint64_t v4 = sub_21F078040();
  swift_release();
  *(uint64_t *)((char *)v1 + *(void *)(*v1 + 104)) = v4;
  swift_weakAssign();
  *(uint64_t *)((char *)v1 + *(void *)(*v1 + 120)) = 0;
  swift_release();
  return v1;
}

uint64_t *sub_21F0778CC(uint64_t a1)
{
  return sub_21F077748(a1);
}

uint64_t sub_21F077920()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_21F077928(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + *(void *)(*(void *)a1 + 104));
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = type metadata accessor for Node();
  uint64_t v5 = swift_bridgeObjectRetain();
  if (MEMORY[0x223C41570](v5, v4))
  {
    uint64_t v6 = 4;
    do
    {
      uint64_t v7 = v6 - 4;
      char v8 = sub_21F078050();
      sub_21F078030();
      if (v8)
      {
        uint64_t v9 = *(void *)(v3 + 8 * v6);
        swift_retain();
        BOOL v10 = __OFADD__(v7, 1);
        uint64_t v11 = v6 - 3;
        if (v10) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v9 = sub_21F078250();
        BOOL v10 = __OFADD__(v7, 1);
        uint64_t v11 = v6 - 3;
        if (v10)
        {
LABEL_9:
          __break(1u);
          break;
        }
      }
      sub_21F077928(v9);
      swift_release();
      ++v6;
    }
    while (v11 != MEMORY[0x223C41570](v3, v4));
  }
  swift_bridgeObjectRelease();
  sub_21F0770B0(a1);
  return a1;
}

uint64_t sub_21F077A74()
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = (uint64_t *)(result + *(void *)(*(void *)result + 104));
    swift_beginAccess();
    type metadata accessor for Node();
    sub_21F0780A0();
    swift_getWitnessTable();
    if (sub_21F0780F0())
    {
      return swift_release();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      uint64_t *v1 = sub_21F078270();
      swift_release();
      swift_bridgeObjectRelease();
      return swift_weakAssign();
    }
  }
  return result;
}

uint64_t sub_21F077C04(uint64_t a1)
{
  return a1;
}

BOOL sub_21F077C38(void *a1)
{
  return *a1 != v1;
}

void *sub_21F077C48(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t sub_21F077C78()
{
  return swift_release();
}

void *sub_21F077C80(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *sub_21F077CC8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_21F077CFC(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_21F077D58(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t type metadata accessor for NodeIterator()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_21F077DC4(void *a1)
{
  return sub_21F077C38(a1);
}

uint64_t sub_21F077DE0()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_21F077DF0()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_21F077E00()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_21F077E10()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_21F077E20()
{
  return MEMORY[0x270FA2D10]();
}

uint64_t sub_21F077E30()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21F077E40()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21F077E50()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_21F077E60()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_21F077E70()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_21F077E80()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21F077E90()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_21F077EA0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21F077EB0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21F077EC0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_21F077ED0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_21F077EE0()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_21F077EF0()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_21F077F00()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21F077F10()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_21F077F20()
{
  return MEMORY[0x270F9D578]();
}

uint64_t sub_21F077F30()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21F077F40()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_21F077F50()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21F077F60()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21F077F70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21F077F80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21F077F90()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_21F077FA0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_21F077FB0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_21F077FC0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_21F077FD0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_21F077FE0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_21F077FF0()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_21F078000()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_21F078010()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_21F078020()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21F078030()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_21F078040()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_21F078050()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_21F078060()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_21F078070()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_21F078080()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_21F078090()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_21F0780A0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_21F0780B0()
{
  return MEMORY[0x270F9DEC0]();
}

uint64_t sub_21F0780C0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_21F0780D0()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_21F0780E0()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_21F0780F0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_21F078100()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21F078110()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21F078120()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21F078130()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21F078140()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_21F078150()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_21F078160()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_21F078170()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_21F078180()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_21F078190()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_21F0781A0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_21F0781B0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_21F0781C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21F0781D0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_21F0781E0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21F0781F0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21F078200()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21F078210()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21F078220()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_21F078230()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21F078240()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21F078250()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_21F078260()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21F078270()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_21F078280()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_21F078290()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_21F0782A0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_21F0782B0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_21F0782C0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21F0782D0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21F0782E0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21F0782F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21F078300()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_21F078310()
{
  return MEMORY[0x270F9F7D8]();
}

uint64_t sub_21F078320()
{
  return MEMORY[0x270F9FA28]();
}

uint64_t sub_21F078330()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21F078340()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21F078350()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21F078360()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21F078370()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21F078380()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21F078390()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21F0783A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21F0783B0()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_21F0783C0()
{
  return MEMORY[0x270FA0128]();
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

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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