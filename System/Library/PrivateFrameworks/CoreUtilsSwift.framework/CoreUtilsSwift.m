uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
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

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t __swift_memcpy6_1(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)__n128 result = v2;
  return result;
}

uint64_t CUClock.Instant.advanced(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = MEMORY[0x22A665530](*v3, v3[1], a1, a2);
  *a3 = result;
  a3[1] = v6;
  return result;
}

void CUClock.Instant.duration(to:)()
{
}

uint64_t static CUClock.Instant.< infix(_:_:)()
{
  return sub_226C34408();
}

uint64_t CUClock.Instant.hash(into:)()
{
  return sub_226C34448();
}

uint64_t static CUClock.Instant.== infix(_:_:)(void *a1, void *a2)
{
  return MEMORY[0x270F9FFC8](*a1, a1[1], *a2, a2[1]);
}

uint64_t CUClock.Instant.hashValue.getter()
{
  return sub_226C34388();
}

uint64_t sub_226C000C4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = MEMORY[0x22A665530](*v2, v2[1], *a1, a1[1]);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_226C000F4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = MEMORY[0x22A665540](*a1, a1[1], *v2, v2[1]);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_226C00128()
{
  return sub_226C34408();
}

BOOL sub_226C0013C()
{
  return (sub_226C34408() & 1) == 0;
}

BOOL sub_226C00164()
{
  return (sub_226C34408() & 1) == 0;
}

uint64_t sub_226C00194()
{
  return sub_226C34408();
}

uint64_t sub_226C001A0()
{
  return sub_226C34388();
}

uint64_t sub_226C001EC()
{
  return sub_226C34448();
}

uint64_t sub_226C001F4()
{
  return sub_226C34388();
}

uint64_t sub_226C0023C(void *a1, void *a2)
{
  return MEMORY[0x270F9FFC8](*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_226C00250@<X0>(char *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  v49 = a2;
  uint64_t v3 = sub_226C33FE8();
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v46 = *(void *)(v51 + 64);
  MEMORY[0x270FA5388](v3);
  v52 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226C33FD8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = v9;
  uint64_t v10 = v8;
  uint64_t v45 = v8;
  MEMORY[0x270FA5388](v7);
  v12 = (char *)&v39 - v11;
  v48 = (char *)&v39 - v11;
  sub_226C02CD8(&qword_268156B80, MEMORY[0x263F8F740]);
  uint64_t v39 = v3;
  v40 = a1;
  sub_226C342D8();
  uint64_t v13 = v6;
  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  uint64_t v42 = v5;
  v14(v9, v12, v5);
  uint64_t v15 = v51;
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  v41(v52, (uint64_t)a1, v3);
  uint64_t v16 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = v13;
  uint64_t v18 = (v16 + 16) & ~v16;
  uint64_t v19 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v20 = (v10 + v19 + v18) & ~v19;
  uint64_t v21 = v46;
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v22 + v18;
  uint64_t v24 = v22;
  uint64_t v47 = v22;
  v43 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 32);
  uint64_t v44 = v17 + 32;
  v43(v23, v50, v5);
  v25 = *(void (**)(uint64_t, char *, uint64_t))(v15 + 32);
  v26 = v52;
  uint64_t v27 = v39;
  v25(v24 + v20, v52, v39);
  v28 = v40;
  v41(v26, (uint64_t)v40, v27);
  uint64_t v29 = (v19 + 16) & ~v19;
  uint64_t v46 = swift_allocObject();
  uint64_t v51 = v15 + 32;
  v25(v46 + v29, v26, v27);
  v25((uint64_t)v26, v28, v27);
  v30 = v50;
  uint64_t v32 = v42;
  v31 = (uint64_t (*)(uint64_t, char *, uint64_t))v43;
  v43((uint64_t)v50, v48, v42);
  uint64_t v33 = (v29 + v21 + v16) & ~v16;
  uint64_t v34 = swift_allocObject();
  v25(v34 + v29, v52, v27);
  uint64_t result = v31(v34 + v33, v30, v32);
  v36 = v49;
  uint64_t v37 = v46;
  *v49 = sub_226C02854;
  v36[1] = (uint64_t (*)())v37;
  uint64_t v38 = v47;
  v36[2] = (uint64_t (*)())sub_226C026F0;
  v36[3] = (uint64_t (*)())v38;
  v36[4] = (uint64_t (*)())&unk_268156B90;
  v36[5] = (uint64_t (*)())v34;
  return result;
}

uint64_t CUClock.init<A>(_:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v44 = a3;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v48 = *(void *)(v5 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v50 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v47 = AssociatedTypeWitness;
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v49 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v37 - v12;
  v43 = (char *)&v37 - v12;
  uint64_t v38 = a1;
  sub_226C342D8();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v13, AssociatedTypeWitness);
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v39(v50, (uint64_t)a1, a2);
  uint64_t v14 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = v9;
  uint64_t v16 = (v14 + 32) & ~v14;
  uint64_t v17 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v18 = (v10 + v17 + v16) & ~v17;
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = v45;
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = v20;
  uint64_t v21 = v19;
  uint64_t v42 = v19;
  v40 = *(void (**)(uint64_t, char *, uint64_t))(v15 + 32);
  uint64_t v46 = v15 + 32;
  v40(v19 + v16, v49, v47);
  uint64_t v22 = v21 + v18;
  uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v24 = v50;
  v23(v22, v50, a2);
  v25 = v38;
  v39(v24, (uint64_t)v38, a2);
  uint64_t v26 = (v17 + 32) & ~v17;
  uint64_t v27 = v26 + v48;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = a2;
  *(void *)(v28 + 24) = v20;
  uint64_t v29 = v50;
  v23(v28 + v26, v50, a2);
  v23((uint64_t)v29, v25, a2);
  uint64_t v30 = v47;
  v31 = (uint64_t (*)(uint64_t, char *, uint64_t))v40;
  v40((uint64_t)v49, v43, v47);
  uint64_t v32 = swift_allocObject();
  uint64_t v33 = v45;
  *(void *)(v32 + 16) = a2;
  *(void *)(v32 + 24) = v33;
  v23(v32 + v26, v50, a2);
  uint64_t result = v31(v32 + ((v27 + v14) & ~v14), v49, v30);
  v35 = v44;
  *uint64_t v44 = sub_226C00F40;
  v35[1] = (uint64_t (*)())v28;
  uint64_t v36 = v42;
  v35[2] = (uint64_t (*)())sub_226C00DC4;
  v35[3] = (uint64_t (*)())v36;
  v35[4] = (uint64_t (*)())&unk_268156B48;
  v35[5] = (uint64_t (*)())v32;
  return result;
}

double sub_226C009E0@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = sub_226C33FD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C33FE8();
  sub_226C02CD8(&qword_268156B80, MEMORY[0x263F8F740]);
  sub_226C342D8();
  sub_226C02CD8(&qword_268156BA0, MEMORY[0x263F8F728]);
  sub_226C33FC8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  double result = *(double *)&v7;
  *a1 = v7;
  return result;
}

double sub_226C00B5C@<D0>(_OWORD *a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v7 - v4;
  sub_226C342D8();
  swift_getAssociatedConformanceWitness();
  sub_226C33FC8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, AssociatedTypeWitness);
  double result = *(double *)&v7;
  *a1 = v7;
  return result;
}

uint64_t sub_226C00CA4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = *(void *)(v1 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + *(void *)(v3 + 64) + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v4 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v1);
  return MEMORY[0x270FA0238](v0, v9, v10);
}

double sub_226C00DC4@<D0>(_OWORD *a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  return sub_226C00B5C(a1);
}

uint64_t sub_226C00EB8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_226C00F40()
{
  sub_226C342C8();
  return v1;
}

uint64_t sub_226C00FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 88) = a6;
  *(void *)(v7 + 96) = a7;
  *(unsigned char *)(v7 + 33) = a5;
  *(void *)(v7 + 72) = a3;
  *(void *)(v7 + 80) = a4;
  *(void *)(v7 + 56) = a1;
  *(void *)(v7 + 64) = a2;
  uint64_t v8 = sub_226C33FD8();
  *(void *)(v7 + 104) = v8;
  *(void *)(v7 + 112) = *(void *)(v8 - 8);
  *(void *)(v7 + 120) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_226C01078, 0, 0);
}

uint64_t sub_226C01078()
{
  char v1 = *(unsigned char *)(v0 + 33);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 56);
  sub_226C02CD8(&qword_268156BA0, MEMORY[0x263F8F728]);
  sub_226C33FB8();
  *(void *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v2;
  *(unsigned char *)(v0 + 32) = v1 & 1;
  uint64_t v4 = sub_226C33FE8();
  uint64_t v5 = sub_226C02CD8(&qword_268156B80, MEMORY[0x263F8F740]);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_226C011F4;
  uint64_t v7 = *(void *)(v0 + 120);
  return MEMORY[0x270FA2380](v7, v0 + 16, v4, v5);
}

uint64_t sub_226C011F4()
{
  uint64_t v2 = *(void *)(*v1 + 120);
  uint64_t v3 = *(void *)(*v1 + 112);
  uint64_t v4 = *(void *)(*v1 + 104);
  uint64_t v5 = *v1;
  *(void *)(v5 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_226C0139C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_226C0139C()
{
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_226C01400(_OWORD *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = a7;
  *(void *)(v8 + 96) = a8;
  *(void *)(v8 + 72) = a5;
  *(void *)(v8 + 80) = a6;
  *(unsigned char *)(v8 + 33) = a4;
  *(void *)(v8 + 56) = a2;
  *(void *)(v8 + 64) = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(void *)(v8 + 104) = AssociatedTypeWitness;
  *(void *)(v8 + 112) = *(void *)(AssociatedTypeWitness - 8);
  *(void *)(v8 + 120) = swift_task_alloc();
  *(_OWORD *)(v8 + 128) = *a1;
  return MEMORY[0x270FA2498](sub_226C014F0, 0, 0);
}

uint64_t sub_226C014F0()
{
  char v1 = *(unsigned char *)(v0 + 33);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 128);
  swift_getAssociatedConformanceWitness();
  sub_226C33FB8();
  *(void *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v2;
  *(unsigned char *)(v0 + 32) = v1 & 1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_226C0160C;
  uint64_t v5 = *(void *)(v0 + 120);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v7 = *(void *)(v0 + 96);
  return MEMORY[0x270FA2380](v5, v0 + 16, v6, v7);
}

uint64_t sub_226C0160C()
{
  uint64_t v2 = *(void *)(*v1 + 120);
  uint64_t v3 = *(void *)(*v1 + 112);
  uint64_t v4 = *(void *)(*v1 + 104);
  uint64_t v5 = *v1;
  *(void *)(v5 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_226C017B4, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_226C017B4()
{
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_226C01818()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, AssociatedTypeWitness);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_226C01974(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v9 = a4 & 1;
  uint64_t v10 = *(void *)(v4 + 16);
  uint64_t v11 = *(void *)(v4 + 24);
  unint64_t v12 = (*(unsigned __int8 *)(*(void *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80);
  unint64_t v13 = v12 + *(void *)(*(void *)(v10 - 8) + 64);
  uint64_t v14 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v15 = v4 + v12;
  uint64_t v16 = v4 + ((v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v17;
  *uint64_t v17 = v5;
  v17[1] = sub_226C01AFC;
  return sub_226C01400(a1, a2, a3, v9, v15, v16, v10, v11);
}

uint64_t sub_226C01AFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t CUClock.minimumResolution.getter()
{
  return (*v0)();
}

uint64_t CUClock.now.getter()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t CUClock.sleep(until:tolerance:)(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = a4 & 1;
  char v9 = *(int **)(v4 + 32);
  *(_OWORD *)(v5 + 16) = *a1;
  unint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v9 + *v9);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 32) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_226C01D40;
  return v12(v5 + 16, a2, a3, v8);
}

uint64_t sub_226C01D40()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_226C01E74, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_226C01E74()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226C01E8C()
{
  uint64_t v0 = sub_226C33FE8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C342F8();
  return sub_226C00250(v2, (uint64_t (**)())&qword_268157038);
}

uint64_t *sub_226C01F08()
{
  if (qword_268157030 != -1) {
    swift_once();
  }
  return &qword_268157038;
}

uint64_t static CUClock.suspending.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268157030 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_268157060;
  *(void *)a1 = qword_268157038;
  *(_OWORD *)(a1 + 8) = unk_268157040;
  *(_OWORD *)(a1 + 24) = unk_268157050;
  *(void *)(a1 + 40) = v2;
  swift_retain();
  swift_retain();
  return swift_retain();
}

unint64_t sub_226C02004()
{
  unint64_t result = qword_268156B58;
  if (!qword_268156B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156B58);
  }
  return result;
}

unint64_t sub_226C0205C()
{
  unint64_t result = qword_268156B60;
  if (!qword_268156B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156B60);
  }
  return result;
}

uint64_t sub_226C020B0()
{
  return MEMORY[0x263F8ED68];
}

unint64_t sub_226C020C0()
{
  unint64_t result = qword_268156B68;
  if (!qword_268156B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156B68);
  }
  return result;
}

unint64_t sub_226C02118()
{
  unint64_t result = qword_268156B70;
  if (!qword_268156B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156B70);
  }
  return result;
}

uint64_t sub_226C0216C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_226C02194@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*v1)();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_226C021C4(_OWORD *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = *((unsigned __int8 *)a2 + 16);
  uint64_t v7 = *(int **)(v2 + 32);
  *(_OWORD *)(v3 + 16) = *a1;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v7 + *v7);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 32) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_226C022C0;
  return v10(v3 + 16, v4, v5, v6);
}

uint64_t sub_226C022C0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_226C02D24, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for CUClock(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CUClock()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CUClock(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CUClock(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *assignWithTake for CUClock(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CUClock(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CUClock(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CUClock()
{
  return &type metadata for CUClock;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CUClock.Instant(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CUClock.Instant(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CUClock.Instant()
{
  return &type metadata for CUClock.Instant;
}

uint64_t sub_226C026C4()
{
  return objectdestroy_17Tm(MEMORY[0x263F8F728], MEMORY[0x263F8F740]);
}

double sub_226C026F0@<D0>(_OWORD *a1@<X8>)
{
  sub_226C33FD8();
  sub_226C33FE8();
  return sub_226C009E0(a1);
}

uint64_t sub_226C027C4()
{
  uint64_t v1 = sub_226C33FE8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_226C02854()
{
  sub_226C33FE8();
  sub_226C02CD8(&qword_268156B80, MEMORY[0x263F8F740]);
  sub_226C342C8();
  return v1;
}

uint64_t sub_226C02904(uint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  char v13 = a4 & 1;
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v14;
  *uint64_t v14 = v6;
  v14[1] = sub_226C01AFC;
  return sub_226C00FAC(v11, v12, a2, a3, v13, a5, a6);
}

uint64_t sub_226C029DC()
{
  return objectdestroy_17Tm(MEMORY[0x263F8F740], MEMORY[0x263F8F728]);
}

uint64_t objectdestroy_17Tm(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = a2(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v7 + v8 + v11) & ~v11;
  uint64_t v13 = v12 + *(void *)(v10 + 64);
  uint64_t v14 = v6 | v11 | 7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2 + v7, v4);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2 + v12, v9);
  return MEMORY[0x270FA0238](v2, v13, v14);
}

uint64_t sub_226C02B68(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v9 = a4 & 1;
  uint64_t v10 = *(void *)(sub_226C33FE8() - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = *(void *)(v10 + 64);
  uint64_t v13 = *(void *)(sub_226C33FD8() - 8);
  unint64_t v14 = (v11 + v12 + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = v4 + v11;
  uint64_t v16 = v4 + v14;
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v17;
  *uint64_t v17 = v5;
  v17[1] = sub_226C02D20;
  uint64_t v18 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t, char, uint64_t, uint64_t))((char *)&dword_268156B88
                                                                                    + dword_268156B88);
  return v18(a1, a2, a3, v9, v15, v16);
}

uint64_t sub_226C02CD8(unint64_t *a1, void (*a2)(uint64_t))
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

BOOL static CommonError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CommonError.hash(into:)()
{
  return sub_226C34368();
}

uint64_t CommonError.hashValue.getter()
{
  return sub_226C34388();
}

BOOL sub_226C02DB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s14CoreUtilsSwift05PrintB13JustificationO9hashValueSivg_0()
{
  return sub_226C34388();
}

uint64_t sub_226C02E0C()
{
  return sub_226C34368();
}

uint64_t sub_226C02E38()
{
  return sub_226C34388();
}

uint64_t static CUError.deviceClassKey.getter()
{
  return 0x6563697665447563;
}

uint64_t static CUError.deviceNameKey.getter()
{
  return 0x6563697665447563;
}

uint64_t static CUError.messageKey.getter()
{
  return 0x4D726F7272457563;
}

uint64_t static CUError.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t CUError.message.getter()
{
  id v1 = objc_msgSend(v0, sel_userInfo);
  uint64_t v2 = sub_226C33888();

  if (!*(void *)(v2 + 16) || (unint64_t v3 = sub_226C06F00(0x4D726F7272457563, 0xEA00000000006773), (v4 & 1) == 0))
  {
    long long v7 = 0u;
    long long v8 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_226C06F78(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v7);
  swift_bridgeObjectRelease();
  if (!*((void *)&v8 + 1))
  {
LABEL_9:
    sub_226C088D0((uint64_t)&v7, &qword_268156BA8);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v6;
  }
  else {
    return 0;
  }
}

id CUError.__allocating_init(domain:code:message:underlying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v13 = objc_allocWithZone(v6);
  return CUError.init(domain:code:message:underlying:)(a1, a2, a3, a4, a5, a6);
}

id CUError.init(domain:code:message:underlying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a5)
  {
    unint64_t v37 = MEMORY[0x263F8D310];
    *(void *)&long long v36 = a4;
    *((void *)&v36 + 1) = a5;
    sub_226C07014(&v36, v35);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_226C07408(v35, 0x4D726F7272457563, 0xEA00000000006773, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  id v13 = (SEL *)&unk_2647D4000;
  if (a6)
  {
    id v14 = a6;
    uint64_t v15 = (void *)sub_226C33588();
    uint64_t v16 = sub_226C33998();
    uint64_t v32 = v17;
    uint64_t v33 = v16;
    id v18 = objc_msgSend(v15, sel_domain);
    sub_226C33998();
    uint64_t v34 = a3;

    id v31 = objc_msgSend(v15, sel_code);
    uint64_t v19 = ObjectType;
    id v20 = objc_msgSend(v15, sel_userInfo);
    sub_226C33888();

    id v21 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v22 = (void *)sub_226C33988();
    id v13 = (SEL *)&unk_2647D4000;
    swift_bridgeObjectRelease();
    uint64_t v23 = (void *)sub_226C33878();
    swift_bridgeObjectRelease();
    uint64_t v24 = v21;
    ObjectType = v19;
    id v25 = objc_msgSend(v24, sel_initWithDomain_code_userInfo_, v22, v31, v23);

    a3 = v34;
    unint64_t v37 = sub_226C06FD4();
    *(void *)&long long v36 = v25;
    sub_226C07014(&v36, v35);
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_226C07408(v35, v33, v32, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v27 = (void *)sub_226C33988();
  swift_bridgeObjectRelease();
  uint64_t v28 = (void *)sub_226C33878();
  swift_bridgeObjectRelease();
  v38.receiver = v6;
  v38.super_class = ObjectType;
  id v29 = objc_msgSendSuper2(&v38, v13[21], v27, a3, v28);

  return v29;
}

id CUError.__allocating_init(domain:code:message:underlying:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  id v15 = objc_allocWithZone(v7);
  return CUError.init(domain:code:message:underlying:userInfo:)(a1, a2, a3, a4, a5, a6, a7);
}

id CUError.init(domain:code:message:underlying:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  long long v8 = v7;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v15 = MEMORY[0x263F8EE80];
  if (a5)
  {
    unint64_t v44 = MEMORY[0x263F8D310];
    *(void *)&long long v43 = a4;
    *((void *)&v43 + 1) = a5;
    sub_226C07014(&v43, v42);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_226C07408(v42, 0x4D726F7272457563, 0xEA00000000006773, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = (SEL *)&unk_2647D4000;
  if (a6)
  {
    id v18 = a6;
    uint64_t v19 = (void *)sub_226C33588();
    uint64_t v20 = sub_226C33998();
    uint64_t v38 = v21;
    uint64_t v39 = v20;
    id v22 = objc_msgSend(v19, sel_domain);
    sub_226C33998();
    uint64_t v41 = ObjectType;

    id v37 = objc_msgSend(v19, sel_code);
    uint64_t v23 = a6;
    uint64_t v24 = a3;
    id v25 = objc_msgSend(v19, sel_userInfo);
    uint64_t v40 = a7;
    sub_226C33888();

    id v26 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v27 = (void *)sub_226C33988();
    swift_bridgeObjectRelease();
    uint64_t v28 = (void *)sub_226C33878();
    uint64_t v17 = (SEL *)&unk_2647D4000;
    swift_bridgeObjectRelease();
    id v29 = v26;
    a3 = v24;
    a6 = v23;
    id v30 = objc_msgSend(v29, sel_initWithDomain_code_userInfo_, v27, v37, v28);

    ObjectType = v41;
    a7 = v40;
    unint64_t v44 = sub_226C06FD4();
    *(void *)&long long v43 = v30;
    sub_226C07014(&v43, v42);
    char v31 = swift_isUniquelyReferenced_nonNull_native();
    sub_226C07408(v42, v39, v38, v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a7)
  {
    char v32 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v43 = v15;
    sub_226C07804(a7, (uint64_t)sub_226C077B0, 0, v32, (uint64_t *)&v43);
    swift_bridgeObjectRelease();
  }
  uint64_t v33 = (void *)sub_226C33988();
  swift_bridgeObjectRelease();
  uint64_t v34 = (void *)sub_226C33878();
  swift_bridgeObjectRelease();
  v45.receiver = v8;
  v45.super_class = ObjectType;
  id v35 = objc_msgSendSuper2(&v45, v17[21], v33, a3, v34);

  return v35;
}

id CUError.__allocating_init(userError:_:underlying:)(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  return CUError.init(userError:_:underlying:)(a1, a2, a3, a4);
}

id CUError.init(userError:_:underlying:)(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    unint64_t v33 = MEMORY[0x263F8D310];
    *(void *)&long long v32 = a2;
    *((void *)&v32 + 1) = a3;
    sub_226C07014(&v32, v31);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_226C07408(v31, 0x4D726F7272457563, 0xEA00000000006773, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  if (a4)
  {
    id v11 = a4;
    uint64_t v12 = (void *)sub_226C33588();
    uint64_t v13 = sub_226C33998();
    uint64_t v27 = v14;
    uint64_t v28 = v13;
    id v30 = ObjectType;
    id v15 = objc_msgSend(v12, sel_domain);
    sub_226C33998();
    int v29 = a1;

    id v26 = objc_msgSend(v12, sel_code);
    id v16 = objc_msgSend(v12, sel_userInfo);
    sub_226C33888();

    id v17 = objc_allocWithZone(MEMORY[0x263F087E8]);
    id v18 = (void *)sub_226C33988();
    swift_bridgeObjectRelease();
    uint64_t v19 = (void *)sub_226C33878();
    ObjectType = v30;
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, v26, v19);

    unint64_t v33 = sub_226C06FD4();
    *(void *)&long long v32 = v20;
    a1 = v29;
    sub_226C07014(&v32, v31);
    char v21 = swift_isUniquelyReferenced_nonNull_native();
    sub_226C07408(v31, v28, v27, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v22 = (void *)sub_226C33988();
  uint64_t v23 = (void *)sub_226C33878();
  swift_bridgeObjectRelease();
  v34.receiver = v4;
  v34.super_class = ObjectType;
  id v24 = objc_msgSendSuper2(&v34, sel_initWithDomain_code_userInfo_, v22, a1, v23);

  return v24;
}

id CUError.__allocating_init(userError:_:underlying:userInfo:)(int a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return CUError.init(userError:_:underlying:userInfo:)(a1, a2, a3, a4, a5);
}

id CUError.init(userError:_:underlying:userInfo:)(int a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = MEMORY[0x263F8EE80];
  if (a3)
  {
    unint64_t v40 = MEMORY[0x263F8D310];
    *(void *)&long long v39 = a2;
    *((void *)&v39 + 1) = a3;
    sub_226C07014(&v39, v38);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_226C07408(v38, 0x4D726F7272457563, 0xEA00000000006773, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = (SEL *)&unk_2647D4000;
  if (a4)
  {
    id v15 = a4;
    id v16 = (void *)sub_226C33588();
    uint64_t v17 = sub_226C33998();
    uint64_t v34 = v18;
    uint64_t v35 = v17;
    id v19 = objc_msgSend(v16, sel_domain);
    sub_226C33998();

    id v33 = objc_msgSend(v16, sel_code);
    id v20 = ObjectType;
    id v21 = objc_msgSend(v16, sel_userInfo);
    uint64_t v36 = a5;
    sub_226C33888();

    id v22 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v23 = (void *)sub_226C33988();
    swift_bridgeObjectRelease();
    id v24 = (void *)sub_226C33878();
    uint64_t v14 = (SEL *)&unk_2647D4000;
    swift_bridgeObjectRelease();
    id v25 = v22;
    ObjectType = v20;
    id v26 = objc_msgSend(v25, sel_initWithDomain_code_userInfo_, v23, v33, v24);

    a5 = v36;
    unint64_t v40 = sub_226C06FD4();
    *(void *)&long long v39 = v26;
    sub_226C07014(&v39, v38);
    char v27 = swift_isUniquelyReferenced_nonNull_native();
    sub_226C07408(v38, v35, v34, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a5)
  {
    char v28 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v39 = v12;
    sub_226C07804(a5, (uint64_t)sub_226C077B0, 0, v28, (uint64_t *)&v39);
    swift_bridgeObjectRelease();
  }
  int v29 = (void *)sub_226C33988();
  id v30 = (void *)sub_226C33878();
  swift_bridgeObjectRelease();
  v41.receiver = v6;
  v41.super_class = ObjectType;
  id v31 = objc_msgSendSuper2(&v41, v14[21], v29, a1, v30);

  return v31;
}

id CUError.__allocating_init(_:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return CUError.init(_:)(a1);
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
  char v4 = objc_allocWithZone(v1);
  if (a1)
  {
    uint64_t v13 = v4;
    uint64_t v5 = a1;
    uint64_t v6 = (void *)sub_226C33588();
    long long v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_226C33998();
      long long v7 = (id)sub_226C33988();
      swift_bridgeObjectRelease();
    }
    long long v8 = objc_msgSend(v6, sel_code);
    id v9 = objc_msgSend(v6, sel_userInfo);
    sub_226C33888();

    uint64_t v10 = (void *)sub_226C33878();
    swift_bridgeObjectRelease();
    v14.receiver = v13;
    v14.super_class = v2;
    id v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

id CUError.init(_:)(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  char v4 = (void *)sub_226C33588();
  id v5 = objc_msgSend(v4, sel_domain);
  if (!v5)
  {
    sub_226C33998();
    id v5 = (id)sub_226C33988();
    swift_bridgeObjectRelease();
  }
  id v6 = objc_msgSend(v4, sel_code);
  id v7 = objc_msgSend(v4, sel_userInfo);
  sub_226C33888();

  long long v8 = (void *)sub_226C33878();
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
  ObjectType = swift_getObjectType();
  if (a1)
  {
    uint64_t v13 = (objc_class *)ObjectType;
    id v5 = a1;
    id v6 = (void *)sub_226C33588();
    id v7 = objc_msgSend(v6, sel_domain);
    if (!v7)
    {
      sub_226C33998();
      id v7 = (id)sub_226C33988();
      swift_bridgeObjectRelease();
    }
    long long v8 = objc_msgSend(v6, sel_code);
    id v9 = objc_msgSend(v6, sel_userInfo);
    sub_226C33888();

    uint64_t v10 = (void *)sub_226C33878();
    swift_bridgeObjectRelease();
    v14.receiver = v2;
    v14.super_class = v13;
    id v11 = objc_msgSendSuper2(&v14, sel_initWithDomain_code_userInfo_, v7, v8, v10);
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v11;
}

void *CUError.__allocating_init(from:)(void *a1)
{
  return sub_226C07DA4(a1);
}

void CUError.encode(to:)(void *a1)
{
  id v3 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156BB8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C0828C();
  sub_226C343E8();
  id v9 = objc_msgSend(v1, sel_domain);
  sub_226C33998();

  LOBYTE(v49) = 0;
  uint64_t v10 = v8;
  sub_226C34178();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    return;
  }
  id v11 = a1;
  objc_super v12 = (objc_class *)ObjectType;
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_code);
  LOBYTE(v49) = 1;
  sub_226C34188();
  long long v43 = v10;
  uint64_t v44 = v5;
  uint64_t v45 = v6;
  id v13 = objc_msgSend(v3, sel_userInfo);
  uint64_t v14 = sub_226C33888();

  if (*(void *)(v14 + 16) && (unint64_t v15 = sub_226C06F00(0x4D726F7272457563, 0xEA00000000006773), (v16 & 1) != 0))
  {
    sub_226C06F78(*(void *)(v14 + 56) + 32 * v15, (uint64_t)&v49);
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v50 + 1))
  {
    if (swift_dynamicCast())
    {
      LOBYTE(v49) = 2;
      sub_226C34178();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_226C088D0((uint64_t)&v49, &qword_268156BA8);
  }
  id v17 = objc_msgSend(v3, sel_userInfo);
  uint64_t v18 = sub_226C33888();

  uint64_t v19 = sub_226C33998();
  if (*(void *)(v18 + 16))
  {
    unint64_t v21 = sub_226C06F00(v19, v20);
    uint64_t v22 = v45;
    if (v23)
    {
      sub_226C06F78(*(void *)(v18 + 56) + 32 * v21, (uint64_t)&v49);
    }
    else
    {
      long long v49 = 0u;
      long long v50 = 0u;
    }
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v22 = v45;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v50 + 1))
  {
    sub_226C088D0((uint64_t)&v49, &qword_268156BA8);
    goto LABEL_34;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156BC8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_34:
    (*(void (**)(char *, uint64_t))(v22 + 8))(v43, v44);
    return;
  }
  id v24 = *(void **)&v48[0];
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  uint64_t v25 = sub_226C343C8();
  uint64_t v26 = v25;
  uint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t v51 = MEMORY[0x263F8EE78];
  uint64_t v28 = *(void *)(v25 + 16);
  if (v28)
  {
    uint64_t v42 = v24;
    unint64_t v29 = 0;
    uint64_t v30 = v25 + 32;
    do
    {
      if (v29 >= *(void *)(v26 + 16))
      {
        __break(1u);
        JUMPOUT(0x226C04AB8);
      }
      sub_226C082E0(v30, (uint64_t)&v49);
      sub_226C082E0((uint64_t)&v49, (uint64_t)v48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156BD0);
      if (swift_dynamicCast())
      {
        switch(v47)
        {
          case 3:
            swift_bridgeObjectRelease();
            break;
          default:
            char v31 = sub_226C34208();
            swift_bridgeObjectRelease();
            if ((v31 & 1) == 0) {
              goto LABEL_20;
            }
            break;
        }
        sub_226C083B4(&v49, (uint64_t)v48);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_226C07A68(0, *(void *)(v27 + 16) + 1, 1);
        }
        uint64_t v27 = v51;
        unint64_t v33 = *(void *)(v51 + 16);
        unint64_t v32 = *(void *)(v51 + 24);
        if (v33 >= v32 >> 1)
        {
          sub_226C07A68((void *)(v32 > 1), v33 + 1, 1);
          uint64_t v27 = v51;
        }
        *(void *)(v27 + 16) = v33 + 1;
        sub_226C083B4(v48, v27 + 40 * v33 + 32);
      }
      else
      {
LABEL_20:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v49);
      }
      ++v29;
      v30 += 40;
      uint64_t v22 = v45;
    }
    while (v28 != v29);
    uint64_t v27 = v51;
    id v24 = v42;
  }
  swift_bridgeObjectRelease();
  unint64_t v34 = *(void *)(v27 + 16);
  swift_release();
  uint64_t v36 = v43;
  uint64_t v35 = v44;
  if (v34 >= 3)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v43, v44);
  }
  else
  {
    id v37 = objc_allocWithZone(v12);
    id v38 = v24;
    id v39 = CUError.init(_:)(v24);
    *(void *)&long long v49 = v39;
    LOBYTE(v48[0]) = 3;
    sub_226C08818(&qword_268156BD8, v40, (void (*)(uint64_t))type metadata accessor for CUError);
    sub_226C34198();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v36, v35);
  }
}

uint64_t CUError.errorDescription.getter()
{
  uint64_t v0 = (void *)sub_226C33588();
  id v1 = (id)CUPrintNSError();

  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_226C33998();

  return v2;
}

uint64_t sub_226C04B38(unsigned __int8 *a1, char *a2)
{
  return sub_226C04B44(*a1, *a2);
}

uint64_t sub_226C04B44(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E69616D6F64;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E69616D6F64;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1701080931;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x6567617373656DLL;
      break;
    case 3:
      uint64_t v5 = 0x69796C7265646E75;
      unint64_t v3 = 0xEF726F727245676ELL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE600000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1701080931) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x6567617373656DLL;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xEF726F727245676ELL;
      if (v5 == 0x69796C7265646E75) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_226C34208();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_226C04CD4()
{
  return sub_226C34388();
}

uint64_t sub_226C04DB0()
{
  sub_226C339E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_226C04E74()
{
  return sub_226C34388();
}

uint64_t sub_226C04F4C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_226C08368();
  *a1 = result;
  return result;
}

void sub_226C04F7C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE600000000000000;
  uint64_t v3 = 0x6E69616D6F64;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1701080931;
      goto LABEL_3;
    case 2:
      *a1 = 0x6567617373656DLL;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 0x69796C7265646E75;
      a1[1] = 0xEF726F727245676ELL;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_226C05018()
{
  uint64_t result = 0x6E69616D6F64;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1701080931;
      break;
    case 2:
      uint64_t result = 0x6567617373656DLL;
      break;
    case 3:
      uint64_t result = 0x69796C7265646E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_226C050A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_226C08368();
  *a1 = result;
  return result;
}

uint64_t sub_226C050D0()
{
  return 0;
}

void sub_226C050DC(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_226C050E8(uint64_t a1)
{
  unint64_t v2 = sub_226C0828C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_226C05124(uint64_t a1)
{
  unint64_t v2 = sub_226C0828C();
  return MEMORY[0x270FA00B8](a1, v2);
}

id CUError.__allocating_init(domain:code:userInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  long long v8 = (void *)sub_226C33988();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v9 = (void *)sub_226C33878();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_msgSend(objc_allocWithZone(v5), sel_initWithDomain_code_userInfo_, v8, a3, v9);

  return v10;
}

void CUError.init(domain:code:userInfo:)()
{
}

id CUError.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_226C052B4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_226C07DA4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_226C052E0(void *a1)
{
}

uint64_t sub_226C05304()
{
  uint64_t v0 = (void *)sub_226C33588();
  id v1 = (id)CUPrintNSError();

  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_226C33998();

  return v2;
}

uint64_t sub_226C0537C()
{
  id v1 = objc_msgSend(*v0, sel_helpAnchor);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_226C33998();

  return v3;
}

unint64_t Error.deviceClass.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  uint64_t v6 = sub_226C341D8();
  if (v6)
  {
    char v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    char v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  id v9 = (void *)sub_226C33588();

  id v10 = objc_msgSend(v9, sel_userInfo);
  uint64_t v11 = sub_226C33888();

  if (*(void *)(v11 + 16) && (unint64_t v12 = sub_226C06F00(0x6563697665447563, 0xED00007373616C43), (v13 & 1) != 0))
  {
    sub_226C06F78(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v72);
  }
  else
  {
    long long v72 = 0u;
    long long v73 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v73 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156BE8);
    if (swift_dynamicCast())
    {
      if (*((void *)&v70 + 1))
      {
        sub_226C083B4(&v69, (uint64_t)&v72);
        uint64_t v14 = *((void *)&v73 + 1);
        unint64_t v15 = v74;
        char v16 = __swift_project_boxed_opaque_existential_1(&v72, *((uint64_t *)&v73 + 1));
        v64 = &v55;
        id v17 = *(void **)(v14 - 8);
        uint64_t v18 = (uint64_t *)v17[8];
        MEMORY[0x270FA5388](v16);
        unint64_t v19 = ((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v20 = (uint64_t *)v17[2];
        ((void (*)(char *))v20)((char *)&v55 - v19);
        uint64_t v21 = sub_226C33E98();
        char v22 = v21;
        v63 = &v55;
        v66 = v18;
        MEMORY[0x270FA5388](v21);
        v65 = (char *)&v55 - v19;
        v67 = v20;
        ((void (*)(char *, char *, uint64_t))v20)((char *)&v55 - v19, (char *)&v55 - v19, v14);
        char v23 = v15;
        BOOL v24 = (v22 & 1) != 0 && sub_226C33E88() > 32;
        v60 = v17;
        uint64_t v28 = (uint64_t *)v17[1];
        uint64_t v29 = ((uint64_t (*)(char *, uint64_t))v28)((char *)&v55 - v19, v14);
        v62 = &v55;
        MEMORY[0x270FA5388](v29);
        uint64_t v30 = (char *)&v55 - v19;
        char v31 = (char *)&v55 - v19;
        unint64_t v32 = v65;
        ((void (*)(char *, char *, uint64_t))v67)(v31, v65, v14);
        if (v24)
        {
          v61 = v28;
          LODWORD(v69) = 0x80000000;
          if (sub_226C33E98())
          {
            uint64_t v33 = sub_226C33E88();
            if (v33 < 32)
            {
LABEL_44:
              int v46 = sub_226C33E78();
              uint64_t v28 = v61;
              ((void (*)(char *, uint64_t))v61)(v30, v14);
              unint64_t v34 = v66;
              if ((int)v69 > v46) {
                goto LABEL_52;
              }
LABEL_25:
              uint64_t v35 = sub_226C33E88();
              v61 = &v55;
              MEMORY[0x270FA5388](v35);
              ((void (*)(char *, char *, uint64_t))v67)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v32, v14);
              if (v35 < 33)
              {
                uint64_t v38 = sub_226C33E88();
                uint64_t v36 = ((uint64_t (*)(char *, uint64_t))v28)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
                if (v38 == 32)
                {
                  uint64_t v36 = sub_226C33E98();
                  char v37 = v36 ^ 1;
                }
                else
                {
                  char v37 = 0;
                }
              }
              else
              {
                uint64_t v36 = ((uint64_t (*)(char *, uint64_t))v28)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
                char v37 = 1;
              }
              MEMORY[0x270FA5388](v36);
              ((void (*)(char *, char *, uint64_t))v67)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v32, v14);
              v66 = &v55;
              if ((v37 & 1) == 0)
              {
                ((void (*)(char *, uint64_t))v28)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
                goto LABEL_41;
              }
              uint64_t v41 = v28;
              LODWORD(v69) = 0x7FFFFFFF;
              char v42 = sub_226C33E98();
              uint64_t v43 = sub_226C33E88();
              if (v42)
              {
                if (v43 > 32)
                {
                  MEMORY[0x270FA5388](v43);
                  sub_226C083CC();
                  sub_226C33E48();
                  char v44 = sub_226C33938();
                  uint64_t v28 = v41;
                  ((void (*)(char *, uint64_t))v41)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
                  ((void (*)(char *, uint64_t))v41)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
                  goto LABEL_47;
                }
              }
              else if (v43 > 31)
              {
                v67 = &v55;
                int v68 = 0x7FFFFFFF;
                MEMORY[0x270FA5388](v43);
                uint64_t v47 = ((uint64_t (*)(char *, char *, uint64_t))v60[4])((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
                MEMORY[0x270FA5388](v47);
                sub_226C083CC();
                sub_226C33E48();
                char v44 = sub_226C33938();
                ((void (*)(char *, uint64_t))v41)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
                uint64_t v28 = v41;
                ((void (*)(char *, uint64_t))v41)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
LABEL_47:
                if (v44) {
                  goto LABEL_52;
                }
LABEL_41:
                unsigned int v45 = sub_226C33E78();
                ((void (*)(char *, uint64_t))v28)(v32, v14);
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v72);
                unsigned __int8 v26 = 0;
                uint64_t v25 = v45;
                goto LABEL_17;
              }
              sub_226C33E78();
              uint64_t v28 = v41;
              ((void (*)(char *, uint64_t))v41)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
              goto LABEL_41;
            }
            goto LABEL_31;
          }
          char v39 = sub_226C33E98();
          uint64_t v33 = sub_226C33E88();
          if (v39)
          {
            if (v33 <= 32)
            {
              uint64_t v58 = *(void *)(*((void *)v23 + 3) + 16);
              uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
              v59 = &v55;
              MEMORY[0x270FA5388](AssociatedTypeWitness);
              v56 = (char *)&v55 - v49;
              swift_getAssociatedConformanceWitness();
              uint64_t v50 = sub_226C34278();
              v57 = &v55;
              unint64_t v34 = v66;
              MEMORY[0x270FA5388](v50);
              unint64_t v51 = ((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0;
              sub_226C341F8();
              v56 = v23;
              LODWORD(v58) = sub_226C33938();
              v52 = v61;
              uint64_t v53 = ((uint64_t (*)(char *, uint64_t))v61)((char *)&v55 - v51, v14);
              MEMORY[0x270FA5388](v53);
              ((void (*)(char *, char *, uint64_t))v60[4])((char *)&v55 - v51, v30, v14);
              if (v58)
              {
                ((void (*)(char *, uint64_t))v52)((char *)&v55 - v51, v14);
                ((void (*)(char *, uint64_t))v52)(v32, v14);
LABEL_53:
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v72);
                goto LABEL_16;
              }
              LODWORD(v59) = v69;
              int v54 = sub_226C33E78();
              ((void (*)(char *, uint64_t))v52)((char *)&v55 - v51, v14);
              uint64_t v28 = v52;
              if ((int)v59 <= v54) {
                goto LABEL_25;
              }
LABEL_52:
              ((void (*)(char *, uint64_t))v28)(v32, v14);
              goto LABEL_53;
            }
LABEL_31:
            unint64_t v34 = v66;
            MEMORY[0x270FA5388](v33);
            sub_226C083CC();
            sub_226C33E48();
            char v40 = sub_226C33938();
            uint64_t v28 = v61;
            ((void (*)(char *, uint64_t))v61)((char *)&v55 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
            ((void (*)(char *, uint64_t))v28)(v30, v14);
            if ((v40 & 1) == 0) {
              goto LABEL_25;
            }
            goto LABEL_52;
          }
          if (v33 < 32) {
            goto LABEL_44;
          }
          uint64_t v28 = v61;
          ((void (*)(char *, uint64_t))v61)(v30, v14);
        }
        else
        {
          ((void (*)(char *, uint64_t))v28)(v30, v14);
        }
        unint64_t v34 = v66;
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v71 = 0;
      long long v69 = 0u;
      long long v70 = 0u;
    }
  }
  else
  {
    sub_226C088D0((uint64_t)&v72, &qword_268156BA8);
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v71 = 0;
  }
  sub_226C088D0((uint64_t)&v69, &qword_268156BE0);
LABEL_16:
  uint64_t v25 = 0;
  unsigned __int8 v26 = 1;
LABEL_17:
  LOBYTE(v72) = v26;
  return v25 | ((unint64_t)v26 << 32);
}

uint64_t Error.deviceName.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  uint64_t v6 = sub_226C341D8();
  if (v6)
  {
    char v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    char v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  id v9 = (void *)sub_226C33588();

  id v10 = objc_msgSend(v9, sel_userInfo);
  uint64_t v11 = sub_226C33888();

  if (*(void *)(v11 + 16) && (unint64_t v12 = sub_226C06F00(0x6563697665447563, 0xEC000000656D614ELL), (v13 & 1) != 0))
  {
    sub_226C06F78(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v16);
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v17 + 1))
  {
    if (swift_dynamicCast()) {
      return v15;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_226C088D0((uint64_t)&v16, &qword_268156BA8);
    return 0;
  }
}

unint64_t Error.userErrorCode.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  uint64_t v6 = sub_226C341D8();
  if (v6)
  {
    char v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    char v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  id v9 = (void *)sub_226C33588();

  id v10 = objc_msgSend(v9, sel_domain);
  uint64_t v11 = sub_226C33998();
  uint64_t v13 = v12;

  if (v11 == 0x6F72724572657355 && v13 == 0xEF6E69616D6F4472)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_226C34208();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {

      uint64_t v16 = 0;
      BOOL v17 = 1;
      return v16 | ((unint64_t)v17 << 32);
    }
  }
  id v18 = objc_msgSend(v9, sel_code);

  BOOL v17 = (int)v18 != (void)v18;
  uint64_t v16 = v18;
  if ((id)(int)v18 != v18) {
    uint64_t v16 = 0;
  }
  return v16 | ((unint64_t)v17 << 32);
}

uint64_t sub_226C06440()
{
  sub_226C06FD4();
  sub_226C08818(&qword_268156C20, 255, (void (*)(uint64_t))sub_226C06FD4);
  id v1 = v0;
  uint64_t v2 = sub_226C341D8();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
  }
  else
  {
    uint64_t v3 = (void *)swift_allocError();
    *uint64_t v4 = v15;
  }
  uint64_t v5 = (void *)sub_226C33588();

  id v6 = objc_msgSend(v5, sel_domain);
  uint64_t v7 = sub_226C33998();
  uint64_t v9 = v8;

  *(void *)&long long v15 = v7;
  *((void *)&v15 + 1) = v9;
  sub_226C33A28();
  objc_msgSend(v5, sel_code);
  sub_226C341B8();
  sub_226C33A28();
  swift_bridgeObjectRelease();
  long long v17 = v15;
  id v10 = objc_msgSend(v5, sel_userInfo);
  uint64_t v11 = sub_226C33888();

  if (*(void *)(v11 + 16) && (unint64_t v12 = sub_226C06F00(0x4D726F7272457563, 0xEA00000000006773), (v13 & 1) != 0))
  {
    sub_226C06F78(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v15);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v16 + 1))
  {
    if (swift_dynamicCast())
    {
      *(void *)&long long v15 = 2564140;
      *((void *)&v15 + 1) = 0xE300000000000000;
      sub_226C33A28();
      swift_bridgeObjectRelease();
      sub_226C33A28();
      sub_226C33A28();
      swift_bridgeObjectRelease();

      return v17;
    }
    else
    {
    }
  }
  else
  {

    sub_226C088D0((uint64_t)&v15, &qword_268156BA8);
  }
  return v7;
}

uint64_t Error.flatDescription.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  uint64_t v6 = sub_226C341D8();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    uint64_t v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  uint64_t v9 = (void *)sub_226C33588();

  id v10 = objc_msgSend(v9, sel_domain);
  uint64_t v11 = sub_226C33998();
  uint64_t v13 = v12;

  *(void *)&long long v21 = v11;
  *((void *)&v21 + 1) = v13;
  sub_226C33A28();
  *(void *)&long long v23 = objc_msgSend(v9, sel_code);
  sub_226C341B8();
  sub_226C33A28();
  swift_bridgeObjectRelease();
  uint64_t v14 = v21;
  long long v23 = v21;
  id v15 = objc_msgSend(v9, sel_userInfo);
  uint64_t v16 = sub_226C33888();

  if (*(void *)(v16 + 16) && (unint64_t v17 = sub_226C06F00(0x4D726F7272457563, 0xEA00000000006773), (v18 & 1) != 0))
  {
    sub_226C06F78(*(void *)(v16 + 56) + 32 * v17, (uint64_t)&v21);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v22 + 1))
  {
    if (swift_dynamicCast())
    {
      *(void *)&long long v21 = 2564140;
      *((void *)&v21 + 1) = 0xE300000000000000;
      sub_226C33A28();
      swift_bridgeObjectRelease();
      sub_226C33A28();
      sub_226C33A28();
      swift_bridgeObjectRelease();

      return v23;
    }
    else
    {
    }
  }
  else
  {

    sub_226C088D0((uint64_t)&v21, &qword_268156BA8);
  }
  return v14;
}

uint64_t Error.nestedDescription.getter(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = Error.flatDescription.getter(v4);
  uint64_t v25 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v1, a1);
  uint64_t v8 = sub_226C341D8();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, a1);
  }
  else
  {
    uint64_t v9 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v10, v6, a1);
  }
  uint64_t v11 = (void *)sub_226C33588();

  uint64_t v12 = 3;
  while (1)
  {
    id v13 = objc_msgSend(v11, sel_userInfo);
    uint64_t v14 = sub_226C33888();

    uint64_t v15 = sub_226C33998();
    if (*(void *)(v14 + 16) && (unint64_t v17 = sub_226C06F00(v15, v16), (v18 & 1) != 0))
    {
      sub_226C06F78(*(void *)(v14 + 56) + 32 * v17, (uint64_t)&v22);
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*((void *)&v23 + 1))
    {

      sub_226C088D0((uint64_t)&v22, &qword_268156BA8);
      return v24;
    }
    sub_226C06FD4();
    if ((swift_dynamicCast() & 1) == 0) {
      break;
    }
    *(void *)&long long v22 = 540945696;
    *((void *)&v22 + 1) = 0xE400000000000000;
    id v19 = v21[1];
    sub_226C06440();

    sub_226C33A28();
    swift_bridgeObjectRelease();
    sub_226C33A28();
    swift_bridgeObjectRelease();

    uint64_t v11 = v19;
    if (!--v12)
    {

      return v24;
    }
  }

  return v24;
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(cu:)(uint64_t a1, uint64_t a2)
{
  Error.nestedDescription.getter(a2);
  sub_226C33A28();
  return swift_bridgeObjectRelease();
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  long long v12;
  uint64_t v13;
  uint64_t v14;
  void v15[5];

  uint64_t v4 = sub_226C33DD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v12 - v6, a1, v4);
  uint64_t v8 = *(void *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v15[3] = MEMORY[0x263F8D310];
    v15[4] = MEMORY[0x263F8D378];
    v15[0] = 0x73736563637573;
    v15[1] = 0xE700000000000000;
  }
  else
  {
    uint64_t v9 = Error.nestedDescription.getter(a2);
    id v13 = MEMORY[0x263F8D310];
    uint64_t v14 = MEMORY[0x263F8D378];
    *(void *)&uint64_t v12 = v9;
    *((void *)&v12 + 1) = v10;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v7, a2);
    sub_226C083B4(&v12, (uint64_t)v15);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CF08);
  sub_226C33FF8();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

unint64_t sub_226C06F00(uint64_t a1, uint64_t a2)
{
  sub_226C34358();
  sub_226C339E8();
  uint64_t v4 = sub_226C34388();
  return sub_226C07024(a1, a2, v4);
}

uint64_t sub_226C06F78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_226C06FD4()
{
  unint64_t result = qword_268156BB0;
  if (!qword_268156BB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268156BB0);
  }
  return result;
}

_OWORD *sub_226C07014(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_226C07024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_226C34208() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_226C34208() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_226C07108(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C40);
  uint64_t v6 = sub_226C340E8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
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
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
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
      long long v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_226C07014(v24, v35);
      }
      else
      {
        sub_226C06F78((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_226C34358();
      sub_226C339E8();
      uint64_t result = sub_226C34388();
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
      uint64_t result = (uint64_t)sub_226C07014(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_226C07408(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_226C06F00(a2, a3);
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
      sub_226C075C8();
      goto LABEL_7;
    }
    sub_226C07108(v15, a4 & 1);
    unint64_t v21 = sub_226C06F00(a2, a3);
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
    uint64_t result = (_OWORD *)sub_226C342B8();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    return sub_226C07014(a1, v19);
  }
LABEL_13:
  sub_226C0755C(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_226C0755C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_226C07014(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_226C075C8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226C340D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
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
    sub_226C06F78(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_226C07014(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
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

uint64_t sub_226C077B0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_226C06F78((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_226C07804(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v36 = a1;
  uint64_t v37 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v38 = v8;
  uint64_t v39 = 0;
  uint64_t v40 = v11 & v9;
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_226C07BC0(&v34);
  uint64_t v12 = *((void *)&v34 + 1);
  if (!*((void *)&v34 + 1))
  {
LABEL_19:
    swift_release();
    swift_bridgeObjectRelease();
    sub_226C08860();
    return swift_release();
  }
  while (1)
  {
    uint64_t v15 = v34;
    sub_226C07014(&v35, v33);
    uint64_t v16 = *a5;
    unint64_t v18 = sub_226C06F00(v15, v12);
    uint64_t v19 = *(void *)(v16 + 16);
    BOOL v20 = (v17 & 1) == 0;
    uint64_t v21 = v19 + v20;
    if (__OFADD__(v19, v20)) {
      break;
    }
    char v22 = v17;
    if (*(void *)(v16 + 24) >= v21)
    {
      if (a4)
      {
        if (v17) {
          goto LABEL_6;
        }
      }
      else
      {
        sub_226C075C8();
        if (v22) {
          goto LABEL_6;
        }
      }
    }
    else
    {
      sub_226C07108(v21, a4 & 1);
      unint64_t v23 = sub_226C06F00(v15, v12);
      if ((v22 & 1) != (v24 & 1)) {
        goto LABEL_22;
      }
      unint64_t v18 = v23;
      if (v22)
      {
LABEL_6:
        uint64_t v13 = 32 * v18;
        sub_226C06F78(*(void *)(*a5 + 56) + v13, (uint64_t)v31);
        sub_226C06F78((uint64_t)v31, (uint64_t)v32);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v31);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
        swift_bridgeObjectRelease();
        unint64_t v14 = (_OWORD *)(*(void *)(*a5 + 56) + v13);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
        sub_226C07014(v32, v14);
        goto LABEL_7;
      }
    }
    uint64_t v25 = (void *)*a5;
    *(void *)(*a5 + 8 * (v18 >> 6) + 64) |= 1 << v18;
    unint64_t v26 = (uint64_t *)(v25[6] + 16 * v18);
    uint64_t *v26 = v15;
    v26[1] = v12;
    sub_226C07014(v33, (_OWORD *)(v25[7] + 32 * v18));
    uint64_t v27 = v25[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_21;
    }
    v25[2] = v29;
LABEL_7:
    sub_226C07BC0(&v34);
    uint64_t v12 = *((void *)&v34 + 1);
    a4 = 1;
    if (!*((void *)&v34 + 1)) {
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  uint64_t result = sub_226C342B8();
  __break(1u);
  return result;
}

void *sub_226C07A68(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_226C07A88(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_226C07A88(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156C28);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156BD0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_226C07BC0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    size_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_226C06F78(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v15 != v18)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_226C08868((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    id v21[2] = v22[2];
    v19(v21);
    return sub_226C088D0((uint64_t)v21, &qword_268156C50);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

void *sub_226C07DA4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C30);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C0828C();
  sub_226C343B8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    LOBYTE(v41[0]) = 0;
    uint64_t v8 = sub_226C34158();
    uint64_t v10 = v9;
    LOBYTE(v41[0]) = 1;
    uint64_t v11 = sub_226C34168();
    LOBYTE(v41[0]) = 2;
    uint64_t v32 = sub_226C34138();
    uint64_t v33 = v13;
    uint64_t v34 = v11;
    uint64_t v35 = v8;
    uint64_t v36 = v10;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    uint64_t v14 = sub_226C34398();
    uint64_t v15 = v14;
    uint64_t v16 = MEMORY[0x263F8EE78];
    uint64_t v42 = MEMORY[0x263F8EE78];
    uint64_t v38 = *(void *)(v14 + 16);
    if (v38)
    {
      uint64_t v31 = v4;
      unint64_t v17 = 0;
      uint64_t v18 = v14 + 32;
      uint64_t v37 = v14;
      do
      {
        if (v17 >= *(void *)(v15 + 16))
        {
          __break(1u);
          JUMPOUT(0x226C0827CLL);
        }
        sub_226C082E0(v18, (uint64_t)v41);
        sub_226C082E0((uint64_t)v41, (uint64_t)v40);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156BD0);
        if (swift_dynamicCast())
        {
          switch(v39)
          {
            case 3:
              swift_bridgeObjectRelease();
              break;
            default:
              char v19 = sub_226C34208();
              swift_bridgeObjectRelease();
              uint64_t v15 = v37;
              if ((v19 & 1) == 0) {
                goto LABEL_7;
              }
              break;
          }
          sub_226C083B4(v41, (uint64_t)v40);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_226C07A68(0, *(void *)(v16 + 16) + 1, 1);
          }
          uint64_t v16 = v42;
          unint64_t v21 = *(void *)(v42 + 16);
          unint64_t v20 = *(void *)(v42 + 24);
          if (v21 >= v20 >> 1)
          {
            sub_226C07A68((void *)(v20 > 1), v21 + 1, 1);
            uint64_t v16 = v42;
          }
          *(void *)(v16 + 16) = v21 + 1;
          sub_226C083B4(v40, v16 + 40 * v21 + 32);
          uint64_t v15 = v37;
        }
        else
        {
LABEL_7:
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
        }
        ++v17;
        v18 += 40;
      }
      while (v38 != v17);
      uint64_t v16 = v42;
      uint64_t v4 = v31;
    }
    swift_bridgeObjectRelease();
    unint64_t v22 = *(void *)(v16 + 16);
    swift_release();
    BOOL v23 = v22 >= 3;
    uint64_t v25 = v35;
    uint64_t v24 = v36;
    uint64_t v26 = v34;
    if (v23)
    {
      BOOL v28 = 0;
    }
    else
    {
      type metadata accessor for CUError();
      LOBYTE(v40[0]) = 3;
      sub_226C08818(&qword_268156C38, v27, (void (*)(uint64_t))type metadata accessor for CUError);
      sub_226C34148();
      BOOL v28 = *(void **)&v41[0];
    }
    id v29 = objc_allocWithZone((Class)type metadata accessor for CUError());
    int64_t v7 = CUError.init(domain:code:message:underlying:)(v25, v24, v26, v32, v33, v28);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_226C0828C()
{
  unint64_t result = qword_268156BC0;
  if (!qword_268156BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156BC0);
  }
  return result;
}

uint64_t sub_226C082E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for CUError()
{
  return self;
}

uint64_t sub_226C08368()
{
  unint64_t v0 = sub_226C34128();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_226C083B4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_226C083CC()
{
  unint64_t result = qword_268156BF0;
  if (!qword_268156BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156BF0);
  }
  return result;
}

unint64_t sub_226C08424()
{
  unint64_t result = qword_268156BF8;
  if (!qword_268156BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156BF8);
  }
  return result;
}

unint64_t sub_226C0847C()
{
  unint64_t result = qword_268156C00;
  if (!qword_268156C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156C00);
  }
  return result;
}

unint64_t sub_226C084D4()
{
  unint64_t result = qword_268156C08;
  if (!qword_268156C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156C08);
  }
  return result;
}

unint64_t sub_226C0852C()
{
  unint64_t result = qword_268156C10;
  if (!qword_268156C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156C10);
  }
  return result;
}

uint64_t sub_226C08580(uint64_t a1, uint64_t a2)
{
  return sub_226C08818(&qword_268156C18, a2, (void (*)(uint64_t))type metadata accessor for CUError);
}

uint64_t sub_226C085D0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_226C085DC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CommonError()
{
  return &type metadata for CommonError;
}

uint64_t method lookup function for CUError(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUError);
}

uint64_t dispatch thunk of CUError.__allocating_init(domain:code:message:underlying:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of CUError.__allocating_init(domain:code:message:underlying:userInfo:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CUError.__allocating_init(userError:_:underlying:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of CUError.__allocating_init(userError:_:underlying:userInfo:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of CUError.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t _s14CoreUtilsSwift11CommonErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s14CoreUtilsSwift11CommonErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x226C087E0);
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

ValueMetadata *type metadata accessor for CUError.CodingKeys()
{
  return &type metadata for CUError.CodingKeys;
}

uint64_t sub_226C08818(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_226C08860()
{
  return swift_release();
}

uint64_t sub_226C08868(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226C088D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_226C08934()
{
  unint64_t result = sub_226C0CD4C(MEMORY[0x263F8EE78]);
  qword_2681578F8 = result;
  return result;
}

CoreUtilsSwift::CUEnvironmentValues __swiftcall CUEnvironmentValues.init()()
{
  uint64_t v1 = v0;
  result._values._rawValue = (void *)sub_226C0CD4C(MEMORY[0x263F8EE78]);
  v1->_values._rawValue = result._values._rawValue;
  return result;
}

uint64_t static CUEnvironmentValues.default.getter@<X0>(void *a1@<X8>)
{
  if (qword_2681578F0 != -1) {
    swift_once();
  }
  *a1 = qword_2681578F8;
  return swift_bridgeObjectRetain();
}

id sub_226C089F8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);
    if (v3)
    {
      sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(a1 + 36), 0, a1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      sub_226C0CF44();
      if (swift_dynamicCast()) {
        return (id)v6;
      }
    }
  }
  if (qword_268157950 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_268157958;
  return v5;
}

uint64_t sub_226C08AE4(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for BluetoothAllowScreenOffCUEnvironmentKey);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v5 & 1;
  }
  return result;
}

uint64_t sub_226C08B7C(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey), (v3 & 1) != 0)
    && (sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70),
        swift_dynamicCast()))
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_226C08C20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v4 = sub_226C0C4A8((uint64_t)&type metadata for ClockCUEnvironmentKey), (v5 & 1) != 0)
    && (sub_226C09638((uint64_t)v15, v4, *(_DWORD *)(a1 + 36), 0, a1),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58),
        uint64_t result = swift_dynamicCast(),
        result))
  {
    *(_OWORD *)a2 = v12;
    *(_OWORD *)(a2 + 16) = v13;
    *(_OWORD *)(a2 + 32) = v14;
  }
  else
  {
    if (qword_268157900 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_268157910;
    uint64_t v8 = qword_268157918;
    uint64_t v9 = qword_268157920;
    uint64_t v10 = qword_268157928;
    uint64_t v11 = qword_268157930;
    *(void *)a2 = qword_268157908;
    *(void *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v8;
    *(void *)(a2 + 24) = v9;
    *(void *)(a2 + 32) = v10;
    *(void *)(a2 + 40) = v11;
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t (*sub_226C08D48(uint64_t a1))()
{
  uint64_t v1 = sub_226C0A73C;
  if (*(void *)(a1 + 16))
  {
    unint64_t v3 = sub_226C0C4A8((uint64_t)&type metadata for DateCUEnvironmentKey);
    uint64_t v1 = sub_226C0A73C;
    if (v4)
    {
      sub_226C09638((uint64_t)v7, v3, *(_DWORD *)(a1 + 36), 0, a1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C78);
      if (swift_dynamicCast()) {
        return (uint64_t (*)())v6;
      }
      else {
        return sub_226C0A73C;
      }
    }
  }
  return v1;
}

uint64_t sub_226C08E24(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for DeviceColorCUEnvironmentKey);
    if (v3)
    {
      sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(a1 + 36), 0, a1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      if (swift_dynamicCast()) {
        return v6;
      }
    }
  }
  if (qword_268157938 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_268157940;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_226C08F04(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for GreenTeaCUEnvironmentKey), (v3 & 1) != 0)
    && (sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58),
        swift_dynamicCast()))
  {
    return v5 & 1;
  }
  else
  {
    return CUIsGreenTeaDevice();
  }
}

uint64_t sub_226C08F9C(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for NANAllowScreenOffCUEnvironmentKey);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v5 & 1;
  }
  return result;
}

uint64_t sub_226C09034(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for NANMockIDCUEnvironmentKey), (v3 & 1) != 0)
    && (sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70),
        swift_dynamicCast()))
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_226C090D8(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for PairingAdminACLCUEnvironmentKey);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v5 & 1;
  }
  return result;
}

uint64_t sub_226C09170(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey), (v3 & 1) != 0)
    && (sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80),
        swift_dynamicCast()))
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_226C09210(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey), (v3 & 1) != 0)
    && (sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58),
        __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80),
        swift_dynamicCast()))
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_226C092B0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for ProductTypeCUEnvironmentKey);
    if (v3)
    {
      sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(a1 + 36), 0, a1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      if (swift_dynamicCast()) {
        return v6;
      }
    }
  }
  if (qword_268157960 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_268157968;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_226C09390(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for SecurityDisabledCUEnvironmentKey);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(a1 + 36), 0, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  uint64_t result = swift_dynamicCast();
  if (result) {
    return v5 & 1;
  }
  return result;
}

uint64_t CUEnvironmentValues.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_226C33DD8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  long long v13 = &v21[-v12];
  uint64_t v14 = *v4;
  if (*(void *)(v14 + 16))
  {
    unint64_t v15 = sub_226C0C4A8(a1);
    if (v16)
    {
      sub_226C09638((uint64_t)v21, v15, *(_DWORD *)(v14 + 36), 0, v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      char v17 = swift_dynamicCast();
      uint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);
      if (v17)
      {
        uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
        v18(v13, 0, 1, AssociatedTypeWitness);
        return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v19 + 32))(a4, v13, AssociatedTypeWitness);
      }
      v18(v13, 1, 1, AssociatedTypeWitness);
      (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
}

uint64_t sub_226C09638(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 8 * a2);
    sub_226C06F78(*(void *)(a5 + 56) + 32 * a2, result);
    return v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t CUEnvironmentValues.subscript.setter(uint64_t a1, uint64_t a2)
{
  sub_226C0CE44(a1, a2);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);
  return v4(a1, AssociatedTypeWitness);
}

uint64_t sub_226C09740(uint64_t a1, uint64_t a2)
{
  char v3 = v2;
  if (*(void *)(a1 + 24))
  {
    sub_226C07014((_OWORD *)a1, v14);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v2;
    *unint64_t v2 = 0x8000000000000000;
    sub_226C0C9E4(v14, a2, isUniquelyReferenced_nonNull_native);
    *unint64_t v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_226C0CEE4(a1);
    unint64_t v7 = sub_226C0C4A8(a2);
    if (v8)
    {
      unint64_t v9 = v7;
      char v10 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = *v2;
      uint64_t v13 = *v3;
      *char v3 = 0x8000000000000000;
      if ((v10 & 1) == 0)
      {
        sub_226C0CB88();
        uint64_t v11 = v13;
      }
      sub_226C07014((_OWORD *)(*(void *)(v11 + 56) + 32 * v9), v14);
      sub_226C0C84C(v9, v11);
      *char v3 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      memset(v14, 0, sizeof(v14));
    }
    return sub_226C0CEE4((uint64_t)v14);
  }
}

void (*CUEnvironmentValues.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t **a1, char a2)
{
  unint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
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
  CUEnvironmentValues.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return sub_226C09960;
}

void sub_226C09960(uint64_t **a1, char a2)
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
    sub_226C0CE44((uint64_t)v3, v7);
    char v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
    v8(v4, v5);
  }
  else
  {
    sub_226C0CE44((*a1)[7], v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t CUEnvironmentValues.remove<A>(key:)(uint64_t a1)
{
  sub_226C09A94(a1, v2);
  return sub_226C0CEE4((uint64_t)v2);
}

double sub_226C09A94@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  char v3 = v2;
  unint64_t v5 = sub_226C0C4A8(a1);
  if (v6)
  {
    unint64_t v7 = v5;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v2;
    uint64_t v11 = *v3;
    *char v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_226C0CB88();
      uint64_t v9 = v11;
    }
    sub_226C07014((_OWORD *)(*(void *)(v9 + 56) + 32 * v7), a2);
    sub_226C0C84C(v7, v9);
    *char v3 = v9;
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

uint64_t sub_226C09B54@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return CUKeyPathModifiable.set<A>(_:_:)(a1, a2);
}

uint64_t sub_226C09B5C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return CUKeyPathModifiable.setIfNonNil<A>(_:_:)(a1, a2);
}

uint64_t CUEnvironmental<>.unownedExecutor.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t *__return_ptr))(a2 + 8))(&v6);
  uint64_t v2 = swift_bridgeObjectRetain();
  id v3 = sub_226C089F8(v2);
  swift_bridgeObjectRelease_n();
  uint64_t v4 = sub_226C33DA8();

  return v4;
}

id CUEnvironmentValues.dispatchQueue.getter()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 16)
    && (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for DispatchQueueCUEnvironmentKey), (v3 & 1) != 0))
  {
    sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(v1 + 36), 0, v1);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
    sub_226C0CF44();
    if (swift_dynamicCast())
    {
      id v4 = v6;
      goto LABEL_9;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  if (qword_268157950 != -1) {
    swift_once();
  }
  id v4 = (id)qword_268157958;
LABEL_9:
  swift_bridgeObjectRelease();
  return v4;
}

void sub_226C09CDC(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t CUEnvironmentValues.bluetoothAllowScreenOff.getter()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 16))
  {
    unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for BluetoothAllowScreenOffCUEnvironmentKey);
    if (v3)
    {
      sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(v1 + 36), 0, v1);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        return v5 & 1;
      }
      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t sub_226C09D9C@<X0>(unsigned char *a1@<X8>)
{
  return sub_226C0C314(sub_226C08AE4, a1);
}

uint64_t sub_226C09DB4(char *a1)
{
  char v1 = *a1;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for BluetoothAllowScreenOffCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.bluetoothAllowScreenOff.setter(char a1)
{
  uint64_t v3 = MEMORY[0x263F8D4F8];
  v2[0] = a1;
  return sub_226C09740((uint64_t)v2, (uint64_t)&type metadata for BluetoothAllowScreenOffCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.bluetoothAllowScreenOff.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_226C08AE4(v3);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return sub_226C09EA8;
}

uint64_t sub_226C09EA8(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for BluetoothAllowScreenOffCUEnvironmentKey);
}

void sub_226C09EF4(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t CUEnvironmentValues.bluetoothMockID.getter()
{
  uint64_t v1 = *v0;
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(v1 + 36), 0, v1);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = v6;
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_226C09FD4@<X0>(uint64_t *a1@<X8>)
{
  return sub_226C0B484(sub_226C08B7C, a1);
}

uint64_t sub_226C09FEC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
  v4[0] = v2;
  v4[1] = v1;
  swift_bridgeObjectRetain();
  return sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.bluetoothMockID.setter(uint64_t a1, uint64_t a2)
{
  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
  v5[0] = a1;
  v5[1] = a2;
  return sub_226C09740((uint64_t)v5, (uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.bluetoothMockID.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_226C08B7C(v3);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_226C0A110;
}

uint64_t sub_226C0A110(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (a2)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
    uint64_t v5 = v3;
    uint64_t v6 = v2;
    swift_bridgeObjectRetain();
    sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
    uint64_t v5 = v3;
    uint64_t v6 = v2;
    return sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for BluetoothMockIDCUEnvironmentKey);
  }
}

uint64_t sub_226C0A1B8()
{
  uint64_t v0 = sub_226C01F08();
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  qword_268157908 = *v0;
  qword_268157910 = v1;
  qword_268157918 = v2;
  qword_268157920 = v3;
  qword_268157928 = v4;
  qword_268157930 = v5;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_226C0A238@<X0>(void *a1@<X8>)
{
  if (qword_268157900 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_268157910;
  uint64_t v3 = qword_268157918;
  uint64_t v4 = qword_268157920;
  uint64_t v5 = qword_268157928;
  uint64_t v6 = qword_268157930;
  *a1 = qword_268157908;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  a1[5] = v6;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t CUEnvironmentValues.clock.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_226C0C4A8((uint64_t)&type metadata for ClockCUEnvironmentKey), (v5 & 1) != 0))
  {
    sub_226C09638((uint64_t)v16, v4, *(_DWORD *)(v3 + 36), 0, v3);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
    if (swift_dynamicCast())
    {
      uint64_t result = swift_bridgeObjectRelease();
      *(_OWORD *)a1 = v12;
      *(_OWORD *)(a1 + 16) = v13;
      *(void *)(a1 + 32) = v14;
      *(void *)(a1 + 40) = v15;
      return result;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  if (qword_268157900 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_268157910;
  uint64_t v8 = qword_268157918;
  uint64_t v9 = qword_268157920;
  uint64_t v10 = qword_268157928;
  uint64_t v11 = qword_268157930;
  *(void *)a1 = qword_268157908;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_bridgeObjectRelease();
}

double sub_226C0A444@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_226C08C20(v2, (uint64_t)v5);
  swift_bridgeObjectRelease();
  long long v3 = v5[1];
  *a1 = v5[0];
  a1[1] = v3;
  double result = *(double *)&v6;
  a1[2] = v6;
  return result;
}

uint64_t sub_226C0A498(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[5];
  v6[3] = &type metadata for CUClock;
  uint64_t v4 = swift_allocObject();
  v6[0] = v4;
  *(void *)(v4 + 16) = v2;
  *(_OWORD *)(v4 + 24) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v4 + 40) = *(_OWORD *)(a1 + 3);
  *(void *)(v4 + 56) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return sub_226C09740((uint64_t)v6, (uint64_t)&type metadata for ClockCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.clock.setter(_OWORD *a1)
{
  v5[3] = &type metadata for CUClock;
  uint64_t v2 = (_OWORD *)swift_allocObject();
  v5[0] = v2;
  long long v3 = a1[1];
  v2[1] = *a1;
  _OWORD v2[2] = v3;
  v2[3] = a1[2];
  return sub_226C09740((uint64_t)v5, (uint64_t)&type metadata for ClockCUEnvironmentKey);
}

void (*CUEnvironmentValues.clock.modify(void *a1))(uint64_t **a1, char a2)
{
  long long v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[6] = v1;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_226C08C20(v4, (uint64_t)v3);
  swift_bridgeObjectRelease();
  return sub_226C0A620;
}

void sub_226C0A620(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  uint64_t v6 = (*a1)[2];
  uint64_t v5 = (*a1)[3];
  uint64_t v8 = (*a1)[4];
  uint64_t v7 = (*a1)[5];
  v11[3] = &type metadata for CUClock;
  if (a2)
  {
    uint64_t v9 = (void *)swift_allocObject();
    v11[0] = v9;
    v9[2] = v4;
    v9[3] = v3;
    v9[4] = v6;
    v9[5] = v5;
    v9[6] = v8;
    v9[7] = v7;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_226C09740((uint64_t)v11, (uint64_t)&type metadata for ClockCUEnvironmentKey);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v10 = (void *)swift_allocObject();
    v11[0] = v10;
    v10[2] = v4;
    v10[3] = v3;
    v10[4] = v6;
    v10[5] = v5;
    v10[6] = v8;
    v10[7] = v7;
    sub_226C09740((uint64_t)v11, (uint64_t)&type metadata for ClockCUEnvironmentKey);
  }
  free(v2);
}

void sub_226C0A740(void *a1@<X8>)
{
  *a1 = sub_226C0A73C;
  a1[1] = 0;
}

uint64_t (*CUEnvironmentValues.date.getter())()
{
  uint64_t v1 = *v0;
  if (!*(void *)(v1 + 16) || (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for DateCUEnvironmentKey), (v3 & 1) == 0))
  {
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(v1 + 36), 0, v1);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C78);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    swift_bridgeObjectRelease();
    return sub_226C0A73C;
  }
  uint64_t v4 = v6;
  swift_bridgeObjectRelease();
  return (uint64_t (*)())v4;
}

uint64_t sub_226C0A83C@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v2 = swift_bridgeObjectRetain();
  char v3 = sub_226C08D48(v2);
  uint64_t v5 = v4;
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  a1[1] = v5;
  return result;
}

uint64_t sub_226C0A888(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C78);
  v4[0] = v2;
  v4[1] = v1;
  swift_retain();
  return sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for DateCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.date.setter(uint64_t a1, uint64_t a2)
{
  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C78);
  v5[0] = a1;
  v5[1] = a2;
  return sub_226C09740((uint64_t)v5, (uint64_t)&type metadata for DateCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.date.modify(uint64_t (**a1)()))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_226C08D48(v3);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_226C0A9AC;
}

uint64_t sub_226C0A9AC(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (a2)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C78);
    uint64_t v5 = v3;
    uint64_t v6 = v2;
    swift_retain();
    sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for DateCUEnvironmentKey);
    return swift_release();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C78);
    uint64_t v5 = v3;
    uint64_t v6 = v2;
    return sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for DateCUEnvironmentKey);
  }
}

void sub_226C0AA54(uint64_t a1)
{
}

uint64_t sub_226C0AA7C@<X0>(void *a1@<X8>)
{
  return sub_226C0BEE4(&qword_268157938, &qword_268157940, &qword_268157948, a1);
}

uint64_t CUEnvironmentValues.deviceColor.getter()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 16)
    && (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for DeviceColorCUEnvironmentKey), (v3 & 1) != 0))
  {
    sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(v1 + 36), 0, v1);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
    if (swift_dynamicCast())
    {
      uint64_t v4 = v6;
      goto LABEL_9;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  if (qword_268157938 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_268157940;
  swift_bridgeObjectRetain();
LABEL_9:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_226C0ABA8@<X0>(uint64_t *a1@<X8>)
{
  return sub_226C0C064(sub_226C08E24, a1);
}

uint64_t sub_226C0ABC0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  v4[3] = MEMORY[0x263F8D310];
  v4[0] = v2;
  v4[1] = v1;
  swift_bridgeObjectRetain();
  return sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for DeviceColorCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.deviceColor.setter(uint64_t a1, uint64_t a2)
{
  v3[3] = MEMORY[0x263F8D310];
  v3[0] = a1;
  v3[1] = a2;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for DeviceColorCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.deviceColor.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_226C08E24(v3);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_226C0ACB8;
}

uint64_t sub_226C0ACB8(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (a2)
  {
    uint64_t v7 = MEMORY[0x263F8D310];
    uint64_t v5 = v2;
    uint64_t v6 = v3;
    swift_bridgeObjectRetain();
    sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for DeviceColorCUEnvironmentKey);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8D310];
    uint64_t v5 = v2;
    uint64_t v6 = v3;
    return sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for DeviceColorCUEnvironmentKey);
  }
}

uint64_t sub_226C0AD4C()
{
  sub_226C0CF44();
  uint64_t result = static OS_dispatch_queue_serial.mainSerialQueue.getter();
  qword_268157958 = result;
  return result;
}

id sub_226C0AD80@<X0>(void *a1@<X8>)
{
  if (qword_268157950 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_268157958;
  *a1 = qword_268157958;
  return v2;
}

uint64_t sub_226C0ADEC@<X0>(void *a1@<X8>)
{
  uint64_t v2 = swift_bridgeObjectRetain();
  id v3 = sub_226C089F8(v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_226C0AE34(void **a1)
{
  uint64_t v1 = *a1;
  v4[3] = sub_226C0CF44();
  v4[0] = v1;
  id v2 = v1;
  return sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.dispatchQueue.setter(uint64_t a1)
{
  v3[3] = sub_226C0CF44();
  v3[0] = a1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);
}

void (*CUEnvironmentValues.dispatchQueue.modify(void *a1))(void **a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  id v4 = sub_226C089F8(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_226C0AF34;
}

void sub_226C0AF34(void **a1, char a2)
{
  id v2 = *a1;
  if (a2)
  {
    unint64_t v5 = sub_226C0CF44();
    v4[0] = v2;
    id v3 = v2;
    sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);
  }
  else
  {
    unint64_t v5 = sub_226C0CF44();
    v4[0] = v2;
    sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for DispatchQueueCUEnvironmentKey);
  }
}

uint64_t sub_226C0AFC8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = CUIsGreenTeaDevice();
  *a1 = result;
  return result;
}

uint64_t CUEnvironmentValues.greenTea.getter()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  char v1 = sub_226C08F04(v0);
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_226C0B02C@<X0>(unsigned char *a1@<X8>)
{
  return sub_226C0C314(sub_226C08F04, a1);
}

uint64_t sub_226C0B044(char *a1)
{
  char v1 = *a1;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for GreenTeaCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.greenTea.setter(char a1)
{
  uint64_t v3 = MEMORY[0x263F8D4F8];
  v2[0] = a1;
  return sub_226C09740((uint64_t)v2, (uint64_t)&type metadata for GreenTeaCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.greenTea.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_226C08F04(v3);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return sub_226C0B138;
}

uint64_t sub_226C0B138(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for GreenTeaCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.nanAllowScreenOff.getter()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 16))
  {
    unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for NANAllowScreenOffCUEnvironmentKey);
    if (v3)
    {
      sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(v1 + 36), 0, v1);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        return v5 & 1;
      }
      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t sub_226C0B23C@<X0>(unsigned char *a1@<X8>)
{
  return sub_226C0C314(sub_226C08F9C, a1);
}

uint64_t sub_226C0B254(char *a1)
{
  char v1 = *a1;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for NANAllowScreenOffCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.nanAllowScreenOff.setter(char a1)
{
  uint64_t v3 = MEMORY[0x263F8D4F8];
  v2[0] = a1;
  return sub_226C09740((uint64_t)v2, (uint64_t)&type metadata for NANAllowScreenOffCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.nanAllowScreenOff.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_226C08F9C(v3);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return sub_226C0B348;
}

uint64_t sub_226C0B348(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for NANAllowScreenOffCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.nanMockID.getter()
{
  uint64_t v1 = *v0;
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(v1 + 36), 0, v1);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = v6;
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_226C0B46C@<X0>(uint64_t *a1@<X8>)
{
  return sub_226C0B484(sub_226C09034, a1);
}

uint64_t sub_226C0B484@<X0>(uint64_t (*a1)(uint64_t)@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = a1(v4);
  uint64_t v7 = v6;
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_226C0B4D8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  void v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
  v4[0] = v2;
  v4[1] = v1;
  swift_bridgeObjectRetain();
  return sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.nanMockID.setter(uint64_t a1, uint64_t a2)
{
  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
  v5[0] = a1;
  v5[1] = a2;
  return sub_226C09740((uint64_t)v5, (uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.nanMockID.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_226C09034(v3);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_226C0B5FC;
}

uint64_t sub_226C0B5FC(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (a2)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
    uint64_t v5 = v3;
    uint64_t v6 = v2;
    swift_bridgeObjectRetain();
    sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C70);
    uint64_t v5 = v3;
    uint64_t v6 = v2;
    return sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for NANMockIDCUEnvironmentKey);
  }
}

uint64_t CUEnvironmentValues.pairingAdminACL.getter()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 16))
  {
    unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for PairingAdminACLCUEnvironmentKey);
    if (v3)
    {
      sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(v1 + 36), 0, v1);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        return v5 & 1;
      }
      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t sub_226C0B75C@<X0>(unsigned char *a1@<X8>)
{
  return sub_226C0C314(sub_226C090D8, a1);
}

uint64_t sub_226C0B774(char *a1)
{
  char v1 = *a1;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for PairingAdminACLCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.pairingAdminACL.setter(char a1)
{
  uint64_t v3 = MEMORY[0x263F8D4F8];
  v2[0] = a1;
  return sub_226C09740((uint64_t)v2, (uint64_t)&type metadata for PairingAdminACLCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.pairingAdminACL.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_226C090D8(v3);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return sub_226C0B868;
}

uint64_t sub_226C0B868(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for PairingAdminACLCUEnvironmentKey);
}

void sub_226C0B8B4(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t CUEnvironmentValues.pairingPeerIdentity.getter()
{
  uint64_t v1 = *v0;
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(v1 + 36), 0, v1);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = v6;
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_226C0B980@<X0>(uint64_t *a1@<X8>)
{
  return sub_226C0BC14(sub_226C09170, a1);
}

uint64_t sub_226C0B998(void **a1)
{
  uint64_t v1 = *a1;
  void v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
  v4[0] = v1;
  id v2 = v1;
  return sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.pairingPeerIdentity.setter(uint64_t a1)
{
  v3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
  v3[0] = a1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);
}

void (*CUEnvironmentValues.pairingPeerIdentity.modify(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_226C09170(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_226C0BAA0;
}

void sub_226C0BAA0(void **a1, char a2)
{
  id v2 = *a1;
  if (a2)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
    v4[0] = v2;
    id v3 = v2;
    sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
    v4[0] = v2;
    sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for PairingPeerIdentityCUEnvironmentKey);
  }
}

uint64_t CUEnvironmentValues.pairingSelfIdentity.getter()
{
  uint64_t v1 = *v0;
  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(v1 + 36), 0, v1);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
  if (!swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v4 = v6;
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_226C0BBFC@<X0>(uint64_t *a1@<X8>)
{
  return sub_226C0BC14(sub_226C09210, a1);
}

uint64_t sub_226C0BC14@<X0>(uint64_t (*a1)(uint64_t)@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = a1(v4);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5;
  return result;
}

uint64_t sub_226C0BC64(void **a1)
{
  uint64_t v1 = *a1;
  void v4[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
  v4[0] = v1;
  id v2 = v1;
  return sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.pairingSelfIdentity.setter(uint64_t a1)
{
  v3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
  v3[0] = a1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);
}

void (*CUEnvironmentValues.pairingSelfIdentity.modify(uint64_t *a1))(void **a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_226C09210(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_226C0BD6C;
}

void sub_226C0BD6C(void **a1, char a2)
{
  id v2 = *a1;
  if (a2)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
    v4[0] = v2;
    id v3 = v2;
    sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C80);
    v4[0] = v2;
    sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for PairingSelfIdentityCUEnvironmentKey);
  }
}

void sub_226C0BE04(uint64_t a1)
{
}

void sub_226C0BE2C(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, void *a4)
{
  id v7 = (id)MobileGestalt_get_current_device();
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = (id)a2();

    if (v9)
    {
      uint64_t v10 = sub_226C33998();
      uint64_t v12 = v11;

      *a3 = v10;
      *a4 = v12;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_226C0BEB8@<X0>(void *a1@<X8>)
{
  return sub_226C0BEE4(&qword_268157960, &qword_268157968, qword_268157970, a1);
}

uint64_t sub_226C0BEE4@<X0>(void *a1@<X2>, void *a2@<X3>, uint64_t *a3@<X4>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;
  return swift_bridgeObjectRetain();
}

uint64_t CUEnvironmentValues.productType.getter()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 16)
    && (unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for ProductTypeCUEnvironmentKey), (v3 & 1) != 0))
  {
    sub_226C09638((uint64_t)v7, v2, *(_DWORD *)(v1 + 36), 0, v1);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
    if (swift_dynamicCast())
    {
      uint64_t v4 = v6;
      goto LABEL_9;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  if (qword_268157960 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_268157968;
  swift_bridgeObjectRetain();
LABEL_9:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_226C0C04C@<X0>(uint64_t *a1@<X8>)
{
  return sub_226C0C064(sub_226C092B0, a1);
}

uint64_t sub_226C0C064@<X0>(uint64_t (*a1)(uint64_t)@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = a1(v4);
  uint64_t v7 = v6;
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_226C0C0B8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  void v4[3] = MEMORY[0x263F8D310];
  v4[0] = v2;
  v4[1] = v1;
  swift_bridgeObjectRetain();
  return sub_226C09740((uint64_t)v4, (uint64_t)&type metadata for ProductTypeCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.productType.setter(uint64_t a1, uint64_t a2)
{
  v3[3] = MEMORY[0x263F8D310];
  v3[0] = a1;
  v3[1] = a2;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for ProductTypeCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.productType.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_226C092B0(v3);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v6;
  return sub_226C0C1B0;
}

uint64_t sub_226C0C1B0(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (a2)
  {
    uint64_t v7 = MEMORY[0x263F8D310];
    uint64_t v5 = v2;
    uint64_t v6 = v3;
    swift_bridgeObjectRetain();
    sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for ProductTypeCUEnvironmentKey);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8D310];
    uint64_t v5 = v2;
    uint64_t v6 = v3;
    return sub_226C09740((uint64_t)&v5, (uint64_t)&type metadata for ProductTypeCUEnvironmentKey);
  }
}

uint64_t CUEnvironmentValues.securityDisabled.getter()
{
  uint64_t v1 = *v0;
  if (*(void *)(v1 + 16))
  {
    unint64_t v2 = sub_226C0C4A8((uint64_t)&type metadata for SecurityDisabledCUEnvironmentKey);
    if (v3)
    {
      sub_226C09638((uint64_t)v6, v2, *(_DWORD *)(v1 + 36), 0, v1);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        return v5 & 1;
      }
      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t sub_226C0C2FC@<X0>(unsigned char *a1@<X8>)
{
  return sub_226C0C314(sub_226C09390, a1);
}

uint64_t sub_226C0C314@<X0>(uint64_t (*a1)(uint64_t)@<X3>, unsigned char *a2@<X8>)
{
  uint64_t v4 = swift_bridgeObjectRetain();
  LOBYTE(a1) = a1(v4);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = a1 & 1;
  return result;
}

uint64_t sub_226C0C368(char *a1)
{
  char v1 = *a1;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for SecurityDisabledCUEnvironmentKey);
}

uint64_t CUEnvironmentValues.securityDisabled.setter(char a1)
{
  uint64_t v3 = MEMORY[0x263F8D4F8];
  v2[0] = a1;
  return sub_226C09740((uint64_t)v2, (uint64_t)&type metadata for SecurityDisabledCUEnvironmentKey);
}

uint64_t (*CUEnvironmentValues.securityDisabled.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_226C09390(v3);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v4 & 1;
  return sub_226C0C45C;
}

uint64_t sub_226C0C45C(uint64_t a1)
{
  char v1 = *(unsigned char *)(a1 + 8);
  uint64_t v4 = MEMORY[0x263F8D4F8];
  v3[0] = v1;
  return sub_226C09740((uint64_t)v3, (uint64_t)&type metadata for SecurityDisabledCUEnvironmentKey);
}

unint64_t sub_226C0C4A8(uint64_t a1)
{
  uint64_t v2 = sub_226C34348();
  return sub_226C0C4EC(a1, v2);
}

unint64_t sub_226C0C4EC(uint64_t a1, uint64_t a2)
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

uint64_t sub_226C0C588(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C88);
  uint64_t result = sub_226C340E8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    uint64_t v31 = v3;
    int64_t v8 = 0;
    id v9 = (void *)(v5 + 64);
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
                uint64_t v3 = v31;
                goto LABEL_41;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v9 = -1 << v30;
              }
              uint64_t v3 = v31;
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
      unint64_t v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2) {
        sub_226C07014(v22, v32);
      }
      else {
        sub_226C06F78((uint64_t)v22, (uint64_t)v32);
      }
      uint64_t result = sub_226C34348();
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
      uint64_t result = (uint64_t)sub_226C07014(v32, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_226C0C84C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_226C33EE8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v10 = *(void *)(a2 + 48);
        uint64_t v11 = (void *)(v10 + 8 * v6);
        uint64_t result = sub_226C34348();
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

_OWORD *sub_226C0C9E4(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_226C0C4A8(a2);
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
      sub_226C0CB88();
      goto LABEL_7;
    }
    sub_226C0C588(v13, a3 & 1);
    unint64_t v19 = sub_226C0C4A8(a2);
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
    uint64_t result = (_OWORD *)sub_226C342B8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    unint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
    return sub_226C07014(a1, v17);
  }
LABEL_13:
  return sub_226C0CB20(v10, a2, a1, v16);
}

_OWORD *sub_226C0CB20(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_226C07014(a3, (_OWORD *)(a4[7] + 32 * a1));
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

void *sub_226C0CB88()
{
  char v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226C340D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *char v1 = v4;
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
    sub_226C06F78(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t result = sub_226C07014(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
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

unint64_t sub_226C0CD4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156C88);
    uint64_t v3 = (void *)sub_226C340F8();
    for (uint64_t i = a1 + 32; ; i += 40)
    {
      sub_226C0D0E4(i, (uint64_t)&v11);
      uint64_t v5 = v11;
      unint64_t result = sub_226C0C4A8(v11);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      unint64_t result = (unint64_t)sub_226C07014(&v12, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_226C0CE44(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_0, a1, AssociatedTypeWitness);
  return sub_226C09740((uint64_t)v7, a2);
}

uint64_t sub_226C0CEE4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_226C0CF44()
{
  unint64_t result = qword_268156C68;
  if (!qword_268156C68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268156C68);
  }
  return result;
}

uint64_t sub_226C0CF84()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t dispatch thunk of static CUEnvironmentKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for CUEnvironmentValues()
{
  return &type metadata for CUEnvironmentValues;
}

uint64_t dispatch thunk of CUEnvironmental.environment.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for SecurityDisabledCUEnvironmentKey()
{
  return &type metadata for SecurityDisabledCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for ProductTypeCUEnvironmentKey()
{
  return &type metadata for ProductTypeCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for PairingSelfIdentityCUEnvironmentKey()
{
  return &type metadata for PairingSelfIdentityCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for PairingPeerIdentityCUEnvironmentKey()
{
  return &type metadata for PairingPeerIdentityCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for PairingAdminACLCUEnvironmentKey()
{
  return &type metadata for PairingAdminACLCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for NANMockIDCUEnvironmentKey()
{
  return &type metadata for NANMockIDCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for NANAllowScreenOffCUEnvironmentKey()
{
  return &type metadata for NANAllowScreenOffCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for GreenTeaCUEnvironmentKey()
{
  return &type metadata for GreenTeaCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for DeviceColorCUEnvironmentKey()
{
  return &type metadata for DeviceColorCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for DateCUEnvironmentKey()
{
  return &type metadata for DateCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for ClockCUEnvironmentKey()
{
  return &type metadata for ClockCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for BluetoothMockIDCUEnvironmentKey()
{
  return &type metadata for BluetoothMockIDCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for BluetoothAllowScreenOffCUEnvironmentKey()
{
  return &type metadata for BluetoothAllowScreenOffCUEnvironmentKey;
}

ValueMetadata *type metadata accessor for DispatchQueueCUEnvironmentKey()
{
  return &type metadata for DispatchQueueCUEnvironmentKey;
}

uint64_t sub_226C0D0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156C90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double UUIDTtoBytes(_:)(char a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8, int a9, int a10)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CEF8);
  uint64_t v18 = swift_allocObject();
  *(void *)&double result = 16;
  *(_OWORD *)(v18 + 16) = xmmword_226C367D0;
  *(unsigned char *)(v18 + 32) = a1;
  *(unsigned char *)(v18 + 33) = a2;
  *(unsigned char *)(v18 + 34) = a3;
  *(unsigned char *)(v18 + 35) = a4;
  *(unsigned char *)(v18 + 36) = a5;
  *(unsigned char *)(v18 + 37) = a6;
  *(unsigned char *)(v18 + 38) = a7;
  *(unsigned char *)(v18 + 39) = a8;
  *(_DWORD *)(v18 + 40) = a9;
  *(_DWORD *)(v18 + 44) = a10;
  return result;
}

double UUID.bytes.getter()
{
  unint64_t v0 = sub_226C335F8();
  char v1 = v0;
  char v3 = v2;
  unint64_t v4 = v0 >> 8;
  unint64_t v5 = v0 >> 16;
  unint64_t v6 = v0 >> 24;
  unint64_t v7 = HIDWORD(v0);
  unint64_t v8 = v0 >> 40;
  unint64_t v9 = HIWORD(v0);
  unint64_t v10 = HIBYTE(v0);
  unint64_t v11 = v2 >> 8;
  unint64_t v14 = v2 >> 16;
  unint64_t v15 = v2 >> 24;
  unint64_t v16 = HIDWORD(v2);
  unint64_t v17 = v2 >> 40;
  unint64_t v18 = HIWORD(v2);
  unint64_t v19 = HIBYTE(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CEF8);
  uint64_t v12 = swift_allocObject();
  *(void *)&double result = 16;
  *(_OWORD *)(v12 + 16) = xmmword_226C367D0;
  *(unsigned char *)(v12 + 32) = v1;
  *(unsigned char *)(v12 + 33) = v4;
  *(unsigned char *)(v12 + 34) = v5;
  *(unsigned char *)(v12 + 35) = v6;
  *(unsigned char *)(v12 + 36) = v7;
  *(unsigned char *)(v12 + 37) = v8;
  *(unsigned char *)(v12 + 38) = v9;
  *(unsigned char *)(v12 + 39) = v10;
  *(unsigned char *)(v12 + 40) = v3;
  *(unsigned char *)(v12 + 41) = v11;
  *(unsigned char *)(v12 + 42) = v14;
  *(unsigned char *)(v12 + 43) = v15;
  *(unsigned char *)(v12 + 44) = v16;
  *(unsigned char *)(v12 + 45) = v17;
  *(unsigned char *)(v12 + 46) = v18;
  *(unsigned char *)(v12 + 47) = v19;
  return result;
}

void CULogHandle.ulog(_:_:)(uint64_t a1)
{
  id v3 = (id)sub_226C33988();
  objc_msgSend(v1, sel_ulog_message_, a1, v3);
}

void *sub_226C0D368()
{
  return &unk_2647D3F10;
}

unint64_t sub_226C0D374(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156E08);
  uint64_t v2 = sub_226C340F8();
  id v3 = (void *)v2;
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
    sub_226C1FC98(v6, (uint64_t)v15, &qword_268156E20);
    unint64_t result = sub_226C1B044((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_226C07014(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_226C0D4B8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C40);
  uint64_t v2 = sub_226C340F8();
  id v3 = (void *)v2;
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
    sub_226C1FC98(v6, (uint64_t)&v15, &qword_268156DF0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_226C06F00(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_226C07014(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void *CUAsyncSemaphore.__allocating_init()()
{
  unint64_t v0 = (void *)swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  v0[2] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C98);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v0[3] = v2;
  v0[4] = 0;
  v0[5] = sub_226C0D374(v1);
  return v0;
}

void *CUAsyncSemaphore.init()()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  v0[2] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C98);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v0[3] = v2;
  v0[4] = 0;
  v0[5] = sub_226C0D374(v1);
  return v0;
}

Swift::Void __swiftcall CUAsyncSemaphore.signal()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 24);
  swift_retain();
  os_unfair_lock_lock(v1 + 4);
  sub_226C1ADA0();
  os_unfair_lock_unlock(v1 + 4);
  swift_release();
}

uint64_t sub_226C0D728(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 16);
    *(void *)(a1 + 32) = v8;
    if (*(void *)(v9 + 16))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, v9 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
      sub_226C1C86C(0, 1);
      sub_226C33B68();
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

uint64_t sub_226C0D84C()
{
  return sub_226C0D728(v0);
}

uint64_t CUAsyncSemaphore.wait()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_226C0D898, 0, 0);
}

uint64_t sub_226C0D898()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  uint64_t v3 = *(void *)(v1 + 32);
  BOOL v4 = __OFSUB__(v3, 1);
  uint64_t v5 = v3 - 1;
  if (v4)
  {
    __break(1u);
    return MEMORY[0x270FA2318]();
  }
  *(void *)(v1 + 32) = v5;
  if (v5 < 0)
  {
    uint64_t v9 = (void *)swift_task_alloc();
    v0[3] = v9;
    void *v9 = v0;
    v9[1] = sub_226C0D9FC;
    return MEMORY[0x270FA2318]();
  }
  uint64_t v6 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_unlock(v6 + 4);
  swift_release();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_226C0D9FC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_226C0DAF8, 0, 0);
}

uint64_t sub_226C0DAF8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226C0DB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *(void **)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = (void *)sub_226C1B150(0, v8[2] + 1, 1, v8);
    *(void *)(a2 + 16) = v8;
  }
  unint64_t v11 = v8[2];
  unint64_t v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    uint64_t v8 = (void *)sub_226C1B150(v10 > 1, v11 + 1, 1, v8);
    *(void *)(a2 + 16) = v8;
  }
  v8[2] = v11 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v11, v7, v4);
  uint64_t v12 = *(os_unfair_lock_s **)(a2 + 24);
  swift_retain();
  os_unfair_lock_unlock(v12 + 4);
  return swift_release();
}

uint64_t CUAsyncSemaphore.subscript.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 24);
  swift_retain();
  os_unfair_lock_lock(v1 + 4);
  sub_226C1ADA0();
  os_unfair_lock_unlock(v1 + 4);
  return swift_release();
}

uint64_t sub_226C0DD38()
{
  return CUAsyncSemaphore.subscript.getter();
}

uint64_t sub_226C0DD6C(uint64_t a1)
{
  sub_226C1FC98(a1, (uint64_t)v2, &qword_268156C60);
  return sub_226C1CDD0((uint64_t)v2);
}

uint64_t CUAsyncSemaphore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_226C1CDD0(a1);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8);
  return v5(a2, a3);
}

uint64_t sub_226C0DE3C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_226C07014((_OWORD *)a1, v7);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_226C1BAFC(v7, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v6;
    swift_bridgeObjectRelease();
    return sub_226C1FBE8(a2);
  }
  else
  {
    sub_226C088D0(a1, &qword_268156C60);
    sub_226C1B51C(a2, v7);
    sub_226C1FBE8(a2);
    return sub_226C088D0((uint64_t)v7, &qword_268156C60);
  }
}

void (*CUAsyncSemaphore.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t *a1, char a2)
{
  uint64_t v8 = malloc(0x68uLL);
  *a1 = v8;
  v8[9] = a4;
  v8[10] = v4;
  v8[8] = a3;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = v9;
  v8[11] = v9;
  v8[12] = malloc(*(void *)(v9 + 64));
  (*(void (**)(void))(v10 + 16))();
  CUAsyncSemaphore.subscript.getter();
  return sub_226C0DFF0;
}

void sub_226C0DFF0(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    uint64_t v4 = v2[11];
    uint64_t v3 = (void *)v2[12];
    uint64_t v5 = v2[8];
    sub_226C1FC98(*a1, (uint64_t)(v2 + 4), &qword_268156C60);
    sub_226C1CDD0((uint64_t)(v2 + 4));
    (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v5);
    sub_226C088D0((uint64_t)v2, &qword_268156C60);
  }
  else
  {
    uint64_t v6 = v2[11];
    uint64_t v3 = (void *)v2[12];
    uint64_t v7 = v2[8];
    sub_226C1CDD0(*a1);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v7);
  }
  free(v3);
  free(v2);
}

uint64_t CUAsyncSemaphore.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CUAsyncSemaphore.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t CUDarwinNotification.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(_DWORD *)(v4 + 48) = -1;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  uint64_t v5 = (const char *)(sub_226C339C8() + 32);
  swift_beginAccess();
  notify_register_check(v5, (int *)(v4 + 48));
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t CUDarwinNotification.init(name:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(_DWORD *)(v2 + 48) = -1;
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  uint64_t v3 = (const char *)(sub_226C339C8() + 32);
  swift_beginAccess();
  notify_register_check(v3, (int *)(v2 + 48));
  swift_endAccess();
  swift_release();
  return v2;
}

uint64_t CUDarwinNotification.__allocating_init(name:dispatchQueue:handler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  swift_allocObject();
  uint64_t v10 = sub_226C1CE70(a1, a2, a3, a4, a5);

  return v10;
}

uint64_t CUDarwinNotification.init(name:dispatchQueue:handler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = sub_226C1CE70(a1, a2, a3, a4, a5);

  return v6;
}

uint64_t sub_226C0E324(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t CUDarwinNotification.deinit()
{
  swift_beginAccess();
  int v1 = *(_DWORD *)(v0 + 48);
  if (v1 != -1)
  {
    notify_cancel(v1);
    *(_DWORD *)(v0 + 48) = -1;
  }
  sub_226C1CFF4(*(void *)(v0 + 16));
  swift_bridgeObjectRelease();
  return v0;
}

Swift::Void __swiftcall CUDarwinNotification.cancel()()
{
  swift_beginAccess();
  int v1 = *(_DWORD *)(v0 + 48);
  if (v1 != -1)
  {
    notify_cancel(v1);
    *(_DWORD *)(v0 + 48) = -1;
  }
}

uint64_t CUDarwinNotification.__deallocating_deinit()
{
  swift_beginAccess();
  int v1 = *(_DWORD *)(v0 + 48);
  if (v1 != -1)
  {
    notify_cancel(v1);
    *(_DWORD *)(v0 + 48) = -1;
  }
  sub_226C1CFF4(*(void *)(v0 + 16));
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall CUDarwinNotification.post()()
{
  uint64_t v0 = sub_226C339C8();
  notify_post((const char *)(v0 + 32));
  swift_release();
}

uint64_t static CUDarwinNotification.post(name:)()
{
  uint64_t v0 = sub_226C339C8();
  notify_post((const char *)(v0 + 32));
  return swift_release();
}

uint64_t CUDarwinNotification.state.getter()
{
  state64[4] = *MEMORY[0x263EF8340];
  state64[0] = 0;
  swift_beginAccess();
  notify_get_state(*(_DWORD *)(v0 + 48), state64);
  return state64[0];
}

uint64_t sub_226C0E59C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  state64[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  state64[0] = 0;
  swift_beginAccess();
  uint64_t result = notify_get_state(*(_DWORD *)(v3 + 48), state64);
  *a2 = state64[0];
  return result;
}

uint64_t sub_226C0E620(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  notify_set_state(*(_DWORD *)(v3 + 48), v2);
  uint64_t v4 = sub_226C339C8();
  notify_post((const char *)(v4 + 32));
  return swift_release();
}

uint64_t CUDarwinNotification.state.setter(uint64_t a1)
{
  swift_beginAccess();
  notify_set_state(*(_DWORD *)(v1 + 48), a1);
  uint64_t v3 = sub_226C339C8();
  notify_post((const char *)(v3 + 32));
  return swift_release();
}

void (*CUDarwinNotification.state.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  void v3[4] = 0;
  swift_beginAccess();
  notify_get_state(*(_DWORD *)(v1 + 48), v3 + 4);
  v3[3] = v3[4];
  return sub_226C0E7A8;
}

void sub_226C0E7A8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  notify_set_state(*(_DWORD *)(*(void *)(*(void *)a1 + 40) + 48), *(void *)(*(void *)a1 + 24));
  uint64_t v2 = sub_226C339C8();
  notify_post((const char *)(v2 + 32));
  swift_release();
  free(v1);
}

id CUDispatchTaskExecutor.dispatchQueue.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t CUDispatchTaskExecutor.__allocating_init(dispatchQueue:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t CUDispatchTaskExecutor.init(dispatchQueue:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t CUDispatchTaskExecutor.enqueue(_:)()
{
  return sub_226C33DB8();
}

uint64_t CUDispatchTaskExecutor.deinit()
{
  return v0;
}

uint64_t CUDispatchTaskExecutor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_226C0E8CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226C0E8FC(a1, a2, a3, MEMORY[0x263F8F498]);
}

uint64_t sub_226C0E8E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226C0E8FC(a1, a2, a3, MEMORY[0x263F8F4A0]);
}

uint64_t sub_226C0E8FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t v7 = sub_226C1DAF0(&qword_268156DA0, a2, (void (*)(uint64_t))type metadata accessor for CUDispatchTaskExecutor);
  return a4(a1, v6, v7);
}

uint64_t sub_226C0E9B0()
{
  return MEMORY[0x270FA2078](*v0);
}

uint64_t sub_226C0E9DC(uint64_t a1)
{
  return MEMORY[0x270FA1E38](a1, *v1);
}

uint64_t sub_226C0EA08(uint64_t a1)
{
  return MEMORY[0x270FA1E40](a1, *v1);
}

uint64_t sub_226C0EA34()
{
  return sub_226C33DB8();
}

uint64_t CUKeyPathModifiable.set<A>(_:_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (void *)MEMORY[0x263F8DE50];
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v7 + 16))((char *)&v9 - v6);
  swift_setAtWritableKeyPath();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v4 + *v5) - 8) + 32))(a2, v2);
}

uint64_t CUKeyPathModifiable.setIfNonNil<A>(_:_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)MEMORY[0x263F8DE50];
  uint64_t v7 = *(void *)(*MEMORY[0x263F8DE50] + *a1 + 8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = *(void (**)(char *))(v8 + 16);
  uint64_t v22 = v14;
  v12((char *)&v21 - v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156CB0);
  if (swift_dynamicCast())
  {
    sub_226C083B4(v23, (uint64_t)v25);
    uint64_t v21 = v5;
    uint64_t v15 = v26;
    uint64_t v16 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    long long v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8);
    uint64_t v18 = v15;
    uint64_t v3 = v2;
    uint64_t v5 = v21;
    uint64_t v19 = v16;
    uint64_t v6 = (void *)MEMORY[0x263F8DE50];
    if (v17(v18, v19))
    {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v5 + *v6) - 8) + 32))(a2, v2);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  }
  else
  {
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
    sub_226C088D0((uint64_t)v23, &qword_268156CB8);
  }
  ((void (*)(char *, uint64_t, uint64_t))v12)(v11, v22, v7);
  swift_setAtWritableKeyPath();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v5 + *v6) - 8) + 32))(a2, v3);
}

Swift::String __swiftcall CULocalizedString(environment:bundle:bundleID:table:key:localizations:lookupPreferredLocalizations:)(CoreUtilsSwift::CUEnvironmentValues environment, NSBundle_optional bundle, Swift::String_optional bundleID, Swift::String_optional table, Swift::String key, Swift::OpaquePointer_optional localizations, Swift::Bool lookupPreferredLocalizations)
{
  uint64_t countAndFlagsBits = key._countAndFlagsBits;
  object = bundleID.value._object;
  v76 = table.value._object;
  uint64_t v7 = table.value._countAndFlagsBits;
  uint64_t v8 = bundleID.value._countAndFlagsBits;
  Class isa = bundle.value.super.isa;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CC0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_226C335B8();
  uint64_t v72 = *(void *)(v14 - 8);
  uint64_t v73 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  long long v17 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v71 = (char *)&v70 - v18;
  uint64_t v19 = *(void *)environment._values._rawValue;
  if (isa)
  {
    Class v77 = isa;
LABEL_3:
    if (key._object)
    {
      uint64_t v20 = v7;
      uint64_t v21 = isa;
      goto LABEL_9;
    }
    uint64_t v47 = isa;
    goto LABEL_20;
  }
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_226C33988();
    swift_bridgeObjectRelease();
    BOOL v23 = (objc_class *)objc_msgSend(self, sel_bundleWithIdentifier_, v22);

    Class v77 = v23;
    if (v23) {
      goto LABEL_3;
    }
  }
  Class v77 = (Class)objc_msgSend(self, sel_mainBundle);
  if (key._object)
  {
    uint64_t v20 = v7;
    goto LABEL_9;
  }
LABEL_20:
  if (((uint64_t)localizations.value._rawValue & 1) == 0)
  {
    uint64_t v39 = countAndFlagsBits;
    goto LABEL_43;
  }
  uint64_t v48 = (__CFString *)sub_226C33988();
  CFStringRef v49 = (const __CFString *)*MEMORY[0x263EFFE48];
  uint64_t v50 = (__CFString *)sub_226C33988();
  CFPropertyListRef v51 = CFPreferencesCopyValue(v48, v49, v50, (CFStringRef)*MEMORY[0x263EFFE50]);

  if (v51
    && (v81[0] = v51, __swift_instantiateConcreteTypeFromMangledName(&qword_268156CC8),
                      swift_dynamicCast()))
  {
    uint64_t v20 = v7;
  }
  else
  {
    uint64_t v20 = v7;
    sub_226C33678();
  }
LABEL_9:
  uint64_t v24 = v19;
  swift_bridgeObjectRetain();
  id v25 = [(objc_class *)v77 localizations];
  if (!v25)
  {
    sub_226C33B28();
    id v25 = (id)sub_226C33B08();
    swift_bridgeObjectRelease();
  }
  uint64_t v26 = self;
  uint64_t v27 = (void *)sub_226C33B08();
  swift_bridgeObjectRelease();
  id v28 = objc_msgSend(v26, sel_preferredLocalizationsFromArray_forPreferences_, v25, v27);

  uint64_t v29 = sub_226C33B28();
  if (!*(void *)(v29 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v39 = countAndFlagsBits;
    uint64_t v19 = v24;
    uint64_t v7 = v20;
    goto LABEL_43;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v30 = (void *)sub_226C33988();
  swift_bridgeObjectRelease();
  uint64_t v31 = (void *)sub_226C33988();
  uint64_t v32 = (void *)sub_226C33988();
  uint64_t v33 = (void *)sub_226C33988();
  swift_bridgeObjectRelease();
  id v34 = [(objc_class *)v77 URLForResource:v30 withExtension:v31 subdirectory:v32 localization:v33];

  if (!v34)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v72 + 56))(v13, 1, 1, v73);
    uint64_t v39 = countAndFlagsBits;
    uint64_t v19 = v24;
    goto LABEL_25;
  }
  sub_226C335A8();

  uint64_t v36 = v72;
  uint64_t v35 = v73;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v72 + 32);
  v37(v13, v17, v73);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v13, 0, 1, v35);
  int v38 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48))(v13, 1, v35);
  uint64_t v39 = countAndFlagsBits;
  uint64_t v19 = v24;
  if (v38 == 1)
  {
LABEL_25:
    sub_226C088D0((uint64_t)v13, &qword_268156CC0);
    uint64_t v7 = v20;
    goto LABEL_43;
  }
  uint64_t v40 = v71;
  v37(v71, v13, v35);
  uint64_t v41 = v40;
  id v42 = objc_allocWithZone(NSDictionary);
  uint64_t v43 = (void *)sub_226C33598();
  id v44 = objc_msgSend(v42, sel_initWithContentsOfURL_, v43);

  uint64_t v7 = v20;
  if (v44)
  {
    v81[0] = v19;
    if (CUEnvironmentValues.greenTea.getter())
    {
      *(void *)&long long v79 = 5523295;
      *((void *)&v79 + 1) = 0xE300000000000000;
      *(void *)&long long v78 = v76;
      *((void *)&v78 + 1) = v39;
      swift_bridgeObjectRetain();
      *(void *)&long long v78 = sub_226C33AC8();
      *((void *)&v78 + 1) = v45;
      sub_226C33A08();
      long long v79 = v78;
      swift_bridgeObjectRetain();
      id v46 = objc_msgSend(v44, sel___swift_objectForKeyedSubscript_, sub_226C34288());
      swift_unknownObjectRelease();
      if (v46)
      {
        sub_226C33EB8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v79 = 0u;
        long long v80 = 0u;
      }
      sub_226C1D004((uint64_t)&v79, (uint64_t)v81);
      uint64_t v41 = v71;
      if (v82)
      {
        if (swift_dynamicCast())
        {

          uint64_t v53 = (void *)*((void *)&v78 + 1);
          uint64_t v52 = v78;
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v41, v73);
          goto LABEL_55;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_226C088D0((uint64_t)v81, &qword_268156BA8);
      }
    }
    *(void *)&long long v79 = v76;
    *((void *)&v79 + 1) = v39;
    swift_bridgeObjectRetain_n();
    id v54 = objc_msgSend(v44, sel___swift_objectForKeyedSubscript_, sub_226C34288());
    swift_unknownObjectRelease();
    if (v54)
    {
      sub_226C33EB8();
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v36 + 8))(v41, v73);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v36 + 8))(v41, v73);

      long long v79 = 0u;
      long long v80 = 0u;
    }
    sub_226C1D004((uint64_t)&v79, (uint64_t)v81);
    if (v82)
    {
      if (swift_dynamicCast())
      {

        uint64_t v53 = (void *)*((void *)&v78 + 1);
        uint64_t v52 = v78;
        swift_bridgeObjectRelease();
        goto LABEL_55;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_226C088D0((uint64_t)v81, &qword_268156BA8);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v36 + 8))(v41, v35);
  }
LABEL_43:
  v81[0] = v19;
  if (CUEnvironmentValues.greenTea.getter())
  {
    v81[0] = 5523295;
    v81[1] = 0xE300000000000000;
    *(void *)&long long v79 = v76;
    *((void *)&v79 + 1) = v39;
    swift_bridgeObjectRetain();
    *(void *)&long long v79 = sub_226C33AC8();
    *((void *)&v79 + 1) = v55;
    sub_226C33A08();
    long long v56 = v79;
    v57 = (void *)sub_226C33988();
    if (v7) {
      uint64_t v58 = (void *)sub_226C33988();
    }
    else {
      uint64_t v58 = 0;
    }
    id v59 = [(objc_class *)v77 localizedStringForKey:v57 value:0 table:v58];

    uint64_t v52 = sub_226C33998();
    uint64_t v53 = v60;

    if (__PAIR128__((unint64_t)v53, v52) == v56)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v61 = sub_226C34208();
      swift_bridgeObjectRelease();
      if ((v61 & 1) == 0)
      {

        goto LABEL_55;
      }
    }
    swift_bridgeObjectRelease();
  }
  v62 = (void *)sub_226C33988();
  if (v7) {
    v63 = (void *)sub_226C33988();
  }
  else {
    v63 = 0;
  }
  Class v64 = v77;
  id v65 = [(objc_class *)v77 localizedStringForKey:v62 value:0 table:v63];

  uint64_t v52 = sub_226C33998();
  uint64_t v53 = v66;

LABEL_55:
  uint64_t v67 = v52;
  int v68 = v53;
  result._object = v68;
  result._uint64_t countAndFlagsBits = v67;
  return result;
}

uint64_t CUTask.task.getter()
{
  return swift_retain();
}

uint64_t CUTask.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t CUTask.init(_:)(uint64_t a1)
{
  *(unsigned char *)(v1 + 16) = 1;
  *(void *)(v1 + 24) = a1;
  return v1;
}

uint64_t CUTask.__allocating_init(_:cancelOnDeinit:)(uint64_t a1, char a2)
{
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = a2;
  *(void *)(result + 24) = a1;
  return result;
}

uint64_t CUTask.init(_:cancelOnDeinit:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = a1;
  return v2;
}

uint64_t CUTask.deinit()
{
  if (*(unsigned char *)(v0 + 16) == 1) {
    sub_226C33C18();
  }
  swift_release();
  return v0;
}

uint64_t CUTask.__deallocating_deinit()
{
  CUTask.deinit();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall CUTask.cancel()()
{
}

uint64_t CUTask<>.init(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226C0FD8C(a1, a2, a3, (uint64_t)&unk_26DAC5628, (uint64_t)&unk_268156CE0, (uint64_t (*)(char *, uint64_t, void *))sub_226C0FAD4);
}

{
  return sub_226C0FD8C(a1, a2, a3, (uint64_t)&unk_26DAC5650, (uint64_t)&unk_268156CF0, (uint64_t (*)(char *, uint64_t, void *))sub_226C0FEA0);
}

uint64_t sub_226C0F9F8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_226C02D20;
  return v8(a1);
}

uint64_t sub_226C0FAD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_226C33C08();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) != 1)
  {
    sub_226C33BF8();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_226C088D0(a1, &qword_268156CD0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_226C33B48();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a2;
  v10[4] = a3;
  return swift_task_create();
}

uint64_t _s14CoreUtilsSwift6CUTaskCAAs5NeverORs_rlE8priority14cancelOnDeinit9operationACyxAEGScPSg_SbxyYaYbYActcfC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CD0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C1FC98(a1, (uint64_t)v10, &qword_268156CD0);
  uint64_t v11 = sub_226C0FAD4((uint64_t)v10, a3, a4, *(void *)(v4 + 80));
  sub_226C088D0(a1, &qword_268156CD0);
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = v11;
  return result;
}

uint64_t sub_226C0FD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(char *, uint64_t, void *))
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CD0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C1FC98(a1, (uint64_t)v14, &qword_268156CD0);
  uint64_t v15 = (void *)swift_allocObject();
  _OWORD v15[2] = 0;
  v15[3] = 0;
  v15[4] = *(void *)(v6 + 80);
  v15[5] = a2;
  v15[6] = a3;
  uint64_t v16 = a6(v14, a5, v15);
  sub_226C088D0(a1, &qword_268156CD0);
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = v16;
  return result;
}

uint64_t sub_226C0FEA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_226C33C08();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_226C33BF8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_226C088D0(a1, &qword_268156CD0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_226C33B48();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t _s14CoreUtilsSwift6CUTaskCAAs5Error_pRs_rlE8priority14cancelOnDeinit9operationACyxsAD_pGScPSg_SbxyYaYbKYActcfC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CD0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C1FC98(a1, (uint64_t)v10, &qword_268156CD0);
  uint64_t v11 = sub_226C0FEA0((uint64_t)v10, a3, a4);
  sub_226C088D0(a1, &qword_268156CD0);
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = a2;
  *(void *)(result + 24) = v11;
  return result;
}

uint64_t Task.cuTask.getter(uint64_t a1)
{
  type metadata accessor for CUTask();
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(v2 + 24) = a1;
  swift_retain();
  return v2;
}

id CUTrafficFlags.description.getter()
{
  id result = CUTrafficFlagsToString();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = sub_226C33998();

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_226C101A8()
{
  id result = CUTrafficFlagsToString();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = sub_226C33998();

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t BidirectionalCollection<>.suffix(afterLastOf:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v23[1] = a1;
  long long v23[2] = a3;
  uint64_t v25 = a4;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v24 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[3] = *(void *)(v8 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v23[0] = sub_226C33DD8();
  uint64_t v10 = *(void *)(v23[0] - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v23[0]);
  uint64_t v13 = (char *)v23 - v12;
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v11);
  long long v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v23 - v18;
  sub_226C33918();
  uint64_t v20 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, void))(v10 + 8))(v13, v23[0]);
    (*v20)(v24, v4, a2);
    sub_226C33C98();
    sub_226C33D08();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, AssociatedTypeWitness);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v13, AssociatedTypeWitness);
    (*v20)(v24, v4, a2);
    sub_226C33CB8();
    sub_226C33D08();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v14 + 8);
    v22(v17, AssociatedTypeWitness);
    return ((uint64_t (*)(char *, uint64_t))v22)(v19, AssociatedTypeWitness);
  }
}

uint64_t BinaryFloatingPoint.map(from:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v20[2] = a2;
  v20[3] = a4;
  uint64_t v5 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v20 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)v20 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v20 - v15;
  v20[1] = *(void *)(*(void *)(*(void *)(v17 + 16) + 16) + 8);
  sub_226C340B8();
  sub_226C33968();
  sub_226C340B8();
  sub_226C33898();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v8, a3);
  v18(v11, a3);
  sub_226C340B8();
  sub_226C33C58();
  v18(v11, a3);
  v18(v14, a3);
  sub_226C340A8();
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, a3);
}

uint64_t Collection.penultimate()@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v18[-v7];
  if (sub_226C33CA8() >= 2)
  {
    sub_226C33CF8();
    sub_226C33CD8();
    uint64_t v12 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
    v12(v6, AssociatedTypeWitness);
    uint64_t v13 = (void (*)(unsigned char *, void))sub_226C33D18();
    uint64_t v15 = v14;
    uint64_t v16 = swift_getAssociatedTypeWitness();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, v15, v16);
    v13(v18, 0);
    v12(v8, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
  }
  else
  {
    uint64_t v9 = swift_getAssociatedTypeWitness();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    return v10(a1, 1, 1, v9);
  }
}

uint64_t Collection.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_226C33DD8();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v7);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v35 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v40 = (char *)&v35 - v19;
  if (a1 < 0)
  {
    uint64_t v21 = swift_getAssociatedTypeWitness();
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
    return v22(a2, 1, 1, v21);
  }
  else
  {
    uint64_t v36 = v18;
    uint64_t v37 = v17;
    uint64_t v39 = a2;
    sub_226C33C98();
    sub_226C33CF8();
    uint64_t v38 = v2;
    sub_226C33CC8();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20(v13, AssociatedTypeWitness);
    v20(v16, AssociatedTypeWitness);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, AssociatedTypeWitness) == 1)
    {
      (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v37);
    }
    else
    {
      uint64_t v24 = v40;
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v40, v9, AssociatedTypeWitness);
      sub_226C33CF8();
      swift_getAssociatedConformanceWitness();
      uint64_t v25 = v20;
      char v26 = sub_226C33938();
      v25(v16, AssociatedTypeWitness);
      if (v26)
      {
        uint64_t v27 = v25;
        id v28 = (void (*)(char *, void))sub_226C33D18();
        uint64_t v30 = v29;
        uint64_t v31 = swift_getAssociatedTypeWitness();
        uint64_t v32 = *(void *)(v31 - 8);
        uint64_t v33 = v39;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v39, v30, v31);
        v28(v41, 0);
        v27(v24, AssociatedTypeWitness);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v33, 0, 1, v31);
      }
      v25(v24, AssociatedTypeWitness);
    }
    uint64_t v34 = swift_getAssociatedTypeWitness();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v39, 1, 1, v34);
  }
}

uint64_t Collection.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v48 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = sub_226C33DD8();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v42 - v12;
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v42 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  BOOL v23 = (char *)&v42 - v22;
  uint64_t v47 = (void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  uint64_t v44 = v19;
  uint64_t v45 = a4;
  if (a1 < 0)
  {
    char v26 = v21;
    uint64_t v43 = v20;
    sub_226C33C98();
    sub_226C33CC8();
    uint64_t v27 = *v47;
    (*v47)(v18, AssociatedTypeWitness);
    if ((*v24)(v10, 1, AssociatedTypeWitness) == 1)
    {
      v26[1](v10, v44);
      goto LABEL_13;
    }
    uint64_t v35 = v43;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v43, v10, AssociatedTypeWitness);
    sub_226C33C98();
    swift_getAssociatedConformanceWitness();
    char v36 = sub_226C33948();
    v27(v18, AssociatedTypeWitness);
    if ((v36 & 1) == 0)
    {
      v27(v35, AssociatedTypeWitness);
      goto LABEL_13;
    }
    uint64_t v37 = (void (*)(unsigned char *, void))sub_226C33D18();
    uint64_t v39 = v38;
    uint64_t v32 = swift_getAssociatedTypeWitness();
    uint64_t v33 = *(void *)(v32 - 8);
    uint64_t v34 = v45;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v45, v39, v32);
    v37(v49, 0);
    v27(v35, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56))(v34, 0, 1, v32);
  }
  uint64_t v43 = (char *)v21;
  sub_226C33CF8();
  sub_226C33CC8();
  uint64_t v25 = *v47;
  (*v47)(v18, AssociatedTypeWitness);
  if ((*v24)(v13, 1, AssociatedTypeWitness) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v23, v13, AssociatedTypeWitness);
    sub_226C33CF8();
    swift_getAssociatedConformanceWitness();
    char v28 = sub_226C33938();
    v25(v18, AssociatedTypeWitness);
    if ((v28 & 1) == 0)
    {
      v25(v23, AssociatedTypeWitness);
      goto LABEL_13;
    }
    uint64_t v29 = (void (*)(unsigned char *, void))sub_226C33D18();
    uint64_t v31 = v30;
    uint64_t v32 = swift_getAssociatedTypeWitness();
    uint64_t v33 = *(void *)(v32 - 8);
    uint64_t v34 = v45;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v45, v31, v32);
    v29(v49, 0);
    v25(v23, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56))(v34, 0, 1, v32);
  }
  (*((void (**)(char *, uint64_t))v43 + 1))(v13, v44);
LABEL_13:
  uint64_t v41 = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v45, 1, 1, v41);
}

uint64_t Comparable.clamped(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C33968();
  sub_226C342A8();
  sub_226C34298();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, a2);
}

uint64_t Comparable.clamped(to:)()
{
  return sub_226C34298();
}

{
  return sub_226C342A8();
}

uint64_t CUIPAddress.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CF8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v41 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226C337E8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  uint64_t v38 = v6;
  MEMORY[0x270FA5388](v5);
  char v36 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156D00);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_226C337A8();
  uint64_t v40 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for CUIPAddress();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v17 = v45;
  sub_226C343A8();
  if (!v17)
  {
    uint64_t v34 = v13;
    uint64_t v35 = v16;
    uint64_t v45 = v14;
    uint64_t v19 = v41;
    __swift_project_boxed_opaque_existential_1(&v42, v44);
    sub_226C34228();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v42);
    uint64_t v18 = (uint64_t)a1;
    swift_bridgeObjectRetain();
    sub_226C337C8();
    uint64_t v20 = v40;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v10, 1, v11) == 1)
    {
      sub_226C088D0((uint64_t)v10, &qword_268156D00);
      swift_bridgeObjectRetain();
      uint64_t v21 = (uint64_t)v19;
      sub_226C33808();
      uint64_t v22 = v37;
      uint64_t v23 = v38;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v21, 1, v37) == 1)
      {
        sub_226C088D0(v21, &qword_268156CF8);
        uint64_t v24 = sub_226C33F88();
        swift_allocError();
        uint64_t v26 = v25;
        __swift_project_boxed_opaque_existential_1(a1, a1[3]);
        sub_226C34398();
        unint64_t v42 = 0;
        unint64_t v43 = 0xE000000000000000;
        sub_226C33F48();
        swift_bridgeObjectRelease();
        unint64_t v42 = 0xD00000000000001ALL;
        unint64_t v43 = 0x8000000226C38FA0;
        sub_226C33A28();
        swift_bridgeObjectRelease();
        sub_226C33F78();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCB8], v24);
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1Tm(v18);
      }
      swift_bridgeObjectRelease();
      uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 32);
      uint64_t v31 = v36;
      v30(v36, v21, v22);
      uint64_t v29 = (uint64_t)v35;
      v30(v35, (uint64_t)v31, v22);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
      char v28 = v34;
      v27(v34, v10, v11);
      uint64_t v29 = (uint64_t)v35;
      v27(v35, v28, v11);
    }
    swift_storeEnumTagMultiPayload();
    sub_226C1D30C(v29, v39);
    return __swift_destroy_boxed_opaque_existential_1Tm(v18);
  }
  uint64_t v18 = (uint64_t)a1;
  return __swift_destroy_boxed_opaque_existential_1Tm(v18);
}

uint64_t CUIPAddress.encode(to:)(void *a1)
{
  uint64_t v2 = sub_226C337E8();
  uint64_t v23 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v22 = (char *)&v21 - v6;
  uint64_t v7 = sub_226C337A8();
  uint64_t v21 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = type metadata accessor for CUIPAddress();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C343D8();
  sub_226C1D370(v25, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = v22;
    uint64_t v16 = v23;
    uint64_t v18 = v24;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v22, v15, v24);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v5, v17, v18);
    sub_226C339A8();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    sub_226C34248();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v18);
  }
  else
  {
    uint64_t v19 = v21;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v12, v15, v7);
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v10, v12, v7);
    sub_226C339A8();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    sub_226C34248();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v7);
  }
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
}

uint64_t CUIPAddress.init(_:)@<X0>(char *a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CF8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_226C337E8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156D00);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_226C337A8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_226C337C8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    uint64_t v15 = v32;
    sub_226C088D0((uint64_t)v10, &qword_268156D00);
    swift_bridgeObjectRetain();
    sub_226C33808();
    uint64_t v17 = v28;
    uint64_t v16 = v29;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v3, 1, v28) == 1)
    {
      sub_226C088D0((uint64_t)v3, &qword_268156CF8);
      sub_226C33998();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156D08);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_226C367F0;
      *(void *)(inited + 32) = 0x4D726F7272457563;
      *(void *)(inited + 40) = 0xEA00000000006773;
      unint64_t v30 = 0;
      unint64_t v31 = 0xE000000000000000;
      sub_226C33F48();
      swift_bridgeObjectRelease();
      unint64_t v30 = 0xD00000000000001ALL;
      unint64_t v31 = 0x8000000226C38FA0;
      sub_226C33A28();
      swift_bridgeObjectRelease();
      unint64_t v19 = v30;
      unint64_t v20 = v31;
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = v19;
      *(void *)(inited + 56) = v20;
      sub_226C0D4B8(inited);
      id v21 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v22 = (void *)sub_226C33988();
      swift_bridgeObjectRelease();
      uint64_t v23 = (void *)sub_226C33878();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_initWithDomain_code_userInfo_, v22, -6705, v23);

      return swift_willThrow();
    }
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v26(v7, v3, v17);
    v26(v15, v7, v17);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v25(v14, v10, v11);
    v25(v32, v14, v11);
  }
  type metadata accessor for CUIPAddress();
  return swift_storeEnumTagMultiPayload();
}

uint64_t CUIPAddress.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_226C337E8();
  uint64_t v22 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v21 - v6;
  uint64_t v8 = sub_226C337A8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v21 - v13;
  uint64_t v15 = type metadata accessor for CUIPAddress();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C1D370(v1, (uint64_t)v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = v22;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v7, v17, v2);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v5, v7, v2);
    uint64_t v19 = sub_226C339A8();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v17, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    uint64_t v19 = sub_226C339A8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  return v19;
}

uint64_t CUIPAddress.nwEndpointHost.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CUIPAddress();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C1D370(v2, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_226C337E8();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, v6, v7);
    uint64_t v8 = (unsigned int *)MEMORY[0x263F140F8];
  }
  else
  {
    uint64_t v9 = sub_226C337A8();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, v6, v9);
    uint64_t v8 = (unsigned int *)MEMORY[0x263F140F0];
  }
  uint64_t v10 = *v8;
  uint64_t v11 = sub_226C33728();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(a1, v10, v11);
}

uint64_t CUIPAddress.hash(into:)()
{
  uint64_t v1 = sub_226C337E8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226C337A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CUIPAddress();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C1D370(v0, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v11, v1);
    sub_226C34368();
    sub_226C1DAF0(&qword_268156D10, 255, MEMORY[0x263F14180]);
    sub_226C338B8();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    sub_226C34368();
    sub_226C1DAF0(&qword_268156D18, 255, MEMORY[0x263F14170]);
    sub_226C338B8();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t CUIPAddress.hashValue.getter()
{
  return sub_226C34388();
}

uint64_t sub_226C12AC0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CUIPAddress.init(from:)(a1, a2);
}

uint64_t sub_226C12AD8(void *a1)
{
  return CUIPAddress.encode(to:)(a1);
}

uint64_t sub_226C12AF8()
{
  return sub_226C34388();
}

uint64_t sub_226C12B3C()
{
  return sub_226C34388();
}

unint64_t CUMACAddress.elements.getter()
{
  return *v0 | ((unint64_t)*(unsigned int *)(v0 + 1) << 16);
}

uint64_t CUMACAddress.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16) == 6)
  {
    __int16 v3 = *(_WORD *)(a1 + 36);
    int v4 = *(_DWORD *)(a1 + 32);
    uint64_t result = swift_bridgeObjectRelease();
    *(_DWORD *)a2 = v4;
    *(_WORD *)(a2 + 4) = v3;
  }
  else
  {
    sub_226C33998();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156D08);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_226C367F0;
    *(void *)(inited + 32) = 0x4D726F7272457563;
    *(void *)(inited + 40) = 0xEA00000000006773;
    sub_226C33F48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_226C341B8();
    sub_226C33A28();
    swift_bridgeObjectRelease();
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = 0xD00000000000001ALL;
    *(void *)(inited + 56) = 0x8000000226C38FC0;
    sub_226C0D4B8(inited);
    id v7 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v8 = (void *)sub_226C33988();
    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)sub_226C33878();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_initWithDomain_code_userInfo_, v8, -6705, v9);

    return swift_willThrow();
  }
  return result;
}

uint64_t CUMACAddress.init(_:)@<X0>(uint64_t a1@<X8>)
{
  sub_226C1D3D4();
  uint64_t v2 = MEMORY[0x263F8D310];
  uint64_t v3 = StringProtocol.parseHex()(MEMORY[0x263F8D310]);
  if (*(void *)(v3 + 16) != 6)
  {
    swift_bridgeObjectRelease();
    sub_226C33998();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156D08);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_226C367F0;
    *(void *)(inited + 32) = 0x4D726F7272457563;
    *(void *)(inited + 40) = 0xEA00000000006773;
    sub_226C33F48();
    swift_bridgeObjectRelease();
    sub_226C33A28();
    swift_bridgeObjectRelease();
    *(void *)(inited + 72) = v2;
    *(void *)(inited + 48) = 0xD00000000000001CLL;
    *(void *)(inited + 56) = 0x8000000226C38FE0;
    sub_226C0D4B8(inited);
    id v12 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v13 = (void *)sub_226C33988();
    swift_bridgeObjectRelease();
    uint64_t v14 = (void *)sub_226C33878();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_initWithDomain_code_userInfo_, v13, -6705, v14);

    return swift_willThrow();
  }
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v5 = *(void *)(v3 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v5 == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v5 < 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v5 == 3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v5 >= 5)
  {
    if (v5 != 5)
    {
      char v6 = *(unsigned char *)(v3 + 32);
      char v7 = *(unsigned char *)(v3 + 33);
      char v8 = *(unsigned char *)(v3 + 34);
      char v9 = *(unsigned char *)(v3 + 35);
      __int16 v10 = *(_WORD *)(v3 + 36);
      uint64_t result = swift_bridgeObjectRelease();
      *(unsigned char *)a1 = v6;
      *(unsigned char *)(a1 + 1) = v7;
      *(unsigned char *)(a1 + 2) = v8;
      *(unsigned char *)(a1 + 3) = v9;
      *(_WORD *)(a1 + 4) = v10;
      return result;
    }
    goto LABEL_15;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t CUMACAddress.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C343A8();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    sub_226C34228();
    CUMACAddress.init(_:)((uint64_t)&v8);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    __int16 v5 = v9;
    *(_DWORD *)a2 = v8;
    *(_WORD *)(a2 + 4) = v5;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t CUMACAddress.encode(to:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C343D8();
  CUMACAddress.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_226C34248();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t CUMACAddress.description.getter()
{
  __int16 v1 = *(_WORD *)(v0 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CEF8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_226C36800;
  *(_DWORD *)(v2 + 32) = *(_DWORD *)v0;
  *(_WORD *)(v2 + 36) = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156D28);
  sub_226C1D694(&qword_268156D30, &qword_268156D28);
  char v4 = sub_226C223B8();
  uint64_t v5 = sub_226C22B14();
  uint64_t v6 = sub_226C22B1C();
  uint64_t v8 = Sequence<>.hexString(separator:uppercase:maxBytes:truncator:)(58, 0xE100000000000000, v4 & 1, v5, v6, v7, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

double CUMACAddress.bytes.getter()
{
  __int16 v1 = *(_WORD *)(v0 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CEF8);
  uint64_t v2 = swift_allocObject();
  *(void *)&double result = 6;
  *(_OWORD *)(v2 + 16) = xmmword_226C36800;
  *(_DWORD *)(v2 + 32) = *(_DWORD *)v0;
  *(_WORD *)(v2 + 36) = v1;
  return result;
}

Swift::String __swiftcall CUMACAddress.description(separator:uppercase:)(Swift::String separator, Swift::Bool uppercase)
{
  object = separator._object;
  uint64_t countAndFlagsBits = separator._countAndFlagsBits;
  __int16 v6 = *(_WORD *)(v2 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CEF8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_226C36800;
  *(_DWORD *)(v7 + 32) = *(_DWORD *)v2;
  *(_WORD *)(v7 + 36) = v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156D28);
  sub_226C1D694(&qword_268156D30, &qword_268156D28);
  uint64_t v9 = sub_226C22B14();
  uint64_t v10 = sub_226C22B1C();
  uint64_t v12 = Sequence<>.hexString(separator:uppercase:maxBytes:truncator:)(countAndFlagsBits, (uint64_t)object, uppercase, v9, v10, v11, v8);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = v12;
  uint64_t v16 = v14;
  result._object = v16;
  result._uint64_t countAndFlagsBits = v15;
  return result;
}

uint64_t CUMACAddress.hash(into:)()
{
  return sub_226C34378();
}

uint64_t CUMACAddress.hashValue.getter()
{
  return sub_226C34388();
}

uint64_t sub_226C13524@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CUMACAddress.init(from:)(a1, a2);
}

uint64_t sub_226C1353C(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C343D8();
  CUMACAddress.description.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_226C34248();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t sub_226C13608()
{
  return sub_226C34388();
}

uint64_t sub_226C136B8()
{
  return sub_226C34378();
}

uint64_t sub_226C13738()
{
  return sub_226C34388();
}

uint64_t CUSendableWrapper.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t CUSendableWrapper.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t sub_226C13850@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for CUWeakBox();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  uint64_t v6 = MEMORY[0x22A665E50](v8);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  *a2 = v6;
  return result;
}

uint64_t sub_226C1390C()
{
  return swift_unknownObjectWeakAssign();
}

void CUWeakBox.item.getter()
{
}

uint64_t CUWeakBox.item.setter()
{
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*CUWeakBox.item.modify(void *a1))()
{
  a1[1] = v1;
  *a1 = MEMORY[0x22A665E50](v1);
  return sub_226C139B0;
}

uint64_t sub_226C139B0()
{
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t CUWeakBox.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(a2 + 8) = a1;
  return result;
}

BOOL static CUWeakBox.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8) == *(void *)(a2 + 8);
}

uint64_t CUWeakBox.hash(into:)()
{
  return sub_226C34368();
}

uint64_t CUWeakBox.hashValue.getter()
{
  return sub_226C34388();
}

uint64_t sub_226C13AC4()
{
  return sub_226C34388();
}

uint64_t Actor.cuWithIsolation<A>(_:)(uint64_t a1, int *a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_226C01AFC;
  return v7(a1, v2);
}

uint64_t Data.init(xpcObject:)(void *a1)
{
  uint64_t v2 = MEMORY[0x22A665F10]();
  if (v2 == sub_226C33718())
  {
    int64_t length = xpc_data_get_length(a1);
    if (length < 1)
    {
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t v2 = length;
    bytes_ptr = xpc_data_get_bytes_ptr(a1);
    if (bytes_ptr)
    {
      uint64_t v2 = sub_226C1D4EC(bytes_ptr, v2);
      swift_unknownObjectRelease();
      return v2;
    }
    type metadata accessor for CUError();
    uint64_t v3 = sub_226C33998();
    uint64_t v6 = 0x8000000226C39030;
    uint64_t v7 = -6700;
    uint64_t v5 = 0xD000000000000020;
  }
  else
  {
    type metadata accessor for CUError();
    uint64_t v3 = sub_226C33998();
    uint64_t v5 = 0xD000000000000022;
    uint64_t v6 = 0x8000000226C39000;
    uint64_t v7 = -6705;
  }
  CUError.__allocating_init(domain:code:message:underlying:)(v3, v4, v7, v5, v6, 0);
  swift_willThrow();
  swift_unknownObjectRelease();
  return v2;
}

xpc_object_t Data.xpcObjectRepresentation.getter(uint64_t a1, unint64_t a2)
{
  bytes[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (a1 >> 32) - (int)a1;
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_226C1D5A0(a1, a2);
      uint64_t v6 = (char *)sub_226C33528();
      if (v6)
      {
        uint64_t v7 = sub_226C33548();
        if (!__OFSUB__((int)a1, v7))
        {
          v6 += (int)a1 - v7;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v8 = sub_226C33538();
      if (v8 >= v5) {
        uint64_t v9 = (a1 >> 32) - (int)a1;
      }
      else {
        uint64_t v9 = v8;
      }
      if (v6) {
        size_t v10 = v9;
      }
      else {
        size_t v10 = 0;
      }
      xpc_object_t v11 = xpc_data_create(v6, v10);
      sub_226C1D5F8(a1, a2);
      return v11;
    case 2uLL:
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v14 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      uint64_t v15 = (char *)sub_226C33528();
      if (!v15) {
        goto LABEL_17;
      }
      uint64_t v16 = sub_226C33548();
      if (__OFSUB__(v13, v16)) {
        goto LABEL_30;
      }
      v15 += v13 - v16;
LABEL_17:
      BOOL v17 = __OFSUB__(v14, v13);
      uint64_t v18 = v14 - v13;
      if (v17) {
        goto LABEL_29;
      }
      uint64_t v19 = sub_226C33538();
      if (v19 >= v18) {
        size_t v20 = v18;
      }
      else {
        size_t v20 = v19;
      }
      if (v15) {
        size_t v21 = v20;
      }
      else {
        size_t v21 = 0;
      }
      xpc_object_t v22 = xpc_data_create(v15, v21);
      swift_release();
      swift_release();
      return v22;
    case 3uLL:
      memset(bytes, 0, 14);
      size_t v4 = 0;
      return xpc_data_create(bytes, v4);
    default:
      bytes[0] = a1;
      LOWORD(bytes[1]) = a2;
      BYTE2(bytes[1]) = BYTE2(a2);
      BYTE3(bytes[1]) = BYTE3(a2);
      BYTE4(bytes[1]) = BYTE4(a2);
      size_t v4 = BYTE6(a2);
      BYTE5(bytes[1]) = BYTE5(a2);
      return xpc_data_create(bytes, v4);
  }
}

uint64_t OS_dispatch_queue.serialDispatchQueue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_226C33D48();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_226C33D88();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_226C33858();
  MEMORY[0x270FA5388](v7 - 8);
  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = v1;
  }
  else
  {
    _OWORD v15[2] = sub_226C1D9FC(0, (unint64_t *)&qword_268156C68);
    uint64_t v11 = sub_226C33D78();
    v15[0] = v12;
    v15[1] = v11;
    sub_226C33848();
    v15[3] = MEMORY[0x263F8EE78];
    sub_226C1DAF0(&qword_268156D40, 255, MEMORY[0x263F8F198]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156D48);
    sub_226C1D694(&qword_268156D50, &qword_268156D48);
    sub_226C33ED8();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F138], v2);
    id v13 = v0;
    return sub_226C33D98();
  }
  return v9;
}

uint64_t static OS_dispatch_queue_serial.mainSerialQueue.getter()
{
  uint64_t v0 = sub_226C33D48();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_226C33D88();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_226C33858();
  MEMORY[0x270FA5388](v5 - 8);
  sub_226C33D58();
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (!result)
  {
    v9[2] = sub_226C1D9FC(0, (unint64_t *)&qword_268156C68);
    uint64_t v7 = sub_226C33D78();
    v9[0] = v8;
    v9[1] = v7;
    sub_226C33848();
    v9[3] = MEMORY[0x263F8EE78];
    sub_226C1DAF0(&qword_268156D40, 255, MEMORY[0x263F8F198]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156D48);
    sub_226C1D694(&qword_268156D50, &qword_268156D48);
    sub_226C33ED8();
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F138], v0);
    return sub_226C33D98();
  }
  return result;
}

double Duration.cuSeconds.getter()
{
  double v0 = (double)sub_226C343F8();
  sub_226C343F8();
  return (double)v1 / 1.0e18 + v0;
}

uint64_t FixedWidthInteger.init<A>(bigEndianBytes:offset:end:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v33 = a7;
  uint64_t v37 = a3;
  uint64_t v32 = a8;
  MEMORY[0x270FA5388](a1);
  unint64_t v31 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = *(void *)(*(void *)(*(void *)(v14 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t result = sub_226C34038();
  if ((result & 7) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = result;
    uint64_t v29 = a2;
    uint64_t v18 = v37;
    uint64_t result = sub_226C33C88();
    if (result < v17 / 8)
    {
      sub_226C1D6D8();
      swift_allocError();
      *uint64_t v19 = 3;
      swift_willThrow();
      uint64_t v20 = swift_getAssociatedTypeWitness();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v18, v20);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(a1, a5);
    }
    uint64_t v28 = a1;
    if (!__OFSUB__(v17, 8))
    {
      uint64_t v21 = sub_226C34038();
      uint64_t v34 = 0;
      uint64_t v35 = v21;
      uint64_t v36 = 8;
      swift_getAssociatedConformanceWitness();
      sub_226C34278();
      uint64_t v22 = sub_226C341F8();
      MEMORY[0x270FA5388](v22);
      *(&v28 - 8) = a4;
      *(&v28 - 7) = a5;
      uint64_t v23 = a5;
      uint64_t v24 = v33;
      *(&v28 - 6) = a6;
      *(&v28 - 5) = v24;
      uint64_t v26 = v28;
      uint64_t v25 = v29;
      *(&v28 - 4) = v28;
      *(&v28 - 3) = v25;
      *(&v28 - 2) = v17 - 8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156D58);
      sub_226C1D694(&qword_268156D60, &qword_268156D58);
      sub_226C33AF8();
      uint64_t v27 = swift_getAssociatedTypeWitness();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(v37, v27);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v26, v23);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_226C148A0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v52 = a8;
  uint64_t v53 = a5;
  uint64_t v54 = a3;
  CFPropertyListRef v51 = a2;
  uint64_t v45 = a1;
  uint64_t v12 = *(void *)(*(void *)(a9 + 8) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v44 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v38 - v18;
  uint64_t v20 = *(void *)(a6 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v17);
  uint64_t v23 = (char *)&v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v38 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v41 = (char *)&v38 - v27;
  CFPropertyListRef v51 = (void *)*v51;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v49 = a4;
  unint64_t v42 = v28;
  uint64_t v43 = v14 + 16;
  v28(v19, a4, AssociatedTypeWitness);
  uint64_t v47 = a7;
  uint64_t v48 = v12;
  uint64_t v29 = (void (*)(uint64_t *, void))sub_226C33D18();
  LOBYTE(a4) = *v30;
  v29(v55, 0);
  uint64_t v46 = v14;
  uint64_t v39 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v40 = v19;
  uint64_t v50 = AssociatedTypeWitness;
  v39(v19, AssociatedTypeWitness);
  LOBYTE(v55[0]) = a4;
  sub_226C1F92C();
  uint64_t result = sub_226C33E48();
  if (__OFSUB__(v53, v51))
  {
    __break(1u);
  }
  else
  {
    v55[0] = v53 - (void)v51;
    sub_226C1D7A8();
    sub_226C33E48();
    uint64_t v32 = v41;
    sub_226C34078();
    uint64_t v33 = v49;
    uint64_t v34 = *(void (**)(char *, uint64_t))(v20 + 8);
    v34(v23, a6);
    v34(v26, a6);
    sub_226C33E68();
    v34(v32, a6);
    uint64_t v35 = v44;
    uint64_t v36 = v50;
    v42(v44, v33, v50);
    uint64_t v37 = v40;
    sub_226C33CB8();
    v39(v35, v36);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v46 + 40))(v33, v37, v36);
  }
  return result;
}

uint64_t FixedWidthInteger.init<A>(littleEndianBytes:offset:end:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v23 = a7;
  uint64_t v24 = a3;
  uint64_t v28 = a1;
  uint64_t v21 = a8;
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t result = sub_226C34038();
  if ((result & 7) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = result;
    if (sub_226C33C88() >= result / 8)
    {
      uint64_t v25 = 0;
      uint64_t v26 = v13;
      uint64_t v27 = 8;
      swift_getAssociatedConformanceWitness();
      sub_226C34278();
      uint64_t v16 = sub_226C341F8();
      MEMORY[0x270FA5388](v16);
      *(&v21 - 6) = a4;
      *(&v21 - 5) = a5;
      uint64_t v17 = v22;
      uint64_t v18 = v23;
      *(&v21 - 4) = a6;
      *(&v21 - 3) = v18;
      uint64_t v19 = v28;
      *(&v21 - 2) = v28;
      *(&v21 - 1) = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156D58);
      sub_226C1D694(&qword_268156D60, &qword_268156D58);
      sub_226C33AF8();
      uint64_t v20 = swift_getAssociatedTypeWitness();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v24, v20);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(v19, a5);
    }
    else
    {
      sub_226C1D6D8();
      swift_allocError();
      *uint64_t v14 = 3;
      swift_willThrow();
      uint64_t v15 = swift_getAssociatedTypeWitness();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v24, v15);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(v28, a5);
    }
  }
  return result;
}

uint64_t sub_226C14FF8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v45 = a7;
  uint64_t v9 = a4;
  uint64_t v41 = a4;
  uint64_t v47 = a1;
  uint64_t v48 = *(void *)(*(void *)(a8 + 8) + 8);
  uint64_t v49 = a3;
  uint64_t v40 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v46 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  uint64_t v44 = *(void *)(a5 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v36 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v36 - v24;
  uint64_t v36 = *a2;
  uint64_t v39 = v12;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v42 = v12 + 16;
  uint64_t v43 = v26;
  uint64_t v28 = v27;
  v26(v17, v9, v27);
  uint64_t v37 = v17;
  uint64_t v29 = (void (*)(uint64_t *, void))sub_226C33D18();
  LOBYTE(v9) = *v30;
  v29(v50, 0);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v12 + 8);
  v38(v17, v28);
  LOBYTE(v50[0]) = v9;
  sub_226C1F92C();
  sub_226C33E48();
  v50[0] = v36;
  sub_226C1D7A8();
  sub_226C33E48();
  sub_226C34078();
  unint64_t v31 = *(void (**)(char *, uint64_t))(v44 + 8);
  v31(v20, a5);
  v31(v23, a5);
  sub_226C33E68();
  v31(v25, a5);
  uint64_t v32 = v46;
  uint64_t v33 = v41;
  v43(v46, v41, v28);
  uint64_t v34 = v37;
  sub_226C33CB8();
  v38(v32, v28);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 40))(v33, v34, v28);
}

uint64_t FixedWidthInteger.init<A>(bigEndianBytes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v15 = a5;
  uint64_t v16 = a6;
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t result = sub_226C34038();
  uint64_t v11 = result - 8;
  if (__OFSUB__(result, 8))
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = sub_226C34038();
    uint64_t v19 = 8;
    swift_getAssociatedConformanceWitness();
    sub_226C34278();
    uint64_t v12 = sub_226C341F8();
    MEMORY[0x270FA5388](v12);
    *(&v14 - 6) = a2;
    *(&v14 - 5) = a3;
    uint64_t v13 = v15;
    *(&v14 - 4) = a4;
    *(&v14 - 3) = v13;
    *(&v14 - 2) = v14;
    *(&v14 - 1) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156D58);
    sub_226C1D694(&qword_268156D60, &qword_268156D58);
    return sub_226C33AF8();
  }
  return result;
}

uint64_t sub_226C155E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v24 = a4;
  uint64_t v25 = a7;
  uint64_t v9 = *(void *)(a5 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v23 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v23 - v16;
  uint64_t v19 = *v18;
  sub_226C33DE8();
  if (v29)
  {
    sub_226C1D6D8();
    swift_allocError();
    *uint64_t v20 = 3;
    return swift_willThrow();
  }
  else
  {
    uint64_t v23 = a1;
    char v27 = v28;
    sub_226C1F92C();
    uint64_t result = sub_226C33E48();
    if (__OFSUB__(v24, v19))
    {
      __break(1u);
    }
    else
    {
      uint64_t v26 = v24 - v19;
      sub_226C1D7A8();
      sub_226C33E48();
      sub_226C34078();
      uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
      v22(v12, a5);
      v22(v15, a5);
      sub_226C33E68();
      return ((uint64_t (*)(char *, uint64_t))v22)(v17, a5);
    }
  }
  return result;
}

uint64_t FixedWidthInteger.init<A>(littleEndianBytes:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  sub_226C34038();
  swift_getAssociatedConformanceWitness();
  sub_226C34278();
  sub_226C341F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156D58);
  sub_226C1D694(&qword_268156D60, &qword_268156D58);
  return sub_226C33AF8();
}

uint64_t sub_226C15A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)v20 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v20 - v13;
  uint64_t v16 = *v15;
  sub_226C33DE8();
  if (v23)
  {
    sub_226C1D6D8();
    swift_allocError();
    *uint64_t v17 = 3;
    return swift_willThrow();
  }
  else
  {
    char v21 = v22;
    v20[1] = a1;
    sub_226C1F92C();
    sub_226C33E48();
    v20[3] = v16;
    sub_226C1D7A8();
    sub_226C33E48();
    sub_226C34078();
    uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
    v19(v9, a4);
    v19(v12, a4);
    sub_226C33E68();
    return ((uint64_t (*)(char *, uint64_t))v19)(v14, a4);
  }
}

uint64_t FixedWidthInteger.init<A>(littleEndianBytes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_226C15C9C(a1, a2, a3, a4, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:), a5);
}

uint64_t FixedWidthInteger.init<A>(bigEndianBytes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_226C15C9C(a1, a2, a3, a4, (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:), a5);
}

uint64_t sub_226C15C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(char *, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t a6@<X8>)
{
  uint64_t v20 = a5;
  uint64_t v19 = a4;
  uint64_t v17 = a6;
  uint64_t v18 = a2;
  uint64_t v8 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, a3);
  sub_226C33AE8();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v20(v14, v18, AssociatedTypeWitness, v19, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, AssociatedTypeWitness);
}

char *sub_226C15E94(int a1)
{
  uint64_t v2 = sub_226C1B32C(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  unint64_t v5 = v4 + 1;
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v5;
  v2[v4 + 32] = HIBYTE(a1);
  unint64_t v6 = *((void *)v2 + 3);
  unint64_t v7 = v4 + 2;
  if (v5 >= v6 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v6 > 1), v4 + 2, 1, v2);
  }
  *((void *)v2 + 2) = v7;
  v2[v5 + 32] = BYTE2(a1);
  unint64_t v8 = *((void *)v2 + 3);
  unint64_t v9 = v4 + 3;
  if (v7 >= v8 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v8 > 1), v4 + 3, 1, v2);
  }
  *((void *)v2 + 2) = v9;
  v2[v7 + 32] = BYTE1(a1);
  unint64_t v10 = *((void *)v2 + 3);
  if (v9 >= v10 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v10 > 1), v4 + 4, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 4;
  v2[v9 + 32] = a1;
  return v2;
}

char *sub_226C15FC8(uint64_t a1)
{
  uint64_t v2 = sub_226C1B32C(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  unint64_t v5 = v4 + 1;
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v5;
  v2[v4 + 32] = HIBYTE(a1);
  unint64_t v6 = *((void *)v2 + 3);
  unint64_t v7 = v4 + 2;
  if (v5 >= v6 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v6 > 1), v5 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v7;
  v2[v5 + 32] = BYTE6(a1);
  unint64_t v8 = *((void *)v2 + 3);
  unint64_t v9 = v5 + 2;
  if (v7 >= v8 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v8 > 1), v7 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v9;
  v2[v7 + 32] = BYTE5(a1);
  unint64_t v10 = *((void *)v2 + 3);
  unint64_t v11 = v7 + 2;
  if (v9 >= v10 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v10 > 1), v9 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v11;
  v2[v9 + 32] = BYTE4(a1);
  unint64_t v12 = *((void *)v2 + 3);
  unint64_t v13 = v9 + 2;
  if (v11 >= v12 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v12 > 1), v11 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v13;
  v2[v11 + 32] = BYTE3(a1);
  unint64_t v14 = *((void *)v2 + 3);
  unint64_t v15 = v11 + 2;
  if (v13 >= v14 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v14 > 1), v13 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v15;
  v2[v13 + 32] = BYTE2(a1);
  unint64_t v16 = *((void *)v2 + 3);
  unint64_t v17 = v11 + 3;
  if (v15 >= v16 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v16 > 1), v15 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v17;
  v2[v15 + 32] = BYTE1(a1);
  unint64_t v18 = *((void *)v2 + 3);
  int64_t v19 = v13 + 3;
  if (v17 >= v18 >> 1) {
    uint64_t v2 = sub_226C1B32C((char *)(v18 > 1), v19, 1, v2);
  }
  *((void *)v2 + 2) = v19;
  v2[v17 + 32] = a1;
  return v2;
}

uint64_t FixedWidthInteger.bigEndianBytes.getter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)v25 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a1);
  swift_getAssociatedConformanceWitness();
  char v28 = v13;
  sub_226C33E48();
  swift_getAssociatedConformanceWitness();
  uint64_t result = sub_226C34038();
  uint64_t v27 = result - 8;
  if (__OFSUB__(result, 8))
  {
LABEL_17:
    __break(1u);
    return result;
  }
  uint64_t result = sub_226C34038();
  unint64_t v15 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v26 = result;
  if (result > 0)
  {
    uint64_t v16 = 0;
    uint64_t v17 = MEMORY[0x263F8EE78];
    v25[1] = (unint64_t)v15 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    while (1)
    {
      uint64_t v18 = __OFADD__(v16, 8) ? 0x7FFFFFFFFFFFFFFFLL : v16 + 8;
      BOOL v19 = __OFSUB__(v27, v16);
      uint64_t v20 = v27 - v16;
      if (v19) {
        break;
      }
      uint64_t v29 = v20;
      sub_226C1D7A8();
      sub_226C33E58();
      char v21 = sub_226C33E78();
      char v22 = *v15;
      (*v15)(v11, AssociatedTypeWitness);
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_226C1B32C(0, *(void *)(v17 + 16) + 1, 1, (char *)v17);
        uint64_t v17 = result;
      }
      unint64_t v24 = *(void *)(v17 + 16);
      unint64_t v23 = *(void *)(v17 + 24);
      if (v24 >= v23 >> 1)
      {
        uint64_t result = (uint64_t)sub_226C1B32C((char *)(v23 > 1), v24 + 1, 1, (char *)v17);
        uint64_t v17 = result;
      }
      *(void *)(v17 + 16) = v24 + 1;
      *(unsigned char *)(v17 + v24 + 32) = v21;
      uint64_t v16 = v18;
      if (v18 >= v26) {
        goto LABEL_15;
      }
    }
    __break(1u);
    goto LABEL_17;
  }
  char v22 = *v15;
  uint64_t v17 = MEMORY[0x263F8EE78];
LABEL_15:
  v22(v28, AssociatedTypeWitness);
  return v17;
}

char *sub_226C16554(int a1)
{
  uint64_t v2 = sub_226C1B32C(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  unint64_t v5 = v3 >> 1;
  unint64_t v6 = v4 + 1;
  if (v3 >> 1 <= v4)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 1, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v6;
  v2[v4 + 32] = a1;
  unint64_t v7 = v4 + 2;
  if (v5 <= v6)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 2, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v7;
  v2[v6 + 32] = BYTE1(a1);
  unint64_t v8 = v4 + 3;
  if (v5 <= v7)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 3, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v8;
  v2[v7 + 32] = BYTE2(a1);
  if (v5 <= v8) {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 4, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 4;
  v2[v8 + 32] = HIBYTE(a1);
  return v2;
}

char *sub_226C16698(uint64_t a1)
{
  uint64_t v2 = sub_226C1B32C(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  unint64_t v5 = v3 >> 1;
  unint64_t v6 = v4 + 1;
  if (v3 >> 1 <= v4)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 1, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v6;
  v2[v4 + 32] = a1;
  unint64_t v7 = v4 + 2;
  if (v5 <= v6)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 2, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v7;
  v2[v6 + 32] = BYTE1(a1);
  unint64_t v8 = v4 + 3;
  if (v5 <= v7)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 3, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v8;
  v2[v7 + 32] = BYTE2(a1);
  unint64_t v9 = v4 + 4;
  if (v5 <= v8)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 4, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v9;
  v2[v8 + 32] = BYTE3(a1);
  unint64_t v10 = v4 + 5;
  if (v5 <= v9)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 5, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v10;
  v2[v9 + 32] = BYTE4(a1);
  unint64_t v11 = v4 + 6;
  if (v5 <= v10)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 6, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v11;
  v2[v10 + 32] = BYTE5(a1);
  unint64_t v12 = v4 + 7;
  if (v5 <= v11)
  {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 7, 1, v2);
    unint64_t v3 = *((void *)v2 + 3);
    unint64_t v5 = v3 >> 1;
  }
  *((void *)v2 + 2) = v12;
  v2[v11 + 32] = BYTE6(a1);
  if (v5 <= v12) {
    uint64_t v2 = sub_226C1B32C((char *)(v3 > 1), v4 + 8, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 8;
  v2[v12 + 32] = HIBYTE(a1);
  return v2;
}

char *FixedWidthInteger.littleEndianBytes.getter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  unint64_t v13 = (char *)v23 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a1);
  swift_getAssociatedConformanceWitness();
  uint64_t v25 = v13;
  sub_226C33E48();
  swift_getAssociatedConformanceWitness();
  uint64_t v24 = sub_226C34038();
  if (v24 <= 0)
  {
    BOOL v19 = *(void (**)(char *, uint64_t))(v8 + 8);
    unint64_t v15 = (char *)MEMORY[0x263F8EE78];
  }
  else
  {
    long long v23[2] = sub_226C1D7A8();
    uint64_t v14 = 0;
    unint64_t v15 = (char *)MEMORY[0x263F8EE78];
    uint64_t v16 = (void (**)(char *, uint64_t))(v8 + 8);
    v23[1] = (unint64_t)v16 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    do
    {
      if (__OFADD__(v14, 8)) {
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v17 = v14 + 8;
      }
      uint64_t v26 = v14;
      sub_226C33E58();
      char v18 = sub_226C33E78();
      BOOL v19 = *v16;
      (*v16)(v11, AssociatedTypeWitness);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v15 = sub_226C1B32C(0, *((void *)v15 + 2) + 1, 1, v15);
      }
      unint64_t v21 = *((void *)v15 + 2);
      unint64_t v20 = *((void *)v15 + 3);
      if (v21 >= v20 >> 1) {
        unint64_t v15 = sub_226C1B32C((char *)(v20 > 1), v21 + 1, 1, v15);
      }
      *((void *)v15 + 2) = v21 + 1;
      v15[v21 + 32] = v18;
      uint64_t v14 = v17;
    }
    while (v17 < v24);
  }
  v19(v25, AssociatedTypeWitness);
  return v15;
}

uint64_t FixedWidthInteger.init(exactlyThrowing:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v17 = a3;
  uint64_t v5 = sub_226C33DD8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *))(v11 + 16))((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_226C33C68();
  uint64_t v12 = *(void *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    type metadata accessor for CUError();
    uint64_t v13 = sub_226C33998();
    CUError.__allocating_init(domain:code:message:underlying:)(v13, v14, -6710, 0x65766F2074736143, 0xED0000776F6C6672, 0);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v17, v8, a2);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t FixedWidthInteger.addingThrowingOverflow(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t result = sub_226C34048();
  if (result)
  {
    type metadata accessor for CUError();
    uint64_t v5 = sub_226C33998();
    CUError.__allocating_init(domain:code:message:underlying:)(v5, v6, -6710, 0xD000000000000010, 0x8000000226C39060, 0);
    swift_willThrow();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8))(a2, a1);
  }
  return result;
}

float Float.init<A>(bigEndianBytes:offset:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_226C16FB0(a1, a2, a3, a4, a5, (void (*)(uint64_t *__return_ptr, char *, void, char *, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:offset:end:));
}

float Float.init<A>(littleEndianBytes:offset:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_226C16FB0(a1, a2, a3, a4, a5, (void (*)(uint64_t *__return_ptr, char *, void, char *, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:offset:end:));
}

float sub_226C16FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t *__return_ptr, char *, void, char *, void, uint64_t, unint64_t, uint64_t))
{
  void (*v23)(uint64_t *__return_ptr, char *, void, char *, void, uint64_t, unint64_t, uint64_t);
  uint64_t v24;

  unint64_t v23 = a6;
  v22[0] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v15 = (char *)v22 - v14;
  uint64_t v16 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v13);
  char v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a3, AssociatedTypeWitness);
  unint64_t v19 = sub_226C1D7FC();
  uint64_t v20 = v22[1];
  v23(&v24, v18, v22[0], v15, MEMORY[0x263F8E8F8], a4, v19, a5);
  if (!v20) {
    float v6 = *(float *)&v24;
  }
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a1, a4);
  return v6;
}

float Float.init<A>(bigEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226C17254(a1, a2, a3, (void (*)(uint64_t *__return_ptr, uint64_t, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

{
  return sub_226C17324(a1, a2, a3, (void (*)(uint64_t *__return_ptr, char *, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

float Float.init<A>(littleEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226C17254(a1, a2, a3, (void (*)(uint64_t *__return_ptr, uint64_t, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

{
  return sub_226C17324(a1, a2, a3, (void (*)(uint64_t *__return_ptr, char *, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

float sub_226C17254(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t, void, uint64_t, unint64_t, uint64_t))
{
  unint64_t v9 = sub_226C1D7FC();
  a4(&v11, a1, MEMORY[0x263F8E8F8], a2, v9, a3);
  if (!v4) {
    return *(float *)&v11;
  }
  return result;
}

float sub_226C17324(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, char *, void, uint64_t, unint64_t, uint64_t))
{
  uint64_t v10 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a2);
  unint64_t v13 = sub_226C1D7FC();
  a4(&v16, v12, MEMORY[0x263F8E8F8], a2, v13, a3);
  if (!v4) {
    float v5 = *(float *)&v16;
  }
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, a2);
  return v5;
}

char *Float.bigEndianBytes.getter(float a1)
{
  return sub_226C15E94(SLODWORD(a1));
}

char *Float.littleEndianBytes.getter(float a1)
{
  return sub_226C16554(SLODWORD(a1));
}

double Double.init<A>(bigEndianBytes:offset:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_226C174E4(a1, a2, a3, a4, a5, (void (*)(double *__return_ptr, char *, void, char *, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:offset:end:));
}

double Double.init<A>(littleEndianBytes:offset:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_226C174E4(a1, a2, a3, a4, a5, (void (*)(double *__return_ptr, char *, void, char *, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:offset:end:));
}

double sub_226C174E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(double *__return_ptr, char *, void, char *, void, uint64_t, unint64_t, uint64_t))
{
  void (*v23)(double *__return_ptr, char *, void, char *, void, uint64_t, unint64_t, uint64_t);
  double v24;

  unint64_t v23 = a6;
  v22[0] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)v22 - v14;
  uint64_t v16 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v13);
  char v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a3, AssociatedTypeWitness);
  unint64_t v19 = sub_226C1D850();
  uint64_t v20 = v22[1];
  v23(&v24, v18, v22[0], v15, MEMORY[0x263F8E970], a4, v19, a5);
  if (!v20) {
    double v6 = v24;
  }
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a1, a4);
  return v6;
}

double Double.init<A>(bigEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226C17788(a1, a2, a3, (void (*)(double *__return_ptr, uint64_t, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

{
  return sub_226C17858(a1, a2, a3, (void (*)(double *__return_ptr, char *, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(bigEndianBytes:));
}

double Double.init<A>(littleEndianBytes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_226C17788(a1, a2, a3, (void (*)(double *__return_ptr, uint64_t, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

{
  return sub_226C17858(a1, a2, a3, (void (*)(double *__return_ptr, char *, void, uint64_t, unint64_t, uint64_t))FixedWidthInteger.init<A>(littleEndianBytes:));
}

double sub_226C17788(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(double *__return_ptr, uint64_t, void, uint64_t, unint64_t, uint64_t))
{
  unint64_t v9 = sub_226C1D850();
  a4(&v11, a1, MEMORY[0x263F8E970], a2, v9, a3);
  if (!v4) {
    return v11;
  }
  return result;
}

double sub_226C17858(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(double *__return_ptr, char *, void, uint64_t, unint64_t, uint64_t))
{
  uint64_t v10 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a2);
  unint64_t v13 = sub_226C1D850();
  a4(&v16, v12, MEMORY[0x263F8E970], a2, v13, a3);
  if (!v4) {
    double v5 = v16;
  }
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, a2);
  return v5;
}

char *Double.bigEndianBytes.getter(double a1)
{
  return sub_226C15FC8(*(uint64_t *)&a1);
}

char *Double.littleEndianBytes.getter(double a1)
{
  return sub_226C16698(*(uint64_t *)&a1);
}

uint64_t FNV1a<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 2166136261;
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = &v14[-v10];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_226C33AE8();
  swift_getAssociatedConformanceWitness();
  sub_226C33DE8();
  if ((v16 & 1) == 0)
  {
    int v12 = v15;
    do
    {
      uint64_t v4 = 16777619 * (v4 ^ v12);
      sub_226C33DE8();
      int v12 = v15;
    }
    while (v16 != 1);
  }
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
  return v4;
}

uint64_t Numeric<>.cuIsApproximatelyEqual(to:absoluteTolerance:relativeTolerance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = a4;
  uint64_t v18 = a5;
  uint64_t v19 = a6;
  uint64_t v14 = a5;
  uint64_t v15 = a6;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  char v11 = AdditiveArithmetic.cuIsApproximatelyEqual<A>(to:absoluteTolerance:relativeTolerance:norm:)(a1, a2, a3, (void (*)(uint64_t))sub_226C1D8C4, (uint64_t)v13, a4, AssociatedTypeWitness, *(void *)(v14 + 8), v15);
  swift_release();
  return v11 & 1;
}

uint64_t sub_226C17CB4()
{
  return sub_226C33C78();
}

uint64_t AdditiveArithmetic.cuIsApproximatelyEqual<A>(to:absoluteTolerance:relativeTolerance:norm:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v54 = a4;
  uint64_t v56 = a3;
  uint64_t v58 = a2;
  uint64_t v12 = *(void *)(a6 - 8);
  uint64_t v52 = a5;
  uint64_t v53 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  uint64_t v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v13);
  id v59 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v57 = (char *)&v49 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v55 = (char *)&v49 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  CFPropertyListRef v51 = (char *)&v49 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v49 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (void (*)(uint64_t))((char *)&v49 - v29);
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v49 - v31;
  uint64_t v34 = v33;
  if (sub_226C33978())
  {
    char v35 = 1;
  }
  else
  {
    uint64_t v49 = a9;
    sub_226C340B8();
    uint64_t v50 = v32;
    uint64_t v36 = v54;
    v54((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v15, a6);
    v36(v9);
    uint64_t v37 = v51;
    v36(v34);
    uint64_t v38 = v30;
    uint64_t v39 = *(void *)(*(void *)(v49 + 24) + 8);
    sub_226C34298();
    uint64_t v40 = v60;
    uint64_t v41 = *(void (**)(char *, uint64_t))(v60 + 8);
    uint64_t v42 = v37;
    uint64_t v43 = v50;
    v41(v42, a7);
    v41(v27, a7);
    uint64_t v54 = v38;
    sub_226C33C58();
    uint64_t v44 = v55;
    uint64_t v58 = v39;
    sub_226C34298();
    v41(v27, a7);
    LOBYTE(v38) = sub_226C338A8();
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    uint64_t v46 = v57;
    v45(v57, v43, a7);
    uint64_t v47 = v59;
    v45(v59, v44, a7);
    if (v38) {
      char v35 = sub_226C33958();
    }
    else {
      char v35 = 0;
    }
    v41(v47, a7);
    v41(v46, a7);
    v41(v44, a7);
    v41((char *)v54, a7);
    v41(v43, a7);
  }
  return v35 & 1;
}

uint64_t NWEndpoint.init(_:defaultPort:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v100 = a3;
  uint64_t v109 = a4;
  uint64_t v121 = *MEMORY[0x263EF8340];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156D80);
  MEMORY[0x270FA5388](v6 - 8);
  v112 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_226C33768();
  uint64_t v107 = *(void *)(v8 - 8);
  uint64_t v108 = v8;
  MEMORY[0x270FA5388](v8);
  v110 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CF8);
  MEMORY[0x270FA5388](v10 - 8);
  v106 = (char *)&v94 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_226C337E8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v104 = v12;
  uint64_t v105 = v13;
  MEMORY[0x270FA5388](v12);
  v101 = (char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156D88);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  v103 = (char *)&v94 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v111 = (uint64_t)&v94 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156D00);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v94 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_226C337A8();
  uint64_t v102 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_226C33728();
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v94 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v120 = 0;
  uint64_t v118 = 0;
  uint64_t v119 = 0;
  uint64_t v117 = 0;
  uint64_t v113 = a2;
  sub_226C339C8();
  int v29 = StringToSockAddr();
  swift_release();
  if (!v29)
  {
    v94 = v24;
    v95 = v21;
    v98 = v28;
    uint64_t v96 = v26;
    uint64_t v97 = v25;
    uint64_t v99 = a1;
    uint64_t v39 = v117;
    if (BYTE1(v117) == 30)
    {
      uint64_t v51 = v120;
      uint64_t v115 = v118;
      uint64_t v116 = v119;
      uint64_t v52 = sub_226C18E5C((uint64_t)&v115, (uint64_t)&v117);
      unint64_t v54 = v53;
      LOBYTE(v117) = v39;
      BYTE1(v117) = 30;
      WORD1(v117) = WORD1(v39);
      HIDWORD(v117) = HIDWORD(v39);
      uint64_t v118 = v115;
      uint64_t v119 = v116;
      unsigned int v120 = v51;
      if (v51)
      {
        uint64_t v56 = (uint64_t)v103;
        sub_226C33828();
      }
      else
      {
        uint64_t v55 = sub_226C33818();
        uint64_t v56 = (uint64_t)v103;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v103, 1, 1, v55);
      }
      v62 = v98;
      Class v64 = v110;
      uint64_t v65 = (uint64_t)v106;
      sub_226C1FC98(v56, v111, &qword_268156D88);
      sub_226C1D5A0(v52, v54);
      sub_226C337F8();
      uint64_t v66 = v104;
      uint64_t v67 = v105;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v105 + 48))(v65, 1, v104) == 1)
      {
        sub_226C088D0(v65, &qword_268156CF8);
        type metadata accessor for CUError();
        uint64_t v68 = sub_226C33998();
        uint64_t v70 = v69;
        uint64_t v115 = 0;
        uint64_t v116 = 0xE000000000000000;
        sub_226C33F48();
        swift_bridgeObjectRelease();
        uint64_t v115 = 0xD00000000000001BLL;
        uint64_t v116 = 0x8000000226C390A0;
        sub_226C33A28();
        swift_bridgeObjectRelease();
        CUError.__allocating_init(domain:code:message:underlying:)(v68, v70, -6700, v115, v116, 0);
        swift_willThrow();
        sub_226C1D5F8(v52, v54);
        return sub_226C088D0(v56, &qword_268156D88);
      }
      sub_226C088D0(v56, &qword_268156D88);
      swift_bridgeObjectRelease();
      sub_226C1D5F8(v52, v54);
      uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 32);
      uint64_t v72 = v101;
      v71(v101, v65, v66);
      v71(v62, (uint64_t)v72, v66);
      v63 = (unsigned int *)MEMORY[0x263F140F8];
      uint64_t v40 = (uint64_t)v112;
    }
    else
    {
      if (BYTE1(v117) != 2)
      {
        type metadata accessor for CUError();
        uint64_t v57 = sub_226C33998();
        uint64_t v59 = v58;
        uint64_t v115 = 0;
        uint64_t v116 = 0xE000000000000000;
        sub_226C33F48();
        swift_bridgeObjectRelease();
        uint64_t v115 = 0xD00000000000001ALL;
        uint64_t v116 = 0x8000000226C39080;
        sub_226C33A28();
        swift_bridgeObjectRelease();
        uint64_t v33 = v115;
        uint64_t v34 = v116;
        uint64_t v35 = v57;
        uint64_t v36 = v59;
        uint64_t v37 = -6735;
        goto LABEL_3;
      }
      uint64_t v40 = (uint64_t)v112;
      LOBYTE(v115) = v117;
      BYTE1(v115) = 2;
      WORD1(v115) = WORD1(v117);
      HIDWORD(v115) = HIDWORD(v117);
      uint64_t v116 = v118;
      uint64_t v41 = sub_226C18E5C((uint64_t)&v115 + 4, (uint64_t)&v116);
      unint64_t v43 = v42;
      uint64_t v117 = v115;
      uint64_t v118 = v116;
      uint64_t v44 = sub_226C33818();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v111, 1, 1, v44);
      sub_226C1D5A0(v41, v43);
      uint64_t v45 = (uint64_t)v95;
      sub_226C337B8();
      uint64_t v46 = v102;
      uint64_t v47 = v22;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v102 + 48))(v45, 1, v22) == 1)
      {
        sub_226C088D0(v45, &qword_268156D00);
        type metadata accessor for CUError();
        uint64_t v48 = sub_226C33998();
        uint64_t v50 = v49;
        uint64_t v115 = 0;
        uint64_t v116 = 0xE000000000000000;
        sub_226C33F48();
        swift_bridgeObjectRelease();
        uint64_t v115 = 0xD00000000000001BLL;
        uint64_t v116 = 0x8000000226C39100;
        sub_226C33A28();
        swift_bridgeObjectRelease();
        CUError.__allocating_init(domain:code:message:underlying:)(v48, v50, -6700, v115, v116, 0);
        swift_willThrow();
        return sub_226C1D5F8(v41, v43);
      }
      swift_bridgeObjectRelease();
      sub_226C1D5F8(v41, v43);
      uint64_t v60 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 32);
      char v61 = v94;
      v60(v94, v45, v22);
      v62 = v98;
      v60(v98, (uint64_t)v61, v47);
      v63 = (unsigned int *)MEMORY[0x263F140F0];
      Class v64 = v110;
    }
    uint64_t v73 = v96;
    uint64_t v74 = v97;
    (*(void (**)(char *, void, uint64_t))(v96 + 104))(v62, *v63, v97);
    int Port = SockAddrGetPort();
    uint64_t v77 = v108;
    uint64_t v76 = v109;
    uint64_t v78 = v107;
    if (Port < 1)
    {
      sub_226C33738();
    }
    else
    {
      int v79 = Port;
      if (Port >= 0x10000)
      {
        type metadata accessor for CUError();
        uint64_t v80 = sub_226C33998();
        uint64_t v82 = v81;
        uint64_t v115 = 0;
        uint64_t v116 = 0xE000000000000000;
        sub_226C33F48();
        swift_bridgeObjectRelease();
        uint64_t v115 = 0xD000000000000013;
        uint64_t v116 = 0x8000000226C390E0;
        int v114 = v79;
        sub_226C341B8();
        sub_226C33A28();
        swift_bridgeObjectRelease();
        uint64_t v83 = v115;
        uint64_t v84 = v116;
        uint64_t v85 = v80;
        uint64_t v86 = v82;
        uint64_t v87 = -6705;
LABEL_23:
        CUError.__allocating_init(domain:code:message:underlying:)(v85, v86, v87, v83, v84, 0);
        swift_willThrow();
        return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v62, v74);
      }
      sub_226C33748();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v40, 1, v77) == 1)
      {
        sub_226C088D0(v40, &qword_268156D80);
        type metadata accessor for CUError();
        uint64_t v88 = sub_226C33998();
        uint64_t v90 = v89;
        uint64_t v115 = 0;
        uint64_t v116 = 0xE000000000000000;
        sub_226C33F48();
        swift_bridgeObjectRelease();
        uint64_t v115 = 0xD000000000000017;
        uint64_t v116 = 0x8000000226C390C0;
        int v114 = v79;
        sub_226C341B8();
        sub_226C33A28();
        swift_bridgeObjectRelease();
        uint64_t v83 = v115;
        uint64_t v84 = v116;
        uint64_t v85 = v88;
        uint64_t v86 = v90;
        uint64_t v87 = -6700;
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v64, v40, v77);
    }
    uint64_t v91 = v76 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156D90) + 48);
    (*(void (**)(uint64_t, char *, uint64_t))(v73 + 32))(v76, v62, v74);
    (*(void (**)(uint64_t, char *, uint64_t))(v78 + 32))(v91, v64, v77);
    uint64_t v92 = *MEMORY[0x263F14118];
    uint64_t v93 = sub_226C33788();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 104))(v76, v92, v93);
  }
  type metadata accessor for CUError();
  uint64_t v30 = sub_226C33998();
  uint64_t v32 = v31;
  uint64_t v115 = 0;
  uint64_t v116 = 0xE000000000000000;
  sub_226C33F48();
  swift_bridgeObjectRelease();
  uint64_t v115 = 0x7320504920646142;
  uint64_t v116 = 0xEF203A676E697274;
  sub_226C33A28();
  swift_bridgeObjectRelease();
  uint64_t v33 = v115;
  uint64_t v34 = v116;
  uint64_t v35 = v30;
  uint64_t v36 = v32;
  uint64_t v37 = v29;
LABEL_3:
  CUError.__allocating_init(domain:code:message:underlying:)(v35, v36, v37, v33, v34, 0);
  return swift_willThrow();
}

uint64_t sub_226C18E5C(uint64_t a1, uint64_t a2)
{
  v8[3] = MEMORY[0x263F8D3E8];
  v8[4] = MEMORY[0x263F07B80];
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8D3E8]);
  unint64_t v3 = (unsigned char *)*v2;
  if (*v2 && (uint64_t v4 = (unsigned char *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_226C1D428(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = sub_226C1F8B0((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      uint64_t v6 = sub_226C1F82C((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  return v6;
}

uint64_t NWEndpoint.Port.init(from:)@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156D80);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v21[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v21[-1] - v8;
  uint64_t v10 = sub_226C33768();
  uint64_t v23 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C343A8();
  if (v2)
  {
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v21, v22);
    sub_226C34238();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
    sub_226C33748();
    uint64_t v13 = v23;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v9, 1, v10) != 1)
    {
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
      v19(v12, v9, v10);
LABEL_10:
      v19(v20, v12, v10);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    }
    sub_226C088D0((uint64_t)v9, &qword_268156D80);
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C343A8();
  __swift_project_boxed_opaque_existential_1(v21, v22);
  sub_226C34228();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  sub_226C33778();
  uint64_t v14 = v23;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v7, 1, v10) != 1)
  {
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v19(v12, v7, v10);
    goto LABEL_10;
  }
  sub_226C088D0((uint64_t)v7, &qword_268156D80);
  uint64_t v15 = sub_226C33F88();
  swift_allocError();
  uint64_t v17 = v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C34398();
  sub_226C33F78();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F8DCB8], v15);
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t NWEndpoint.Port.encode(to:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C343D8();
  sub_226C33758();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_226C34258();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t sub_226C193AC@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return NWEndpoint.Port.init(from:)(a1, a2);
}

uint64_t sub_226C193C4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_226C343D8();
  sub_226C33758();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_226C34258();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t Optional.unwrap(_:file:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v8 = v7;
  uint64_t v23 = a5;
  int v22 = a4;
  v21[1] = a3;
  uint64_t v13 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v8, v16);
  uint64_t v17 = *(void *)(a6 + 16);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v15, 1, v17) == 1)
  {
    uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, a6);
    MEMORY[0x270FA5388](v20);
    v21[-4] = v17;
    v21[-3] = v8;
    v21[-2] = a1;
    v21[-1] = a2;
    fatalError(_:file:line:)((void (*)(void))sub_226C1D8CC);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a7, v15, v17);
}

BOOL Optional.cuIsNil.getter(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 48))(v1, 1) == 1;
}

uint64_t OSUnfairLock.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = (_DWORD *)swift_slowAlloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = 0;
  return v0;
}

uint64_t OSUnfairLock.init()()
{
  uint64_t v1 = (_DWORD *)swift_slowAlloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = 0;
  return v0;
}

uint64_t OSUnfairLock.deinit()
{
  MEMORY[0x22A665D30](*(void *)(v0 + 16), -1, -1);
  return v0;
}

uint64_t OSUnfairLock.__deallocating_deinit()
{
  MEMORY[0x22A665D30](*(void *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

void sub_226C1976C()
{
  os_unfair_lock_lock(*(os_unfair_lock_t *)(v0 + 16));
}

void sub_226C19774()
{
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v0 + 16));
}

uint64_t sub_226C1977C(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 120))();
  uint64_t v4 = a1(v3);
  return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 128))(v4);
}

uint64_t PairingSetupCodeType.description.getter()
{
  return sub_226C33A38();
}

uint64_t sub_226C19848()
{
  CUPairingSetupCodeTypeToString(*v0);
  return sub_226C33A38();
}

uint64_t PThread.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  type metadata accessor for PThread.ClosureWrapper();
  uint64_t v5 = (void *)swift_allocObject();
  _OWORD v5[2] = a1;
  v5[3] = a2;
  swift_beginAccess();
  swift_retain();
  pthread_create((pthread_t *)(v4 + 16), 0, (void *(__cdecl *)(void *))sub_226C199F4, v5);
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t PThread.init(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = 0;
  type metadata accessor for PThread.ClosureWrapper();
  uint64_t v5 = (void *)swift_allocObject();
  _OWORD v5[2] = a1;
  v5[3] = a2;
  swift_beginAccess();
  swift_retain();
  pthread_create((pthread_t *)(v2 + 16), 0, (void *(__cdecl *)(void *))sub_226C199F4, v5);
  swift_endAccess();
  swift_release();
  return v2;
}

uint64_t sub_226C199F4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 16);
  swift_retain();
  uint64_t v2 = swift_release();
  v1(v2);
  swift_release();
  return 0;
}

uint64_t PThread.deinit()
{
  swift_beginAccess();
  uint64_t v1 = *(_opaque_pthread_t **)(v0 + 16);
  if (!v1) {
    return v0;
  }
  uint64_t result = pthread_detach(v1);
  if (!result) {
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t PThread.__deallocating_deinit()
{
  swift_beginAccess();
  uint64_t v1 = *(_opaque_pthread_t **)(v0 + 16);
  if (!v1) {
    return swift_deallocClassInstance();
  }
  uint64_t result = pthread_detach(v1);
  if (!result) {
    return swift_deallocClassInstance();
  }
  __break(1u);
  return result;
}

void sub_226C19AE0()
{
}

void sub_226C19AF4()
{
  swift_beginAccess();
  uint64_t v1 = *(_opaque_pthread_t **)(v0 + 16);
  if (v1)
  {
    if (pthread_self() == v1) {
      pthread_exit(0);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

_opaque_pthread_t *sub_226C19B40()
{
  swift_beginAccess();
  uint64_t result = *(_opaque_pthread_t **)(v0 + 16);
  if (result)
  {
    uint64_t result = (_opaque_pthread_t *)pthread_detach(result);
    if (!result)
    {
      *(void *)(v0 + 16) = 0;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

_opaque_pthread_t *sub_226C19B98()
{
  swift_beginAccess();
  uint64_t result = *(_opaque_pthread_t **)(v0 + 16);
  if (result)
  {
    uint64_t result = (_opaque_pthread_t *)pthread_join(result, 0);
    *(void *)(v0 + 16) = 0;
  }
  return result;
}

uint64_t sub_226C19BE8()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t PThreadMutex.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = (pthread_mutex_t *)swift_slowAlloc();
  *(void *)(v0 + 16) = v1;
  uint64_t result = pthread_mutex_init(v1, 0);
  if (!result) {
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t PThreadMutex.init()()
{
  uint64_t v1 = (pthread_mutex_t *)swift_slowAlloc();
  *(void *)(v0 + 16) = v1;
  uint64_t result = pthread_mutex_init(v1, 0);
  if (!result) {
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t PThreadMutex.deinit()
{
  uint64_t result = pthread_mutex_destroy(*(pthread_mutex_t **)(v0 + 16));
  if (result)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x22A665D30](*(void *)(v0 + 16), -1, -1);
    return v0;
  }
  return result;
}

uint64_t PThreadMutex.__deallocating_deinit()
{
  uint64_t result = pthread_mutex_destroy(*(pthread_mutex_t **)(v0 + 16));
  if (result)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x22A665D30](*(void *)(v0 + 16), -1, -1);
    return swift_deallocClassInstance();
  }
  return result;
}

uint64_t sub_226C19D34()
{
  return sub_226C19D64(MEMORY[0x263EF8A28]);
}

uint64_t sub_226C19D4C()
{
  return sub_226C19D64(MEMORY[0x263EF8A30]);
}

uint64_t sub_226C19D64(uint64_t (*a1)(void))
{
  uint64_t result = a1(*(void *)(v1 + 16));
  if (result) {
    __break(1u);
  }
  return result;
}

uint64_t sub_226C19D90(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 120))();
  uint64_t v4 = a1(v3);
  return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 128))(v4);
}

uint64_t (*stderrTextStream.modify())()
{
  return nullsub_1;
}

uint64_t (*stdoutTextStream.modify())()
{
  return nullsub_1;
}

Swift::Void __swiftcall StdErrTextStream.write(_:)(Swift::String a1)
{
}

uint64_t sub_226C19EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_226C19F54(a1, a2, a3, a4, MEMORY[0x263F90200]);
}

Swift::Void __swiftcall StdOutTextStream.write(_:)(Swift::String a1)
{
}

uint64_t sub_226C19ED4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = (FILE *)a3();
  uint64_t v4 = sub_226C339C8();
  fputs((const char *)(v4 + 32), v3);
  return swift_release();
}

uint64_t sub_226C19F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_226C19F54(a1, a2, a3, a4, MEMORY[0x263F90208]);
}

uint64_t sub_226C19F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = (FILE *)a5();
  uint64_t v6 = sub_226C339C8();
  fputs((const char *)(v6 + 32), v5);
  return swift_release();
}

uint64_t UInt8.init<A>(bytes:offset:end:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v25 = *(void *)(*(void *)(a5 + 8) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v22 - v13;
  uint64_t v28 = a3;
  if (sub_226C33C88() < 1)
  {
    sub_226C1D6D8();
    swift_allocError();
    *uint64_t v21 = 3;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v28, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
  }
  else
  {
    uint64_t v23 = a2;
    uint64_t v15 = (void (*)(unsigned char *, void))sub_226C33D18();
    unsigned int v24 = *v16;
    v15(v27, 0);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 32);
    uint64_t v18 = AssociatedTypeWitness;
    v17(v12, (uint64_t)a2, AssociatedTypeWitness);
    sub_226C33CB8();
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v19(v28, v18);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
    v19((uint64_t)v12, v18);
    v17(v23, (uint64_t)v14, v18);
    return v24;
  }
}

unint64_t static UInt64.randomRecognizableIdentifier.getter()
{
  unint64_t result = sub_226C1BEAC(0xF4240uLL);
  if (is_mul_ok(result + 1, 0xF4240uLL)) {
    return (1000000 * (result + 1)) | 1;
  }
  __break(1u);
  return result;
}

uint64_t static NSUserDefaults.allKeys(suiteName:)()
{
  uint64_t v0 = (__CFString *)sub_226C33988();
  CFArrayRef v1 = CFPreferencesCopyKeyList(v0, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);

  if (v1)
  {
    sub_226C33B18();
  }
  return MEMORY[0x263F8EE78];
}

Swift::Bool_optional __swiftcall NSUserDefaults.BOOLLike(forKey:)(Swift::String forKey)
{
  uint64_t v2 = (void *)sub_226C33988();
  id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (!v3) {
    return (Swift::Bool_optional)2;
  }
  sub_226C33EB8();
  swift_unknownObjectRelease();
  sub_226C07014(v8, v9);
  sub_226C06F78((uint64_t)v9, (uint64_t)v8);
  sub_226C1D9FC(0, &qword_268156D98);
  if (swift_dynamicCast())
  {
    v4.value = objc_msgSend((id)v7, sel_BOOLValue);

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    return v4;
  }
  sub_226C06F78((uint64_t)v9, (uint64_t)v8);
  if (!swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    return (Swift::Bool_optional)2;
  }
  v8[0] = v7;
  sub_226C1D3D4();
  if (StringProtocol.isTrue.getter())
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    swift_bridgeObjectRelease();
    return (Swift::Bool_optional)1;
  }
  else
  {
    v8[0] = v7;
    BOOL v6 = StringProtocol.isFalse.getter();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    if (v6) {
      return 0;
    }
    else {
      return (Swift::Bool_optional)2;
    }
  }
}

Swift::Int_optional __swiftcall NSUserDefaults.intLike(forKey:)(Swift::String forKey)
{
  uint64_t v2 = (void *)sub_226C33988();
  id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (!v3) {
    goto LABEL_16;
  }
  sub_226C33EB8();
  swift_unknownObjectRelease();
  sub_226C07014(v29, v30);
  sub_226C06F78((uint64_t)v30, (uint64_t)v29);
  sub_226C1D9FC(0, &qword_268156D98);
  if (!swift_dynamicCast())
  {
    sub_226C06F78((uint64_t)v30, (uint64_t)v29);
    Swift::Int v6 = swift_dynamicCast();
    if (v6)
    {
      uint64_t v7 = HIBYTE(*((void *)&v28 + 1)) & 0xFLL;
      uint64_t v8 = v28 & 0xFFFFFFFFFFFFLL;
      if ((*((void *)&v28 + 1) & 0x2000000000000000) != 0) {
        uint64_t v9 = HIBYTE(*((void *)&v28 + 1)) & 0xFLL;
      }
      else {
        uint64_t v9 = v28 & 0xFFFFFFFFFFFFLL;
      }
      if (!v9) {
        goto LABEL_61;
      }
      if ((*((void *)&v28 + 1) & 0x1000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v4 = (uint64_t)sub_226C1BF38(v28, *((uint64_t *)&v28 + 1), 10);
        char v26 = v25;
        swift_bridgeObjectRelease();
        if ((v26 & 1) == 0) {
          goto LABEL_43;
        }
        goto LABEL_61;
      }
      if ((*((void *)&v28 + 1) & 0x2000000000000000) == 0)
      {
        if ((v28 & 0x1000000000000000) != 0) {
          uint64_t v10 = (unsigned __int8 *)((*((void *)&v28 + 1) & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else {
          uint64_t v10 = (unsigned __int8 *)sub_226C33F98();
        }
        uint64_t v11 = sub_226C1C020(v10, v8, 10);
        if ((v12 & 1) == 0)
        {
          uint64_t v4 = (uint64_t)v11;
LABEL_43:
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
          swift_bridgeObjectRelease();
          char v5 = 0;
          goto LABEL_17;
        }
LABEL_61:
        v29[0] = v28;
        sub_226C1D3D4();
        if (StringProtocol.isTrue.getter())
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
          swift_bridgeObjectRelease();
          char v5 = 0;
          uint64_t v4 = 1;
        }
        else
        {
          v29[0] = v28;
          BOOL v27 = StringProtocol.isFalse.getter();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
          uint64_t v4 = 0;
          char v5 = !v27;
        }
        goto LABEL_17;
      }
      *(void *)&v29[0] = v28;
      *((void *)&v29[0] + 1) = *((void *)&v28 + 1) & 0xFFFFFFFFFFFFFFLL;
      if (v28 == 43)
      {
        if (!v7) {
          goto LABEL_67;
        }
        if (v7 == 1) {
          goto LABEL_65;
        }
        if ((BYTE1(v28) - 48) > 9u) {
          goto LABEL_39;
        }
        uint64_t v4 = (BYTE1(v28) - 48);
        if (v7 != 2)
        {
          if ((BYTE2(v28) - 48) > 9u) {
            goto LABEL_39;
          }
          uint64_t v4 = 10 * (BYTE1(v28) - 48) + (BYTE2(v28) - 48);
          uint64_t v13 = v7 - 3;
          if (v7 != 3)
          {
            uint64_t v14 = (unsigned __int8 *)v29 + 3;
            while (1)
            {
              unsigned int v15 = *v14 - 48;
              if (v15 > 9) {
                goto LABEL_39;
              }
              uint64_t v16 = 10 * v4;
              if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63) {
                goto LABEL_39;
              }
              uint64_t v4 = v16 + v15;
              if (__OFADD__(v16, v15)) {
                goto LABEL_39;
              }
              LOBYTE(v7) = 0;
              ++v14;
              if (!--v13) {
                goto LABEL_42;
              }
            }
          }
        }
      }
      else
      {
        if (v28 == 45)
        {
          if (v7)
          {
            if (v7 != 1)
            {
              if ((BYTE1(v28) - 48) > 9u) {
                goto LABEL_39;
              }
              if (v7 == 2)
              {
                LOBYTE(v7) = 0;
                uint64_t v4 = -(uint64_t)(BYTE1(v28) - 48);
                goto LABEL_42;
              }
              if ((BYTE2(v28) - 48) > 9u) {
                goto LABEL_39;
              }
              uint64_t v4 = -10 * (BYTE1(v28) - 48) - (BYTE2(v28) - 48);
              uint64_t v21 = v7 - 3;
              if (v7 != 3)
              {
                uint64_t v22 = (unsigned __int8 *)v29 + 3;
                while (1)
                {
                  unsigned int v23 = *v22 - 48;
                  if (v23 > 9) {
                    goto LABEL_39;
                  }
                  uint64_t v24 = 10 * v4;
                  if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63) {
                    goto LABEL_39;
                  }
                  uint64_t v4 = v24 - v23;
                  if (__OFSUB__(v24, v23)) {
                    goto LABEL_39;
                  }
                  LOBYTE(v7) = 0;
                  ++v22;
                  if (!--v21) {
                    goto LABEL_42;
                  }
                }
              }
              goto LABEL_41;
            }
LABEL_65:
            uint64_t v4 = 0;
LABEL_42:
            if ((v7 & 1) == 0) {
              goto LABEL_43;
            }
            goto LABEL_61;
          }
          __break(1u);
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
        if (!v7 || (v28 - 48) > 9u)
        {
LABEL_39:
          uint64_t v4 = 0;
          LOBYTE(v7) = 1;
          goto LABEL_42;
        }
        uint64_t v4 = (v28 - 48);
        if (v7 != 1)
        {
          if ((BYTE1(v28) - 48) > 9u) {
            goto LABEL_39;
          }
          uint64_t v4 = 10 * (v28 - 48) + (BYTE1(v28) - 48);
          uint64_t v17 = v7 - 2;
          if (v7 != 2)
          {
            uint64_t v18 = (unsigned __int8 *)v29 + 2;
            while (1)
            {
              unsigned int v19 = *v18 - 48;
              if (v19 > 9) {
                goto LABEL_39;
              }
              uint64_t v20 = 10 * v4;
              if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63) {
                goto LABEL_39;
              }
              uint64_t v4 = v20 + v19;
              if (__OFADD__(v20, v19)) {
                goto LABEL_39;
              }
              LOBYTE(v7) = 0;
              ++v18;
              if (!--v17) {
                goto LABEL_42;
              }
            }
          }
        }
      }
LABEL_41:
      LOBYTE(v7) = 0;
      goto LABEL_42;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
LABEL_16:
    uint64_t v4 = 0;
    char v5 = 1;
    goto LABEL_17;
  }
  uint64_t v4 = (uint64_t)objc_msgSend((id)v28, sel_integerValue);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  char v5 = 0;
LABEL_17:
  LOBYTE(v8) = v5 & 1;
  Swift::Int v6 = v4;
LABEL_68:
  result.is_nil = v8;
  result.value = v6;
  return result;
}

uint64_t UUID.init(node:)()
{
  uint64_t v0 = sub_226C33618();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C33608();
  return UUID.init(base:node:)((uint64_t)v2);
}

uint64_t UUID.init(base:node:)(uint64_t a1)
{
  sub_226C335F8();
  sub_226C335E8();
  uint64_t v2 = sub_226C33618();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t UUID.init(upper64:lower64:)()
{
  return sub_226C335E8();
}

unint64_t UUID.upper64.getter()
{
  return bswap64(sub_226C335F8());
}

unint64_t UUID.lower64.getter()
{
  sub_226C335F8();
  return bswap64(v0);
}

uint64_t OS_xpc_object.nestedDescription.getter()
{
  uint64_t v1 = (void *)MEMORY[0x22A665ED0](v0);
  sub_226C33A38();
  free(v1);
  sub_226C1D3D4();
  uint64_t v2 = sub_226C33E18();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_226C1ADA0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_226C1ADC8(uint64_t a1)
{
  return sub_226C0DB0C(a1, v1);
}

uint64_t sub_226C1ADD0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 32);
  sub_226C34118();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 40);
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_226C1B044((uint64_t)v8), (v6 & 1) != 0))
  {
    sub_226C06F78(*(void *)(v4 + 56) + 32 * v5, (uint64_t)a1);
  }
  else
  {
    *a1 = 0u;
    a1[1] = 0u;
  }
  swift_endAccess();
  return sub_226C1FBE8((uint64_t)v8);
}

uint64_t sub_226C1AE70(uint64_t a1, int *a2)
{
  char v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_226C1AF4C;
  return v6(a1);
}

uint64_t sub_226C1AF4C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_226C1B044(uint64_t a1)
{
  uint64_t v2 = sub_226C33EF8();
  return sub_226C1B088(a1, v2);
}

unint64_t sub_226C1B088(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_226C1FC3C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A665020](v9, a1);
      sub_226C1FBE8((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

size_t sub_226C1B150(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156E18);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156E10) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  Swift::Int_optional result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156E10) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_226C1B32C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CEF8);
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
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_226C1B418(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CF00);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

double sub_226C1B51C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_226C1B044(a1);
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
      sub_226C1BCC4();
      uint64_t v9 = v11;
    }
    sub_226C1FBE8(*(void *)(v9 + 48) + 40 * v6);
    sub_226C07014((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_226C1B930(v6, v9);
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

uint64_t sub_226C1B618(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156E08);
  uint64_t v6 = sub_226C340E8();
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
    uint64_t v22 = (void *)(v5 + 64);
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
      sub_226C07014((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_226C1FC3C(v25, (uint64_t)&v38);
      sub_226C06F78(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_226C33EF8();
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
    uint64_t result = (uint64_t)sub_226C07014(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_226C1B930(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_226C33EE8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_226C1FC3C(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        uint64_t v10 = sub_226C33EF8();
        uint64_t result = sub_226C1FBE8((uint64_t)v28);
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
    uint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *uint64_t v22 = v24 & v23;
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

_OWORD *sub_226C1BAFC(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_226C1B044(a2);
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
      sub_226C1BCC4();
      goto LABEL_7;
    }
    sub_226C1B618(v13, a3 & 1);
    unint64_t v19 = sub_226C1B044(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_226C1FC3C(a2, (uint64_t)v21);
      return sub_226C1BC48(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_226C342B8();
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
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  return sub_226C07014(a1, v17);
}

_OWORD *sub_226C1BC48(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_226C07014(a3, (_OWORD *)(a4[7] + 32 * a1));
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

void *sub_226C1BCC4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156E08);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226C340D8();
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
    sub_226C1FC3C(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_226C06F78(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_226C07014(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
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

unint64_t sub_226C1BEAC(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x22A665D40](&v3, 8);
    uint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x22A665D40](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unsigned __int8 *sub_226C1BF38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_226C33AC8();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_226C1C29C();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_226C33F98();
  }
LABEL_7:
  uint64_t v11 = sub_226C1C020(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_226C1C020(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_226C1C29C()
{
  unint64_t v0 = sub_226C33AD8();
  uint64_t v4 = sub_226C1C31C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_226C1C31C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_226C1C474(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_226C1C574(v9, 0);
      unint64_t v12 = sub_226C1C5DC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_226C33F98();
LABEL_4:
        JUMPOUT(0x22A664AF0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x22A664AF0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22A664AF0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_226C1C474(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_226C1C7F0(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_226C1C7F0(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *sub_226C1C574(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CEF8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_226C1C5DC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    _OWORD v9[2] = a6;
    v9[3] = a7;
    void v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_226C1C7F0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_226C33A88();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_226C33F98();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_226C1C7F0(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_226C33A58();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_226C1C7F0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_226C33A98();
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
    uint64_t v5 = MEMORY[0x22A664B80](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_226C1C86C(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  size_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = (void *)sub_226C1B150(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156E10) - 8);
  unint64_t v13 = (char *)v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * v6;
  uint64_t v16 = &v13[v14 * v6];
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_24;
  }
  uint64_t v17 = v4[2];
  if (__OFSUB__(v17, a2)) {
    goto LABEL_30;
  }
  if (v15 < v14 * a2 || v16 >= &v13[v14 * a2 + (v17 - a2) * v14])
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v15 != v14 * a2)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  uint64_t v19 = v4[2];
  BOOL v20 = __OFADD__(v19, v8);
  uint64_t v21 = v19 - v7;
  if (!v20)
  {
    v4[2] = v21;
LABEL_24:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t _s14CoreUtilsSwift11CUIPAddressO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v26 = sub_226C337E8();
  uint64_t v2 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226C337A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CUIPAddress();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v25 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156DE8);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  unint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (uint64_t)&v18[*(int *)(v16 + 56)];
  sub_226C1D370(v27, (uint64_t)v18);
  sub_226C1D370(v28, v19);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_226C1D370((uint64_t)v18, (uint64_t)v12);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = v26;
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v4, v19, v26);
      char v21 = MEMORY[0x22A6648F0](v12, v4);
      uint64_t v22 = *(void (**)(char *, uint64_t))(v2 + 8);
      v22(v4, v20);
      v22(v12, v20);
LABEL_9:
      sub_226C1E09C((uint64_t)v18);
      return v21 & 1;
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v12, v26);
  }
  else
  {
    sub_226C1D370((uint64_t)v18, (uint64_t)v14);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v19, v5);
      char v21 = MEMORY[0x22A6648B0](v14, v8);
      unint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
      v23(v8, v5);
      v23(v14, v5);
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  }
  sub_226C088D0((uint64_t)v18, &qword_268156DE8);
  char v21 = 0;
  return v21 & 1;
}

BOOL _s14CoreUtilsSwift12CUMACAddressV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint8x8_t a3, uint8x8_t a4)
{
  BOOL result = 0;
  a3.i32[0] = *(_DWORD *)a1;
  a4.i32[0] = *(_DWORD *)a2;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vceq_s16((int16x4_t)*(_OWORD *)&vmovl_u8(a3), (int16x4_t)*(_OWORD *)&vmovl_u8(a4)), 0xFuLL))) & 1) != 0&& *(unsigned __int8 *)(a1 + 4) == *(unsigned __int8 *)(a2 + 4))
  {
    return *(unsigned __int8 *)(a1 + 5) == *(unsigned __int8 *)(a2 + 5);
  }
  return result;
}

uint64_t sub_226C1CDD0(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  sub_226C1FE08();
  os_unfair_lock_unlock(v3 + 4);
  swift_release();
  return sub_226C088D0(a1, &qword_268156C60);
}

uint64_t sub_226C1CE70(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  *(_DWORD *)(v5 + 48) = -1;
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 40) = a2;
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_226C1CFF4(0);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  v12[4] = sub_226C1FAB8;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_226C0E324;
  v12[3] = &block_descriptor;
  uint64_t v8 = _Block_copy(v12);
  uint64_t v9 = a3;
  swift_release();
  uint64_t v10 = sub_226C339C8();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  notify_register_dispatch((const char *)(v10 + 32), (int *)(v5 + 48), v9, v8);
  swift_endAccess();
  swift_release();

  swift_release();
  _Block_release(v8);
  return v5;
}

uint64_t sub_226C1CFF4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_226C1D004(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156BA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226C1D070(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[5];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_226C01AFC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268156CD8 + dword_268156CD8);
  return v8(a1, v4, v5, v6);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_226C1D190(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[5];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_226C02D20;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268156CE8 + dword_268156CE8);
  return v8(a1, v4, v5, v6);
}

uint64_t type metadata accessor for CUTask()
{
  return __swift_instantiateGenericMetadata();
}

id CUTrafficFlagsToString()
{
  uint64_t v0 = CUPrintFlags();
  return v0;
}

uint64_t type metadata accessor for CUIPAddress()
{
  uint64_t result = qword_268158400;
  if (!qword_268158400) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_226C1D30C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CUIPAddress();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226C1D370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CUIPAddress();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_226C1D3D4()
{
  unint64_t result = qword_268156D20;
  if (!qword_268156D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156D20);
  }
  return result;
}

uint64_t sub_226C1D428(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_226C1D4EC(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_226C1D428(__src, &__src[a2]);
  }
  sub_226C33558();
  swift_allocObject();
  sub_226C33518();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_226C335C8();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_226C1D5A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_226C1D5F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_226C1D650(uint64_t a1, void *a2)
{
  return sub_226C148A0(a1, a2, v2[6], v2[7], v2[8], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_226C1D694(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_226C1D6D8()
{
  unint64_t result = qword_268156D68;
  if (!qword_268156D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156D68);
  }
  return result;
}

uint64_t sub_226C1D72C(uint64_t a1, uint64_t *a2)
{
  return sub_226C14FF8(a1, a2, v2[6], v2[7], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_226C1D760(uint64_t a1, uint64_t a2)
{
  return sub_226C155E0(a1, a2, v2[6], v2[7], v2[2], v2[3], v2[4]);
}

uint64_t sub_226C1D784(uint64_t a1, uint64_t a2)
{
  return sub_226C15A1C(a1, a2, *(void *)(v2 + 48), *(void *)(v2 + 16));
}

unint64_t sub_226C1D7A8()
{
  unint64_t result = qword_26AD6CEF0;
  if (!qword_26AD6CEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6CEF0);
  }
  return result;
}

unint64_t sub_226C1D7FC()
{
  unint64_t result = qword_268156D70;
  if (!qword_268156D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156D70);
  }
  return result;
}

unint64_t sub_226C1D850()
{
  unint64_t result = qword_268156D78;
  if (!qword_268156D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156D78);
  }
  return result;
}

uint64_t sub_226C1D8A4()
{
  return 24;
}

__n128 sub_226C1D8B0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_226C1D8C4(uint64_t a1)
{
  return MEMORY[0x270FA0310](a1, *(void *)(v1 + 32));
}

uint64_t sub_226C1D8CC()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 32);
  sub_226C33F48();
  sub_226C33A28();
  sub_226C33DD8();
  sub_226C34488();
  sub_226C33A28();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_226C33A28();
  v1(v2);
  sub_226C33A28();
  swift_bridgeObjectRelease();
  sub_226C33A28();
  return 0;
}

const char *CUPairingSetupCodeTypeToString(unsigned int a1)
{
  if (a1 > 8) {
    return "?";
  }
  else {
    return off_2647D3F90[a1];
  }
}

uint64_t type metadata accessor for PThread.ClosureWrapper()
{
  return self;
}

uint64_t sub_226C1D9FC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_226C1DA38(uint64_t a1, uint64_t a2)
{
  return sub_226C1DAF0(&qword_268156DA0, a2, (void (*)(uint64_t))type metadata accessor for CUDispatchTaskExecutor);
}

uint64_t type metadata accessor for CUDispatchTaskExecutor()
{
  return self;
}

uint64_t sub_226C1DAA4()
{
  return sub_226C1DAF0(&qword_268156DA8, 255, (void (*)(uint64_t))type metadata accessor for CUIPAddress);
}

uint64_t sub_226C1DAF0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_226C1DB3C()
{
  unint64_t result = qword_268156DB0;
  if (!qword_268156DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156DB0);
  }
  return result;
}

uint64_t sub_226C1DB90()
{
  return swift_getWitnessTable();
}

uint64_t sub_226C1DBAC()
{
  return 16;
}

__n128 sub_226C1DBB8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_226C1DBC4()
{
  return 8;
}

void *sub_226C1DBD0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

ValueMetadata *type metadata accessor for CUConstants()
{
  return &type metadata for CUConstants;
}

uint64_t type metadata accessor for CUAsyncSemaphore()
{
  return self;
}

uint64_t method lookup function for CUAsyncSemaphore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUAsyncSemaphore);
}

uint64_t dispatch thunk of CUAsyncSemaphore.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for CUDarwinNotification()
{
  return self;
}

uint64_t method lookup function for CUDarwinNotification(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUDarwinNotification);
}

uint64_t dispatch thunk of CUDarwinNotification.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of CUDarwinNotification.__allocating_init(name:dispatchQueue:handler:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for CUDispatchTaskExecutor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUDispatchTaskExecutor);
}

uint64_t dispatch thunk of CUDispatchTaskExecutor.__allocating_init(dispatchQueue:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CUKeyPathModifiable.set<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of CUKeyPathModifiable.setIfNonNil<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_226C1DCF8()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for CUTask(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUTask);
}

uint64_t dispatch thunk of CUTask.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of CUTask.__allocating_init(_:cancelOnDeinit:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t *initializeBufferWithCopyOfBuffer for CUIPAddress(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = sub_226C337E8();
    }
    else {
      uint64_t v6 = sub_226C337A8();
    }
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CUIPAddress(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = sub_226C337E8();
  }
  else {
    uint64_t v2 = sub_226C337A8();
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for CUIPAddress(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = sub_226C337E8();
  }
  else {
    uint64_t v4 = sub_226C337A8();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for CUIPAddress(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_226C1E09C(a1);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = sub_226C337E8();
    }
    else {
      uint64_t v4 = sub_226C337A8();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_226C1E09C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CUIPAddress();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for CUIPAddress(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = sub_226C337E8();
  }
  else {
    uint64_t v4 = sub_226C337A8();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for CUIPAddress(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_226C1E09C(a1);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = sub_226C337E8();
    }
    else {
      uint64_t v4 = sub_226C337A8();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CUIPAddress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for CUIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_226C1E2B4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_226C1E2C4()
{
  uint64_t result = sub_226C337A8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_226C337E8();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CUMACAddress(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 6)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CUMACAddress(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 6) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CUMACAddress()
{
  return &type metadata for CUMACAddress;
}

uint64_t sub_226C1E3E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_226C1E3EC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_226C1E47C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *char v3 = *a2;
    char v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_226C1E534(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_226C1E560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_226C1E5B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_226C1E600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_226C1E650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_226C1E6A0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_226C1E7FC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x226C1EA14);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for CUSendableWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_226C1EA58(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t sub_226C1EA84(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t sub_226C1EAB0(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t sub_226C1EADC(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t sub_226C1EB08(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 8)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_226C1EB4C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for CUWeakBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of CUAnyOptional.cuIsNil.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for OSUnfairLock()
{
  return self;
}

uint64_t method lookup function for OSUnfairLock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for OSUnfairLock);
}

uint64_t dispatch thunk of OSUnfairLock.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of OSUnfairLock.lock()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of OSUnfairLock.unlock()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of OSUnfairLock.runLocked<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t type metadata accessor for PThread()
{
  return self;
}

uint64_t method lookup function for PThread(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PThread);
}

uint64_t dispatch thunk of PThread.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static PThread.exit()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of PThread.exit()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of PThread.detach()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of PThread.join()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t type metadata accessor for PThreadMutex()
{
  return self;
}

uint64_t method lookup function for PThreadMutex(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PThreadMutex);
}

uint64_t dispatch thunk of PThreadMutex.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PThreadMutex.lock()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of PThreadMutex.unlock()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of PThreadMutex.runLocked<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

ValueMetadata *type metadata accessor for StdErrTextStream()
{
  return &type metadata for StdErrTextStream;
}

ValueMetadata *type metadata accessor for StdOutTextStream()
{
  return &type metadata for StdOutTextStream;
}

uint64_t sub_226C1EE58(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_226C1EE78(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 64) = v3;
  return result;
}

void type metadata accessor for _opaque_pthread_mutex_t(uint64_t a1)
{
}

void *__swift_memcpy8192_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x2000uLL);
}

uint64_t sub_226C1EED0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 0x2000)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_226C1EEF4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8184) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 4344) = 0u;
    *(_OWORD *)(result + 4328) = 0u;
    *(_OWORD *)(result + 4312) = 0u;
    *(_OWORD *)(result + 4296) = 0u;
    *(_OWORD *)(result + 4280) = 0u;
    *(_OWORD *)(result + 4264) = 0u;
    *(_OWORD *)(result + 4248) = 0u;
    *(_OWORD *)(result + 4232) = 0u;
    *(_OWORD *)(result + 4216) = 0u;
    *(_OWORD *)(result + 4200) = 0u;
    *(_OWORD *)(result + 4184) = 0u;
    *(_OWORD *)(result + 4168) = 0u;
    *(_OWORD *)(result + 4152) = 0u;
    *(_OWORD *)(result + 4136) = 0u;
    *(_OWORD *)(result + 4120) = 0u;
    *(_OWORD *)(result + 4104) = 0u;
    *(_OWORD *)(result + 4088) = 0u;
    *(_OWORD *)(result + 4072) = 0u;
    *(_OWORD *)(result + 4056) = 0u;
    *(_OWORD *)(result + 4040) = 0u;
    *(_OWORD *)(result + 4024) = 0u;
    *(_OWORD *)(result + 4008) = 0u;
    *(_OWORD *)(result + 3992) = 0u;
    *(_OWORD *)(result + 3976) = 0u;
    *(_OWORD *)(result + 3960) = 0u;
    *(_OWORD *)(result + 3944) = 0u;
    *(_OWORD *)(result + 3928) = 0u;
    *(_OWORD *)(result + 3912) = 0u;
    *(_OWORD *)(result + 3896) = 0u;
    *(_OWORD *)(result + 3880) = 0u;
    *(_OWORD *)(result + 3864) = 0u;
    *(_OWORD *)(result + 3848) = 0u;
    *(_OWORD *)(result + 3832) = 0u;
    *(_OWORD *)(result + 3816) = 0u;
    *(_OWORD *)(result + 3800) = 0u;
    *(_OWORD *)(result + 3784) = 0u;
    *(_OWORD *)(result + 3768) = 0u;
    *(_OWORD *)(result + 3752) = 0u;
    *(_OWORD *)(result + 3736) = 0u;
    *(_OWORD *)(result + 3720) = 0u;
    *(_OWORD *)(result + 3704) = 0u;
    *(_OWORD *)(result + 3688) = 0u;
    *(_OWORD *)(result + 3672) = 0u;
    *(_OWORD *)(result + 3656) = 0u;
    *(_OWORD *)(result + 3640) = 0u;
    *(_OWORD *)(result + 3624) = 0u;
    *(_OWORD *)(result + 3608) = 0u;
    *(_OWORD *)(result + 3592) = 0u;
    *(_OWORD *)(result + 3576) = 0u;
    *(_OWORD *)(result + 3560) = 0u;
    *(_OWORD *)(result + 3544) = 0u;
    *(_OWORD *)(result + 3528) = 0u;
    *(_OWORD *)(result + 3512) = 0u;
    *(_OWORD *)(result + 3496) = 0u;
    *(_OWORD *)(result + 3480) = 0u;
    *(_OWORD *)(result + 3464) = 0u;
    *(_OWORD *)(result + 3448) = 0u;
    *(_OWORD *)(result + 3432) = 0u;
    *(_OWORD *)(result + 3416) = 0u;
    *(_OWORD *)(result + 3400) = 0u;
    *(_OWORD *)(result + 3384) = 0u;
    *(_OWORD *)(result + 3368) = 0u;
    *(_OWORD *)(result + 3352) = 0u;
    *(_OWORD *)(result + 3336) = 0u;
    *(_OWORD *)(result + 3320) = 0u;
    *(_OWORD *)(result + 3304) = 0u;
    *(_OWORD *)(result + 3288) = 0u;
    *(_OWORD *)(result + 3272) = 0u;
    *(_OWORD *)(result + 3256) = 0u;
    *(_OWORD *)(result + 3240) = 0u;
    *(_OWORD *)(result + 3224) = 0u;
    *(_OWORD *)(result + 3208) = 0u;
    *(_OWORD *)(result + 3192) = 0u;
    *(_OWORD *)(result + 3176) = 0u;
    *(_OWORD *)(result + 3160) = 0u;
    *(_OWORD *)(result + 3144) = 0u;
    *(_OWORD *)(result + 3128) = 0u;
    *(_OWORD *)(result + 3112) = 0u;
    *(_OWORD *)(result + 3096) = 0u;
    *(_OWORD *)(result + 3080) = 0u;
    *(_OWORD *)(result + 3064) = 0u;
    *(_OWORD *)(result + 3048) = 0u;
    *(_OWORD *)(result + 3032) = 0u;
    *(_OWORD *)(result + 3016) = 0u;
    *(_OWORD *)(result + 3000) = 0u;
    *(_OWORD *)(result + 2984) = 0u;
    *(_OWORD *)(result + 2968) = 0u;
    *(_OWORD *)(result + 2952) = 0u;
    *(_OWORD *)(result + 2936) = 0u;
    *(_OWORD *)(result + 2920) = 0u;
    *(_OWORD *)(result + 2904) = 0u;
    *(_OWORD *)(result + 2888) = 0u;
    *(_OWORD *)(result + 2872) = 0u;
    *(_OWORD *)(result + 2856) = 0u;
    *(_OWORD *)(result + 2840) = 0u;
    *(_OWORD *)(result + 2824) = 0u;
    *(_OWORD *)(result + 2808) = 0u;
    *(_OWORD *)(result + 2792) = 0u;
    *(_OWORD *)(result + 2776) = 0u;
    *(_OWORD *)(result + 2760) = 0u;
    *(_OWORD *)(result + 2744) = 0u;
    *(_OWORD *)(result + 2728) = 0u;
    *(_OWORD *)(result + 2712) = 0u;
    *(_OWORD *)(result + 2696) = 0u;
    *(_OWORD *)(result + 2680) = 0u;
    *(_OWORD *)(result + 2664) = 0u;
    *(_OWORD *)(result + 2648) = 0u;
    *(_OWORD *)(result + 2632) = 0u;
    *(_OWORD *)(result + 2616) = 0u;
    *(_OWORD *)(result + 2600) = 0u;
    *(_OWORD *)(result + 2584) = 0u;
    *(_OWORD *)(result + 2568) = 0u;
    *(_OWORD *)(result + 2552) = 0u;
    *(_OWORD *)(result + 2536) = 0u;
    *(_OWORD *)(result + 2520) = 0u;
    *(_OWORD *)(result + 2504) = 0u;
    *(_OWORD *)(result + 2488) = 0u;
    *(_OWORD *)(result + 2472) = 0u;
    *(_OWORD *)(result + 2456) = 0u;
    *(_OWORD *)(result + 2440) = 0u;
    *(_OWORD *)(result + 2424) = 0u;
    *(_OWORD *)(result + 2408) = 0u;
    *(_OWORD *)(result + 2392) = 0u;
    *(_OWORD *)(result + 2376) = 0u;
    *(_OWORD *)(result + 2360) = 0u;
    *(_OWORD *)(result + 2344) = 0u;
    *(_OWORD *)(result + 2328) = 0u;
    *(_OWORD *)(result + 2312) = 0u;
    *(_OWORD *)(result + 2296) = 0u;
    *(_OWORD *)(result + 2280) = 0u;
    *(_OWORD *)(result + 2264) = 0u;
    *(_OWORD *)(result + 2248) = 0u;
    *(_OWORD *)(result + 2232) = 0u;
    *(_OWORD *)(result + 2216) = 0u;
    *(_OWORD *)(result + 2200) = 0u;
    *(_OWORD *)(result + 2184) = 0u;
    *(_OWORD *)(result + 2168) = 0u;
    *(_OWORD *)(result + 2152) = 0u;
    *(_OWORD *)(result + 2136) = 0u;
    *(_OWORD *)(result + 2120) = 0u;
    *(_OWORD *)(result + 2104) = 0u;
    *(_OWORD *)(result + 2088) = 0u;
    *(_OWORD *)(result + 2072) = 0u;
    *(_OWORD *)(result + 2056) = 0u;
    *(_OWORD *)(result + 2040) = 0u;
    *(_OWORD *)(result + 2024) = 0u;
    *(_OWORD *)(result + 2008) = 0u;
    *(_OWORD *)(result + 1992) = 0u;
    *(_OWORD *)(result + 1976) = 0u;
    *(_OWORD *)(result + 1960) = 0u;
    *(_OWORD *)(result + 1944) = 0u;
    *(_OWORD *)(result + 1928) = 0u;
    *(_OWORD *)(result + 1912) = 0u;
    *(_OWORD *)(result + 1896) = 0u;
    *(_OWORD *)(result + 1880) = 0u;
    *(_OWORD *)(result + 1864) = 0u;
    *(_OWORD *)(result + 1848) = 0u;
    *(_OWORD *)(result + 1832) = 0u;
    *(_OWORD *)(result + 1816) = 0u;
    *(_OWORD *)(result + 1800) = 0u;
    *(_OWORD *)(result + 1784) = 0u;
    *(_OWORD *)(result + 1768) = 0u;
    *(_OWORD *)(result + 1752) = 0u;
    *(_OWORD *)(result + 1736) = 0u;
    *(_OWORD *)(result + 1720) = 0u;
    *(_OWORD *)(result + 1704) = 0u;
    *(_OWORD *)(result + 1688) = 0u;
    *(_OWORD *)(result + 1672) = 0u;
    *(_OWORD *)(result + 1656) = 0u;
    *(_OWORD *)(result + 1640) = 0u;
    *(_OWORD *)(result + 1624) = 0u;
    *(_OWORD *)(result + 1608) = 0u;
    *(_OWORD *)(result + 1592) = 0u;
    *(_OWORD *)(result + 1576) = 0u;
    *(_OWORD *)(result + 1560) = 0u;
    *(_OWORD *)(result + 1544) = 0u;
    *(_OWORD *)(result + 1528) = 0u;
    *(_OWORD *)(result + 1512) = 0u;
    *(_OWORD *)(result + 1496) = 0u;
    *(_OWORD *)(result + 1480) = 0u;
    *(_OWORD *)(result + 1464) = 0u;
    *(_OWORD *)(result + 1448) = 0u;
    *(_OWORD *)(result + 1432) = 0u;
    *(_OWORD *)(result + 1416) = 0u;
    *(_OWORD *)(result + 1400) = 0u;
    *(_OWORD *)(result + 1384) = 0u;
    *(_OWORD *)(result + 1368) = 0u;
    *(_OWORD *)(result + 1352) = 0u;
    *(_OWORD *)(result + 1336) = 0u;
    *(_OWORD *)(result + 1320) = 0u;
    *(_OWORD *)(result + 1304) = 0u;
    *(_OWORD *)(result + 1288) = 0u;
    *(_OWORD *)(result + 1272) = 0u;
    *(_OWORD *)(result + 1256) = 0u;
    *(_OWORD *)(result + 1240) = 0u;
    *(_OWORD *)(result + 1224) = 0u;
    *(_OWORD *)(result + 1208) = 0u;
    *(_OWORD *)(result + 1192) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 8168) = 0u;
    *(_OWORD *)(result + 8152) = 0u;
    *(_OWORD *)(result + 8136) = 0u;
    *(_OWORD *)(result + 8120) = 0u;
    *(_OWORD *)(result + 8104) = 0u;
    *(_OWORD *)(result + 8088) = 0u;
    *(_OWORD *)(result + 8072) = 0u;
    *(_OWORD *)(result + 8056) = 0u;
    *(_OWORD *)(result + 8040) = 0u;
    *(_OWORD *)(result + 8024) = 0u;
    *(_OWORD *)(result + 8008) = 0u;
    *(_OWORD *)(result + 7992) = 0u;
    *(_OWORD *)(result + 7976) = 0u;
    *(_OWORD *)(result + 7960) = 0u;
    *(_OWORD *)(result + 7944) = 0u;
    *(_OWORD *)(result + 7928) = 0u;
    *(_OWORD *)(result + 7912) = 0u;
    *(_OWORD *)(result + 7896) = 0u;
    *(_OWORD *)(result + 7880) = 0u;
    *(_OWORD *)(result + 7864) = 0u;
    *(_OWORD *)(result + 7848) = 0u;
    *(_OWORD *)(result + 7832) = 0u;
    *(_OWORD *)(result + 7816) = 0u;
    *(_OWORD *)(result + 7800) = 0u;
    *(_OWORD *)(result + 7784) = 0u;
    *(_OWORD *)(result + 7768) = 0u;
    *(_OWORD *)(result + 7752) = 0u;
    *(_OWORD *)(result + 7736) = 0u;
    *(_OWORD *)(result + 7720) = 0u;
    *(_OWORD *)(result + 7704) = 0u;
    *(_OWORD *)(result + 7688) = 0u;
    *(_OWORD *)(result + 7672) = 0u;
    *(_OWORD *)(result + 7656) = 0u;
    *(_OWORD *)(result + 7640) = 0u;
    *(_OWORD *)(result + 7624) = 0u;
    *(_OWORD *)(result + 7608) = 0u;
    *(_OWORD *)(result + 7592) = 0u;
    *(_OWORD *)(result + 7576) = 0u;
    *(_OWORD *)(result + 7560) = 0u;
    *(_OWORD *)(result + 7544) = 0u;
    *(_OWORD *)(result + 7528) = 0u;
    *(_OWORD *)(result + 7512) = 0u;
    *(_OWORD *)(result + 7496) = 0u;
    *(_OWORD *)(result + 7480) = 0u;
    *(_OWORD *)(result + 7464) = 0u;
    *(_OWORD *)(result + 7448) = 0u;
    *(_OWORD *)(result + 7432) = 0u;
    *(_OWORD *)(result + 7416) = 0u;
    *(_OWORD *)(result + 7400) = 0u;
    *(_OWORD *)(result + 7384) = 0u;
    *(_OWORD *)(result + 7368) = 0u;
    *(_OWORD *)(result + 7352) = 0u;
    *(_OWORD *)(result + 7336) = 0u;
    *(_OWORD *)(result + 7320) = 0u;
    *(_OWORD *)(result + 7304) = 0u;
    *(_OWORD *)(result + 7288) = 0u;
    *(_OWORD *)(result + 7272) = 0u;
    *(_OWORD *)(result + 7256) = 0u;
    *(_OWORD *)(result + 7240) = 0u;
    *(_OWORD *)(result + 7224) = 0u;
    *(_OWORD *)(result + 7208) = 0u;
    *(_OWORD *)(result + 7192) = 0u;
    *(_OWORD *)(result + 7176) = 0u;
    *(_OWORD *)(result + 7160) = 0u;
    *(_OWORD *)(result + 7144) = 0u;
    *(_OWORD *)(result + 7128) = 0u;
    *(_OWORD *)(result + 7112) = 0u;
    *(_OWORD *)(result + 7096) = 0u;
    *(_OWORD *)(result + 7080) = 0u;
    *(_OWORD *)(result + 7064) = 0u;
    *(_OWORD *)(result + 7048) = 0u;
    *(_OWORD *)(result + 7032) = 0u;
    *(_OWORD *)(result + 7016) = 0u;
    *(_OWORD *)(result + 7000) = 0u;
    *(_OWORD *)(result + 6984) = 0u;
    *(_OWORD *)(result + 6968) = 0u;
    *(_OWORD *)(result + 6952) = 0u;
    *(_OWORD *)(result + 6936) = 0u;
    *(_OWORD *)(result + 6920) = 0u;
    *(_OWORD *)(result + 6904) = 0u;
    *(_OWORD *)(result + 6888) = 0u;
    *(_OWORD *)(result + 6872) = 0u;
    *(_OWORD *)(result + 6856) = 0u;
    *(_OWORD *)(result + 6840) = 0u;
    *(_OWORD *)(result + 6824) = 0u;
    *(_OWORD *)(result + 6808) = 0u;
    *(_OWORD *)(result + 6792) = 0u;
    *(_OWORD *)(result + 6776) = 0u;
    *(_OWORD *)(result + 6760) = 0u;
    *(_OWORD *)(result + 6744) = 0u;
    *(_OWORD *)(result + 6728) = 0u;
    *(_OWORD *)(result + 6712) = 0u;
    *(_OWORD *)(result + 6696) = 0u;
    *(_OWORD *)(result + 6680) = 0u;
    *(_OWORD *)(result + 6664) = 0u;
    *(_OWORD *)(result + 6648) = 0u;
    *(_OWORD *)(result + 6632) = 0u;
    *(_OWORD *)(result + 6616) = 0u;
    *(_OWORD *)(result + 6600) = 0u;
    *(_OWORD *)(result + 6584) = 0u;
    *(_OWORD *)(result + 6568) = 0u;
    *(_OWORD *)(result + 6552) = 0u;
    *(_OWORD *)(result + 6536) = 0u;
    *(_OWORD *)(result + 6520) = 0u;
    *(_OWORD *)(result + 6504) = 0u;
    *(_OWORD *)(result + 6488) = 0u;
    *(_OWORD *)(result + 6472) = 0u;
    *(_OWORD *)(result + 6456) = 0u;
    *(_OWORD *)(result + 6440) = 0u;
    *(_OWORD *)(result + 6424) = 0u;
    *(_OWORD *)(result + 6408) = 0u;
    *(_OWORD *)(result + 6392) = 0u;
    *(_OWORD *)(result + 6376) = 0u;
    *(_OWORD *)(result + 6360) = 0u;
    *(_OWORD *)(result + 6344) = 0u;
    *(_OWORD *)(result + 6328) = 0u;
    *(_OWORD *)(result + 6312) = 0u;
    *(_OWORD *)(result + 6296) = 0u;
    *(_OWORD *)(result + 6280) = 0u;
    *(_OWORD *)(result + 6264) = 0u;
    *(_OWORD *)(result + 6248) = 0u;
    *(_OWORD *)(result + 6232) = 0u;
    *(_OWORD *)(result + 6216) = 0u;
    *(_OWORD *)(result + 6200) = 0u;
    *(_OWORD *)(result + 6184) = 0u;
    *(_OWORD *)(result + 6168) = 0u;
    *(_OWORD *)(result + 6152) = 0u;
    *(_OWORD *)(result + 6136) = 0u;
    *(_OWORD *)(result + 6120) = 0u;
    *(_OWORD *)(result + 6104) = 0u;
    *(_OWORD *)(result + 6088) = 0u;
    *(_OWORD *)(result + 6072) = 0u;
    *(_OWORD *)(result + 6056) = 0u;
    *(_OWORD *)(result + 6040) = 0u;
    *(_OWORD *)(result + 6024) = 0u;
    *(_OWORD *)(result + 6008) = 0u;
    *(_OWORD *)(result + 5992) = 0u;
    *(_OWORD *)(result + 5976) = 0u;
    *(_OWORD *)(result + 5960) = 0u;
    *(_OWORD *)(result + 5944) = 0u;
    *(_OWORD *)(result + 5928) = 0u;
    *(_OWORD *)(result + 5912) = 0u;
    *(_OWORD *)(result + 5896) = 0u;
    *(_OWORD *)(result + 5880) = 0u;
    *(_OWORD *)(result + 5864) = 0u;
    *(_OWORD *)(result + 5848) = 0u;
    *(_OWORD *)(result + 5832) = 0u;
    *(_OWORD *)(result + 5816) = 0u;
    *(_OWORD *)(result + 5800) = 0u;
    *(_OWORD *)(result + 5784) = 0u;
    *(_OWORD *)(result + 5768) = 0u;
    *(_OWORD *)(result + 5752) = 0u;
    *(_OWORD *)(result + 5736) = 0u;
    *(_OWORD *)(result + 5720) = 0u;
    *(_OWORD *)(result + 5704) = 0u;
    *(_OWORD *)(result + 5688) = 0u;
    *(_OWORD *)(result + 5672) = 0u;
    *(_OWORD *)(result + 5656) = 0u;
    *(_OWORD *)(result + 5640) = 0u;
    *(_OWORD *)(result + 5624) = 0u;
    *(_OWORD *)(result + 5608) = 0u;
    *(_OWORD *)(result + 5592) = 0u;
    *(_OWORD *)(result + 5576) = 0u;
    *(_OWORD *)(result + 5560) = 0u;
    *(_OWORD *)(result + 5544) = 0u;
    *(_OWORD *)(result + 5528) = 0u;
    *(_OWORD *)(result + 5512) = 0u;
    *(_OWORD *)(result + 5496) = 0u;
    *(_OWORD *)(result + 5480) = 0u;
    *(_OWORD *)(result + 5464) = 0u;
    *(_OWORD *)(result + 5448) = 0u;
    *(_OWORD *)(result + 5432) = 0u;
    *(_OWORD *)(result + 5416) = 0u;
    *(_OWORD *)(result + 5400) = 0u;
    *(_OWORD *)(result + 5384) = 0u;
    *(_OWORD *)(result + 5368) = 0u;
    *(_OWORD *)(result + 5352) = 0u;
    *(_OWORD *)(result + 5336) = 0u;
    *(_OWORD *)(result + 5320) = 0u;
    *(_OWORD *)(result + 5304) = 0u;
    *(_OWORD *)(result + 5288) = 0u;
    *(_OWORD *)(result + 5272) = 0u;
    *(_OWORD *)(result + 5256) = 0u;
    *(_OWORD *)(result + 5240) = 0u;
    *(_OWORD *)(result + 5224) = 0u;
    *(_OWORD *)(result + 5208) = 0u;
    *(_OWORD *)(result + 5192) = 0u;
    *(_OWORD *)(result + 5176) = 0u;
    *(_OWORD *)(result + 5160) = 0u;
    *(_OWORD *)(result + 5144) = 0u;
    *(_OWORD *)(result + 5128) = 0u;
    *(_OWORD *)(result + 5112) = 0u;
    *(_OWORD *)(result + 5096) = 0u;
    *(_OWORD *)(result + 5080) = 0u;
    *(_OWORD *)(result + 5064) = 0u;
    *(_OWORD *)(result + 5048) = 0u;
    *(_OWORD *)(result + 5032) = 0u;
    *(_OWORD *)(result + 5016) = 0u;
    *(_OWORD *)(result + 5000) = 0u;
    *(_OWORD *)(result + 4984) = 0u;
    *(_OWORD *)(result + 4968) = 0u;
    *(_OWORD *)(result + 4952) = 0u;
    *(_OWORD *)(result + 4936) = 0u;
    *(_OWORD *)(result + 4920) = 0u;
    *(_OWORD *)(result + 4904) = 0u;
    *(_OWORD *)(result + 4888) = 0u;
    *(_OWORD *)(result + 4872) = 0u;
    *(_OWORD *)(result + 4856) = 0u;
    *(_OWORD *)(result + 4840) = 0u;
    *(_OWORD *)(result + 4824) = 0u;
    *(_OWORD *)(result + 4808) = 0u;
    *(_OWORD *)(result + 4792) = 0u;
    *(_OWORD *)(result + 4776) = 0u;
    *(_OWORD *)(result + 4760) = 0u;
    *(_OWORD *)(result + 4744) = 0u;
    *(_OWORD *)(result + 4728) = 0u;
    *(_OWORD *)(result + 4712) = 0u;
    *(_OWORD *)(result + 4696) = 0u;
    *(_OWORD *)(result + 4680) = 0u;
    *(_OWORD *)(result + 4664) = 0u;
    *(_OWORD *)(result + 4648) = 0u;
    *(_OWORD *)(result + 4632) = 0u;
    *(_OWORD *)(result + 4616) = 0u;
    *(_OWORD *)(result + 4600) = 0u;
    *(_OWORD *)(result + 4584) = 0u;
    *(_OWORD *)(result + 4568) = 0u;
    *(_OWORD *)(result + 4552) = 0u;
    *(_OWORD *)(result + 4536) = 0u;
    *(_OWORD *)(result + 4520) = 0u;
    *(_OWORD *)(result + 4504) = 0u;
    *(_OWORD *)(result + 4488) = 0u;
    *(_OWORD *)(result + 4472) = 0u;
    *(_OWORD *)(result + 4456) = 0u;
    *(_OWORD *)(result + 4440) = 0u;
    *(_OWORD *)(result + 4424) = 0u;
    *(_OWORD *)(result + 4408) = 0u;
    *(_OWORD *)(result + 4392) = 0u;
    *(_OWORD *)(result + 4376) = 0u;
    *(_OWORD *)(result + 4360) = 0u;
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
  *(unsigned char *)(result + 0x2000) = v3;
  return result;
}

void type metadata accessor for _opaque_pthread_t(uint64_t a1)
{
}

void type metadata accessor for PairingSetupCodeType(uint64_t a1)
{
}

void type metadata accessor for CUTrafficFlags(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_226C1F82C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_226C33558();
  swift_allocObject();
  uint64_t result = sub_226C33518();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_226C1F8B0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_226C33558();
  swift_allocObject();
  uint64_t result = sub_226C33518();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_226C335C8();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

unint64_t sub_226C1F92C()
{
  unint64_t result = qword_268156DE0;
  if (!qword_268156DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156DE0);
  }
  return result;
}

uint64_t sub_226C1F980()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_226C1F9B8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unsigned int v5 = v2;
  v5[1] = sub_226C01AFC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268156DF8 + dword_268156DF8);
  return v6(a1, v4);
}

uint64_t sub_226C1FA80()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_226C1FAB8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = *(void (**)(uint64_t))(result + 16);
    if (v1)
    {
      sub_226C1FB50(*(void *)(result + 16));
      uint64_t v2 = swift_release();
      v1(v2);
      return sub_226C1CFF4((uint64_t)v1);
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_226C1FB50(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_226C1FB60()
{
  uint64_t v1 = *(void *)(v0 + 48);
  sub_226C34118();
  sub_226C1FC98(v1, (uint64_t)v3, &qword_268156C60);
  swift_beginAccess();
  sub_226C0DE3C((uint64_t)v3, (uint64_t)v4);
  return swift_endAccess();
}

uint64_t sub_226C1FBE8(uint64_t a1)
{
  return a1;
}

uint64_t sub_226C1FC3C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_226C1FC98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226C1FCFC(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
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

uint64_t sub_226C1FD58(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
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
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

void type metadata accessor for __darwin_pthread_handler_rec(uint64_t a1)
{
}

void sub_226C1FDC0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_226C1FE08()
{
  return sub_226C1ADA0();
}

void sub_226C1FE28()
{
  qword_26AD6CF38 = (uint64_t)&unk_26DAC5B30;
}

uint64_t *sub_226C1FE3C()
{
  if (qword_26AD6CF10 != -1) {
    swift_once();
  }
  return &qword_26AD6CF38;
}

void sub_226C1FE88()
{
  qword_2681592E0 = (uint64_t)&unk_26DAC5C50;
}

uint64_t *sub_226C1FE9C()
{
  if (qword_268158518 != -1) {
    swift_once();
  }
  return &qword_2681592E0;
}

void sub_226C1FEE8()
{
  qword_268158528 = 48;
  unk_268158530 = 0xE100000000000000;
  qword_268158538 = 25136;
  unk_268158540 = 0xE200000000000000;
  qword_268158548 = 2;
  byte_268158550 = 0;
}

uint64_t static PrintUtilsIntegerFormat.binary.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268158520 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_268158530;
  uint64_t v3 = qword_268158538;
  uint64_t v4 = unk_268158540;
  uint64_t v5 = qword_268158548;
  char v6 = byte_268158550;
  *(void *)a1 = qword_268158528;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_226C1FFA8()
{
  qword_268158560 = 0;
  *(void *)algn_268158568 = 0xE000000000000000;
  qword_268158570 = 0;
  unk_268158578 = 0xE000000000000000;
  qword_268158580 = 10;
  byte_268158588 = 0;
}

uint64_t static PrintUtilsIntegerFormat.decimal.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268158558 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_268158568;
  uint64_t v3 = qword_268158570;
  uint64_t v4 = unk_268158578;
  uint64_t v5 = qword_268158580;
  char v6 = byte_268158588;
  *(void *)a1 = qword_268158560;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_226C2005C()
{
  qword_268158598 = 48;
  unk_2681585A0 = 0xE100000000000000;
  qword_2681585A8 = 30768;
  unk_2681585B0 = 0xE200000000000000;
  qword_2681585B8 = 16;
  byte_2681585C0 = 0;
}

uint64_t static PrintUtilsIntegerFormat.hex.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268158590 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_2681585A0;
  uint64_t v3 = qword_2681585A8;
  uint64_t v4 = unk_2681585B0;
  uint64_t v5 = qword_2681585B8;
  char v6 = byte_2681585C0;
  *(void *)a1 = qword_268158598;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_226C2011C()
{
  qword_2681585D0 = 48;
  *(void *)algn_2681585D8 = 0xE100000000000000;
  qword_2681585E0 = 30768;
  unk_2681585E8 = 0xE200000000000000;
  qword_2681585F0 = 16;
  byte_2681585F8 = 1;
}

uint64_t static PrintUtilsIntegerFormat.HEX.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2681585C8 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_2681585D8;
  uint64_t v3 = qword_2681585E0;
  uint64_t v4 = unk_2681585E8;
  uint64_t v5 = qword_2681585F0;
  char v6 = byte_2681585F8;
  *(void *)a1 = qword_2681585D0;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_226C201E0()
{
  qword_268158608 = 48;
  unk_268158610 = 0xE100000000000000;
  qword_268158618 = 48;
  unk_268158620 = 0xE100000000000000;
  qword_268158628 = 8;
  byte_268158630 = 0;
}

uint64_t static PrintUtilsIntegerFormat.octal.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268158600 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_268158610;
  uint64_t v3 = qword_268158618;
  uint64_t v4 = unk_268158620;
  uint64_t v5 = qword_268158628;
  char v6 = byte_268158630;
  *(void *)a1 = qword_268158608;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

BOOL static PrintUtilsJustification.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PrintUtilsJustification.hash(into:)()
{
  return sub_226C34368();
}

BOOL sub_226C202E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t static DefaultStringInterpolation.PrintUtilsTimeDuration.== infix(_:_:)()
{
  return 1;
}

uint64_t DefaultStringInterpolation.PrintUtilsTimeDuration.hash(into:)()
{
  return sub_226C34368();
}

uint64_t DefaultStringInterpolation.PrintUtilsTimeDuration.hashValue.getter()
{
  return sub_226C34388();
}

uint64_t sub_226C20374()
{
  return 1;
}

uint64_t sub_226C2037C()
{
  return sub_226C34388();
}

uint64_t sub_226C203C0()
{
  return sub_226C34368();
}

uint64_t sub_226C203E8()
{
  return sub_226C34388();
}

unint64_t *DefaultStringInterpolation.appendInterpolation<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v88 = a4;
  unint64_t v6 = *(void *)(a4 + 24);
  uint64_t v77 = *(void *)(v6 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v74 = (char *)&v72 - v8;
  uint64_t v82 = *(void *)(a3 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v76 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v81 = (char *)&v72 - v11;
  swift_getAssociatedTypeWitness();
  unint64_t v87 = *(void *)(swift_getAssociatedConformanceWitness() + 16);
  uint64_t v12 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = swift_checkMetadataState();
  unint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v80 = (unint64_t)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v83 = (char *)&v72 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  char v21 = (char *)&v72 - v20;
  MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v72 - v22;
  uint64_t v86 = a1;
  unint64_t v84 = v6;
  sub_226C33C78();
  swift_getAssociatedConformanceWitness();
  if (sub_226C33E98())
  {
    swift_getAssociatedConformanceWitness();
    sub_226C34278();
    sub_226C341F8();
    swift_getAssociatedConformanceWitness();
    char v24 = sub_226C33948();
    uint64_t result = (unint64_t *)(*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v21, v13);
    if ((v24 & 1) == 0) {
      goto LABEL_70;
    }
  }
  uint64_t v85 = a3;
  if (sub_226C33E88() >= 64)
  {
    unint64_t v78 = (unint64_t)v23;
    unint64_t v79 = v14;
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v83, v23, v13);
    unint64_t v90 = -1;
    char v26 = sub_226C33E98();
    uint64_t v27 = sub_226C33E88();
    if (v26)
    {
      if (v27 > 64)
      {
LABEL_8:
        sub_226C210DC();
        sub_226C33E48();
        swift_getAssociatedConformanceWitness();
        uint64_t v28 = v83;
        char v29 = sub_226C33938();
        unint64_t v14 = v79;
        unint64_t v30 = (char *)(v79 + 8);
        char v31 = *(void (**)(char *, uint64_t))(v79 + 8);
        v31(v21, v13);
        v31(v28, v13);
        unint64_t v23 = (char *)v78;
        if ((v29 & 1) == 0) {
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
      swift_getAssociatedConformanceWitness();
      sub_226C34278();
      sub_226C341F8();
      swift_getAssociatedConformanceWitness();
      unint64_t v32 = v83;
      char v33 = sub_226C33928();
      unint64_t v34 = v79;
      unint64_t v14 = *(void *)(v79 + 8);
      ((void (*)(char *, uint64_t))v14)(v21, v13);
      unint64_t v35 = v90;
      uint64_t v36 = *(void (**)(unint64_t, char *, uint64_t))(v34 + 32);
      unint64_t v30 = (char *)v80;
      v36(v80, v32, v13);
      if ((v33 & 1) == 0)
      {
LABEL_15:
        ((void (*)(char *, uint64_t))v14)(v30, v13);
        unint64_t v23 = (char *)v78;
        unint64_t v14 = v79;
        goto LABEL_16;
      }
      unint64_t v37 = sub_226C33E78();
      ((void (*)(char *, uint64_t))v14)(v30, v13);
      BOOL v38 = v35 >= v37;
      unint64_t v14 = v79;
    }
    else
    {
      if (v27 >= 65) {
        goto LABEL_8;
      }
      unint64_t v30 = v83;
      unint64_t v39 = sub_226C33E78();
      unint64_t v14 = v79;
      (*(void (**)(char *, uint64_t))(v79 + 8))(v30, v13);
      BOOL v38 = v90 >= v39;
    }
    unint64_t v23 = (char *)v78;
    if (v38) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
LABEL_16:
  unint64_t v40 = sub_226C33E78();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v23, v13);
  uint64_t result = (unint64_t *)sub_226C2A31C();
  unint64_t v41 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_63;
  }
  if (!v41)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  uint64_t result = (unint64_t *)sub_226C2A2EC();
  unint64_t v42 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (!v42)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  uint64_t result = (unint64_t *)sub_226C2A2D8();
  unint64_t v43 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if (!v43)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  uint64_t result = (unint64_t *)sub_226C2A2C4();
  unint64_t v44 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  if (!v44)
  {
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    return result;
  }
  unint64_t v78 = v40 / v41;
  unint64_t v45 = v40 % v41;
  unint64_t v79 = v40 % v41 / v42;
  unint64_t v46 = v40 % v41 % v42;
  unint64_t v80 = v46 / v43;
  uint64_t v83 = (char *)v46;
  unint64_t v84 = v40;
  unint64_t v87 = v46 % v43;
  unint64_t v47 = v46 % v43 / v44;
  uint64_t v48 = v85;
  if (sub_226C33E98())
  {
    uint64_t v49 = v86;
    if (sub_226C33E88() < 64)
    {
      uint64_t v50 = v81;
      uint64_t v51 = v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v81, v49, v48);
      goto LABEL_35;
    }
    unint64_t v90 = 0;
    sub_226C1D7A8();
    unint64_t v73 = v47;
    uint64_t v56 = v81;
    sub_226C33E48();
    char v57 = sub_226C33938();
    uint64_t v58 = v56;
    unint64_t v47 = v73;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v58, v48);
    if ((v57 & 1) == 0) {
      goto LABEL_41;
    }
LABEL_40:
    sub_226C33A28();
    goto LABEL_41;
  }
  char v52 = sub_226C33E98();
  uint64_t v53 = sub_226C33E88();
  if ((v52 & 1) == 0)
  {
    if (v53 >= 64) {
      goto LABEL_41;
    }
    uint64_t v50 = v81;
    uint64_t v51 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v81, v86, v48);
LABEL_35:
    uint64_t v59 = sub_226C33E78();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v48);
    if ((v59 & 0x8000000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  unint64_t v73 = v47;
  if (v53 <= 64)
  {
    swift_getAssociatedConformanceWitness();
    sub_226C34278();
    uint64_t v60 = v81;
    sub_226C341F8();
    char v61 = sub_226C33938();
    uint64_t v62 = v82;
    uint64_t v81 = *(char **)(v82 + 8);
    ((void (*)(char *, uint64_t))v81)(v60, v48);
    v63 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v76, v86, v48);
    if (v61)
    {
      ((void (*)(char *, uint64_t))v81)(v63, v48);
      unint64_t v47 = v73;
    }
    else
    {
      uint64_t v64 = sub_226C33E78();
      ((void (*)(char *, uint64_t))v81)(v63, v48);
      unint64_t v47 = v73;
      if ((v64 & 0x8000000000000000) == 0) {
        goto LABEL_41;
      }
    }
    goto LABEL_40;
  }
  unint64_t v90 = 0;
  sub_226C1D7A8();
  unint64_t v54 = v81;
  sub_226C33E48();
  char v55 = sub_226C33938();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v54, v48);
  unint64_t v47 = v73;
  if (v55) {
    goto LABEL_40;
  }
LABEL_41:
  unint64_t v65 = v87;
  uint64_t v66 = (char *)(v87 - v47 * v44);
  if (v41 <= v84)
  {
    uint64_t v89 = (char *)v78;
    unint64_t v90 = sub_226C341B8();
    uint64_t v91 = v67;
    sub_226C33A28();
    sub_226C33A28();
    uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
    if (v42 > v45)
    {
LABEL_50:
      if (v43 > (unint64_t)v83)
      {
        if (v44 <= v65)
        {
LABEL_56:
          sub_226C33A28();
LABEL_57:
          uint64_t v89 = (char *)v47;
          unint64_t v90 = sub_226C341B8();
          uint64_t v91 = v70;
          sub_226C33A28();
          sub_226C33A28();
          uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
          if (!v66) {
            return result;
          }
          goto LABEL_58;
        }
LABEL_52:
        if (!v66) {
          return result;
        }
LABEL_58:
        sub_226C33A28();
        goto LABEL_59;
      }
      sub_226C33A28();
LABEL_55:
      uint64_t v89 = (char *)v80;
      unint64_t v90 = sub_226C341B8();
      uint64_t v91 = v69;
      sub_226C33A28();
      sub_226C33A28();
      uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
      if (v44 <= v65) {
        goto LABEL_56;
      }
      goto LABEL_52;
    }
    sub_226C33A28();
LABEL_49:
    uint64_t v89 = (char *)v79;
    unint64_t v90 = sub_226C341B8();
    uint64_t v91 = v68;
    sub_226C33A28();
    sub_226C33A28();
    uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
    goto LABEL_50;
  }
  if (v42 <= v45) {
    goto LABEL_49;
  }
  if (v43 <= (unint64_t)v83) {
    goto LABEL_55;
  }
  if (v44 <= v87) {
    goto LABEL_57;
  }
  if (v66)
  {
LABEL_59:
    uint64_t v89 = v66;
    goto LABEL_60;
  }
  uint64_t v89 = 0;
LABEL_60:
  unint64_t v90 = sub_226C341B8();
  uint64_t v91 = v71;
  sub_226C33A28();
  sub_226C33A28();
  return (unint64_t *)swift_bridgeObjectRelease();
}

unint64_t sub_226C210DC()
{
  unint64_t result = qword_268156E30;
  if (!qword_268156E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E30);
  }
  return result;
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:_:prefix:pad:)(uint64_t a1, uint64_t *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v49 = a4;
  int v45 = a3;
  uint64_t v11 = *(void *)(a6 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v46 = (char *)v36 - v12;
  uint64_t v47 = v11;
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v36 - v18;
  uint64_t v20 = *a2;
  uint64_t v38 = a2[1];
  uint64_t v39 = v20;
  uint64_t v21 = a2[2];
  uint64_t v40 = a2[3];
  uint64_t v41 = v21;
  uint64_t v44 = a2[4];
  int v43 = *((unsigned __int8 *)a2 + 40);
  if (sub_226C33E98())
  {
    if (sub_226C33E88() >= 64)
    {
      uint64_t v50 = 0;
      sub_226C1D7A8();
      sub_226C33E48();
      char v22 = sub_226C33938();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v19, a5);
      if (v22) {
        goto LABEL_20;
      }
LABEL_11:
      if ((v45 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_10:
    uint64_t v26 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v19, a1, a5);
    uint64_t v27 = sub_226C33E78();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v19, a5);
    if (v27 < 0) {
      goto LABEL_20;
    }
    goto LABEL_11;
  }
  v36[1] = v7;
  char v23 = sub_226C33E98();
  uint64_t v37 = a1;
  uint64_t v24 = sub_226C33E88();
  if ((v23 & 1) == 0)
  {
    a1 = v37;
    if (v24 >= 64) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v24 <= 64)
  {
    swift_getAssociatedConformanceWitness();
    sub_226C34278();
    sub_226C341F8();
    uint64_t v31 = v37;
    char v32 = sub_226C33938();
    uint64_t v33 = v42;
    unint64_t v34 = *(void (**)(char *, uint64_t))(v42 + 8);
    v34(v19, a5);
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v17, v31, a5);
    if (v32)
    {
      v34(v17, a5);
      goto LABEL_20;
    }
    uint64_t v35 = sub_226C33E78();
    v34(v17, a5);
    if ((v35 & 0x8000000000000000) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v50 = 0;
    sub_226C1D7A8();
    sub_226C33E48();
    char v25 = sub_226C33938();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v19, a5);
    if ((v25 & 1) == 0) {
      goto LABEL_11;
    }
  }
LABEL_20:
  sub_226C33A28();
  if (v45) {
LABEL_12:
  }
    sub_226C33A28();
LABEL_13:
  sub_226C33C78();
  swift_getAssociatedConformanceWitness();
  sub_226C33AB8();
  uint64_t result = sub_226C339F8();
  if (result >= v49)
  {
LABEL_16:
    sub_226C33A28();
    return swift_bridgeObjectRelease();
  }
  uint64_t v29 = v49 - result;
  if (!__OFSUB__(v49, result))
  {
    uint64_t v30 = v38;
    swift_bridgeObjectRetain();
    MEMORY[0x22A664BC0](v39, v30, v29);
    sub_226C33A28();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:_:separator:)(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t AssociatedConformanceWitness = a5;
  uint64_t v21 = a4;
  uint64_t v9 = a1;
  uint64_t v10 = *(char **)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v20 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v15 = (char *)&v19 - v14;
  if (*a2 != 1)
  {
    if (qword_26AD6CF10 != -1) {
      swift_once();
    }
    uint64_t v16 = &qword_26AD6CF38;
    goto LABEL_7;
  }
  if (qword_268158518 != -1) {
    goto LABEL_18;
  }
  while (1)
  {
    uint64_t v16 = &qword_2681592E0;
LABEL_7:
    uint64_t v17 = *v16;
    (*((void (**)(char *, uint64_t, uint64_t))v10 + 2))(v12, v9, AssociatedConformanceWitness);
    swift_bridgeObjectRetain();
    sub_226C33AE8();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v10 = v15;
    sub_226C33DE8();
    if (v23) {
      break;
    }
    uint64_t v9 = v22;
    if (*(void *)(v17 + 16) <= (unint64_t)v22 >> 4) {
      goto LABEL_16;
    }
    uint64_t v12 = (char *)(v17 + 32);
    swift_bridgeObjectRetain();
    uint64_t v10 = v6;
    sub_226C33A28();
    swift_bridgeObjectRelease();
    if (*(void *)(v17 + 16) > (unint64_t)(v9 & 0xF))
    {
      swift_bridgeObjectRetain();
      sub_226C33A28();
      swift_bridgeObjectRelease();
      sub_226C33DE8();
      if (v23) {
        break;
      }
      uint64_t v9 = v22;
      while (1)
      {
        uint64_t v10 = v6;
        sub_226C33A28();
        if (*(void *)(v17 + 16) <= (unint64_t)(v9 >> 4)) {
          break;
        }
        swift_bridgeObjectRetain();
        uint64_t v10 = v6;
        sub_226C33A28();
        swift_bridgeObjectRelease();
        if (*(void *)(v17 + 16) <= (unint64_t)(v9 & 0xF)) {
          goto LABEL_17;
        }
        swift_bridgeObjectRetain();
        sub_226C33A28();
        swift_bridgeObjectRelease();
        sub_226C33DE8();
        uint64_t v9 = v22;
        if (v23 == 1) {
          goto LABEL_15;
        }
      }
LABEL_16:
      __break(1u);
    }
LABEL_17:
    __break(1u);
LABEL_18:
    swift_once();
  }
LABEL_15:
  (*(void (**)(char *, uint64_t))(v20 + 8))(v15, AssociatedTypeWitness);
  return swift_bridgeObjectRelease();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:_:width:pad:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v8 = *a2;
  sub_226C341B8();
  uint64_t result = sub_226C339F8();
  uint64_t v10 = result;
  if (v8)
  {
    if (result < a3)
    {
      if (!__OFSUB__(a3, result))
      {
        swift_bridgeObjectRetain();
        MEMORY[0x22A664BC0](a4, a5, a3 - v10);
        sub_226C33A28();
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
      __break(1u);
LABEL_14:
      __break(1u);
      return result;
    }
  }
  else
  {
    sub_226C33A28();
    uint64_t result = swift_bridgeObjectRelease();
    if (v10 >= a3) {
      return result;
    }
    if (__OFSUB__(a3, v10)) {
      goto LABEL_14;
    }
    swift_bridgeObjectRetain();
    MEMORY[0x22A664BC0](a4, a5, a3 - v10);
  }
LABEL_9:
  sub_226C33A28();
  return swift_bridgeObjectRelease();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(nilPrint:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226C33DD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - v9;
  uint64_t v11 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return DefaultStringInterpolation.appendInterpolation<A>(_:)(a1, a2, a3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, a2);
    sub_226C341E8();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a2);
  }
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226C33DD8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v13 - v8, a1, v6);
  uint64_t v10 = *(void *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v16[3] = MEMORY[0x263F8D310];
    v16[4] = MEMORY[0x263F8D378];
    v16[0] = 7104878;
    v16[1] = 0xE300000000000000;
  }
  else
  {
    uint64_t v14 = a2;
    uint64_t v15 = a3;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v13);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(boxed_opaque_existential_0, v9, a2);
    sub_226C083B4(&v13, (uint64_t)v16);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CF08);
  sub_226C33FF8();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
}

unint64_t sub_226C21F64()
{
  unint64_t result = qword_268156E38;
  if (!qword_268156E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E38);
  }
  return result;
}

unint64_t sub_226C21FBC()
{
  unint64_t result = qword_268156E40;
  if (!qword_268156E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E40);
  }
  return result;
}

unint64_t sub_226C22014()
{
  unint64_t result = qword_268156E48;
  if (!qword_268156E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E48);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintUtilsConstants()
{
  return &type metadata for PrintUtilsConstants;
}

uint64_t destroy for PrintUtilsIntegerFormat()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PrintUtilsIntegerFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PrintUtilsIntegerFormat(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for PrintUtilsIntegerFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintUtilsIntegerFormat(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintUtilsIntegerFormat(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintUtilsIntegerFormat()
{
  return &type metadata for PrintUtilsIntegerFormat;
}

unsigned char *sub_226C22288(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PrintUtilsJustification()
{
  return &type metadata for PrintUtilsJustification;
}

uint64_t _s22PrintUtilsTimeDurationOwet(unsigned int *a1, int a2)
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

unsigned char *_s22PrintUtilsTimeDurationOwst(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x226C22390);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_226C223B8()
{
  return 0;
}

ValueMetadata *type metadata accessor for DefaultStringInterpolation.PrintUtilsTimeDuration()
{
  return &type metadata for DefaultStringInterpolation.PrintUtilsTimeDuration;
}

uint64_t getEnumTagSinglePayload for CUAsyncSerialQueue.OrderingPolicy(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s14CoreUtilsSwift23PrintUtilsJustificationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x226C2252CLL);
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

ValueMetadata *type metadata accessor for DefaultStringInterpolation.PrintUtilsHexFormat()
{
  return &type metadata for DefaultStringInterpolation.PrintUtilsHexFormat;
}

BOOL Character.isBinaryDigit.getter()
{
  unint64_t v0 = sub_226C338F8();
  return (v1 & 1) == 0 && v0 < 2;
}

unint64_t Character.binaryDigit.getter()
{
  unint64_t result = sub_226C338F8();
  if ((v1 & 1) == 0 && result > 1) {
    return 0;
  }
  return result;
}

BOOL Character.isOctalDigit.getter()
{
  uint64_t v0 = sub_226C338F8();
  return (v1 & 1) == 0 && v0 >= 0 && v0 < 8;
}

unint64_t Character.octalDigit.getter()
{
  unint64_t result = sub_226C338F8();
  if ((v1 & 1) == 0 && result > 7) {
    return 0;
  }
  return result;
}

uint64_t Character.isLetterB.getter(uint64_t a1, uint64_t a2)
{
  if (a1 == 98 && a2 == 0xE100000000000000) {
    return 1;
  }
  char v4 = sub_226C34208();
  BOOL v5 = a1 == 66 && a2 == 0xE100000000000000;
  BOOL v6 = v5;
  if ((v4 & 1) != 0 || v6) {
    return 1;
  }
  return sub_226C34208();
}

uint64_t Character.isLetterX.getter(uint64_t a1, uint64_t a2)
{
  if (a1 == 120 && a2 == 0xE100000000000000) {
    return 1;
  }
  char v4 = sub_226C34208();
  BOOL v5 = a1 == 88 && a2 == 0xE100000000000000;
  BOOL v6 = v5;
  if ((v4 & 1) != 0 || v6) {
    return 1;
  }
  return sub_226C34208();
}

uint64_t Sequence<>.hexString(separator:uppercase:maxBytes:truncator:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  v24[0] = a5;
  v24[1] = a6;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v12 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v25 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v17 = (char *)v24 - v16;
  if (a3) {
    uint64_t v18 = sub_226C1FE9C();
  }
  else {
    uint64_t v18 = sub_226C1FE3C();
  }
  uint64_t v19 = *v18;
  uint64_t v30 = 0;
  unint64_t v31 = 0xE000000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v8, a7);
  swift_bridgeObjectRetain();
  sub_226C33AE8();
  swift_getAssociatedConformanceWitness();
  uint64_t result = sub_226C33DE8();
  if (v29) {
    goto LABEL_14;
  }
  if (a4 < 1)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    sub_226C33A28();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v17, AssociatedTypeWitness);
    return v30;
  }
  unsigned __int8 v21 = v28;
  if (*(void *)(v19 + 16) <= (unint64_t)v28 >> 4)
  {
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_226C33A28();
    uint64_t result = swift_bridgeObjectRelease();
    if (*(void *)(v19 + 16) > (unint64_t)(v21 & 0xF))
    {
      swift_bridgeObjectRetain();
      sub_226C33A28();
      swift_bridgeObjectRelease();
      sub_226C33DE8();
      if ((v29 & 1) == 0)
      {
        uint64_t v22 = a4 & ~(a4 >> 63);
        unsigned __int8 v23 = v28;
        while (--v22)
        {
          uint64_t result = sub_226C33A28();
          if (*(void *)(v19 + 16) <= (unint64_t)(v23 >> 4)) {
            goto LABEL_17;
          }
          swift_bridgeObjectRetain();
          sub_226C33A28();
          uint64_t result = swift_bridgeObjectRelease();
          if (*(void *)(v19 + 16) <= (unint64_t)(v23 & 0xF)) {
            goto LABEL_18;
          }
          swift_bridgeObjectRetain();
          sub_226C33A28();
          swift_bridgeObjectRelease();
          sub_226C33DE8();
          unsigned __int8 v23 = v28;
          if (v29 == 1) {
            goto LABEL_14;
          }
        }
        goto LABEL_15;
      }
LABEL_14:
      (*(void (**)(char *, uint64_t))(v25 + 8))(v17, AssociatedTypeWitness);
      swift_bridgeObjectRelease();
      return v30;
    }
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_226C22B14()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_226C22B1C()
{
  return 3026478;
}

Swift::String __swiftcall StringProtocol.collapsedWhitespace()()
{
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(v0 - 8);
  ((void (*)())MEMORY[0x270FA5388])();
  BOOL v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v16 - v8;
  uint64_t v18 = 0;
  unint64_t v19 = 0xE000000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  sub_226C33AE8();
  swift_getAssociatedConformanceWitness();
  sub_226C33DE8();
  uint64_t v10 = v17;
  if (v17)
  {
    uint64_t v11 = v16;
    char v12 = 1;
    do
    {
      if (sub_226C338C8())
      {
        swift_bridgeObjectRelease();
        sub_226C33DE8();
        uint64_t v10 = v17;
        if (!v17) {
          break;
        }
        uint64_t v11 = v16;
        while ((sub_226C338C8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          sub_226C33DE8();
          uint64_t v11 = v16;
          uint64_t v10 = v17;
          if (!v17) {
            goto LABEL_12;
          }
        }
        if ((v12 & 1) == 0) {
          sub_226C33A28();
        }
      }
      MEMORY[0x22A664B30](v11, v10);
      swift_bridgeObjectRelease();
      sub_226C33DE8();
      char v12 = 0;
      uint64_t v11 = v16;
      uint64_t v10 = v17;
    }
    while (v17);
  }
LABEL_12:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  uint64_t v13 = v18;
  uint64_t v14 = (void *)v19;
  result._object = v14;
  result._uint64_t countAndFlagsBits = v13;
  return result;
}

BOOL StringProtocol.hasPrefixCaseInsensitive<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  v26[1] = a4;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E50);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a3 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  uint64_t v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v16);
  unsigned __int8 v21 = (char *)v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = a5;
  LOBYTE(a5) = sub_226C33CE8();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v6, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, a3);
  if (a5)
  {
    BOOL v22 = 1;
  }
  else
  {
    uint64_t v23 = sub_226C33698();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v14, 1, 1, v23);
    sub_226C33E38();
    BOOL v22 = (v24 & 1) == 0;
    sub_226C26188((uint64_t)v14);
  }
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, a3);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, a2);
  return v22;
}

uint64_t sub_226C2307C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

BOOL StringProtocol.isTrue.getter()
{
  return !sub_226C33E28() || !sub_226C33E28() || !sub_226C33E28() || !sub_226C33E28() || sub_226C33E28() == 0;
}

BOOL StringProtocol.isFalse.getter()
{
  return !sub_226C33E28() || !sub_226C33E28() || !sub_226C33E28() || !sub_226C33E28() || sub_226C33E28() == 0;
}

uint64_t StringProtocol.parseHex()(uint64_t a1)
{
  sub_226C33C98();
  sub_226C33CF8();
  return StringProtocol.parseHex(_:_:maxBytes:)(&v4, v3, 0x7FFFFFFFFFFFFFFFLL, a1);
}

uint64_t StringProtocol.parseHex(_:_:maxBytes:)(unint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = *a1;
  unint64_t v29 = *a1;
  if (a3 < 1
    || (unint64_t v7 = a2 >> 14,
        StringProtocol.parseLeadingWhitespace(_:_:)((uint64_t *)&v29, a2, a4),
        StringProtocol.parseNumericPrefix(start:end:radix:)((uint64_t)&v29, a2, 16, a4),
        unint64_t v4 = v29,
        unint64_t v24 = v7,
        v7 == v29 >> 14))
  {
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
LABEL_4:
    *a1 = v4;
    return (uint64_t)v8;
  }
  int v23 = 0;
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  char v26 = 1;
  while (1)
  {
    unint64_t v28 = v4;
    uint64_t v10 = (void (*)(unint64_t *, void))sub_226C33D18();
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    swift_bridgeObjectRetain();
    v10(v27, 0);
    uint64_t v14 = sub_226C338D8();
    if ((v15 & 1) != 0 || (uint64_t v16 = v14, v14 > 15))
    {
      BOOL v17 = v13 == 58 && v12 == 0xE100000000000000;
      if (v17
        || (sub_226C34208() & 1) != 0
        || (v13 == 45 ? (BOOL v18 = v12 == 0xE100000000000000) : (BOOL v18 = 0),
            v18
         || (sub_226C34208() & 1) != 0
         || v13 == 95 && v12 == 0xE100000000000000
         || (sub_226C34208() & 1) != 0
         || v13 == 44 && v12 == 0xE100000000000000))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v21 = sub_226C34208();
        swift_bridgeObjectRelease();
        if ((v21 & 1) == 0) {
          goto LABEL_4;
        }
      }
      goto LABEL_33;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v26) {
      break;
    }
    if (v16 < 0) {
      goto LABEL_43;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v8 = sub_226C1B32C(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v20 = *((void *)v8 + 2);
    unint64_t v19 = *((void *)v8 + 3);
    if (v20 >= v19 >> 1) {
      uint64_t v8 = sub_226C1B32C((char *)(v19 > 1), v20 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v20 + 1;
    v23 |= v16;
    v8[v20 + 32] = v23;
LABEL_29:
    v26 ^= 1u;
LABEL_33:
    unint64_t v28 = v4;
    sub_226C33CB8();
    unint64_t v4 = v27[0];
    unint64_t v29 = v27[0];
    if (*((void *)v8 + 2) < (unint64_t)a3)
    {
      StringProtocol.parseLeadingWhitespace(_:_:)((uint64_t *)&v29, a2, a4);
      StringProtocol.parseNumericPrefix(start:end:radix:)((uint64_t)&v29, a2, 16, a4);
      unint64_t v4 = v29;
      if (v24 != v29 >> 14) {
        continue;
      }
    }
    goto LABEL_4;
  }
  if (((16 * v16) & 0x8000000000000000) == 0)
  {
    if ((unint64_t)(16 * v16) > 0xFF) {
      goto LABEL_42;
    }
    int v23 = 16 * v16;
    goto LABEL_29;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t StringProtocol.parseHex(maxBytes:)(uint64_t a1, uint64_t a2)
{
  sub_226C33C98();
  sub_226C33CF8();
  return StringProtocol.parseHex(_:_:maxBytes:)(&v6, v5, a1, a2);
}

uint64_t StringProtocol.parseHex(_:_:)(unint64_t *a1, unint64_t a2, uint64_t a3)
{
  return StringProtocol.parseHex(_:_:maxBytes:)(a1, a2, 0x7FFFFFFFFFFFFFFFLL, a3);
}

uint64_t StringProtocol.parseLeadingWhitespace(_:_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = (uint64_t *)MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v8;
  char v21 = *(void (**)(char *, uint64_t))(v7 + 16);
  uint64_t v22 = v12;
  unint64_t v13 = v11 ^ v12;
  v21(v10, v3);
  if (!(v13 >> 14)) {
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, a3);
  }
  char v15 = (uint64_t (**)(char *, uint64_t))(v7 + 8);
  uint64_t v20 = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  while (1)
  {
    uint64_t v24 = v11;
    uint64_t v16 = sub_226C33D18();
    swift_bridgeObjectRetain();
    ((void (*)(void *, void))v16)(v23, 0);
    LOBYTE(v16) = sub_226C338C8();
    swift_bridgeObjectRelease();
    BOOL v17 = *v15;
    uint64_t result = (*v15)(v10, a3);
    if ((v16 & 1) == 0) {
      break;
    }
    uint64_t v24 = *a1;
    sub_226C33CB8();
    uint64_t v18 = v22;
    uint64_t v11 = v23[0];
    *a1 = v23[0];
    unint64_t v19 = v11 ^ v18;
    ((void (*)(char *, uint64_t, uint64_t))v21)(v10, v4, a3);
    if (v19 < 0x4000) {
      return v17(v10, a3);
    }
  }
  return result;
}

uint64_t StringProtocol.parseNumericPrefix(start:end:radix:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v198 = a4;
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  unint64_t v6 = (char *)v189 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)v189 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)v189 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)v189 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)v189 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)v189 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)v189 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)v189 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v36 = (char *)v189 - v35;
  uint64_t v37 = (unint64_t *)MEMORY[0x270FA5388](v34);
  uint64_t v49 = (char *)v189 - v45;
  switch(__ROR8__(v39, 1))
  {
    case 0:
      v193 = v43;
      v194 = v40;
      v191 = v42;
      v192 = v48;
      v195 = v41;
      v190 = v47;
      v197 = v37;
      unint64_t v50 = *v37;
      uint64_t v51 = v38 >> 14;
      char v52 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
      uint64_t v54 = v198;
      uint64_t v53 = v199;
      uint64_t v55 = v46;
      v52((char *)v189 - v45, v199, v198);
      uint64_t v196 = v51;
      uint64_t v200 = v55;
      if (v51 == v50 >> 14)
      {
        uint64_t v56 = *(void (**)(char *, uint64_t))(v55 + 8);
        v56(v49, v54);
        v52(v36, v53, v54);
        v56(v36, v54);
LABEL_75:
        uint64_t v116 = v199;
        v52(v33, v199, v54);
        goto LABEL_76;
      }
      unint64_t v203 = v50;
      uint64_t v83 = *(void *)(*((void *)v195 + 1) + 8);
      v189[0] = *((void *)v195 + 1);
      v189[1] = v83;
      unint64_t v84 = (void (*)(unint64_t *, void))sub_226C33D18();
      uint64_t v85 = v54;
      uint64_t v88 = *v86;
      uint64_t v87 = v86[1];
      swift_bridgeObjectRetain();
      v84(&v201, 0);
      if (v88 == 48 && v87 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v56 = *(void (**)(char *, uint64_t))(v200 + 8);
        v56(v49, v85);
        v52(v36, v199, v85);
        uint64_t v54 = v85;
      }
      else
      {
        char v90 = sub_226C34208();
        swift_bridgeObjectRelease();
        uint64_t v56 = *(void (**)(char *, uint64_t))(v200 + 8);
        v56(v49, v85);
        v52(v36, v199, v85);
        if ((v90 & 1) == 0)
        {
          uint64_t v54 = v198;
LABEL_74:
          v56(v36, v54);
          goto LABEL_75;
        }
        uint64_t v54 = v198;
      }
      unint64_t v203 = *v197;
      Collection.subscript.getter(1, (uint64_t)&v203, v54, (uint64_t)&v201);
      uint64_t v114 = v202;
      if (!v202) {
        goto LABEL_74;
      }
      unint64_t v115 = v201;
      if (v201 == 120 && v202 == 0xE100000000000000
        || ((char v175 = sub_226C34208(), v115 == 88) ? (v176 = v114 == 0xE100000000000000) : (v176 = 0),
            !v176 ? (char v177 = 0) : (char v177 = 1),
            (v175 & 1) != 0 || (v177 & 1) != 0))
      {
        swift_bridgeObjectRelease();
        v56(v36, v54);
        uint64_t v116 = v199;
        v52(v33, v199, v54);
      }
      else
      {
        char v178 = sub_226C34208();
        swift_bridgeObjectRelease();
        v56(v36, v54);
        uint64_t v116 = v199;
        v52(v33, v199, v54);
        if ((v178 & 1) == 0) {
          goto LABEL_76;
        }
      }
      unint64_t v203 = *v197;
      Collection.subscript.getter(2, (uint64_t)&v203, v54, (uint64_t)&v201);
      if (!v202)
      {
LABEL_76:
        v56(v33, v54);
        goto LABEL_77;
      }
      sub_226C338D8();
      char v118 = v117;
      swift_bridgeObjectRelease();
      v56(v33, v54);
      if ((v118 & 1) == 0)
      {
        uint64_t v119 = v197;
        unint64_t v203 = *v197;
        sub_226C33908();
        *uint64_t v119 = v201;
        return 16;
      }
LABEL_77:
      unint64_t v135 = *v197;
      v136 = v193;
      v52((char *)v193, v116, v54);
      if (v196 == v135 >> 14)
      {
        v56((char *)v136, v54);
        v137 = v191;
        v52((char *)v191, v116, v54);
        v138 = v137;
LABEL_79:
        v56((char *)v138, v54);
LABEL_80:
        v52(v194, v116, v54);
        v139 = v194;
LABEL_81:
        v140 = v139;
LABEL_82:
        v56(v140, v54);
        v141 = v197;
        goto LABEL_83;
      }
      unint64_t v203 = v135;
      v146 = (void (*)(unint64_t *, void))sub_226C33D18();
      uint64_t v149 = *v147;
      uint64_t v148 = v147[1];
      swift_bridgeObjectRetain();
      v146(&v201, 0);
      if (v149 == 48 && v148 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v54 = v198;
        v56((char *)v193, v198);
        v150 = v191;
        v52((char *)v191, v116, v54);
      }
      else
      {
        char v156 = sub_226C34208();
        swift_bridgeObjectRelease();
        uint64_t v54 = v198;
        v56((char *)v193, v198);
        v150 = v191;
        v52((char *)v191, v116, v54);
        if ((v156 & 1) == 0)
        {
          v138 = v150;
          goto LABEL_79;
        }
      }
      unint64_t v203 = *v197;
      Collection.subscript.getter(1, (uint64_t)&v203, v54, (uint64_t)&v201);
      uint64_t v157 = v202;
      if (!v202)
      {
        v56((char *)v150, v54);
        goto LABEL_80;
      }
      unint64_t v158 = v201;
      if (v201 == 98 && v202 == 0xE100000000000000
        || ((char v159 = sub_226C34208(), v158 == 66) ? (v160 = v157 == 0xE100000000000000) : (v160 = 0),
            !v160 ? (char v161 = 0) : (char v161 = 1),
            (v159 & 1) != 0 || (v161 & 1) != 0))
      {
        swift_bridgeObjectRelease();
        v56((char *)v191, v54);
        v139 = v194;
        v52(v194, v116, v54);
      }
      else
      {
        char v162 = sub_226C34208();
        swift_bridgeObjectRelease();
        v56((char *)v191, v54);
        v139 = v194;
        v52(v194, v116, v54);
        if ((v162 & 1) == 0) {
          goto LABEL_81;
        }
      }
      unint64_t v203 = *v197;
      Collection.subscript.getter(2, (uint64_t)&v203, v54, (uint64_t)&v201);
      if (!v202) {
        goto LABEL_81;
      }
      uint64_t v167 = sub_226C338F8();
      char v169 = v168;
      swift_bridgeObjectRelease();
      if (v169)
      {
        v140 = v194;
        uint64_t v54 = v198;
        goto LABEL_82;
      }
      if (!v167)
      {
        v56(v194, v198);
        v141 = v197;
LABEL_171:
        unint64_t v203 = *v141;
        v188 = v141;
        sub_226C33908();
        uint64_t v39 = 2;
        unint64_t *v188 = v201;
        return v39;
      }
      uint64_t v54 = v198;
      v56(v194, v198);
      v141 = v197;
      if (v167 == 1) {
        goto LABEL_171;
      }
LABEL_83:
      unint64_t v142 = *v141;
      v143 = v192;
      v52((char *)v192, v116, v54);
      if (v196 == v142 >> 14)
      {
        v56((char *)v143, v54);
        v144 = v190;
        v52((char *)v190, v116, v54);
        v145 = v144;
LABEL_160:
        v56((char *)v145, v54);
        return 10;
      }
      unint64_t v203 = v142;
      v151 = (void (*)(unint64_t *, void))sub_226C33D18();
      uint64_t v154 = *v152;
      uint64_t v153 = v152[1];
      swift_bridgeObjectRetain();
      v151(&v201, 0);
      if (v154 == 48 && v153 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v54 = v198;
        v56((char *)v192, v198);
        v155 = v190;
        v52((char *)v190, v116, v54);
      }
      else
      {
        char v163 = sub_226C34208();
        swift_bridgeObjectRelease();
        uint64_t v54 = v198;
        v56((char *)v192, v198);
        v155 = v190;
        v52((char *)v190, v116, v54);
        if ((v163 & 1) == 0)
        {
          v145 = v155;
          goto LABEL_160;
        }
      }
      unint64_t v203 = *v197;
      Collection.subscript.getter(2, (uint64_t)&v203, v54, (uint64_t)&v201);
      if (!v202)
      {
        v170 = v155;
        uint64_t v171 = v54;
        goto LABEL_127;
      }
      unint64_t v164 = sub_226C338F8();
      char v166 = v165;
      swift_bridgeObjectRelease();
      if ((v166 & 1) != 0 || (v164 & 0x8000000000000000) != 0)
      {
        v170 = v190;
        uint64_t v171 = v198;
LABEL_127:
        v56((char *)v170, v171);
        return 10;
      }
      v56((char *)v190, v198);
      if (v164 > 7) {
        return 10;
      }
      v187 = v197;
      unint64_t v203 = *v197;
      sub_226C33CB8();
      unint64_t *v187 = v201;
      return 8;
    case 1:
      v194 = v44;
      v195 = v13;
      uint64_t v196 = v39;
      unint64_t v57 = *v37;
      unint64_t v58 = *v37 ^ v38;
      uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
      uint64_t v60 = v37;
      uint64_t v61 = v198;
      uint64_t v62 = v199;
      uint64_t v63 = v46;
      v59(v16, v199, v198);
      uint64_t v200 = v63;
      if (v58 < 0x4000)
      {
        uint64_t v64 = *(void (**)(char *, uint64_t))(v63 + 8);
        v64(v16, v61);
        unint64_t v65 = v195;
        v59(v195, v62, v61);
        v64(v65, v61);
LABEL_120:
        v172 = v194;
        v59(v194, v62, v61);
        v173 = v172;
LABEL_121:
        v64(v173, v61);
        return v196;
      }
      v193 = (void (*)(void, void, void))v59;
      v197 = v60;
      unint64_t v203 = v57;
      uint64_t v91 = (void (*)(unint64_t *, void))sub_226C33D18();
      uint64_t v94 = *v92;
      uint64_t v93 = v92[1];
      swift_bridgeObjectRetain();
      v91(&v201, 0);
      if (v94 == 48 && v93 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v64 = *(void (**)(char *, uint64_t))(v200 + 8);
        v64(v16, v61);
        v98 = v195;
        uint64_t v62 = v199;
        uint64_t v59 = (void (*)(char *, uint64_t, uint64_t))v193;
        v193(v195, v199, v61);
        uint64_t v97 = (uint64_t *)v197;
      }
      else
      {
        char v96 = sub_226C34208();
        swift_bridgeObjectRelease();
        uint64_t v64 = *(void (**)(char *, uint64_t))(v200 + 8);
        v64(v16, v61);
        uint64_t v62 = v199;
        uint64_t v59 = (void (*)(char *, uint64_t, uint64_t))v193;
        v193(v195, v199, v61);
        if ((v96 & 1) == 0)
        {
          v64(v195, v61);
          goto LABEL_120;
        }
        uint64_t v97 = (uint64_t *)v197;
        v98 = v195;
      }
      unint64_t v203 = *v97;
      Collection.subscript.getter(1, (uint64_t)&v203, v61, (uint64_t)&v201);
      uint64_t v120 = v202;
      if (!v202)
      {
        v64(v98, v61);
        goto LABEL_120;
      }
      unint64_t v121 = v201;
      if (v201 == 98 && v202 == 0xE100000000000000
        || ((char v179 = sub_226C34208(), v121 == 66) ? (v180 = v120 == 0xE100000000000000) : (v180 = 0),
            !v180 ? (char v181 = 0) : (char v181 = 1),
            (v179 & 1) != 0 || (v181 & 1) != 0))
      {
        swift_bridgeObjectRelease();
        uint64_t v61 = v198;
        v64(v195, v198);
        v122 = v194;
        v193(v194, v62, v61);
      }
      else
      {
        char v182 = sub_226C34208();
        swift_bridgeObjectRelease();
        uint64_t v61 = v198;
        v64(v195, v198);
        v122 = v194;
        v193(v194, v62, v61);
        if ((v182 & 1) == 0)
        {
          v173 = v122;
          goto LABEL_121;
        }
      }
      unint64_t v203 = *v197;
      Collection.subscript.getter(2, (uint64_t)&v203, v61, (uint64_t)&v201);
      if (!v202)
      {
        v173 = v122;
        goto LABEL_121;
      }
      uint64_t v123 = sub_226C338F8();
      char v125 = v124;
      swift_bridgeObjectRelease();
      if ((v125 & 1) == 0)
      {
        if (v123)
        {
          v64(v194, v198);
          if (v123 != 1) {
            return v196;
          }
        }
        else
        {
          v64(v194, v198);
        }
        v129 = v197;
        unint64_t v203 = *v197;
        goto LABEL_168;
      }
      v64(v194, v198);
      return v196;
    case 4:
      v195 = v41;
      uint64_t v196 = v39;
      unint64_t v66 = *v37;
      unint64_t v67 = *v37 ^ v38;
      uint64_t v68 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
      uint64_t v69 = v37;
      uint64_t v71 = v198;
      uint64_t v70 = v199;
      uint64_t v72 = v46;
      v68(v9, v199, v198);
      if (v67 < 0x4000)
      {
        unint64_t v73 = *(void (**)(char *, uint64_t))(v72 + 8);
        v73(v9, v71);
        v68(v6, v70, v71);
        v73(v6, v71);
        return v196;
      }
      uint64_t v200 = v72;
      v197 = v69;
      unint64_t v203 = v66;
      uint64_t v99 = (void (*)(unint64_t *, void))sub_226C33D18();
      uint64_t v102 = *v100;
      uint64_t v101 = v100[1];
      swift_bridgeObjectRetain();
      v99(&v201, 0);
      if (v102 == 48 && v101 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v105 = *(void (**)(char *, uint64_t))(v200 + 8);
        v105(v9, v71);
        v68(v6, v199, v71);
      }
      else
      {
        char v104 = sub_226C34208();
        swift_bridgeObjectRelease();
        uint64_t v105 = *(void (**)(char *, uint64_t))(v200 + 8);
        v105(v9, v71);
        v68(v6, v199, v71);
        if ((v104 & 1) == 0)
        {
          uint64_t v71 = v198;
          goto LABEL_123;
        }
        uint64_t v71 = v198;
      }
      unint64_t v203 = *v197;
      Collection.subscript.getter(1, (uint64_t)&v203, v71, (uint64_t)&v201);
      if (v202)
      {
        unint64_t v126 = sub_226C338F8();
        char v128 = v127;
        swift_bridgeObjectRelease();
        if ((v128 & 1) != 0 || (v126 & 0x8000000000000000) != 0)
        {
          v105(v6, v198);
          return v196;
        }
        v105(v6, v198);
        if (v126 > 7) {
          return v196;
        }
        v129 = v197;
        unint64_t v203 = *v197;
        sub_226C33CB8();
        goto LABEL_169;
      }
LABEL_123:
      v105(v6, v71);
      return v196;
    case 8:
      v194 = v19;
      v195 = v41;
      uint64_t v196 = v39;
      unint64_t v74 = *v37;
      unint64_t v75 = *v37 ^ v38;
      uint64_t v76 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
      uint64_t v77 = v37;
      uint64_t v78 = v198;
      uint64_t v79 = v199;
      uint64_t v80 = v46;
      v76(v25, v199, v198);
      uint64_t v200 = v80;
      if (v75 < 0x4000)
      {
        uint64_t v81 = *(void (**)(char *, uint64_t))(v80 + 8);
        v81(v25, v78);
        v76(v22, v79, v78);
        uint64_t v82 = v76;
        v81(v22, v78);
LABEL_34:
        v112 = v194;
        v82(v194, v199, v78);
        uint64_t v113 = v112;
        goto LABEL_35;
      }
      v193 = (void (*)(void, void, void))v76;
      v197 = v77;
      unint64_t v203 = v74;
      v106 = (void (*)(unint64_t *, void))sub_226C33D18();
      uint64_t v109 = *v107;
      uint64_t v108 = v107[1];
      swift_bridgeObjectRetain();
      v106(&v201, 0);
      if (v109 == 48 && v108 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v81 = *(void (**)(char *, uint64_t))(v200 + 8);
        v81(v25, v78);
        uint64_t v82 = (void (*)(char *, uint64_t, uint64_t))v193;
        v193(v22, v199, v78);
      }
      else
      {
        char v111 = sub_226C34208();
        swift_bridgeObjectRelease();
        uint64_t v81 = *(void (**)(char *, uint64_t))(v200 + 8);
        v81(v25, v78);
        uint64_t v82 = (void (*)(char *, uint64_t, uint64_t))v193;
        v193(v22, v199, v78);
        if ((v111 & 1) == 0)
        {
LABEL_33:
          v81(v22, v78);
          goto LABEL_34;
        }
      }
      unint64_t v203 = *v197;
      Collection.subscript.getter(1, (uint64_t)&v203, v78, (uint64_t)&v201);
      uint64_t v130 = v202;
      if (v202)
      {
        unint64_t v131 = v201;
        if (v201 == 120 && v202 == 0xE100000000000000
          || ((char v183 = sub_226C34208(), v131 == 88) ? (v184 = v130 == 0xE100000000000000) : (v184 = 0),
              (uint64_t v78 = v198, !v184) ? (v185 = 0) : (v185 = 1),
              (v183 & 1) != 0 || (v185 & 1) != 0))
        {
          swift_bridgeObjectRelease();
          v81(v22, v78);
          v132 = v194;
          v82(v194, v199, v78);
        }
        else
        {
          char v186 = sub_226C34208();
          swift_bridgeObjectRelease();
          v81(v22, v78);
          v132 = v194;
          v82(v194, v199, v78);
          if ((v186 & 1) == 0)
          {
            uint64_t v113 = v132;
            goto LABEL_35;
          }
        }
        unint64_t v203 = *v197;
        Collection.subscript.getter(2, (uint64_t)&v203, v78, (uint64_t)&v201);
        if (v202)
        {
          sub_226C338D8();
          char v134 = v133;
          swift_bridgeObjectRelease();
          v81(v132, v78);
          if ((v134 & 1) == 0)
          {
            v129 = v197;
            unint64_t v203 = *v197;
LABEL_168:
            sub_226C33908();
LABEL_169:
            unint64_t *v129 = v201;
          }
          return v196;
        }
        uint64_t v113 = v132;
LABEL_35:
        v81(v113, v78);
        return v196;
      }
      goto LABEL_33;
    default:
      return v39;
  }
}

uint64_t StringProtocol.parseInteger<A>(radix:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  sub_226C33C98();
  sub_226C33CF8();
  return StringProtocol.parseInteger<A>(_:_:radix:)(&v14, v13, a1, a2, a3, a4, a5, a6);
}

uint64_t StringProtocol.parseInteger<A>(_:_:radix:)@<X0>(uint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  uint64_t v9 = v8;
  uint64_t v102 = a8;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  v95 = (char *)&v80 - v18;
  uint64_t v101 = a7;
  uint64_t v96 = *(void *)(a7 + 8);
  uint64_t v86 = *(void *)(*(void *)(v96 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v84 = (char *)&v80 - v20;
  uint64_t v88 = *(void *)(a5 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v94 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  int v100 = (char *)&v80 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  char v104 = (char *)&v80 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v83 = (char *)&v80 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v98 = (char *)&v80 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v80 - v31;
  unint64_t v107 = *a1;
  StringProtocol.parseLeadingWhitespace(_:_:)((uint64_t *)&v107, a2, a4);
  uint64_t v103 = a6;
  uint64_t v93 = StringProtocol.parseNumericSign(start:end:)((uint64_t *)&v107, a2);
  if (v93 < 0 && (sub_226C33E98() & 1) == 0)
  {
    sub_226C1D6D8();
    swift_allocError();
    unsigned char *v76 = 2;
    return swift_willThrow();
  }
  else
  {
    uint64_t v82 = a1;
    v105[0] = StringProtocol.parseNumericPrefix(start:end:radix:)((uint64_t)&v107, a2, a3, a4);
    sub_226C1D7A8();
    uint64_t v33 = a4;
    uint64_t v34 = v9;
    sub_226C33EA8();
    v105[0] = 0;
    sub_226C33EA8();
    unint64_t v35 = v107;
    unint64_t v87 = v107 >> 14;
    unint64_t v92 = a2 >> 14;
    if (v107 >> 14 == a2 >> 14)
    {
LABEL_4:
      unint64_t v36 = v107;
      if (v87 == v107 >> 14)
      {
        sub_226C1D6D8();
        swift_allocError();
        *uint64_t v37 = 0;
        swift_willThrow();
        unint64_t v38 = *(void (**)(char *, uint64_t))(v88 + 8);
        v38(v102, a5);
        return ((uint64_t (*)(char *, uint64_t))v38)(v32, a5);
      }
      else
      {
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v88 + 8))(v32, a5);
        *uint64_t v82 = v36;
      }
    }
    else
    {
      uint64_t v99 = *(void *)(*(void *)(v103 + 8) + 8);
      uint64_t v40 = (void (**)(char *, uint64_t))(v88 + 8);
      uint64_t v80 = (void (**)(char *, char *, uint64_t))(v88 + 16);
      char v90 = v32;
      uint64_t v91 = (void (**)(char *, char *, uint64_t))(v88 + 32);
      uint64_t v97 = v33;
      uint64_t v103 = v88 + 8;
      uint64_t v89 = v34;
      while (1)
      {
        unint64_t v106 = v35;
        uint64_t v41 = (void (*)(uint64_t *, void))sub_226C33D18();
        unint64_t v44 = *v42;
        unint64_t v43 = v42[1];
        swift_bridgeObjectRetain();
        v41(v105, 0);
        BOOL v45 = v44 == 2573 && v43 == 0xE200000000000000;
        if (v45 || (sub_226C34208() & 1) != 0 || (sub_226C338E8() & 1) == 0) {
          goto LABEL_43;
        }
        uint64_t result = sub_226C261E8(v44, v43);
        if ((result & 0x100000000) != 0) {
          goto LABEL_49;
        }
        if ((result & 0xFFFFFF80) != 0)
        {
LABEL_43:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t result = sub_226C261E8(v44, v43);
        if ((result & 0x100000000) != 0) {
          break;
        }
        int v46 = result;
        uint64_t result = swift_bridgeObjectRelease();
        if ((v46 & 0xFFFFFF00) != 0)
        {
          __break(1u);
LABEL_49:
          __break(1u);
          break;
        }
        if ((v46 - 58) > 0xF5u)
        {
          int v47 = 208;
        }
        else if ((v46 - 91) > 0xE5u)
        {
          int v47 = 201;
        }
        else
        {
          if ((v46 - 123) < 0xE6u) {
            goto LABEL_4;
          }
          int v47 = 169;
        }
        int v48 = v47 + v46;
        char v49 = sub_226C33E98();
        uint64_t v50 = sub_226C33E88();
        if (v49)
        {
          if (v50 <= 8)
          {
            int v81 = v48;
            swift_getAssociatedConformanceWitness();
            uint64_t v56 = v32;
            sub_226C34278();
            unint64_t v57 = v98;
            sub_226C341F8();
            char v58 = sub_226C33928();
            uint64_t v59 = *(void (**)(char *, uint64_t))v103;
            uint64_t v60 = v57;
            uint64_t v40 = (void (**)(char *, uint64_t))v103;
            (*(void (**)(char *, uint64_t))v103)(v60, a5);
            uint64_t v61 = v83;
            uint64_t v62 = v56;
            (*v80)(v83, v56, a5);
            if ((v58 & 1) == 0)
            {
              v59(v61, a5);
              uint64_t v32 = v56;
              goto LABEL_4;
            }
            unsigned __int8 v63 = sub_226C33E78();
            uint64_t v64 = v61;
            LOBYTE(v48) = v81;
            unsigned int v65 = v81;
            v59(v64, a5);
            BOOL v66 = v65 >= v63;
            uint64_t v32 = v62;
            if (v66) {
              goto LABEL_4;
            }
            unint64_t v35 = v107;
          }
          else
          {
            LOBYTE(v105[0]) = v48;
            sub_226C1F92C();
            uint64_t v51 = v98;
            sub_226C33E48();
            char v52 = sub_226C33938();
            (*v40)(v51, a5);
            if ((v52 & 1) == 0) {
              goto LABEL_4;
            }
          }
        }
        else if (v50 < 9)
        {
          if (v48 >= sub_226C33E78()) {
            goto LABEL_4;
          }
        }
        else
        {
          LOBYTE(v105[0]) = v48;
          sub_226C1F92C();
          uint64_t v53 = v98;
          sub_226C33E48();
          char v54 = sub_226C33938();
          uint64_t v55 = v53;
          uint64_t v40 = (void (**)(char *, uint64_t))v103;
          (*(void (**)(char *, uint64_t))v103)(v55, a5);
          if ((v54 & 1) == 0) {
            goto LABEL_4;
          }
        }
        unint64_t v106 = v35;
        sub_226C33CB8();
        unint64_t v35 = v105[0];
        unint64_t v107 = v105[0];
        if (sub_226C34058())
        {
          sub_226C1D6D8();
          swift_allocError();
          *uint64_t v77 = 1;
          swift_willThrow();
          uint64_t v78 = *v40;
          (*v40)(v104, a5);
          v78(v102, a5);
          return ((uint64_t (*)(char *, uint64_t))v78)(v32, a5);
        }
        unint64_t v67 = v91;
        LOBYTE(v105[0]) = v48;
        if (v93 < 0)
        {
          sub_226C1F92C();
          uint64_t v68 = v94;
          sub_226C33EA8();
          uint64_t v69 = v98;
          char v70 = sub_226C34068();
        }
        else
        {
          sub_226C1F92C();
          uint64_t v68 = v94;
          sub_226C33EA8();
          uint64_t v69 = v98;
          char v70 = sub_226C34048();
        }
        char v71 = v70;
        uint64_t v72 = *(void (**)(char *, uint64_t))v103;
        (*(void (**)(char *, uint64_t))v103)(v68, a5);
        unint64_t v73 = *v67;
        unint64_t v74 = v95;
        (*v67)(v95, v69, a5);
        v73(v100, v74, a5);
        if (v71)
        {
          sub_226C1D6D8();
          swift_allocError();
          *uint64_t v79 = 1;
          swift_willThrow();
          v72(v100, a5);
          v72(v104, a5);
          v72(v102, a5);
          return ((uint64_t (*)(char *, uint64_t))v72)(v90, a5);
        }
        uint64_t v40 = (void (**)(char *, uint64_t))v103;
        v72(v104, a5);
        unint64_t v75 = v102;
        v72(v102, a5);
        v73(v75, v100, a5);
        uint64_t v32 = v90;
        if (v92 == v35 >> 14) {
          goto LABEL_4;
        }
      }
      __break(1u);
    }
  }
  return result;
}

uint64_t StringProtocol.parseNumericSign(start:end:)(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = *a1;
  if ((*a1 ^ a2) < 0x4000) {
    return 0;
  }
  uint64_t v18 = *a1;
  uint64_t v5 = (void (*)(void *, void))sub_226C33D18();
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  swift_bridgeObjectRetain();
  v5(v17, 0);
  if (v8 == 45 && v7 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v10 = sub_226C34208();
  swift_bridgeObjectRelease();
  if (v10)
  {
LABEL_15:
    uint64_t v18 = v2;
    sub_226C33CB8();
    *a1 = v17[0];
    return -1;
  }
  uint64_t v18 = v2;
  uint64_t v11 = (void (*)(void *, void))sub_226C33D18();
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  swift_bridgeObjectRetain();
  v11(v17, 0);
  if (v14 == 43 && v13 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v16 = sub_226C34208();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v18 = v2;
  sub_226C33CB8();
  *a1 = v17[0];
  return 1;
}

CoreUtilsSwift::CUStringAppendFlags __swiftcall CUStringAppendFlags.init(rawValue:)(CoreUtilsSwift::CUStringAppendFlags rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static CUStringAppendFlags.first.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static CUStringAppendFlags.second.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static CUStringAppendFlags.colonFirst.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static CUStringAppendFlags.comma.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void sub_226C25E8C()
{
  qword_268158948 = 12;
}

uint64_t static CUStringAppendFlags.standard.getter@<X0>(void *a1@<X8>)
{
  if (qword_268158940 != -1) {
    uint64_t result = swift_once();
  }
  *a1 = qword_268158948;
  return result;
}

uint64_t CUStringAppendFlags.rawValue.getter()
{
  return *(void *)v0;
}

void *sub_226C25F00@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_226C25F0C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_226C25F20@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_226C25F34@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_226C25F48(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_226C25F78@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_226C25FA4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_226C25FC8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_226C25FDC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_226C25FF0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_226C26004@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_226C26018(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_226C2602C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_226C26040(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_226C26054()
{
  return *v0 == 0;
}

uint64_t sub_226C26064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_226C2607C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_226C26090@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_226C260A0(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_226C260AC(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Void __swiftcall String.append(_:_:)(CoreUtilsSwift::CUStringAppendFlags *a1, Swift::String a2)
{
  uint64_t v2 = HIBYTE(a2._object) & 0xF;
  if (((uint64_t)a2._object & 0x2000000000000000) == 0) {
    uint64_t v2 = a2._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    Swift::Int rawValue = a1->rawValue;
    if (a1->rawValue)
    {
      if ((rawValue & 2) != 0)
      {
        if ((rawValue & 8) != 0) {
          sub_226C33A28();
        }
        goto LABEL_16;
      }
      if ((rawValue & 4) != 0 || (rawValue & 8) != 0) {
        sub_226C33A28();
      }
      Swift::Int v5 = rawValue | 2;
    }
    else
    {
      Swift::Int v5 = rawValue | 1;
    }
    a1->Swift::Int rawValue = v5;
LABEL_16:
    sub_226C33A28();
  }
}

uint64_t sub_226C26188(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_226C261E8(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_226C26438(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      unsigned int v5 = sub_226C33F38();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0) {
        sub_226C33F98();
      }
      unsigned int v5 = sub_226C33FA8();
    }
  }
  else
  {
    unsigned int v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_226C262CC()
{
  unint64_t result = qword_268156E58;
  if (!qword_268156E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E58);
  }
  return result;
}

unint64_t sub_226C26324()
{
  unint64_t result = qword_268156E60;
  if (!qword_268156E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E60);
  }
  return result;
}

unint64_t sub_226C2637C()
{
  unint64_t result = qword_268156E68;
  if (!qword_268156E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E68);
  }
  return result;
}

unint64_t sub_226C263D4()
{
  unint64_t result = qword_268156E70;
  if (!qword_268156E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E70);
  }
  return result;
}

ValueMetadata *type metadata accessor for CUStringAppendFlags()
{
  return &type metadata for CUStringAppendFlags;
}

unint64_t sub_226C26438(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5) {
    goto LABEL_9;
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    unint64_t result = sub_226C264D8(result, a2, a3);
    if ((result & 1) == 0) {
      return result & 0xC | sub_226C26548(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
    }
  }
  return result;
}

unint64_t sub_226C264D8(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0) {
    LOBYTE(v5) = 1;
  }
  if ((result & 0xC) == 4 << v5) {
    unint64_t result = sub_226C1C7F0(result, a2, a3);
  }
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v6 <= result >> 16) {
    __break(1u);
  }
  return result;
}

unint64_t sub_226C26548(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    unint64_t v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((unsigned char *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            unint64_t v7 = v5 - 1;
            int v11 = *((unsigned char *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_14;
        }
      }
      else
      {
        unint64_t v12 = result >> 16;
        uint64_t v6 = sub_226C33F98();
        unint64_t v5 = v12;
        if (v12 == v10) {
          goto LABEL_14;
        }
      }
      if ((*(unsigned char *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          unint64_t v7 = v5 - 1;
          int v8 = *(unsigned char *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      unint64_t v7 = v5;
      return v7 << 16;
    }
    uint64_t v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFLL;
    }
    if (v5 != v9)
    {
      return MEMORY[0x270F9E998]();
    }
  }
  return result;
}

uint64_t sub_226C26670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return CUExtendableProperties.getExtendableProperty<A>(key:)(a1, a4, a2, a5, a3, a6);
}

uint64_t CUExtendableProperties.getExtendableProperty<A>(key:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v33 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_226C33DD8();
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v30 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 8);
  uint64_t v15 = v14(a2, a4);
  if (*(void *)(v15 + 16))
  {
    uint64_t v31 = a6;
    uint64_t v28 = a1;
    unint64_t v16 = sub_226C0C4A8(a1);
    if (v17)
    {
      uint64_t v18 = v16;
      int v19 = *(_DWORD *)(v15 + 36);
      swift_bridgeObjectRelease();
      uint64_t v20 = v14(a2, a4);
      sub_226C09638((uint64_t)v34, v18, v19, 0, v20);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      uint64_t v21 = AssociatedTypeWitness;
      char v22 = swift_dynamicCast();
      uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
      uint64_t v24 = v31;
      if (v22)
      {
        uint64_t v25 = *(void *)(v21 - 8);
        v23(v13, 0, 1, v21);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v24, v13, v21);
      }
      v23(v13, 1, 1, v21);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v30);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v27 = v33;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = v33;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(v27, a5);
}

uint64_t sub_226C2691C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return CUExtendableProperties.setExtendableProperty<A>(key:value:)(a1, a2, a5, a3, a6);
}

uint64_t CUExtendableProperties.setExtendableProperty<A>(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  void v14[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_0, a2, AssociatedTypeWitness);
  uint64_t v11 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(a5 + 24))(v13, a3, a5);
  sub_226C09740((uint64_t)v14, a1);
  return v11(v13, 0);
}

uint64_t sub_226C26A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return CUExtendableProperties.removeExtendableProperty<A>(key:)(a1, a4, a3, a5);
}

uint64_t CUExtendableProperties.removeExtendableProperty<A>(key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(a4 + 24))(v7, a2, a4);
  sub_226C09A94(a1, v8);
  sub_226C0CEE4((uint64_t)v8);
  return v5(v7, 0);
}

uint64_t sub_226C26AB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return CUExtendablePropertiesActor.getExtendableProperty<A>(key:)(a1, a4, a2, a5, a3, a6);
}

uint64_t CUExtendablePropertiesActor.getExtendableProperty<A>(key:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v33 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_226C33DD8();
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v30 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 16);
  uint64_t v15 = v14(a2, a4);
  if (*(void *)(v15 + 16))
  {
    uint64_t v31 = a6;
    uint64_t v28 = a1;
    unint64_t v16 = sub_226C0C4A8(a1);
    if (v17)
    {
      uint64_t v18 = v16;
      int v19 = *(_DWORD *)(v15 + 36);
      swift_bridgeObjectRelease();
      uint64_t v20 = v14(a2, a4);
      sub_226C09638((uint64_t)v34, v18, v19, 0, v20);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268156C58);
      uint64_t v21 = AssociatedTypeWitness;
      char v22 = swift_dynamicCast();
      uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
      uint64_t v24 = v31;
      if (v22)
      {
        uint64_t v25 = *(void *)(v21 - 8);
        v23(v13, 0, 1, v21);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v24, v13, v21);
      }
      v23(v13, 1, 1, v21);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v30);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v27 = v33;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = v33;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(v27, a5);
}

uint64_t sub_226C26D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return CUExtendablePropertiesActor.setExtendableProperty<A>(key:value:)(a1, a2, a5, a3, a6);
}

uint64_t CUExtendablePropertiesActor.setExtendableProperty<A>(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  void v14[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_0, a2, AssociatedTypeWitness);
  uint64_t v11 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(a5 + 32))(v13, a3, a5);
  sub_226C09740((uint64_t)v14, a1);
  return v11(v13, 0);
}

uint64_t sub_226C26E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return CUExtendablePropertiesActor.removeExtendableProperty<A>(key:)(a1, a4, a3, a5);
}

uint64_t CUExtendablePropertiesActor.removeExtendableProperty<A>(key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(a4 + 32))(v7, a2, a4);
  sub_226C09A94(a1, v8);
  sub_226C0CEE4((uint64_t)v8);
  return v5(v7, 0);
}

uint64_t dispatch thunk of CUExtendableProperties._extendableProperties.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CUExtendableProperties._extendableProperties.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of CUExtendableProperties._extendableProperties.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of CUExtendableProperties.getExtendableProperty<A>(key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of CUExtendableProperties.setExtendableProperty<A>(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of CUExtendableProperties.removeExtendableProperty<A>(key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of static CUExtendablePropertyKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CUExtendablePropertiesActor._extendableProperties.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CUExtendablePropertiesActor._extendableProperties.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of CUExtendablePropertiesActor._extendableProperties.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of CUExtendablePropertiesActor.getExtendableProperty<A>(key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of CUExtendablePropertiesActor.setExtendableProperty<A>(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 48))();
}

uint64_t dispatch thunk of CUExtendablePropertiesActor.removeExtendableProperty<A>(key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

void fatalError(_:file:line:)(void (*a1)(void))
{
}

Swift::Double __swiftcall UpTicksToSecondsF(_:)(Swift::UInt64 a1)
{
  if (qword_26AD6CF18 != -1) {
    swift_once();
  }
  return *(double *)&qword_26AD6CF20 * (double)a1;
}

Swift::UInt64 __swiftcall UpTicksToSeconds(_:)(Swift::UInt64 a1)
{
  Swift::UInt64 result = UpTicksPerSecond()();
  if (result) {
    return a1 / result;
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall UpTicksToMilliseconds(_:)(Swift::UInt64 a1)
{
  return sub_226C27298(a1, &qword_268158BD0, &dbl_268158BD8);
}

Swift::UInt64 __swiftcall UpTicksToMicroseconds(_:)(Swift::UInt64 a1)
{
  return sub_226C27298(a1, &qword_268158BE0, &dbl_268158BE8);
}

Swift::UInt64 __swiftcall UpTicksToNanoseconds(_:)(Swift::UInt64 a1)
{
  return sub_226C27298(a1, &qword_268158BF0, &dbl_268158BF8);
}

Swift::UInt64 __swiftcall SecondsToUpTicks(_:)(Swift::UInt64 a1)
{
  Swift::UInt64 result = UpTicksPerSecond()();
  if (is_mul_ok(a1, result)) {
    result *= a1;
  }
  else {
    __break(1u);
  }
  return result;
}

Swift::UInt64 __swiftcall SecondsToUpTicksF(_:)(Swift::Double a1)
{
  if (qword_268158C00 != -1) {
    Swift::UInt64 result = swift_once();
  }
  double v2 = *(double *)&qword_268158C08 * a1;
  if ((~COERCE__INT64(*(double *)&qword_268158C08 * a1) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 < 1.84467441e19) {
    return (unint64_t)v2;
  }
LABEL_9:
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall MillisecondsToUpTicks(_:)(Swift::UInt64 a1)
{
  return sub_226C27298(a1, &qword_268158C10, &dbl_268158C18);
}

Swift::UInt64 __swiftcall MicrosecondsToUpTicks(_:)(Swift::UInt64 a1)
{
  return sub_226C27298(a1, &qword_268158C20, &dbl_268158C28);
}

Swift::UInt64 __swiftcall NanosecondsToUpTicks(_:)(Swift::UInt64 a1)
{
  return sub_226C27298(a1, &qword_268158C30, dbl_268158C38);
}

uint64_t sub_226C27298(uint64_t result, void *a2, double *a3)
{
  double v4 = (double)(unint64_t)result;
  if (*a2 != -1) {
    Swift::UInt64 result = swift_once();
  }
  double v5 = *a3 * v4;
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v5 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 1.84467441e19) {
    return (unint64_t)v5;
  }
LABEL_9:
  __break(1u);
  return result;
}

double sub_226C27324()
{
  double result = 1.0 / (double)UpTicksPerSecond()();
  *(double *)&qword_26AD6CF20 = result;
  return result;
}

double sub_226C27350(uint64_t a1)
{
  return sub_226C273B0(a1, (uint64_t (*)(void))sub_226C2A2B0, &dbl_268158BD8);
}

double sub_226C27370(uint64_t a1)
{
  return sub_226C273B0(a1, (uint64_t (*)(void))sub_226C2A290, &dbl_268158BE8);
}

double sub_226C27390(uint64_t a1)
{
  return sub_226C273B0(a1, (uint64_t (*)(void))sub_226C2A278, &dbl_268158BF8);
}

double sub_226C273B0(uint64_t a1, uint64_t (*a2)(void), double *a3)
{
  double v4 = (double)*(uint64_t *)a2();
  double result = v4 / (double)UpTicksPerSecond()();
  *a3 = result;
  return result;
}

double sub_226C273F8()
{
  double result = (double)UpTicksPerSecond()();
  *(double *)&qword_268158C08 = result;
  return result;
}

double sub_226C2741C(uint64_t a1)
{
  return sub_226C2747C(a1, (uint64_t (*)(void))sub_226C2A2B0, &dbl_268158C18);
}

double sub_226C2743C(uint64_t a1)
{
  return sub_226C2747C(a1, (uint64_t (*)(void))sub_226C2A290, &dbl_268158C28);
}

double sub_226C2745C(uint64_t a1)
{
  return sub_226C2747C(a1, (uint64_t (*)(void))sub_226C2A278, dbl_268158C38);
}

double sub_226C2747C(uint64_t a1, uint64_t (*a2)(void), double *a3)
{
  double v5 = (double)UpTicksPerSecond()();
  double result = v5 / (double)*(uint64_t *)a2();
  *a3 = result;
  return result;
}

uint64_t CUManualClock.minimumResolution.getter()
{
  return 1000000000;
}

__n128 CUManualClock.now.getter@<Q0>(__n128 *a1@<X8>)
{
  swift_beginAccess();
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

void *CUManualClock.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  v0[2] = sub_226C34458();
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C98);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  uint64_t v3 = MEMORY[0x263F8EE78];
  v0[4] = v2;
  v0[5] = v3;
  return v0;
}

void *CUManualClock.init()()
{
  v0[2] = sub_226C34458();
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156C98);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  uint64_t v3 = MEMORY[0x263F8EE78];
  v0[4] = v2;
  v0[5] = v3;
  return v0;
}

uint64_t CUManualClock.advance(by:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)v2;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  uint64_t v38 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v39 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E78);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v43 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for CUManualClock.WakeUp();
  uint64_t v9 = *(void *)(v41 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v41);
  uint64_t v37 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v37 - v12;
  unint64_t v44 = (void *)MEMORY[0x263F8EE78];
  uint64_t v14 = *(os_unfair_lock_s **)(v2 + 32);
  swift_retain();
  os_unfair_lock_lock(v14 + 4);
  swift_release();
  swift_beginAccess();
  v3[2] = MEMORY[0x22A665530](v3[2], v3[3], a1, a2);
  v3[3] = v15;
  uint64_t result = swift_endAccess();
  uint64_t v17 = *(void *)(v3[5] + 16);
  if (v17)
  {
    uint64_t v18 = -v17;
    uint64_t v42 = v9;
    while (1)
    {
      uint64_t v20 = v3[5];
      if (v17 > *(void *)(v20 + 16)) {
        break;
      }
      unint64_t v21 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      uint64_t v22 = *(void *)(v9 + 72);
      uint64_t v23 = v22 * (v17 - 1);
      sub_226C2808C(v20 + v21 + v23, (uint64_t)v13);
      if ((sub_226C34408() & 1) == 0)
      {
        uint64_t v24 = v43;
        sub_226C2808C((uint64_t)v13, v43);
        sub_226C282E0(0, 0, v24);
        uint64_t v25 = (void *)v3[5];
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        v3[5] = v25;
        if ((result & 1) == 0)
        {
          uint64_t result = sub_226C29684(v25);
          uint64_t v25 = (void *)result;
          v3[5] = result;
        }
        uint64_t v26 = v25[2];
        if (v17 > v26) {
          goto LABEL_20;
        }
        sub_226C29698((uint64_t)v25 + v21 + v23);
        if (v22 > 0 || (char *)v25 + v21 + v23 >= (char *)v25 + v21 + v23 + v22 + (v18 + v26) * v22)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v22)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        _OWORD v25[2] = v26 - 1;
        v3[5] = v25;
        uint64_t v9 = v42;
      }
      uint64_t result = sub_226C29698((uint64_t)v13);
      --v17;
      if (__CFADD__(v18++, 1)) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
  }
  else
  {
LABEL_15:
    uint64_t v27 = (os_unfair_lock_s *)v3[4];
    swift_retain();
    os_unfair_lock_unlock(v27 + 4);
    swift_release();
    sub_226C27A70(&v44);
    uint64_t v28 = v44[2];
    if (v28)
    {
      uint64_t v29 = v40;
      uint64_t v30 = (uint64_t)v37;
      uint64_t v31 = &v37[*(int *)(v41 + 20)];
      uint64_t v32 = (char *)v44 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
      uint64_t v33 = *(void *)(v9 + 72);
      uint64_t v34 = v39;
      unint64_t v35 = (void (**)(char *, char *, uint64_t))(v38 + 16);
      unint64_t v36 = (void (**)(char *, uint64_t))(v38 + 8);
      do
      {
        sub_226C2808C((uint64_t)v32, v30);
        (*v35)(v34, v31, v29);
        sub_226C29698(v30);
        sub_226C33B68();
        (*v36)(v34, v29);
        v32 += v33;
        --v28;
      }
      while (v28);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for CUManualClock.WakeUp()
{
  uint64_t result = qword_268158EC0;
  if (!qword_268158EC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t static CUManualClock.Instant.+= infix(_:_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = MEMORY[0x22A665530](*a1, a1[1], a2, a3);
  *a1 = result;
  a1[1] = v5;
  return result;
}

uint64_t static CUManualClock.Instant.< infix(_:_:)()
{
  return sub_226C34408();
}

uint64_t sub_226C27A70(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for CUManualClock.WakeUp() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_226C29684(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_226C2849C(v6);
  *a1 = v3;
  return result;
}

uint64_t CUManualClock.sleep(until:tolerance:)(_OWORD *a1)
{
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = *a1;
  return MEMORY[0x270FA2498](sub_226C27B44, 0, 0);
}

uint64_t sub_226C27B44()
{
  long long v5 = *(_OWORD *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v5;
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_226C27C48;
  return MEMORY[0x270FA2318]();
}

uint64_t sub_226C27C48()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_226C27D60, 0, 0);
}

uint64_t sub_226C27D60()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226C27D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for CUManualClock.WakeUp();
  uint64_t v22 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(os_unfair_lock_s **)(a4 + 32);
  uint64_t v23 = sub_226C29E1C;
  uint64_t v24 = a4;
  swift_retain();
  os_unfair_lock_lock(v11 + 4);
  sub_226C1ADA0();
  os_unfair_lock_unlock(v11 + 4);
  swift_release();
  if (sub_226C34408())
  {
    uint64_t v12 = *(os_unfair_lock_s **)(a4 + 32);
    swift_retain();
    os_unfair_lock_lock(v12 + 4);
    swift_release();
    uint64_t v13 = (char *)v10 + *(int *)(v8 + 20);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v13, a1, v14);
    *uint64_t v10 = a2;
    v10[1] = a3;
    uint64_t v15 = *(void **)(a4 + 40);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 40) = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v15 = (void *)sub_226C29E68(0, v15[2] + 1, 1, v15);
      *(void *)(a4 + 40) = v15;
    }
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1)
    {
      uint64_t v15 = (void *)sub_226C29E68(v17 > 1, v18 + 1, 1, v15);
      *(void *)(a4 + 40) = v15;
    }
    _OWORD v15[2] = v18 + 1;
    sub_226C2A03C((uint64_t)v10, (uint64_t)v15+ ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))+ *(void *)(v22 + 72) * v18);
    int v19 = *(os_unfair_lock_s **)(a4 + 32);
    swift_retain();
    os_unfair_lock_unlock(v19 + 4);
    return swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
    return sub_226C33B68();
  }
}

uint64_t CUManualClock.Instant.advanced(by:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = MEMORY[0x22A665530](*v3, v3[1], a1, a2);
  *a3 = result;
  a3[1] = v6;
  return result;
}

void CUManualClock.Instant.duration(to:)()
{
}

uint64_t CUManualClock.Instant.hash(into:)()
{
  return sub_226C34448();
}

uint64_t static CUManualClock.Instant.== infix(_:_:)(void *a1, void *a2)
{
  return MEMORY[0x270F9FFC8](*a1, a1[1], *a2, a2[1]);
}

uint64_t CUManualClock.Instant.hashValue.getter()
{
  return sub_226C34388();
}

uint64_t sub_226C2808C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CUManualClock.WakeUp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CUManualClock.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CUManualClock.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

__n128 sub_226C28158@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  __n128 result = v3[1];
  *a1 = result;
  return result;
}

double sub_226C281A0@<D0>(_OWORD *a1@<X8>)
{
  *(void *)&double result = 1000000000;
  *a1 = xmmword_226C37400;
  return result;
}

uint64_t sub_226C281B0(_OWORD *a1)
{
  *(void *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 24) = *a1;
  return MEMORY[0x270FA2498](sub_226C281DC, 0, 0);
}

uint64_t sub_226C281DC()
{
  long long v5 = *(_OWORD *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v5;
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_226C27C48;
  return MEMORY[0x270FA2318]();
}

unint64_t sub_226C282E0(unint64_t result, int64_t a2, uint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  long long v5 = *(void **)v3;
  int64_t v6 = *(void *)(*(void *)v3 + 16);
  if (v6 < a2)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  unint64_t v7 = result;
  unint64_t v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    return result;
  }
  size_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v10 > v5[3] >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    long long v5 = (void *)sub_226C29E68(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *(void *)uint64_t v3 = v5;
  }
  uint64_t v14 = *(void *)(type metadata accessor for CUManualClock.WakeUp() - 8);
  uint64_t v15 = (char *)v5 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  uint64_t v16 = *(void *)(v14 + 72);
  uint64_t v17 = (uint64_t)&v15[v16 * v7];
  double result = swift_arrayDestroy();
  if (!v9) {
    goto LABEL_24;
  }
  uint64_t v18 = v5[2];
  if (__OFSUB__(v18, a2)) {
    goto LABEL_34;
  }
  double result = v17 + v16;
  unint64_t v19 = (unint64_t)&v15[v16 * a2];
  if (v17 + v16 < v19 || result >= v19 + (v18 - a2) * v16)
  {
    double result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (result != v19)
  {
    double result = swift_arrayInitWithTakeBackToFront();
  }
  uint64_t v21 = v5[2];
  BOOL v22 = __OFADD__(v21, v9);
  uint64_t v23 = v21 + v9;
  if (v22) {
    goto LABEL_35;
  }
  _OWORD v5[2] = v23;
LABEL_24:
  if (v16 >= 1) {
    sub_226C2808C(a3, v17);
  }
  return sub_226C2A0A0(a3);
}

uint64_t sub_226C2849C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CUManualClock.WakeUp();
  uint64_t v131 = *(void *)(v4 - 8);
  uint64_t v132 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v128 = (uint64_t)&v123 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v138 = (uint64_t)&v123 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v135 = (uint64_t)&v123 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v134 = (uint64_t)&v123 - v11;
  uint64_t v12 = a1[1];
  uint64_t result = sub_226C341A8();
  if (result >= v12)
  {
    if (v12 < 0) {
      goto LABEL_144;
    }
    if (v12) {
      return sub_226C28E28(0, v12, 1, a1);
    }
    return result;
  }
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  if (v12 < -1) {
    goto LABEL_143;
  }
  uint64_t v125 = result;
  if (v12 > 1)
  {
    uint64_t v15 = v14 >> 1;
    uint64_t result = sub_226C33B38();
    *(void *)(result + 16) = v15;
    uint64_t v16 = *(unsigned __int8 *)(v131 + 80);
    uint64_t v124 = result;
    unint64_t v130 = result + ((v16 + 32) & ~v16);
LABEL_13:
    uint64_t v18 = 0;
    uint64_t v19 = MEMORY[0x263F8EE78];
    v137 = a1;
    while (1)
    {
      uint64_t v21 = v18;
      uint64_t v22 = v18 + 1;
      if (v18 + 1 >= v12)
      {
        uint64_t v39 = v18 + 1;
      }
      else
      {
        uint64_t v126 = v2;
        uint64_t v23 = *a1;
        uint64_t v24 = *(void *)(v131 + 72);
        uint64_t v25 = *a1 + v24 * v22;
        uint64_t v129 = v18;
        uint64_t v26 = v134;
        sub_226C2808C(v25, v134);
        uint64_t v27 = v135;
        sub_226C2808C(v23 + v24 * v129, v135);
        LODWORD(v136) = sub_226C34408();
        sub_226C29698(v27);
        uint64_t v28 = v26;
        uint64_t v21 = v129;
        uint64_t result = sub_226C29698(v28);
        uint64_t v29 = v21 + 2;
        uint64_t v133 = v23;
        uint64_t v139 = v24;
        if (v21 + 2 >= v12)
        {
          uint64_t v32 = v21 + 2;
          uint64_t v38 = v24;
          if ((v136 & 1) == 0) {
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v30 = v24 * v22;
          uint64_t v31 = v23;
          uint64_t v32 = v29;
          uint64_t v33 = v24 * v29;
          do
          {
            uint64_t v34 = v12;
            uint64_t v35 = v134;
            sub_226C2808C(v31 + v33, v134);
            uint64_t v36 = v135;
            sub_226C2808C(v31 + v30, v135);
            int v37 = sub_226C34408();
            sub_226C29698(v36);
            uint64_t result = sub_226C29698(v35);
            if ((v136 ^ v37))
            {
              a1 = v137;
              uint64_t v21 = v129;
              uint64_t v12 = v34;
              uint64_t v38 = v139;
              if ((v136 & 1) == 0) {
                goto LABEL_38;
              }
              goto LABEL_25;
            }
            uint64_t v38 = v139;
            v31 += v139;
            ++v32;
            uint64_t v12 = v34;
          }
          while (v34 != v32);
          uint64_t v32 = v34;
          a1 = v137;
          uint64_t v21 = v129;
          if ((v136 & 1) == 0)
          {
LABEL_38:
            uint64_t v39 = v32;
            goto LABEL_39;
          }
        }
LABEL_25:
        if (v32 < v21) {
          goto LABEL_145;
        }
        uint64_t v39 = v32;
        if (v21 >= v32)
        {
LABEL_39:
          uint64_t v2 = v126;
          if (v39 >= v12) {
            goto LABEL_59;
          }
        }
        else
        {
          uint64_t v136 = v12;
          uint64_t v123 = v19;
          uint64_t v40 = v21;
          uint64_t v41 = 0;
          uint64_t v42 = v38 * (v32 - 1);
          uint64_t v43 = v32 * v38;
          uint64_t v44 = v40;
          uint64_t v45 = v40 * v38;
          do
          {
            if (v44 != v39 + v41 - 1)
            {
              uint64_t v46 = v133;
              if (!v133) {
                goto LABEL_150;
              }
              unint64_t v47 = v133 + v45;
              sub_226C2A03C(v133 + v45, v128);
              if (v45 < v42 || v47 >= v46 + v43)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v45 != v42)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              uint64_t result = sub_226C2A03C(v128, v46 + v42);
              a1 = v137;
              uint64_t v39 = v32;
              uint64_t v38 = v139;
            }
            ++v44;
            --v41;
            v42 -= v38;
            v43 -= v38;
            v45 += v38;
          }
          while (v44 < v39 + v41);
          uint64_t v19 = v123;
          uint64_t v2 = v126;
          uint64_t v21 = v129;
          uint64_t v12 = v136;
          if (v39 >= v136) {
            goto LABEL_59;
          }
        }
        if (__OFSUB__(v39, v21)) {
          goto LABEL_142;
        }
        if (v39 - v21 < v125)
        {
          if (__OFADD__(v21, v125)) {
            goto LABEL_146;
          }
          if (v21 + v125 >= v12) {
            uint64_t v48 = v12;
          }
          else {
            uint64_t v48 = v21 + v125;
          }
          if (v48 < v21)
          {
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
            return result;
          }
          if (v39 != v48)
          {
            uint64_t v129 = v21;
            uint64_t v123 = v19;
            uint64_t v126 = v2;
            uint64_t v127 = v48;
            uint64_t v49 = *(void *)(v131 + 72);
            uint64_t v50 = v49 * (v39 - 1);
            uint64_t v133 = v49;
            uint64_t v51 = v39 * v49;
            do
            {
              uint64_t v53 = 0;
              uint64_t v54 = v129;
              uint64_t v136 = v39;
              while (1)
              {
                uint64_t v139 = v54;
                uint64_t v55 = *a1;
                uint64_t v56 = v51;
                uint64_t v57 = v51 + v53 + *a1;
                char v58 = a1;
                uint64_t v59 = v134;
                sub_226C2808C(v57, v134);
                uint64_t v60 = v50;
                uint64_t v61 = v50 + v53 + v55;
                uint64_t v62 = v135;
                sub_226C2808C(v61, v135);
                LOBYTE(v55) = sub_226C34408();
                sub_226C29698(v62);
                uint64_t result = sub_226C29698(v59);
                if ((v55 & 1) == 0) {
                  break;
                }
                uint64_t v63 = *v58;
                if (!*v58) {
                  goto LABEL_148;
                }
                uint64_t v51 = v56;
                uint64_t v50 = v60;
                uint64_t v64 = v63 + v60 + v53;
                sub_226C2A03C(v63 + v56 + v53, v138);
                swift_arrayInitWithTakeFrontToBack();
                uint64_t result = sub_226C2A03C(v138, v64);
                v53 -= v133;
                uint64_t v54 = v139 + 1;
                uint64_t v52 = v136;
                a1 = v137;
                if (v136 == v139 + 1) {
                  goto LABEL_52;
                }
              }
              uint64_t v52 = v136;
              a1 = v58;
              uint64_t v50 = v60;
              uint64_t v51 = v56;
LABEL_52:
              uint64_t v39 = v52 + 1;
              v50 += v133;
              v51 += v133;
            }
            while (v39 != v127);
            uint64_t v39 = v127;
            uint64_t v2 = v126;
            uint64_t v19 = v123;
            uint64_t v21 = v129;
          }
        }
      }
LABEL_59:
      if (v39 < v21) {
        goto LABEL_137;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v136 = v39;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_226C29490(0, *(void *)(v19 + 16) + 1, 1, (char *)v19);
        uint64_t v19 = result;
      }
      unint64_t v66 = *(void *)(v19 + 16);
      unint64_t v65 = *(void *)(v19 + 24);
      unint64_t v20 = v66 + 1;
      if (v66 >= v65 >> 1)
      {
        uint64_t result = (uint64_t)sub_226C29490((char *)(v65 > 1), v66 + 1, 1, (char *)v19);
        uint64_t v19 = result;
      }
      *(void *)(v19 + 16) = v20;
      uint64_t v67 = v19 + 32;
      uint64_t v68 = (uint64_t *)(v19 + 32 + 16 * v66);
      uint64_t v69 = v136;
      *uint64_t v68 = v21;
      v68[1] = v69;
      if (v66)
      {
        while (1)
        {
          unint64_t v70 = v20 - 1;
          if (v20 >= 4)
          {
            unint64_t v75 = v67 + 16 * v20;
            uint64_t v76 = *(void *)(v75 - 64);
            uint64_t v77 = *(void *)(v75 - 56);
            BOOL v81 = __OFSUB__(v77, v76);
            uint64_t v78 = v77 - v76;
            if (v81) {
              goto LABEL_126;
            }
            uint64_t v80 = *(void *)(v75 - 48);
            uint64_t v79 = *(void *)(v75 - 40);
            BOOL v81 = __OFSUB__(v79, v80);
            uint64_t v73 = v79 - v80;
            char v74 = v81;
            if (v81) {
              goto LABEL_127;
            }
            unint64_t v82 = v20 - 2;
            uint64_t v83 = (uint64_t *)(v67 + 16 * (v20 - 2));
            uint64_t v85 = *v83;
            uint64_t v84 = v83[1];
            BOOL v81 = __OFSUB__(v84, v85);
            uint64_t v86 = v84 - v85;
            if (v81) {
              goto LABEL_128;
            }
            BOOL v81 = __OFADD__(v73, v86);
            uint64_t v87 = v73 + v86;
            if (v81) {
              goto LABEL_130;
            }
            if (v87 >= v78)
            {
              uint64_t v105 = (uint64_t *)(v67 + 16 * v70);
              uint64_t v107 = *v105;
              uint64_t v106 = v105[1];
              BOOL v81 = __OFSUB__(v106, v107);
              uint64_t v108 = v106 - v107;
              if (v81) {
                goto LABEL_136;
              }
              BOOL v98 = v73 < v108;
              goto LABEL_96;
            }
          }
          else
          {
            if (v20 != 3)
            {
              uint64_t v99 = *(void *)(v19 + 32);
              uint64_t v100 = *(void *)(v19 + 40);
              BOOL v81 = __OFSUB__(v100, v99);
              uint64_t v92 = v100 - v99;
              char v93 = v81;
              goto LABEL_90;
            }
            uint64_t v72 = *(void *)(v19 + 32);
            uint64_t v71 = *(void *)(v19 + 40);
            BOOL v81 = __OFSUB__(v71, v72);
            uint64_t v73 = v71 - v72;
            char v74 = v81;
          }
          if (v74) {
            goto LABEL_129;
          }
          unint64_t v82 = v20 - 2;
          uint64_t v88 = (uint64_t *)(v67 + 16 * (v20 - 2));
          uint64_t v90 = *v88;
          uint64_t v89 = v88[1];
          BOOL v91 = __OFSUB__(v89, v90);
          uint64_t v92 = v89 - v90;
          char v93 = v91;
          if (v91) {
            goto LABEL_131;
          }
          uint64_t v94 = (uint64_t *)(v67 + 16 * v70);
          uint64_t v96 = *v94;
          uint64_t v95 = v94[1];
          BOOL v81 = __OFSUB__(v95, v96);
          uint64_t v97 = v95 - v96;
          if (v81) {
            goto LABEL_133;
          }
          if (__OFADD__(v92, v97)) {
            goto LABEL_135;
          }
          if (v92 + v97 >= v73)
          {
            BOOL v98 = v73 < v97;
LABEL_96:
            if (v98) {
              unint64_t v70 = v82;
            }
            goto LABEL_98;
          }
LABEL_90:
          if (v93) {
            goto LABEL_132;
          }
          uint64_t v101 = (uint64_t *)(v67 + 16 * v70);
          uint64_t v103 = *v101;
          uint64_t v102 = v101[1];
          BOOL v81 = __OFSUB__(v102, v103);
          uint64_t v104 = v102 - v103;
          if (v81) {
            goto LABEL_134;
          }
          if (v104 < v92) {
            goto LABEL_15;
          }
LABEL_98:
          unint64_t v109 = v70 - 1;
          if (v70 - 1 >= v20)
          {
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
            goto LABEL_147;
          }
          uint64_t v110 = *a1;
          if (!*a1) {
            goto LABEL_149;
          }
          uint64_t v111 = v19;
          v112 = (uint64_t *)(v67 + 16 * v109);
          uint64_t v113 = *v112;
          uint64_t v114 = (void *)(v67 + 16 * v70);
          uint64_t v115 = v114[1];
          uint64_t result = sub_226C29078(v110 + *(void *)(v131 + 72) * *v112, v110 + *(void *)(v131 + 72) * *v114, v110 + *(void *)(v131 + 72) * v115, v130);
          if (v2) {
            goto LABEL_119;
          }
          if (v115 < v113) {
            goto LABEL_123;
          }
          if (v70 > *(void *)(v111 + 16)) {
            goto LABEL_124;
          }
          uint64_t *v112 = v113;
          *(void *)(v67 + 16 * v109 + 8) = v115;
          unint64_t v116 = *(void *)(v111 + 16);
          if (v70 >= v116) {
            goto LABEL_125;
          }
          uint64_t v19 = v111;
          unint64_t v20 = v116 - 1;
          uint64_t result = (uint64_t)memmove((void *)(v67 + 16 * v70), v114 + 2, 16 * (v116 - 1 - v70));
          *(void *)(v111 + 16) = v116 - 1;
          a1 = v137;
          if (v116 <= 2) {
            goto LABEL_15;
          }
        }
      }
      unint64_t v20 = 1;
LABEL_15:
      uint64_t v12 = a1[1];
      uint64_t v18 = v136;
      if (v136 >= v12)
      {
        uint64_t v17 = v124;
        goto LABEL_108;
      }
    }
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  unint64_t v130 = MEMORY[0x263F8EE78]
       + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
  if (v12 == 1)
  {
    uint64_t v124 = MEMORY[0x263F8EE78];
    goto LABEL_13;
  }
  unint64_t v20 = *(void *)(MEMORY[0x263F8EE78] + 16);
  uint64_t v19 = MEMORY[0x263F8EE78];
LABEL_108:
  uint64_t v124 = v17;
  if (v20 >= 2)
  {
    uint64_t v117 = *a1;
    do
    {
      unint64_t v118 = v20 - 2;
      if (v20 < 2) {
        goto LABEL_138;
      }
      if (!v117) {
        goto LABEL_151;
      }
      uint64_t v119 = *(void *)(v19 + 32 + 16 * v118);
      uint64_t v120 = *(void *)(v19 + 32 + 16 * (v20 - 1) + 8);
      uint64_t result = sub_226C29078(v117 + *(void *)(v131 + 72) * v119, v117 + *(void *)(v131 + 72) * *(void *)(v19 + 32 + 16 * (v20 - 1)), v117 + *(void *)(v131 + 72) * v120, v130);
      if (v2) {
        break;
      }
      if (v120 < v119) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_226C29670(v19);
        uint64_t v19 = result;
      }
      if (v118 >= *(void *)(v19 + 16)) {
        goto LABEL_140;
      }
      unint64_t v121 = (void *)(v19 + 32 + 16 * v118);
      *unint64_t v121 = v119;
      v121[1] = v120;
      unint64_t v122 = *(void *)(v19 + 16);
      if (v20 > v122) {
        goto LABEL_141;
      }
      uint64_t result = (uint64_t)memmove((void *)(v19 + 32 + 16 * (v20 - 1)), (const void *)(v19 + 32 + 16 * v20), 16 * (v122 - v20));
      *(void *)(v19 + 16) = v122 - 1;
      unint64_t v20 = v122 - 1;
    }
    while (v122 > 2);
  }
LABEL_119:
  swift_bridgeObjectRelease();
  *(void *)(v124 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_226C28E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = a1;
  uint64_t v25 = type metadata accessor for CUManualClock.WakeUp();
  uint64_t v7 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v27 = a3;
  uint64_t v23 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v30 = v16 * (v27 - 1);
    uint64_t v26 = v16;
    uint64_t v29 = v16 * v27;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v24;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_226C2808C(v29 + v17 + *a4, (uint64_t)v15);
      sub_226C2808C(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_226C34408();
      sub_226C29698((uint64_t)v11);
      uint64_t result = sub_226C29698((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v26;
        v29 += v26;
        if (++v27 == v23) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = v20 + v30 + v17;
      sub_226C2A03C(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_226C2A03C(v28, v21);
      v17 -= v26;
      if (v27 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_226C29078(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v35 = type metadata accessor for CUManualClock.WakeUp();
  uint64_t v8 = MEMORY[0x270FA5388](v35);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v33 - v12;
  uint64_t v15 = *(void *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_59;
  }
  int64_t v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_60;
  }
  uint64_t v17 = (uint64_t)(a2 - a1) / v15;
  unint64_t v38 = a1;
  unint64_t v37 = a4;
  if (v17 >= v16 / v15)
  {
    uint64_t v19 = v16 / v15 * v15;
    if (a4 < a2 || a2 + v19 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v26 = a4 + v19;
    unint64_t v36 = a4 + v19;
    unint64_t v38 = a2;
    unint64_t v34 = a1;
    if (v19 >= 1 && a1 < a2)
    {
      uint64_t v28 = -v15;
      do
      {
        unint64_t v29 = a3 + v28;
        sub_226C2808C(v26 + v28, (uint64_t)v13);
        unint64_t v30 = a2 + v28;
        sub_226C2808C(a2 + v28, (uint64_t)v10);
        char v31 = sub_226C34408();
        sub_226C29698((uint64_t)v10);
        sub_226C29698((uint64_t)v13);
        if (v31)
        {
          if (a3 < a2 || v29 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != a2)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v38 += v28;
        }
        else
        {
          unint64_t v32 = v36;
          v36 += v28;
          if (a3 < v32 || v29 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (a3 != v32)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v30 = a2;
        }
        unint64_t v26 = v36;
        if (v36 <= a4) {
          break;
        }
        a2 = v30;
        a3 += v28;
      }
      while (v30 > v34);
    }
  }
  else
  {
    uint64_t v18 = v17 * v15;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v20 = a4 + v18;
    unint64_t v36 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_226C2808C(a2, (uint64_t)v13);
        sub_226C2808C(a4, (uint64_t)v10);
        char v22 = sub_226C34408();
        sub_226C29698((uint64_t)v10);
        sub_226C29698((uint64_t)v13);
        unint64_t v23 = v38;
        if (v22)
        {
          unint64_t v24 = a2 + v15;
          if (v38 < a2 || v38 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v38 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v25 = v37 + v15;
          if (v38 < v37 || v38 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v38 != v37)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v37 = v25;
          unint64_t v24 = a2;
        }
        unint64_t v38 = v23 + v15;
        a4 = v37;
        if (v37 >= v20) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
  }
  sub_226C2958C(&v38, &v37, (uint64_t *)&v36);
  return 1;
}

char *sub_226C29490(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156EC0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_226C2958C(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for CUManualClock.WakeUp();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_17;
  }
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_226C29670(uint64_t a1)
{
  return sub_226C29490(0, *(void *)(a1 + 16), 0, (char *)a1);
}

size_t sub_226C29684(void *a1)
{
  return sub_226C29E68(0, a1[2], 0, a1);
}

uint64_t sub_226C29698(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CUManualClock.WakeUp();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226C296F4(uint64_t a1)
{
  return sub_226C27D78(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_226C29704()
{
  unint64_t result = qword_268156E88;
  if (!qword_268156E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E88);
  }
  return result;
}

unint64_t sub_226C2975C()
{
  unint64_t result = qword_268156E90;
  if (!qword_268156E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E90);
  }
  return result;
}

unint64_t sub_226C297B4()
{
  unint64_t result = qword_268156E98;
  if (!qword_268156E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156E98);
  }
  return result;
}

unint64_t sub_226C2980C()
{
  unint64_t result = qword_268156EA0;
  if (!qword_268156EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156EA0);
  }
  return result;
}

uint64_t type metadata accessor for CUManualClock()
{
  return self;
}

uint64_t method lookup function for CUManualClock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUManualClock);
}

uint64_t dispatch thunk of CUManualClock.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for CUManualClock.Instant()
{
  return &type metadata for CUManualClock.Instant;
}

uint64_t *sub_226C298C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    unint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_226C29990(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

_OWORD *sub_226C299FC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  unint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_226C29A7C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  unint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *sub_226C29B04(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  unint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_OWORD *sub_226C29B84(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  unint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_226C29C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226C29C18);
}

uint64_t sub_226C29C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t sub_226C29C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226C29CA0);
}

uint64_t sub_226C29CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E10);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

void sub_226C29D18()
{
  sub_226C29DB0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_226C29DB0()
{
  if (!qword_268156EB0)
  {
    unint64_t v0 = sub_226C33B78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268156EB0);
    }
  }
}

__n128 sub_226C29E1C@<Q0>(__n128 *a1@<X8>)
{
  swift_beginAccess();
  __n128 result = v1[1];
  *a1 = result;
  return result;
}

size_t sub_226C29E68(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156EB8);
  uint64_t v10 = *(void *)(type metadata accessor for CUManualClock.WakeUp() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  __n128 result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for CUManualClock.WakeUp() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_226C2A03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CUManualClock.WakeUp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226C2A0A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::UInt64 __swiftcall UpTicksPerSecond()()
{
  if (qword_26AD6CF28 != -1) {
    swift_once();
  }
  return qword_26AD6CF30;
}

uint64_t sub_226C2A154()
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  if (result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (!info.numer)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (info.denom)
  {
    unint64_t v1 = 1000000000 * info.denom;
    if (v1 >= info.numer)
    {
      qword_26AD6CF30 = v1 / info.numer;
      return result;
    }
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t SecondsFromAD1to1900.getter()
{
  return 0xDF3E8CA00;
}

uint64_t SecondsFromAD1to1970.getter()
{
  return 0xE77934880;
}

uint64_t SecondsFromAD1to2001.getter()
{
  return 0xEB1E31100;
}

uint64_t SecondsFrom1900to1970.getter()
{
  return 2082844800;
}

uint64_t SecondsFrom1900to2001.getter()
{
  return 3061152000;
}

uint64_t SecondsFrom1970to2001.getter()
{
  return 978307200;
}

uint64_t DaysFromAD1to1900_01_01.getter()
{
  return 693596;
}

uint64_t DaysFromAD1to1970_01_01.getter()
{
  return 719163;
}

uint64_t DaysFromAD1to2001_01_01.getter()
{
  return 730486;
}

uint64_t AttosecondsPerSecond.getter()
{
  return 1000000000000000000;
}

uint64_t FemtosecondsPerSecond.getter()
{
  return 1000000000000000;
}

uint64_t PicosecondsPerSecond.getter()
{
  return 1000000000000;
}

uint64_t NanosecondsPerMicrosecond.getter()
{
  return 1000;
}

uint64_t NanosecondsPerMillisecond.getter()
{
  return 1000000;
}

void *sub_226C2A278()
{
  return &unk_226C375D8;
}

uint64_t NanosecondsPerSecond.getter()
{
  return 1000000000;
}

void *sub_226C2A290()
{
  return &unk_226C375E0;
}

uint64_t MicrosecondsPerSecond.getter()
{
  return 1000000;
}

uint64_t MicrosecondsPerMillisecond.getter()
{
  return 1000;
}

void *sub_226C2A2B0()
{
  return &unk_226C375E8;
}

uint64_t MillisecondsPerSecond.getter()
{
  return 1000;
}

void *sub_226C2A2C4()
{
  return &unk_226C375F0;
}

uint64_t SecondsPerMinute.getter()
{
  return 60;
}

void *sub_226C2A2D8()
{
  return &unk_226C375F8;
}

uint64_t SecondsPerHour.getter()
{
  return 3600;
}

void *sub_226C2A2EC()
{
  return &unk_226C37600;
}

uint64_t SecondsPerDay.getter()
{
  return 86400;
}

uint64_t SecondsPerWeek.getter()
{
  return 604800;
}

uint64_t SecondsPerMonth.getter()
{
  return 2592000;
}

void *sub_226C2A31C()
{
  return &unk_226C37608;
}

uint64_t SecondsPerYear.getter()
{
  return 31536000;
}

uint64_t MinutesPerHour.getter()
{
  return 60;
}

uint64_t MinutesPerDay.getter()
{
  return 1440;
}

uint64_t HoursPerDay.getter()
{
  return 24;
}

uint64_t DaysPerWeek.getter()
{
  return 7;
}

uint64_t WeeksPerYear.getter()
{
  return 52;
}

uint64_t MonthsPerYear.getter()
{
  return 12;
}

uint64_t sub_226C2A364()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_226C2A394()
{
  return v0;
}

uint64_t sub_226C2A3A0()
{
  type metadata accessor for CUAsyncSerialQueue.DefaultActor();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  qword_268158ED8 = v0;
  return result;
}

BOOL static CUAsyncSerialQueue.OrderingPolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CUAsyncSerialQueue.OrderingPolicy.hash(into:)()
{
  return sub_226C34368();
}

uint64_t CUAsyncSerialQueue.OrderingPolicy.hashValue.getter()
{
  return sub_226C34388();
}

void CUAsyncSerialQueue.ordering.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t CUAsyncSerialQueue.queueDepth.getter()
{
  swift_beginAccess();
  return *(void *)(*(void *)(v0 + 24) + 16);
}

uint64_t CUAsyncSerialQueue.unownedExecutor.getter()
{
  if (*(void *)(v0 + 32)) {
    return sub_226C33DA8();
  }
  if (qword_268158ED0 != -1) {
    swift_once();
  }
  return qword_268158ED8;
}

uint64_t CUAsyncSerialQueue.__allocating_init(dispatchQueue:ordering:)(uint64_t a1, char *a2)
{
  uint64_t result = swift_allocObject();
  char v5 = *a2;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(unsigned char *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  *(void *)(result + 24) = v6;
  *(void *)(result + 32) = a1;
  *(unsigned char *)(result + 16) = v5;
  return result;
}

uint64_t CUAsyncSerialQueue.init(dispatchQueue:ordering:)(uint64_t a1, char *a2)
{
  char v3 = *a2;
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(unsigned char *)(v2 + 40) = 0;
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 24) = v4;
  *(void *)(v2 + 32) = a1;
  *(unsigned char *)(v2 + 16) = v3;
  return v2;
}

uint64_t CUAsyncSerialQueue.run<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  v4[9] = sub_226C2DC20(&qword_268156ED0, a2, (void (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue);
  uint64_t v6 = sub_226C33B48();
  v4[10] = v6;
  v4[11] = v5;
  return MEMORY[0x270FA2498](sub_226C2A66C, v6, v5);
}

uint64_t sub_226C2A66C()
{
  uint64_t v1 = v0[8];
  swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 24) + 16))
  {
    uint64_t v2 = v0[8];
LABEL_6:
    uint64_t v3 = *(void *)(v2 + 48);
    if (!__OFADD__(v3, 1))
    {
      *(void *)(v2 + 48) = v3 + 1;
      uint64_t v4 = swift_task_alloc();
      v0[12] = v4;
      *(void *)(v4 + 16) = v2;
      *(void *)(v4 + 24) = v3;
      uint64_t v5 = swift_task_alloc();
      v0[13] = v5;
      *(void *)(v5 + 16) = v2;
      *(void *)(v5 + 24) = v3;
      uint64_t v6 = (void *)swift_task_alloc();
      v0[14] = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_226C2A938;
      return MEMORY[0x270FA2338]();
    }
    __break(1u);
LABEL_17:
    __break(1u);
    return MEMORY[0x270FA2338]();
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = v0[8];
  if (*(unsigned char *)(v2 + 40)) {
    goto LABEL_6;
  }
  *(unsigned char *)(v2 + 40) = 1;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (*(unsigned char *)(v0[8] + 40) != 1) {
    goto LABEL_17;
  }
  sub_226C33C38();
  uint64_t v10 = (uint64_t (*)(uint64_t))(v0[6] + *(int *)v0[6]);
  int64_t v7 = (void *)swift_task_alloc();
  v0[16] = v7;
  *int64_t v7 = v0;
  v7[1] = sub_226C2ABC0;
  uint64_t v8 = v0[5];
  return v10(v8);
}

uint64_t sub_226C2A938()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_226C2AD60;
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    uint64_t v5 = sub_226C2AA5C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_226C2AA5C()
{
  uint64_t v1 = v0[15];
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0) {
    uint64_t result = swift_task_reportUnexpectedExecutor();
  }
  if (*(unsigned char *)(v0[8] + 40) == 1)
  {
    sub_226C33C38();
    if (v1)
    {
      sub_226C2BD94(v0[8]);
      uint64_t v3 = (uint64_t (*)(void))v0[1];
      return v3();
    }
    else
    {
      uint64_t v6 = (uint64_t (*)(uint64_t))(v0[6] + *(int *)v0[6]);
      uint64_t v4 = (void *)swift_task_alloc();
      v0[16] = v4;
      *uint64_t v4 = v0;
      v4[1] = sub_226C2ABC0;
      uint64_t v5 = v0[5];
      return v6(v5);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_226C2ABC0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 88);
  uint64_t v4 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v5 = sub_226C2ADCC;
  }
  else {
    uint64_t v5 = sub_226C2ACFC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_226C2ACFC()
{
  sub_226C2BD94(*(void *)(v0 + 64));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_226C2AD60()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_226C2ADCC()
{
  sub_226C2BD94(*(void *)(v0 + 64));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for CUAsyncSerialQueue()
{
  return self;
}

uint64_t sub_226C2AE54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a2;
  v3[3] = a3;
  type metadata accessor for CUAsyncSerialQueue();
  void v3[4] = sub_226C2DC20(&qword_268156ED0, v4, (void (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue);
  uint64_t v6 = sub_226C33B48();
  v3[5] = v6;
  v3[6] = v5;
  return MEMORY[0x270FA2498](sub_226C2AF10, v6, v5);
}

uint64_t sub_226C2AF10()
{
  sub_226C33C38();
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[2];
  uint64_t v3 = swift_task_alloc();
  v0[7] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_226C2B054;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_226C2B054()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_226C2B170;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_226C27D60;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_226C2B170()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_226C2B1D4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_226C01AFC;
  return sub_226C2AE54((uint64_t)v4, v2, v3);
}

uint64_t sub_226C2B26C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a3;
  uint64_t v38 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  uint64_t v39 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (uint64_t *)((char *)&v36 - v8);
  uint64_t v10 = sub_226C33C08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v36 - v15;
  type metadata accessor for CUAsyncSerialQueue();
  sub_226C2DC20(&qword_268156ED0, v17, (void (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue);
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v18 = (void (**)(char *, char *, uint64_t))(v11 + 32);
  if (*(unsigned char *)(a2 + 16))
  {
    sub_226C33C28();
    uint64_t v19 = (char *)v7 + *(int *)(v4 + 48);
    unint64_t v20 = (char *)v7 + *(int *)(v4 + 64);
    *uint64_t v7 = v37;
    (*v18)(v19, v14, v10);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156F00);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v20, v38, v21);
    char v22 = (void **)(a2 + 24);
    swift_beginAccess();
    unint64_t v23 = *(void **)(a2 + 24);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 24) = v23;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v23 = (void *)sub_226C2D6D0(0, v23[2] + 1, 1, v23);
      *char v22 = v23;
    }
    unint64_t v26 = v23[2];
    unint64_t v25 = v23[3];
    if (v26 >= v25 >> 1)
    {
      unint64_t v23 = (void *)sub_226C2D6D0(v25 > 1, v26 + 1, 1, v23);
      *char v22 = v23;
    }
    long long v23[2] = v26 + 1;
    sub_226C2DC68((uint64_t)v7, (uint64_t)v23+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(void *)(v39 + 72) * v26);
    sub_226C2B6D0(v22);
    return swift_endAccess();
  }
  else
  {
    sub_226C33BE8();
    uint64_t v28 = (char *)v9 + *(int *)(v4 + 48);
    unint64_t v29 = (char *)v9 + *(int *)(v4 + 64);
    void *v9 = v37;
    (*v18)(v28, v16, v10);
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156F00);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v29, v38, v30);
    char v31 = (void *)(a2 + 24);
    swift_beginAccess();
    unint64_t v32 = *(void **)(a2 + 24);
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 24) = v32;
    if ((v33 & 1) == 0)
    {
      unint64_t v32 = (void *)sub_226C2D6D0(0, v32[2] + 1, 1, v32);
      *char v31 = v32;
    }
    unint64_t v35 = v32[2];
    unint64_t v34 = v32[3];
    if (v35 >= v34 >> 1)
    {
      unint64_t v32 = (void *)sub_226C2D6D0(v34 > 1, v35 + 1, 1, v32);
      *char v31 = v32;
    }
    _OWORD v32[2] = v35 + 1;
    return sub_226C2DC68((uint64_t)v9, (uint64_t)v32+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(void *)(v39 + 72) * v35);
  }
}

uint64_t sub_226C2B6D0(void **a1)
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_226C2D8AC(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_226C2C520(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_226C2B780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CD0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_226C33C08();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  uint64_t v9 = (void *)swift_allocObject();
  _OWORD v9[2] = 0;
  v9[3] = 0;
  void v9[4] = a1;
  v9[5] = a2;
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  swift_retain();
  if (a2 == 1)
  {
    sub_226C088D0((uint64_t)v6, &qword_268156CD0);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    sub_226C33BF8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_226C33B48();
      uint64_t v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = &unk_268156F18;
  *(void *)(v13 + 24) = v9;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    _OWORD v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_226C2B9CC()
{
  return sub_226C2B780(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_226C2B9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156F00);
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  v5[11] = v7;
  v5[12] = *(void *)(v7 - 8);
  v5[13] = swift_task_alloc();
  type metadata accessor for CUAsyncSerialQueue();
  sub_226C2DC20(&qword_268156ED0, v8, (void (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue);
  uint64_t v10 = sub_226C33B48();
  return MEMORY[0x270FA2498](sub_226C2BB4C, v10, v9);
}

uint64_t sub_226C2BB4C()
{
  uint64_t v1 = v0[6];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v0[12];
    uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = (uint64_t *)v0[13];
      uint64_t v9 = v0[7];
      sub_226C2C4B8(v5, (uint64_t)v8);
      uint64_t v10 = *v8;
      sub_226C088D0((uint64_t)v8, &qword_268156EF0);
      if (v10 == v9) {
        break;
      }
      ++v7;
      v5 += v6;
      if (v3 == v7)
      {
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    uint64_t v11 = v0[13];
    uint64_t v13 = v0[10];
    uint64_t v12 = v0[11];
    uint64_t v14 = v0[8];
    uint64_t v15 = v0[9];
    swift_bridgeObjectRelease();
    sub_226C2C118(v7, v11);
    uint64_t v16 = v11 + *(int *)(v12 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v13, v11 + *(int *)(v12 + 64), v14);
    uint64_t v17 = sub_226C33C08();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    sub_226C33B88();
    sub_226C2DC20(&qword_268156F30, 255, MEMORY[0x263F8F488]);
    uint64_t v18 = swift_allocError();
    sub_226C33868();
    v0[5] = v18;
    sub_226C33B58();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_226C2BD94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  uint64_t v23 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (uint64_t *)((char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF8);
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (uint64_t *)((char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156F00);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C2DC20(&qword_268156ED0, v12, (void (*)(uint64_t))type metadata accessor for CUAsyncSerialQueue);
  sub_226C33B48();
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0) {
    uint64_t result = swift_task_reportUnexpectedExecutor();
  }
  if (*(unsigned char *)(a1 + 40) == 1)
  {
    uint64_t result = swift_beginAccess();
    uint64_t v14 = *(void *)(a1 + 24);
    if (*(void *)(v14 + 16))
    {
      sub_226C2C4B8(v14 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)), (uint64_t)v4);
      sub_226C2D8C0(0, 1);
      uint64_t v15 = *v4;
      uint64_t v16 = (char *)v4 + *(int *)(v2 + 48);
      uint64_t v17 = (char *)v4 + *(int *)(v2 + 64);
      uint64_t v18 = (char *)v7 + *(int *)(v5 + 48);
      uint64_t v19 = (char *)v7 + *(int *)(v5 + 64);
      *unint64_t v7 = v15;
      uint64_t v20 = sub_226C33C08();
      uint64_t v21 = *(void *)(v20 - 8);
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v16, v20);
      char v22 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v22(v19, v17, v8);
      v22(v11, v19, v8);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
      sub_226C33B68();
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    else
    {
      *(unsigned char *)(a1 + 40) = 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

size_t sub_226C2C118@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  size_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    size_t result = sub_226C2D8AC(v5);
    uint64_t v5 = (void *)result;
  }
  unint64_t v7 = v5[2];
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0) - 8);
    uint64_t v10 = *(void *)(v9 + 72);
    unint64_t v11 = (unint64_t)v5
        + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
        + v10 * a1;
    size_t result = sub_226C2DC68(v11, a2);
    if (v10 > 0 || v11 >= v11 + v10 + v10 * (v8 - a1))
    {
      size_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v10)
    {
      size_t result = swift_arrayInitWithTakeBackToFront();
    }
    _OWORD v5[2] = v8;
    *uint64_t v2 = v5;
  }
  return result;
}

uint64_t CUAsyncSerialQueue.deinit()
{
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t CUAsyncSerialQueue.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

unint64_t sub_226C2C2A8()
{
  unint64_t result = qword_268156EE8;
  if (!qword_268156EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156EE8);
  }
  return result;
}

uint64_t sub_226C2C2FC()
{
  if (*(void *)(v0 + 32)) {
    return sub_226C33DA8();
  }
  if (qword_268158ED0 != -1) {
    swift_once();
  }
  return qword_268158ED8;
}

uint64_t method lookup function for CUAsyncSerialQueue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUAsyncSerialQueue);
}

uint64_t dispatch thunk of CUAsyncSerialQueue.__allocating_init(dispatchQueue:ordering:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for CUAsyncSerialQueue.DefaultActor()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for CUAsyncSerialQueue.OrderingPolicy(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x226C2C480);
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

ValueMetadata *type metadata accessor for CUAsyncSerialQueue.OrderingPolicy()
{
  return &type metadata for CUAsyncSerialQueue.OrderingPolicy;
}

uint64_t sub_226C2C4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226C2C520(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  uint64_t v126 = *(void *)(v133 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v133);
  uint64_t v123 = (uint64_t)&v119 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v134 = (uint64_t)&v119 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v131 = (uint64_t)&v119 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v130 = (uint64_t)&v119 - v10;
  uint64_t v11 = a1[1];
  uint64_t result = sub_226C341A8();
  if (result >= v11)
  {
    if (v11 < 0) {
      goto LABEL_141;
    }
    if (v11) {
      return sub_226C2CEF0(0, v11, 1, a1);
    }
    return result;
  }
  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  if (v11 < -1) {
    goto LABEL_140;
  }
  uint64_t v132 = a1;
  uint64_t v121 = result;
  if (v11 <= 1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    unint64_t v125 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v126 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v126 + 80));
    uint64_t v120 = MEMORY[0x263F8EE78];
    if (v11 != 1)
    {
      unint64_t v18 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_106:
      if (v18 >= 2)
      {
        uint64_t v111 = *v132;
        do
        {
          unint64_t v112 = v18 - 2;
          if (v18 < 2) {
            goto LABEL_135;
          }
          if (!v111) {
            goto LABEL_148;
          }
          uint64_t v113 = v16;
          uint64_t v114 = v16 + 32;
          uint64_t v115 = *(void *)(v16 + 32 + 16 * v112);
          uint64_t v116 = *(void *)(v16 + 32 + 16 * (v18 - 1) + 8);
          uint64_t result = sub_226C2D164(v111 + *(void *)(v126 + 72) * v115, v111 + *(void *)(v126 + 72) * *(void *)(v114 + 16 * (v18 - 1)), v111 + *(void *)(v126 + 72) * v116, v125);
          if (v2) {
            break;
          }
          if (v116 < v115) {
            goto LABEL_136;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_226C29670(v113);
            uint64_t v113 = result;
          }
          if (v112 >= *(void *)(v113 + 16)) {
            goto LABEL_137;
          }
          uint64_t v117 = (void *)(v113 + 32 + 16 * v112);
          *uint64_t v117 = v115;
          v117[1] = v116;
          unint64_t v118 = *(void *)(v113 + 16);
          if (v18 > v118) {
            goto LABEL_138;
          }
          uint64_t v16 = v113;
          uint64_t result = (uint64_t)memmove((void *)(v113 + 32 + 16 * (v18 - 1)), (const void *)(v113 + 32 + 16 * v18), 16 * (v118 - v18));
          *(void *)(v113 + 16) = v118 - 1;
          unint64_t v18 = v118 - 1;
        }
        while (v118 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(void *)(v120 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = v13 >> 1;
    uint64_t result = sub_226C33B38();
    *(void *)(result + 16) = v14;
    uint64_t v15 = *(unsigned __int8 *)(v126 + 80);
    uint64_t v120 = result;
    unint64_t v125 = result + ((v15 + 32) & ~v15);
  }
  uint64_t v17 = 0;
  uint64_t v16 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v19 = v17;
    uint64_t v20 = v17 + 1;
    uint64_t v124 = v17;
    if (v17 + 1 >= v11)
    {
      ++v17;
      goto LABEL_24;
    }
    uint64_t v21 = *v132;
    uint64_t v22 = *(void *)(v126 + 72);
    uint64_t v23 = v130;
    sub_226C2C4B8(*v132 + v22 * v20, v130);
    uint64_t v24 = v21 + v22 * v17;
    uint64_t v25 = v131;
    sub_226C2C4B8(v24, v131);
    LODWORD(v129) = sub_226C33BD8();
    sub_226C088D0(v25, &qword_268156EF0);
    uint64_t result = sub_226C088D0(v23, &qword_268156EF0);
    uint64_t v17 = v19 + 2;
    uint64_t v128 = v21;
    uint64_t v135 = v22;
    if (v19 + 2 >= v11) {
      goto LABEL_21;
    }
    uint64_t v127 = v2;
    uint64_t v26 = v16;
    uint64_t v27 = v22 * v20;
    uint64_t v28 = v19 + 2;
    uint64_t v29 = v22 * v28;
    do
    {
      uint64_t v30 = v11;
      uint64_t v31 = v130;
      sub_226C2C4B8(v21 + v29, v130);
      uint64_t v32 = v131;
      sub_226C2C4B8(v21 + v27, v131);
      int v33 = sub_226C33BD8();
      sub_226C088D0(v32, &qword_268156EF0);
      uint64_t result = sub_226C088D0(v31, &qword_268156EF0);
      if ((v129 ^ v33))
      {
        uint64_t v16 = v26;
        uint64_t v17 = v28;
        uint64_t v2 = v127;
        uint64_t v19 = v124;
        uint64_t v11 = v30;
        if (v129) {
          goto LABEL_42;
        }
        goto LABEL_24;
      }
      v21 += v135;
      ++v28;
      uint64_t v11 = v30;
    }
    while (v30 != v28);
    uint64_t v16 = v26;
    uint64_t v17 = v30;
    uint64_t v2 = v127;
    uint64_t v19 = v124;
LABEL_21:
    if ((v129 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_42:
    uint64_t v51 = v135;
    if (v17 < v19) {
      goto LABEL_142;
    }
    if (v19 < v17) {
      break;
    }
LABEL_24:
    unint64_t v34 = v132;
    if (v17 < v11) {
      goto LABEL_25;
    }
LABEL_57:
    if (v17 < v19) {
      goto LABEL_134;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_226C29490(0, *(void *)(v16 + 16) + 1, 1, (char *)v16);
      uint64_t v16 = result;
    }
    unint64_t v60 = *(void *)(v16 + 16);
    unint64_t v59 = *(void *)(v16 + 24);
    unint64_t v18 = v60 + 1;
    if (v60 >= v59 >> 1)
    {
      uint64_t result = (uint64_t)sub_226C29490((char *)(v59 > 1), v60 + 1, 1, (char *)v16);
      uint64_t v16 = result;
    }
    uint64_t v127 = v2;
    *(void *)(v16 + 16) = v18;
    uint64_t v61 = v16 + 32;
    uint64_t v62 = (uint64_t *)(v16 + 32 + 16 * v60);
    uint64_t *v62 = v19;
    v62[1] = v17;
    if (v60)
    {
      while (1)
      {
        unint64_t v63 = v18 - 1;
        if (v18 >= 4)
        {
          unint64_t v68 = v61 + 16 * v18;
          uint64_t v69 = *(void *)(v68 - 64);
          uint64_t v70 = *(void *)(v68 - 56);
          BOOL v74 = __OFSUB__(v70, v69);
          uint64_t v71 = v70 - v69;
          if (v74) {
            goto LABEL_123;
          }
          uint64_t v73 = *(void *)(v68 - 48);
          uint64_t v72 = *(void *)(v68 - 40);
          BOOL v74 = __OFSUB__(v72, v73);
          uint64_t v66 = v72 - v73;
          char v67 = v74;
          if (v74) {
            goto LABEL_124;
          }
          unint64_t v75 = v18 - 2;
          uint64_t v76 = (uint64_t *)(v61 + 16 * (v18 - 2));
          uint64_t v78 = *v76;
          uint64_t v77 = v76[1];
          BOOL v74 = __OFSUB__(v77, v78);
          uint64_t v79 = v77 - v78;
          if (v74) {
            goto LABEL_125;
          }
          BOOL v74 = __OFADD__(v66, v79);
          uint64_t v80 = v66 + v79;
          if (v74) {
            goto LABEL_127;
          }
          if (v80 >= v71)
          {
            BOOL v98 = (uint64_t *)(v61 + 16 * v63);
            uint64_t v100 = *v98;
            uint64_t v99 = v98[1];
            BOOL v74 = __OFSUB__(v99, v100);
            uint64_t v101 = v99 - v100;
            if (v74) {
              goto LABEL_133;
            }
            BOOL v91 = v66 < v101;
            goto LABEL_94;
          }
        }
        else
        {
          if (v18 != 3)
          {
            uint64_t v92 = *(void *)(v16 + 32);
            uint64_t v93 = *(void *)(v16 + 40);
            BOOL v74 = __OFSUB__(v93, v92);
            uint64_t v85 = v93 - v92;
            char v86 = v74;
            goto LABEL_88;
          }
          uint64_t v65 = *(void *)(v16 + 32);
          uint64_t v64 = *(void *)(v16 + 40);
          BOOL v74 = __OFSUB__(v64, v65);
          uint64_t v66 = v64 - v65;
          char v67 = v74;
        }
        if (v67) {
          goto LABEL_126;
        }
        unint64_t v75 = v18 - 2;
        BOOL v81 = (uint64_t *)(v61 + 16 * (v18 - 2));
        uint64_t v83 = *v81;
        uint64_t v82 = v81[1];
        BOOL v84 = __OFSUB__(v82, v83);
        uint64_t v85 = v82 - v83;
        char v86 = v84;
        if (v84) {
          goto LABEL_128;
        }
        uint64_t v87 = (uint64_t *)(v61 + 16 * v63);
        uint64_t v89 = *v87;
        uint64_t v88 = v87[1];
        BOOL v74 = __OFSUB__(v88, v89);
        uint64_t v90 = v88 - v89;
        if (v74) {
          goto LABEL_130;
        }
        if (__OFADD__(v85, v90)) {
          goto LABEL_132;
        }
        if (v85 + v90 >= v66)
        {
          BOOL v91 = v66 < v90;
LABEL_94:
          if (v91) {
            unint64_t v63 = v75;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v86) {
          goto LABEL_129;
        }
        uint64_t v94 = (uint64_t *)(v61 + 16 * v63);
        uint64_t v96 = *v94;
        uint64_t v95 = v94[1];
        BOOL v74 = __OFSUB__(v95, v96);
        uint64_t v97 = v95 - v96;
        if (v74) {
          goto LABEL_131;
        }
        if (v97 < v85) {
          goto LABEL_14;
        }
LABEL_96:
        uint64_t v102 = v17;
        unint64_t v103 = v63 - 1;
        if (v63 - 1 >= v18)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
          goto LABEL_144;
        }
        if (!*v132) {
          goto LABEL_146;
        }
        uint64_t v104 = v16;
        uint64_t v105 = (uint64_t *)(v61 + 16 * v103);
        uint64_t v106 = *v105;
        uint64_t v107 = (void *)(v61 + 16 * v63);
        uint64_t v108 = v107[1];
        uint64_t v109 = v127;
        uint64_t result = sub_226C2D164(*v132 + *(void *)(v126 + 72) * *v105, *v132 + *(void *)(v126 + 72) * *v107, *v132 + *(void *)(v126 + 72) * v108, v125);
        uint64_t v127 = v109;
        if (v109) {
          goto LABEL_117;
        }
        if (v108 < v106) {
          goto LABEL_120;
        }
        if (v63 > *(void *)(v104 + 16)) {
          goto LABEL_121;
        }
        *uint64_t v105 = v106;
        *(void *)(v61 + 16 * v103 + 8) = v108;
        unint64_t v110 = *(void *)(v104 + 16);
        if (v63 >= v110) {
          goto LABEL_122;
        }
        uint64_t v16 = v104;
        unint64_t v18 = v110 - 1;
        uint64_t result = (uint64_t)memmove((void *)(v61 + 16 * v63), v107 + 2, 16 * (v110 - 1 - v63));
        *(void *)(v104 + 16) = v110 - 1;
        BOOL v91 = v110 > 2;
        uint64_t v17 = v102;
        if (!v91) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v18 = 1;
LABEL_14:
    uint64_t v11 = v132[1];
    uint64_t v2 = v127;
    if (v17 >= v11) {
      goto LABEL_106;
    }
  }
  uint64_t v129 = v11;
  uint64_t v127 = v2;
  uint64_t v119 = v16;
  uint64_t v52 = 0;
  uint64_t v53 = v135 * (v17 - 1);
  uint64_t v54 = v17 * v135;
  uint64_t v55 = v19;
  uint64_t v56 = v19 * v135;
  unint64_t v34 = v132;
  do
  {
    if (v55 != v17 + v52 - 1)
    {
      uint64_t v57 = v128;
      if (!v128) {
        goto LABEL_147;
      }
      unint64_t v58 = v128 + v56;
      sub_226C2DC68(v128 + v56, v123);
      if (v56 < v53 || v58 >= v57 + v54)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v56 != v53)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t result = sub_226C2DC68(v123, v57 + v53);
      unint64_t v34 = v132;
      uint64_t v51 = v135;
    }
    ++v55;
    --v52;
    v53 -= v51;
    v54 -= v51;
    v56 += v51;
  }
  while (v55 < v17 + v52);
  uint64_t v16 = v119;
  uint64_t v2 = v127;
  uint64_t v19 = v124;
  uint64_t v11 = v129;
  if (v17 >= v129) {
    goto LABEL_57;
  }
LABEL_25:
  if (__OFSUB__(v17, v19)) {
    goto LABEL_139;
  }
  if (v17 - v19 >= v121) {
    goto LABEL_57;
  }
  if (__OFADD__(v19, v121)) {
    goto LABEL_143;
  }
  if (v19 + v121 >= v11) {
    uint64_t v35 = v11;
  }
  else {
    uint64_t v35 = v19 + v121;
  }
  if (v35 >= v19)
  {
    if (v17 != v35)
    {
      uint64_t v119 = v16;
      uint64_t v127 = v2;
      uint64_t v36 = *(void *)(v126 + 72);
      uint64_t v37 = v36 * (v17 - 1);
      uint64_t v128 = v36;
      uint64_t v38 = v17 * v36;
      uint64_t v122 = v35;
      do
      {
        uint64_t v40 = 0;
        uint64_t v129 = v17;
        while (1)
        {
          uint64_t v135 = v19;
          uint64_t v41 = *v34;
          uint64_t v42 = v38;
          uint64_t v43 = v38 + v40 + *v34;
          uint64_t v44 = v130;
          uint64_t v45 = v34;
          sub_226C2C4B8(v43, v130);
          uint64_t v46 = v37;
          uint64_t v47 = v37 + v40 + v41;
          uint64_t v48 = v131;
          sub_226C2C4B8(v47, v131);
          LOBYTE(v41) = sub_226C33BD8();
          sub_226C088D0(v48, &qword_268156EF0);
          uint64_t result = sub_226C088D0(v44, &qword_268156EF0);
          if ((v41 & 1) == 0) {
            break;
          }
          uint64_t v49 = *v45;
          if (!*v45) {
            goto LABEL_145;
          }
          uint64_t v38 = v42;
          uint64_t v37 = v46;
          uint64_t v50 = v49 + v46 + v40;
          sub_226C2DC68(v49 + v42 + v40, v134);
          swift_arrayInitWithTakeFrontToBack();
          uint64_t result = sub_226C2DC68(v134, v50);
          uint64_t v39 = v129;
          v40 -= v128;
          uint64_t v19 = v135 + 1;
          unint64_t v34 = v132;
          if (v129 == v135 + 1) {
            goto LABEL_35;
          }
        }
        uint64_t v39 = v129;
        uint64_t v37 = v46;
        uint64_t v38 = v42;
        unint64_t v34 = v45;
LABEL_35:
        uint64_t v17 = v39 + 1;
        v37 += v128;
        v38 += v128;
        uint64_t v19 = v124;
      }
      while (v17 != v122);
      uint64_t v17 = v122;
      uint64_t v2 = v127;
      uint64_t v16 = v119;
    }
    goto LABEL_57;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
  return result;
}

uint64_t sub_226C2CEF0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v25 = a1;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  uint64_t v7 = MEMORY[0x270FA5388](v28);
  uint64_t v29 = (uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v23 - v14;
  uint64_t v27 = a3;
  uint64_t v24 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v31 = v16 * (v27 - 1);
    uint64_t v26 = v16;
    uint64_t v30 = v16 * v27;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v25;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_226C2C4B8(v30 + v17 + *a4, (uint64_t)v15);
      sub_226C2C4B8(v31 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_226C33BD8();
      sub_226C088D0((uint64_t)v11, &qword_268156EF0);
      uint64_t result = sub_226C088D0((uint64_t)v15, &qword_268156EF0);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v31 += v26;
        v30 += v26;
        if (++v27 == v24) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = a4;
      uint64_t v22 = v20 + v31 + v17;
      sub_226C2DC68(v20 + v30 + v17, v29);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_226C2DC68(v29, v22);
      v17 -= v26;
      ++v18;
      a4 = v21;
      if (v27 == v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_226C2D164(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  uint64_t v8 = MEMORY[0x270FA5388](v41);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v40 = (uint64_t)&v37 - v12;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_61;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_62;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v44 = a1;
  unint64_t v43 = a4;
  if (v16 >= v15 / v14)
  {
    uint64_t v18 = v15 / v14 * v14;
    if (a4 < a2 || a2 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v26 = a4 + v18;
    unint64_t v42 = a4 + v18;
    unint64_t v44 = a2;
    unint64_t v39 = a1;
    if (v18 >= 1 && a1 < a2)
    {
      uint64_t v28 = -v14;
      unint64_t v38 = a4;
      do
      {
        unint64_t v29 = a3 + v28;
        unint64_t v30 = a3;
        uint64_t v31 = v40;
        sub_226C2C4B8(v26 + v28, v40);
        unint64_t v32 = a2 + v28;
        sub_226C2C4B8(a2 + v28, (uint64_t)v10);
        char v33 = sub_226C33BD8();
        sub_226C088D0((uint64_t)v10, &qword_268156EF0);
        sub_226C088D0(v31, &qword_268156EF0);
        if (v33)
        {
          if (v30 < a2 || v29 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v35 = v38;
          }
          else
          {
            BOOL v34 = v30 == a2;
            unint64_t v35 = v38;
            if (!v34) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          v44 += v28;
        }
        else
        {
          unint64_t v36 = v42;
          v42 += v28;
          if (v30 < v36 || v29 >= v36)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v32 = a2;
          }
          else
          {
            if (v30 != v36) {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v32 = a2;
          }
          unint64_t v35 = v38;
        }
        unint64_t v26 = v42;
        if (v42 <= v35) {
          break;
        }
        a2 = v32;
        a3 = v29;
      }
      while (v32 > v39);
    }
  }
  else
  {
    uint64_t v17 = v16 * v14;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v19 = a4 + v17;
    unint64_t v42 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      uint64_t v21 = v40;
      do
      {
        sub_226C2C4B8(a2, v21);
        sub_226C2C4B8(a4, (uint64_t)v10);
        char v22 = sub_226C33BD8();
        sub_226C088D0((uint64_t)v10, &qword_268156EF0);
        sub_226C088D0(v21, &qword_268156EF0);
        unint64_t v23 = v44;
        if (v22)
        {
          unint64_t v24 = a2 + v14;
          if (v44 < a2 || v44 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v44 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v25 = v43 + v14;
          if (v44 < v43 || v44 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v44 != v43)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v43 = v25;
          unint64_t v24 = a2;
        }
        unint64_t v44 = v23 + v14;
        a4 = v43;
        if (v43 >= v19) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
  }
  sub_226C2D5E8(&v44, &v43, (uint64_t *)&v42);
  return 1;
}

uint64_t sub_226C2D5E8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_17;
  }
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

size_t sub_226C2D6D0(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156F08);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

size_t sub_226C2D8AC(void *a1)
{
  return sub_226C2D6D0(0, a1[2], 0, a1);
}

uint64_t sub_226C2D8C0(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  size_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = (void *)sub_226C2D6D0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0) - 8);
  uint64_t v13 = (char *)v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * v6;
  unint64_t v16 = &v13[v14 * v6];
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_24;
  }
  uint64_t v17 = v4[2];
  if (__OFSUB__(v17, a2)) {
    goto LABEL_30;
  }
  if (v15 < v14 * a2 || v16 >= &v13[v14 * a2 + (v17 - a2) * v14])
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v15 != v14 * a2)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  uint64_t v19 = v4[2];
  BOOL v20 = __OFADD__(v19, v8);
  uint64_t v21 = v19 - v7;
  if (!v20)
  {
    v4[2] = v21;
LABEL_24:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_226C2DA58()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_226C2DA98()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *unint64_t v4 = v1;
  v4[1] = sub_226C01AFC;
  return sub_226C2B9D4((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_226C2DB30()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226C2DB68(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_226C02D20;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268156F20 + dword_268156F20);
  return v6(a1, v4);
}

uint64_t sub_226C2DC20(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_226C2DC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_226C2DCD0(uint64_t a1)
{
  return sub_226C2B26C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_226C2DCD8()
{
  uint64_t v0 = sub_226C33708();
  __swift_allocate_value_buffer(v0, qword_2681590E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2681590E8);
  sub_226C0D368();
  swift_bridgeObjectRetain();
  return sub_226C336F8();
}

uint64_t CULocaleManager.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager_locale;
  uint64_t v4 = sub_226C33698();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_226C2DDDC()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_226C2DE88@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_226C30394(&qword_268156F38, (void (*)(uint64_t))type metadata accessor for CULocaleManager);
  sub_226C336B8();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver);
  return swift_unknownObjectRetain();
}

uint64_t sub_226C2DF3C()
{
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for CULocaleManager()
{
  uint64_t result = qword_2681591B0;
  if (!qword_2681591B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id CULocaleManager.preferredUnitSpeed.getter()
{
  sub_226C33BC8();
  sub_226C33BB8();
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_226C30394(&qword_268156F38, (void (*)(uint64_t))type metadata accessor for CULocaleManager);
  sub_226C336B8();
  swift_release();
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed);
  swift_release();
  return v1;
}

id sub_226C2E180@<X0>(void *a1@<X8>)
{
  id result = CULocaleManager.preferredUnitSpeed.getter();
  *a1 = result;
  return result;
}

void sub_226C2E1AC(id *a1)
{
}

void sub_226C2E1D8(void *a1)
{
  sub_226C33BC8();
  sub_226C33BB8();
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_226C30394(&qword_268156F38, (void (*)(uint64_t))type metadata accessor for CULocaleManager);
  sub_226C336A8();
  swift_release();
  swift_release();
}

void sub_226C2E334(uint64_t a1, void *a2)
{
  sub_226C33BC8();
  sub_226C33BB8();
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = *(id *)(a1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed);
  *(void *)(a1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed) = a2;
  id v4 = a2;
  swift_release();
}

void sub_226C2E3FC()
{
  sub_226C2E334(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t CULocaleManager.preferredUnitSpeedLabel.getter()
{
  sub_226C33BC8();
  sub_226C33BB8();
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_226C33BB8();
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_226C1D9FC(0, &qword_268156F40);
  swift_getKeyPath();
  sub_226C30394(&qword_268156F38, (void (*)(uint64_t))type metadata accessor for CULocaleManager);
  sub_226C336B8();
  swift_release();
  uint64_t v1 = OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed;
  id v2 = *(id *)(v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed);
  swift_release();
  id v3 = objc_msgSend(self, sel_milesPerHour);
  char v4 = sub_226C33DC8();

  sub_226C33BB8();
  sub_226C33B48();
  char isCurrentExecutor = swift_task_isCurrentExecutor();
  if (v4)
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    sub_226C336B8();
    swift_release();
    id v6 = *(id *)(v0 + v1);
    swift_release();
    id v7 = objc_msgSend(v6, sel_symbol);

    sub_226C33998();
    uint64_t v8 = sub_226C339B8();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((isCurrentExecutor & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    sub_226C336B8();
    swift_release();
    id v9 = *(id *)(v0 + v1);
    swift_release();
    id v10 = objc_msgSend(v9, sel_symbol);

    uint64_t v8 = sub_226C33998();
    swift_release();
  }
  return v8;
}

uint64_t CULocaleManager.__allocating_init(locale:autoStart:)(uint64_t a1, int a2)
{
  uint64_t v4 = swift_allocObject();
  CULocaleManager.init(locale:autoStart:)(a1, a2);
  return v4;
}

uint64_t CULocaleManager.init(locale:autoStart:)(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  LODWORD(v28) = a2;
  uint64_t v24 = sub_226C33838();
  uint64_t v27 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  id v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_226C33858();
  uint64_t v25 = *(void *)(v7 - 8);
  uint64_t v26 = v7;
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E50);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver) = 0;
  sub_226C336C8();
  uint64_t v13 = v2 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager_locale;
  uint64_t v14 = sub_226C33698();
  uint64_t v15 = *(void *)(v14 - 8);
  unint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v16(v13, a1, v14);
  uint64_t v29 = a1;
  v16((uint64_t)v12, a1, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  id v17 = _s14CoreUtilsSwift15CULocaleManagerC26preferredUnitSpeedUncached6localeSo06NSUnitH0C10Foundation6LocaleVSg_tFZ_0((uint64_t)v12);
  sub_226C26188((uint64_t)v12);
  *(void *)(v3 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager__preferredUnitSpeed) = v17;
  if (v28)
  {
    sub_226C1D9FC(0, &qword_268156CA8);
    uint64_t v28 = sub_226C33D58();
    uint64_t v18 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_226C2FEC0;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_226C2F024;
    aBlock[3] = &block_descriptor_0;
    uint64_t v19 = _Block_copy(aBlock);
    swift_retain();
    sub_226C33848();
    uint64_t v30 = MEMORY[0x263F8EE78];
    sub_226C30394(&qword_268156F48, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156F50);
    sub_226C2FF84();
    uint64_t v20 = v24;
    sub_226C33ED8();
    uint64_t v21 = (void *)v28;
    MEMORY[0x22A664E80](0, v9, v6, v19);
    _Block_release(v19);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v29, v14);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v20);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
    swift_release();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v29, v14);
  }
  return v3;
}

Swift::Void __swiftcall CULocaleManager.start()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_226C33BC8();
  sub_226C33BB8();
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  aBlock[0] = v0;
  sub_226C30394(&qword_268156F38, (void (*)(uint64_t))type metadata accessor for CULocaleManager);
  sub_226C336B8();
  swift_release();
  if (*(void *)((char *)v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver))
  {
    swift_release();
  }
  else
  {
    if (qword_2681590E0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_226C33708();
    __swift_project_value_buffer(v3, (uint64_t)qword_2681590E8);
    uint64_t v4 = sub_226C336E8();
    os_log_type_t v5 = sub_226C33D38();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_226BFE000, v4, v5, "Start", v6, 2u);
      MEMORY[0x22A665D30](v6, -1, -1);
    }

    id v7 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v8 = *MEMORY[0x263EFF458];
    id v9 = objc_msgSend(self, sel_mainQueue);
    uint64_t v10 = swift_allocObject();
    swift_weakInit();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    *(void *)(v11 + 24) = v2;
    aBlock[4] = sub_226C30050;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_226C2F750;
    aBlock[3] = &block_descriptor_9;
    uint64_t v12 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v7, sel_addObserverForName_object_queue_usingBlock_, v8, 0, v9, v12);
    _Block_release(v12);

    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    aBlock[0] = v1;
    sub_226C336A8();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_226C2F024(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t CULocaleManager.deinit()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  uint64_t v2 = v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___observationRegistrar;
  sub_226C30394(&qword_268156F38, (void (*)(uint64_t))type metadata accessor for CULocaleManager);
  sub_226C336B8();
  swift_release();
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver);
  if (v3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    id v5 = objc_msgSend(v4, sel_defaultCenter);
    objc_msgSend(v5, sel_removeObserver_, v3);
    swift_unknownObjectRelease();
  }
  uint64_t v6 = v1 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager_locale;
  uint64_t v7 = sub_226C33698();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_unknownObjectRelease();

  uint64_t v8 = sub_226C336D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v2, v8);
  return v1;
}

uint64_t CULocaleManager.__deallocating_deinit()
{
  CULocaleManager.deinit();
  return swift_deallocClassInstance();
}

void sub_226C2F25C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E50);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C33BC8();
  sub_226C33BB8();
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    uint64_t v11 = v0;
    swift_getKeyPath();
    uint64_t v12 = v5;
    sub_226C30394(&qword_268156F38, (void (*)(uint64_t))type metadata accessor for CULocaleManager);
    sub_226C336B8();
    swift_release();
    if (*(void *)(v5 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver))
    {
      uint64_t v6 = v5 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager_locale;
      uint64_t v7 = sub_226C33698();
      uint64_t v8 = *(void *)(v7 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v3, v6, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v3, 0, 1, v7);
      id v9 = _s14CoreUtilsSwift15CULocaleManagerC26preferredUnitSpeedUncached6localeSo06NSUnitH0C10Foundation6LocaleVSg_tFZ_0((uint64_t)v3);
      sub_226C26188((uint64_t)v3);
      sub_226C33BB8();
      sub_226C33B48();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      *(&v11 - 2) = v5;
      *(&v11 - 1) = (uint64_t)v9;
      uint64_t v12 = v5;
      sub_226C336A8();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_226C2F5C4(uint64_t a1, uint64_t a2)
{
  sub_226C33BB8();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_226C1ADA0();
  if (v2) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    sub_226C33F48();
    sub_226C33A28();
    sub_226C34488();
    sub_226C33A28();
    swift_bridgeObjectRelease();
    sub_226C33A28();
    uint64_t result = sub_226C34098();
    __break(1u);
  }
  return result;
}

uint64_t sub_226C2F750(uint64_t a1)
{
  uint64_t v2 = sub_226C33508();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_226C334D8();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Void __swiftcall CULocaleManager.stop()()
{
  sub_226C33BC8();
  sub_226C33BB8();
  sub_226C33B48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_226C30394(&qword_268156F38, (void (*)(uint64_t))type metadata accessor for CULocaleManager);
  sub_226C336B8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver);
  if (v1)
  {
    uint64_t v2 = qword_2681590E0;
    swift_unknownObjectRetain();
    if (v2 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_226C33708();
    __swift_project_value_buffer(v3, (uint64_t)qword_2681590E8);
    uint64_t v4 = sub_226C336E8();
    os_log_type_t v5 = sub_226C33D38();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_226BFE000, v4, v5, "Cancel", v6, 2u);
      MEMORY[0x22A665D30](v6, -1, -1);
    }

    id v7 = objc_msgSend(self, sel_defaultCenter);
    objc_msgSend(v7, sel_removeObserver_, v1);

    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_226C336A8();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    swift_release();
  }
}

id _s14CoreUtilsSwift15CULocaleManagerC26preferredUnitSpeedUncached6localeSo06NSUnitH0C10Foundation6LocaleVSg_tFZ_0(uint64_t a1)
{
  uint64_t v2 = sub_226C33658();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v24 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E50);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_226C33698();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226C3032C(a1, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_226C33688();
    sub_226C26188((uint64_t)v11);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  }
  sub_226C33668();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_226C33628();
  sub_226C30394(&qword_268156FC0, MEMORY[0x263F07580]);
  char v16 = sub_226C33978();
  id v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v6, v2);
  if (v16 & 1) != 0 || (sub_226C33638(), char v18 = sub_226C33978(), v17(v6, v2), (v18))
  {
    v17(v8, v2);
    uint64_t v19 = self;
    uint64_t v20 = &selRef_milesPerHour;
  }
  else
  {
    sub_226C33648();
    char v21 = sub_226C33978();
    v17(v6, v2);
    v17(v8, v2);
    uint64_t v19 = self;
    uint64_t v20 = &selRef_milesPerHour;
    if (v21) {
      uint64_t v20 = &selRef_kilometersPerHour;
    }
  }
  id v22 = [v19 *v20];
  return v22;
}

uint64_t sub_226C2FE88()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_226C2FEC0()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    CULocaleManager.start()();
    swift_release();
  }
  return swift_release();
}

unint64_t sub_226C2FF84()
{
  unint64_t result = qword_268156F58;
  if (!qword_268156F58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268156F50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268156F58);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_226C30018()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226C30050()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_226C33BC8();
  uint64_t v2 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v4[2] = v2;
  void v4[3] = v1;
  sub_226C2F5C4((uint64_t)sub_226C30258, (uint64_t)v4);
  return swift_release();
}

uint64_t sub_226C30128()
{
  return sub_226C302E8();
}

uint64_t sub_226C30140()
{
  return type metadata accessor for CULocaleManager();
}

uint64_t sub_226C30148()
{
  uint64_t result = sub_226C33698();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_226C336D8();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for CULocaleManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CULocaleManager);
}

uint64_t dispatch thunk of CULocaleManager.__allocating_init(locale:autoStart:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_226C30258()
{
}

uint64_t sub_226C30274()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
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

uint64_t sub_226C302E8()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC14CoreUtilsSwift15CULocaleManager___localeChangedObserver) = *(void *)(v0 + 24);
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_226C3032C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156E50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226C30394(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_226C303E4()
{
}

uint64_t sub_226C303FC()
{
  uint64_t v0 = sub_226C33708();
  __swift_allocate_value_buffer(v0, qword_2681591C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2681591C8);
  sub_226C0D368();
  swift_bridgeObjectRetain();
  return sub_226C336F8();
}

uint64_t CUDistributedNotificationHandler.__allocating_init(name:sender:dispatchQueue:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_226C30494(a1, a2, a3, a4, a5, a6, a7, 1);
}

{
  return sub_226C30494(a1, a2, a3, a4, a5, a6, a7, 0);
}

uint64_t sub_226C30498(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v14;
  *(void *)(v14 + 56) = a2;
  *(void *)(v14 + 64) = 0;
  *(void *)(v14 + 24) = a6;
  *(void *)(v14 + 32) = a7;
  *(unsigned char *)(v14 + 40) = a8 & 1;
  *(void *)(v14 + 48) = a1;
  uint64_t v17 = v16;
  if (a5)
  {
    type metadata accessor for CUDispatchTaskExecutor();
    sub_226C32AB4();
    swift_bridgeObjectRetain();
    id v18 = a5;
    *(void *)(v15 + 16) = CUDispatchTaskExecutor.__allocating_init(dispatchQueue:)((uint64_t)v18);
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
    if (v19)
    {
      unint64_t v36 = v19;
      objc_msgSend(v19, sel_setUnderlyingQueue_, v18);
      goto LABEL_6;
    }
  }
  else
  {
    *(void *)(v14 + 16) = 0;
    sub_226C32AB4();
    swift_bridgeObjectRetain();
  }
  unint64_t v36 = 0;
LABEL_6:
  if (qword_2681591C0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_226C33708();
  __swift_project_value_buffer(v20, (uint64_t)qword_2681591C8);
  swift_bridgeObjectRetain_n();
  char v21 = sub_226C336E8();
  os_log_type_t v22 = sub_226C33D38();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v35 = v17;
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    aBlock[0] = v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    swift_bridgeObjectRetain();
    sub_226C3238C(a1, a2, aBlock);
    sub_226C33DF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_226BFE000, v21, v22, "register: name=%s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A665D30](v24, -1, -1);
    uint64_t v25 = v23;
    uint64_t v17 = v35;
    MEMORY[0x22A665D30](v25, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  id v26 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v27 = (void *)sub_226C33988();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v28 = sub_226C33988();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v28 = 0;
  }
  uint64_t v29 = swift_allocObject();
  swift_weakInit();
  uint64_t v30 = (void *)swift_allocObject();
  _OWORD v30[2] = *(void *)(v17 + 80);
  v30[3] = *(void *)(v17 + 88);
  v30[4] = v29;
  aBlock[4] = (uint64_t)sub_226C32D5C;
  aBlock[5] = (uint64_t)v30;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_226C2F750;
  aBlock[3] = (uint64_t)&block_descriptor_1;
  uint64_t v31 = _Block_copy(aBlock);
  id v32 = v36;
  swift_release();
  id v33 = objc_msgSend(v26, sel_addObserverForName_object_queue_usingBlock_, v27, v28, v32, v31);
  sub_226C317FC();

  _Block_release(v31);
  swift_unknownObjectRelease();

  *(void *)(v15 + 64) = v33;
  swift_unknownObjectRelease();
  return v15;
}

void sub_226C308FC(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = *v1;
  os_log_t v117 = (os_log_t)sub_226C33508();
  uint64_t isa = (uint64_t)v117[-1].isa;
  MEMORY[0x270FA5388](v117);
  unint64_t v118 = (void *)((char *)v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CD0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v113 = (void (**)(char *, uint64_t, uint64_t, uint64_t))((char *)v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v103 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v114 = (char *)v103 - v13;
  uint64_t v116 = *(void **)(v4 + 80);
  uint64_t v14 = *(v116 - 1);
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  uint64_t v115 = (char *)v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  id v19 = (char *)v103 - v18;
  MEMORY[0x270FA5388](v17);
  char v21 = (char *)v103 - v20;
  uint64_t v22 = sub_226C334F8();
  if (!v22)
  {
    long long v128 = 0u;
    long long v129 = 0u;
LABEL_10:
    sub_226C088D0((uint64_t)&v128, &qword_268156BA8);
    goto LABEL_11;
  }
  uint64_t v23 = v22;
  uint64_t v124 = 0x64616F6C796170;
  unint64_t v125 = 0xE700000000000000;
  sub_226C33F18();
  if (*(void *)(v23 + 16) && (unint64_t v24 = sub_226C1B044((uint64_t)&v126), (v25 & 1) != 0))
  {
    sub_226C06F78(*(void *)(v23 + 56) + 32 * v24, (uint64_t)&v128);
  }
  else
  {
    long long v128 = 0u;
    long long v129 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_226C1FBE8((uint64_t)&v126);
  if (!*((void *)&v129 + 1)) {
    goto LABEL_10;
  }
  if (swift_dynamicCast())
  {
    uint64_t v111 = v11;
    uint64_t v112 = v14;
    uint64_t v27 = v126;
    id v26 = v127;
    uint64_t v28 = *(void *)(v4 + 88);
    (*(void (**)(void *, NSObject *))(v28 + 48))(v126, v127);
    uint64_t v110 = v28;
    os_log_t v117 = v26;
    unint64_t v118 = v27;
    uint64_t isa = (uint64_t)v21;
    if (qword_2681591C0 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_226C33708();
    __swift_project_value_buffer(v51, (uint64_t)qword_2681591C8);
    uint64_t v52 = v112;
    uint64_t v53 = v112 + 16;
    uint64_t v54 = *(void (**)(char *, uint64_t, void *))(v112 + 16);
    uint64_t v55 = v116;
    v54(v19, isa, v116);
    uint64_t v56 = sub_226C336E8();
    os_log_type_t v57 = sub_226C33D38();
    int v58 = v57;
    BOOL v59 = os_log_type_enabled(v56, v57);
    uint64_t v109 = v53;
    uint64_t v108 = v54;
    if (v59)
    {
      os_log_t v107 = v56;
      uint64_t v60 = swift_slowAlloc();
      int v106 = v58;
      uint64_t v61 = (uint8_t *)v60;
      uint64_t v105 = swift_slowAlloc();
      uint64_t v126 = (void *)v105;
      uint64_t v104 = v61;
      *(_DWORD *)uint64_t v61 = 136315138;
      v103[1] = v61 + 4;
      uint64_t v62 = v115;
      v54(v115, (uint64_t)v19, v55);
      uint64_t v63 = v52;
      uint64_t v64 = *(void **)(v52 + 8);
      ((void (*)(char *, void *))v64)(v19, v55);
      uint64_t v65 = sub_226C341B8();
      unint64_t v67 = v66;
      unint64_t v68 = v62;
      uint64_t v69 = v64;
      uint64_t v52 = v63;
      ((void (*)(char *, void *))v69)(v68, v55);
      *(void *)&long long v128 = sub_226C3238C(v65, v67, (uint64_t *)&v126);
      sub_226C33DF8();
      swift_bridgeObjectRelease();
      uint64_t v56 = v107;
      uint64_t v70 = v104;
      _os_log_impl(&dword_226BFE000, v107, (os_log_type_t)v106, "received: %s", v104, 0xCu);
      uint64_t v71 = v105;
      swift_arrayDestroy();
      MEMORY[0x22A665D30](v71, -1, -1);
      MEMORY[0x22A665D30](v70, -1, -1);
    }
    else
    {
      uint64_t v69 = *(void **)(v52 + 8);
      ((void (*)(char *, void *))v69)(v19, v55);
    }

    os_log_t v73 = v117;
    uint64_t v72 = v118;
    BOOL v74 = (void (*)(uint64_t))v2[3];
    uint64_t v75 = v2[4];
    if (v2[5])
    {
      swift_retain();
      uint64_t v76 = isa;
      v74(isa);
      sub_226C1D5F8((uint64_t)v72, (unint64_t)v73);
      sub_226C317FC();
      ((void (*)(uint64_t, void *))v69)(v76, v55);
    }
    else
    {
      uint64_t v116 = v69;
      uint64_t v77 = v2[2];
      if (v77)
      {
        uint64_t v78 = sub_226C33C08();
        uint64_t v113 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v78 - 8);
        uint64_t v79 = v114;
        v113[7](v114, 1, 1, v78);
        uint64_t v80 = v115;
        v108(v115, isa, v55);
        unint64_t v81 = (*(unsigned __int8 *)(v52 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
        uint64_t v82 = (void *)swift_allocObject();
        uint64_t v83 = v55;
        BOOL v84 = v82;
        uint64_t v85 = v110;
        v82[2] = v83;
        v82[3] = v85;
        v82[4] = v74;
        v82[5] = v75;
        char v86 = v80;
        uint64_t v87 = v83;
        (*(void (**)(char *, char *))(v52 + 32))((char *)v82 + v81, v86);
        uint64_t v88 = (uint64_t)v79;
        uint64_t v89 = v113;
        uint64_t v90 = (uint64_t)v111;
        sub_226C33208(v88, (uint64_t)v111);
        int v91 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v89[6])(v90, 1, v78);
        sub_226C32AB4();
        swift_retain_n();
        sub_226C32AB4();
        if (v91 == 1)
        {
          sub_226C088D0(v90, &qword_268156CD0);
        }
        else
        {
          sub_226C33BF8();
          ((void (*)(uint64_t, uint64_t))v89[1])(v90, v78);
        }
        unint64_t v101 = sub_226C33270();
        uint64_t v102 = swift_allocObject();
        *(void *)(v102 + 16) = &unk_268157000;
        *(void *)(v102 + 24) = v84;
        uint64_t v120 = 6;
        uint64_t v121 = 0;
        uint64_t v122 = v77;
        unint64_t v123 = v101;
        swift_task_create();
        swift_release();
        sub_226C1D5F8((uint64_t)v118, (unint64_t)v117);
        swift_release();
        sub_226C317FC();
        uint64_t v99 = isa;
        uint64_t v100 = v87;
      }
      else
      {
        uint64_t v92 = sub_226C33C08();
        uint64_t v93 = (uint64_t)v113;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v92 - 8) + 56))((char *)v113, 1, 1, v92);
        uint64_t v94 = v115;
        v108(v115, isa, v55);
        uint64_t v95 = v55;
        unint64_t v96 = (*(unsigned __int8 *)(v52 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
        uint64_t v97 = (char *)swift_allocObject();
        *((void *)v97 + 2) = 0;
        *((void *)v97 + 3) = 0;
        uint64_t v98 = v110;
        *((void *)v97 + 4) = v95;
        *((void *)v97 + 5) = v98;
        *((void *)v97 + 6) = v74;
        *((void *)v97 + 7) = v75;
        (*(void (**)(char *, char *, void *))(v52 + 32))(&v97[v96], v94, v95);
        swift_retain_n();
        sub_226C319F0(v93, (uint64_t)&unk_268156FF0, (uint64_t)v97);
        sub_226C1D5F8((uint64_t)v118, (unint64_t)v73);
        swift_release();
        sub_226C317FC();
        uint64_t v99 = isa;
        uint64_t v100 = v95;
      }
      ((void (*)(uint64_t, void *))v116)(v99, v100);
    }
    return;
  }
LABEL_11:
  uint64_t v29 = sub_226C33998();
  uint64_t v31 = v30;
  type metadata accessor for CUError();
  id v32 = CUError.__allocating_init(domain:code:message:underlying:)(v29, v31, -6705, 0x6F6C796170206F6ELL, 0xEF61746164206461, 0);
  swift_willThrow();
  os_log_t v34 = v117;
  id v33 = v118;
  uint64_t v35 = isa;
  if (qword_2681591C0 != -1) {
    swift_once();
  }
  uint64_t v36 = sub_226C33708();
  __swift_project_value_buffer(v36, (uint64_t)qword_2681591C8);
  (*(void (**)(void *, uint64_t, os_log_t))(v35 + 16))(v33, a1, v34);
  id v37 = v32;
  id v38 = v32;
  unint64_t v39 = sub_226C336E8();
  os_log_type_t v40 = sub_226C33D28();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = swift_slowAlloc();
    unint64_t v118 = (void *)swift_slowAlloc();
    uint64_t isa = swift_slowAlloc();
    uint64_t v126 = (void *)isa;
    *(_DWORD *)uint64_t v41 = 136315394;
    os_log_t v117 = v39;
    unint64_t v42 = (void *)sub_226C334E8();
    uint64_t v43 = sub_226C33998();
    unint64_t v45 = v44;

    *(void *)&long long v128 = sub_226C3238C(v43, v45, (uint64_t *)&v126);
    sub_226C33DF8();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, os_log_t))(v35 + 8))(v33, v34);
    *(_WORD *)(v41 + 12) = 2112;
    id v46 = v32;
    uint64_t v47 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)&long long v128 = v47;
    sub_226C33DF8();
    uint64_t v48 = v118;
    *unint64_t v118 = v47;

    os_log_t v49 = v117;
    _os_log_impl(&dword_226BFE000, v117, v40, "### receive failed: name=%s, error=%@", (uint8_t *)v41, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156FE0);
    swift_arrayDestroy();
    MEMORY[0x22A665D30](v48, -1, -1);
    uint64_t v50 = isa;
    swift_arrayDestroy();
    MEMORY[0x22A665D30](v50, -1, -1);
    MEMORY[0x22A665D30](v41, -1, -1);
  }
  else
  {

    (*(void (**)(void *, os_log_t))(v35 + 8))(v33, v34);
  }
}

uint64_t CUDistributedNotificationHandler.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 64);
  if (v2)
  {
    uint64_t v3 = qword_2681591C0;
    swift_unknownObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_226C33708();
    __swift_project_value_buffer(v4, (uint64_t)qword_2681591C8);
    swift_retain();
    uint64_t v5 = sub_226C336E8();
    os_log_type_t v6 = sub_226C33D38();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v13 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      uint64_t v9 = *(void *)(v1 + 48);
      unint64_t v10 = *(void *)(v1 + 56);
      swift_bridgeObjectRetain();
      sub_226C3238C(v9, v10, &v13);
      sub_226C33DF8();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226BFE000, v5, v6, "deregister: name=%s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A665D30](v8, -1, -1);
      MEMORY[0x22A665D30](v7, -1, -1);
    }
    else
    {

      swift_release();
    }
    id v11 = objc_msgSend(self, sel_defaultCenter);
    objc_msgSend(v11, sel_removeObserver_, v2);
    swift_unknownObjectRelease();
  }
  swift_release();
  sub_226C317FC();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_226C317FC()
{
  return swift_release();
}

uint64_t CUDistributedNotificationHandler.__deallocating_deinit()
{
  CUDistributedNotificationHandler.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_226C31838(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *os_log_type_t v6 = v4;
  v6[1] = sub_226C02D20;
  return v8(a4);
}

uint64_t sub_226C31914(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_226C02D20;
  return v10(a6);
}

uint64_t sub_226C319F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226C33C08();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_226C33BF8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_226C088D0(a1, &qword_268156CD0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_226C33B48();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void NSDistributedNotificationCenter.post<A>(notification:sender:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v37 = a5;
  uint64_t v6 = v5;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v9 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2681591C0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_226C33708();
  __swift_project_value_buffer(v12, (uint64_t)qword_2681591C8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, a4);
  uint64_t v13 = sub_226C336E8();
  os_log_type_t v14 = sub_226C33D38();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v38 = a1;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    id v33 = v5;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v32 = swift_slowAlloc();
    v39[0] = v32;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v31 = v17 + 4;
    uint64_t v18 = v37;
    uint64_t v19 = sub_226C341B8();
    v39[17] = sub_226C3238C(v19, v20, v39);
    sub_226C33DF8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, a4);
    _os_log_impl(&dword_226BFE000, v13, v14, "post: %s", v17, 0xCu);
    uint64_t v21 = v32;
    swift_arrayDestroy();
    MEMORY[0x22A665D30](v21, -1, -1);
    uint64_t v22 = v17;
    uint64_t v6 = v33;
    MEMORY[0x22A665D30](v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, a4);

    uint64_t v18 = v37;
  }
  (*(void (**)(uint64_t, uint64_t))(v18 + 40))(a4, v18);
  uint64_t v23 = (void *)sub_226C33988();
  swift_bridgeObjectRelease();
  uint64_t v24 = v18;
  if (v35) {
    char v25 = (void *)sub_226C33988();
  }
  else {
    char v25 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156FC8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_226C367F0;
  v39[0] = 0x64616F6C796170;
  v39[1] = 0xE700000000000000;
  sub_226C33F18();
  uint64_t v27 = v36;
  uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 56))(a4, v24);
  if (v27)
  {

    sub_226C1FBE8(inited + 32);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268156FD0);
    swift_arrayDestroy();
  }
  else
  {
    *(void *)(inited + 96) = MEMORY[0x263F06F78];
    *(void *)(inited + 72) = v28;
    *(void *)(inited + 80) = v29;
    sub_226C31FB8(inited);
    uint64_t v30 = (void *)sub_226C33878();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_postNotificationName_object_userInfo_deliverImmediately_, v23, v25, v30, 1);
  }
}

unint64_t sub_226C31FB8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268156FD8);
  uint64_t v2 = sub_226C340F8();
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
    sub_226C32C84(v6, (uint64_t)v15);
    unint64_t result = sub_226C1B044((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_226C07014(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_226C320F0()
{
  return static CUDistributedNotification.decode(data:)();
}

uint64_t static CUDistributedNotification.decode(data:)()
{
  return swift_release();
}

uint64_t sub_226C321A4()
{
  return CUDistributedNotification.encode()();
}

uint64_t CUDistributedNotification.encode()()
{
  sub_226C334C8();
  swift_allocObject();
  sub_226C334B8();
  uint64_t v0 = sub_226C334A8();
  swift_release();
  return v0;
}

uint64_t CUDistributedNotification.description.getter(uint64_t a1, uint64_t a2)
{
  return 0x3D656D616ELL;
}

uint64_t sub_226C322B0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_226C33474;
  return v6(a1);
}

uint64_t sub_226C3238C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_226C32460(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_226C06F78((uint64_t)v12, *a3);
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
      sub_226C06F78((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_226C32460(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_226C33E08();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_226C3261C(a5, a6);
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
  uint64_t v8 = sub_226C33F98();
  if (!v8)
  {
    sub_226C34088();
    __break(1u);
LABEL_17:
    uint64_t result = sub_226C34108();
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

uint64_t sub_226C3261C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_226C326B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_226C3282C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_226C3282C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_226C326B4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_226C1C574(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_226C33F58();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_226C34088();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_226C33A48();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_226C34108();
    __break(1u);
LABEL_14:
    uint64_t result = sub_226C34088();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_226C3282C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6CEF8);
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
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_226C34108();
  __break(1u);
  return result;
}

uint64_t _s14CoreUtilsSwift25CUDistributedNotificationPAAE4nameSSvg_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_226C329B0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for CUDistributedNotificationHandler()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for CUDistributedNotificationHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUDistributedNotificationHandler);
}

uint64_t dispatch thunk of static CUDistributedNotification.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of CUDistributedNotification.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static CUDistributedNotification.decode(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of CUDistributedNotification.encode()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_226C32AB4()
{
  return swift_retain();
}

uint64_t sub_226C32ABC()
{
  return sub_226C317FC();
}

uint64_t sub_226C32ACC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_226C32AB4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_226C32B18(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_226C32AB4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_226C317FC();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_226C32B84(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_226C317FC();
  return a1;
}

uint64_t sub_226C32BCC(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t sub_226C32C14(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_226C32C58(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_226C32C60(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for CUDistributedNotificationHandler.Handler()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_226C32C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156FD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226C32CEC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_226C32D24()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_226C32D5C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_226C308FC(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_226C32DC0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_226C32E8C()
{
  uint64_t v2 = *(int **)(v0 + 48);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 32) - 8) + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_226C01AFC;
  int64_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_226C02D20;
  return v7(v3);
}

uint64_t sub_226C32FE8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_226C330AC()
{
  uint64_t v2 = *(int **)(v0 + 32);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_226C02D20;
  int64_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_226C02D20;
  return v7(v3);
}

uint64_t sub_226C33208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268156CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_226C33270()
{
  unint64_t result = qword_268157008;
  if (!qword_268157008)
  {
    type metadata accessor for CUDispatchTaskExecutor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268157008);
  }
  return result;
}

uint64_t sub_226C332C8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226C33300(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_226C02D20;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268157010 + dword_268157010);
  return v6(a1, v4);
}

uint64_t sub_226C333B8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_226C01AFC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268156F20 + dword_268156F20);
  return v6(a1, v4);
}

uint64_t sub_226C33478()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_226C33488()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_226C33498()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_226C334A8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_226C334B8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_226C334C8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_226C334D8()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_226C334E8()
{
  return MEMORY[0x270EEE390]();
}

uint64_t sub_226C334F8()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_226C33508()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_226C33518()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_226C33528()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_226C33538()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_226C33548()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_226C33558()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_226C33568()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_226C33578()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_226C33588()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_226C33598()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_226C335A8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_226C335B8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_226C335C8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_226C335D8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_226C335E8()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_226C335F8()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_226C33608()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_226C33618()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_226C33628()
{
  return MEMORY[0x270EF0E70]();
}

uint64_t sub_226C33638()
{
  return MEMORY[0x270EF0E80]();
}

uint64_t sub_226C33648()
{
  return MEMORY[0x270EF0E90]();
}

uint64_t sub_226C33658()
{
  return MEMORY[0x270EF0E98]();
}

uint64_t sub_226C33668()
{
  return MEMORY[0x270EF0EB0]();
}

uint64_t sub_226C33678()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t sub_226C33688()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_226C33698()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_226C336A8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_226C336B8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_226C336C8()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_226C336D8()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_226C336E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_226C336F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_226C33708()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_226C33718()
{
  return MEMORY[0x270FA1988]();
}

uint64_t sub_226C33728()
{
  return MEMORY[0x270EF7128]();
}

uint64_t sub_226C33738()
{
  return MEMORY[0x270EF7138]();
}

uint64_t sub_226C33748()
{
  return MEMORY[0x270EF7150]();
}

uint64_t sub_226C33758()
{
  return MEMORY[0x270EF7158]();
}

uint64_t sub_226C33768()
{
  return MEMORY[0x270EF7160]();
}

uint64_t sub_226C33778()
{
  return MEMORY[0x270EF7168]();
}

uint64_t sub_226C33788()
{
  return MEMORY[0x270EF7188]();
}

uint64_t sub_226C33798()
{
  return MEMORY[0x270EF7218]();
}

uint64_t sub_226C337A8()
{
  return MEMORY[0x270EF7220]();
}

uint64_t sub_226C337B8()
{
  return MEMORY[0x270EF7228]();
}

uint64_t sub_226C337C8()
{
  return MEMORY[0x270EF7230]();
}

uint64_t sub_226C337D8()
{
  return MEMORY[0x270EF7238]();
}

uint64_t sub_226C337E8()
{
  return MEMORY[0x270EF7240]();
}

uint64_t sub_226C337F8()
{
  return MEMORY[0x270EF7248]();
}

uint64_t sub_226C33808()
{
  return MEMORY[0x270EF7250]();
}

uint64_t sub_226C33818()
{
  return MEMORY[0x270EF7288]();
}

uint64_t sub_226C33828()
{
  return MEMORY[0x270EF7298]();
}

uint64_t sub_226C33838()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_226C33848()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_226C33858()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_226C33868()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_226C33878()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_226C33888()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_226C33898()
{
  return MEMORY[0x270F9D260]();
}

uint64_t sub_226C338A8()
{
  return MEMORY[0x270F9D2D8]();
}

uint64_t sub_226C338B8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_226C338C8()
{
  return MEMORY[0x270F9D380]();
}

uint64_t sub_226C338D8()
{
  return MEMORY[0x270F9D398]();
}

uint64_t sub_226C338E8()
{
  return MEMORY[0x270F9D3A8]();
}

uint64_t sub_226C338F8()
{
  return MEMORY[0x270F9D3B0]();
}

uint64_t sub_226C33908()
{
  return MEMORY[0x270F9D408]();
}

uint64_t sub_226C33918()
{
  return MEMORY[0x270F9D470]();
}

uint64_t sub_226C33928()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_226C33938()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_226C33948()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_226C33958()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_226C33968()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_226C33978()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_226C33988()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_226C33998()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_226C339A8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_226C339B8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_226C339C8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_226C339D8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_226C339E8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_226C339F8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_226C33A08()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_226C33A18()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_226C33A28()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_226C33A38()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_226C33A48()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_226C33A58()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_226C33A68()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_226C33A88()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_226C33A98()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_226C33AA8()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_226C33AB8()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_226C33AC8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_226C33AD8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_226C33AE8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_226C33AF8()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_226C33B08()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_226C33B18()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_226C33B28()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_226C33B38()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_226C33B48()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_226C33B58()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_226C33B68()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_226C33B78()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_226C33B88()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_226C33BB8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_226C33BC8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_226C33BD8()
{
  return MEMORY[0x270FA1EC8]();
}

uint64_t sub_226C33BE8()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_226C33BF8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_226C33C08()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_226C33C18()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_226C33C28()
{
  return MEMORY[0x270FA1FE0]();
}

uint64_t sub_226C33C38()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_226C33C58()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_226C33C68()
{
  return MEMORY[0x270F9E028]();
}

uint64_t sub_226C33C78()
{
  return MEMORY[0x270F9E030]();
}

uint64_t sub_226C33C88()
{
  return MEMORY[0x270F9E048]();
}

uint64_t sub_226C33C98()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_226C33CA8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_226C33CB8()
{
  return MEMORY[0x270F9E0A8]();
}

uint64_t sub_226C33CC8()
{
  return MEMORY[0x270F9E0B0]();
}

uint64_t sub_226C33CD8()
{
  return MEMORY[0x270F9E0B8]();
}

uint64_t sub_226C33CE8()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_226C33CF8()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_226C33D08()
{
  return MEMORY[0x270F9E170]();
}

uint64_t sub_226C33D18()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_226C33D28()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_226C33D38()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_226C33D48()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_226C33D58()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_226C33D68()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_226C33D78()
{
  return MEMORY[0x270FA0DC8]();
}

uint64_t sub_226C33D88()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_226C33D98()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_226C33DA8()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_226C33DB8()
{
  return MEMORY[0x270FA0FB0]();
}

uint64_t sub_226C33DC8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_226C33DD8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_226C33DE8()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_226C33DF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_226C33E08()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_226C33E18()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_226C33E28()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_226C33E38()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_226C33E48()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_226C33E58()
{
  return MEMORY[0x270F9E600]();
}

uint64_t sub_226C33E68()
{
  return MEMORY[0x270F9E610]();
}

uint64_t sub_226C33E78()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_226C33E88()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_226C33E98()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_226C33EA8()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_226C33EB8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_226C33ED8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_226C33EE8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_226C33EF8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_226C33F08()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_226C33F18()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_226C33F38()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_226C33F48()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_226C33F58()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_226C33F68()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_226C33F78()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_226C33F88()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_226C33F98()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_226C33FA8()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_226C33FB8()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_226C33FC8()
{
  return MEMORY[0x270F9ECE0]();
}

uint64_t sub_226C33FD8()
{
  return MEMORY[0x270FA21F8]();
}

uint64_t sub_226C33FE8()
{
  return MEMORY[0x270FA2208]();
}

uint64_t sub_226C33FF8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_226C34008()
{
  return MEMORY[0x270F9EDC0]();
}

uint64_t sub_226C34018()
{
  return MEMORY[0x270F9EDC8]();
}

uint64_t sub_226C34028()
{
  return MEMORY[0x270F9EDD0]();
}

uint64_t sub_226C34038()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_226C34048()
{
  return MEMORY[0x270F9EE48]();
}

uint64_t sub_226C34058()
{
  return MEMORY[0x270F9EE50]();
}

uint64_t sub_226C34068()
{
  return MEMORY[0x270F9EE58]();
}

uint64_t sub_226C34078()
{
  return MEMORY[0x270F9EE60]();
}

uint64_t sub_226C34088()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_226C34098()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_226C340A8()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_226C340B8()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_226C340C8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_226C340D8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_226C340E8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_226C340F8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_226C34108()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_226C34118()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_226C34128()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_226C34138()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_226C34148()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_226C34158()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_226C34168()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_226C34178()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_226C34188()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_226C34198()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_226C341A8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_226C341B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_226C341D8()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_226C341E8()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_226C341F8()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_226C34208()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_226C34228()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_226C34238()
{
  return MEMORY[0x270F9F840]();
}

uint64_t sub_226C34248()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_226C34258()
{
  return MEMORY[0x270F9F8D8]();
}

uint64_t sub_226C34278()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_226C34288()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_226C34298()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_226C342A8()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_226C342B8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_226C342C8()
{
  return MEMORY[0x270FA2370]();
}

uint64_t sub_226C342D8()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_226C342F8()
{
  return MEMORY[0x270FA23A0]();
}

uint64_t sub_226C34308()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_226C34318()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_226C34328()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_226C34338()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_226C34348()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_226C34358()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_226C34368()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_226C34378()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_226C34388()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_226C34398()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_226C343A8()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_226C343B8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_226C343C8()
{
  return MEMORY[0x270F9FD78]();
}

uint64_t sub_226C343D8()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_226C343E8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_226C343F8()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_226C34408()
{
  return MEMORY[0x270F9FFA8]();
}

uint64_t sub_226C34418()
{
  return MEMORY[0x270F9FFB8]();
}

uint64_t sub_226C34428()
{
  return MEMORY[0x270F9FFC0]();
}

uint64_t sub_226C34448()
{
  return MEMORY[0x270F9FFD8]();
}

uint64_t sub_226C34458()
{
  return MEMORY[0x270F9FFE0]();
}

uint64_t sub_226C34488()
{
  return MEMORY[0x270FA0128]();
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x270EE4CB0](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

uint64_t CUIsGreenTeaDevice()
{
  return MEMORY[0x270F23F48]();
}

uint64_t CUPrintFlags()
{
  return MEMORY[0x270F23FA0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x270F23FD0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t SockAddrGetPort()
{
  return MEMORY[0x270F246C8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x270F24740]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x270EDAEA8](a1);
}

void pthread_exit(void *a1)
{
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x270FA2468]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}