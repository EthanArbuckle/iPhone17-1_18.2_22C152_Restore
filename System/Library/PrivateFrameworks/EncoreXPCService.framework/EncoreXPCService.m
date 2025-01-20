uint64_t static AnySynchronizableState.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  void (*v5)(unsigned char *, void);
  unsigned char v7[32];
  uint64_t v8;

  v4 = *a2;
  v8 = a1;
  swift_unknownObjectRetain();
  v5 = (void (*)(unsigned char *, void))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*MEMORY[0x263F8E100] + v4 + 8) - 8) + 16))(a3);
  v5(v7, 0);
  return swift_unknownObjectRelease();
}

uint64_t static AnySynchronizableState.subscript.setter(char *a1, uint64_t a2, void *a3, void *a4)
{
  v88 = a1;
  uint64_t v6 = *a3;
  v86 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = *MEMORY[0x263F8E100] + 8;
  uint64_t v9 = *(void *)(*a4 + v8);
  uint64_t v10 = *(void *)(v9 + 32);
  uint64_t v11 = *(void *)(v6 + *MEMORY[0x263F8E100]);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v82 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v71[1] = (uint64_t)v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v74 = (char *)v71 - v15;
  MEMORY[0x270FA5388](v14);
  v81 = (char *)v71 - v16;
  uint64_t v79 = v10;
  uint64_t v84 = *(void *)(v10 + 8);
  uint64_t v83 = swift_getAssociatedTypeWitness();
  uint64_t v73 = *(void *)(v83 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v83);
  v72 = (char *)v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = *(void *)(v7 + v8);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  v24 = (char *)v71 - v23;
  uint64_t v25 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v22);
  v27 = (char *)v71 - v26;
  v89[0] = a2;
  swift_unknownObjectRetain();
  swift_retain();
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  v87 = a4;
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v27, v20);
  v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v75 = v27;
  uint64_t v78 = v25 + 8;
  v77 = v28;
  v28(v27, v9);
  uint64_t v29 = v9;
  uint64_t v30 = v20;
  LOBYTE(v20) = sub_24D1B2140();
  uint64_t v76 = v21;
  v85 = *(void (**)(char *, uint64_t))(v21 + 8);
  v85(v24, v30);
  if (v20)
  {
    if (qword_26B18A190 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_24D1B20B0();
    __swift_project_value_buffer(v31, (uint64_t)qword_26B18A2B8);
    v32 = sub_24D1B20A0();
    os_log_type_t v33 = sub_24D1B22F0();
    BOOL v34 = os_log_type_enabled(v32, v33);
    v35 = v88;
    if (v34)
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_24D1A1000, v32, v33, "#AnySynchronizableState: Instance value is already set to newValue. Skipping.", v36, 2u);
      MEMORY[0x253321860](v36, -1, -1);
    }

    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    return ((uint64_t (*)(char *, uint64_t))v85)(v35, v30);
  }
  else
  {
    v71[0] = v11;
    sub_24D1B20D0();
    sub_24D1B20F0();
    uint64_t v38 = v83;
    uint64_t v39 = a2;
    if (swift_dynamicCast())
    {
      uint64_t v83 = v21 + 8;
      uint64_t v84 = v30;
      uint64_t v40 = v89[0];
      if (qword_26B18A190 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_24D1B20B0();
      __swift_project_value_buffer(v41, (uint64_t)qword_26B18A2B8);
      v42 = sub_24D1B20A0();
      os_log_type_t v43 = sub_24D1B22F0();
      BOOL v44 = os_log_type_enabled(v42, v43);
      v45 = v88;
      if (v44)
      {
        uint64_t v46 = v39;
        v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_24D1A1000, v42, v43, "#AnySynchronizableState: Publishing change to instance", v47, 2u);
        v48 = v47;
        uint64_t v39 = v46;
        v45 = v88;
        MEMORY[0x253321860](v48, -1, -1);
      }

      uint64_t v73 = v40;
      sub_24D1B20E0();
      uint64_t v90 = v39;
      swift_unknownObjectRetain();
      v49 = (void (*)(uint64_t *, void))swift_modifyAtReferenceWritableKeyPath();
      (*(void (**)(uint64_t, char *, uint64_t))(v76 + 24))(v50, v45, v84);
      v49(v89, 0);
      swift_unknownObjectRelease();
      v51 = sub_24D1B20A0();
      os_log_type_t v52 = sub_24D1B22F0();
      BOOL v53 = os_log_type_enabled(v51, v52);
      uint64_t v54 = AssociatedTypeWitness;
      if (v53)
      {
        uint64_t v55 = v39;
        v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v56 = 0;
        _os_log_impl(&dword_24D1A1000, v51, v52, "#AnySynchronizableState: Property value updated to newValue. Attempting to publish to SnippetService.", v56, 2u);
        v57 = v56;
        uint64_t v39 = v55;
        MEMORY[0x253321860](v57, -1, -1);
      }

      v89[0] = v39;
      swift_unknownObjectRetain();
      swift_retain();
      v58 = v75;
      swift_getAtKeyPath();
      swift_unknownObjectRelease();
      swift_release();
      v59 = *(void (**)(uint64_t))&v58[*(int *)(v29 + 52)];
      swift_retain();
      v77(v58, v29);
      uint64_t v60 = (uint64_t)v81;
      v61 = v88;
      v59((uint64_t)v88);
      swift_release();
      SynchronizableObject.publish(change:)(v60, v71[0], v79);
      swift_unknownObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      v85(v61, v84);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v82 + 8))(v60, v54);
    }
    else
    {
      if (qword_26B18A190 != -1) {
        swift_once();
      }
      uint64_t v62 = sub_24D1B20B0();
      __swift_project_value_buffer(v62, (uint64_t)qword_26B18A2B8);
      swift_unknownObjectRetain_n();
      v63 = sub_24D1B20A0();
      os_log_type_t v64 = sub_24D1B2300();
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v65 = v38;
        v66 = (uint8_t *)swift_slowAlloc();
        uint64_t v82 = swift_slowAlloc();
        v89[0] = v82;
        *(_DWORD *)v66 = 136315138;
        v81 = (char *)(v66 + 4);
        v67 = v72;
        sub_24D1B20D0();
        swift_getDynamicType();
        (*(void (**)(char *, uint64_t))(v73 + 8))(v67, v65);
        uint64_t v68 = sub_24D1B2590();
        uint64_t v90 = sub_24D1A4290(v68, v69, v89);
        sub_24D1B2380();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24D1A1000, v63, v64, "#AnySynchronizableState: Failed to cast publisher; unexpected type %s. Not updating instance value.",
          v66,
          0xCu);
        uint64_t v70 = v82;
        swift_arrayDestroy();
        MEMORY[0x253321860](v70, -1, -1);
        MEMORY[0x253321860](v66, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease_n();
      }
      swift_release();
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v85)(v88, v30);
    }
  }
}

void (*static AnySynchronizableState.subscript.modify(void *a1, uint64_t a2, uint64_t *a3, uint64_t a4))(uint64_t **a1, char a2)
{
  uint64_t v8 = malloc(0x38uLL);
  *a1 = v8;
  v8[1] = a3;
  v8[2] = a4;
  *uint64_t v8 = a2;
  uint64_t v9 = *(void *)(*MEMORY[0x263F8E100] + *a3 + 8);
  v8[3] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v8[4] = v10;
  size_t v11 = *(void *)(v10 + 64);
  v8[5] = malloc(v11);
  uint64_t v12 = malloc(v11);
  v8[6] = v12;
  static AnySynchronizableState.subscript.getter(a2, a3, (uint64_t)v12);
  return sub_24D1A3D08;
}

void sub_24D1A3D08(uint64_t **a1, char a2)
{
  v2 = *a1;
  v3 = (char *)(*a1)[5];
  v4 = (char *)(*a1)[6];
  if (a2)
  {
    uint64_t v5 = v2[3];
    uint64_t v6 = v2[4];
    uint64_t v8 = (void *)v2[1];
    uint64_t v7 = (void *)v2[2];
    uint64_t v9 = *v2;
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))((*a1)[5], v4, v5);
    swift_retain();
    swift_retain();
    swift_unknownObjectRetain();
    static AnySynchronizableState.subscript.setter(v3, v9, v8, v7);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    size_t v11 = (void *)v2[1];
    uint64_t v10 = (void *)v2[2];
    uint64_t v12 = *v2;
    swift_retain();
    swift_retain();
    swift_unknownObjectRetain();
    static AnySynchronizableState.subscript.setter(v4, v12, v11, v10);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t AnySynchronizableState.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t sub_24D1A3E48@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  long long v4 = *(_OWORD *)(a2 + a1 - 16);
  v7[0] = *(_OWORD *)(a2 + a1 - 32);
  v7[1] = v4;
  uint64_t v5 = type metadata accessor for AnySynchronizableState(0, (uint64_t)v7);
  return AnySynchronizableState.wrappedValue.getter(v5, a3);
}

uint64_t sub_24D1A3E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + a3 - 32);
  uint64_t v5 = *(void *)(a4 + a3 - 8);
  long long v11 = *(_OWORD *)(a4 + a3 - 24);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v11 - v6;
  (*(void (**)(char *))(v8 + 16))((char *)&v11 - v6);
  uint64_t v12 = v4;
  long long v13 = v11;
  uint64_t v14 = v5;
  uint64_t v9 = type metadata accessor for AnySynchronizableState(0, (uint64_t)&v12);
  return AnySynchronizableState.wrappedValue.setter((uint64_t)v7, v9);
}

uint64_t AnySynchronizableState.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 40))(v2, a1);
}

void (*AnySynchronizableState.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *uint64_t v5 = v2;
  v5[1] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v5[2] = v7;
  v5[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v5[4] = malloc(v9);
  v5[5] = malloc(v9);
  (*(void (**)(void))(v8 + 16))();
  return sub_24D1A40A0;
}

void sub_24D1A40A0(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  v3 = *(void **)(*(void *)a1 + 32);
  uint64_t v4 = *(void **)(*(void *)a1 + 40);
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v8 = *v2;
    uint64_t v7 = v2[1];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 32), v4, v7);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v8, v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v7);
  }
  else
  {
    (*(void (**)(void, void *))(v2[2] + 40))(*v2, v4);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t AnySynchronizableState.init(wrappedValue:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a8, a1, a5);
  v17[0] = a4;
  v17[1] = a5;
  v17[2] = a6;
  v17[3] = a7;
  uint64_t result = type metadata accessor for AnySynchronizableState(0, (uint64_t)v17);
  uint64_t v16 = (void *)(a8 + *(int *)(result + 52));
  *uint64_t v16 = a2;
  v16[1] = a3;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24D1A4290(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24D1A4B14(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24D1A4D20((uint64_t)v12, *a3);
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
      sub_24D1A4D20((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for AnySynchronizableState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for AnySynchronizableState);
}

uint64_t sub_24D1A437C()
{
  return 32;
}

__n128 sub_24D1A4388(uint64_t a1, _OWORD *a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_24D1A4394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_24D1A439C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24D1A4438(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = v10[1];
    uint64_t v12 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_24D1A4530(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 24) - 8) + 8))();
  return swift_release();
}

uint64_t sub_24D1A45A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_24D1A4620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24D1A46AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24D1A4728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8) + 40;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_24D1A47AC(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24D1A48F8);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_24D1A490C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x24D1A4AECLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v19 = a2 ^ 0x80000000;
            v18[1] = 0;
          }
          else
          {
            uint64_t v19 = a2 - 1;
          }
          *uint64_t v18 = v19;
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_24D1A4B14(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24D1B2390();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24D1A4D7C(a5, a6);
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
  uint64_t v8 = sub_24D1B2440();
  if (!v8)
  {
    sub_24D1B2450();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24D1B2490();
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

uint64_t sub_24D1A4D20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24D1A4D7C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24D1A4E14(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24D1A4FF4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24D1A4FF4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24D1A4E14(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24D1A4F8C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24D1B2410();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24D1B2450();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24D1B21D0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24D1B2490();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24D1B2450();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24D1A4F8C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985AC78);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24D1A4FF4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AC78);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unsigned int v13 = a4 + 32;
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
  uint64_t result = sub_24D1B2490();
  __break(1u);
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

uint64_t sub_24D1A518C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_24D1A5218(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1E0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_24D1A5338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events;
  swift_beginAccess();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_24D1A53C0()
{
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18A1B0);
  uint64_t v1 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1E0);
  uint64_t v4 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1D0);
  MEMORY[0x270FA5388](v7 - 8);
  int64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t)v0 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_continuation;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18A1C0);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v12((uint64_t)v9, 1, 1, v11);
  uint64_t v19 = v9;
  type metadata accessor for EncoreEvent();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F580], v17);
  id v13 = v0;
  sub_24D1B2290();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v13 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events, v6, v18);
  swift_beginAccess();
  sub_24D1A5ACC((uint64_t)v9, v10);
  swift_endAccess();

  uint64_t v14 = (objc_class *)type metadata accessor for AsyncService();
  v20.receiver = v13;
  v20.super_class = v14;
  id v15 = objc_msgSendSuper2(&v20, sel_init);
  sub_24D1A5B34((uint64_t)v9);
  return v15;
}

uint64_t sub_24D1A5698(uint64_t a1, uint64_t a2)
{
  sub_24D1A5B34(a2);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18A1C0);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);
  return v5(a2, 0, 1, v4);
}

id AsyncService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AsyncService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AsyncService()
{
  uint64_t result = qword_26B18A180;
  if (!qword_26B18A180) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D1A58A8()
{
  return type metadata accessor for AsyncService();
}

void sub_24D1A58B0()
{
  sub_24D1A59C8();
  if (v0 <= 0x3F)
  {
    sub_24D1A5A20();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AsyncService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AsyncService);
}

uint64_t dispatch thunk of AsyncService.events.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

void sub_24D1A59C8()
{
  if (!qword_26B18A1E8)
  {
    type metadata accessor for EncoreEvent();
    unint64_t v0 = sub_24D1B2280();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B18A1E8);
    }
  }
}

void sub_24D1A5A20()
{
  if (!qword_26B18A1D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B18A1C0);
    unint64_t v0 = sub_24D1B2370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B18A1D8);
    }
  }
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

uint64_t sub_24D1A5AC4(uint64_t a1)
{
  return sub_24D1A5698(a1, *(void *)(v1 + 16));
}

uint64_t sub_24D1A5ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D1A5B34(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ServiceName.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

EncoreXPCService::ServiceName __swiftcall ServiceName.init(stringLiteral:)(EncoreXPCService::ServiceName stringLiteral)
{
  *uint64_t v1 = stringLiteral;
  return stringLiteral;
}

uint64_t static ServiceName.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24D1B24E0();
  }
}

uint64_t sub_24D1A5BFC()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24D1A5C2C(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24D1B24E0();
  }
}

void *sub_24D1A5C5C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t static EncoreEvent.secureCoding.getter()
{
  return byte_26985AC80;
}

uint64_t static EncoreEvent.secureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_26985AC80 = a1;
  return result;
}

uint64_t (*static EncoreEvent.secureCoding.modify())()
{
  return j__swift_endAccess;
}

uint64_t EncoreEvent.id.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___EncoreEvent_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EncoreEvent.data.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___EncoreEvent_data);
  sub_24D1A5E10(v1, *(void *)(v0 + OBJC_IVAR___EncoreEvent_data + 8));
  return v1;
}

uint64_t sub_24D1A5E10(uint64_t a1, unint64_t a2)
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

uint64_t EncoreEvent.serviceName.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___EncoreEvent_serviceName + 8);
  *a1 = *(void *)(v1 + OBJC_IVAR___EncoreEvent_serviceName);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_24D1A5EE8()
{
  uint64_t v0 = sub_24D1B2190();
  MEMORY[0x270FA5388](v0 - 8);
  sub_24D1B2180();
  sub_24D1B2170();
  sub_24D1B2400();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24D1B21C0();
  swift_bridgeObjectRelease();
  sub_24D1B21C0();
  swift_bridgeObjectRetain();
  sub_24D1B21C0();
  swift_bridgeObjectRelease();
  sub_24D1B21C0();
  sub_24D1B21C0();
  swift_bridgeObjectRelease();
  sub_24D1B21C0();
  return 0xD000000000000010;
}

char *EncoreEvent.__allocating_init(value:serviceName:id:)(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return EncoreEvent.init(value:serviceName:id:)(a1, a2, a3, a4);
}

char *EncoreEvent.init(value:serviceName:id:)(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *a2;
  uint64_t v23 = a2[1];
  uint64_t v8 = OBJC_IVAR___EncoreEvent_jsonEncoder;
  sub_24D1B2010();
  swift_allocObject();
  id v9 = v4;
  *(void *)&v4[v8] = sub_24D1B2000();
  uint64_t v10 = OBJC_IVAR___EncoreEvent_jsonDecoder;
  sub_24D1B1FE0();
  swift_allocObject();
  *(void *)&v9[v10] = sub_24D1B1FD0();
  uint64_t v11 = &v9[OBJC_IVAR___EncoreEvent_id];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_retain();
  uint64_t v12 = sub_24D1B1FF0();
  if (v21)
  {
    swift_release();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_release();

    swift_release();
    type metadata accessor for EncoreEvent();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v14 = v12;
    uint64_t v15 = v13;
    swift_release();
    int v16 = (uint64_t *)&v9[OBJC_IVAR___EncoreEvent_data];
    *int v16 = v14;
    v16[1] = v15;
    uint64_t v17 = &v9[OBJC_IVAR___EncoreEvent_serviceName];
    uint64_t v18 = v23;
    *(void *)uint64_t v17 = v20;
    *((void *)v17 + 1) = v18;

    v22.receiver = v9;
    v22.super_class = (Class)type metadata accessor for EncoreEvent();
    id v9 = (char *)objc_msgSendSuper2(&v22, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v9;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for EncoreEvent()
{
  return self;
}

uint64_t sub_24D1A6354()
{
  return sub_24D1B1FC0();
}

void sub_24D1A639C(void *a1)
{
  uint64_t v3 = (void *)sub_24D1B2150();
  uint64_t v4 = (void *)sub_24D1B2150();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  uint64_t v5 = (void *)sub_24D1B2030();
  uint64_t v6 = (void *)sub_24D1B2150();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);

  if (*(void *)(v1 + OBJC_IVAR___EncoreEvent_serviceName + 8)) {
    uint64_t v7 = (void *)sub_24D1B2150();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)sub_24D1B2150();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);
}

id EncoreEvent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return EncoreEvent.init(coder:)(a1);
}

id EncoreEvent.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR___EncoreEvent_jsonEncoder;
  sub_24D1B2010();
  swift_allocObject();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_24D1B2000();
  uint64_t v5 = OBJC_IVAR___EncoreEvent_jsonDecoder;
  sub_24D1B1FE0();
  swift_allocObject();
  *(void *)&v4[v5] = sub_24D1B1FD0();
  sub_24D1A786C(0, &qword_26985ACB0);
  uint64_t v6 = sub_24D1B2350();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    sub_24D1A786C(0, &qword_26985ACB8);
    uint64_t v8 = sub_24D1B2350();
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v10 = sub_24D1B2160();
      uint64_t v11 = (uint64_t *)&v4[OBJC_IVAR___EncoreEvent_id];
      *uint64_t v11 = v10;
      v11[1] = v12;
      id v13 = v9;
      uint64_t v14 = sub_24D1B2040();
      uint64_t v16 = v15;

      uint64_t v17 = (uint64_t *)&v4[OBJC_IVAR___EncoreEvent_data];
      *uint64_t v17 = v14;
      v17[1] = v16;
      uint64_t v18 = sub_24D1B2350();
      if (v18)
      {
        uint64_t v19 = (void *)v18;
        uint64_t v20 = sub_24D1B2160();
        uint64_t v22 = v21;

        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v20 = 0;
        uint64_t v22 = 0;
      }

      swift_bridgeObjectRelease();
      v28 = (uint64_t *)&v4[OBJC_IVAR___EncoreEvent_serviceName];
      uint64_t *v28 = v20;
      v28[1] = v22;

      v30.receiver = v4;
      v30.super_class = (Class)type metadata accessor for EncoreEvent();
      id v27 = objc_msgSendSuper2(&v30, sel_init);

      return v27;
    }
  }
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_24D1B20B0();
  __swift_project_value_buffer(v23, (uint64_t)qword_26B18A2B8);
  v24 = sub_24D1B20A0();
  os_log_type_t v25 = sub_24D1B2300();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_24D1A1000, v24, v25, "Missing required key values", v26, 2u);
    MEMORY[0x253321860](v26, -1, -1);
  }

  swift_release();
  swift_release();
  type metadata accessor for EncoreEvent();
  swift_deallocPartialClassInstance();
  return 0;
}

id EncoreEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void EncoreEvent.init()()
{
}

id EncoreEvent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EncoreEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SystemEvents.asDirectInvocation.getter()
{
  v23[5] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_24D1B2090();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 96;
  char v5 = *v0;
  v23[3] = &type metadata for SystemEvents;
  v23[4] = (id)sub_24D1A78A8();
  LOBYTE(v23[0]) = v5;
  v22[0] = 0;
  v22[1] = 0;
  sub_24D1B2080();
  uint64_t v6 = sub_24D1B2070();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v9 = objc_allocWithZone((Class)type metadata accessor for EncoreEvent());
  uint64_t v10 = EncoreEvent.init(value:serviceName:id:)(v23, v22, v6, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985ACC8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24D1B2E90;
  v23[0] = (id)0xD000000000000011;
  v23[1] = (id)0x800000024D1B4C30;
  sub_24D1B23F0();
  uint64_t v12 = self;
  v23[0] = 0;
  id v13 = objc_msgSend(v12, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v10, 1, v23);
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = v23[0];
    uint64_t v16 = sub_24D1B2040();
    uint64_t v18 = v17;

    *(void *)(inited + 96) = MEMORY[0x263F06F78];
    *(void *)(inited + 72) = v16;
    *(void *)(inited + 80) = v18;
    sub_24D1A6C7C(inited);

    return 0xD000000000000025;
  }
  else
  {
    id v20 = v23[0];
    sub_24D1B2020();

    swift_willThrow();
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

unint64_t sub_24D1A6C7C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985ADD8);
  uint64_t v2 = sub_24D1B2480();
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
    sub_24D1A82F8(v6, (uint64_t)v15);
    unint64_t result = sub_24D1ABEC0((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_24D1A8360(&v17, (_OWORD *)(v3[7] + 32 * result));
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

BOOL static SystemEvents.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SystemEvents.hash(into:)()
{
  return sub_24D1B2530();
}

BOOL sub_24D1A6DF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24D1A6E0C()
{
  return sub_24D1B2530();
}

unint64_t sub_24D1A6E3C()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0xD000000000000012;
  }
}

uint64_t sub_24D1A6E7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24D1A81B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24D1A6EA4()
{
  return 0;
}

void sub_24D1A6EB0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24D1A6EBC(uint64_t a1)
{
  unint64_t v2 = sub_24D1A78FC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24D1A6EF8(uint64_t a1)
{
  unint64_t v2 = sub_24D1A78FC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24D1A6F34()
{
  return 0;
}

void sub_24D1A6F40(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24D1A6F4C(uint64_t a1)
{
  unint64_t v2 = sub_24D1A7950();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24D1A6F88(uint64_t a1)
{
  unint64_t v2 = sub_24D1A7950();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24D1A6FC4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24D1A6FF4(uint64_t a1)
{
  unint64_t v2 = sub_24D1A79A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24D1A7030(uint64_t a1)
{
  unint64_t v2 = sub_24D1A79A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SystemEvents.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985ACD0);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985ACD8);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985ACE0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24D1A78FC();
  sub_24D1B2560();
  BOOL v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24D1A7950();
    uint64_t v14 = v18;
    sub_24D1B24D0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24D1A79A4();
    sub_24D1B24D0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

uint64_t SystemEvents.hashValue.getter()
{
  return sub_24D1B2540();
}

uint64_t SystemEvents.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AD00);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AD08);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AD10);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24D1A78FC();
  long long v11 = v32;
  sub_24D1B2550();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_24D1B24C0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24D1B2430();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AD18);
    *char v22 = &type metadata for SystemEvents;
    sub_24D1B24B0();
    sub_24D1B2420();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24D1A7950();
    uint64_t v18 = v14;
    sub_24D1B24A0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24D1A79A4();
    sub_24D1B24A0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_0(v23);
}

uint64_t sub_24D1A77B0()
{
  return sub_24D1B2540();
}

uint64_t sub_24D1A77F8()
{
  return sub_24D1B2540();
}

uint64_t sub_24D1A783C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SystemEvents.init(from:)(a1, a2);
}

uint64_t sub_24D1A7854(void *a1)
{
  return SystemEvents.encode(to:)(a1);
}

uint64_t sub_24D1A786C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_24D1A78A8()
{
  unint64_t result = qword_26985ACC0;
  if (!qword_26985ACC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ACC0);
  }
  return result;
}

unint64_t sub_24D1A78FC()
{
  unint64_t result = qword_26985ACE8;
  if (!qword_26985ACE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ACE8);
  }
  return result;
}

unint64_t sub_24D1A7950()
{
  unint64_t result = qword_26985ACF0;
  if (!qword_26985ACF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ACF0);
  }
  return result;
}

unint64_t sub_24D1A79A4()
{
  unint64_t result = qword_26985ACF8;
  if (!qword_26985ACF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ACF8);
  }
  return result;
}

unint64_t sub_24D1A79FC()
{
  unint64_t result = qword_26985AD20;
  if (!qword_26985AD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985AD20);
  }
  return result;
}

uint64_t sub_24D1A7A50()
{
  return MEMORY[0x263F8D388];
}

unint64_t sub_24D1A7A60()
{
  unint64_t result = qword_26985AD28;
  if (!qword_26985AD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985AD28);
  }
  return result;
}

uint64_t sub_24D1A7AB4()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_24D1A7AC0()
{
  return MEMORY[0x263F8D390];
}

unint64_t sub_24D1A7AD0()
{
  unint64_t result = qword_26985AD30;
  if (!qword_26985AD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985AD30);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ServiceName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ServiceName()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ServiceName(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ServiceName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceName(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ServiceName(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ServiceName()
{
  return &type metadata for ServiceName;
}

uint64_t method lookup function for EncoreEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EncoreEvent);
}

uint64_t dispatch thunk of static EncoreEvent.supportsSecureCoding.getter()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of EncoreEvent.__allocating_init(value:serviceName:id:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of EncoreEvent.getValue<A>()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of EncoreEvent.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of EncoreEvent.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SystemEvents()
{
  return &type metadata for SystemEvents;
}

uint64_t _s16EncoreXPCService12SystemEventsOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s16EncoreXPCService12SystemEventsOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24D1A7EE0);
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

uint64_t sub_24D1A7F08(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24D1A7F10(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SystemEvents.CodingKeys()
{
  return &type metadata for SystemEvents.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemEvents.SnippetDisappearedCodingKeys()
{
  return &type metadata for SystemEvents.SnippetDisappearedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemEvents.ReturnedToVoiceModeCodingKeys()
{
  return &type metadata for SystemEvents.ReturnedToVoiceModeCodingKeys;
}

unint64_t sub_24D1A7F50()
{
  unint64_t result = qword_26985ADA0;
  if (!qword_26985ADA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ADA0);
  }
  return result;
}

unint64_t sub_24D1A7FA8()
{
  unint64_t result = qword_26985ADA8;
  if (!qword_26985ADA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ADA8);
  }
  return result;
}

unint64_t sub_24D1A8000()
{
  unint64_t result = qword_26985ADB0;
  if (!qword_26985ADB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ADB0);
  }
  return result;
}

unint64_t sub_24D1A8058()
{
  unint64_t result = qword_26985ADB8;
  if (!qword_26985ADB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ADB8);
  }
  return result;
}

unint64_t sub_24D1A80B0()
{
  unint64_t result = qword_26985ADC0;
  if (!qword_26985ADC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ADC0);
  }
  return result;
}

unint64_t sub_24D1A8108()
{
  unint64_t result = qword_26985ADC8;
  if (!qword_26985ADC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ADC8);
  }
  return result;
}

unint64_t sub_24D1A8160()
{
  unint64_t result = qword_26985ADD0;
  if (!qword_26985ADD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26985ADD0);
  }
  return result;
}

uint64_t sub_24D1A81B4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000024D1B4D50 || (sub_24D1B24E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024D1B4D70)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24D1B24E0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24D1A82A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_24D1A82F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985ADE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24D1A8360(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t static EncoreService.machServiceName.getter()
{
  return 0xD000000000000021;
}

void sub_24D1A83AC()
{
  off_26985AE50 = (_UNKNOWN *)MEMORY[0x263F8EE80];
}

void sub_24D1A83C0(void **a1, void *a2)
{
  long long v2 = *a1;
  int v3 = (void **)(*a2 + OBJC_IVAR___EncoreService_endpoint);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = v2;
  id v5 = v2;
}

void *sub_24D1A8424()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___EncoreService_endpoint);
  swift_beginAccess();
  long long v2 = *v1;
  id v3 = v2;
  return v2;
}

id sub_24D1A84D8()
{
  id result = (id)qword_26B18A158;
  if (qword_26B18A158
    || (id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EncoreService(0)), sel_init),
        long long v2 = (void *)qword_26B18A158,
        qword_26B18A158 = (uint64_t)v1,
        v2,
        (id result = (id)qword_26B18A158) != 0))
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for EncoreService(uint64_t a1)
{
  return sub_24D1AB298(a1, (uint64_t *)&unk_26B18A170);
}

id sub_24D1A855C()
{
  id result = (id)qword_26B18A158;
  if (qword_26B18A158
    || (id v1 = objc_allocWithZone((Class)type metadata accessor for EncoreService(0)),
        long long v2 = sub_24D1A8754(0, 0),
        id v3 = (void *)qword_26B18A158,
        qword_26B18A158 = (uint64_t)v2,
        v3,
        (id result = (id)qword_26B18A158) != 0))
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24D1A85C4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for EncoreService(0));
  id v1 = sub_24D1A8754(0xD000000000000021, 0x800000024D1B4D90);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  uint64_t v2 = qword_26B18A190;
  id v3 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24D1B20B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B18A2B8);
  id v5 = sub_24D1B20A0();
  os_log_type_t v6 = sub_24D1B22F0();
  if (os_log_type_enabled(v5, v6))
  {
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_24D1A1000, v5, v6, "EncoreService: init", v7, 2u);
    MEMORY[0x253321860](v7, -1, -1);
  }

  return v3;
}

void *sub_24D1A8754(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a2;
  v19[0] = a1;
  uint64_t v21 = sub_24D1B2320();
  uint64_t v3 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  id v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24D1B2310();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_24D1B2130();
  MEMORY[0x270FA5388](v7 - 8);
  *(void *)&v2[OBJC_IVAR___EncoreService_listener] = 0;
  int v8 = &v2[OBJC_IVAR___EncoreService_eventHandler];
  *(void *)int v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&v2[OBJC_IVAR___EncoreService_endpoint] = 0;
  uint64_t v20 = OBJC_IVAR___EncoreService_queue;
  v19[1] = sub_24D1AD910();
  uint64_t v9 = v2;
  sub_24D1B2120();
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_24D1AD950(&qword_26B18A1F8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1A0);
  sub_24D1AD998(&qword_26B18A1A8, &qword_26B18A1A0);
  sub_24D1B23B0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F130], v21);
  uint64_t v10 = v22;
  *(void *)&v2[v20] = sub_24D1B2340();

  long long v11 = (objc_class *)type metadata accessor for EncoreService(0);
  v23.receiver = v9;
  v23.super_class = v11;
  id v12 = objc_msgSendSuper2(&v23, sel_init, v19[0]);
  uint64_t v13 = v12;
  if (v10)
  {
    id v14 = objc_allocWithZone(MEMORY[0x263F08D88]);
    id v15 = v13;
    swift_bridgeObjectRetain();
    char v16 = (void *)sub_24D1B2150();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v14, sel_initWithMachServiceName_, v16);

    objc_msgSend(v17, sel_setDelegate_, v15);
    objc_msgSend(v17, sel_resume);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v17 = v12;
    sub_24D1A8AA8();
  }

  return v13;
}

void sub_24D1A8AA8()
{
  uint64_t v1 = v0;
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24D1B20B0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B18A2B8);
  uint64_t v3 = sub_24D1B20A0();
  os_log_type_t v4 = sub_24D1B22F0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_24D1A1000, v3, v4, "EncoreService: initTestingLoopback", v5, 2u);
    MEMORY[0x253321860](v5, -1, -1);
  }

  id v6 = objc_msgSend(self, sel_anonymousListener);
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR___EncoreService_listener);
  *(void *)(v1 + OBJC_IVAR___EncoreService_listener) = v6;
  id v8 = v6;

  id v9 = objc_msgSend(v8, sel_endpoint);
  uint64_t v10 = (void **)(v1 + OBJC_IVAR___EncoreService_endpoint);
  swift_beginAccess();
  long long v11 = *v10;
  *uint64_t v10 = v9;

  objc_msgSend(v8, sel_setDelegate_, v1);
  objc_msgSend(v8, sel_resume);
}

uint64_t sub_24D1A8C38(void *a1)
{
  uint64_t v3 = sub_24D1B2100();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24D1B2130();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[0] = *(void *)(v1 + OBJC_IVAR___EncoreService_queue);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  aBlock[4] = sub_24D1A9128;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D1A8AA4;
  aBlock[3] = &block_descriptor;
  id v12 = _Block_copy(aBlock);
  id v13 = a1;
  sub_24D1B2110();
  v15[1] = MEMORY[0x263F8EE78];
  sub_24D1AD950(&qword_26985AE60, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985AE68);
  sub_24D1AD998(&qword_26985AE70, &qword_26985AE68);
  sub_24D1B23B0();
  MEMORY[0x253321050](0, v10, v6, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_24D1A8EE8()
{
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24D1B20B0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B18A2B8);
  uint64_t v1 = sub_24D1B20A0();
  os_log_type_t v2 = sub_24D1B22F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 134217984;
    if (qword_26985ABF0 != -1) {
      swift_once();
    }
    swift_beginAccess();
    sub_24D1B2380();
    _os_log_impl(&dword_24D1A1000, v1, v2, "EncoreService: broadcast to clients: %ld", v3, 0xCu);
    MEMORY[0x253321860](v3, -1, -1);
  }

  if (qword_26985ABF0 != -1) {
    swift_once();
  }
  uint64_t v4 = swift_beginAccess();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_24D1ACCD4(v5, (void (*)(uint64_t, uint64_t, uint64_t))sub_24D1AD8AC);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24D1A90F0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D1A9128()
{
  return sub_24D1A8EE8();
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

uint64_t sub_24D1A9148(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = type metadata accessor for ClientConnection(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24D1B20B0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B18A2B8);
  sub_24D1AB2D0(a3, (uint64_t)v8);
  id v10 = a4;
  uint64_t v11 = sub_24D1B20A0();
  os_log_type_t v12 = sub_24D1B22F0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    id v14 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    id v25 = v10;
    v26[0] = v23;
    *(_DWORD *)uint64_t v13 = 138412546;
    uint64_t v24 = a3;
    id v15 = v10;
    id v16 = v10;
    sub_24D1B2380();
    *id v14 = v15;

    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v17 = *v8;
    unint64_t v18 = v8[1];
    swift_bridgeObjectRetain();
    id v25 = (id)sub_24D1A4290(v17, v18, v26);
    a3 = v24;
    id v10 = v15;
    sub_24D1B2380();
    swift_bridgeObjectRelease();
    sub_24D1AB558((uint64_t)v8);
    _os_log_impl(&dword_24D1A1000, v11, v12, "EncoreService: broadcast %@ to %s", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AE78);
    swift_arrayDestroy();
    MEMORY[0x253321860](v14, -1, -1);
    uint64_t v19 = v23;
    swift_arrayDestroy();
    MEMORY[0x253321860](v19, -1, -1);
    MEMORY[0x253321860](v13, -1, -1);
  }
  else
  {

    sub_24D1AB558((uint64_t)v8);
  }

  id v20 = objc_msgSend(*(id *)(a3 + 16), sel_remoteObjectProxy);
  sub_24D1B23A0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985AEA8);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    objc_msgSend(v25, sel_handleEventWithEvent_, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24D1A94BC(void *a1)
{
  return sub_24D1A9BC4(a1, "EncoreService: echo %@");
}

uint64_t sub_24D1A9530(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18A1C0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1D0);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AE80);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24D1B20B0();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B18A2B8);
  id v15 = a1;
  id v16 = sub_24D1B20A0();
  os_log_type_t v17 = sub_24D1B22F0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v33 = v2;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v34 = v4;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v30 = (void *)swift_slowAlloc();
    uint64_t v31 = v19;
    v32 = v7;
    *(_DWORD *)uint64_t v19 = 138412290;
    id v36 = v15;
    id v20 = v15;
    uint64_t v7 = v32;
    sub_24D1B2380();
    uint64_t v21 = v30;
    *uint64_t v30 = v15;

    uint64_t v2 = v33;
    uint64_t v22 = v31;
    _os_log_impl(&dword_24D1A1000, v16, v17, "EncoreService: handleEvent %@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AE78);
    swift_arrayDestroy();
    MEMORY[0x253321860](v21, -1, -1);
    uint64_t v4 = v34;
    MEMORY[0x253321860](v22, -1, -1);
  }
  else
  {
  }
  uint64_t v23 = *(void (**)(id))(v2 + OBJC_IVAR___EncoreService_eventHandler);
  if (v23)
  {
    swift_retain();
    v23(v15);
    sub_24D1AB200((uint64_t)v23);
  }
  uint64_t v24 = v2 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_continuation;
  swift_beginAccess();
  sub_24D1AB210(v24, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_24D1AD8B4((uint64_t)v10, &qword_26B18A1D0);
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AE90);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v13, 1, 1, v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_24D1AD8B4((uint64_t)v10, &qword_26B18A1D0);
    id v35 = v15;
    id v26 = v15;
    sub_24D1B2250();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AE90);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v13, 0, 1, v27);
  }
  return sub_24D1AD8B4((uint64_t)v13, (uint64_t *)&unk_26985AE80);
}

uint64_t sub_24D1A9A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24D1B20B0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B18A2B8);
  uint64_t v7 = sub_24D1B20A0();
  os_log_type_t v8 = sub_24D1B22F0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_24D1A1000, v7, v8, "EncoreService: subscribe", v9, 2u);
    MEMORY[0x253321860](v9, -1, -1);
  }

  id v10 = (void *)(v3 + OBJC_IVAR___EncoreService_eventHandler);
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR___EncoreService_eventHandler);
  *id v10 = a1;
  v10[1] = a2;
  swift_retain();
  return sub_24D1AB200(v11);
}

uint64_t sub_24D1A9BB8(void *a1)
{
  return sub_24D1A9BC4(a1, "EncoreService: publish %@");
}

uint64_t sub_24D1A9BC4(void *a1, const char *a2)
{
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24D1B20B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B18A2B8);
  id v5 = a1;
  uint64_t v6 = sub_24D1B20A0();
  os_log_type_t v7 = sub_24D1B22F0();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v8 = 138412290;
    id v10 = v5;
    sub_24D1B2380();
    *uint64_t v9 = v5;

    _os_log_impl(&dword_24D1A1000, v6, v7, a2, v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AE78);
    swift_arrayDestroy();
    MEMORY[0x253321860](v9, -1, -1);
    MEMORY[0x253321860](v8, -1, -1);
  }
  else
  {
  }
  return sub_24D1A8C38(v5);
}

uint64_t sub_24D1A9DE8(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FF7AAB8);
  objc_msgSend(a2, sel_setExportedInterface_, v4);

  objc_msgSend(a2, sel_setExportedObject_, v2);
  objc_msgSend(a2, sel_resume);
  return 1;
}

void sub_24D1A9F54(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v52 = a3;
  uint64_t v56 = a5;
  v57 = a4;
  uint64_t v51 = a2;
  uint64_t v6 = (void *)type metadata accessor for ClientConnection(0);
  uint64_t v7 = *(v6 - 1);
  id v49 = v6;
  uint64_t v50 = v7;
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v48 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (id *)((char *)&v48 - v13);
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v55 = (uint64_t *)((char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_24D1B20B0();
  uint64_t v54 = __swift_project_value_buffer(v15, (uint64_t)qword_26B18A2B8);
  id v16 = sub_24D1B20A0();
  os_log_type_t v17 = sub_24D1B22F0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_24D1A1000, v16, v17, "EncoreService: register new connection", v18, 2u);
    MEMORY[0x253321860](v18, -1, -1);
  }

  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08D68]), sel_initWithListenerEndpoint_, a1);
  id v20 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FF7A9C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AFF0);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_24D1B2E90;
  uint64_t v22 = type metadata accessor for EncoreEvent();
  *(void *)(v21 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AEA0);
  *(void *)(v21 + 32) = v22;
  id v23 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  uint64_t v24 = (void *)sub_24D1B21E0();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v23, sel_initWithArray_, v24);

  uint64_t aBlock = 0;
  sub_24D1B22D0();
  if (aBlock)
  {

    id v26 = (void *)sub_24D1B22C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel_setClasses_forSelector_argumentIndex_ofReply_, v26, sel_handleEventWithEvent_, 0, 0);

    objc_msgSend(v19, sel_setRemoteObjectInterface_, v20);
    objc_msgSend(v19, sel_resume);
    id v27 = objc_msgSend(v19, sel_remoteObjectProxy);
    sub_24D1B23A0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AEA8);
    if (swift_dynamicCast())
    {
      id v48 = v20;
      swift_unknownObjectRelease();
      uint64_t v28 = v52;
      swift_bridgeObjectRetain();
      id v29 = v19;
      id v49 = v29;
      sub_24D1B2050();
      *uint64_t v14 = v51;
      v14[1] = v28;
      v14[2] = v29;
      sub_24D1AB2D0((uint64_t)v14, (uint64_t)v12);
      unint64_t v30 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
      unint64_t v31 = (v8 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v32 = swift_allocObject();
      sub_24D1AB338((uint64_t)v12, v32 + v30);
      uint64_t v33 = v53;
      *(void *)(v32 + v31) = v53;
      uint64_t v62 = sub_24D1AB39C;
      uint64_t v63 = v32;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v59 = 1107296256;
      uint64_t v60 = sub_24D1A8AA4;
      v61 = &block_descriptor_6;
      uint64_t v34 = _Block_copy(&aBlock);
      id v35 = v33;
      swift_release();
      id v36 = v49;
      objc_msgSend(v49, sel_setInterruptionHandler_, v34);
      _Block_release(v34);
      sub_24D1AB2D0((uint64_t)v14, (uint64_t)v12);
      uint64_t v37 = swift_allocObject();
      sub_24D1AB338((uint64_t)v12, v37 + v30);
      *(void *)(v37 + v31) = v35;
      uint64_t v62 = sub_24D1AB4BC;
      uint64_t v63 = v37;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v59 = 1107296256;
      uint64_t v60 = sub_24D1A8AA4;
      v61 = &block_descriptor_12;
      uint64_t v38 = _Block_copy(&aBlock);
      v35;
      swift_release();
      objc_msgSend(v36, sel_setInvalidationHandler_, v38);
      _Block_release(v38);
      BOOL v53 = v14;
      uint64_t v39 = v55;
      sub_24D1AB2D0((uint64_t)v14, (uint64_t)v55);
      uint64_t v40 = sub_24D1B20A0();
      os_log_type_t v41 = sub_24D1B22F0();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t aBlock = v43;
        *(_DWORD *)v42 = 136315138;
        uint64_t v44 = *v39;
        unint64_t v45 = v39[1];
        swift_bridgeObjectRetain();
        uint64_t v64 = sub_24D1A4290(v44, v45, &aBlock);
        id v36 = v49;
        sub_24D1B2380();
        swift_bridgeObjectRelease();
        sub_24D1AB558((uint64_t)v39);
        _os_log_impl(&dword_24D1A1000, v40, v41, "EncoreService: registered new client %s", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253321860](v43, -1, -1);
        MEMORY[0x253321860](v42, -1, -1);
      }
      else
      {
        sub_24D1AB558((uint64_t)v39);
      }

      uint64_t v46 = v57;
      uint64_t v47 = (uint64_t)v53;
      sub_24D1AA980((uint64_t)v53);
      ((void (*)(uint64_t))v46)(1);

      sub_24D1AB558(v47);
    }
    else
    {
      v57();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24D1AA678(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24D1AA6BC(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = type metadata accessor for ClientConnection(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (void *)((char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24D1B20B0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B18A2B8);
  sub_24D1AB2D0(a1, (uint64_t)v8);
  uint64_t v10 = sub_24D1B20A0();
  os_log_type_t v11 = sub_24D1B22F0();
  if (os_log_type_enabled(v10, v11))
  {
    v19[1] = a2;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    v19[0] = a1;
    uint64_t v14 = a3;
    uint64_t v16 = *v8;
    unint64_t v15 = v8[1];
    swift_bridgeObjectRetain();
    void v19[2] = sub_24D1A4290(v16, v15, &v20);
    sub_24D1B2380();
    swift_bridgeObjectRelease();
    sub_24D1AB558((uint64_t)v8);
    os_log_type_t v17 = v14;
    a1 = v19[0];
    _os_log_impl(&dword_24D1A1000, v10, v11, v17, v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253321860](v13, -1, -1);
    MEMORY[0x253321860](v12, -1, -1);
  }
  else
  {
    sub_24D1AB558((uint64_t)v8);
  }

  return sub_24D1AAC98(a1);
}

uint64_t sub_24D1AA980(uint64_t a1)
{
  return sub_24D1AACC0(a1, (uint64_t)&unk_26FF79360, (uint64_t)sub_24D1AD7BC, (uint64_t)&block_descriptor_61);
}

uint64_t sub_24D1AA9A8(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AF28);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26985ABF0 != -1) {
    swift_once();
  }
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  sub_24D1AB2D0((uint64_t)a1, (uint64_t)v4);
  uint64_t v7 = type metadata accessor for ClientConnection(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 0, 1, v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24D1AAADC((uint64_t)v4, v5, v6);
  return swift_endAccess();
}

uint64_t sub_24D1AAADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AF28);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ClientConnection(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_24D1AD8B4(a1, &qword_26985AF28);
    sub_24D1AC128(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_24D1AD8B4((uint64_t)v10, &qword_26985AF28);
  }
  else
  {
    sub_24D1AB338(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    sub_24D1AC86C((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24D1AAC98(uint64_t a1)
{
  return sub_24D1AACC0(a1, (uint64_t)&unk_26FF79248, (uint64_t)sub_24D1ABEA8, (uint64_t)&block_descriptor_38);
}

uint64_t sub_24D1AACC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  v20[0] = a2;
  uint64_t v6 = sub_24D1B2100();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24D1B2130();
  uint64_t v10 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ClientConnection(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13 - 8);
  v20[1] = *(void *)(v4 + OBJC_IVAR___EncoreService_queue);
  sub_24D1AB2D0(a1, (uint64_t)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = swift_allocObject();
  sub_24D1AB338((uint64_t)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  aBlock[4] = v21;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24D1A8AA4;
  aBlock[3] = v22;
  uint64_t v18 = _Block_copy(aBlock);
  sub_24D1B2110();
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_24D1AD950(&qword_26985AE60, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985AE68);
  sub_24D1AD998(&qword_26985AE70, &qword_26985AE68);
  sub_24D1B23B0();
  MEMORY[0x253321050](0, v12, v9, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v23);
  return swift_release();
}

uint64_t sub_24D1AAFF4(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AF28);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26985ABF0 != -1) {
    swift_once();
  }
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24D1AC128(v5, v6, (uint64_t)v4);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return sub_24D1AD8B4((uint64_t)v4, &qword_26985AF28);
}

void sub_24D1AB0F4()
{
  sub_24D1AB200(*(void *)(v0 + OBJC_IVAR___EncoreService_eventHandler));
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___EncoreService_queue);
}

id EncoreService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EncoreService(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D1AB200(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24D1AB210(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ClientConnection(uint64_t a1)
{
  return sub_24D1AB298(a1, (uint64_t *)&unk_26985AF18);
}

uint64_t sub_24D1AB298(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D1AB2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientConnection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D1AB338(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientConnection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D1AB39C()
{
  return sub_24D1AB4C8("EncoreService: interruption on client %s");
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for ClientConnection(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_24D1B2060();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t sub_24D1AB4BC()
{
  return sub_24D1AB4C8("EncoreService: invalidation on client %s");
}

uint64_t sub_24D1AB4C8(const char *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ClientConnection(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_24D1AA6BC(v1 + v4, *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_24D1AB558(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ClientConnection(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_24D1AB5B4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR___EncoreService_endpoint);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_24D1AB61C()
{
  return type metadata accessor for EncoreService(0);
}

uint64_t sub_24D1AB624()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for EncoreService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EncoreService);
}

uint64_t dispatch thunk of EncoreService.endpoint.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of static EncoreService.service.getter()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of static EncoreService.loopbackService.getter()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of EncoreService.broadcast(event:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of EncoreService.echo(event:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of EncoreService.handleEvent(event:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of EncoreService.subscribe(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of EncoreService.publish(event:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of EncoreService.listener(_:shouldAcceptNewConnection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of EncoreService.register(client:name:with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t *sub_24D1AB898(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = (void *)a2[2];
    a1[2] = (uint64_t)v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24D1B2060();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    id v12 = v6;
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_24D1AB98C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24D1B2060();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_24D1ABA0C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = (void *)a2[2];
  a1[2] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24D1B2060();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

void *sub_24D1ABAB0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[2];
  uint64_t v7 = (void *)a1[2];
  a1[2] = v6;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24D1B2060();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_24D1ABB60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_24D1B2060();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_24D1ABBE4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[2];
  a1[2] = a2[2];

  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24D1B2060();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_24D1ABC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24D1ABC94);
}

uint64_t sub_24D1ABC94(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24D1B2060();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24D1ABD44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24D1ABD58);
}

uint64_t sub_24D1ABD58(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24D1B2060();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24D1ABE00()
{
  uint64_t result = sub_24D1B2060();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24D1ABEA8()
{
  return sub_24D1AD7D4((uint64_t (*)(uint64_t))sub_24D1AAFF4);
}

unint64_t sub_24D1ABEC0(uint64_t a1)
{
  uint64_t v2 = sub_24D1B23D0();
  return sub_24D1ABF7C(a1, v2);
}

unint64_t sub_24D1ABF04(uint64_t a1, uint64_t a2)
{
  sub_24D1B2520();
  sub_24D1B21B0();
  uint64_t v4 = sub_24D1B2540();
  return sub_24D1AC044(a1, a2, v4);
}

unint64_t sub_24D1ABF7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24D1AD9E8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x253321100](v9, a1);
      sub_24D1ADA44((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24D1AC044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24D1B24E0() & 1) == 0)
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
      while (!v14 && (sub_24D1B24E0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24D1AC128@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_24D1ABF04(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24D1ACA68();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for ClientConnection(0);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_24D1AB338(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_24D1AC65C(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for ClientConnection(0);
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_24D1AC2B8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ClientConnection(0);
  uint64_t v42 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985AF30);
  int v43 = a2;
  uint64_t v9 = sub_24D1B2470();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  os_log_type_t v41 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v14 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    id v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_24D1AB338(v30, (uint64_t)v7);
    }
    else
    {
      sub_24D1AB2D0(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_24D1B2520();
    sub_24D1B21B0();
    uint64_t result = sub_24D1B2540();
    uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    id v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *id v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_24D1AB338((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

unint64_t sub_24D1AC65C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24D1B23C0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_24D1B2520();
        swift_bridgeObjectRetain();
        sub_24D1B21B0();
        uint64_t v9 = sub_24D1B2540();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for ClientConnection(0) - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24D1AC86C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24D1ABF04(a2, a3);
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
      sub_24D1ACA68();
      goto LABEL_7;
    }
    sub_24D1AC2B8(v15, a4 & 1);
    unint64_t v22 = sub_24D1ABF04(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24D1B2500();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for ClientConnection(0) - 8) + 72) * v12;
    return sub_24D1AD848(a1, v20);
  }
LABEL_13:
  sub_24D1AC9D0(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24D1AC9D0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for ClientConnection(0);
  uint64_t result = sub_24D1AB338(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_24D1ACA68()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ClientConnection(0);
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985AF30);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24D1B2460();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)(v28 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v29 + 72) * v16;
    sub_24D1AB2D0(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    unint64_t v22 = (void *)(*(void *)(v7 + 48) + v17);
    *unint64_t v22 = v19;
    v22[1] = v20;
    sub_24D1AB338((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v27;
    goto LABEL_25;
  }
  unint64_t v24 = *(void *)(v28 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)(v28 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24D1ACCD4(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v26 = a2;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AF38);
  MEMORY[0x270FA5388](v25);
  uint64_t v4 = (uint64_t *)((char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v23 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v24 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v24) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v23 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v24) {
        return swift_release();
      }
      unint64_t v20 = *(void *)(v23 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v24) {
          return swift_release();
        }
        unint64_t v20 = *(void *)(v23 + 8 * v10);
        if (!v20)
        {
          int64_t v10 = v19 + 3;
          if (v19 + 3 >= v24) {
            return swift_release();
          }
          unint64_t v20 = *(void *)(v23 + 8 * v10);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v12 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = *(void *)(a1 + 56);
    int64_t v14 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = v13 + *(void *)(*(void *)(type metadata accessor for ClientConnection(0) - 8) + 72) * v12;
    uint64_t v18 = (uint64_t)v4 + *(int *)(v25 + 48);
    sub_24D1AB2D0(v17, v18);
    void *v4 = v15;
    v4[1] = v16;
    swift_bridgeObjectRetain();
    v26(v15, v16, v18);
    uint64_t result = sub_24D1AD8B4((uint64_t)v4, &qword_26985AF38);
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v24) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v23 + 8 * v21);
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
    if (v10 >= v24) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v23 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_24D1ACF38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(void, void))
{
  uint64_t v55 = a3;
  uint64_t v56 = a4;
  uint64_t v54 = a2;
  uint64_t v7 = (void *)type metadata accessor for ClientConnection(0);
  uint64_t v8 = *(v7 - 1);
  id v52 = v7;
  uint64_t v53 = v8;
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v51 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (id *)((char *)&v51 - v14);
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  v58 = (uint64_t *)((char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v59 = a5;
  uint64_t v16 = sub_24D1B20B0();
  uint64_t v57 = __swift_project_value_buffer(v16, (uint64_t)qword_26B18A2B8);
  uint64_t v17 = sub_24D1B20A0();
  os_log_type_t v18 = sub_24D1B22F0();
  if (os_log_type_enabled(v17, v18))
  {
    int64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v19 = 0;
    _os_log_impl(&dword_24D1A1000, v17, v18, "EncoreService: register new connection", v19, 2u);
    MEMORY[0x253321860](v19, -1, -1);
  }

  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08D68]), sel_initWithListenerEndpoint_, a1);
  id v21 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FF7A9C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AFF0);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_24D1B2E90;
  uint64_t v23 = type metadata accessor for EncoreEvent();
  *(void *)(v22 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AEA0);
  *(void *)(v22 + 32) = v23;
  id v24 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  uint64_t v25 = (void *)sub_24D1B21E0();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(v24, sel_initWithArray_, v25);

  uint64_t aBlock = 0;
  sub_24D1B22D0();
  if (aBlock)
  {

    uint64_t v27 = (void *)sub_24D1B22C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setClasses_forSelector_argumentIndex_ofReply_, v27, sel_handleEventWithEvent_, 0, 0);

    objc_msgSend(v20, sel_setRemoteObjectInterface_, v21);
    objc_msgSend(v20, sel_resume);
    id v28 = objc_msgSend(v20, sel_remoteObjectProxy);
    sub_24D1B23A0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AEA8);
    if (swift_dynamicCast())
    {
      id v51 = v21;
      swift_unknownObjectRelease();
      uint64_t v29 = v55;
      swift_bridgeObjectRetain();
      id v30 = v20;
      id v52 = v30;
      sub_24D1B2050();
      *uint64_t v15 = v54;
      v15[1] = v29;
      void v15[2] = v30;
      sub_24D1AB2D0((uint64_t)v15, (uint64_t)v13);
      unint64_t v31 = (*(unsigned __int8 *)(v53 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
      unint64_t v32 = (v9 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v33 = swift_allocObject();
      sub_24D1AB338((uint64_t)v13, v33 + v31);
      char v34 = v56;
      *(void *)(v33 + v32) = v56;
      uint64_t v64 = sub_24D1AB39C;
      uint64_t v65 = v33;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v61 = 1107296256;
      uint64_t v62 = sub_24D1A8AA4;
      uint64_t v63 = &block_descriptor_45;
      unint64_t v35 = _Block_copy(&aBlock);
      id v36 = v34;
      swift_release();
      id v37 = v52;
      objc_msgSend(v52, sel_setInterruptionHandler_, v35);
      _Block_release(v35);
      sub_24D1AB2D0((uint64_t)v15, (uint64_t)v13);
      uint64_t v38 = swift_allocObject();
      sub_24D1AB338((uint64_t)v13, v38 + v31);
      *(void *)(v38 + v32) = v36;
      uint64_t v64 = sub_24D1AB4BC;
      uint64_t v65 = v38;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v61 = 1107296256;
      uint64_t v62 = sub_24D1A8AA4;
      uint64_t v63 = &block_descriptor_52;
      uint64_t v39 = _Block_copy(&aBlock);
      id v40 = v36;
      uint64_t v41 = (uint64_t)v15;
      swift_release();
      objc_msgSend(v37, sel_setInvalidationHandler_, v39);
      _Block_release(v39);
      uint64_t v42 = v58;
      sub_24D1AB2D0((uint64_t)v15, (uint64_t)v58);
      int v43 = sub_24D1B20A0();
      os_log_type_t v44 = sub_24D1B22F0();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v57 = (uint64_t)v40;
        unint64_t v45 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        uint64_t aBlock = v46;
        *(_DWORD *)unint64_t v45 = 136315138;
        uint64_t v47 = *v42;
        unint64_t v48 = v42[1];
        swift_bridgeObjectRetain();
        uint64_t v49 = v47;
        uint64_t v41 = (uint64_t)v15;
        uint64_t v66 = sub_24D1A4290(v49, v48, &aBlock);
        id v37 = v52;
        sub_24D1B2380();
        swift_bridgeObjectRelease();
        sub_24D1AB558((uint64_t)v42);
        _os_log_impl(&dword_24D1A1000, v43, v44, "EncoreService: registered new client %s", v45, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253321860](v46, -1, -1);
        MEMORY[0x253321860](v45, -1, -1);
      }
      else
      {
        sub_24D1AB558((uint64_t)v42);
      }

      uint64_t v50 = v59;
      sub_24D1AA980(v41);
      v50[2](v50, 1);

      sub_24D1AB558(v41);
    }
    else
    {
      v59[2](v59, 0);
    }
  }
  else
  {
    _Block_release(v59);
    __break(1u);
  }
}

uint64_t sub_24D1AD67C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D1AD6B4(uint64_t a1)
{
  return sub_24D1ADC64(a1, *(void *)(v1 + 16));
}

uint64_t objectdestroy_34Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for ClientConnection(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_24D1B2060();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24D1AD7BC()
{
  return sub_24D1AD7D4((uint64_t (*)(uint64_t))sub_24D1AA9A8);
}

uint64_t sub_24D1AD7D4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for ClientConnection(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_24D1AD848(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ClientConnection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D1AD8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24D1A9148(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_24D1AD8B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24D1AD910()
{
  unint64_t result = qword_26B18A200;
  if (!qword_26B18A200)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B18A200);
  }
  return result;
}

uint64_t sub_24D1AD950(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24D1AD998(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24D1AD9E8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24D1ADA44(uint64_t a1)
{
  return a1;
}

void sub_24D1ADAC8()
{
  unk_26B18A145 = 0;
  unk_26B18A146 = -5120;
}

uint64_t sub_24D1ADAF4()
{
  uint64_t v0 = sub_24D1B20B0();
  __swift_allocate_value_buffer(v0, qword_26B18A2B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B18A2B8);
  sub_24D1ADC24();
  if (qword_26B18A130 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_24D1B2360();
  return sub_24D1B20C0();
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

unint64_t sub_24D1ADC24()
{
  unint64_t result = qword_26B18A208;
  if (!qword_26B18A208)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B18A208);
  }
  return result;
}

uint64_t sub_24D1ADC64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

unint64_t static SnippetService.DirectInvocationIdentifier.getter()
{
  return 0xD000000000000025;
}

unint64_t static SnippetService.EventDataKey.getter()
{
  return 0xD000000000000011;
}

uint64_t SnippetService.serviceName.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName + 8);
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

char *sub_24D1ADCCC(uint64_t *a1, id *a2)
{
  uint64_t v4 = &v2[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v2[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_encore] = 0;
  *(void *)&v2[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_connection] = 0;
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = &v2[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  *(void *)uint64_t v7 = *a1;
  *((void *)v7 + 1) = v5;
  v31.receiver = v2;
  v31.super_class = (Class)type metadata accessor for SnippetService();
  swift_bridgeObjectRetain();
  uint64_t v8 = (char *)objc_msgSendSuper2(&v31, sel_init);
  uint64_t v9 = v8;
  id v10 = *a2;
  if (*a2)
  {
    uint64_t v11 = v8;
  }
  else
  {
    id v12 = objc_allocWithZone(MEMORY[0x263F08D68]);
    uint64_t v13 = v9;
    uint64_t v14 = (void *)sub_24D1B2150();
    id v10 = objc_msgSend(v12, sel_initWithMachServiceName_options_, v14, 0);

    *a2 = v10;
    if (!v10) {
      goto LABEL_5;
    }
  }
  id v15 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FF7AAB8);
  objc_msgSend(v10, sel_setRemoteObjectInterface_, v15);

  objc_msgSend(v10, sel_resume);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v6;
  *(void *)(v16 + 24) = v5;
  uint64_t v29 = sub_24D1B0384;
  uint64_t v30 = v16;
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_24D1A8AA4;
  id v28 = &block_descriptor_39;
  uint64_t v17 = _Block_copy(&v25);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v10, sel_setInvalidationHandler_, v17);
  _Block_release(v17);
  id v10 = *a2;
LABEL_5:
  if (v10)
  {
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v6;
    *(void *)(v18 + 24) = v5;
    uint64_t v29 = sub_24D1B03A8;
    uint64_t v30 = v18;
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 1107296256;
    uint64_t v27 = sub_24D1A8AA4;
    id v28 = &block_descriptor_45_0;
    int64_t v19 = _Block_copy(&v25);
    swift_release();
    objc_msgSend(v10, sel_setInterruptionHandler_, v19);

    _Block_release(v19);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v20 = *a2;
  id v21 = (void **)&v9[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_connection];
  swift_beginAccess();
  uint64_t v22 = *v21;
  *id v21 = v20;
  id v23 = v20;

  return v9;
}

void sub_24D1ADFD8(uint64_t a1, unint64_t a2, const char *a3)
{
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24D1B20B0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B18A2B8);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_24D1B20A0();
  os_log_type_t v8 = sub_24D1B22E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_24D1A4290(a1, a2, &v11);
    sub_24D1B2380();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24D1A1000, v7, v8, a3, v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253321860](v10, -1, -1);
    MEMORY[0x253321860](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

char *SnippetService.__allocating_init(serviceName:)(uint64_t *a1)
{
  uint64_t v1 = *a1;
  v5[1] = a1[1];
  id v6 = 0;
  v5[0] = v1;
  id v2 = objc_allocWithZone((Class)type metadata accessor for SnippetService());
  uint64_t v3 = sub_24D1ADCCC(v5, &v6);

  return v3;
}

uint64_t type metadata accessor for SnippetService()
{
  uint64_t result = qword_26985AFD8;
  if (!qword_26985AFD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24D1AE230(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_24D1AE284()
{
  *(void *)(v1 + 48) = v0;
  return MEMORY[0x270FA2498](sub_24D1AE2A4, 0, 0);
}

uint64_t sub_24D1AE2A4()
{
  uint64_t v1 = *(void *)(v0 + 48) + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_connection;
  swift_beginAccess();
  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  void *v2 = v0;
  v2[1] = sub_24D1AE374;
  uint64_t v3 = *(void *)(v0 + 48);
  v2[13] = v1;
  v2[14] = v3;
  return MEMORY[0x270FA2498](sub_24D1AE6FC, 0, 0);
}

uint64_t sub_24D1AE374(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_24D1AE4CC, 0, 0);
  }
  else
  {
    swift_endAccess();
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5(a1 & 1);
  }
}

uint64_t sub_24D1AE4CC()
{
  swift_endAccess();
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = sub_24D1B20B0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B18A2B8);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24D1B20A0();
  os_log_type_t v6 = sub_24D1B2300();
  BOOL v7 = os_log_type_enabled(v5, v6);
  os_log_type_t v8 = (void *)v0[8];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v12;
    sub_24D1B2380();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_24D1A1000, v5, v6, "SnippetService register failed %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AE78);
    swift_arrayDestroy();
    MEMORY[0x253321860](v10, -1, -1);
    MEMORY[0x253321860](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13(0);
}

uint64_t sub_24D1AE6DC(uint64_t a1)
{
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = v1;
  return MEMORY[0x270FA2498](sub_24D1AE6FC, 0, 0);
}

uint64_t sub_24D1AE6FC()
{
  uint64_t v1 = (void **)v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985B000);
  uint64_t v2 = swift_allocBox();
  uint64_t v4 = v3;
  v0[15] = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985B008);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  os_log_type_t v6 = *v1;
  if (*v1)
  {
    v0[6] = sub_24D1B0138;
    v0[7] = v2;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_24D1AED0C;
    v0[5] = &block_descriptor_0;
    BOOL v7 = _Block_copy(v0 + 2);
    swift_retain();
    swift_release();
    id v8 = objc_msgSend(v6, sel_remoteObjectProxyWithErrorHandler_, v7);
    _Block_release(v7);
    sub_24D1B23A0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985B010);
    int v9 = swift_dynamicCast();
    uint64_t v10 = v0[12];
    if (!v9) {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v0[14];
  *(void *)(v11 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_encore) = v10;
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(self, sel_anonymousListener);
  v0[16] = v12;
  objc_msgSend(v12, sel_setDelegate_, v11);
  objc_msgSend(v12, sel_resume);
  uint64_t v13 = (void *)swift_task_alloc();
  v0[17] = v13;
  v13[2] = v4;
  v13[3] = v11;
  v13[4] = v12;
  uint64_t v14 = (void *)swift_task_alloc();
  v0[18] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_24D1AE9CC;
  uint64_t v15 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2360](v0 + 20, 0, 0, 0xD000000000000015, 0x800000024D1B4F10, sub_24D1B0158, v13, v15);
}

uint64_t sub_24D1AE9CC()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24D1AEB58;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24D1AEAE8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24D1AEAE8()
{
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 160);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24D1AEB58()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24D1AEBD4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985B008);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = &v6[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = swift_projectBox();
  swift_beginAccess();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v4, 1, v0);
  if (!result)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
    v6[7] = 0;
    sub_24D1B2200();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return result;
}

void sub_24D1AED0C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_24D1AED74(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v21 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985B008);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985B000);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v13(v12, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v12, 0, 1, v7);
  swift_beginAccess();
  sub_24D1B0164((uint64_t)v12, a2);
  id v14 = objc_msgSend(a4, sel_endpoint);
  v13((char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v16 + v15, (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  uint64_t v17 = *(void **)(v21 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_encore);
  if (v17)
  {
    swift_unknownObjectRetain();
    uint64_t v18 = (void *)sub_24D1B2150();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = sub_24D1B0260;
    *(void *)(v19 + 24) = v16;
    aBlock[4] = sub_24D1B0324;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24D1AE230;
    aBlock[3] = &block_descriptor_33;
    id v20 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v17, sel_registerWithClient_name_with_, v14, v18, v20);
    _Block_release(v20);
    swift_release();

    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24D1AF080()
{
  return sub_24D1AFB88();
}

uint64_t sub_24D1AF0E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24D1B20B0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B18A2B8);
  uint64_t v7 = sub_24D1B20A0();
  os_log_type_t v8 = sub_24D1B22E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_24D1A1000, v7, v8, "SnippetService: subscribe", v9, 2u);
    MEMORY[0x253321860](v9, -1, -1);
  }

  uint64_t v10 = (void *)(v3 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler);
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler);
  *uint64_t v10 = a1;
  v10[1] = a2;
  swift_retain();
  return sub_24D1AB200(v11);
}

uint64_t sub_24D1AF294(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B18A1C0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1D0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AE80);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24D1B20B0();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B18A2B8);
  id v15 = a1;
  uint64_t v16 = sub_24D1B20A0();
  os_log_type_t v17 = sub_24D1B22E0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v33 = v2;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v34 = v4;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v30 = (void *)swift_slowAlloc();
    objc_super v31 = v19;
    unint64_t v32 = v7;
    *(_DWORD *)uint64_t v19 = 138412290;
    id v36 = v15;
    id v20 = v15;
    uint64_t v7 = v32;
    sub_24D1B2380();
    uint64_t v21 = v30;
    *uint64_t v30 = v15;

    uint64_t v2 = v33;
    uint64_t v22 = v31;
    _os_log_impl(&dword_24D1A1000, v16, v17, "SnippetService: handleEvent%@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AE78);
    swift_arrayDestroy();
    MEMORY[0x253321860](v21, -1, -1);
    uint64_t v4 = v34;
    MEMORY[0x253321860](v22, -1, -1);
  }
  else
  {
  }
  id v23 = *(void (**)(id))(v2 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler);
  if (v23)
  {
    swift_retain();
    v23(v15);
    sub_24D1AB200((uint64_t)v23);
  }
  uint64_t v24 = v2 + OBJC_IVAR____TtC16EncoreXPCService12AsyncService_continuation;
  swift_beginAccess();
  sub_24D1AB210(v24, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_24D1AD8B4((uint64_t)v10, &qword_26B18A1D0);
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AE90);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v13, 1, 1, v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_24D1AD8B4((uint64_t)v10, &qword_26B18A1D0);
    id v35 = v15;
    id v26 = v15;
    sub_24D1B2250();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AE90);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v13, 0, 1, v27);
  }
  return sub_24D1AD8B4((uint64_t)v13, (uint64_t *)&unk_26985AE80);
}

id sub_24D1AF770(void *a1)
{
  return sub_24D1AF800(a1, "SnippetService: publish %@", (SEL *)&selRef_handleEventWithEvent_);
}

id sub_24D1AF7EC(void *a1)
{
  return sub_24D1AF800(a1, "SnippetService: echo %@", (SEL *)&selRef_echoWithEvent_);
}

id sub_24D1AF800(void *a1, char *a2, SEL *a3)
{
  uint64_t v6 = v3;
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24D1B20B0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B18A2B8);
  id v9 = a1;
  uint64_t v10 = sub_24D1B20A0();
  os_log_type_t v11 = sub_24D1B22E0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    format = a2;
    uint64_t v14 = v6;
    id v15 = v9;
    sub_24D1B2380();
    *uint64_t v13 = v9;

    uint64_t v6 = v14;
    _os_log_impl(&dword_24D1A1000, v10, v11, format, v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985AE78);
    swift_arrayDestroy();
    MEMORY[0x253321860](v13, -1, -1);
    MEMORY[0x253321860](v12, -1, -1);
  }
  else
  {
  }
  id result = *(id *)(v6 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_encore);
  if (result) {
    return objc_msgSend(result, *a3, v9);
  }
  __break(1u);
  return result;
}

void sub_24D1AFA74()
{
  swift_bridgeObjectRelease();
  sub_24D1AB200(*(void *)(v0 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler));
  swift_unknownObjectRelease();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_connection);
}

id SnippetService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D1AFB88()
{
  objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FF7A9C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985AFF0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_24D1B2E90;
  uint64_t v1 = type metadata accessor for EncoreEvent();
  *(void *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_26985AEA0);
  *(void *)(v0 + 32) = v1;
  id v2 = objc_allocWithZone(MEMORY[0x263EFFA08]);
  uint64_t v3 = (void *)sub_24D1B21E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_initWithArray_, v3);

  uint64_t result = sub_24D1B22D0();
  __break(1u);
  return result;
}

uint64_t sub_24D1AFD40()
{
  return type metadata accessor for SnippetService();
}

uint64_t sub_24D1AFD48()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for SnippetService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnippetService);
}

uint64_t dispatch thunk of SnippetService.register()()
{
  id v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x118);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_24D1AFEC4;
  return v5();
}

uint64_t sub_24D1AFEC4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of SnippetService.listener(_:shouldAcceptNewConnection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SnippetService.subscribe(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SnippetService.handleEvent(event:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SnippetService.publish(event:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SnippetService.echo(event:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t sub_24D1B00EC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24D1B0124()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_24D1B0138()
{
  return sub_24D1AEBD4();
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

void sub_24D1B0158(uint64_t a1)
{
  sub_24D1AED74(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_24D1B0164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985B000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D1B01CC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985B008);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24D1B0260()
{
  return sub_24D1B2200();
}

uint64_t sub_24D1B02EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24D1B0324()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24D1B034C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24D1B0384()
{
  sub_24D1ADFD8(*(void *)(v0 + 16), *(void *)(v0 + 24), "Snippet Connection Invalidation on Service %s");
}

void sub_24D1B03A8()
{
  sub_24D1ADFD8(*(void *)(v0 + 16), *(void *)(v0 + 24), "Snippet Connection Interruption on Service %s");
}

void SynchronizableObject.publish(change:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_24D1B2090();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v26[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v27[3] = AssociatedTypeWitness;
  v27[4] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v27);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, a1, AssociatedTypeWitness);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 64);
  uint64_t v25 = v3;
  uint64_t v14 = (char *)v13(a2, a3);
  uint64_t v16 = *(void *)&v14[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  uint64_t v15 = *(void *)&v14[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName + 8];
  swift_bridgeObjectRetain();

  v26[0] = v16;
  v26[1] = v15;
  sub_24D1B2080();
  uint64_t v17 = sub_24D1B2070();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v20 = objc_allocWithZone((Class)type metadata accessor for EncoreEvent());
  uint64_t v21 = v27[6];
  uint64_t v22 = EncoreEvent.init(value:serviceName:id:)(v27, v26, v17, v19);
  if (!v21)
  {
    id v23 = v22;
    uint64_t v24 = (void *)v13(a2, a3);
    sub_24D1AF770(v23);
  }
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

uint64_t SynchronizableObject.registerAndListenForChanges(handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985B020);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4))
  {
    if (qword_26B18A190 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24D1B20B0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B18A2B8);
    uint64_t v14 = sub_24D1B20A0();
    os_log_type_t v15 = sub_24D1B22F0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_24D1A1000, v14, v15, "#SynchronizableObject: Cancelling existing subscription before updating.", v16, 2u);
      MEMORY[0x253321860](v16, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_26985B038);
    sub_24D1B22A0();
    swift_release();
  }
  uint64_t v17 = sub_24D1B2240();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v12, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = a3;
  v18[5] = a4;
  v18[6] = v5;
  v18[7] = a1;
  v18[8] = a2;
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v19 = sub_24D1B1AB4((uint64_t)v12, (uint64_t)&unk_26985B030, (uint64_t)v18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 48))(v19, a3, a4);
}

uint64_t sub_24D1B08D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[15] = a7;
  v8[16] = a8;
  v8[13] = a5;
  v8[14] = a6;
  v8[12] = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[17] = AssociatedTypeWitness;
  v8[18] = *(void *)(AssociatedTypeWitness - 8);
  v8[19] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B18A1E0);
  v8[20] = v10;
  v8[21] = *(void *)(v10 - 8);
  v8[22] = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26985B040);
  v8[23] = v11;
  v8[24] = *(void *)(v11 - 8);
  v8[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24D1B0A74, 0, 0);
}

uint64_t sub_24D1B0A74()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 64);
  v0[26] = v3;
  v0[27] = (v1 + 64) & 0xFFFFFFFFFFFFLL | 0xE179000000000000;
  uint64_t v4 = (char *)v3(v2, v1);
  uint64_t v5 = &v4[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  v0[28] = *(void *)&v4[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  v0[29] = *((void *)v5 + 1);
  swift_bridgeObjectRetain();

  v0[30] = v3(v2, v1);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[31] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24D1B0B88;
  return sub_24D1AE284();
}

uint64_t sub_24D1B0B88(char a1)
{
  uint64_t v2 = *(void **)(*(void *)v1 + 240);
  *(unsigned char *)(*(void *)v1 + 304) = a1;
  swift_task_dealloc();

  return MEMORY[0x270FA2498](sub_24D1B0CA4, 0, 0);
}

uint64_t sub_24D1B0CA4()
{
  uint64_t v27 = v0;
  if (*(unsigned char *)(v0 + 304) == 1)
  {
    if (qword_26B18A190 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_24D1B20B0();
    *(void *)(v0 + 256) = __swift_project_value_buffer(v1, (uint64_t)qword_26B18A2B8);
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24D1B20A0();
    os_log_type_t v3 = sub_24D1B22F0();
    BOOL v4 = os_log_type_enabled(v2, v3);
    unint64_t v5 = *(void *)(v0 + 232);
    if (v4)
    {
      uint64_t v6 = *(void *)(v0 + 224);
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v26 = v8;
      *(_DWORD *)uint64_t v7 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 88) = sub_24D1A4290(v6, v5, &v26);
      sub_24D1B2380();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24D1A1000, v2, v3, "#SynchronizableObject: Registered SceneHost: %{public}s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253321860](v8, -1, -1);
      MEMORY[0x253321860](v7, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v18 = *(void *)(v0 + 168);
    uint64_t v17 = *(void *)(v0 + 176);
    uint64_t v19 = *(void *)(v0 + 160);
    id v20 = (char *)(*(uint64_t (**)(void, void))(v0 + 208))(*(void *)(v0 + 120), *(void *)(v0 + 128));
    uint64_t v21 = &v20[OBJC_IVAR____TtC16EncoreXPCService12AsyncService_events];
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 16))(v17, v21, v19);

    sub_24D1B2260();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    *(void *)(v0 + 264) = 0;
    uint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v22;
    *uint64_t v22 = v0;
    v22[1] = sub_24D1B114C;
    uint64_t v23 = *(void *)(v0 + 184);
    return MEMORY[0x270FA1F68](v0 + 72, 0, 0, v23);
  }
  else
  {
    if (qword_26B18A190 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_24D1B20B0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B18A2B8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24D1B20A0();
    os_log_type_t v11 = sub_24D1B2300();
    BOOL v12 = os_log_type_enabled(v10, v11);
    unint64_t v13 = *(void *)(v0 + 232);
    if (v12)
    {
      uint64_t v14 = *(void *)(v0 + 224);
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v26 = v16;
      *(_DWORD *)os_log_type_t v15 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 64) = sub_24D1A4290(v14, v13, &v26);
      sub_24D1B2380();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24D1A1000, v10, v11, "#SynchronizableObject: Failed to register SceneHost: %{public}s. Please check logs for SnippetService.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253321860](v16, -1, -1);
      MEMORY[0x253321860](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
}

uint64_t sub_24D1B114C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24D1B1248, 0, 0);
}

uint64_t sub_24D1B1248()
{
  uint64_t v19 = v0;
  uint64_t v1 = (char *)v0[9];
  v0[35] = v1;
  if (!v1)
  {
    (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    BOOL v12 = (uint64_t (*)(void))v0[1];
LABEL_17:
    return v12();
  }
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t))v0[26];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v6 = *(void *)&v1[OBJC_IVAR___EncoreEvent_serviceName];
  uint64_t v5 = *(void *)&v1[OBJC_IVAR___EncoreEvent_serviceName + 8];
  swift_bridgeObjectRetain();
  uint64_t v7 = (char *)v2(v4, v3);
  uint64_t v9 = *(void *)&v7[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  uint64_t v8 = *(void *)&v7[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName + 8];
  swift_bridgeObjectRetain();

  if (!v5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (v6 != v9 || v5 != v8)
  {
    char v11 = sub_24D1B24E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_15;
    }
LABEL_11:

    v0[33] = v0[33];
    unint64_t v13 = (void *)swift_task_alloc();
    v0[34] = v13;
    *unint64_t v13 = v0;
    v13[1] = sub_24D1B114C;
    uint64_t v14 = v0[23];
    return MEMORY[0x270FA1F68](v0 + 9, 0, 0, v14);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_15:
  uint64_t v15 = v0[33];
  sub_24D1B22B0();
  if (v15)
  {
    (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    BOOL v12 = (uint64_t (*)(void))v0[1];
    goto LABEL_17;
  }
  swift_getAssociatedConformanceWitness();
  sub_24D1A6354();
  v0[36] = 0;
  sub_24D1B2220();
  v0[37] = sub_24D1B2210();
  uint64_t v17 = sub_24D1B21F0();
  return MEMORY[0x270FA2498](sub_24D1B1734, v17, v16);
}

uint64_t sub_24D1B1734()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + 104);
  swift_release();
  v2(v1);
  return MEMORY[0x270FA2498](sub_24D1B17B8, 0, 0);
}

uint64_t sub_24D1B17B8()
{
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 136);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(void *)(v0 + 264) = *(void *)(v0 + 288);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v4;
  void *v4 = v0;
  v4[1] = sub_24D1B114C;
  uint64_t v5 = *(void *)(v0 + 184);
  return MEMORY[0x270FA1F68](v0 + 72, 0, 0, v5);
}

uint64_t sub_24D1B189C()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24D1B18E4(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  char v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *char v11 = v2;
  v11[1] = sub_24D1B19C0;
  return sub_24D1B08D4(a1, v6, v7, v8, v9, v10, v4, v5);
}

uint64_t sub_24D1B19C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24D1B1AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24D1B2240();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24D1B2230();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24D1B1F60(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24D1B21F0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SynchronizableObject.publishViewDisappeared()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v25 = sub_24D1B2090();
  uint64_t v4 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B18A190 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24D1B20B0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B18A2B8);
  uint64_t v8 = sub_24D1B20A0();
  os_log_type_t v9 = sub_24D1B22F0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_24D1A1000, v8, v9, "#SynchronizableObject: Publishing that view will disappear and marking as cancelled", v10, 2u);
    MEMORY[0x253321860](v10, -1, -1);
  }

  if ((*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v3, v2))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26985B038);
    sub_24D1B22A0();
    swift_release();
  }
  v27[3] = &type metadata for SystemEvents;
  v27[4] = sub_24D1A78A8();
  LOBYTE(v27[0]) = 0;
  char v11 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 64);
  BOOL v12 = (char *)v11(v3, v2);
  uint64_t v24 = v3;
  uint64_t v14 = *(void *)&v12[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName];
  uint64_t v13 = *(void *)&v12[OBJC_IVAR____TtC16EncoreXPCService14SnippetService_serviceName + 8];
  swift_bridgeObjectRetain();

  v26[0] = v14;
  v26[1] = v13;
  sub_24D1B2080();
  uint64_t v15 = sub_24D1B2070();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v25);
  id v18 = objc_allocWithZone((Class)type metadata accessor for EncoreEvent());
  uint64_t v19 = v27[6];
  uint64_t v20 = EncoreEvent.init(value:serviceName:id:)(v27, v26, v15, v17);
  if (!v19)
  {
    uint64_t v21 = v20;
    uint64_t v22 = (void *)v11(v24, v2);
    sub_24D1AF770(v21);
  }
}

uint64_t dispatch thunk of SynchronizableObject.subscription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SynchronizableObject.subscription.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SynchronizableObject.subscription.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of SynchronizableObject.snippetService.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_24D1B1F60(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985B020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24D1B1FC0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24D1B1FD0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24D1B1FE0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24D1B1FF0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24D1B2000()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24D1B2010()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24D1B2020()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24D1B2030()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24D1B2040()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24D1B2050()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_24D1B2060()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24D1B2070()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24D1B2080()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24D1B2090()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24D1B20A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24D1B20B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24D1B20C0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_24D1B20D0()
{
  return MEMORY[0x270EE3C18]();
}

uint64_t sub_24D1B20E0()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_24D1B20F0()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_24D1B2100()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24D1B2110()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24D1B2120()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_24D1B2130()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24D1B2140()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24D1B2150()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24D1B2160()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24D1B2170()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_24D1B2180()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24D1B2190()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24D1B21A0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24D1B21B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24D1B21C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24D1B21D0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24D1B21E0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24D1B21F0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24D1B2200()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24D1B2210()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24D1B2220()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24D1B2230()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24D1B2240()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24D1B2250()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24D1B2260()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24D1B2280()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_24D1B2290()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_24D1B22A0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24D1B22B0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24D1B22C0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24D1B22D0()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_24D1B22E0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24D1B22F0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24D1B2300()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24D1B2310()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24D1B2320()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24D1B2330()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24D1B2340()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24D1B2350()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_24D1B2360()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24D1B2370()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24D1B2380()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24D1B2390()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24D1B23A0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24D1B23B0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24D1B23C0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24D1B23D0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24D1B23E0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24D1B23F0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24D1B2400()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24D1B2410()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24D1B2420()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24D1B2430()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24D1B2440()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24D1B2450()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24D1B2460()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24D1B2470()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24D1B2480()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24D1B2490()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24D1B24A0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24D1B24B0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24D1B24C0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24D1B24D0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24D1B24E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24D1B2500()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24D1B2510()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24D1B2520()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24D1B2530()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24D1B2540()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24D1B2550()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24D1B2560()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24D1B2590()
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA04E0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}