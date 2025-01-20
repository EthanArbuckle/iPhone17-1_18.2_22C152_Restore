uint64_t type metadata accessor for AsyncZip3Sequence()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B8DBA5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a2;
}

uint64_t sub_1B8DBA6D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return a1;
}

uint64_t sub_1B8DBA7B0(uint64_t a1)
{
  uint64_t v25 = a1;
  uint64_t v39 = 0;
  uint64_t v29 = *(void *)(a1 + 32);
  uint64_t v42 = v29;
  uint64_t v15 = 0;
  unint64_t v16 = (*(void *)(*(void *)(sub_1B8E11DA8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  v32 = (char *)&v15 - v16;
  uint64_t v24 = *(void *)(v2 + 24);
  uint64_t v41 = v24;
  uint64_t v22 = *(void *)(v24 - 8);
  uint64_t v23 = v24 - 8;
  unint64_t v17 = (*(void *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v3);
  uint64_t v31 = (uint64_t)&v15 - v17;
  uint64_t v21 = *(void *)(v4 + 16);
  uint64_t v40 = v21;
  uint64_t v19 = *(void *)(v21 - 8);
  uint64_t v20 = v21 - 8;
  unint64_t v18 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v5);
  uint64_t v30 = (uint64_t)&v15 - v18;
  uint64_t v39 = v1;
  uint64_t v7 = v6[5];
  uint64_t v8 = v6[6];
  uint64_t v9 = v6[7];
  uint64_t v33 = v10;
  uint64_t v34 = v11;
  uint64_t v35 = v29;
  uint64_t v36 = v7;
  uint64_t v37 = v8;
  uint64_t v38 = v9;
  type metadata accessor for ZipStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v30, v26, v21);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v31, v26 + *(int *)(v25 + 68), v24);
  uint64_t v12 = *(int *)(v25 + 72);
  uint64_t v27 = *(void *)(v29 - 8);
  uint64_t v28 = v29 - 8;
  (*(void (**)(char *, uint64_t))(v27 + 16))(v32, v26 + v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v32, 0, 1, v29);
  uint64_t v13 = sub_1B8DA51A8(v30, v31, v32);
  return sub_1B8DBAA5C(v13);
}

uint64_t sub_1B8DBAA5C(uint64_t a1)
{
  type metadata accessor for AsyncZip3Sequence.Iterator.InternalClass();
  swift_retain();
  uint64_t v3 = sub_1B8DBABBC(a1);
  swift_retain();
  swift_release();
  sub_1B8CDCA98();
  return v3;
}

uint64_t type metadata accessor for AsyncZip3Sequence.Iterator.InternalClass()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B8DBABBC(uint64_t a1)
{
  return sub_1B8DBAC08(a1);
}

uint64_t sub_1B8DBAC08(uint64_t a1)
{
  swift_retain();
  *(void *)(v1 + 16) = a1;
  swift_release();
  return v4;
}

uint64_t sub_1B8DBACAC()
{
  swift_retain();
  sub_1B8DA5648();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B8DBAD5C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1B8DBADEC(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[6] = swift_getAssociatedTypeWitness();
  v2[7] = swift_getAssociatedTypeWitness();
  v2[8] = swift_getAssociatedTypeWitness();
  v2[9] = sub_1B8E11DA8();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  v2[10] = TupleTypeMetadata3;
  v2[11] = sub_1B8E11DA8();
  v2[12] = swift_task_alloc();
  v2[13] = *(void *)(TupleTypeMetadata3 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[3] = v1;
  return MEMORY[0x1F4188298](sub_1B8DBB090, 0);
}

uint64_t sub_1B8DBB090()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 40);
  *(void *)(v0 + 16) = v0;
  *(_DWORD *)(v0 + 168) = *(_DWORD *)(v1 + 48);
  *(_DWORD *)(v0 + 172) = *(_DWORD *)(v1 + 64);
  *(void *)(v0 + 144) = *(void *)(v2 + 16);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v6[19] = v3;
  *uint64_t v3 = v6[2];
  v3[1] = sub_1B8DBB168;
  uint64_t v4 = v6[12];
  return sub_1B8DA5C78(v4);
}

uint64_t sub_1B8DBB168()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1B8DBBAC4;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1B8DBB2E4;
  }
  return MEMORY[0x1F4188298](v2, 0);
}

uint64_t sub_1B8DBB2E4()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[10];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v2, 1, v3) == 1)
  {
    uint64_t v9 = *(void *)(v54 + 32);
    sub_1B8DBBBB4(*(void *)(v54 + 96), *(void *)(v54 + 48), *(void *)(v54 + 56), *(void *)(v54 + 64), *(void *)(v54 + 72), *(void *)(v54 + 80));
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata3 - 8) + 56))(v9, 1);
  }
  else
  {
    uint64_t v4 = *(void *)(v54 + 136);
    uint64_t v31 = *(void *)(v54 + 128);
    uint64_t v38 = *(void *)(v54 + 120);
    uint64_t v49 = *(void *)(v54 + 112);
    uint64_t v5 = *(void *)(v54 + 96);
    uint64_t v48 = *(void *)(v54 + 80);
    uint64_t v47 = *(void *)(v54 + 72);
    uint64_t v50 = *(void *)(v54 + 64);
    uint64_t v43 = *(void *)(v54 + 56);
    uint64_t v33 = *(void *)(v54 + 32);
    uint64_t v23 = (void *)(v4 + *(int *)(v54 + 172));
    uint64_t v22 = v4 + *(int *)(v54 + 168);
    uint64_t v21 = v5 + *(int *)(v48 + 48);
    uint64_t v24 = (const void *)(v5 + *(int *)(v48 + 64));
    uint64_t v25 = *(void **)(*(void *)(v54 + 48) - 8);
    v32 = (void (*)(void))v25[4];
    v32();
    uint64_t v28 = *(void **)(v43 - 8);
    uint64_t v39 = (void (*)(uint64_t, uint64_t))v28[4];
    v39(v22, v21);
    sub_1B8CEA77C(v24, v23, v50, v47);
    uint64_t v26 = swift_getTupleTypeMetadata3();
    uint64_t v40 = v33 + *(int *)(v26 + 48);
    uint64_t v27 = v33 + *(int *)(v26 + 64);
    uint64_t v29 = v31 + *(int *)(v48 + 48);
    uint64_t v30 = (void *)(v31 + *(int *)(v48 + 64));
    uint64_t v42 = (void (*)(void))v25[2];
    v42();
    v44 = (void (*)(uint64_t, uint64_t, uint64_t))v28[2];
    v44(v29, v22, v43);
    sub_1B8CE729C(v23, v30, v50, v47);
    uint64_t v34 = v31 + *(int *)(v48 + 48);
    uint64_t v35 = v31 + *(int *)(v48 + 64);
    ((void (*)(uint64_t))v32)(v33);
    uint64_t v36 = v38 + *(int *)(v48 + 48);
    uint64_t v37 = (void *)(v38 + *(int *)(v48 + 64));
    v42();
    v44(v36, v22, v43);
    sub_1B8CE729C(v23, v37, v50, v47);
    uint64_t v41 = v38 + *(int *)(v48 + 64);
    ((void (*)(uint64_t, uint64_t, uint64_t))v39)(v40, v38 + *(int *)(v48 + 48), v43);
    uint64_t v45 = v49 + *(int *)(v48 + 48);
    v46 = (void *)(v49 + *(int *)(v48 + 64));
    v42();
    v44(v45, v22, v43);
    sub_1B8CE729C(v23, v46, v50, v47);
    uint64_t v51 = v49 + *(int *)(v48 + 48);
    uint64_t v52 = v49 + *(int *)(v48 + 64);
    uint64_t v53 = *(void *)(v50 - 8);
    if ((*(unsigned int (**)(void))(v53 + 48))() == 1) {
      return sub_1B8E11F58();
    }
    uint64_t v15 = *(void *)(v54 + 136);
    uint64_t v13 = *(void *)(v54 + 120);
    uint64_t v11 = *(void *)(v54 + 112);
    uint64_t v20 = *(void *)(v54 + 80);
    uint64_t v19 = *(void *)(v54 + 72);
    uint64_t v18 = *(void *)(v54 + 64);
    uint64_t v17 = *(void *)(v54 + 56);
    uint64_t v16 = *(void *)(v54 + 48);
    uint64_t v10 = *(void *)(v54 + 32);
    (*(void (**)(uint64_t, uint64_t))(v53 + 32))(v27, v52);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 56))(v10, 0, 1);
    v14 = (void (*)(uint64_t, uint64_t))v28[1];
    v14(v51, v17);
    uint64_t v12 = (void (*)(uint64_t, uint64_t))v25[1];
    v12(v11, v16);
    sub_1B8CDE920(v41, v18);
    v12(v13, v16);
    sub_1B8CDE920(v35, v18);
    v14(v34, v17);
    sub_1B8DBBD28(v15, v16, v17, v18, v19, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)(v54 + 16) + 8);
  return v8();
}

uint64_t sub_1B8DBBAC4()
{
  *(void *)(v0 + 16) = v0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_1B8DBBBB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(a6 - 8) + 48))(a1, 1))
  {
    (*(void (**)(uint64_t))(*(void *)(a2 - 8) + 8))(a1);
    (*(void (**)(uint64_t))(*(void *)(a3 - 8) + 8))(a1 + *(int *)(a6 + 48));
    uint64_t v7 = a1 + *(int *)(a6 + 64);
    uint64_t v8 = *(void *)(a4 - 8);
    if (!(*(unsigned int (**)(void))(v8 + 48))()) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, a4);
    }
  }
  return a1;
}

uint64_t sub_1B8DBBD28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  (*(void (**)(void))(*(void *)(a2 - 8) + 8))();
  (*(void (**)(uint64_t))(*(void *)(a3 - 8) + 8))(a1 + *(int *)(a6 + 48));
  uint64_t v11 = *(int *)(a6 + 64);
  uint64_t v12 = *(void *)(a4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1 + v11, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1 + v11, a4);
  }
  return a1;
}

uint64_t sub_1B8DBBE54(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x1F4188298](sub_1B8DBBEA0, 0);
}

uint64_t sub_1B8DBBEA0()
{
  uint64_t v1 = (void *)v0[5];
  v0[2] = v0;
  v0[6] = *v1;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v5[7] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = sub_1B8DBBF64;
  uint64_t v3 = v5[4];
  return sub_1B8DBADEC(v3);
}

uint64_t sub_1B8DBBF64()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B8DBC104, 0);
  }
  else
  {
    swift_release();
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v4 + 16) + 8);
    return v2();
  }
}

uint64_t sub_1B8DBC104()
{
  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_1B8DBC1A4(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1B8DBC260;
  return sub_1B8DBBE54(a1);
}

uint64_t sub_1B8DBC260()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v5 = v2 + 16;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v5 + 8);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v5 + 8);
  }
  return v3();
}

uint64_t sub_1B8DBC3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a4;
  v6[2] = v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[4] = AssociatedTypeWitness;
  v6[5] = *(void *)(AssociatedTypeWitness - 8);
  v6[6] = swift_task_alloc();
  uint64_t v15 = swift_task_alloc();
  v6[7] = v15;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v10 + 64) = v8;
  *uint64_t v8 = *(void *)(v10 + 16);
  v8[1] = sub_1B8DBC568;
  return MEMORY[0x1F4187C88](a1, a2, a3, a5, a6, v15);
}

uint64_t sub_1B8DBC568()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v9 = (void *)(v2 + 16);
  uint64_t v10 = v2 + 16;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v8 = v9[4];
    uint64_t v5 = v9[2];
    uint64_t v7 = v9[1];
    uint64_t v6 = *(void (**)(void))(v9[3] + 32);
    v6();
    ((void (*)(uint64_t, uint64_t, uint64_t))v6)(v7, v8, v5);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v10 + 8);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)v10 + 8);
  }
  return v3();
}

uint64_t sub_1B8DBC790@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1B8DBA7B0((uint64_t)a1);
  return sub_1B8DBA6D0(v4, a1[2], a1[3], a1[4], (uint64_t)a1);
}

uint64_t sub_1B8DBC7E0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B8DBC820()
{
  uint64_t v4 = swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    uint64_t v4 = swift_checkMetadataState();
    if (v1 <= 0x3F)
    {
      uint64_t v4 = swift_checkMetadataState();
      if (v2 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return v4;
}

unint64_t sub_1B8DBC9DC(char *a1, char *a2, uint64_t a3)
{
  int v9 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v9 & 0x20000) != 0)
  {
    uint64_t v4 = *(void *)a2;
    swift_retain();
    *(void *)a1 = v4;
    return *(void *)a1 + ((v9 + 16) & ~(unint64_t)v9);
  }
  else
  {
    (*(void (**)(char *, char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1, a2);
    (*(void (**)(char *, char *))(*(void *)(*(void *)(a3 + 24) - 8) + 16))(&a1[*(int *)(a3 + 68)], &a2[*(int *)(a3 + 68)]);
    (*(void (**)(char *, char *))(*(void *)(*(void *)(a3 + 32) - 8) + 16))(&a1[*(int *)(a3 + 72)], &a2[*(int *)(a3 + 72)]);
    return (unint64_t)a1;
  }
}

uint64_t sub_1B8DBCB70(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a2 + 32) - 8) + 8))(a1 + *(int *)(a2 + 72));
}

uint64_t sub_1B8DBCC50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8DBCD50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8DBCE50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8DBCF50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8DBD050()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B8DBD078(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a3 + 16);
  if (a2 == *(_DWORD *)(*(void *)(v7 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 48))(a1, a2, v7);
  }
  else
  {
    uint64_t v5 = *(void *)(a3 + 24);
    if (a2 == *(_DWORD *)(*(void *)(v5 - 8) + 84))
    {
      return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v5 - 8) + 48))(a1 + *(int *)(a3 + 68), a2, v5);
    }
    else
    {
      uint64_t v4 = *(void *)(a3 + 32);
      if (a2 == *(_DWORD *)(*(void *)(v4 - 8) + 84)) {
        return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 48))(a1 + *(int *)(a3 + 72), a2, v4);
      }
      else {
        __break(1u);
      }
    }
  }
  return v6;
}

uint64_t sub_1B8DBD280()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B8DBD2A8(uint64_t result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  if (a3 == *(_DWORD *)(*(void *)(v6 - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(v6 - 8) + 56))(result, a2, a2, v6);
  }
  uint64_t v5 = *(void *)(a4 + 24);
  if (a3 == *(_DWORD *)(*(void *)(v5 - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(v5 - 8) + 56))(result + *(int *)(a4 + 68), a2, a2, v5);
  }
  uint64_t v4 = *(void *)(a4 + 32);
  if (a3 == *(_DWORD *)(*(void *)(v4 - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(v4 - 8) + 56))(result + *(int *)(a4 + 72), a2, a2, v4);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AsyncZip3Sequence.Iterator()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B8DBD4DC()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1B8DBD570()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8DBD5A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v17 = a7;
  uint64_t v10 = a1;
  uint64_t v16 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  uint64_t v27 = a3;
  uint64_t v26 = a4;
  uint64_t v14 = *(void *)(a4 - 8);
  uint64_t v15 = a4 - 8;
  unint64_t v11 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](a2);
  uint64_t v18 = (uint64_t)&v10 - v11;
  uint64_t v13 = *(void *)(v7 - 8);
  unint64_t v12 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)&v10 - v11);
  uint64_t v23 = (uint64_t)&v10 - v12;
  uint64_t v25 = v8;
  uint64_t v24 = v16;
  (*(void (**)(char *))(v13 + 16))((char *)&v10 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v18, v16, v20);
  return sub_1B8DBD724(v23, v18, v19, v20, v17);
}

uint64_t sub_1B8DBD724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v19 = a5;
  uint64_t v25 = a1;
  uint64_t v22 = a2;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  v32 = 0;
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  uint64_t v38 = a3;
  uint64_t v37 = a4;
  uint64_t v20 = *(void *)(a4 - 8);
  uint64_t v21 = a4 - 8;
  unint64_t v14 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](a1);
  uint64_t v18 = (char *)&v13 - v14;
  uint64_t v23 = *(void *)(v5 - 8);
  uint64_t v24 = v5 - 8;
  unint64_t v15 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)&v13 - v14);
  uint64_t v17 = (char *)&v13 - v15;
  uint64_t v33 = v6;
  uint64_t v34 = v7;
  uint64_t v35 = v8;
  uint64_t v36 = v9;
  uint64_t v29 = type metadata accessor for AsyncZip2Sequence();
  unint64_t v16 = (*(void *)(*(void *)(v29 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x1F4188790](v17);
  uint64_t v26 = (uint64_t)&v13 - v16;
  v32 = (char *)&v13 - v16;
  uint64_t v31 = v11;
  uint64_t v30 = v22;
  (*(void (**)(uint64_t))(v23 + 16))(v10);
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v26, v17, v27);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v18, v22, v28);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v26 + *(int *)(v29 + 52), v18, v28);
  sub_1B8DBDA30(v26, v19, v27, v28, v29);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v28);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v27);
  return sub_1B8DBDAE4(v26, v27, v28, v29);
}

uint64_t type metadata accessor for AsyncZip2Sequence()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B8DBDA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return a2;
}

uint64_t sub_1B8DBDAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1;
}

uint64_t sub_1B8DBDB80(uint64_t a1)
{
  uint64_t v17 = a1;
  uint64_t v31 = 0;
  uint64_t v21 = *(void *)(a1 + 24);
  uint64_t v33 = v21;
  v11[1] = 0;
  unint64_t v12 = (*(void *)(*(void *)(sub_1B8E11DA8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v24 = (char *)v11 - v12;
  uint64_t v19 = *(void *)(v21 - 8);
  uint64_t v20 = v21 - 8;
  unint64_t v13 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v2);
  uint64_t v23 = (uint64_t)v11 - v13;
  uint64_t v16 = *(void *)(v3 + 16);
  uint64_t v32 = v16;
  uint64_t v14 = *(void *)(v16 - 8);
  uint64_t v15 = v16 - 8;
  MEMORY[0x1F4188790](v4);
  uint64_t v22 = (uint64_t)v11 - v5;
  uint64_t v31 = v1;
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)(v6 + 40);
  uint64_t v25 = v16;
  uint64_t v26 = v21;
  uint64_t v27 = v21;
  uint64_t v28 = v7;
  uint64_t v29 = v8;
  uint64_t v30 = v8;
  type metadata accessor for ZipStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v22, v18, v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v23, v18 + *(int *)(v17 + 52), v21);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v24, 1, 1, v21);
  uint64_t v9 = sub_1B8DA51A8(v22, v23, v24);
  return sub_1B8DBDDD8(v9);
}

uint64_t sub_1B8DBDDD8(uint64_t a1)
{
  type metadata accessor for AsyncZip2Sequence.Iterator.InternalClass();
  swift_retain();
  uint64_t v3 = sub_1B8DBDF00(a1);
  swift_retain();
  swift_release();
  sub_1B8CDCA98();
  return v3;
}

uint64_t type metadata accessor for AsyncZip2Sequence.Iterator.InternalClass()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B8DBDF00(uint64_t a1)
{
  return sub_1B8DBDF4C(a1);
}

uint64_t sub_1B8DBDF4C(uint64_t a1)
{
  swift_retain();
  *(void *)(v1 + 16) = a1;
  swift_release();
  return v4;
}

uint64_t sub_1B8DBDFD8()
{
  swift_retain();
  sub_1B8DA5648();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B8DBE070()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1B8DBE0E8(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[6] = swift_getAssociatedTypeWitness();
  v2[7] = swift_getAssociatedTypeWitness();
  v2[8] = sub_1B8E11DA8();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  v2[9] = TupleTypeMetadata3;
  v2[10] = sub_1B8E11DA8();
  v2[11] = swift_task_alloc();
  v2[12] = *(void *)(TupleTypeMetadata3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[3] = v1;
  return MEMORY[0x1F4188298](sub_1B8DBE334, 0);
}

uint64_t sub_1B8DBE334()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 40);
  *(void *)(v0 + 16) = v0;
  *(_DWORD *)(v0 + 152) = *(_DWORD *)(v1 + 48);
  *(_DWORD *)(v0 + 156) = *(_DWORD *)(v1 + 64);
  *(void *)(v0 + 128) = *(void *)(v2 + 16);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v6[17] = v3;
  *uint64_t v3 = v6[2];
  v3[1] = sub_1B8DBE40C;
  uint64_t v4 = v6[11];
  return sub_1B8DA5C78(v4);
}

uint64_t sub_1B8DBE40C()
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  *(void *)(v4 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1B8DBEAE4;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_1B8DBE588;
  }
  return MEMORY[0x1F4188298](v2, 0);
}

uint64_t sub_1B8DBE588()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[9];
  v0[2] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v2, 1, v3) == 1)
  {
    uint64_t v8 = *(void *)(v36 + 32);
    sub_1B8DBEBC4(*(void *)(v36 + 88), *(void *)(v36 + 48), *(void *)(v36 + 56), *(void *)(v36 + 64), *(void *)(v36 + 72));
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 56))(v8, 1);
  }
  else
  {
    uint64_t v31 = *(void *)(v36 + 120);
    uint64_t v15 = *(void *)(v36 + 112);
    uint64_t v27 = *(void *)(v36 + 104);
    uint64_t v4 = *(void *)(v36 + 88);
    uint64_t v35 = *(void *)(v36 + 72);
    uint64_t v34 = *(void *)(v36 + 64);
    uint64_t v33 = *(void *)(v36 + 56);
    uint64_t v32 = *(void *)(v36 + 48);
    uint64_t v24 = *(void *)(v36 + 32);
    uint64_t v11 = (void *)(v31 + *(int *)(v36 + 156));
    uint64_t v10 = v31 + *(int *)(v36 + 152);
    uint64_t v9 = v4 + *(int *)(v35 + 48);
    unint64_t v12 = (const void *)(v4 + *(int *)(v35 + 64));
    uint64_t v26 = *(void *)(v32 - 8);
    uint64_t v16 = *(void (**)(void))(v26 + 32);
    v16();
    uint64_t v29 = *(void *)(v33 - 8);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v29 + 32);
    v21(v10, v9);
    sub_1B8CEA77C(v12, v11, v33, v34);
    uint64_t v23 = swift_getTupleTypeMetadata2();
    uint64_t v22 = v24 + *(int *)(v23 + 48);
    uint64_t v13 = v15 + *(int *)(v35 + 48);
    uint64_t v14 = (void *)(v15 + *(int *)(v35 + 64));
    uint64_t v17 = *(void (**)(void))(v26 + 16);
    v17();
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16);
    v18(v13, v10, v33);
    sub_1B8CE729C(v11, v14, v33, v34);
    uint64_t v30 = v15 + *(int *)(v35 + 48);
    uint64_t v28 = v15 + *(int *)(v35 + 64);
    ((void (*)(uint64_t))v16)(v24);
    uint64_t v19 = v27 + *(int *)(v35 + 48);
    uint64_t v20 = (void *)(v27 + *(int *)(v35 + 64));
    v17();
    v18(v19, v10, v33);
    sub_1B8CE729C(v11, v20, v33, v34);
    uint64_t v25 = v27 + *(int *)(v35 + 64);
    ((void (*)(uint64_t, uint64_t, uint64_t))v21)(v22, v27 + *(int *)(v35 + 48), v33);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 56))(v24, 0, 1);
    sub_1B8CDE920(v25, v33);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v32);
    sub_1B8CDE920(v28, v33);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v33);
    sub_1B8DBED28(v31, v32, v33, v34, v35);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(v36 + 16) + 8);
  return v6();
}

uint64_t sub_1B8DBEAE4()
{
  *(void *)(v0 + 16) = v0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_1B8DBEBC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 48))(a1, 1))
  {
    (*(void (**)(uint64_t))(*(void *)(a2 - 8) + 8))(a1);
    uint64_t v7 = *(void *)(a3 - 8);
    uint64_t v6 = *(void (**)(uint64_t))(v7 + 8);
    v6(a1 + *(int *)(a5 + 48));
    uint64_t v8 = a1 + *(int *)(a5 + 64);
    if (!(*(unsigned int (**)(void))(v7 + 48))()) {
      ((void (*)(uint64_t, uint64_t))v6)(v8, a3);
    }
  }
  return a1;
}

uint64_t sub_1B8DBED28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(void))(*(void *)(a2 - 8) + 8))();
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v6 = *(void (**)(uint64_t))(v8 + 8);
  v6(a1 + *(int *)(a5 + 48));
  uint64_t v11 = *(int *)(a5 + 64);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1 + v11, 1, a3)) {
    ((void (*)(uint64_t, uint64_t))v6)(a1 + v11, a3);
  }
  return a1;
}

uint64_t sub_1B8DBEE44(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x1F4188298](sub_1B8DBEE90, 0);
}

uint64_t sub_1B8DBEE90()
{
  uint64_t v1 = (void *)v0[5];
  v0[2] = v0;
  v0[6] = *v1;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v5[7] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = sub_1B8DBBF64;
  uint64_t v3 = v5[4];
  return sub_1B8DBE0E8(v3);
}

uint64_t sub_1B8DBEF54(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = sub_1B8DBC260;
  return sub_1B8DBEE44(a1);
}

uint64_t sub_1B8DBF010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a4;
  v6[2] = v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[4] = AssociatedTypeWitness;
  v6[5] = *(void *)(AssociatedTypeWitness - 8);
  v6[6] = swift_task_alloc();
  uint64_t v15 = swift_task_alloc();
  v6[7] = v15;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v10 + 64) = v8;
  *uint64_t v8 = *(void *)(v10 + 16);
  v8[1] = sub_1B8DBC568;
  return MEMORY[0x1F4187C88](a1, a2, a3, a5, a6, v15);
}

uint64_t sub_1B8DBF184@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1B8DBDB80(a1);
  return sub_1B8DBDAE4(v4, *(void *)(a1 + 16), *(void *)(a1 + 24), a1);
}

uint64_t sub_1B8DBF1D0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B8DBF208()
{
  uint64_t v3 = swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    uint64_t v3 = swift_checkMetadataState();
    if (v1 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return v3;
}

unint64_t sub_1B8DBF354(char *a1, char *a2, uint64_t a3)
{
  int v9 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v9 & 0x20000) != 0)
  {
    uint64_t v4 = *(void *)a2;
    swift_retain();
    *(void *)a1 = v4;
    return *(void *)a1 + ((v9 + 16) & ~(unint64_t)v9);
  }
  else
  {
    (*(void (**)(char *, char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1, a2);
    (*(void (**)(char *, char *))(*(void *)(*(void *)(a3 + 24) - 8) + 16))(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)]);
    return (unint64_t)a1;
  }
}

uint64_t sub_1B8DBF498(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 8))(a1 + *(int *)(a2 + 52));
}

uint64_t sub_1B8DBF534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8DBF5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8DBF694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8DBF744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8DBF7F4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B8DBF81C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  if (a2 == *(_DWORD *)(*(void *)(v6 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 48))(a1, a2, v6);
  }
  else
  {
    uint64_t v4 = *(void *)(a3 + 24);
    if (a2 == *(_DWORD *)(*(void *)(v4 - 8) + 84)) {
      return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 48))(a1 + *(int *)(a3 + 52), a2, v4);
    }
    else {
      __break(1u);
    }
  }
  return v5;
}

uint64_t sub_1B8DBF980()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1B8DBF9A8(uint64_t result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + 16);
  if (a3 == *(_DWORD *)(*(void *)(v5 - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(v5 - 8) + 56))(result, a2, a2, v5);
  }
  uint64_t v4 = *(void *)(a4 + 24);
  if (a3 == *(_DWORD *)(*(void *)(v4 - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(v4 - 8) + 56))(result + *(int *)(a4 + 52), a2, a2, v4);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AsyncZip2Sequence.Iterator()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B8DBFB38()
{
  return swift_allocateGenericClassMetadata();
}

uint64_t sub_1B8DBFB68()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t sub_1B8DBFBE8()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1B8DBFC7C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8DBFCAC()
{
  uint64_t v1 = sub_1B8E10B38();
  __swift_allocate_value_buffer(v1, qword_1E9EF0E28);
  __swift_project_value_buffer(v1, (uint64_t)qword_1E9EF0E28);
  return sub_1B8DBFCF8();
}

uint64_t sub_1B8DBFCF8()
{
  AFLogInitIfNeeded();
  uint64_t v2 = (id *)MEMORY[0x1E4F4E380];
  swift_beginAccess();
  id v3 = *v2;
  id v0 = *v2;
  swift_endAccess();
  if (!v3)
  {
    sub_1B8E11F58();
    __break(1u);
  }
  return sub_1B8E10B48();
}

uint64_t sub_1B8DBFDF4()
{
  if (qword_1E9EF0118 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1B8E10B38();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1E9EF0E28);
}

void __swiftcall CESRPhoneticEmbedder.init(localeIdentifier:clientID:)(CESRPhoneticEmbedder *__return_ptr retstr, Swift::String localeIdentifier, Swift::String clientID)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_1B8E11708();
  id v4 = (id)sub_1B8E11708();
  objc_msgSend(v3, sel_initWithLocaleIdentifier_clientID_, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id CESRPhoneticEmbedder.init(localeIdentifier:clientID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v69 = a1;
  uint64_t v70 = a2;
  uint64_t v60 = a3;
  uint64_t v61 = a4;
  uint64_t v57 = 0;
  v76 = sub_1B8CD4B7C;
  v80 = sub_1B8CDB158;
  v82 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B8CDB0BC;
  v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B8CDB0BC;
  v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B8CDB228;
  id v106 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v102 = 0;
  uint64_t v103 = 0;
  uint64_t v49 = 0;
  unint64_t v50 = (*(void *)(*(void *)(sub_1B8E11178() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v51 = (uint64_t)v38 - v50;
  uint64_t v52 = sub_1B8E11168();
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v54 = v52 - 8;
  unint64_t v55 = (*(void *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v57);
  v56 = (char *)v38 - v55;
  unint64_t v58 = (*(void *)(*(void *)(sub_1B8E10AB8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v57);
  v59 = (char *)v38 - v58;
  uint64_t v68 = sub_1B8E10B38();
  uint64_t v66 = *(void *)(v68 - 8);
  uint64_t v67 = v68 - 8;
  unint64_t v62 = (*(void *)(v66 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v65);
  id v4 = (char *)v38 - v62;
  v63 = (char *)v38 - v62;
  uint64_t v104 = v5;
  uint64_t v105 = v6;
  uint64_t v102 = v7;
  uint64_t v103 = v8;
  id v10 = v9;
  uint64_t v11 = v65;
  unint64_t v12 = v65;
  id v106 = v65;
  uint64_t v64 = OBJC_IVAR___CESRPhoneticEmbedder_localeString;
  uint64_t v13 = sub_1B8E115C8();
  id v14 = v65;
  uint64_t v15 = (uint64_t *)&v65[v64];
  *uint64_t v15 = v13;
  v15[1] = v16;

  uint64_t v17 = sub_1B8DBFDF4();
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v4, v17, v68);
  sub_1B8E11678();
  uint64_t v77 = 32;
  uint64_t v78 = 7;
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v70;
  uint64_t v79 = v18;
  *(void *)(v18 + 16) = v69;
  *(void *)(v18 + 24) = v19;
  v91 = sub_1B8E10B28();
  int v92 = sub_1B8E11CD8();
  v73 = &v100;
  uint64_t v100 = 12;
  unint64_t v71 = sub_1B8CD93C4();
  unint64_t v72 = sub_1B8CD9440();
  sub_1B8CD94BC();
  sub_1B8E11898();
  uint32_t v74 = v101;
  uint64_t v75 = 17;
  uint64_t v83 = swift_allocObject();
  *(unsigned char *)(v83 + 16) = 32;
  uint64_t v85 = swift_allocObject();
  *(unsigned char *)(v85 + 16) = 8;
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v79;
  uint64_t v81 = v20;
  *(void *)(v20 + 16) = v76;
  *(void *)(v20 + 24) = v21;
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v81;
  uint64_t v88 = v22;
  *(void *)(v22 + 16) = v80;
  *(void *)(v22 + 24) = v23;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6942B0);
  uint64_t v86 = sub_1B8E120F8();
  v89 = v24;
  swift_retain();
  uint64_t v25 = v83;
  uint64_t v26 = v89;
  *v89 = v82;
  v26[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v25;
  swift_retain();
  uint64_t v27 = v85;
  uint64_t v28 = v89;
  v89[2] = v84;
  v28[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v27;
  swift_retain();
  uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v88;
  uint64_t v30 = v89;
  v89[4] = v87;
  v30[5] = v29;
  sub_1B8CD4B88();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v91, (os_log_type_t)v92))
  {
    uint64_t v31 = v49;
    uint64_t v42 = (uint8_t *)sub_1B8E11D98();
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB694180);
    uint64_t v43 = sub_1B8CDAC48(0);
    uint64_t v44 = sub_1B8CDAC48(1);
    uint64_t v45 = &v97;
    v97 = v42;
    v46 = &v96;
    uint64_t v96 = v43;
    uint64_t v47 = &v95;
    uint64_t v95 = v44;
    sub_1B8CDACA4(2, &v97);
    sub_1B8CDACA4(1, v45);
    v93 = v82;
    uint64_t v94 = v83;
    sub_1B8CDACB8(&v93, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47);
    uint64_t v48 = v31;
    if (v31)
    {
      __break(1u);
    }
    else
    {
      v93 = v84;
      uint64_t v94 = v85;
      sub_1B8CDACB8(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
      uint64_t v40 = 0;
      v93 = v87;
      uint64_t v94 = v88;
      sub_1B8CDACB8(&v93, (uint64_t)&v97, (uint64_t)&v96, (uint64_t)&v95);
      _os_log_impl(&dword_1B8CCB000, v91, (os_log_type_t)v92, "CESRPhoneticEmbedder init with language %s", v42, v74);
      sub_1B8CDAD04(v43);
      sub_1B8CDAD04(v44);
      sub_1B8E11D78();
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v66 + 8))(v63, v68);
  sub_1B8E11678();
  v38[0] = &v65[OBJC_IVAR___CESRPhoneticEmbedder_localeString];
  v38[1] = &v99;
  swift_beginAccess();
  uint64_t v32 = v38[0];
  uint64_t v33 = v70;
  *(void *)v38[0] = v69;
  *(void *)(v32 + 8) = v33;
  swift_bridgeObjectRelease();
  swift_endAccess();

  sub_1B8E111A8();
  sub_1B8E10A98();
  sub_1B8E11678();
  (*(void (**)(char *, void, uint64_t))(v53 + 104))(v56, *MEMORY[0x1E4F3C148], v52);
  sub_1B8DC09B4(v51);
  uint64_t v34 = sub_1B8E11188();
  id v35 = v65;
  *(void *)&v65[OBJC_IVAR___CESRPhoneticEmbedder_phoneticEmbedder] = v34;

  v98.receiver = v106;
  v98.super_class = (Class)CESRPhoneticEmbedder;
  id v39 = objc_msgSendSuper2(&v98, sel_init);
  id v36 = v39;
  id v106 = v39;
  swift_bridgeObjectRelease();

  return v39;
}

uint64_t sub_1B8DC0974()
{
  return swift_deallocObject();
}

uint64_t sub_1B8DC09B4@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x1E4F3C150];
  uint64_t v1 = sub_1B8E11178();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t CESRPhoneticEmbedder.findAlternatives(for:maxResults:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[21] = v3;
  v4[20] = a3;
  v4[19] = a2;
  v4[18] = a1;
  v4[9] = v4;
  v4[5] = 0;
  v4[6] = 0;
  v4[10] = 0;
  v4[11] = 0;
  v4[12] = 0;
  v4[13] = 0;
  v4[14] = 0;
  v4[7] = 0;
  v4[8] = 0;
  v4[17] = 0;
  v4[5] = a1;
  v4[6] = a2;
  v4[10] = a3;
  v4[11] = v3;
  return MEMORY[0x1F4188298](sub_1B8DC0B40, 0);
}

uint64_t sub_1B8DC0B40()
{
  uint64_t v6 = v0[21];
  v0[9] = v0;
  v0[12] = sub_1B8E120F8();
  uint64_t v7 = (void *)(v6 + OBJC_IVAR___CESRPhoneticEmbedder_phoneticEmbedder);
  swift_beginAccess();
  v0[22] = *v7;
  swift_retain();
  swift_endAccess();
  uint64_t v1 = (void *)swift_task_alloc();
  v8[23] = v1;
  *uint64_t v1 = v8[9];
  v1[1] = sub_1B8DC0C64;
  uint64_t v2 = v8[20];
  uint64_t v3 = v8[19];
  uint64_t v4 = v8[18];
  return MEMORY[0x1F40F7988](v2, v4, v3);
}

uint64_t sub_1B8DC0C64(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[9] = *v2;
  v5[24] = a1;
  v5[25] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = sub_1B8DC0FDC;
  }
  else
  {
    swift_release();
    uint64_t v3 = sub_1B8DC0DE8;
  }
  return MEMORY[0x1F4188298](v3, 0);
}

uint64_t sub_1B8DC0DE8()
{
  uint64_t v6 = v0[24];
  v0[9] = v0;
  v0[14] = v6;
  sub_1B8E11678();
  v0[15] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0E58);
  sub_1B8DC1D34();
  sub_1B8E11C68();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0E68);
    sub_1B8E11F38();
    uint64_t v4 = v5[16];
    if (!v4) {
      break;
    }
    v5[17] = v4;
    sub_1B8E111B8();
    sub_1B8E11938();
    swift_release();
  }
  sub_1B8CCE2D4();
  uint64_t v3 = v5[12];
  sub_1B8E11678();
  swift_bridgeObjectRelease();
  sub_1B8CCE2D4();
  uint64_t v1 = *(uint64_t (**)(uint64_t, void))(v5[9] + 8);
  return v1(v3, 0);
}

uint64_t sub_1B8DC0FDC()
{
  id v4 = (id)v0[25];
  v0[9] = v0;
  swift_release();
  id v1 = v4;
  v0[13] = v4;

  sub_1B8CCE2D4();
  uint64_t v2 = *(uint64_t (**)(void, id))(v0[9] + 8);
  return v2(0, v4);
}

uint64_t sub_1B8DC116C(void *a1, uint64_t a2, const void *a3, void *a4)
{
  v4[4] = a4;
  v4[3] = a1;
  v4[2] = v4;
  id v6 = a1;
  v4[5] = _Block_copy(a3);
  id v7 = a4;
  uint64_t v15 = sub_1B8E11718();
  uint64_t v13 = v8;
  v4[6] = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v12 + 56) = v9;
  *uint64_t v9 = *(void *)(v12 + 16);
  v9[1] = sub_1B8DC1268;
  return CESRPhoneticEmbedder.findAlternatives(for:maxResults:)(v15, v13, a2);
}

uint64_t sub_1B8DC1268(uint64_t a1, void *a2)
{
  uint64_t v4 = *v3;
  *(void *)(v4 + 16) = *v3;
  uint64_t v18 = (void *)(v4 + 16);
  uint64_t v19 = v4 + 16;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v11 = (void (**)(void *, void))v18[3];
    id v10 = (id)sub_1B8E108F8();
    v11[2](v11, 0);

    _Block_release(v11);
  }
  else
  {
    sub_1B8E11678();
    uint64_t v16 = 0;
    if (a1)
    {
      uint64_t v15 = sub_1B8E118B8();
      swift_bridgeObjectRelease();
      uint64_t v16 = (void *)v15;
    }
    id v5 = a2;
    id v14 = 0;
    if (a2)
    {
      uint64_t v13 = sub_1B8E108F8();

      id v14 = (void *)v13;
    }
    aBlock = (void (**)(void))v18[3];
    aBlock[2]();

    _Block_release(aBlock);
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = (void *)v18[2];
  uint64_t v8 = (void *)v18[1];
  swift_bridgeObjectRelease();

  id v6 = *(uint64_t (**)(void))(*(void *)v19 + 8);
  return v6();
}

uint64_t sub_1B8DC1514(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v15 = 0;
  uint64_t v23 = &unk_1E9EF0E90;
  uint64_t v25 = &unk_1E9EF0EA0;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6933B0) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v26 = (char *)&v15 - v16;
  uint64_t v2 = sub_1B8E11A38();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 56))(v26, 1);
  uint64_t v19 = 48;
  uint64_t v20 = 7;
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = v17;
  id v5 = (void *)v3;
  uint64_t v6 = v18;
  uint64_t v24 = v5;
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v6;
  v5[5] = v4;
  uint64_t v21 = v5[2];
  uint64_t v22 = v5[3];
  swift_unknownObjectRetain();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  id v10 = v24;
  uint64_t v11 = (uint64_t)v25;
  uint64_t v12 = (void *)v7;
  uint64_t v13 = (uint64_t)v26;
  v12[2] = v21;
  v12[3] = v8;
  v12[4] = v9;
  v12[5] = v10;
  sub_1B8DC19EC(v13, v11, (uint64_t)v12);
  return swift_release();
}

void __swiftcall CESRPhoneticEmbedder.init()(CESRPhoneticEmbedder *__return_ptr retstr)
{
}

uint64_t CESRPhoneticEmbedder.init()()
{
  if (!"CoreEmbeddedSpeechRecognition_Private.CESRPhoneticEmbedder")
  {
    sub_1B8E11F58();
    __break(1u);
  }
  uint64_t result = sub_1B8D90D50((uint64_t)"CoreEmbeddedSpeechRecognition_Private.CESRPhoneticEmbedder", 58, (unint64_t)"", 0, 2, (unint64_t)"", 0, 2, v1, 0, 0);
  __break(1u);
  return result;
}

uint64_t sub_1B8DC17FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v7 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = sub_1B8D0D050;
  return v7();
}

uint64_t sub_1B8DC18F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = v4;
  *(void *)(v4 + 16) = v4;
  uint64_t v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v5;
  *id v5 = *(void *)(v7 + 16);
  v5[1] = sub_1B8D0D050;
  return v8();
}

uint64_t sub_1B8DC19EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = sub_1B8E11A38();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 48))(a1, 1) == 1)
  {
    sub_1B8D0D6F4(a1);
  }
  else
  {
    sub_1B8E11A28();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  uint64_t v5 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v5)
  {
    swift_getObjectType();
    sub_1B8E119B8();
    swift_unknownObjectRelease();
  }
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  *(void *)(v4 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B8DC1C5C()
{
  return swift_deallocObject();
}

uint64_t sub_1B8DC1C88()
{
  return swift_deallocObject();
}

uint64_t sub_1B8DC1CB4()
{
  return swift_deallocObject();
}

uint64_t sub_1B8DC1CF4()
{
  return swift_deallocObject();
}

unint64_t sub_1B8DC1D34()
{
  uint64_t v2 = qword_1E9EF0E60;
  if (!qword_1E9EF0E60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9EF0E58);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9EF0E60);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1B8DC1DB8()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_1B8DC1E08()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v9 = (void *)v0[2];
  uint64_t v6 = v0[3];
  uint64_t v7 = (const void *)v0[4];
  uint64_t v8 = (void *)v0[5];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_1B8D0D050;
  uint64_t v3 = dword_1E9EF0E70;
  return ((uint64_t (*)(void *, uint64_t, const void *, void *))((char *)&dword_1E9EF0E70 + v3))(v9, v6, v7, v8);
}

unint64_t type metadata accessor for CESRPhoneticEmbedder()
{
  uint64_t v2 = qword_1E9EF0E80;
  if (!qword_1E9EF0E80)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9EF0E80);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1B8DC1F68()
{
  return swift_deallocObject();
}

uint64_t sub_1B8DC1FB0()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v7 = (int *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_1B8D0D050;
  uint64_t v3 = dword_1E9EF0E88;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1E9EF0E88 + v3))(v8, v6, v7);
}

uint64_t sub_1B8DC20A8()
{
  return swift_deallocObject();
}

uint64_t sub_1B8DC20F0(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = (int *)v1[4];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1B8D0D050;
  uint64_t v4 = dword_1E9EF0E98;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E9EF0E98 + v4))(a1, v7, v8, v9);
}

uint64_t sub_1B8DC21F0()
{
  return swift_deallocObject();
}

uint64_t sub_1B8DC2230(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = *(int **)(v1 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = sub_1B8D0D050;
  uint64_t v4 = dword_1E9EF0EA8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1E9EF0EA8 + v4))(a1, v7);
}

const char *sub_1B8DC2318()
{
  return "Accessibility";
}

const char *sub_1B8DC2334()
{
  return "SiriAtypicalSpeech";
}

uint64_t sub_1B8DC2364()
{
  return 1;
}

uint64_t sub_1B8DC2388()
{
  return sub_1B8E121A8();
}

uint64_t sub_1B8DC23E0()
{
  return sub_1B8E11E48();
}

unint64_t sub_1B8DC2418()
{
  uint64_t v2 = qword_1E9EF0EB8;
  if (!qword_1E9EF0EB8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9EF0EB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1B8DC2498()
{
  return sub_1B8DC2364() & 1;
}

uint64_t sub_1B8DC24B4()
{
  return sub_1B8DC23E0();
}

uint64_t sub_1B8DC24CC()
{
  return sub_1B8DC2388();
}

const char *sub_1B8DC24E4()
{
  return sub_1B8DC2318();
}

const char *sub_1B8DC24FC()
{
  return sub_1B8DC2334();
}

uint64_t sub_1B8DC2518(unsigned __int8 *a1, int a2)
{
  if (a2)
  {
    int v6 = 1;
    if ((a2 + 1) >= 0x100)
    {
      if ((a2 + 1) >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v6 = v2;
    }
    if (v6 == 1)
    {
      int v5 = *a1;
    }
    else if (v6 == 2)
    {
      int v5 = *(unsigned __int16 *)a1;
    }
    else
    {
      int v5 = *(_DWORD *)a1;
    }
    if (v5) {
      int v4 = v5 - 1;
    }
    else {
      int v4 = -1;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

unsigned char *sub_1B8DC26AC(unsigned char *result, int a2, int a3)
{
  int v5 = 0;
  if (a3)
  {
    int v4 = 1;
    if ((a3 + 1) >= 0x100)
    {
      if ((a3 + 1) >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v4 = v3;
    }
    int v5 = v4;
  }
  if (a2)
  {
    if (v5)
    {
      if (v5 == 1)
      {
        *uint64_t result = a2;
      }
      else if (v5 == 2)
      {
        *(_WORD *)uint64_t result = a2;
      }
      else
      {
        *(_DWORD *)uint64_t result = a2;
      }
    }
  }
  else if (v5)
  {
    if (v5 == 1)
    {
      *uint64_t result = 0;
    }
    else if (v5 == 2)
    {
      *(_WORD *)uint64_t result = 0;
    }
    else
    {
      *(_DWORD *)uint64_t result = 0;
    }
  }
  return result;
}

void *type metadata accessor for AccessibilityFeatureFlagsKey()
{
  return &unk_1F1288AD0;
}

unint64_t sub_1B8DC28D0()
{
  return sub_1B8DC28E8();
}

unint64_t sub_1B8DC28E8()
{
  uint64_t v2 = qword_1E9EF0EC0;
  if (!qword_1E9EF0EC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9EF0EC0);
    return WitnessTable;
  }
  return v2;
}

uint64_t CESAContextualData.__allocating_init(assets:taskName:applicationName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return CESAContextualData.init(assets:taskName:applicationName:)(a1, a2, a3, a4, a5);
}

uint64_t CESAContextualData.init(assets:taskName:applicationName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a1;
  uint64_t v17 = a2;
  uint64_t v20 = a3;
  uint64_t v19 = a4;
  uint64_t v18 = a5;
  uint64_t v31 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = sub_1B8E11598();
  uint64_t v21 = *(void *)(v24 - 8);
  uint64_t v22 = v24 - 8;
  double v6 = MEMORY[0x1F4188790](v24);
  unint64_t v16 = (char *)&v16 - v7;
  uint64_t v31 = v8;
  uint64_t v29 = v17;
  uint64_t v30 = v20;
  uint64_t v27 = v9;
  uint64_t v28 = v10;
  uint64_t v26 = v5;
  (*(void (**)(double))(v21 + 16))(v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v5 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_assets, v16, v24);
  sub_1B8E11678();
  uint64_t v11 = v20;
  uint64_t v12 = (void *)(v5 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_taskName);
  *uint64_t v12 = v17;
  v12[1] = v11;
  sub_1B8E11678();
  uint64_t v13 = v18;
  id v14 = (void *)(v5 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_applicationName);
  *id v14 = v19;
  v14[1] = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v24);
  return v25;
}

uint64_t CESAContextualData.fetchNamedEntities(timeInterval:)(double a1)
{
  *(void *)(v2 + 368) = v1;
  *(double *)(v2 + 360) = a1;
  *(void *)(v2 + 192) = v2;
  *(void *)(v2 + 200) = 0;
  *(void *)(v2 + 208) = 0;
  *(void *)(v2 + 216) = 0;
  *(void *)(v2 + 224) = 0;
  *(void *)(v2 + 112) = 0;
  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 240) = 0;
  *(void *)(v2 + 128) = 0;
  *(void *)(v2 + 136) = 0;
  *(void *)(v2 + 256) = 0;
  *(void *)(v2 + 264) = 0;
  *(void *)(v2 + 272) = 0;
  *(void *)(v2 + 144) = 0;
  *(void *)(v2 + 152) = 0;
  *(void *)(v2 + 296) = 0;
  *(void *)(v2 + 160) = 0;
  *(void *)(v2 + 168) = 0;
  *(void *)(v2 + 328) = 0;
  *(void *)(v2 + 176) = 0;
  *(void *)(v2 + 184) = 0;
  *(void *)(v2 + 336) = 0;
  *(void *)(v2 + 344) = 0;
  *(void *)(v2 + 376) = sub_1B8E113F8();
  *(void *)(v2 + 384) = swift_task_alloc();
  uint64_t v3 = sub_1B8E11498();
  *(void *)(v2 + 392) = v3;
  *(void *)(v2 + 400) = *(void *)(v3 - 8);
  *(void *)(v2 + 408) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0EE8);
  *(void *)(v2 + 416) = swift_task_alloc();
  uint64_t v4 = sub_1B8E10A18();
  *(void *)(v2 + 424) = v4;
  *(void *)(v2 + 432) = *(void *)(v4 - 8);
  *(void *)(v2 + 440) = swift_task_alloc();
  *(void *)(v2 + 448) = swift_task_alloc();
  uint64_t v5 = sub_1B8E11448();
  *(void *)(v2 + 456) = v5;
  uint64_t v8 = *(void *)(v5 - 8);
  *(void *)(v2 + 464) = v8;
  *(void *)(v2 + 472) = *(void *)(v8 + 64);
  *(void *)(v2 + 480) = swift_task_alloc();
  *(void *)(v2 + 488) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0EF0);
  *(void *)(v2 + 496) = swift_task_alloc();
  uint64_t v6 = sub_1B8E11598();
  *(void *)(v2 + 504) = v6;
  *(void *)(v2 + 512) = *(void *)(v6 - 8);
  *(void *)(v2 + 520) = swift_task_alloc();
  *(void *)(v2 + 528) = swift_task_alloc();
  *(double *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = v1;
  return MEMORY[0x1F4188298](sub_1B8DC2F7C, 0);
}

uint64_t sub_1B8DC2F7C()
{
  uint64_t v8 = v0[66];
  uint64_t v6 = v0[64];
  uint64_t v7 = v0[63];
  uint64_t v11 = v0[46];
  v0[24] = v0;
  uint64_t v5 = swift_allocObject();
  v0[67] = v5;
  v0[27] = v5 + 16;
  *(void *)(v5 + 16) = sub_1B8E120F8();
  sub_1B8DC5144();
  id v1 = sub_1B8CD38F8();
  v0[68] = v1;
  v0[28] = v1;
  uint64_t v2 = OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_assets;
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v0[69] = v3;
  v0[70] = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v3(v8, v11 + v2, v7);
  uint64_t v9 = *(void *)(v11 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_applicationName);
  uint64_t v10 = *(void *)(v11 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_applicationName + 8);
  v0[71] = v10;
  sub_1B8E11678();
  uint64_t v12 = *(void *)(v11 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_taskName);
  uint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_taskName + 8);
  v0[72] = v13;
  sub_1B8E11678();
  id v14 = (void *)swift_task_alloc();
  v0[73] = v14;
  *id v14 = v0[24];
  v14[1] = sub_1B8DC31C0;
  return MEMORY[0x1F40F7B78](v9, v10, v12, v13);
}

uint64_t sub_1B8DC31C0(uint64_t a1)
{
  uint64_t v9 = (void *)*v2;
  v9[24] = *v2;
  v9[74] = a1;
  v9[75] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_1B8DC4CD4;
  }
  else
  {
    uint64_t v7 = v9[66];
    uint64_t v6 = v9[64];
    uint64_t v8 = v9[63];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v9[76] = v3;
    v9[77] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v3(v7, v8);
    uint64_t v4 = sub_1B8DC3400;
  }
  return MEMORY[0x1F4188298](v4, 0);
}

uint64_t sub_1B8DC3400()
{
  uint64_t v1 = v0[74];
  v0[24] = v0;
  v0[29] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F00);
  sub_1B8DC51AC();
  sub_1B8E11C68();
  while (1)
  {
    uint64_t v47 = v49[62];
    uint64_t v48 = v49[57];
    uint64_t v46 = v49[58];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F10);
    sub_1B8E11F38();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v47, 1, v48) == 1) {
      break;
    }
    uint64_t v2 = (void (**)(void))(v49[58] + 32);
    uint64_t v43 = *v2;
    (*v2)();
    sub_1B8DC5AF4();
    id v44 = sub_1B8CD38F8();
    v49[42] = v44;
    sub_1B8E11408();
    char v45 = sub_1B8E11BC8();
    swift_bridgeObjectRelease();
    if ((v45 & 1) == 0)
    {
      sub_1B8E11408();
      uint64_t v42 = (void *)sub_1B8E11B68();
      swift_bridgeObjectRelease();
      objc_msgSend(v44, sel_setMatchingSourceBundleIds_, v42);
    }
    uint64_t v38 = (void *)v49[68];
    uint64_t v32 = v49[67];
    uint64_t v31 = v49[61];
    uint64_t v35 = v49[60];
    uint64_t v36 = v49[57];
    uint64_t v28 = v49[56];
    uint64_t v25 = v49[55];
    uint64_t v26 = v49[53];
    uint64_t v30 = v49[58];
    uint64_t v23 = v49[54];
    sub_1B8E11438();
    sub_1B8E109E8();
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v27(v25, v26);
    id v24 = (id)sub_1B8E109F8();
    v27(v28, v26);
    objc_msgSend(v44, sel_setFromDate_, v24);

    sub_1B8E11428();
    sub_1B8E109E8();
    v27(v25, v26);
    id v29 = (id)sub_1B8E109F8();
    v27(v28, v26);
    objc_msgSend(v44, sel_setToDate_, v29);

    uint64_t v33 = swift_allocObject();
    v49[43] = v33 + 16;
    *(void *)(v33 + 16) = 0;
    swift_retain();
    swift_retain();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v35, v31, v36);
    unint64_t v34 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v32;
    *(void *)(v37 + 24) = v33;
    ((void (*)(unint64_t, uint64_t, uint64_t))v43)(v37 + v34, v35, v36);
    v49[6] = sub_1B8DC5C78;
    v49[7] = v37;
    v49[2] = MEMORY[0x1E4F143A8];
    *((_DWORD *)v49 + 6) = 1107296256;
    *((_DWORD *)v49 + 7) = 0;
    v49[4] = sub_1B8DC57C0;
    v49[5] = &block_descriptor_0;
    uint64_t v40 = _Block_copy(v49 + 2);
    swift_release();
    v49[44] = 0;
    unsigned __int8 v41 = objc_msgSend(v38, sel_iterRankedNamedEntitiesWithQuery_error_block_, v44, v49 + 44, v40);
    id v39 = (void *)v49[44];
    id v3 = v39;

    _Block_release(v40);
    if ((v41 & 1) == 0)
    {
      id v10 = (id)v49[68];
      uint64_t v8 = v49[61];
      uint64_t v9 = v49[57];
      uint64_t v7 = v49[58];
      sub_1B8E10908();

      swift_willThrow();
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
      sub_1B8CCE2D4();

      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v5 = *(uint64_t (**)())(v49[24] + 8);
      return v5();
    }
    uint64_t v21 = v49[61];
    uint64_t v22 = v49[57];
    uint64_t v20 = v49[58];
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
  }
  uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t))v49[69];
  uint64_t v13 = v49[65];
  uint64_t v11 = v49[63];
  uint64_t v16 = v49[46];
  sub_1B8CCE2D4();
  sub_1B8DC5230();
  id v4 = sub_1B8CD38F8();
  v49[78] = v4;
  v49[30] = v4;
  v12(v13, v16 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_assets, v11);
  uint64_t v14 = *(void *)(v16 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_applicationName);
  uint64_t v15 = *(void *)(v16 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_applicationName + 8);
  v49[79] = v15;
  sub_1B8E11678();
  uint64_t v17 = *(void *)(v16 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_taskName);
  uint64_t v18 = *(void *)(v16 + OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_taskName + 8);
  v49[80] = v18;
  sub_1B8E11678();
  uint64_t v19 = (void *)swift_task_alloc();
  v49[81] = v19;
  *uint64_t v19 = v49[24];
  v19[1] = sub_1B8DC3DE0;
  return MEMORY[0x1F40F7B80](v14, v15, v17, v18);
}

uint64_t sub_1B8DC3DE0(uint64_t a1)
{
  uint64_t v8 = (void *)*v2;
  v8[24] = *v2;
  v8[82] = a1;
  v8[83] = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v3 = sub_1B8DC4EE4;
  }
  else
  {
    uint64_t v7 = (void (*)(uint64_t, uint64_t))v8[76];
    uint64_t v5 = v8[65];
    uint64_t v6 = v8[63];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7(v5, v6);
    id v3 = sub_1B8DC400C;
  }
  return MEMORY[0x1F4188298](v3, 0);
}

uint64_t sub_1B8DC400C()
{
  uint64_t v1 = v0[82];
  v0[24] = v0;
  v0[31] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F20);
  sub_1B8DC5830();
  sub_1B8E11C68();
  while (1)
  {
    uint64_t v39 = v41[52];
    uint64_t v40 = v41[49];
    uint64_t v38 = v41[50];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F30);
    sub_1B8E11F38();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v39, 1, v40) == 1) {
      break;
    }
    unint64_t v34 = (void *)v41[78];
    uint64_t v31 = v41[56];
    uint64_t v28 = v41[55];
    uint64_t v29 = v41[53];
    uint64_t v27 = v41[54];
    (*(void (**)(void))(v41[50] + 32))();
    sub_1B8DC58B4();
    id v33 = sub_1B8CD38F8();
    v41[32] = v33;
    sub_1B8E11468();
    uint64_t v26 = (void *)sub_1B8E11708();
    swift_bridgeObjectRelease();
    objc_msgSend(v33, sel_setBundleID_, v26);

    sub_1B8E11488();
    sub_1B8E109E8();
    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v30(v28, v29);
    uint64_t v32 = (void *)sub_1B8E109F8();
    v30(v31, v29);
    objc_msgSend(v33, sel_setSuggestionDate_, v32);

    id v35 = objc_msgSend(v34, sel_rankedGlobalSuggestionsFromContext_contactsOnly_, v33, sub_1B8E11458() & 1);
    sub_1B8DC591C();
    uint64_t v36 = sub_1B8E118C8();
    v41[33] = v36;

    v41[34] = 0;
    sub_1B8E11678();
    v41[35] = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F48);
    sub_1B8DC5984();
    sub_1B8E11C68();
LABEL_4:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F58);
    sub_1B8E11F38();
    id v25 = (id)v41[36];
    if (v25)
    {
      v41[37] = v25;
      id v24 = objc_msgSend(v25, sel_recipients);
      if (v24)
      {
        sub_1B8DC5A08();
        uint64_t v22 = sub_1B8E118C8();

        uint64_t v23 = v22;
      }
      else
      {
        uint64_t v23 = 0;
      }
      v41[38] = v23;
      if (v41[38])
      {
        uint64_t v42 = v41[38];
      }
      else
      {
        sub_1B8DC5A08();
        uint64_t v42 = sub_1B8E120F8();
        sub_1B8CCE2D4();
      }
      v41[39] = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F68);
      sub_1B8DC5A70();
      sub_1B8E11C68();
      while (1)
      {
LABEL_12:
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F78);
        sub_1B8E11F38();
        id v21 = (id)v41[40];
        if (!v21)
        {
          sub_1B8CCE2D4();

          goto LABEL_4;
        }
        v41[41] = v21;
        id v20 = objc_msgSend(v21, sel_displayName);
        if (v20)
        {
          uint64_t v16 = sub_1B8E11718();
          uint64_t v17 = v2;

          uint64_t v18 = v16;
          uint64_t v19 = v17;
        }
        else
        {
          uint64_t v18 = 0;
          uint64_t v19 = 0;
        }
        if (!v19) {
          goto LABEL_27;
        }
        v41[22] = v18;
        v41[23] = v19;
        if (sub_1B8E117D8()) {
          break;
        }
        sub_1B8E11678();
        sub_1B8E113E8();
        swift_beginAccess();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F80);
        sub_1B8E11928();
        uint64_t result = swift_endAccess();
        uint64_t v4 = v41[34];
        uint64_t v15 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          return result;
        }
        v41[34] = v15;
        if (v15 >= sub_1B8E11478())
        {
          swift_bridgeObjectRelease();

          sub_1B8CCE2D4();
          uint64_t v14 = v37;
          goto LABEL_30;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
LABEL_27:

      goto LABEL_12;
    }
    uint64_t v14 = v37;
LABEL_30:
    uint64_t v12 = v41[51];
    uint64_t v13 = v41[49];
    uint64_t v11 = v41[50];
    sub_1B8CCE2D4();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
    uint64_t v37 = v14;
  }
  id v9 = (id)v41[78];
  id v10 = (id)v41[68];
  uint64_t v7 = (uint64_t *)(v41[67] + 16);
  sub_1B8CCE2D4();
  swift_beginAccess();
  uint64_t v8 = *v7;
  sub_1B8E11678();
  swift_endAccess();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v41[24] + 8);
  return v6(v8);
}

uint64_t sub_1B8DC4CD4()
{
  id v6 = (id)v0[68];
  uint64_t v4 = v0[66];
  uint64_t v3 = v0[64];
  uint64_t v5 = v0[63];
  v0[24] = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(v0[24] + 8);
  return v1();
}

uint64_t sub_1B8DC4EE4()
{
  id v6 = (id)v0[78];
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[76];
  id v7 = (id)v0[68];
  uint64_t v3 = v0[65];
  uint64_t v4 = v0[63];
  v0[24] = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5(v3, v4);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)())(v0[24] + 8);
  return v1();
}

uint64_t sub_1B8DC5104()
{
  return swift_deallocObject();
}

unint64_t sub_1B8DC5144()
{
  uint64_t v2 = qword_1E9EF0EF8;
  if (!qword_1E9EF0EF8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9EF0EF8);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1B8DC51AC()
{
  uint64_t v2 = qword_1E9EF0F08;
  if (!qword_1E9EF0F08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9EF0F00);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9EF0F08);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1B8DC5230()
{
  uint64_t v2 = qword_1E9EF0F18;
  if (!qword_1E9EF0F18)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9EF0F18);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1B8DC5298(void *a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v51 = a1;
  uint64_t v50 = a2;
  uint64_t v47 = a3;
  uint64_t v48 = a4;
  uint64_t v49 = a5;
  uint64_t v66 = 0;
  uint64_t v65 = 0;
  uint64_t v64 = 0;
  uint64_t v63 = 0;
  uint64_t v62 = 0;
  unint64_t v52 = (*(void *)(*(void *)(sub_1B8E113F8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v5 = MEMORY[0x1F4188790](v51);
  uint64_t v53 = (char *)v20 - v52;
  uint64_t v66 = v6;
  uint64_t v65 = v7;
  uint64_t v64 = v8 + 16;
  uint64_t v63 = v9 + 16;
  uint64_t v62 = v10;
  id v54 = objc_msgSend(v6, sel_item, v5);
  id v57 = objc_msgSend(v54, sel_name);
  uint64_t v55 = sub_1B8E11718();
  uint64_t v56 = v11;

  unsigned int v58 = sub_1B8E117D8();
  swift_bridgeObjectRelease();

  uint64_t result = v58;
  if ((v58 & 1) == 0)
  {
    id v42 = objc_msgSend(v51, sel_item);
    id v45 = objc_msgSend(v42, sel_bestLanguage);
    uint64_t v43 = sub_1B8E11718();
    uint64_t v44 = v13;

    unsigned int v46 = sub_1B8E117D8();
    swift_bridgeObjectRelease();

    uint64_t result = v46;
    if ((v46 & 1) == 0)
    {
      unint64_t v28 = 0x1F63BF000uLL;
      id v22 = [v51 (SEL)0x1F63BF618];
      id v37 = objc_msgSend(v22, sel_name);
      uint64_t v30 = sub_1B8E11718();
      uint64_t v31 = v14;

      objc_msgSend(v51, sel_score);
      uint64_t v32 = v15;
      id v23 = [v51 (SEL)(v28 + 1560)];
      id v24 = objc_msgSend(v23, sel_category);

      sub_1B8CDA79C();
      uint64_t v27 = v61;
      v61[0] = v16;
      unint64_t v25 = sub_1B8CDBEA4();
      unint64_t v26 = sub_1B8D99C54();
      sub_1B8D98444();
      sub_1B8E118A8();
      uint64_t v33 = v61[1];
      id v29 = [v51 (SEL)(v28 + 1560)];
      id v36 = objc_msgSend(v29, sel_bestLanguage);
      uint64_t v34 = sub_1B8E11718();
      uint64_t v35 = v17;

      sub_1B8E113D8();
      uint64_t v38 = &v60;
      uint64_t v39 = 33;
      uint64_t v40 = 0;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF0F80);
      sub_1B8E11928();
      swift_endAccess();
      uint64_t result = swift_beginAccess();
      uint64_t v18 = *(void *)(v48 + 16);
      uint64_t v41 = v18 + 1;
      if (__OFADD__(v18, 1))
      {
        __break(1u);
      }
      else
      {
        v20[0] = v48 + 16;
        *(void *)(v48 + 16) = v41;
        swift_endAccess();
        v20[1] = &v59;
        swift_beginAccess();
        uint64_t v21 = *(void *)(v48 + 16);
        swift_endAccess();
        uint64_t result = sub_1B8E11418();
        if (v21 >= result) {
          *uint64_t v50 = 1;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1B8DC57C0(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  id v3 = a2;
  v6(a2, a3);

  return swift_release();
}

unint64_t sub_1B8DC5830()
{
  uint64_t v2 = qword_1E9EF0F28;
  if (!qword_1E9EF0F28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9EF0F20);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9EF0F28);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1B8DC58B4()
{
  uint64_t v2 = qword_1E9EF0F38;
  if (!qword_1E9EF0F38)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9EF0F38);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1B8DC591C()
{
  uint64_t v2 = qword_1E9EF0F40;
  if (!qword_1E9EF0F40)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9EF0F40);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1B8DC5984()
{
  uint64_t v2 = qword_1E9EF0F50;
  if (!qword_1E9EF0F50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9EF0F48);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9EF0F50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1B8DC5A08()
{
  uint64_t v2 = qword_1E9EF0F60;
  if (!qword_1E9EF0F60)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9EF0F60);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1B8DC5A70()
{
  uint64_t v2 = qword_1E9EF0F70;
  if (!qword_1E9EF0F70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9EF0F68);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1E9EF0F70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1B8DC5AF4()
{
  uint64_t v2 = qword_1E9EF0F88;
  if (!qword_1E9EF0F88)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1E9EF0F88);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1B8DC5B5C()
{
  return swift_deallocObject();
}

uint64_t sub_1B8DC5B88()
{
  uint64_t v4 = sub_1B8E11448();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

uint64_t sub_1B8DC5C78(void *a1, unsigned char *a2)
{
  uint64_t v3 = sub_1B8E11448();
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = v2
     + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80));

  return sub_1B8DC5298(a1, a2, v4, v5, v6);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t CESAContextualData.deinit()
{
  uint64_t v3 = OBJC_IVAR____TtC29CoreEmbeddedSpeechRecognition18CESAContextualData_assets;
  uint64_t v1 = sub_1B8E11598();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  sub_1B8CD4B10();
  sub_1B8CD4B10();
  return v4;
}

uint64_t CESAContextualData.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1B8DC5E64()
{
  return type metadata accessor for CESAContextualData();
}

uint64_t type metadata accessor for CESAContextualData()
{
  uint64_t v1 = qword_1E9EF0F90;
  if (!qword_1E9EF0F90) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_1B8DC5EF8()
{
  uint64_t updated = sub_1B8E11598();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_1E9EF1A48 == -1)
  {
    if (qword_1E9EF1A50) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_1E9EF1A48, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1E9EF1A50) {
      return _availability_version_check();
    }
  }
  if (qword_1E9EF1A40 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_1E9EF1A40, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_1E9EF1A34 > a3) {
    return 1;
  }
  return dword_1E9EF1A34 >= a3 && dword_1E9EF1A38 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = qword_1E9EF1A50;
  if (qword_1E9EF1A50) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x1E4F143E8])
    {
      uint64_t v1 = MEMORY[0x1F4188798];
      qword_1E9EF1A50 = MEMORY[0x1F4188798];
    }
    if (!v1 || result != 0)
    {
      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    unint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        uint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x1BA9CC230](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              unint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1E9EF1A34, &dword_1E9EF1A38);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

__CFString *CESRSpeechProfileUpdateTypeDescription(int a1)
{
  if ((a1 - 1) > 2) {
    return @"Undefined";
  }
  else {
    return off_1E61C2A18[(a1 - 1)];
  }
}

void sub_1B8DC6A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

__CFString *CESRSpeechProfileUpdateResultTypeDescription(int a1)
{
  if ((a1 - 1) > 5) {
    return @"Undefined";
  }
  else {
    return off_1E61C2A78[(a1 - 1)];
  }
}

void sub_1B8DC8680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B8DCA360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CESRSpeechProfileBuilderServiceGetXPCInterface()
{
  unint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F12AF038];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_addVocabularyItems_isBoosted_completion_ argumentIndex:0 ofReply:0];

  return v0;
}

void ___reverseLookupFieldTypeFromOntologyLabel_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = (void *)_reverseLookupFieldTypeFromOntologyLabel_lookupCache;
  _reverseLookupFieldTypeFromOntologyLabel_lookupCache = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v3 = (void *)_reverseLookupFieldTypeFromOntologyLabel_validFieldTypes;
  _reverseLookupFieldTypeFromOntologyLabel_validFieldTypes = (uint64_t)v2;

  if ((*MEMORY[0x1E4F71F48] & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *MEMORY[0x1E4F71F48] + 1;
    do
    {
      if (KVFieldTypeIsValidForItemType())
      {
        unint64_t v6 = (void *)_reverseLookupFieldTypeFromOntologyLabel_validFieldTypes;
        uint64_t v7 = KVFieldTypeToNumber();
        [v6 addObject:v7];
      }
      ++v4;
    }
    while (v5 != v4);
  }
}

void sub_1B8DCBC8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8DCD370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1B8DCDE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B8DCEFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8DCFB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

__CFString *CESRSpeechProfileAdminResultDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Undefined";
  }
  else {
    return off_1E61C2D10[a1 - 1];
  }
}

id _BOOLValueForKey(const __CFString *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.SpeechProfile");
  if (v2 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315650;
      unint64_t v6 = "_BOOLValueForKey";
      __int16 v7 = 2112;
      uint64_t v8 = v2;
      __int16 v9 = 2112;
      CFStringRef v10 = a1;
      _os_log_error_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_ERROR, "%s value %@ for key %@ should respond to -BOOLValue", (uint8_t *)&v5, 0x20u);
    }

    id v2 = 0;
  }

  return v2;
}

void sub_1B8DD20F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B8DD38BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
}

void sub_1B8DD7188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_1B8DD7678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void _RegisterXPCActivity(const char *a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = v8;
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = ___RegisterXPCActivity_block_invoke;
    v10[3] = &unk_1E61C2E80;
    id v11 = v8;
    id v12 = v7;
    xpc_activity_register(a1, a2, v10);
  }
  else
  {
    xpc_activity_unregister(a1);
  }
}

void sub_1B8DDB0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1129(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1130(uint64_t a1)
{
}

void sub_1B8DDC194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __AFPhrasesAndUtterancesForEARSausage_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unint64_t v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  id v7 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 56)];
  uint64_t v8 = [v7 unsignedIntegerValue];

  __int16 v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
  CFStringRef v10 = +[CESRUtilities afTokensForEARTokens:v9 removeSpaceBefore:*(unsigned __int8 *)(a1 + 64)];
  if ([v10 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F4E5F8]);
    [v11 setTokens:v10];
    int v12 = [*(id *)(a1 + 48) containsObject:v11];
    uint64_t v13 = *(void **)(a1 + 48);
    if (v12)
    {
      uint64_t v14 = [v13 indexOfObject:v11];
    }
    else
    {
      uint64_t v14 = [v13 count];
      [*(id *)(a1 + 48) addObject:v11];
    }
    size_t v15 = [v6 interpretationIndices];
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14];
    uint64_t v17 = [v15 arrayByAddingObject:v16];
    [v6 setInterpretationIndices:v17];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      double v22 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "confidence", (void)v25);
          double v22 = v22 + v24;
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v20);
    }
    else
    {
      double v22 = 0.0;
    }

    objc_msgSend(v6, "setConfidenceScore:", (uint64_t)(v22 + (double)objc_msgSend(v6, "confidenceScore")));
  }
}

void sub_1B8DDE8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *CESRSetError(void *result, id a2)
{
  if (result)
  {
    if (a2)
    {
      id v2 = result;
      uint64_t result = a2;
      *id v2 = result;
    }
  }
  return result;
}

id CESRISO8601StringForDate(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x1E4F28D48];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "setFormatOptions:", objc_msgSend(v3, "formatOptions") | 0x800);
  uint64_t v4 = [v3 stringFromDate:v2];

  return v4;
}

id CESRLaterDate(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  id v5 = (void *)v4;
  if (v3 | v4)
  {
    if (!v3 || v4)
    {
      if (v3 || !v4)
      {
        id v6 = [(id)v3 laterDate:v4];
      }
      else
      {
        id v6 = (id)v4;
      }
    }
    else
    {
      id v6 = (id)v3;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void setEARPackageResultCandidateId(void *a1, id value)
{
}

id earPackageResultCandidateId(void *a1)
{
  return objc_getAssociatedObject(a1, kResultCandidateIdKey);
}

id _speechCategoriesDescription(void *a1)
{
  uint64_t v1 = [a1 allObjects];
  id v2 = [v1 componentsJoinedByString:@", "];

  return v2;
}

void sub_1B8DE4528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1495(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1496(uint64_t a1)
{
}

void sub_1B8DE4A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

void sub_1B8DE4F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

void sub_1B8DE5518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B8DE5954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B8DE5D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B8DE61A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B8DE65AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B8DE6978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B8DE6C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B8DEAD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1873(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1874(uint64_t a1)
{
}

void sub_1B8DED68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CESRSpeechServiceGetXPCInterface()
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F12AF098];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  v29[0] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  unint64_t v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_startSpeechRecognitionWithParameters_didStartHandler_ argumentIndex:0 ofReply:0];

  unint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  id v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_startSpeechRecognitionWithParameters_didStartHandlerWithInfo_ argumentIndex:0 ofReply:0];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v27 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  __int16 v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_startSpeechRecognitionWithParameters_didStartHandlerWithInfo_ argumentIndex:0 ofReply:1];

  CFStringRef v10 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  int v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion_ argumentIndex:0 ofReply:1];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  size_t v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_runEvaluationWithDESRecordDatas_language_recipe_attachments_fidesPersonalizedLMPath_fidesPersonalizedLMTrainingAsset_scrubResult_completion_ argumentIndex:3 ofReply:0];

  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v18 = [v16 setWithArray:v17];
  [v0 setClasses:v18 forSelector:sel_fetchModelPropertiesForAssetConfig_completion_ argumentIndex:0 ofReply:1];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  uint64_t v21 = [v19 setWithArray:v20];
  [v0 setClasses:v21 forSelector:sel_fetchModelPropertiesForAssetConfig_completion_ argumentIndex:0 ofReply:0];

  return v0;
}

id CESRSpeechServiceDelegateGetXPCInterface()
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F12AA730];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  unint64_t v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_speechServiceDidRecognizeTokens_ argumentIndex:0 ofReply:0];

  unint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  id v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_speechServiceDidRecognizeTokens_withMetadata_ argumentIndex:0 ofReply:0];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v55 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  __int16 v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_speechServiceDidRecognizeTokens_withMetadata_ argumentIndex:1 ofReply:0];

  CFStringRef v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  int v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_speechServiceDidRecognizePartialPackage_withMetadata_ argumentIndex:0 ofReply:0];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v53 = objc_opt_class();
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  size_t v15 = [v13 setWithArray:v14];
  [v0 setClasses:v15 forSelector:sel_speechServiceDidRecognizePartialPackage_withMetadata_ argumentIndex:1 ofReply:0];

  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  v52[0] = objc_opt_class();
  v52[1] = objc_opt_class();
  v52[2] = objc_opt_class();
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
  id v18 = [v16 setWithArray:v17];
  [v0 setClasses:v18 forSelector:sel_speechServiceDidFinishRecognitionWithStatistics_error_ argumentIndex:0 ofReply:0];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  uint64_t v21 = [v19 setWithArray:v20];
  [v0 setClasses:v21 forSelector:sel_speechServiceDidProduceEndpointFeaturesWithWordCount_trailingSilenceDuration_eosLikelihood_pauseCounts_silencePosterior_processedAudioDurationInMilliseconds_acousticEndpointerScore_ argumentIndex:3 ofReply:0];

  double v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v50 = objc_opt_class();
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  uint64_t v24 = [v22 setWithArray:v23];
  [v0 setClasses:v24 forSelector:sel_speechServiceDidSelectRecognitionModelWithModelProperties_ argumentIndex:0 ofReply:0];

  long long v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  uint64_t v27 = [v25 setWithArray:v26];
  [v0 setClasses:v27 forSelector:sel_speechServiceDidRecognizePackage_ argumentIndex:0 ofReply:0];

  uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v48 = objc_opt_class();
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  uint64_t v30 = [v28 setWithArray:v29];
  [v0 setClasses:v30 forSelector:sel_speechServiceDidRecognizePackage_withMetadata_ argumentIndex:0 ofReply:0];

  uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v47 = objc_opt_class();
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  uint64_t v33 = [v31 setWithArray:v32];
  [v0 setClasses:v33 forSelector:sel_speechServiceDidRecognizePackage_withMetadata_ argumentIndex:1 ofReply:0];

  uint64_t v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v46 = objc_opt_class();
  uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  id v36 = [v34 setWithArray:v35];
  [v0 setClasses:v36 forSelector:sel_speechServiceDidRecognizeFinalResultCandidatePackage_ argumentIndex:0 ofReply:0];

  id v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  uint64_t v39 = [v37 setWithArray:v38];
  [v0 setClasses:v39 forSelector:sel_speechServiceDidRecognizeVoiceCommandCandidatePackage_withMetadata_ argumentIndex:0 ofReply:0];

  uint64_t v40 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  id v42 = [v40 setWithArray:v41];
  [v0 setClasses:v42 forSelector:sel_speechServiceDidRecognizeVoiceCommandCandidatePackage_withMetadata_ argumentIndex:1 ofReply:0];

  return v0;
}

void sub_1B8DEFD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t __Block_byref_object_copy__2138(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2139(uint64_t a1)
{
}

void ___applyItemTypeFilter_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    unint64_t v4 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      id v5 = v4;
      KVItemTypeFromNumber();
      id v6 = KVItemTypeDescription();
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315650;
      __int16 v9 = "_applyItemTypeFilter_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_INFO, "%s Omitting all vocabulary items with itemType: %@ based on omitted set: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t CESRCorrectionPronunciationReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_36;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_36;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_36;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_36;
        case 5u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 64) |= 1u;
          break;
        case 6u:
          long long v26 = PBReaderReadString();
          if (v26) {
            [(id)a1 addTtsPronunciations:v26];
          }

          continue;
        case 7u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
LABEL_36:
          uint64_t v27 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_40;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_42;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_42:
      *(_DWORD *)(a1 + 40) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1B8DFF8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__3106(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3107(uint64_t a1)
{
}

uint64_t CESRUserCorrectionsProfileEntryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;

        goto LABEL_59;
      case 2u:
        char v20 = objc_alloc_init(CESRCorrectionPronunciation);
        objc_storeStrong((id *)(a1 + 24), v20);
        if PBReaderPlaceMark() && (CESRCorrectionPronunciationReadFrom((uint64_t)v20, a2))
        {
          PBReaderRecallMark();

LABEL_59:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_49:
        uint64_t v37 = 32;
        goto LABEL_58;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 40) |= 4u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_53:
        uint64_t v37 = 36;
        goto LABEL_58;
      case 5u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (2)
        {
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 1;
            v23 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_57;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_57:
        uint64_t v37 = 8;
LABEL_58:
        *(_DWORD *)(a1 + v37) = v23;
        goto LABEL_59;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_59;
    }
  }
}

uint64_t CESRRawSpeechProfileWordTagFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"\\contact-first"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"\\contact-middle"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"\\contact-last"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"\\contact-nickname"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"\\contact-first-phonetic"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"\\contact-last-phonetic"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1B8E054F8(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B8E055A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B8E05638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B8E056C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B8E05744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B8E057E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B8E059B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B8E05BF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id AppOovDirectory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = AFLibraryDirectoryWithSubPath();
  id v3 = [v2 stringByAppendingPathComponent:@"SpeechModels"];
  unint64_t v4 = [v1 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

id CESRSpeechProfileInstanceOptionsDescription(char a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  id v3 = v2;
  if (a1) {
    [v2 addObject:@"Assistant"];
  }
  if ((a1 & 2) != 0) {
    [v3 addObject:@"Dictation"];
  }
  unint64_t v4 = [v3 componentsJoinedByString:@"|"];

  return v4;
}

uint64_t __Block_byref_object_copy__4239(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4240(uint64_t a1)
{
}

void sub_1B8E0AA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E0B0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B8E0B504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B8E0B8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B8E0E1BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t CoreEmbeddedSpeechRecognizerGetQoSClassFromInstanceUUID(uint64_t result)
{
  if (result)
  {
    id v1 = (const unsigned __int8 *)result;
    if (uuid_is_null((const unsigned __int8 *)result))
    {
      return 0;
    }
    else if (uuid_compare(v1, CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive))
    {
      if (uuid_compare(v1, CoreEmbeddedSpeechRecognizerInstanceUUIDBackground)) {
        return 0;
      }
      else {
        return 17;
      }
    }
    else
    {
      return 25;
    }
  }
  return result;
}

void sub_1B8E0EAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B8E0EE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B8E0F1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

const unsigned __int8 *CoreEmbeddedSpeechRecognizerGetIsHighPriorityFromInstanceUUID(const unsigned __int8 *result)
{
  if (result)
  {
    id v1 = result;
    if (uuid_is_null(result)) {
      return 0;
    }
    else {
      return (const unsigned __int8 *)(uuid_compare(v1, CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive) == 0);
    }
  }
  return result;
}

uint64_t sub_1B8E107C8()
{
  return MEMORY[0x1F40E2DB0]();
}

uint64_t sub_1B8E107D8()
{
  return MEMORY[0x1F40E2DC0]();
}

uint64_t sub_1B8E107E8()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_1B8E107F8()
{
  return MEMORY[0x1F40E2E08]();
}

uint64_t sub_1B8E10808()
{
  return MEMORY[0x1F40E3BC0]();
}

uint64_t sub_1B8E10818()
{
  return MEMORY[0x1F40E3BF0]();
}

uint64_t sub_1B8E10828()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1B8E10838()
{
  return MEMORY[0x1F40E3F68]();
}

uint64_t sub_1B8E10848()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1B8E10858()
{
  return MEMORY[0x1F40E4478]();
}

uint64_t sub_1B8E10868()
{
  return MEMORY[0x1F40E4480]();
}

uint64_t sub_1B8E10878()
{
  return MEMORY[0x1F40E4498]();
}

uint64_t sub_1B8E10888()
{
  return MEMORY[0x1F40E44A8]();
}

uint64_t sub_1B8E10898()
{
  return MEMORY[0x1F40E44B8]();
}

uint64_t sub_1B8E108A8()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1B8E108B8()
{
  return MEMORY[0x1F40E44D8]();
}

uint64_t sub_1B8E108C8()
{
  return MEMORY[0x1F40E44E0]();
}

uint64_t sub_1B8E108D8()
{
  return MEMORY[0x1F40E44F0]();
}

uint64_t sub_1B8E108E8()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1B8E108F8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B8E10908()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B8E10918()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1B8E10928()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1B8E10938()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B8E10948()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1B8E10958()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B8E10968()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1B8E10978()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1B8E10988()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B8E10998()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1B8E109A8()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B8E109B8()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B8E109C8()
{
  return MEMORY[0x1F40E4DF0]();
}

uint64_t sub_1B8E109D8()
{
  return MEMORY[0x1F40E4E88]();
}

uint64_t sub_1B8E109E8()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1B8E109F8()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1B8E10A08()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1B8E10A18()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B8E10A28()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1B8E10A38()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1B8E10A48()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1B8E10A58()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1B8E10A68()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1B8E10A78()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1B8E10A88()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B8E10A98()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1B8E10AA8()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1B8E10AB8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1B8E10AC8()
{
  return MEMORY[0x1F40E5C40]();
}

uint64_t sub_1B8E10AD8()
{
  return MEMORY[0x1F40E5C78]();
}

uint64_t sub_1B8E10AE8()
{
  return MEMORY[0x1F40E5C88]();
}

uint64_t sub_1B8E10AF8()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1B8E10B08()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1B8E10B18()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1B8E10B28()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B8E10B38()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B8E10B48()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1B8E10B58()
{
  return MEMORY[0x1F40F7600]();
}

uint64_t sub_1B8E10B98()
{
  return MEMORY[0x1F40F7620]();
}

uint64_t sub_1B8E10BF8()
{
  return MEMORY[0x1F40F7670]();
}

uint64_t sub_1B8E10C18()
{
  return MEMORY[0x1F40F7680]();
}

uint64_t sub_1B8E10C28()
{
  return MEMORY[0x1F40F7688]();
}

uint64_t sub_1B8E10C38()
{
  return MEMORY[0x1F40F7690]();
}

uint64_t sub_1B8E10C48()
{
  return MEMORY[0x1F40F7698]();
}

uint64_t sub_1B8E10C58()
{
  return MEMORY[0x1F40F76A8]();
}

uint64_t sub_1B8E10C68()
{
  return MEMORY[0x1F40F76B0]();
}

uint64_t sub_1B8E10C88()
{
  return MEMORY[0x1F40F76C0]();
}

uint64_t sub_1B8E10C98()
{
  return MEMORY[0x1F40F76C8]();
}

uint64_t sub_1B8E10CA8()
{
  return MEMORY[0x1F40F76D0]();
}

uint64_t sub_1B8E10CB8()
{
  return MEMORY[0x1F40F76D8]();
}

uint64_t sub_1B8E10CC8()
{
  return MEMORY[0x1F40F76E0]();
}

uint64_t sub_1B8E10CD8()
{
  return MEMORY[0x1F40F76E8]();
}

uint64_t sub_1B8E10CE8()
{
  return MEMORY[0x1F40F76F0]();
}

uint64_t sub_1B8E10CF8()
{
  return MEMORY[0x1F40F76F8]();
}

uint64_t sub_1B8E10D18()
{
  return MEMORY[0x1F40F7708]();
}

uint64_t sub_1B8E10D48()
{
  return MEMORY[0x1F40F7720]();
}

uint64_t sub_1B8E10D58()
{
  return MEMORY[0x1F40F7728]();
}

uint64_t sub_1B8E10D68()
{
  return MEMORY[0x1F40F7730]();
}

uint64_t sub_1B8E10D78()
{
  return MEMORY[0x1F40F7738]();
}

uint64_t sub_1B8E10D88()
{
  return MEMORY[0x1F40F7740]();
}

uint64_t sub_1B8E10D98()
{
  return MEMORY[0x1F40F7748]();
}

uint64_t sub_1B8E10DA8()
{
  return MEMORY[0x1F40F7750]();
}

uint64_t sub_1B8E10DB8()
{
  return MEMORY[0x1F40F7758]();
}

uint64_t sub_1B8E10DC8()
{
  return MEMORY[0x1F40F7760]();
}

uint64_t sub_1B8E10DD8()
{
  return MEMORY[0x1F40F7768]();
}

uint64_t sub_1B8E10DE8()
{
  return MEMORY[0x1F40F7770]();
}

uint64_t sub_1B8E10DF8()
{
  return MEMORY[0x1F40F7778]();
}

uint64_t sub_1B8E10E08()
{
  return MEMORY[0x1F40F7780]();
}

uint64_t sub_1B8E10E18()
{
  return MEMORY[0x1F40F7788]();
}

uint64_t sub_1B8E10E38()
{
  return MEMORY[0x1F40F7798]();
}

uint64_t sub_1B8E10E48()
{
  return MEMORY[0x1F40F77A0]();
}

uint64_t sub_1B8E10E78()
{
  return MEMORY[0x1F40F77B8]();
}

uint64_t sub_1B8E10EB8()
{
  return MEMORY[0x1F40F77D8]();
}

uint64_t sub_1B8E10EC8()
{
  return MEMORY[0x1F40F77E0]();
}

uint64_t sub_1B8E10EE8()
{
  return MEMORY[0x1F40F77F8]();
}

uint64_t sub_1B8E10EF8()
{
  return MEMORY[0x1F40F7800]();
}

uint64_t sub_1B8E10F08()
{
  return MEMORY[0x1F40F7810]();
}

uint64_t sub_1B8E10F18()
{
  return MEMORY[0x1F40F7818]();
}

uint64_t sub_1B8E10F28()
{
  return MEMORY[0x1F40F7820]();
}

uint64_t sub_1B8E10F38()
{
  return MEMORY[0x1F40F7828]();
}

uint64_t sub_1B8E10F48()
{
  return MEMORY[0x1F40F7830]();
}

uint64_t sub_1B8E10F58()
{
  return MEMORY[0x1F40F7838]();
}

uint64_t sub_1B8E10F68()
{
  return MEMORY[0x1F40F7840]();
}

uint64_t sub_1B8E10F78()
{
  return MEMORY[0x1F40F7848]();
}

uint64_t sub_1B8E10F88()
{
  return MEMORY[0x1F40F7850]();
}

uint64_t sub_1B8E10F98()
{
  return MEMORY[0x1F40F7858]();
}

uint64_t sub_1B8E10FA8()
{
  return MEMORY[0x1F40F7860]();
}

uint64_t sub_1B8E10FB8()
{
  return MEMORY[0x1F40F7868]();
}

uint64_t sub_1B8E10FC8()
{
  return MEMORY[0x1F40F7870]();
}

uint64_t sub_1B8E10FD8()
{
  return MEMORY[0x1F40F7878]();
}

uint64_t sub_1B8E10FE8()
{
  return MEMORY[0x1F40F7880]();
}

uint64_t sub_1B8E10FF8()
{
  return MEMORY[0x1F40F7888]();
}

uint64_t sub_1B8E11008()
{
  return MEMORY[0x1F40F7890]();
}

uint64_t sub_1B8E11018()
{
  return MEMORY[0x1F40F7898]();
}

uint64_t sub_1B8E11028()
{
  return MEMORY[0x1F40F78A0]();
}

uint64_t sub_1B8E11038()
{
  return MEMORY[0x1F40F78A8]();
}

uint64_t sub_1B8E11048()
{
  return MEMORY[0x1F40F78B0]();
}

uint64_t sub_1B8E11058()
{
  return MEMORY[0x1F40F78C0]();
}

uint64_t sub_1B8E11068()
{
  return MEMORY[0x1F40F78C8]();
}

uint64_t sub_1B8E11078()
{
  return MEMORY[0x1F40F78D0]();
}

uint64_t sub_1B8E11088()
{
  return MEMORY[0x1F40F78D8]();
}

uint64_t sub_1B8E11098()
{
  return MEMORY[0x1F40F78E0]();
}

uint64_t sub_1B8E110A8()
{
  return MEMORY[0x1F40F78E8]();
}

uint64_t sub_1B8E110B8()
{
  return MEMORY[0x1F40F78F0]();
}

uint64_t sub_1B8E110C8()
{
  return MEMORY[0x1F40F78F8]();
}

uint64_t sub_1B8E110D8()
{
  return MEMORY[0x1F40F7900]();
}

uint64_t sub_1B8E110E8()
{
  return MEMORY[0x1F40F7908]();
}

uint64_t sub_1B8E110F8()
{
  return MEMORY[0x1F40F7910]();
}

uint64_t sub_1B8E11108()
{
  return MEMORY[0x1F40F7918]();
}

uint64_t sub_1B8E11118()
{
  return MEMORY[0x1F40F7920]();
}

uint64_t sub_1B8E11128()
{
  return MEMORY[0x1F40F7928]();
}

uint64_t sub_1B8E11138()
{
  return MEMORY[0x1F40F7930]();
}

uint64_t sub_1B8E11148()
{
  return MEMORY[0x1F40F7938]();
}

uint64_t sub_1B8E11158()
{
  return MEMORY[0x1F40F7940]();
}

uint64_t sub_1B8E11168()
{
  return MEMORY[0x1F40F7958]();
}

uint64_t sub_1B8E11178()
{
  return MEMORY[0x1F40F7968]();
}

uint64_t sub_1B8E11188()
{
  return MEMORY[0x1F40F7978]();
}

uint64_t sub_1B8E111A8()
{
  return MEMORY[0x1F40F7990]();
}

uint64_t sub_1B8E111B8()
{
  return MEMORY[0x1F40F7998]();
}

uint64_t sub_1B8E111C8()
{
  return MEMORY[0x1F40F79A0]();
}

uint64_t sub_1B8E111D8()
{
  return MEMORY[0x1F40F79A8]();
}

uint64_t sub_1B8E111E8()
{
  return MEMORY[0x1F40F79B0]();
}

uint64_t sub_1B8E111F8()
{
  return MEMORY[0x1F40F79B8]();
}

uint64_t sub_1B8E11208()
{
  return MEMORY[0x1F40F79C0]();
}

uint64_t sub_1B8E11218()
{
  return MEMORY[0x1F40F79C8]();
}

uint64_t sub_1B8E11228()
{
  return MEMORY[0x1F40F79D0]();
}

uint64_t sub_1B8E11238()
{
  return MEMORY[0x1F40F79D8]();
}

uint64_t sub_1B8E11248()
{
  return MEMORY[0x1F40F79E0]();
}

uint64_t sub_1B8E11258()
{
  return MEMORY[0x1F40F79E8]();
}

uint64_t sub_1B8E11268()
{
  return MEMORY[0x1F40F79F0]();
}

uint64_t sub_1B8E11278()
{
  return MEMORY[0x1F40F79F8]();
}

uint64_t sub_1B8E11288()
{
  return MEMORY[0x1F40F7A00]();
}

uint64_t sub_1B8E11298()
{
  return MEMORY[0x1F40F7A08]();
}

uint64_t sub_1B8E112A8()
{
  return MEMORY[0x1F40F7A10]();
}

uint64_t sub_1B8E112B8()
{
  return MEMORY[0x1F40F7A18]();
}

uint64_t sub_1B8E112D8()
{
  return MEMORY[0x1F40F7A30]();
}

uint64_t sub_1B8E112E8()
{
  return MEMORY[0x1F40F7A38]();
}

uint64_t sub_1B8E112F8()
{
  return MEMORY[0x1F40F7A40]();
}

uint64_t sub_1B8E11308()
{
  return MEMORY[0x1F40F7A48]();
}

uint64_t sub_1B8E11318()
{
  return MEMORY[0x1F40F7A50]();
}

uint64_t sub_1B8E11328()
{
  return MEMORY[0x1F40F7A58]();
}

uint64_t sub_1B8E11338()
{
  return MEMORY[0x1F40F7A60]();
}

uint64_t sub_1B8E11348()
{
  return MEMORY[0x1F40F7A68]();
}

uint64_t sub_1B8E11358()
{
  return MEMORY[0x1F40F7A70]();
}

uint64_t sub_1B8E11368()
{
  return MEMORY[0x1F40F7A78]();
}

uint64_t sub_1B8E11378()
{
  return MEMORY[0x1F40F7A80]();
}

uint64_t sub_1B8E11388()
{
  return MEMORY[0x1F40F7A88]();
}

uint64_t sub_1B8E11398()
{
  return MEMORY[0x1F40F7A90]();
}

uint64_t sub_1B8E113A8()
{
  return MEMORY[0x1F40F7A98]();
}

uint64_t sub_1B8E113B8()
{
  return MEMORY[0x1F40F7AA8]();
}

uint64_t sub_1B8E113C8()
{
  return MEMORY[0x1F40F7AB0]();
}

uint64_t sub_1B8E113D8()
{
  return MEMORY[0x1F40F7AB8]();
}

uint64_t sub_1B8E113E8()
{
  return MEMORY[0x1F40F7AC0]();
}

uint64_t sub_1B8E113F8()
{
  return MEMORY[0x1F40F7AC8]();
}

uint64_t sub_1B8E11408()
{
  return MEMORY[0x1F40F7AD0]();
}

uint64_t sub_1B8E11418()
{
  return MEMORY[0x1F40F7AD8]();
}

uint64_t sub_1B8E11428()
{
  return MEMORY[0x1F40F7AE0]();
}

uint64_t sub_1B8E11438()
{
  return MEMORY[0x1F40F7AE8]();
}

uint64_t sub_1B8E11448()
{
  return MEMORY[0x1F40F7AF0]();
}

uint64_t sub_1B8E11458()
{
  return MEMORY[0x1F40F7AF8]();
}

uint64_t sub_1B8E11468()
{
  return MEMORY[0x1F40F7B00]();
}

uint64_t sub_1B8E11478()
{
  return MEMORY[0x1F40F7B08]();
}

uint64_t sub_1B8E11488()
{
  return MEMORY[0x1F40F7B10]();
}

uint64_t sub_1B8E11498()
{
  return MEMORY[0x1F40F7B18]();
}

uint64_t sub_1B8E114A8()
{
  return MEMORY[0x1F40F7B20]();
}

uint64_t sub_1B8E114B8()
{
  return MEMORY[0x1F40F7B28]();
}

uint64_t sub_1B8E114C8()
{
  return MEMORY[0x1F40F7B30]();
}

uint64_t sub_1B8E114D8()
{
  return MEMORY[0x1F40F7B38]();
}

uint64_t sub_1B8E114E8()
{
  return MEMORY[0x1F40F7B40]();
}

uint64_t sub_1B8E114F8()
{
  return MEMORY[0x1F40F7B48]();
}

uint64_t sub_1B8E11508()
{
  return MEMORY[0x1F40F7B50]();
}

uint64_t sub_1B8E11518()
{
  return MEMORY[0x1F40F7B58]();
}

uint64_t sub_1B8E11578()
{
  return MEMORY[0x1F40F7B88]();
}

uint64_t sub_1B8E11598()
{
  return MEMORY[0x1F40F7B98]();
}

uint64_t sub_1B8E115A8()
{
  return MEMORY[0x1F40F7BA0]();
}

uint64_t sub_1B8E115B8()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1B8E115C8()
{
  return MEMORY[0x1F4183278]();
}

uint64_t sub_1B8E115D8()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1B8E115E8()
{
  return MEMORY[0x1F41876D8]();
}

uint64_t sub_1B8E115F8()
{
  return MEMORY[0x1F4187BE8]();
}

uint64_t sub_1B8E11608()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B8E11618()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B8E11628()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1B8E11638()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1B8E11648()
{
  return MEMORY[0x1F4183378]();
}

uint64_t sub_1B8E11658()
{
  return MEMORY[0x1F4183380]();
}

uint64_t sub_1B8E11668()
{
  return MEMORY[0x1F4183388]();
}

uint64_t sub_1B8E11678()
{
  return MEMORY[0x1F41833A0]();
}

uint64_t sub_1B8E11688()
{
  return MEMORY[0x1F41833D0]();
}

uint64_t sub_1B8E11698()
{
  return MEMORY[0x1F4183498]();
}

uint64_t sub_1B8E116A8()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1B8E116B8()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1B8E116C8()
{
  return MEMORY[0x1F41835D8]();
}

uint64_t sub_1B8E116D8()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1B8E116E8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B8E116F8()
{
  return MEMORY[0x1F4183850]();
}

uint64_t sub_1B8E11708()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B8E11718()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B8E11728()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B8E11738()
{
  return MEMORY[0x1F4183888]();
}

uint64_t sub_1B8E11748()
{
  return MEMORY[0x1F4183890]();
}

uint64_t sub_1B8E11758()
{
  return MEMORY[0x1F41838A8]();
}

uint64_t sub_1B8E11768()
{
  return MEMORY[0x1F4183900]();
}

uint64_t sub_1B8E11778()
{
  return MEMORY[0x1F4183968]();
}

uint64_t sub_1B8E11788()
{
  return MEMORY[0x1F4183978]();
}

uint64_t sub_1B8E11798()
{
  return MEMORY[0x1F4183990]();
}

uint64_t sub_1B8E117A8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B8E117B8()
{
  return MEMORY[0x1F4183A20]();
}

uint64_t sub_1B8E117C8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B8E117D8()
{
  return MEMORY[0x1F4183A70]();
}

uint64_t sub_1B8E117E8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B8E117F8()
{
  return MEMORY[0x1F4183AD0]();
}

uint64_t sub_1B8E11808()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1B8E11818()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1B8E11828()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1B8E11838()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1B8E11848()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1B8E11858()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1B8E11868()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1B8E11878()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1B8E11888()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1B8E11898()
{
  return MEMORY[0x1F4183D00]();
}

uint64_t sub_1B8E118A8()
{
  return MEMORY[0x1F4183E70]();
}

uint64_t sub_1B8E118B8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B8E118C8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B8E118D8()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1B8E118E8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1B8E118F8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B8E11908()
{
  return MEMORY[0x1F4183F20]();
}

uint64_t sub_1B8E11918()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1B8E11928()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1B8E11938()
{
  return MEMORY[0x1F4187700]();
}

uint64_t sub_1B8E11948()
{
  return MEMORY[0x1F4187708]();
}

uint64_t sub_1B8E11958()
{
  return MEMORY[0x1F4187710]();
}

uint64_t sub_1B8E11968()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1B8E11978()
{
  return MEMORY[0x1F4187720]();
}

uint64_t sub_1B8E11988()
{
  return MEMORY[0x1F4187728]();
}

uint64_t sub_1B8E11998()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1B8E119A8()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1B8E119B8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B8E119C8()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1B8E11A08()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t sub_1B8E11A18()
{
  return MEMORY[0x1F4187CF0]();
}

uint64_t sub_1B8E11A28()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B8E11A38()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B8E11A48()
{
  return MEMORY[0x1F4187D08]();
}

uint64_t sub_1B8E11A58()
{
  return MEMORY[0x1F4187D20]();
}

uint64_t sub_1B8E11A68()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1B8E11A78()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1B8E11A88()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1B8E11AB8()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1B8E11AD8()
{
  return MEMORY[0x1F4187DD0]();
}

uint64_t sub_1B8E11AE8()
{
  return MEMORY[0x1F4187E00]();
}

uint64_t sub_1B8E11AF8()
{
  return MEMORY[0x1F4187E08]();
}

uint64_t sub_1B8E11B18()
{
  return MEMORY[0x1F4187E40]();
}

uint64_t sub_1B8E11B28()
{
  return MEMORY[0x1F4187E58]();
}

uint64_t sub_1B8E11B38()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1B8E11B48()
{
  return MEMORY[0x1F4187E70]();
}

uint64_t sub_1B8E11B58()
{
  return MEMORY[0x1F4184088]();
}

uint64_t sub_1B8E11B68()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1B8E11B78()
{
  return MEMORY[0x1F4184110]();
}

uint64_t sub_1B8E11B88()
{
  return MEMORY[0x1F4184118]();
}

uint64_t sub_1B8E11B98()
{
  return MEMORY[0x1F4184130]();
}

uint64_t sub_1B8E11BA8()
{
  return MEMORY[0x1F4184198]();
}

uint64_t sub_1B8E11BB8()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1B8E11BC8()
{
  return MEMORY[0x1F41841C0]();
}

uint64_t sub_1B8E11BD8()
{
  return MEMORY[0x1F41841C8]();
}

uint64_t sub_1B8E11BE8()
{
  return MEMORY[0x1F41841F0]();
}

uint64_t sub_1B8E11BF8()
{
  return MEMORY[0x1F4184218]();
}

uint64_t sub_1B8E11C08()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1B8E11C18()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1B8E11C28()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1B8E11C38()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1B8E11C48()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1B8E11C58()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1B8E11C68()
{
  return MEMORY[0x1F4184428]();
}

uint64_t sub_1B8E11C78()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1B8E11C88()
{
  return MEMORY[0x1F40E64D8]();
}

uint64_t sub_1B8E11C98()
{
  return MEMORY[0x1F4186A28]();
}

uint64_t sub_1B8E11CA8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1B8E11CB8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1B8E11CC8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B8E11CD8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B8E11CE8()
{
  return MEMORY[0x1F4186AF0]();
}

uint64_t sub_1B8E11CF8()
{
  return MEMORY[0x1F4186B40]();
}

uint64_t sub_1B8E11D08()
{
  return MEMORY[0x1F4186B50]();
}

uint64_t sub_1B8E11D18()
{
  return MEMORY[0x1F4186B58]();
}

uint64_t sub_1B8E11D28()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1B8E11D38()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B8E11D48()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1B8E11D58()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1B8E11D68()
{
  return MEMORY[0x1F40E6988]();
}

uint64_t sub_1B8E11D78()
{
  return MEMORY[0x1F41845D8]();
}

uint64_t sub_1B8E11D88()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t sub_1B8E11D98()
{
  return MEMORY[0x1F4184618]();
}

uint64_t sub_1B8E11DA8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B8E11DB8()
{
  return MEMORY[0x1F4184688]();
}

uint64_t sub_1B8E11DC8()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1B8E11DD8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B8E11DE8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B8E11DF8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1B8E11E08()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1B8E11E18()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1B8E11E28()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B8E11E38()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1B8E11E48()
{
  return MEMORY[0x1F4184BE8]();
}

uint64_t sub_1B8E11E58()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B8E11E68()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B8E11E78()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1B8E11E88()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1B8E11E98()
{
  return MEMORY[0x1F4184E40]();
}

uint64_t sub_1B8E11EA8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B8E11EB8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1B8E11EC8()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1B8E11ED8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1B8E11EE8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1B8E11EF8()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1B8E11F08()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1B8E11F18()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1B8E11F28()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1B8E11F38()
{
  return MEMORY[0x1F4185060]();
}

uint64_t sub_1B8E11F48()
{
  return MEMORY[0x1F41850E0]();
}

uint64_t sub_1B8E11F58()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B8E11F68()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B8E11F78()
{
  return MEMORY[0x1F41852A8]();
}

uint64_t sub_1B8E11F88()
{
  return MEMORY[0x1F41852B8]();
}

uint64_t sub_1B8E11F98()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1B8E11FA8()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1B8E11FB8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B8E11FC8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B8E11FD8()
{
  return MEMORY[0x1F4185440]();
}

uint64_t sub_1B8E11FE8()
{
  return MEMORY[0x1F4185448]();
}

uint64_t sub_1B8E11FF8()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1B8E12008()
{
  return MEMORY[0x1F4185458]();
}

uint64_t sub_1B8E12018()
{
  return MEMORY[0x1F4185460]();
}

uint64_t sub_1B8E12028()
{
  return MEMORY[0x1F4185468]();
}

uint64_t sub_1B8E12038()
{
  return MEMORY[0x1F4185470]();
}

uint64_t sub_1B8E12048()
{
  return MEMORY[0x1F4185478]();
}

uint64_t sub_1B8E12058()
{
  return MEMORY[0x1F41854B8]();
}

uint64_t sub_1B8E12068()
{
  return MEMORY[0x1F41854C0]();
}

uint64_t sub_1B8E12088()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B8E12098()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1B8E120A8()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1B8E120B8()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1B8E120C8()
{
  return MEMORY[0x1F41859F8]();
}

uint64_t sub_1B8E120D8()
{
  return MEMORY[0x1F4185A00]();
}

uint64_t sub_1B8E120E8()
{
  return MEMORY[0x1F4185A08]();
}

uint64_t sub_1B8E120F8()
{
  return MEMORY[0x1F4185A28]();
}

uint64_t sub_1B8E12118()
{
  return MEMORY[0x1F4185BB0]();
}

uint64_t sub_1B8E12128()
{
  return MEMORY[0x1F4185CF0]();
}

uint64_t sub_1B8E12148()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1B8E12168()
{
  return MEMORY[0x1F40E6E10]();
}

uint64_t sub_1B8E12178()
{
  return MEMORY[0x1F40E6E20]();
}

uint64_t sub_1B8E12188()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B8E12198()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B8E121A8()
{
  return MEMORY[0x1F4185EC0]();
}

uint64_t sub_1B8E121B8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B8E121C8()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1B8E121D8()
{
  return MEMORY[0x1F41861B0]();
}

uint64_t sub_1B8E121E8()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AFAnalyticsEventCreateCurrent()
{
  return MEMORY[0x1F410AC00]();
}

uint64_t AFDeviceHighestLanguageModelCapabilityIdentifier()
{
  return MEMORY[0x1F410AC50]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x1F410ACD8]();
}

uint64_t AFIsATV()
{
  return MEMORY[0x1F410AD30]();
}

uint64_t AFIsATVOnly()
{
  return MEMORY[0x1F410AD38]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1F410AD50]();
}

uint64_t AFIsUODCapableHorsemanDevice()
{
  return MEMORY[0x1F410AD78]();
}

uint64_t AFLibraryDirectoryWithSubPath()
{
  return MEMORY[0x1F410AD90]();
}

uint64_t AFLogInitIfNeeded()
{
  return MEMORY[0x1F410AD98]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x1F410ADC8]();
}

uint64_t AFOfflineDictationStatusStringIsInstalled()
{
  return MEMORY[0x1F410ADD8]();
}

uint64_t AFSupportsASROnDevice()
{
  return MEMORY[0x1F410AF18]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x1F410DCD8]();
}

uint64_t KVFieldTypeFromNumber()
{
  return MEMORY[0x1F412A058]();
}

uint64_t KVFieldTypeIsValid()
{
  return MEMORY[0x1F412A060]();
}

uint64_t KVFieldTypeIsValidForItemType()
{
  return MEMORY[0x1F412A068]();
}

uint64_t KVFieldTypeToNumber()
{
  return MEMORY[0x1F412A070]();
}

uint64_t KVItemTypeDescription()
{
  return MEMORY[0x1F412A088]();
}

uint64_t KVItemTypeFromNumber()
{
  return MEMORY[0x1F412A098]();
}

uint64_t KVItemTypeToNumber()
{
  return MEMORY[0x1F412A0B0]();
}

NSString *NSOpenStepRootDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E71C0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t SFAllDataSites()
{
  return MEMORY[0x1F40F7BA8]();
}

uint64_t SFDataSiteURL()
{
  return MEMORY[0x1F40F7BB0]();
}

uint64_t SFEntitledAssetTypeToString()
{
  return MEMORY[0x1F40F7BB8]();
}

uint64_t SFGetOrCreateDirectoryURL()
{
  return MEMORY[0x1F40F7BC0]();
}

uint64_t SFMappedLocaleForSpeechProfile()
{
  return MEMORY[0x1F40F7BC8]();
}

uint64_t SFPersonaIdFromSiteURL()
{
  return MEMORY[0x1F40F7BD0]();
}

uint64_t SFProtectionClassForDataSiteURL()
{
  return MEMORY[0x1F40F7BD8]();
}

uint64_t SFReadPropertyList()
{
  return MEMORY[0x1F40F7BE0]();
}

uint64_t SFRemoveItemIfExistsAtURL()
{
  return MEMORY[0x1F40F7BE8]();
}

uint64_t SFSpeechProfileRootDirectoryURL()
{
  return MEMORY[0x1F40F7BF0]();
}

uint64_t SFSpeechProfileSiteDescription()
{
  return MEMORY[0x1F40F7BF8]();
}

uint64_t SFSpeechProfileSiteDirectories()
{
  return MEMORY[0x1F40F7C00]();
}

uint64_t SFUserDescription()
{
  return MEMORY[0x1F40F7C08]();
}

uint64_t SFUserIdHash()
{
  return MEMORY[0x1F40F7C10]();
}

uint64_t SFUserIdHashFromDataSiteURL()
{
  return MEMORY[0x1F40F7C18]();
}

uint64_t SFUserIdHashToString()
{
  return MEMORY[0x1F40F7C20]();
}

uint64_t SFWritePropertyList()
{
  return MEMORY[0x1F40F7C28]();
}

uint64_t _AFPreferencesBoolValueForKeyWithContext()
{
  return MEMORY[0x1F410AFA0]();
}

uint64_t _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode()
{
  return MEMORY[0x1F410AFE0]();
}

uint64_t _AFPreferencesValueForKeyWithContext()
{
  return MEMORY[0x1F410B000]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1F40C9D48]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x1F4186390]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_block_notify(dispatch_block_t block, dispatch_queue_t queue, dispatch_block_t notification_block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

long double fabs(long double __x)
{
  MEMORY[0x1F40CC010](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4E0](a1, a2, a3, a4, a5);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1F41863F8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1F41881C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1F4188210]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1F4186578]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1F4186698]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1F41867C0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}