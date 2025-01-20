uint64_t TransportDispatching.register(_:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x270FA2498](sub_24CCFA12C, 0, 0);
}

uint64_t sub_24CCFA12C()
{
  uint64_t v1 = (*(uint64_t (**)(void, void))(v0[6] + 24))(v0[5], v0[6]);
  v0[8] = v1;
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26982B0B8
                                                                                    + dword_26982B0B8);
  v2 = (void *)swift_task_alloc();
  v0[9] = v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  void *v2 = v0;
  v2[1] = sub_24CCFA260;
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[2];
  return v9(v7, v5, v6, v1, AssociatedTypeWitness, AssociatedConformanceWitness);
}

uint64_t sub_24CCFA260()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t TransportDispatching.register<A>(_:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[13] = a7;
  v8[14] = v7;
  v8[11] = a5;
  v8[12] = a6;
  v8[9] = a3;
  v8[10] = a4;
  v8[7] = a1;
  v8[8] = a2;
  return MEMORY[0x270FA2498](sub_24CCFA39C, 0, 0);
}

{
  uint64_t v7;
  void *v8;

  v8[13] = a7;
  v8[14] = v7;
  v8[11] = a5;
  v8[12] = a6;
  v8[9] = a3;
  v8[10] = a4;
  v8[7] = a1;
  v8[8] = a2;
  return MEMORY[0x270FA2498](sub_24CCFA64C, 0, 0);
}

{
  uint64_t v7;
  void *v8;

  v8[13] = a7;
  v8[14] = v7;
  v8[11] = a5;
  v8[12] = a6;
  v8[9] = a3;
  v8[10] = a4;
  v8[7] = a1;
  v8[8] = a2;
  return MEMORY[0x270FA2498](sub_24CCFA7E0, 0, 0);
}

uint64_t sub_24CCFA39C()
{
  uint64_t v1 = v0[7];
  v0[15] = (*(uint64_t (**)(uint64_t, uint64_t))(v0[12] + 24))(v0[10], v0[12]);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[5] = AssociatedTypeWitness;
  v0[6] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, v1, AssociatedTypeWitness);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[16] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCFA504;
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[9];
  return sub_24CD03290((uint64_t)(v0 + 2), v7, v8, v6, v5);
}

uint64_t sub_24CCFA504()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v1);
  v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_24CCFA64C()
{
  uint64_t v1 = v0[7];
  v0[15] = (*(uint64_t (**)(uint64_t, uint64_t))(v0[12] + 24))(v0[10], v0[12]);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[5] = AssociatedTypeWitness;
  v0[6] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, v1, AssociatedTypeWitness);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[16] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCFB0BC;
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[9];
  return sub_24CD037F4((uint64_t)(v0 + 2), v7, v8, v6, v5);
}

uint64_t sub_24CCFA7E0()
{
  uint64_t v1 = v0[7];
  v0[15] = (*(uint64_t (**)(uint64_t, uint64_t))(v0[12] + 24))(v0[10], v0[12]);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[5] = AssociatedTypeWitness;
  v0[6] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, v1, AssociatedTypeWitness);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[16] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCFB0BC;
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[9];
  return sub_24CD03EF4((uint64_t)(v0 + 2), v7, v8, v6, v5);
}

uint64_t TransportDispatching.register<A, B>(_:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[15] = v11;
  v9[16] = v8;
  v9[13] = a7;
  v9[14] = a8;
  v9[11] = a5;
  v9[12] = a6;
  v9[9] = a3;
  v9[10] = a4;
  v9[7] = a1;
  v9[8] = a2;
  return MEMORY[0x270FA2498](sub_24CCFA980, 0, 0);
}

{
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v9[15] = v11;
  v9[16] = v8;
  v9[13] = a7;
  v9[14] = a8;
  v9[11] = a5;
  v9[12] = a6;
  v9[9] = a3;
  v9[10] = a4;
  v9[7] = a1;
  v9[8] = a2;
  return MEMORY[0x270FA2498](sub_24CCFAB20, 0, 0);
}

uint64_t sub_24CCFA980()
{
  uint64_t v1 = v0[7];
  v0[17] = (*(uint64_t (**)(uint64_t, uint64_t))(v0[13] + 24))(v0[10], v0[13]);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[5] = AssociatedTypeWitness;
  v0[6] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, v1, AssociatedTypeWitness);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[18] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCFB0C0;
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[8];
  uint64_t v10 = v0[9];
  return sub_24CD044E4((uint64_t)(v0 + 2), v9, v10, v7, v8, v5, v6);
}

uint64_t sub_24CCFAB20()
{
  uint64_t v1 = v0[7];
  v0[17] = (*(uint64_t (**)(uint64_t, uint64_t))(v0[13] + 24))(v0[10], v0[13]);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v0[5] = AssociatedTypeWitness;
  v0[6] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, v1, AssociatedTypeWitness);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[18] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24CCFAC88;
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[8];
  uint64_t v10 = v0[9];
  return sub_24CD04D64((uint64_t)(v0 + 2), v9, v10, v7, v8, v5, v6);
}

uint64_t sub_24CCFAC88()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v1);
  v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t TransportDispatching.unregister(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4[6] = AssociatedTypeWitness;
  v4[7] = *(void *)(AssociatedTypeWitness - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCFAE80, 0, 0);
}

uint64_t sub_24CCFAE80()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[2];
  uint64_t v5 = (*(uint64_t (**)(void))(v0[4] + 24))(v0[3]);
  v0[9] = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  return MEMORY[0x270FA2498](sub_24CCFAF38, v5, 0);
}

uint64_t sub_24CCFAF38()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  swift_getAssociatedConformanceWitness();
  sub_24CD06640(v1, v2);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
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

uint64_t dispatch thunk of TransportDispatching.transportDispatchService.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

id Data.compressed(using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CCFB16C(a1, a2, a3, (SEL *)&selRef_compressedDataUsingAlgorithm_error_);
}

id Data.decompressed(using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24CCFB16C(a1, a2, a3, (SEL *)&selRef_decompressedDataUsingAlgorithm_error_);
}

id sub_24CCFB16C(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = (void *)sub_24CD076D0();
  v12[0] = 0;
  id v7 = objc_msgSend(v6, *a4, a1, v12);

  id v8 = v12[0];
  if (v7)
  {
    id v9 = v7;
    id v7 = (id)sub_24CD076E0();
  }
  else
  {
    uint64_t v10 = v8;
    sub_24CD076C0();

    swift_willThrow();
  }
  return v7;
}

uint64_t TransportSerializable<>.transportData()()
{
  sub_24CD076A0();
  swift_allocObject();
  sub_24CD07690();
  uint64_t v0 = sub_24CD07680();
  swift_release();
  return v0;
}

uint64_t sub_24CCFB2E8(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = a2 >> 60;
  if (a2 >> 60 == 15) {
    return v3 > 0xE;
  }
  sub_24CD07670();
  swift_allocObject();
  sub_24CD07660();
  sub_24CCFB964();
  sub_24CD07650();
  swift_release();
  uint64_t result = sub_24CCFB518(a1, a2);
  if (!v2) {
    return v3 > 0xE;
  }
  return result;
}

uint64_t TransportSerializable<>.init(transportData:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v12 >> 60 == 15) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, 1, 1, a3);
  }
  sub_24CD07670();
  swift_allocObject();
  sub_24CD07660();
  sub_24CD07650();
  swift_release();
  uint64_t result = sub_24CCFB518(a1, a2);
  if (!v4)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, a3);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(a4, 0, 1, a3);
  }
  return result;
}

uint64_t sub_24CCFB518(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CCFB52C(a1, a2);
  }
  return a1;
}

uint64_t sub_24CCFB52C(uint64_t a1, unint64_t a2)
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

uint64_t dispatch thunk of TransportSerializable.transportData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TransportSerializable.init(transportData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_24CCFB5D4()
{
  sub_24CD076A0();
  swift_allocObject();
  sub_24CD07690();
  uint64_t v0 = sub_24CD07680();
  swift_release();
  return v0;
}

uint64_t sub_24CCFB668@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if (a2 >> 60 == 15)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v8 = result;
    sub_24CD07670();
    swift_allocObject();
    sub_24CD07660();
    sub_24CD07650();
    swift_release();
    uint64_t result = sub_24CCFB518(v8, a2);
    if (v3) {
      return result;
    }
    uint64_t v5 = v9;
    uint64_t v6 = v10;
  }
  *a3 = v5;
  a3[1] = v6;
  return result;
}

uint64_t sub_24CCFB740()
{
  sub_24CD076A0();
  swift_allocObject();
  sub_24CD07690();
  sub_24CCFB9B8();
  uint64_t v0 = sub_24CD07680();
  swift_release();
  return v0;
}

uint64_t sub_24CCFB7C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24CCFB2E8(a1, a2);
  if (!v3) {
    *a3 = result & 1;
  }
  return result;
}

uint64_t sub_24CCFB7F0()
{
  sub_24CD076A0();
  swift_allocObject();
  sub_24CD07690();
  uint64_t v0 = sub_24CD07680();
  swift_release();
  return v0;
}

uint64_t sub_24CCFB884@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5 = a2 >> 60;
  if (a2 >> 60 == 15)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v8 = result;
    sub_24CD07670();
    swift_allocObject();
    sub_24CD07660();
    sub_24CD07650();
    swift_release();
    uint64_t result = sub_24CCFB518(v8, a2);
    if (v3) {
      return result;
    }
    uint64_t v6 = v9;
  }
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 8) = v5 > 0xE;
  return result;
}

unint64_t sub_24CCFB964()
{
  unint64_t result = qword_26982ADB0;
  if (!qword_26982ADB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ADB0);
  }
  return result;
}

unint64_t sub_24CCFB9B8()
{
  unint64_t result = qword_26982ADB8;
  if (!qword_26982ADB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982ADB8);
  }
  return result;
}

uint64_t dispatch thunk of TransportService.activate()(uint64_t a1, uint64_t a2)
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_24CCFBAFC;
  return v7(a1, a2);
}

uint64_t sub_24CCFBAFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of TransportService.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TransportService.send(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 40) + **(int **)(a3 + 40));
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = sub_24CCFC30C;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of TransportService.send<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 48)
                                                                                     + **(int **)(a6 + 48));
  v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_24CCFC30C;
  return v15(a1, a2, a3, a4, a5, a6);
}

{
  uint64_t v6;
  void *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v16;

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 56)
                                                                                     + **(int **)(a6 + 56));
  v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_24CCFC30C;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of TransportService.send<A>(_:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 64)
                                                                                     + **(int **)(a6 + 64));
  v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_24CCFC30C;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of TransportService.send<A, B>(_:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a9 + 72) + **(int **)(a9 + 72));
  v17 = (void *)swift_task_alloc();
  *(void *)(v9 + 16) = v17;
  void *v17 = v9;
  v17[1] = sub_24CCFBAFC;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

{
  uint64_t v9;
  void *v17;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;

  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a9 + 80) + **(int **)(a9 + 80));
  v17 = (void *)swift_task_alloc();
  *(void *)(v9 + 16) = v17;
  void *v17 = v9;
  v17[1] = sub_24CCFC30C;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

BOOL static TransportError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TransportError.hash(into:)()
{
  return sub_24CD07990();
}

uint64_t TransportError.hashValue.getter()
{
  return sub_24CD079A0();
}

BOOL sub_24CCFC398(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24CCFC3AC()
{
  return sub_24CD079A0();
}

uint64_t sub_24CCFC3F4()
{
  return sub_24CD07990();
}

uint64_t sub_24CCFC420()
{
  return sub_24CD079A0();
}

unint64_t sub_24CCFC468()
{
  unint64_t result = qword_26982ADF8;
  if (!qword_26982ADF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26982ADF8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TransportError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TransportError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x24CCFC638);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_24CCFC660(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CCFC66C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TransportError()
{
  return &type metadata for TransportError;
}

BOOL sub_24CCFC684(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24CCFC694()
{
  return sub_24CD07990();
}

uint64_t sub_24CCFC6BC()
{
  return sub_24CD079A0();
}

BOOL sub_24CCFC704(char *a1, char *a2)
{
  return sub_24CCFC684(*a1, *a2);
}

uint64_t sub_24CCFC718()
{
  return sub_24CCFC6BC();
}

uint64_t sub_24CCFC724()
{
  return sub_24CCFC694();
}

uint64_t sub_24CCFC730()
{
  return sub_24CD079A0();
}

uint64_t XPCService.transportDispatchService.getter()
{
  sub_24CD021B4();
  return swift_retain();
}

uint64_t sub_24CCFC7A0(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_24CCFC7B0()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t sub_24CCFC7B8(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t *static XPCService.makeDaemonService(machServiceName:)()
{
  type metadata accessor for XPCService();
  id v0 = objc_allocWithZone(MEMORY[0x263F08D68]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_24CD07720();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithMachServiceName_options_, v1, 0);

  swift_allocObject();
  return sub_24CCFC8F8(v2, 0);
}

uint64_t *XPCService.__allocating_init(connection:)(void *a1)
{
  return sub_24CCFC8F8(a1, 0);
}

uint64_t *sub_24CCFC8AC(void *a1, char a2)
{
  return sub_24CCFC8F8(a1, a2);
}

uint64_t *sub_24CCFC8F8(void *a1, char a2)
{
  uint64_t v5 = *v2;
  v2[4] = 0;
  type metadata accessor for TransportDispatchService();
  uint64_t v6 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v6 + 112) = MEMORY[0x263F8EE80];
  *((unsigned char *)v2 + 40) = a2;
  v2[2] = v6;
  v2[3] = (uint64_t)a1;
  BOOL v7 = self;
  id v8 = a1;
  id v9 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_26FF342E0);
  objc_msgSend(v8, sel_setRemoteObjectInterface_, v9);

  id v10 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_26FF342E0);
  objc_msgSend(v8, sel_setExportedInterface_, v10);

  objc_msgSend(v8, sel_setExportedObject_, v2);
  v20 = sub_24CCFCB84;
  uint64_t v21 = 0;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 1107296256;
  v18 = sub_24CCFCB88;
  v19 = &block_descriptor_83;
  uint64_t v11 = _Block_copy(&v16);
  objc_msgSend(v8, sel_setInterruptionHandler_, v11);
  _Block_release(v11);
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  v13 = (void *)swift_allocObject();
  v13[2] = *(void *)(v5 + 80);
  v13[3] = *(void *)(v5 + 88);
  v13[4] = v12;
  v20 = sub_24CD02F70;
  uint64_t v21 = v13;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 1107296256;
  v18 = sub_24CCFCB88;
  v19 = &block_descriptor_90;
  uint64_t v14 = _Block_copy(&v16);
  swift_release();
  objc_msgSend(v8, sel_setInvalidationHandler_, v14);

  _Block_release(v14);
  return v2;
}

uint64_t sub_24CCFCB88(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Void __swiftcall XPCService.invalidate()()
{
  if (*(unsigned char *)(v0 + 40) != 2)
  {
    *(unsigned char *)(v0 + 40) = 2;
    *(void *)(v0 + 32) = 0;
    swift_unknownObjectRelease();
    uint64_t v1 = *(void **)(v0 + 24);
    objc_msgSend(v1, sel_setInterruptionHandler_, 0);
    objc_msgSend(v1, sel_setInvalidationHandler_, 0);
    objc_msgSend(v1, sel_invalidate);
  }
}

uint64_t XPCService.deinit()
{
  uint64_t v1 = *(void **)(v0 + 24);
  objc_msgSend(v1, sel_setInterruptionHandler_, 0);
  objc_msgSend(v1, sel_setInvalidationHandler_, 0);
  objc_msgSend(v1, sel_invalidate);
  swift_release();

  swift_unknownObjectRelease();
  return v0;
}

uint64_t XPCService.__deallocating_deinit()
{
  XPCService.deinit();
  return MEMORY[0x270FA0228](v0, 41, 7);
}

uint64_t sub_24CCFCD04()
{
  uint64_t v1 = v0;
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    uint64_t v2 = *(void *)(v0 + 32);
    if (!v2)
    {
      int v3 = *(void **)(v0 + 24);
      v20[4] = (uint64_t)sub_24CD02F08;
      v20[5] = v0;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 1107296256;
      v20[2] = (uint64_t)sub_24CCFD3D4;
      v20[3] = (uint64_t)&block_descriptor_80;
      unsigned int v4 = _Block_copy(v20);
      swift_retain();
      swift_release();
      id v5 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v4);
      _Block_release(v4);
      sub_24CD07860();
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26982B010);
      int v6 = swift_dynamicCast();
      uint64_t v7 = v21;
      if (!v6) {
        uint64_t v7 = 0;
      }
      *(void *)(v0 + 32) = v7;
      swift_unknownObjectRelease();
      uint64_t v2 = *(void *)(v0 + 32);
      swift_unknownObjectRetain();
    }
    swift_unknownObjectRetain();
  }
  else
  {
    if (qword_26982AD70 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24CD07710();
    __swift_project_value_buffer(v8, (uint64_t)qword_26982B880);
    swift_retain_n();
    id v9 = sub_24CD076F0();
    os_log_type_t v10 = sub_24CD077E0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v20[0] = v12;
      *(_DWORD *)uint64_t v11 = 136315394;
      uint64_t v13 = sub_24CD079E0();
      uint64_t v21 = sub_24CD01B5C(v13, v14, v20);
      sub_24CD07830();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      LOBYTE(v21) = *(unsigned char *)(v1 + 40);
      type metadata accessor for XPCService.State();
      uint64_t v15 = sub_24CD07740();
      uint64_t v21 = sub_24CD01B5C(v15, v16, v20);
      sub_24CD07830();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24CCF8000, v9, v10, "[%s] XPC state is %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253311D50](v12, -1, -1);
      MEMORY[0x253311D50](v11, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    sub_24CD02300();
    uint64_t v17 = swift_allocError();
    unsigned char *v18 = 0;
    uint64_t v2 = v17;
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_24CCFD0A0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_24CD07710();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26982AD70 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_26982B880);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_retain();
  MEMORY[0x253311C30](a1);
  swift_retain();
  MEMORY[0x253311C30](a1);
  id v9 = sub_24CD076F0();
  int v10 = sub_24CD077E0();
  if (os_log_type_enabled(v9, (os_log_type_t)v10))
  {
    int v22 = v10;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v24 = v21;
    *(_DWORD *)uint64_t v11 = 136446466;
    id v12 = objc_msgSend(*(id *)(a2 + 24), sel_serviceName);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_24CD07730();
      unint64_t v16 = v15;
    }
    else
    {
      unint64_t v16 = 0xE900000000000029;
      uint64_t v14 = 0x6E776F6E6B6E7528;
    }
    uint64_t v23 = sub_24CD01B5C(v14, v16, &v24);
    sub_24CD07830();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    swift_getErrorValue();
    uint64_t v17 = sub_24CD07920();
    uint64_t v23 = sub_24CD01B5C(v17, v18, &v24);
    sub_24CD07830();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24CCF8000, v9, (os_log_type_t)v22, "Error on remote object proxy from %{public}s: %{public}s", (uint8_t *)v11, 0x16u);
    uint64_t v19 = v21;
    swift_arrayDestroy();
    MEMORY[0x253311D50](v19, -1, -1);
    MEMORY[0x253311D50](v11, -1, -1);
  }
  else
  {
    swift_release_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_24CCFD3D4(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24CCFD43C(int a1)
{
  *(void *)(v2 + 16) = v1;
  *(_DWORD *)(v2 + 32) = a1;
  return MEMORY[0x270FA2498](sub_24CCFD460, 0, 0);
}

uint64_t sub_24CCFD460()
{
  if (qword_26982AD70 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CD07710();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982B880);
  sub_24CD07024(0xD000000000000074, 0x800000024CD08DD0, 0x726F70736E617274, 0xED0000293A5F2874);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  void *v2 = v0;
  v2[1] = sub_24CCFD588;
  int v3 = *(_DWORD *)(v0 + 32);
  return sub_24CD054D8(v3, 0, 0xF000000000000000);
}

uint64_t sub_24CCFD588(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_24CCFD698(uint64_t a1, uint64_t a2, int a3, const void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982AF98);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = v9;
  *(void *)(v10 + 32) = a1;
  uint64_t v11 = sub_24CD077D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  id v12 = (void *)swift_allocObject();
  id v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26982AFE8;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26982AFF0;
  v13[5] = v12;
  swift_retain();
  sub_24CD017E4((uint64_t)v8, (uint64_t)&unk_26982AFF8, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_24CCFD814(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  swift_retain();
  uint64_t v6 = swift_task_alloc();
  v3[4] = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + 8) = sub_24CCFD8E8;
  *(void *)(v6 + 16) = a3;
  *(_DWORD *)(v6 + 32) = a1;
  return MEMORY[0x270FA2498](sub_24CCFD460, 0, 0);
}

uint64_t sub_24CCFD8E8(uint64_t a1, unint64_t a2)
{
  id v4 = v2;
  uint64_t v7 = *v3;
  uint64_t v8 = *v3;
  swift_task_dealloc();
  swift_release();
  if (v4)
  {
    uint64_t v9 = sub_24CD076B0();

    uint64_t v10 = 0;
    uint64_t v11 = (void *)v9;
  }
  else if (a2 >> 60 == 15)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_24CD076D0();
    sub_24CCFB518(a1, a2);
    uint64_t v9 = 0;
    uint64_t v11 = (void *)v10;
  }
  id v12 = *(void (***)(void, void, void))(v7 + 24);
  v12[2](v12, v10, v9);

  _Block_release(v12);
  uint64_t v13 = *(uint64_t (**)(void))(v8 + 8);
  return v13();
}

uint64_t sub_24CCFDAA0(int a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 16) = a2;
  *(_DWORD *)(v4 + 48) = a1;
  return MEMORY[0x270FA2498](sub_24CCFDAC8, 0, 0);
}

uint64_t sub_24CCFDAC8()
{
  if (qword_26982AD70 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24CD07710();
  __swift_project_value_buffer(v1, (uint64_t)qword_26982B880);
  sub_24CD07024(0xD000000000000074, 0x800000024CD08DD0, 0xD000000000000012, 0x800000024CD08E50);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  void *v2 = v0;
  v2[1] = sub_24CCFDBE8;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  int v5 = *(_DWORD *)(v0 + 48);
  return sub_24CD054D8(v5, v3, v4);
}

uint64_t sub_24CCFDBE8(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_24CCFDCF8(uint64_t a1, uint64_t a2, int a3, void *a4, const void *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982AF98);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(_DWORD *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = a1;
  uint64_t v13 = sub_24CD077D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26982AFA8;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26982AFB8;
  v15[5] = v14;
  id v16 = a4;
  swift_retain();
  sub_24CD017E4((uint64_t)v10, (uint64_t)&unk_26982AFC8, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_24CCFDE80(int a1, void *a2, void *aBlock, uint64_t a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  if (a2)
  {
    id v8 = a2;
    swift_retain();
    a2 = (void *)sub_24CD076E0();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  v4[4] = a2;
  v4[5] = v10;
  uint64_t v11 = swift_task_alloc();
  v4[6] = v11;
  *(void *)uint64_t v11 = v4;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = a4;
  *(void *)(v11 + 8) = sub_24CCFDF94;
  *(void *)(v11 + 16) = a2;
  *(_DWORD *)(v11 + 48) = a1;
  return MEMORY[0x270FA2498](sub_24CCFDAC8, 0, 0);
}

uint64_t sub_24CCFDF94(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *v3;
  unint64_t v8 = *(void *)(*v3 + 40);
  uint64_t v9 = *(void *)(*v3 + 32);
  uint64_t v10 = *v3;
  swift_task_dealloc();
  swift_release();
  sub_24CCFB518(v9, v8);
  if (v4)
  {
    uint64_t v11 = sub_24CD076B0();

    uint64_t v12 = 0;
    uint64_t v13 = (void *)v11;
  }
  else if (a2 >> 60 == 15)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v12 = sub_24CD076D0();
    sub_24CCFB518(a1, a2);
    uint64_t v11 = 0;
    uint64_t v13 = (void *)v12;
  }
  uint64_t v14 = *(void (***)(void, void, void))(v7 + 24);
  v14[2](v14, v12, v11);

  _Block_release(v14);
  uint64_t v15 = *(uint64_t (**)(void))(v10 + 8);
  return v15();
}

uint64_t sub_24CCFE188()
{
  XPCService.activate()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return sub_24CD02E98(v1);
}

Swift::Void __swiftcall XPCService.activate()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  if (qword_26982AD70 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_24CD07710();
  __swift_project_value_buffer(v3, (uint64_t)qword_26982B880);
  sub_24CD07024(0xD000000000000074, 0x800000024CD08DD0, 0x6574617669746361, 0xEA00000000002928);
  if (!*((unsigned char *)v0 + 40))
  {
    uint64_t v4 = (void *)v0[3];
    objc_msgSend((id)v1[3], sel_setExportedObject_, v1);
    uint64_t v13 = sub_24CCFCB84;
    uint64_t v14 = 0;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 1107296256;
    uint64_t v11 = sub_24CCFCB88;
    uint64_t v12 = &block_descriptor;
    int v5 = _Block_copy(&v9);
    objc_msgSend(v4, sel_setInterruptionHandler_, v5);
    _Block_release(v5);
    uint64_t v6 = swift_allocObject();
    swift_weakInit();
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = *(void *)(v2 + 80);
    v7[3] = *(void *)(v2 + 88);
    v7[4] = v6;
    uint64_t v13 = sub_24CD02FE4;
    uint64_t v14 = v7;
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 1107296256;
    uint64_t v11 = sub_24CCFCB88;
    uint64_t v12 = &block_descriptor_10;
    unint64_t v8 = _Block_copy(&v9);
    swift_release();
    objc_msgSend(v4, sel_setInvalidationHandler_, v8);
    _Block_release(v8);
    objc_msgSend(v4, sel_activate);
    *((unsigned char *)v1 + 40) = 1;
  }
}

void sub_24CCFE464()
{
}

uint64_t sub_24CCFE488(uint64_t a1)
{
  uint64_t v4 = *v1;
  int v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *int v5 = v2;
  v5[1] = sub_24CCFC30C;
  v5[17] = a1;
  v5[18] = v4;
  v5[19] = *v4;
  return MEMORY[0x270FA2498](sub_24CCFE5A8, 0, 0);
}

uint64_t XPCService.send(_:)(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  v2[19] = *v1;
  return MEMORY[0x270FA2498](sub_24CCFE5A8, 0, 0);
}

uint64_t sub_24CCFE5A8()
{
  uint64_t v1 = sub_24CCFCD04();
  *(void *)(v0 + 160) = v1;
  uint64_t v3 = (void *)v1;
  if (v1)
  {
    swift_unknownObjectRetain();
    sub_24CD07890();
    uint64_t v4 = *(unsigned int *)(v0 + 176);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_24CCFE75C;
    uint64_t v5 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24CD013D4;
    *(void *)(v0 + 104) = &block_descriptor_12;
    *(void *)(v0 + 112) = v5;
    objc_msgSend(v3, sel_transport_completionHandler_, v4, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_24CCFE75C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    uint64_t v2 = sub_24CCFE8E4;
  }
  else {
    uint64_t v2 = sub_24CCFE86C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CCFE86C()
{
  swift_unknownObjectRelease();
  sub_24CCFB518(v0[15], v0[16]);
  swift_unknownObjectRelease();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CCFE8E4()
{
  swift_willThrow();
  swift_unknownObjectRelease_n();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCFE95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_24CCFC30C;
  return XPCService.send<A>(_:)(a1, a2, a3, a4);
}

uint64_t XPCService.send<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[20] = a4;
  v5[21] = v4;
  v5[18] = a2;
  v5[19] = a3;
  v5[17] = a1;
  v5[22] = *v4;
  uint64_t v6 = sub_24CD07820();
  v5[23] = v6;
  v5[24] = *(void *)(v6 - 8);
  v5[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCFEB14, 0, 0);
}

{
  void *v4;
  void *v5;

  v5[20] = a4;
  v5[21] = v4;
  v5[18] = a2;
  v5[19] = a3;
  v5[17] = a1;
  v5[22] = *v4;
  return MEMORY[0x270FA2498](sub_24CCFF334, 0, 0);
}

uint64_t sub_24CCFEB14()
{
  uint64_t v1 = sub_24CCFCD04();
  *(void *)(v0 + 208) = v1;
  *(void *)(v0 + 216) = 0;
  uint64_t v4 = (void *)v1;
  if (v1)
  {
    swift_unknownObjectRetain();
    sub_24CD07890();
    uint64_t v5 = *(unsigned int *)(v0 + 232);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_24CCFEE48;
    uint64_t v6 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24CD013D4;
    *(void *)(v0 + 104) = &block_descriptor_14;
    *(void *)(v0 + 112) = v6;
    objc_msgSend(v4, sel_transport_completionHandler_, v5, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 152);
    uint64_t v7 = *(void *)(v0 + 160);
    uint64_t v9 = *(void (**)(void, unint64_t, uint64_t, uint64_t))(v7 + 16);
    sub_24CD02294(0, 0xF000000000000000);
    v9(0, 0xF000000000000000, v8, v7);
    uint64_t v10 = *(void *)(v0 + 200);
    uint64_t v11 = *(void *)(v0 + 152);
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 192) + 8))(v10, *(void *)(v0 + 184));
      sub_24CD02300();
      swift_allocError();
      unsigned char *v13 = 1;
      swift_willThrow();
      sub_24CCFB518(0, 0xF000000000000000);
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v14 = *(void *)(v0 + 136);
      swift_unknownObjectRelease();
      sub_24CCFB518(0, 0xF000000000000000);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v14, v10, v11);
    }
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_24CCFEE48()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_24CCFF164;
  }
  else {
    uint64_t v2 = sub_24CCFEF58;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CCFEF58()
{
  uint64_t v2 = v0[15];
  unint64_t v1 = v0[16];
  swift_unknownObjectRelease();
  uint64_t v3 = v0[27];
  uint64_t v5 = v0[19];
  uint64_t v4 = v0[20];
  uint64_t v6 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v4 + 16);
  sub_24CD02294(v2, v1);
  v6(v2, v1, v5, v4);
  if (v3)
  {
    swift_unknownObjectRelease();
    sub_24CCFB518(v2, v1);
LABEL_5:
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    goto LABEL_7;
  }
  uint64_t v7 = v0[25];
  uint64_t v8 = v0[19];
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    (*(void (**)(uint64_t, void))(v0[24] + 8))(v7, v0[23]);
    sub_24CD02300();
    swift_allocError();
    *uint64_t v10 = 1;
    swift_willThrow();
    sub_24CCFB518(v2, v1);
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  uint64_t v12 = v0[17];
  swift_unknownObjectRelease();
  sub_24CCFB518(v2, v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v12, v7, v8);
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
LABEL_7:
  return v11();
}

uint64_t sub_24CCFF164()
{
  swift_willThrow();
  swift_unknownObjectRelease_n();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCFF1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *v4;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24CCFC30C;
  v11[20] = a4;
  v11[21] = v10;
  v11[18] = a2;
  v11[19] = a3;
  v11[17] = a1;
  v11[22] = *v10;
  return MEMORY[0x270FA2498](sub_24CCFF334, 0, 0);
}

uint64_t sub_24CCFF334()
{
  uint64_t v1 = sub_24CCFCD04();
  *(void *)(v0 + 184) = v1;
  *(void *)(v0 + 192) = 0;
  uint64_t v3 = (void *)v1;
  if (v1)
  {
    swift_unknownObjectRetain();
    sub_24CD07890();
    uint64_t v4 = *(unsigned int *)(v0 + 208);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_24CCFF51C;
    uint64_t v5 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24CD013D4;
    *(void *)(v0 + 104) = &block_descriptor_16;
    *(void *)(v0 + 112) = v5;
    objc_msgSend(v3, sel_transport_completionHandler_, v4, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    (*(void (**)(void, unint64_t))(*(void *)(v0 + 160) + 16))(0, 0xF000000000000000);
    swift_unknownObjectRelease();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_24CCFF51C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_24CCFF6DC;
  }
  else {
    uint64_t v2 = sub_24CCFF62C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CCFF62C()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v0[20] + 16))(v2, v1);
  swift_unknownObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24CCFF6DC()
{
  swift_willThrow();
  swift_unknownObjectRelease_n();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CCFF758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_24CCFC30C;
  return XPCService.send<A>(_:payload:)(a1, a2, a3, a4);
}

uint64_t XPCService.send<A>(_:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[20] = a4;
  v5[21] = v4;
  v5[18] = a2;
  v5[19] = a3;
  v5[17] = a1;
  v5[22] = *v4;
  uint64_t v6 = sub_24CD07820();
  v5[23] = v6;
  v5[24] = *(void *)(v6 - 8);
  v5[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CCFF90C, 0, 0);
}

uint64_t sub_24CCFF90C()
{
  uint64_t v1 = sub_24CCFCD04();
  *(void *)(v0 + 208) = v1;
  uint64_t v3 = (void *)v1;
  uint64_t v4 = (uint64_t *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 200);
  uint64_t v6 = *(void *)(v0 + 152);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 192) + 16))(v5, *(void *)(v0 + 144), *(void *)(v0 + 184));
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    uint64_t v8 = 0;
    uint64_t v7 = *(void *)(v0 + 192);
    unint64_t v9 = 0xF000000000000000;
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 152));
    unint64_t v9 = v10;
    uint64_t v4 = (uint64_t *)(v0 + 152);
  }
  uint64_t v11 = *v4;
  *(void *)(v0 + 216) = v8;
  *(void *)(v0 + 224) = v9;
  (*(void (**)(void, uint64_t))(v7 + 8))(*(void *)(v0 + 200), v11);
  if (v3)
  {
    swift_unknownObjectRetain();
    sub_24CD07890();
    uint64_t v12 = *(unsigned int *)(v0 + 248);
    if (v9 >> 60 == 15)
    {
      uint64_t v13 = 0;
    }
    else
    {
      sub_24CD022A8(v8, v9);
      uint64_t v13 = sub_24CD076D0();
      sub_24CCFB518(v8, v9);
    }
    *(void *)(v0 + 232) = v13;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_24CCFFC24;
    uint64_t v15 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24CD013D4;
    *(void *)(v0 + 104) = &block_descriptor_18;
    *(void *)(v0 + 112) = v15;
    objc_msgSend(v3, sel_transport_data_completionHandler_, v12, v13, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    sub_24CCFB518(v8, v9);
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
}

uint64_t sub_24CCFFC24()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 240) = v1;
  if (v1) {
    uint64_t v2 = sub_24CCFFDD0;
  }
  else {
    uint64_t v2 = sub_24CCFFD34;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CCFFD34()
{
  unint64_t v1 = v0[28];
  uint64_t v2 = (void *)v0[29];
  uint64_t v3 = v0[27];
  swift_unknownObjectRelease();
  sub_24CCFB518(v3, v1);
  sub_24CCFB518(v0[15], v0[16]);
  swift_unknownObjectRelease();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24CCFFDD0()
{
  unint64_t v1 = (void *)v0[29];
  uint64_t v2 = v0[27];
  unint64_t v3 = v0[28];
  swift_willThrow();
  swift_unknownObjectRelease();
  sub_24CCFB518(v2, v3);
  swift_unknownObjectRelease();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24CCFFE74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_24CCFBAFC;
  return XPCService.send<A, B>(_:payload:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t XPCService.send<A, B>(_:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[23] = a7;
  v8[24] = v7;
  v8[21] = a5;
  v8[22] = a6;
  v8[19] = a3;
  v8[20] = a4;
  v8[17] = a1;
  v8[18] = a2;
  v8[25] = *v7;
  uint64_t v9 = sub_24CD07820();
  v8[26] = v9;
  v8[27] = *(void *)(v9 - 8);
  v8[28] = swift_task_alloc();
  uint64_t v10 = sub_24CD07820();
  v8[29] = v10;
  v8[30] = *(void *)(v10 - 8);
  v8[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CD000B8, 0, 0);
}

{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;

  v8[23] = a7;
  v8[24] = v7;
  v8[21] = a5;
  v8[22] = a6;
  v8[19] = a3;
  v8[20] = a4;
  v8[17] = a1;
  v8[18] = a2;
  v8[25] = *v7;
  uint64_t v9 = sub_24CD07820();
  v8[26] = v9;
  v8[27] = *(void *)(v9 - 8);
  v8[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CD00B8C, 0, 0);
}

uint64_t sub_24CD000B8()
{
  uint64_t v1 = sub_24CCFCD04();
  *(void *)(v0 + 256) = v1;
  uint64_t v4 = (void *)v1;
  uint64_t v5 = (uint64_t *)(v0 + 232);
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v7 = *(void *)(v0 + 160);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 240) + 16))(v6, *(void *)(v0 + 152), *(void *)(v0 + 232));
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t v9 = 0;
    uint64_t v8 = *(void *)(v0 + 240);
    unint64_t v10 = 0xF000000000000000;
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(v0 + 176) + 8))(*(void *)(v0 + 160));
    unint64_t v10 = v11;
    uint64_t v5 = (uint64_t *)(v0 + 160);
  }
  uint64_t v12 = *v5;
  *(void *)(v0 + 272) = v9;
  *(void *)(v0 + 280) = v10;
  *(void *)(v0 + 264) = 0;
  (*(void (**)(void, uint64_t))(v8 + 8))(*(void *)(v0 + 248), v12);
  if (v4)
  {
    swift_unknownObjectRetain();
    sub_24CD07890();
    uint64_t v13 = *(unsigned int *)(v0 + 304);
    if (v10 >> 60 == 15)
    {
      uint64_t v14 = 0;
    }
    else
    {
      sub_24CD022A8(v9, v10);
      uint64_t v14 = sub_24CD076D0();
      sub_24CCFB518(v9, v10);
    }
    *(void *)(v0 + 288) = v14;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_24CD0058C;
    uint64_t v21 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24CD013D4;
    *(void *)(v0 + 104) = &block_descriptor_20;
    *(void *)(v0 + 112) = v21;
    objc_msgSend(v4, sel_transport_data_completionHandler_, v13, v14, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  uint64_t v15 = *(void *)(v0 + 264);
  uint64_t v16 = *(void *)(v0 + 184);
  uint64_t v17 = *(void *)(v0 + 168);
  uint64_t v18 = *(void (**)(void, unint64_t, uint64_t, uint64_t))(v16 + 16);
  sub_24CD02294(0, 0xF000000000000000);
  v18(0, 0xF000000000000000, v17, v16);
  if (v15)
  {
    uint64_t v19 = *(void *)(v0 + 272);
    unint64_t v20 = *(void *)(v0 + 280);
    swift_unknownObjectRelease();
    sub_24CCFB518(v19, v20);
    sub_24CCFB518(0, 0xF000000000000000);
  }
  else
  {
    uint64_t v22 = *(void *)(v0 + 224);
    uint64_t v23 = *(void *)(v0 + 168);
    uint64_t v24 = *(void *)(v23 - 8);
    int v25 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23);
    uint64_t v27 = *(void *)(v0 + 272);
    unint64_t v26 = *(void *)(v0 + 280);
    if (v25 != 1)
    {
      uint64_t v29 = *(void *)(v0 + 136);
      swift_unknownObjectRelease();
      sub_24CCFB518(v27, v26);
      sub_24CCFB518(0, 0xF000000000000000);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v29, v22, v23);
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_3;
    }
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 216) + 8))(v22, *(void *)(v0 + 208));
    sub_24CD02300();
    swift_allocError();
    unsigned char *v28 = 1;
    swift_willThrow();
    sub_24CCFB518(0, 0xF000000000000000);
    sub_24CCFB518(v27, v26);
    swift_unknownObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
LABEL_3:
  return v2();
}

uint64_t sub_24CD0058C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 296) = v1;
  if (v1) {
    uint64_t v2 = sub_24CD008FC;
  }
  else {
    uint64_t v2 = sub_24CD0069C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD0069C()
{
  uint64_t v1 = (void *)v0[36];
  uint64_t v3 = v0[15];
  unint64_t v2 = v0[16];
  swift_unknownObjectRelease();

  uint64_t v4 = v0[33];
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[21];
  uint64_t v7 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v5 + 16);
  sub_24CD02294(v3, v2);
  v7(v3, v2, v6, v5);
  if (v4)
  {
    uint64_t v9 = v0[34];
    unint64_t v8 = v0[35];
    swift_unknownObjectRelease();
    sub_24CCFB518(v9, v8);
    sub_24CCFB518(v3, v2);
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    goto LABEL_7;
  }
  uint64_t v10 = v0[28];
  uint64_t v11 = v0[21];
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  uint64_t v15 = v0[34];
  unint64_t v14 = v0[35];
  if (v13 == 1)
  {
    (*(void (**)(uint64_t, void))(v0[27] + 8))(v10, v0[26]);
    sub_24CD02300();
    swift_allocError();
    *uint64_t v16 = 1;
    swift_willThrow();
    sub_24CCFB518(v3, v2);
    sub_24CCFB518(v15, v14);
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  uint64_t v18 = v0[17];
  swift_unknownObjectRelease();
  sub_24CCFB518(v15, v14);
  sub_24CCFB518(v3, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v18, v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
LABEL_7:
  return v17();
}

uint64_t sub_24CD008FC()
{
  uint64_t v1 = (void *)v0[36];
  uint64_t v2 = v0[34];
  unint64_t v3 = v0[35];
  swift_willThrow();
  swift_unknownObjectRelease();
  sub_24CCFB518(v2, v3);
  swift_unknownObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24CD009AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_24CCFC30C;
  return XPCService.send<A, B>(_:payload:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24CD00B8C()
{
  uint64_t v1 = sub_24CCFCD04();
  *(void *)(v0 + 232) = v1;
  uint64_t v4 = (void *)v1;
  uint64_t v5 = (uint64_t *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 224);
  uint64_t v7 = *(void *)(v0 + 160);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 216) + 16))(v6, *(void *)(v0 + 152), *(void *)(v0 + 208));
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t v9 = 0;
    uint64_t v8 = *(void *)(v0 + 216);
    unint64_t v10 = 0xF000000000000000;
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(v0 + 176) + 8))(*(void *)(v0 + 160));
    unint64_t v10 = v11;
    uint64_t v5 = (uint64_t *)(v0 + 160);
  }
  uint64_t v12 = *v5;
  *(void *)(v0 + 248) = v9;
  *(void *)(v0 + 256) = v10;
  *(void *)(v0 + 240) = 0;
  (*(void (**)(void, uint64_t))(v8 + 8))(*(void *)(v0 + 224), v12);
  if (v4)
  {
    swift_unknownObjectRetain();
    sub_24CD07890();
    uint64_t v13 = *(unsigned int *)(v0 + 280);
    if (v10 >> 60 == 15)
    {
      uint64_t v14 = 0;
    }
    else
    {
      sub_24CD022A8(v9, v10);
      uint64_t v14 = sub_24CD076D0();
      sub_24CCFB518(v9, v10);
    }
    *(void *)(v0 + 264) = v14;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_24CD00EFC;
    uint64_t v15 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_24CD013D4;
    *(void *)(v0 + 104) = &block_descriptor_22;
    *(void *)(v0 + 112) = v15;
    objc_msgSend(v4, sel_transport_data_completionHandler_, v13, v14, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    (*(void (**)(void, unint64_t))(*(void *)(v0 + 184) + 16))(0, 0xF000000000000000);
    sub_24CCFB518(*(void *)(v0 + 248), *(void *)(v0 + 256));
    swift_unknownObjectRelease();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_24CD00EFC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 272) = v1;
  if (v1) {
    uint64_t v2 = sub_24CD01100;
  }
  else {
    uint64_t v2 = sub_24CD0100C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD0100C()
{
  uint64_t v1 = (void *)v0[33];
  uint64_t v3 = v0[15];
  uint64_t v2 = v0[16];
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v0[23] + 16))(v3, v2);
  sub_24CCFB518(v0[31], v0[32]);
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24CD01100()
{
  uint64_t v1 = (void *)v0[33];
  uint64_t v2 = v0[31];
  unint64_t v3 = v0[32];
  swift_willThrow();
  swift_unknownObjectRelease();
  sub_24CCFB518(v2, v3);
  swift_unknownObjectRelease();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24CD011A4()
{
  sub_24CD021B4();
  return swift_retain();
}

void sub_24CD011D8()
{
  if (qword_26982AD70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CD07710();
  __swift_project_value_buffer(v0, (uint64_t)qword_26982B880);
  oslog = sub_24CD076F0();
  os_log_type_t v1 = sub_24CD077E0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_24CCF8000, oslog, v1, "XPC connection interrupted", v2, 2u);
    MEMORY[0x253311D50](v2, -1, -1);
  }
}

uint64_t sub_24CD012C0()
{
  if (qword_26982AD70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24CD07710();
  __swift_project_value_buffer(v0, (uint64_t)qword_26982B880);
  os_log_type_t v1 = sub_24CD076F0();
  os_log_type_t v2 = sub_24CD077E0();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_24CCF8000, v1, v2, "XPC connection invalidated", v3, 2u);
    MEMORY[0x253311D50](v3, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    XPCService.invalidate()();
    return swift_release();
  }
  return result;
}

uint64_t sub_24CD013D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982B008);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      id v8 = a2;
      uint64_t v9 = sub_24CD076E0();
      unint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v11 = 0xF000000000000000;
    }
    v13[0] = v9;
    v13[1] = v11;
    sub_24CD02EA0((uint64_t)v13, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t static XPCService.== infix(_:_:)()
{
  return sub_24CD07800() & 1;
}

void XPCService.hash(into:)()
{
  id v1 = *(id *)(v0 + 24);
  sub_24CD07810();
}

uint64_t XPCService.hashValue.getter()
{
  return sub_24CD079A0();
}

uint64_t sub_24CD015A0()
{
  return XPCService.hashValue.getter();
}

void sub_24CD015C4()
{
}

uint64_t sub_24CD015E8()
{
  return sub_24CD079A0();
}

uint64_t sub_24CD01628()
{
  return static XPCService.== infix(_:_:)() & 1;
}

uint64_t sub_24CD0164C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24CCFC30C;
  return v6();
}

uint64_t sub_24CD01718(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24CCFC30C;
  return v7();
}

uint64_t sub_24CD017E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CD077D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CD077C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CD02C0C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CD077B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24CD01988(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24CD01A64;
  return v6(a1);
}

uint64_t sub_24CD01A64()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CD01B5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CD01C30(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CD02F10((uint64_t)v12, *a3);
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
      sub_24CD02F10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24CD01C30(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CD07840();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CD01DEC(a5, a6);
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
  uint64_t v8 = sub_24CD078A0();
  if (!v8)
  {
    sub_24CD078B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CD078E0();
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

uint64_t sub_24CD01DEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CD01E84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CD02064(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CD02064(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CD01E84(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CD01FFC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CD07880();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CD078B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CD07780();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CD078E0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CD078B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CD01FFC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982B018);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CD02064(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26982B018);
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
  uint64_t result = sub_24CD078E0();
  __break(1u);
  return result;
}

uint64_t sub_24CD021B4()
{
  return *(void *)(v0 + 16);
}

uint64_t type metadata accessor for XPCService()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_24CD02224()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CD0225C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CD02294(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24CD022A8(a1, a2);
  }
  return a1;
}

uint64_t sub_24CD022A8(uint64_t a1, unint64_t a2)
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

unint64_t sub_24CD02300()
{
  unint64_t result = qword_26982AE20;
  if (!qword_26982AE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982AE20);
  }
  return result;
}

unint64_t sub_24CD02354()
{
  unint64_t result = qword_26982AE48[0];
  if (!qword_26982AE48[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26982AE48);
  }
  return result;
}

uint64_t sub_24CD02394(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_24CD0239C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24CD023BC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for XPCService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCService);
}

uint64_t dispatch thunk of XPCService.transport(_:)(uint64_t a1)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 192) + **(int **)(*(void *)v1 + 192));
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_24CD02FEC;
  return v6(a1);
}

uint64_t dispatch thunk of XPCService.transport(_:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 200)
                                                          + **(int **)(*(void *)v3 + 200));
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24CD0265C;
  return v10(a1, a2, a3);
}

uint64_t sub_24CD0265C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_24CD02768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_24CD02770(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24CD02800(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CD028CCLL);
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

uint64_t type metadata accessor for XPCService.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CD0290C()
{
  return swift_getWitnessTable();
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

uint64_t sub_24CD0296C()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CD029B4()
{
  int v2 = *(_DWORD *)(v0 + 16);
  int v3 = *(void **)(v0 + 24);
  unsigned int v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unsigned int v6 = v1;
  v6[1] = sub_24CCFBAFC;
  BOOL v7 = (uint64_t (*)(int, void *, void *, uint64_t))((char *)&dword_26982AFA0 + dword_26982AFA0);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_24CD02A7C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unsigned int v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24CCFC30C;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26982AFB0 + dword_26982AFB0);
  return v6(v2, v3, v4);
}

uint64_t sub_24CD02B40(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_24CCFC30C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26982AFC0 + dword_26982AFC0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24CD02C0C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982AF98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CD02C6C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CD02CA4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CCFBAFC;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26982AFD0 + dword_26982AFD0);
  return v6(a1, v4);
}

uint64_t sub_24CD02D5C()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CD02D9C()
{
  int v2 = *(_DWORD *)(v0 + 16);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24CCFC30C;
  unsigned int v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_26982AFE0 + dword_26982AFE0);
  return v6(v2, v4, v3);
}

uint64_t objectdestroy_36Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CD02E98(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24CD02EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982B000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CD02F08(void *a1)
{
  return sub_24CCFD0A0(a1, v1);
}

uint64_t sub_24CD02F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24CD02F70()
{
  return sub_24CD012C0();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t TransportDispatchService.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE80];
  return v0;
}

uint64_t TransportDispatchService.init()()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE80];
  return v0;
}

uint64_t sub_24CD03060(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  unsigned int v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24CD03130;
  return v6();
}

uint64_t sub_24CD03130()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24CD03260, 0, 0);
  }
}

uint64_t sub_24CD03260()
{
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)(v1 + 24) = &type metadata for VoidTransportSerializable;
  *(void *)(v1 + 32) = &off_26FF31FD0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24CD03290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  return MEMORY[0x270FA2498](sub_24CD032B8, v5, 0);
}

uint64_t sub_24CD032B8()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  long long v9 = *(_OWORD *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 40), *(void *)(*(void *)(v0 + 40) + 24));
  sub_24CD07890();
  unsigned int v4 = *(_DWORD *)(v0 + 88);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = v9;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *(void *)(v1 + 112);
  *(void *)(v1 + 112) = 0x8000000000000000;
  sub_24CD06070((uint64_t)&unk_26982B0B0, v5, v4, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 112) = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24CD03400(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a1;
  uint64_t v8 = sub_24CD07820();
  v6[5] = v8;
  v6[6] = *(void *)(v8 - 8);
  uint64_t v9 = swift_task_alloc();
  v6[7] = v9;
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v10 = (void *)swift_task_alloc();
  v6[8] = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_24CD0354C;
  return v12(v9);
}

uint64_t sub_24CD0354C()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24CD03790;
  }
  else {
    uint64_t v2 = sub_24CD03660;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD03660()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[3];
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = v0[2];
    (*(void (**)(uint64_t, void))(v0[6] + 8))(v1, v0[5]);
    *(void *)(v4 + 32) = 0;
    *(_OWORD *)uint64_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
  }
  else
  {
    uint64_t v5 = v0[4];
    unsigned int v6 = (uint64_t *)v0[2];
    v6[3] = v2;
    v6[4] = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v6);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_1, v1, v2);
  }
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24CD03790()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CD037F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  return MEMORY[0x270FA2498](sub_24CD0381C, v5, 0);
}

uint64_t sub_24CD0381C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  long long v9 = *(_OWORD *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 40), *(void *)(*(void *)(v0 + 40) + 24));
  sub_24CD07890();
  unsigned int v4 = *(_DWORD *)(v0 + 88);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = v9;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *(void *)(v1 + 112);
  *(void *)(v1 + 112) = 0x8000000000000000;
  sub_24CD06070((uint64_t)&unk_26982B0A0, v5, v4, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 112) = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24CD03964(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 48) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a1;
  uint64_t v9 = sub_24CD07820();
  *(void *)(v6 + 56) = v9;
  *(void *)(v6 + 64) = *(void *)(v9 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  *(void *)(v6 + 80) = *(void *)(a5 - 8);
  *(void *)(v6 + 88) = swift_task_alloc();
  *(_OWORD *)(v6 + 96) = *a2;
  return MEMORY[0x270FA2498](sub_24CD03A90, 0, 0);
}

uint64_t sub_24CD03A90()
{
  uint64_t v1 = v0[12];
  unint64_t v2 = v0[13];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v3 + 16);
  sub_24CD02294(v1, v2);
  v5(v1, v2, v4, v3);
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[10];
  uint64_t v8 = v0[5];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v8) == 1)
  {
    (*(void (**)(uint64_t, void))(v0[8] + 8))(v6, v0[7]);
    sub_24CD02300();
    swift_allocError();
    unsigned char *v9 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = (int *)v0[3];
    (*(void (**)(void, uint64_t, uint64_t))(v7 + 32))(v0[11], v6, v8);
    uint64_t v15 = (uint64_t (*)(uint64_t))((char *)v12 + *v12);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[14] = v13;
    void *v13 = v0;
    v13[1] = sub_24CD03CB4;
    uint64_t v14 = v0[11];
    return v15(v14);
  }
}

uint64_t sub_24CD03CB4()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_24CD03E6C;
  }
  else {
    unint64_t v2 = sub_24CD03DC8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD03DC8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[2];
  *(void *)(v4 + 24) = &type metadata for VoidTransportSerializable;
  *(void *)(v4 + 32) = &off_26FF31FD0;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24CD03E6C()
{
  (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[5]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CD03EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  return MEMORY[0x270FA2498](sub_24CD03F1C, v5, 0);
}

uint64_t sub_24CD03F1C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  long long v9 = *(_OWORD *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 40), *(void *)(*(void *)(v0 + 40) + 24));
  sub_24CD07890();
  unsigned int v4 = *(_DWORD *)(v0 + 88);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = v9;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *(void *)(v1 + 112);
  *(void *)(v1 + 112) = 0x8000000000000000;
  sub_24CD06070((uint64_t)&unk_26982B090, v5, v4, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 112) = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24CD04064(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 48) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a1;
  uint64_t v8 = sub_24CD07820();
  *(void *)(v6 + 56) = v8;
  *(void *)(v6 + 64) = *(void *)(v8 - 8);
  *(void *)(v6 + 72) = swift_task_alloc();
  *(_OWORD *)(v6 + 80) = *a2;
  return MEMORY[0x270FA2498](sub_24CD0413C, 0, 0);
}

uint64_t sub_24CD0413C()
{
  uint64_t v1 = v0[10];
  unint64_t v2 = v0[11];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v3 + 16);
  sub_24CD02294(v1, v2);
  v5(v1, v2, v4, v3);
  long long v9 = (uint64_t (*)(uint64_t))(v0[3] + *(int *)v0[3]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[12] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24CD042BC;
  uint64_t v7 = v0[9];
  return v9(v7);
}

uint64_t sub_24CD042BC()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_24CD04468;
  }
  else {
    unint64_t v2 = sub_24CD043D0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD043D0()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[2];
  *(void *)(v4 + 24) = &type metadata for VoidTransportSerializable;
  *(void *)(v4 + 32) = &off_26FF31FD0;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24CD04468()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CD044E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[11] = a7;
  v8[12] = v7;
  v8[9] = a5;
  v8[10] = a6;
  v8[7] = a3;
  v8[8] = a4;
  v8[5] = a1;
  v8[6] = a2;
  return MEMORY[0x270FA2498](sub_24CD04510, v7, 0);
}

uint64_t sub_24CD04510()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  long long v9 = *(_OWORD *)(v0 + 80);
  long long v10 = *(_OWORD *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 40), *(void *)(*(void *)(v0 + 40) + 24));
  sub_24CD07890();
  unsigned int v4 = *(_DWORD *)(v0 + 104);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = v10;
  *(_OWORD *)(v5 + 32) = v9;
  *(void *)(v5 + 48) = v3;
  *(void *)(v5 + 56) = v2;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *(void *)(v1 + 112);
  *(void *)(v1 + 112) = 0x8000000000000000;
  sub_24CD06070((uint64_t)&unk_26982B080, v5, v4, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 112) = v11;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24CD04660(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = a8;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = a4;
  *(void *)(v8 + 16) = a1;
  uint64_t v11 = sub_24CD07820();
  *(void *)(v8 + 72) = v11;
  *(void *)(v8 + 80) = *(void *)(v11 - 8);
  *(void *)(v8 + 88) = swift_task_alloc();
  uint64_t v12 = sub_24CD07820();
  *(void *)(v8 + 96) = v12;
  *(void *)(v8 + 104) = *(void *)(v12 - 8);
  *(void *)(v8 + 112) = swift_task_alloc();
  *(void *)(v8 + 120) = *(void *)(a5 - 8);
  *(void *)(v8 + 128) = swift_task_alloc();
  *(_OWORD *)(v8 + 136) = *a2;
  return MEMORY[0x270FA2498](sub_24CD047F0, 0, 0);
}

uint64_t sub_24CD047F0()
{
  uint64_t v1 = v0[17];
  unint64_t v2 = v0[18];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v5 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v3 + 16);
  sub_24CD02294(v1, v2);
  v5(v1, v2, v4, v3);
  uint64_t v6 = v0[14];
  uint64_t v7 = v0[15];
  uint64_t v8 = v0[5];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v6, 1, v8) == 1)
  {
    (*(void (**)(uint64_t, void))(v0[13] + 8))(v6, v0[12]);
    sub_24CD02300();
    swift_allocError();
    unsigned char *v9 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = (int *)v0[3];
    (*(void (**)(void, uint64_t, uint64_t))(v7 + 32))(v0[16], v6, v8);
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)v12 + *v12);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[19] = v13;
    void *v13 = v0;
    v13[1] = sub_24CD04A28;
    uint64_t v14 = v0[16];
    uint64_t v15 = v0[11];
    return v16(v15, v14);
  }
}

uint64_t sub_24CD04A28()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_24CD04CC8;
  }
  else {
    unint64_t v2 = sub_24CD04B3C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD04B3C()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[6];
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v6 = v0[15];
  uint64_t v5 = v0[16];
  if (v4 == 1)
  {
    uint64_t v7 = v0[9];
    uint64_t v8 = v0[10];
    uint64_t v9 = v0[2];
    (*(void (**)(void, void))(v6 + 8))(v0[16], v0[5]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v7);
    *(void *)(v9 + 32) = 0;
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
  }
  else
  {
    uint64_t v10 = v0[8];
    uint64_t v11 = v0[5];
    uint64_t v12 = (uint64_t *)v0[2];
    uint64_t v12[3] = v2;
    v12[4] = v10;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_1, v1, v2);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v11);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24CD04CC8()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[5]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CD04D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[11] = a7;
  v8[12] = v7;
  v8[9] = a5;
  v8[10] = a6;
  v8[7] = a3;
  v8[8] = a4;
  v8[5] = a1;
  v8[6] = a2;
  return MEMORY[0x270FA2498](sub_24CD04D90, v7, 0);
}

uint64_t sub_24CD04D90()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  long long v9 = *(_OWORD *)(v0 + 80);
  long long v10 = *(_OWORD *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 40), *(void *)(*(void *)(v0 + 40) + 24));
  sub_24CD07890();
  unsigned int v4 = *(_DWORD *)(v0 + 104);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = v10;
  *(_OWORD *)(v5 + 32) = v9;
  *(void *)(v5 + 48) = v3;
  *(void *)(v5 + 56) = v2;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *(void *)(v1 + 112);
  *(void *)(v1 + 112) = 0x8000000000000000;
  sub_24CD06070((uint64_t)&unk_26982B070, v5, v4, isUniquelyReferenced_nonNull_native);
  *(void *)(v1 + 112) = v11;
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24CD04EE0(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = a8;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = a4;
  *(void *)(v8 + 16) = a1;
  uint64_t v10 = sub_24CD07820();
  *(void *)(v8 + 72) = v10;
  *(void *)(v8 + 80) = *(void *)(v10 - 8);
  *(void *)(v8 + 88) = swift_task_alloc();
  uint64_t v11 = sub_24CD07820();
  *(void *)(v8 + 96) = v11;
  *(void *)(v8 + 104) = *(void *)(v11 - 8);
  *(void *)(v8 + 112) = swift_task_alloc();
  *(_OWORD *)(v8 + 120) = *a2;
  return MEMORY[0x270FA2498](sub_24CD05020, 0, 0);
}

uint64_t sub_24CD05020()
{
  uint64_t v1 = v0[15];
  unint64_t v2 = v0[16];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5];
  uint64_t v5 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v3 + 16);
  sub_24CD02294(v1, v2);
  v5(v1, v2, v4, v3);
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))(v0[3] + *(int *)v0[3]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[17] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24CD051B4;
  uint64_t v7 = v0[14];
  uint64_t v8 = v0[11];
  return v10(v8, v7);
}

uint64_t sub_24CD051B4()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_24CD05450;
  }
  else {
    unint64_t v2 = sub_24CD052C8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CD052C8()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[6];
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v6 = v0[13];
  uint64_t v5 = v0[14];
  uint64_t v7 = v0[12];
  if (v4 == 1)
  {
    uint64_t v8 = v0[9];
    uint64_t v9 = v0[10];
    uint64_t v10 = v0[2];
    (*(void (**)(void, void))(v6 + 8))(v0[14], v0[12]);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v8);
    *(void *)(v10 + 32) = 0;
    *(_OWORD *)uint64_t v10 = 0u;
    *(_OWORD *)(v10 + 16) = 0u;
  }
  else
  {
    uint64_t v11 = v0[8];
    uint64_t v12 = (uint64_t *)v0[2];
    uint64_t v12[3] = v2;
    v12[4] = v11;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_1, v1, v2);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24CD05450()
{
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24CD054D8(int a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 104) = a3;
  *(void *)(v4 + 112) = v3;
  *(void *)(v4 + 96) = a2;
  *(_DWORD *)(v4 + 144) = a1;
  return MEMORY[0x270FA2498](sub_24CD05500, v3, 0);
}

uint64_t sub_24CD05500()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_24CD059C4(*(_DWORD *)(v0 + 144)), (v4 & 1) != 0))
  {
    uint64_t v5 = *(void *)(v2 + 56) + 16 * v3;
    uint64_t v6 = *(int **)v5;
    *(void *)(v0 + 120) = *(void *)(v5 + 8);
    *(_OWORD *)(v0 + 80) = *(_OWORD *)(v0 + 96);
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
    swift_retain();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_24CD056A4;
    return v11(v0 + 16, v0 + 80);
  }
  else
  {
    sub_24CD02300();
    swift_allocError();
    unsigned char *v9 = 3;
    swift_willThrow();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_24CD056A4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 112);
    char v4 = sub_24CD058E8;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 112);
    swift_release();
    char v4 = sub_24CD057C8;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24CD057C8()
{
  uint64_t v1 = v0[5];
  if (v1)
  {
    uint64_t v2 = v0[17];
    uint64_t v3 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v1, v3);
    if (v2)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
      uint64_t v6 = (uint64_t (*)(void))v0[1];
      return v6();
    }
    uint64_t v8 = v4;
    unint64_t v9 = v5;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  }
  else
  {
    sub_24CD05A0C((uint64_t)(v0 + 2));
    uint64_t v8 = 0;
    unint64_t v9 = 0xF000000000000000;
  }
  uint64_t v10 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v10(v8, v9);
}

uint64_t sub_24CD058E8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t TransportDispatchService.deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t TransportDispatchService.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t TransportDispatchService.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24CD059B8()
{
  return v0;
}

unint64_t sub_24CD059C4(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x253311890](*(void *)(v1 + 40), a1, 4);
  return sub_24CD061B0(a1, v3);
}

uint64_t sub_24CD05A0C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982B028);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for TransportDispatchService()
{
  return self;
}

uint64_t method lookup function for TransportDispatchService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TransportDispatchService);
}

uint64_t dispatch thunk of TransportDispatchService.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TransportDispatchService.dispatch(_:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 184)
                                                          + **(int **)(*(void *)v3 + 184));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  void *v8 = v4;
  v8[1] = sub_24CD0265C;
  return v10(a1, a2, a3);
}

uint64_t sub_24CD05C1C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982B060);
  uint64_t result = sub_24CD078D0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v29 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
    v31 = v3;
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v13) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v13) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v13)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v31;
                goto LABEL_40;
              }
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                uint64_t *v9 = v29;
              }
              uint64_t v3 = v31;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v13) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = *(unsigned int *)(*(void *)(v5 + 48) + 4 * v20);
      long long v32 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = MEMORY[0x253311890](*(void *)(v7 + 40), v28, 4);
      uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v17 == v25;
          if (v17 == v25) {
            unint64_t v17 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v14 + 8 * v17);
        }
        while (v27 == -1);
        unint64_t v18 = __clz(__rbit64(~v27)) + (v17 << 6);
      }
      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v18) = v28;
      *(_OWORD *)(*(void *)(v7 + 56) + 16 * v18) = v32;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_24CD05ED4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24CD07870();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (_DWORD *)(v9 + 4 * v6);
        uint64_t result = MEMORY[0x253311890](*(void *)(a2 + 40), *v10, 4);
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (_DWORD *)(v9 + 4 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *uint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (_OWORD *)(v15 + 16 * v3);
            unint64_t v17 = (_OWORD *)(v15 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *unint64_t v16 = *v17;
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
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24CD06070(uint64_t a1, uint64_t a2, unsigned int a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24CD059C4(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_24CD0624C();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_release();
      void *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_DWORD *)(v18[6] + 4 * v12) = a3;
    uint64_t v21 = (void *)(v18[7] + 16 * v12);
    *uint64_t v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_24CD05C1C(result, a4 & 1);
  uint64_t result = sub_24CD059C4(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    unint64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_24CD07910();
  __break(1u);
  return result;
}

unint64_t sub_24CD061B0(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_24CD0624C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26982B060);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24CD078C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 4 * v15;
    int v17 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(_DWORD *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
    unint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24CD063F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[5] = a2;
  uint64_t v8 = *(void *)(a5 - 8);
  v6[10] = v8;
  v6[11] = swift_task_alloc();
  (*(void (**)(void))(v8 + 16))();
  return MEMORY[0x270FA2498](sub_24CD064E8, a4, 0);
}

uint64_t sub_24CD064E8()
{
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 40);
  sub_24CD07890();
  unsigned int v11 = *(_DWORD *)(v0 + 96);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v4;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *(void *)(v5 + 112);
  *(void *)(v5 + 112) = 0x8000000000000000;
  sub_24CD06070((uint64_t)&unk_26982B0C8, v7, v11, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 112) = v12;
  swift_bridgeObjectRelease();
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  int64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_24CD06640(uint64_t a1, uint64_t a2)
{
  sub_24CD07890();
  uint64_t v3 = (uint64_t *)(a2 + 112);
  swift_beginAccess();
  unint64_t v4 = sub_24CD059C4(v11);
  if (v5)
  {
    unint64_t v6 = v4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    uint64_t v10 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_24CD0624C();
      uint64_t v8 = v10;
    }
    sub_24CD05ED4(v6, v8);
    *uint64_t v3 = v8;
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_endAccess();
}

uint64_t sub_24CD06718()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24CD06750(uint64_t a1, _OWORD *a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v11 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_24CCFBAFC;
  return sub_24CD04EE0(a1, a2, v11, v10, v6, v7, v8, v9);
}

uint64_t sub_24CD0682C(uint64_t a1, _OWORD *a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v11 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_24CCFC30C;
  return sub_24CD04660(a1, a2, v11, v10, v6, v7, v8, v9);
}

uint64_t sub_24CD06908()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24CD06940(uint64_t a1, _OWORD *a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_24CCFC30C;
  return sub_24CD04064(a1, a2, v9, v8, v6, v7);
}

uint64_t sub_24CD06A08(uint64_t a1, _OWORD *a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_24CCFC30C;
  return sub_24CD03964(a1, a2, v9, v8, v6, v7);
}

uint64_t sub_24CD06AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = (int *)v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_24CCFC30C;
  return sub_24CD03400(a1, a2, v9, v8, v6, v7);
}

uint64_t sub_24CD06B98()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CD06BD0(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_24CCFC30C;
  v5[2] = a1;
  uint64_t v8 = (uint64_t (*)(void))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[3] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_24CD03130;
  return v8();
}

ValueMetadata *type metadata accessor for VoidTransportSerializable()
{
  return &type metadata for VoidTransportSerializable;
}

uint64_t sub_24CD06D0C()
{
  return 0;
}

uint64_t sub_24CD06D18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24CD06D48()
{
  return 0;
}

void sub_24CD06D54(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24CD06D60(uint64_t a1)
{
  unint64_t v2 = sub_24CD06F10();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24CD06D9C(uint64_t a1)
{
  unint64_t v2 = sub_24CD06F10();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24CD06DD8(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_24CD06E00(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26982B0D0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24CD06F10();
  sub_24CD079B0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24CD06F10()
{
  unint64_t result = qword_26982B0D8;
  if (!qword_26982B0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982B0D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for VoidTransportSerializable.CodingKeys()
{
  return &type metadata for VoidTransportSerializable.CodingKeys;
}

unint64_t sub_24CD06F78()
{
  unint64_t result = qword_26982B0E0;
  if (!qword_26982B0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982B0E0);
  }
  return result;
}

unint64_t sub_24CD06FD0()
{
  unint64_t result = qword_26982B0E8;
  if (!qword_26982B0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982B0E8);
  }
  return result;
}

void sub_24CD07024(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = sub_24CD07220(a1, a2, a3, a4);
  unint64_t v6 = v5;
  swift_bridgeObjectRetain();
  oslog = sub_24CD076F0();
  os_log_type_t v7 = sub_24CD077F0();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v11 = v9;
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_bridgeObjectRetain();
    sub_24CD01B5C(v4, v6, &v11);
    sub_24CD07830();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CCF8000, oslog, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253311D50](v9, -1, -1);
    MEMORY[0x253311D50](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_24CD071B0()
{
  uint64_t v0 = sub_24CD07710();
  __swift_allocate_value_buffer(v0, qword_26982B880);
  __swift_project_value_buffer(v0, (uint64_t)qword_26982B880);
  return sub_24CD07700();
}

uint64_t sub_24CD07220(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_24CD07598();
  uint64_t v8 = sub_24CD07850();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v10 = v8 + 16 * v9;
    a1 = *(void *)(v10 + 16);
    a2 = *(void *)(v10 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_24CD074A8(46, 0xE100000000000000, a1, a2);
  uint64_t v11 = sub_24CD077A0();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  MEMORY[0x253311670](v11, v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_24CD074A8(40, 0xE100000000000000, a3, a4);
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_24CD077A0();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  MEMORY[0x253311670](v18, v20, v22, v24);
  swift_bridgeObjectRelease();
  unint64_t v25 = pthread_self();
  pthread_mach_thread_np(v25);
  sub_24CD078F0();
  sub_24CD07770();
  swift_bridgeObjectRelease();
  sub_24CD07770();
  sub_24CD07770();
  swift_bridgeObjectRelease();
  sub_24CD07770();
  sub_24CD07770();
  swift_bridgeObjectRelease();
  return 91;
}

unint64_t sub_24CD074A8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_24CD07790() != a1 || v9 != a2)
  {
    char v10 = sub_24CD07900();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_24CD07760();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_24CD07598()
{
  unint64_t result = qword_26982B0F0;
  if (!qword_26982B0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26982B0F0);
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

uint64_t sub_24CD07650()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24CD07660()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24CD07670()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24CD07680()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24CD07690()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24CD076A0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24CD076B0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24CD076C0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24CD076D0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24CD076E0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24CD076F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CD07700()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24CD07710()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CD07720()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CD07730()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CD07740()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CD07750()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24CD07760()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24CD07770()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CD07780()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CD07790()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24CD077A0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24CD077B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CD077C0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CD077D0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CD077E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24CD077F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24CD07800()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24CD07810()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_24CD07820()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24CD07830()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CD07840()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CD07850()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24CD07860()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24CD07870()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24CD07880()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CD07890()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_24CD078A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CD078B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CD078C0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24CD078D0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24CD078E0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CD078F0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CD07900()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24CD07910()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24CD07920()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24CD07930()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CD07940()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CD07950()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CD07960()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CD07970()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_24CD07980()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CD07990()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CD079A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24CD079B0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24CD079E0()
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

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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