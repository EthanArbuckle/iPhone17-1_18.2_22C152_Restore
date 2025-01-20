uint64_t sub_247A71D9C()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t encodeXPCValues<each A>(_:)(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v32[0] = a3;
  v32[1] = a4;
  v5 = (uint64_t *)TupleTypeMetadata;
  v6 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v7 = *v6;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata, a2);
    v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v10 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v9 - (char *)v6) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v10 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      v11 = (long long *)(v6 + 2);
      v12 = v9 + 16;
      unint64_t v13 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v14 = *v11;
        *(v12 - 1) = *(v11 - 1);
        _OWORD *v12 = v14;
        v11 += 2;
        v12 += 2;
        v13 -= 4;
      }
      while (v13);
      if (v10 != a2)
      {
LABEL_9:
        unint64_t v15 = a2 - v10;
        uint64_t v16 = v10;
        v17 = &v9[8 * v10];
        v18 = &v6[v16];
        do
        {
          uint64_t v19 = *v18++;
          *(void *)v17 = v19;
          v17 += 8;
          --v15;
        }
        while (v15);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v7 = TupleTypeMetadata;
  }
  uint64_t v20 = *(void *)(v7 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x270FA5388](TupleTypeMetadata, a2);
  if (a2)
  {
    v22 = (int *)(v7 + 32);
    unint64_t v23 = a2;
    do
    {
      if (a2 == 1) {
        int v24 = 0;
      }
      else {
        int v24 = *v22;
      }
      uint64_t v26 = *v6++;
      uint64_t v25 = v26;
      uint64_t v27 = *v5++;
      (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 16))((char *)v32 + v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v27);
      v22 += 4;
      --v23;
    }
    while (v23);
  }
  unint64_t v28 = (*(unsigned __int8 *)(v20 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v29 = (char *)swift_allocObject();
  *((void *)v29 + 2) = a2;
  *((void *)v29 + 3) = swift_allocateMetadataPack();
  *((void *)v29 + 4) = swift_allocateWitnessTablePack();
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(&v29[v28], (char *)v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_247A87190();
  swift_allocObject();
  sub_247A87180();
  v32[2] = sub_247A724D8;
  v32[3] = v29;
  sub_247A7262C();
  uint64_t v30 = sub_247A87170();
  swift_release();
  swift_release();
  return v30;
}

uint64_t sub_247A72090(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = 8 * a3;
  uint64_t v7 = (void *)((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v10 = (uint64_t *)((char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v11)
  {
    v12 = v7;
    uint64_t v39 = v9;
    uint64_t v41 = v3;
    uint64_t v13 = 0;
    long long v14 = (char *)(v8 & 0xFFFFFFFFFFFFFFFELL);
    v45 = (uint64_t *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 16);
    do
    {
      if (a3 == 1)
      {
        int v15 = 0;
      }
      else
      {
        ((void (*)(void))MEMORY[0x270FA5388])();
        uint64_t v16 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
        unint64_t v17 = 0;
        if (a3 < 4) {
          goto LABEL_11;
        }
        if ((unint64_t)(v16 - v14) < 0x20) {
          goto LABEL_11;
        }
        v18 = v16 + 16;
        unint64_t v19 = a3 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v20 = (long long *)v45;
        do
        {
          long long v21 = *v20;
          *(v18 - 1) = *(v20 - 1);
          _OWORD *v18 = v21;
          v20 += 2;
          v18 += 2;
          v19 -= 4;
        }
        while (v19);
        unint64_t v17 = a3 & 0xFFFFFFFFFFFFFFFCLL;
        if ((a3 & 0xFFFFFFFFFFFFFFFCLL) != a3)
        {
LABEL_11:
          unint64_t v22 = a3 - v17;
          uint64_t v23 = 8 * v17;
          int v24 = &v16[8 * v17];
          uint64_t v25 = &v14[v23];
          do
          {
            uint64_t v26 = *(void *)v25;
            v25 += 8;
            *(void *)int v24 = v26;
            v24 += 8;
            --v22;
          }
          while (v22);
        }
        int v15 = *(_DWORD *)(swift_getTupleTypeMetadata() + 16 * v13 + 32);
      }
      v10[v13++] = a2 + v15;
    }
    while (v13 != a3);
    unint64_t v40 = a3;
    __swift_project_boxed_opaque_existential_1(v12, v12[3]);
    uint64_t v27 = sub_247A875D0();
    unint64_t v28 = v39 & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v29 = v41;
    do
    {
      v45 = &v39;
      uint64_t v30 = *(void *)v14;
      uint64_t v31 = *v10;
      uint64_t v32 = *(void *)(*(void *)v14 - 8);
      v33 = v14;
      v34 = v10;
      uint64_t v35 = v32;
      MEMORY[0x270FA5388](v27, v31);
      v37 = (char *)&v39 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v35 + 16))(v37);
      uint64_t v41 = v44;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, v43);
      sub_247A874D0();
      uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v37, v30);
      if (v29) {
        break;
      }
      unint64_t v10 = v34 + 1;
      v28 += 8;
      long long v14 = v33 + 8;
      --v40;
    }
    while (v40);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    sub_247A875D0();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v42);
}

uint64_t sub_247A72390(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2 == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1, v2);
    uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v4)
    {
      unint64_t v8 = 0;
      if (v4 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v7[-v5] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v8 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v9 = (long long *)(v5 + 16);
      unint64_t v10 = v7 + 16;
      unint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v12 = *v9;
        *(v10 - 1) = *(v9 - 1);
        *unint64_t v10 = v12;
        v9 += 2;
        v10 += 2;
        v11 -= 4;
      }
      while (v11);
      if (v4 != v8)
      {
LABEL_9:
        unint64_t v13 = v4 - v8;
        uint64_t v14 = 8 * v8;
        int v15 = &v7[8 * v8];
        uint64_t v16 = (uint64_t *)(v5 + v14);
        do
        {
          uint64_t v17 = *v16++;
          *(void *)int v15 = v17;
          v15 += 8;
          --v13;
        }
        while (v13);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  (*(void (**)(unint64_t))(*(void *)(TupleTypeMetadata - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(void *)(TupleTypeMetadata - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(TupleTypeMetadata - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_247A724D8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(v2 + 16);
  if (v4 == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(*(void *)(v2 + 24) & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x270FA5388](a1, a2);
    unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v4)
    {
      unint64_t v9 = 0;
      if (v4 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v8[-v6] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v10 = (long long *)(v6 + 16);
      unint64_t v11 = v8 + 16;
      unint64_t v12 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        _OWORD *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v4 != v9)
      {
LABEL_9:
        unint64_t v14 = v4 - v9;
        uint64_t v15 = 8 * v9;
        uint64_t v16 = &v8[8 * v9];
        uint64_t v17 = (uint64_t *)(v6 + v15);
        do
        {
          uint64_t v18 = *v17++;
          *(void *)uint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return sub_247A72090(a1, v2+ ((*(unsigned __int8 *)(*(void *)(TupleTypeMetadata - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(TupleTypeMetadata - 8) + 80)), v4);
}

unint64_t sub_247A7262C()
{
  unint64_t result = qword_2692984C8;
  if (!qword_2692984C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692984C8);
  }
  return result;
}

uint64_t sub_247A72680(void *a1)
{
  return sub_247A743FC(a1);
}

uint64_t decodeXPCValues<each A, B>(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v10 = a2;
  unint64_t v11 = (uint64_t *)(a5 & 0xFFFFFFFFFFFFFFFELL);
  v68 = a1;
  uint64_t v80 = a6;
  uint64_t v81 = a7;
  uint64_t v78 = a4;
  unint64_t v79 = a5;
  if (a3 == 1)
  {
    uint64_t v13 = v8;
    uint64_t TupleTypeMetadata = swift_checkMetadataState();
  }
  else
  {
    MEMORY[0x270FA5388](a1, a2);
    uint64_t v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a3)
    {
      unint64_t v18 = 0;
      if (a3 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v17 - (char *)v11) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v18 = a3 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v19 = (long long *)(v11 + 2);
      uint64_t v20 = v17 + 16;
      unint64_t v21 = a3 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v22 = *v19;
        *(v20 - 1) = *(v19 - 1);
        *uint64_t v20 = v22;
        v19 += 2;
        v20 += 2;
        v21 -= 4;
      }
      while (v21);
      if (v18 != a3)
      {
LABEL_9:
        unint64_t v23 = a3 - v18;
        uint64_t v24 = v18;
        uint64_t v25 = &v17[8 * v18];
        uint64_t v26 = &v11[v24];
        do
        {
          uint64_t v27 = *v26++;
          *(void *)uint64_t v25 = v27;
          v25 += 8;
          --v23;
        }
        while (v23);
      }
    }
    a8 = v15;
    uint64_t v13 = v8;
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v28 = TupleTypeMetadata;
  uint64_t v29 = sub_247A872E0();
  uint64_t v72 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29, v30);
  v75 = (char *)&v68 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D0);
  v77 = &v68;
  MEMORY[0x270FA5388](v32 - 8, v33);
  uint64_t v35 = (char *)&v68 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = v29;
  uint64_t v36 = swift_allocBox();
  uint64_t v37 = *(void *)(v28 - 8);
  uint64_t v70 = v38;
  uint64_t v71 = v37;
  uint64_t v39 = *(void (**)(void, void, void, void))(v37 + 56);
  uint64_t v74 = v28;
  v39(v38, 1, 1, v28);
  sub_247A87160();
  swift_allocObject();
  uint64_t v82 = sub_247A87150();
  sub_247A87360();
  uint64_t v40 = sub_247A87370();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 48))(v35, 1, v40);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_27;
  }
  v76 = &v68;
  v69 = a8;
  uint64_t v85 = v13;
  v42 = (void *)swift_allocObject();
  v42[2] = v10;
  v42[3] = a3;
  uint64_t v43 = v78;
  v42[4] = swift_allocateMetadataPack();
  v42[5] = swift_allocateMetadataPack();
  uint64_t v44 = v80;
  v42[6] = swift_allocateWitnessTablePack();
  unint64_t v79 = a3;
  v42[7] = swift_allocateWitnessTablePack();
  v42[8] = v36;
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = sub_247A7311C;
  *(void *)(v45 + 24) = v42;
  v84[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D8);
  v84[0] = sub_247A731A4;
  v84[1] = v45;
  uint64_t v81 = v36;
  swift_retain();
  v46 = (uint64_t (*)(void, void))sub_247A87140();
  sub_247A731CC((uint64_t)v84, (uint64_t)v35);
  uint64_t v47 = v46(v83, 0);
  if (!v10)
  {
LABEL_17:
    uint64_t v57 = v70;
    swift_beginAccess();
    v58 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v75, v57, v73);
    uint64_t v59 = v74;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v71 + 48))(v58, 1, v74);
    if (result != 1)
    {
      unint64_t v60 = v79;
      v61 = v69;
      if (v79)
      {
        v62 = (int *)(v59 + 32);
        unint64_t v63 = v79;
        do
        {
          if (v60 == 1) {
            int v64 = 0;
          }
          else {
            int v64 = *v62;
          }
          uint64_t v66 = *v11++;
          uint64_t v65 = v66;
          uint64_t v67 = *v61++;
          (*(void (**)(uint64_t, char *))(*(void *)(v65 - 8) + 32))(v67, &v58[v64]);
          v62 += 4;
          --v63;
        }
        while (v63);
      }
      swift_release();
      return swift_release();
    }
LABEL_27:
    __break(1u);
    return result;
  }
  unint64_t v48 = v43 & 0xFFFFFFFFFFFFFFFELL;
  unint64_t v49 = v44 & 0xFFFFFFFFFFFFFFFELL;
  v50 = v68;
  while (1)
  {
    MEMORY[0x270FA5388](v47, *v50);
    (*(void (**)(char *))(v52 + 16))((char *)&v68 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v53 = sub_247A871C0();
    unint64_t v55 = v54;
    sub_247A732DC();
    uint64_t v56 = v85;
    sub_247A87130();
    if (v56) {
      break;
    }
    uint64_t v85 = 0;
    uint64_t v47 = sub_247A73330(v53, v55);
    ++v50;
    v49 += 8;
    v48 += 8;
    if (!--v10) {
      goto LABEL_17;
    }
  }
  swift_release();
  sub_247A73330(v53, v55);
  return swift_release();
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

uint64_t sub_247A72D38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = a6 & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v43 = a4;
  uint64_t v39 = a8;
  if (a4 == 1)
  {
    uint64_t TupleTypeMetadata = swift_checkMetadataState();
  }
  else
  {
    MEMORY[0x270FA5388](a1, a2);
    unint64_t v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v12)
    {
      unint64_t v15 = 0;
      if (v12 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)&v14[-v10] < 0x20) {
        goto LABEL_9;
      }
      unint64_t v15 = v12 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v16 = (long long *)(v10 + 16);
      uint64_t v17 = v14 + 16;
      unint64_t v18 = v12 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v19 = *v16;
        *(v17 - 1) = *(v16 - 1);
        _OWORD *v17 = v19;
        v16 += 2;
        v17 += 2;
        v18 -= 4;
      }
      while (v18);
      if (v15 != v12)
      {
LABEL_9:
        unint64_t v20 = v12 - v15;
        uint64_t v21 = 8 * v15;
        long long v22 = &v14[8 * v15];
        unint64_t v23 = (uint64_t *)(v10 + v21);
        do
        {
          uint64_t v24 = *v23++;
          *(void *)long long v22 = v24;
          v22 += 8;
          --v20;
        }
        while (v20);
      }
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v38 = TupleTypeMetadata;
  uint64_t v25 = sub_247A872E0();
  uint64_t v42 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25, v26);
  uint64_t v28 = (char *)v37 - v27;
  uint64_t v29 = swift_projectBox();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_247A875A0();
  if (!v8)
  {
    uint64_t v40 = v29;
    uint64_t v41 = v25;
    v46 = v28;
    v37[1] = v37;
    if (v43)
    {
      uint64_t v31 = 0;
      v39 &= ~1uLL;
      uint64_t v32 = v38 + 16;
      do
      {
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v44, v45);
        sub_247A874C0();
        ++v31;
        v32 += 16;
        uint64_t v33 = v42;
        uint64_t v35 = v40;
        uint64_t v34 = v41;
      }
      while (v43 != v31);
    }
    else
    {
      uint64_t v34 = v41;
      uint64_t v33 = v42;
      uint64_t v35 = v40;
    }
    uint64_t v36 = v46;
    (*(void (**)(char *, void, uint64_t))(*(void *)(v38 - 8) + 56))(v46, 0, 1);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 40))(v35, v36, v34);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  }
  return result;
}

uint64_t sub_247A730E4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247A7311C(void *a1)
{
  return sub_247A72D38(a1, v1[8], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_247A73144(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_247A7316C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247A731A4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_247A731CC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_247A74630((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_247A73EBC(v9, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v8;
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_247A87370();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_247A7469C(a1);
    sub_247A736DC(a2, v9);
    uint64_t v7 = sub_247A87370();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a2, v7);
    return sub_247A7469C((uint64_t)v9);
  }
}

unint64_t sub_247A732DC()
{
  unint64_t result = qword_2692984E0;
  if (!qword_2692984E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692984E0);
  }
  return result;
}

uint64_t sub_247A73330(uint64_t a1, unint64_t a2)
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

ValueMetadata *type metadata accessor for XPCDecoder()
{
  return &type metadata for XPCDecoder;
}

void *initializeBufferWithCopyOfBuffer for XPCEncoder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for XPCEncoder()
{
  return swift_release();
}

void *assignWithCopy for XPCEncoder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
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

_OWORD *assignWithTake for XPCEncoder(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCEncoder(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for XPCEncoder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for XPCEncoder()
{
  return &type metadata for XPCEncoder;
}

unint64_t sub_247A734E0(uint64_t a1)
{
  sub_247A87370();
  uint64_t v2 = sub_247A87220();
  return sub_247A73544(a1, v2);
}

unint64_t sub_247A73544(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a1;
  uint64_t v4 = sub_247A87370();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v2;
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  uint64_t v21 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    unint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v12 = v6 + 16;
    uint64_t v13 = v14;
    uint64_t v15 = *(void *)(v12 + 56);
    uint64_t v16 = (void (**)(char *, uint64_t))(v12 - 8);
    do
    {
      uint64_t v17 = v12;
      v13(v8, *(void *)(v23 + 48) + v15 * v10, v4);
      char v18 = sub_247A87230();
      (*v16)(v8, v4);
      if (v18) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      uint64_t v12 = v17;
    }
    while (((*(void *)(v21 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

double sub_247A736DC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_247A734E0(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_247A74154();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_247A87370();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_247A74630((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_247A73C04(v6, v9);
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

uint64_t sub_247A73808(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v45 = sub_247A87370();
  uint64_t v5 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45, v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_2692984F0);
  int v46 = a2;
  uint64_t v10 = sub_247A87390();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    uint64_t v39 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v41 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v40 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v42 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v43 = v9;
    uint64_t v44 = v8;
    while (1)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v40) {
          goto LABEL_34;
        }
        unint64_t v23 = v41[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v40) {
            goto LABEL_34;
          }
          unint64_t v23 = v41[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v40)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v39;
              if (v46)
              {
                uint64_t v37 = 1 << *(unsigned char *)(v9 + 32);
                if (v37 >= 64) {
                  bzero(v41, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v41 = -1 << v37;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v41[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v40) {
                  goto LABEL_34;
                }
                unint64_t v23 = v41[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = v5;
      uint64_t v26 = *(void *)(v5 + 72);
      unint64_t v27 = *(void *)(v9 + 48) + v26 * v21;
      uint64_t v28 = v44;
      uint64_t v29 = v45;
      if (v46)
      {
        (*v47)(v44, v27, v45);
        sub_247A74630((_OWORD *)(*(void *)(v9 + 56) + 32 * v21), v48);
      }
      else
      {
        (*v42)(v44, v27, v45);
        sub_247A74640(*(void *)(v9 + 56) + 32 * v21, (uint64_t)v48);
      }
      uint64_t result = sub_247A87220();
      uint64_t v30 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v31 = result & ~v30;
      unint64_t v32 = v31 >> 6;
      if (((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v33 = 0;
        unint64_t v34 = (unint64_t)(63 - v30) >> 6;
        do
        {
          if (++v32 == v34 && (v33 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v35 = v32 == v34;
          if (v32 == v34) {
            unint64_t v32 = 0;
          }
          v33 |= v35;
          uint64_t v36 = *(void *)(v16 + 8 * v32);
        }
        while (v36 == -1);
        unint64_t v19 = __clz(__rbit64(~v36)) + (v32 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      (*v47)((char *)(*(void *)(v11 + 48) + v26 * v19), (unint64_t)v28, v29);
      uint64_t result = (uint64_t)sub_247A74630(v48, (_OWORD *)(*(void *)(v11 + 56) + 32 * v19));
      ++*(void *)(v11 + 16);
      uint64_t v5 = v25;
      uint64_t v9 = v43;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

unint64_t sub_247A73C04(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247A87370();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4, v6);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    uint64_t v39 = a2 + 64;
    unint64_t result = sub_247A87330();
    uint64_t v13 = v39;
    if ((*(void *)(v39 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v37 = (result + 1) & v12;
      unint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v14 = v5 + 16;
      uint64_t v36 = v15;
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v38 = v14;
      uint64_t v17 = (uint64_t (**)(char *, uint64_t))(v14 - 8);
      do
      {
        int64_t v18 = v16 * v11;
        v36(v9, *(void *)(a2 + 48) + v16 * v11, v4);
        uint64_t v19 = sub_247A87220();
        unint64_t result = (*v17)(v9, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v37)
        {
          if (v20 >= v37 && a1 >= (uint64_t)v20)
          {
LABEL_17:
            uint64_t v23 = *(void *)(a2 + 48);
            unint64_t result = v23 + v16 * a1;
            unint64_t v24 = v23 + v18 + v16;
            if (v16 * a1 < v18 || result >= v24)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v16 * a1 != v18)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v26 = *(void *)(a2 + 56);
            unint64_t v27 = (_OWORD *)(v26 + 32 * a1);
            uint64_t v28 = (_OWORD *)(v26 + 32 * v11);
            uint64_t v13 = v39;
            if (a1 != v11 || (a1 = v11, v27 >= v28 + 2))
            {
              long long v29 = v28[1];
              *unint64_t v27 = *v28;
              v27[1] = v29;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v37 || a1 >= (uint64_t)v20)
        {
          goto LABEL_17;
        }
        uint64_t v13 = v39;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
      }
      while (((*(void *)(v13 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v30 = (uint64_t *)(v13 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v30 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  *uint64_t v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_247A73EBC(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_247A87370();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v3;
  unint64_t v15 = sub_247A734E0(a2);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 < v18 || (a3 & 1) == 0)
  {
    if (v20 >= v18 && (a3 & 1) == 0)
    {
      sub_247A74154();
      goto LABEL_7;
    }
    sub_247A73808(v18, a3 & 1);
    unint64_t v24 = sub_247A734E0(a2);
    if ((v19 & 1) == (v25 & 1))
    {
      unint64_t v15 = v24;
      unint64_t v21 = *v4;
      if (v19) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
      return sub_247A74094(v15, (uint64_t)v12, a1, v21);
    }
LABEL_15:
    unint64_t result = (_OWORD *)sub_247A87510();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v21 = *v4;
  if ((v19 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  int64_t v22 = (_OWORD *)(v21[7] + 32 * v15);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  return sub_247A74630(a1, v22);
}

_OWORD *sub_247A74094(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_247A87370();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  unint64_t result = sub_247A74630(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_247A74154()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247A87370();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_2692984F0);
  uint64_t v7 = *v0;
  uint64_t v8 = sub_247A87380();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v9;
    return result;
  }
  uint64_t v23 = v1;
  unint64_t result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    unint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  uint64_t v24 = v7 + 64;
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v7 + 64);
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v26 = v3 + 16;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v24 + 8 * v12);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(void *)(v7 + 48) + v18, v2);
    uint64_t v19 = 32 * v17;
    sub_247A74640(*(void *)(v7 + 56) + v19, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v9 + 48) + v18, v6, v2);
    unint64_t result = sub_247A74630(v27, (_OWORD *)(*(void *)(v9 + 56) + v19));
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v25)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_247A743FC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D0);
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v6 = sub_247A875B0();
  sub_247A87360();
  uint64_t v7 = sub_247A87370();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v6 + 16) && (unint64_t v10 = sub_247A734E0((uint64_t)v5), (v11 & 1) != 0))
    {
      sub_247A74640(*(void *)(v6 + 56) + 32 * v10, (uint64_t)&v14);
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (*((void *)&v15 + 1))
    {
      sub_247A74630(&v14, &v16);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D8);
      swift_dynamicCast();
      int64_t v12 = v13;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
      v12(a1);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    }
  }
  __break(1u);
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

_OWORD *sub_247A74630(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_247A74640(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247A7469C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_247A747A4()
{
  sub_247A87590();
  uint64_t result = sub_247A872E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_247A74848()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  sub_247A87590();
  uint64_t v2 = sub_247A872E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_247A74904()
{
  sub_247A74848();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for SyncXPCResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

BOOL sub_247A749A4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_247A749B4()
{
  return sub_247A87570();
}

uint64_t sub_247A749DC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v3 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_247A874E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_247A74AC8()
{
  return sub_247A87580();
}

uint64_t sub_247A74B10(char a1)
{
  if (a1) {
    return 0x6572756C696166;
  }
  else {
    return 0x73736563637573;
  }
}

BOOL sub_247A74B40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_247A749A4(*a1, *a2);
}

uint64_t sub_247A74B58()
{
  return sub_247A74AC8();
}

uint64_t sub_247A74B6C()
{
  return sub_247A749B4();
}

uint64_t sub_247A74B80()
{
  return sub_247A87580();
}

uint64_t sub_247A74BCC()
{
  return sub_247A74B10(*v0);
}

uint64_t sub_247A74BE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A749DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A74C14()
{
  return 0;
}

uint64_t sub_247A74C20@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247A77178();
  *a1 = result;
  return result;
}

uint64_t sub_247A74C54(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_247A74CA8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_247A74CFC(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247A874E0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247A74D6C()
{
  return 1;
}

uint64_t sub_247A74D78()
{
  return sub_247A87570();
}

uint64_t sub_247A74DAC@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_247A74F28(a1, (uint64_t (*)(void, void, void))sub_247A74D6C, a2);
}

uint64_t sub_247A74DC4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_247A74E18(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_247A74E6C()
{
  return sub_247A87580();
}

uint64_t sub_247A74EB0()
{
  return sub_247A87580();
}

uint64_t sub_247A74EF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A74CFC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247A74F28@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247A74F64(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_247A74FB8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t ServiceResult.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = type metadata accessor for ServiceResult.FailureCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v45 = v6;
  uint64_t v7 = sub_247A874B0();
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  MEMORY[0x270FA5388](v7, v8);
  int v46 = (char *)&v37 - v9;
  uint64_t v10 = type metadata accessor for ServiceResult.SuccessCodingKeys();
  uint64_t v11 = swift_getWitnessTable();
  uint64_t v40 = v10;
  uint64_t v37 = v11;
  uint64_t v12 = sub_247A874B0();
  uint64_t v42 = *(void *)(v12 - 8);
  uint64_t v43 = v12;
  uint64_t v14 = MEMORY[0x270FA5388](v12, v13);
  uint64_t v39 = (char *)&v37 - v15;
  uint64_t v41 = *(void *)(v4 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v14, v16);
  uint64_t v38 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v17, v20);
  int64_t v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = v5;
  uint64_t v50 = v4;
  type metadata accessor for ServiceResult.CodingKeys();
  swift_getWitnessTable();
  uint64_t v23 = sub_247A874B0();
  uint64_t v52 = *(void *)(v23 - 8);
  uint64_t v53 = v23;
  MEMORY[0x270FA5388](v23, v24);
  uint64_t v26 = (char *)&v37 - v25;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A875E0();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v51, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    char v27 = *v22;
    char v56 = 1;
    uint64_t v28 = v46;
    uint64_t v29 = v53;
    sub_247A87440();
    char v55 = v27;
    sub_247A75558();
    uint64_t v30 = v48;
    sub_247A87490();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v28, v30);
  }
  else
  {
    uint64_t v31 = v41;
    uint64_t v32 = v38;
    uint64_t v33 = v50;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v38, v22, v50);
    char v54 = 0;
    BOOL v34 = v39;
    uint64_t v29 = v53;
    sub_247A87440();
    uint64_t v35 = v43;
    sub_247A87490();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v34, v35);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v26, v29);
}

uint64_t type metadata accessor for ServiceResult.FailureCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ServiceResult.SuccessCodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ServiceResult.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_247A75558()
{
  unint64_t result = qword_269298578;
  if (!qword_269298578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298578);
  }
  return result;
}

uint64_t ServiceResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  v68 = a4;
  uint64_t v7 = type metadata accessor for ServiceResult.FailureCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v66 = v7;
  uint64_t v58 = sub_247A87430();
  uint64_t v61 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58, v8);
  uint64_t v67 = (char *)&v53 - v9;
  uint64_t v10 = type metadata accessor for ServiceResult.SuccessCodingKeys();
  uint64_t v62 = swift_getWitnessTable();
  uint64_t v63 = v10;
  uint64_t v57 = sub_247A87430();
  uint64_t v60 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57, v11);
  int v64 = (char *)&v53 - v12;
  type metadata accessor for ServiceResult.CodingKeys();
  uint64_t v73 = swift_getWitnessTable();
  uint64_t v13 = sub_247A87430();
  uint64_t v70 = *(void *)(v13 - 8);
  uint64_t v71 = v13;
  MEMORY[0x270FA5388](v13, v14);
  uint64_t v16 = (char *)&v53 - v15;
  uint64_t v72 = a2;
  uint64_t v59 = a3;
  uint64_t v69 = type metadata accessor for ServiceResult();
  uint64_t v56 = *(void *)(v69 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v69, v17);
  uint64_t v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v18, v21);
  uint64_t v24 = (char *)&v53 - v23;
  MEMORY[0x270FA5388](v22, v25);
  char v27 = (char *)&v53 - v26;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v28 = v78;
  sub_247A875C0();
  if (v28) {
    goto LABEL_7;
  }
  uint64_t v73 = (uint64_t)v24;
  char v54 = v20;
  char v55 = v27;
  uint64_t v29 = v71;
  uint64_t v78 = a1;
  *(void *)&long long v74 = sub_247A87420();
  sub_247A87280();
  swift_getWitnessTable();
  *(void *)&long long v76 = sub_247A87320();
  *((void *)&v76 + 1) = v30;
  *(void *)&long long v77 = v31;
  *((void *)&v77 + 1) = v32;
  sub_247A87310();
  swift_getWitnessTable();
  sub_247A872B0();
  char v33 = v74;
  if (v74 == 2 || (long long v53 = v76, v74 = v76, v75 = v77, (sub_247A872C0() & 1) == 0))
  {
    uint64_t v38 = sub_247A87350();
    swift_allocError();
    uint64_t v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298580);
    *uint64_t v40 = v69;
    sub_247A873B0();
    sub_247A87340();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v38 - 8) + 104))(v40, *MEMORY[0x263F8DCB0], v38);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v29);
    a1 = v78;
LABEL_7:
    uint64_t v41 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v41);
  }
  if (v33)
  {
    LOBYTE(v74) = 1;
    uint64_t v43 = v67;
    sub_247A873A0();
    uint64_t v51 = v68;
    sub_247A75DB0();
    uint64_t v44 = v58;
    sub_247A87400();
    uint64_t v45 = v43;
    uint64_t v46 = v70;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v45, v44);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v16, v29);
    uint64_t v52 = v54;
    *char v54 = v74;
    uint64_t v47 = v69;
    swift_storeEnumTagMultiPayload();
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
    uint64_t v50 = v55;
    v48(v55, v52, v47);
  }
  else
  {
    LOBYTE(v74) = 0;
    BOOL v34 = v64;
    sub_247A873A0();
    uint64_t v35 = v73;
    uint64_t v36 = v57;
    sub_247A87400();
    uint64_t v37 = v70;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v34, v36);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v16, v29);
    uint64_t v47 = v69;
    swift_storeEnumTagMultiPayload();
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v56 + 32);
    uint64_t v49 = v35;
    uint64_t v50 = v55;
    v48(v55, (char *)v49, v47);
    uint64_t v51 = v68;
  }
  v48(v51, v50, v47);
  uint64_t v41 = (uint64_t)v78;
  return __swift_destroy_boxed_opaque_existential_1Tm(v41);
}

uint64_t type metadata accessor for ServiceResult()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_247A75DB0()
{
  unint64_t result = qword_269298588;
  if (!qword_269298588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298588);
  }
  return result;
}

uint64_t sub_247A75E04@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return ServiceResult.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_247A75E28(void *a1, uint64_t a2)
{
  return ServiceResult.encode(to:)(a1, a2);
}

uint64_t Result.init<>(_:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  type metadata accessor for ServiceResult();
  if (swift_getEnumCaseMultiPayload() == 1) {
    *a3 = *a1;
  }
  else {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
  }
  sub_247A75F2C();
  sub_247A87590();
  return swift_storeEnumTagMultiPayload();
}

unint64_t sub_247A75F2C()
{
  unint64_t result = qword_269298590[0];
  if (!qword_269298590[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269298590);
  }
  return result;
}

uint64_t sub_247A75F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_247A75F88()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_247A7601C(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 1uLL) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  uint64_t v6 = *(_DWORD *)(v4 + 80);
  if (v6 > 7 || (*(_DWORD *)(v4 + 80) & 0x100000) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v9 = *(void *)a2;
    *char v3 = *(void *)a2;
    char v3 = (void *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  else
  {
    unsigned int v10 = a2[v5];
    unsigned int v11 = v10 - 2;
    if (v10 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v12 = v5;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a2;
          goto LABEL_22;
        case 2:
          int v13 = *(unsigned __int16 *)a2;
          goto LABEL_22;
        case 3:
          int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_22;
        case 4:
          int v13 = *(_DWORD *)a2;
LABEL_22:
          int v14 = (v13 | (v11 << (8 * v5))) + 2;
          unsigned int v10 = v13 + 2;
          if (v5 < 4) {
            unsigned int v10 = v14;
          }
          break;
        default:
          break;
      }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      a1[v5] = 1;
    }
    else
    {
      (*(void (**)(unsigned char *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
    }
  }
  return v3;
}

unsigned __int8 *sub_247A7618C(unsigned __int8 *result, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 1) {
    unint64_t v2 = 1;
  }
  unsigned int v3 = result[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *result;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)result;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)result | (result[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)result;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 != 1) {
    return (unsigned __int8 *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  return result;
}

unsigned char *sub_247A76284(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v10 = 0;
  }
  a1[v4] = v10;
  return a1;
}

unsigned __int8 *sub_247A763B8(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 1uLL) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 != 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_27;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_27;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_27;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_27:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *a1 = *a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

unsigned char *sub_247A765C0(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  a1[v4] = v10;
  return a1;
}

unsigned __int8 *sub_247A766F4(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 1uLL) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 != 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_27;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_27;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_27;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_27:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *a1 = *a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_247A768FC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v3 + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_23;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 < 2)
    {
LABEL_23:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_23;
  }
LABEL_15:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_247A76A2C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x247A76BF0);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_247A76C18(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  if (*(void *)(v2 + 64) <= 1uLL) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_13;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_13;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_13;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_13:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_247A76CD0(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    size_t v4 = 1;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_247A76DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_247A76DBC(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_247A76E4C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247A76F18);
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

uint64_t sub_247A76F40(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_247A76F48(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

uint64_t sub_247A76F60()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for FeatureFlag(unsigned int *a1, int a2)
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

unsigned char *sub_247A76FB8(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247A77054);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_247A7707C()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A77098()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A770B4()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A770D0()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A770EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A77108()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A77124()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A77140()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A7715C()
{
  return swift_getWitnessTable();
}

uint64_t sub_247A77178()
{
  return 2;
}

uint64_t sub_247A77180()
{
  return 12383;
}

Swift::Bool __swiftcall isAppInstallationMetricsEnabled()()
{
  int v3 = &type metadata for FeatureFlag;
  unint64_t v4 = sub_247A771E0();
  char v0 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_247A771E0()
{
  unint64_t result = qword_269298798;
  if (!qword_269298798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298798);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FeatureFlag(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x247A772D0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

unint64_t sub_247A7730C()
{
  unint64_t result = qword_2692987A0;
  if (!qword_2692987A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692987A0);
  }
  return result;
}

const char *sub_247A77360()
{
  return "AppInstallationMetrics";
}

const char *sub_247A77374()
{
  return "ServiceEnabled";
}

AppInstallationMetrics::AppInstallType_optional __swiftcall AppInstallType.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_247A874F0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 19;
  if (v3 < 0x13) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

unint64_t AppInstallType.rawValue.getter()
{
  unint64_t result = 0xD000000000000014;
  switch(*v0)
  {
    case 1:
      unint64_t result = 7959906;
      break;
    case 2:
      unint64_t result = 0x79754270696C63;
      break;
    case 3:
      unint64_t result = 0x6F69746F6D6F7270;
      break;
    case 4:
      unint64_t result = 0x6575657571;
      break;
    case 5:
      unint64_t result = 0x6F6C6E776F646572;
      break;
    case 6:
      unint64_t result = 0x65726F74736572;
      break;
    case 7:
      unint64_t result = 0x5565726F74736572;
      break;
    case 8:
      unint64_t result = 0x64705565726F7473;
      break;
    case 9:
      unint64_t result = 0x7541657461647075;
      break;
    case 0xA:
      unint64_t result = 0x74736E4961746562;
      break;
    case 0xB:
      unint64_t result = 0x6164705561746562;
      break;
    case 0xC:
      return result;
    case 0xD:
      unint64_t result = 0xD000000000000013;
      break;
    case 0xE:
      unint64_t result = 0xD000000000000012;
      break;
    case 0xF:
      unint64_t result = 0x6469766F72507674;
      break;
    case 0x10:
      unint64_t result = 0xD000000000000010;
      break;
    case 0x11:
      unint64_t result = 7368821;
      break;
    case 0x12:
      unint64_t result = 6448503;
      break;
    default:
      unint64_t result = 0x6E776F446F747561;
      break;
  }
  return result;
}

uint64_t sub_247A77654()
{
  return sub_247A776B8();
}

unint64_t sub_247A77664()
{
  unint64_t result = qword_2692987A8;
  if (!qword_2692987A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692987A8);
  }
  return result;
}

uint64_t sub_247A776B8()
{
  unint64_t v0 = AppInstallType.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == AppInstallType.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_247A874E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_247A77750()
{
  return sub_247A87580();
}

uint64_t sub_247A777B8()
{
  AppInstallType.rawValue.getter();
  sub_247A87250();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247A7781C()
{
  return sub_247A87580();
}

AppInstallationMetrics::AppInstallType_optional sub_247A77880(Swift::String *a1)
{
  return AppInstallType.init(rawValue:)(*a1);
}

unint64_t sub_247A7788C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AppInstallType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_247A778B4()
{
  return sub_247A87270();
}

uint64_t sub_247A77914()
{
  return sub_247A87260();
}

uint64_t getEnumTagSinglePayload for AppInstallType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppInstallType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x247A77AC0);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

unsigned char *sub_247A77AE8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppInstallType()
{
  return &type metadata for AppInstallType;
}

unint64_t sub_247A77B00()
{
  unint64_t result = qword_2692987B0;
  if (!qword_2692987B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692987B0);
  }
  return result;
}

unint64_t static Logger.mrkSubsystem.getter()
{
  return 0xD000000000000020;
}

uint64_t sub_247A77B70(uint64_t a1)
{
  return sub_247A77D98(a1, qword_2692987B8);
}

uint64_t static Logger.activity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A77E34(&qword_269298470, (uint64_t)qword_2692987B8, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_247A77BEC(uint64_t a1)
{
  return sub_247A77D98(a1, qword_2692987D0);
}

uint64_t static Logger.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A77E34(&qword_269298478, (uint64_t)qword_2692987D0, a1);
}

uint64_t sub_247A77C2C(uint64_t a1)
{
  return sub_247A77D98(a1, qword_2692987E8);
}

uint64_t static Logger.events.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A77E34(&qword_269298480, (uint64_t)qword_2692987E8, a1);
}

uint64_t sub_247A77C6C(uint64_t a1)
{
  return sub_247A77D98(a1, qword_269298800);
}

uint64_t static Logger.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A77E34(&qword_269298488, (uint64_t)qword_269298800, a1);
}

uint64_t sub_247A77CB0(uint64_t a1)
{
  return sub_247A77D98(a1, qword_269298818);
}

uint64_t static Logger.installs.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A77E34(&qword_269298490, (uint64_t)qword_269298818, a1);
}

uint64_t sub_247A77CF4(uint64_t a1)
{
  return sub_247A77D98(a1, qword_269298830);
}

uint64_t static Logger.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A77E34(&qword_269298498, (uint64_t)qword_269298830, a1);
}

uint64_t sub_247A77D38(uint64_t a1)
{
  return sub_247A77D98(a1, qword_269298848);
}

uint64_t static Logger.framework.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A77E34(&qword_2692984A0, (uint64_t)qword_269298848, a1);
}

uint64_t sub_247A77D80(uint64_t a1)
{
  return sub_247A77D98(a1, qword_269298860);
}

uint64_t sub_247A77D98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_247A87210();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_247A87200();
}

uint64_t static Logger.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_247A77E34(&qword_2692984A8, (uint64_t)qword_269298860, a1);
}

uint64_t sub_247A77E34@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_247A87210();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
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

uint64_t AppInstallationEvent.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.eligibility.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = *(void *)(v1 + 88);
  char v5 = *(unsigned char *)(v1 + 96);
  *(void *)a1 = *(void *)(v1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 24);
  *(unsigned char *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v1 + 72);
  *(void *)(a1 + 72) = v4;
  *(unsigned char *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t AppInstallationEvent.externalVersionID.getter()
{
  return *(void *)(v0 + 104);
}

uint64_t AppInstallationEvent.installDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AppInstallationEvent() + 28);
  uint64_t v4 = sub_247A871D0();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for AppInstallationEvent()
{
  uint64_t result = qword_26B1337D0;
  if (!qword_26B1337D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AppInstallationEvent.installType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for AppInstallationEvent();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t AppInstallationEvent.isBeta.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 36));
}

uint64_t AppInstallationEvent.itemID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 40));
}

uint64_t AppInstallationEvent.osVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.platform.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.source.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.token.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.webDomain.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppInstallationEvent() + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEvent.init(bundleID:eligibility:externalVersionID:installDate:installType:isBeta:itemID:osVersion:platform:source:token:webDomain:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v22 = *(void *)(a3 + 16);
  char v23 = *(unsigned char *)(a3 + 24);
  char v24 = *(unsigned char *)(a3 + 80);
  char v25 = *a6;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(_OWORD *)(a9 + 16) = *(_OWORD *)a3;
  *(void *)(a9 + 32) = v22;
  *(unsigned char *)(a9 + 40) = v23;
  long long v26 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(a9 + 64) = v26;
  *(_OWORD *)(a9 + 80) = *(_OWORD *)(a3 + 64);
  *(unsigned char *)(a9 + 96) = v24;
  *(void *)(a9 + 104) = a4;
  char v27 = (int *)type metadata accessor for AppInstallationEvent();
  uint64_t v28 = a9 + v27[7];
  uint64_t v29 = sub_247A871D0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 32))(v28, a5, v29);
  *(unsigned char *)(a9 + v27[8]) = v25;
  *(unsigned char *)(a9 + v27[9]) = a7;
  uint64_t v31 = a9 + v27[10];
  *(void *)uint64_t v31 = a8;
  *(unsigned char *)(v31 + 8) = a10 & 1;
  uint64_t v32 = (void *)(a9 + v27[11]);
  *uint64_t v32 = a11;
  v32[1] = a12;
  char v33 = (void *)(a9 + v27[12]);
  void *v33 = a13;
  v33[1] = a14;
  BOOL v34 = (void *)(a9 + v27[13]);
  void *v34 = a15;
  v34[1] = a16;
  uint64_t v35 = (void *)(a9 + v27[14]);
  *uint64_t v35 = a17;
  v35[1] = a18;
  uint64_t v36 = (void *)(a9 + v27[15]);
  *uint64_t v36 = a19;
  v36[1] = a20;
  return result;
}

unint64_t sub_247A78424(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C69626967696C65;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x446C6C6174736E69;
      break;
    case 4:
      unint64_t result = 0x546C6C6174736E69;
      break;
    case 5:
      unint64_t result = 0x617465427369;
      break;
    case 6:
      unint64_t result = 0x44496D657469;
      break;
    case 7:
      unint64_t result = 0x6F6973726556736FLL;
      break;
    case 8:
      unint64_t result = 0x6D726F6674616C70;
      break;
    case 9:
      unint64_t result = 0x656372756F73;
      break;
    case 10:
      unint64_t result = 0x6E656B6F74;
      break;
    case 11:
      unint64_t result = 0x69616D6F44626577;
      break;
    default:
      unint64_t result = 0x4449656C646E7562;
      break;
  }
  return result;
}

BOOL sub_247A785A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247A785BC()
{
  return sub_247A87580();
}

uint64_t sub_247A78604()
{
  return sub_247A87570();
}

uint64_t sub_247A78630()
{
  return sub_247A87580();
}

unint64_t sub_247A78674()
{
  return sub_247A78424(*v0);
}

uint64_t sub_247A7867C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A7A434(a1, a2);
  *a3 = result;
  return result;
}

void sub_247A786A4(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_247A786B0(uint64_t a1)
{
  unint64_t v2 = sub_247A78AF4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A786EC(uint64_t a1)
{
  unint64_t v2 = sub_247A78AF4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AppInstallationEvent.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298878);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  int v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A78AF4();
  sub_247A875E0();
  LOBYTE(v18) = 0;
  sub_247A87470();
  if (!v2)
  {
    uint64_t v10 = *(void *)(v3 + 32);
    char v11 = *(unsigned char *)(v3 + 40);
    char v12 = *(unsigned char *)(v3 + 96);
    long long v18 = *(_OWORD *)(v3 + 16);
    uint64_t v19 = v10;
    char v20 = v11;
    long long v13 = *(_OWORD *)(v3 + 64);
    long long v21 = *(_OWORD *)(v3 + 48);
    long long v22 = v13;
    long long v23 = *(_OWORD *)(v3 + 80);
    char v24 = v12;
    char v17 = 1;
    sub_247A78B48();
    sub_247A87490();
    LOBYTE(v18) = 2;
    sub_247A874A0();
    uint64_t v14 = type metadata accessor for AppInstallationEvent();
    LOBYTE(v18) = 3;
    sub_247A871D0();
    sub_247A793C4(&qword_269298890);
    sub_247A87490();
    LOBYTE(v18) = *(unsigned char *)(v3 + *(int *)(v14 + 32));
    char v17 = 4;
    sub_247A78B9C();
    sub_247A87490();
    LOBYTE(v18) = 5;
    sub_247A87480();
    LOBYTE(v18) = 6;
    sub_247A87460();
    LOBYTE(v18) = 7;
    sub_247A87470();
    LOBYTE(v18) = 8;
    sub_247A87470();
    LOBYTE(v18) = 9;
    sub_247A87470();
    LOBYTE(v18) = 10;
    sub_247A87450();
    LOBYTE(v18) = 11;
    sub_247A87450();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_247A78AF4()
{
  unint64_t result = qword_269298880;
  if (!qword_269298880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298880);
  }
  return result;
}

unint64_t sub_247A78B48()
{
  unint64_t result = qword_269298888;
  if (!qword_269298888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298888);
  }
  return result;
}

unint64_t sub_247A78B9C()
{
  unint64_t result = qword_269298898;
  if (!qword_269298898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298898);
  }
  return result;
}

uint64_t AppInstallationEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_247A871D0();
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692988A0);
  uint64_t v9 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46, v10);
  char v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = (int *)type metadata accessor for AppInstallationEvent();
  MEMORY[0x270FA5388](v49, v13);
  uint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_247A78AF4();
  sub_247A875C0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
  }
  uint64_t v45 = a2;
  uint64_t v17 = v9;
  LOBYTE(v51) = 0;
  *(void *)uint64_t v15 = sub_247A873E0();
  *((void *)v15 + 1) = v18;
  char v59 = 1;
  sub_247A79370();
  sub_247A87400();
  uint64_t v19 = v52;
  char v20 = v53;
  char v21 = v57;
  *((_OWORD *)v15 + 1) = v51;
  *((void *)v15 + 4) = v19;
  v15[40] = v20;
  long long v22 = v55;
  *((_OWORD *)v15 + 3) = v54;
  *((_OWORD *)v15 + 4) = v22;
  *((_OWORD *)v15 + 5) = v56;
  v15[96] = v21;
  LOBYTE(v51) = 2;
  *((void *)v15 + 13) = sub_247A87410();
  LOBYTE(v51) = 3;
  sub_247A793C4(&qword_2692988B0);
  uint64_t v23 = v48;
  sub_247A87400();
  char v24 = v49;
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(&v15[v49[7]], v8, v23);
  char v59 = 4;
  sub_247A79408();
  sub_247A87400();
  v15[v24[8]] = v51;
  LOBYTE(v51) = 5;
  v15[v24[9]] = sub_247A873F0() & 1;
  LOBYTE(v51) = 6;
  uint64_t v25 = sub_247A873D0();
  long long v26 = &v15[v24[10]];
  *(void *)long long v26 = v25;
  v26[8] = v27 & 1;
  LOBYTE(v51) = 7;
  uint64_t v28 = sub_247A873E0();
  uint64_t v29 = (uint64_t *)&v15[v24[11]];
  uint64_t *v29 = v28;
  v29[1] = v30;
  LOBYTE(v51) = 8;
  uint64_t v31 = sub_247A873E0();
  int v58 = 1;
  uint64_t v32 = (uint64_t *)&v15[v24[12]];
  *uint64_t v32 = v31;
  v32[1] = v33;
  LOBYTE(v51) = 9;
  uint64_t v34 = sub_247A873E0();
  uint64_t v35 = (uint64_t *)&v15[v49[13]];
  *uint64_t v35 = v34;
  v35[1] = v36;
  LOBYTE(v51) = 10;
  uint64_t v37 = sub_247A873C0();
  uint64_t v38 = (uint64_t *)&v15[v49[14]];
  *uint64_t v38 = v37;
  v38[1] = v39;
  LOBYTE(v51) = 11;
  uint64_t v40 = sub_247A873C0();
  uint64_t v42 = v41;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v46);
  uint64_t v43 = (uint64_t *)&v15[v49[15]];
  *uint64_t v43 = v40;
  v43[1] = v42;
  sub_247A7945C((uint64_t)v15, v45);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
  return sub_247A794C0((uint64_t)v15);
}

unint64_t sub_247A79370()
{
  unint64_t result = qword_2692988A8;
  if (!qword_2692988A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692988A8);
  }
  return result;
}

uint64_t sub_247A793C4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_247A871D0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247A79408()
{
  unint64_t result = qword_2692988B8;
  if (!qword_2692988B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692988B8);
  }
  return result;
}

uint64_t sub_247A7945C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppInstallationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247A794C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppInstallationEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247A7951C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AppInstallationEvent.init(from:)(a1, a2);
}

uint64_t sub_247A79534(void *a1)
{
  return AppInstallationEvent.encode(to:)(a1);
}

uint64_t sub_247A7954C()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_247A79558@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *initializeBufferWithCopyOfBuffer for AppInstallationEvent(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v39 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v39 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[10];
    uint64_t v12 = a2[11];
    *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
    *(void *)(a1 + 104) = a2[13];
    uint64_t v13 = a3[7];
    uint64_t v42 = (uint64_t)a2 + v13;
    uint64_t v43 = a1 + v13;
    *(void *)(a1 + 80) = v11;
    *(void *)(a1 + 88) = v12;
    uint64_t v14 = sub_247A871D0();
    uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v41(v43, v42, v14);
    uint64_t v15 = a3[9];
    *((unsigned char *)v4 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)v4 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v16 = a3[10];
    uint64_t v17 = a3[11];
    uint64_t v18 = (char *)v4 + v16;
    uint64_t v19 = (uint64_t)a2 + v16;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = *(unsigned char *)(v19 + 8);
    char v20 = (void *)((char *)v4 + v17);
    char v21 = (uint64_t *)((char *)a2 + v17);
    uint64_t v22 = v21[1];
    *char v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = a3[12];
    uint64_t v24 = a3[13];
    uint64_t v25 = (void *)((char *)v4 + v23);
    long long v26 = (uint64_t *)((char *)a2 + v23);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    uint64_t v28 = (void *)((char *)v4 + v24);
    uint64_t v29 = (uint64_t *)((char *)a2 + v24);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = a3[14];
    uint64_t v32 = a3[15];
    uint64_t v33 = (void *)((char *)v4 + v31);
    uint64_t v34 = (uint64_t *)((char *)a2 + v31);
    uint64_t v35 = v34[1];
    void *v33 = *v34;
    v33[1] = v35;
    uint64_t v36 = (void *)((char *)v4 + v32);
    uint64_t v37 = (uint64_t *)((char *)a2 + v32);
    uint64_t v38 = v37[1];
    *uint64_t v36 = *v37;
    v36[1] = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AppInstallationEvent(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_247A871D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppInstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = *(void *)(a2 + 80);
  uint64_t v11 = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v12 = a3[7];
  uint64_t v40 = a2 + v12;
  uint64_t v41 = a1 + v12;
  *(void *)(a1 + 80) = v10;
  *(void *)(a1 + 88) = v11;
  uint64_t v13 = sub_247A871D0();
  uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v39(v41, v40, v13);
  uint64_t v14 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[10];
  uint64_t v16 = a3[11];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  uint64_t v19 = (void *)(a1 + v16);
  char v20 = (void *)(a2 + v16);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = a3[12];
  uint64_t v23 = a3[13];
  uint64_t v24 = (void *)(a1 + v22);
  uint64_t v25 = (void *)(a2 + v22);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = (void *)(a1 + v23);
  uint64_t v28 = (void *)(a2 + v23);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  uint64_t v30 = a3[14];
  uint64_t v31 = a3[15];
  uint64_t v32 = (void *)(a1 + v30);
  uint64_t v33 = (void *)(a2 + v30);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  uint64_t v35 = (void *)(a1 + v31);
  uint64_t v36 = (void *)(a2 + v31);
  uint64_t v37 = v36[1];
  *uint64_t v35 = *v36;
  v35[1] = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppInstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_247A871D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v11 = a3[10];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  char v14 = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = v14;
  uint64_t v15 = a3[11];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[12];
  uint64_t v19 = (void *)(a1 + v18);
  char v20 = (void *)(a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[13];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[14];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[15];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for AppInstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  long long v9 = *(_OWORD *)(a2 + 32);
  long long v8 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(_OWORD *)(a1 + 32) = v9;
  *(_OWORD *)(a1 + 48) = v8;
  uint64_t v13 = sub_247A871D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[10];
  uint64_t v16 = a3[11];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  uint64_t v19 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v19) = *(_OWORD *)(a2 + v19);
  uint64_t v20 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  return a1;
}

uint64_t assignWithTake for AppInstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_247A871D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[10];
  uint64_t v17 = a3[11];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  uint64_t v20 = (void *)(a1 + v17);
  uint64_t v21 = (uint64_t *)(a2 + v17);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[12];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (uint64_t *)(a2 + v24);
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  *uint64_t v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[13];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (uint64_t *)(a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[14];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (uint64_t *)(a2 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[15];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (uint64_t *)(a2 + v39);
  uint64_t v43 = *v41;
  uint64_t v42 = v41[1];
  *uint64_t v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247A79F4C);
}

uint64_t sub_247A79F4C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_247A871D0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AppInstallationEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247A7A010);
}

uint64_t sub_247A7A010(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_247A871D0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_247A7A0B8()
{
  uint64_t result = sub_247A871D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppInstallationEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppInstallationEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *uint64_t result = a2 + 11;
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
        JUMPOUT(0x247A7A2F4);
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
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationEvent.CodingKeys()
{
  return &type metadata for AppInstallationEvent.CodingKeys;
}

unint64_t sub_247A7A330()
{
  unint64_t result = qword_2692988C0;
  if (!qword_2692988C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692988C0);
  }
  return result;
}

unint64_t sub_247A7A388()
{
  unint64_t result = qword_2692988C8;
  if (!qword_2692988C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692988C8);
  }
  return result;
}

unint64_t sub_247A7A3E0()
{
  unint64_t result = qword_2692988D0;
  if (!qword_2692988D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692988D0);
  }
  return result;
}

uint64_t sub_247A7A434(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000;
  if (v3 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C69626967696C65 && a2 == 0xEB00000000797469 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000247A89210 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x446C6C6174736E69 && a2 == 0xEB00000000657461 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x546C6C6174736E69 && a2 == 0xEB00000000657079 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x617465427369 && a2 == 0xE600000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x44496D657469 && a2 == 0xE600000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x69616D6F44626577 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_247A874E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

id sub_247A7A8C8()
{
  type metadata accessor for ServiceConnection();
  uint64_t v0 = swift_allocObject();
  id v1 = objc_allocWithZone(MEMORY[0x263F08D68]);
  int v2 = (void *)sub_247A87240();
  id v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0);

  *(void *)(v0 + 16) = v3;
  unsigned int v4 = self;
  id v5 = v3;
  id v6 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26FBF21F8);
  objc_msgSend(v5, sel_setRemoteObjectInterface_, v6);

  uint64_t v16 = sub_247A7AAE0;
  uint64_t v17 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_247A7AAEC;
  uint64_t v15 = &block_descriptor;
  BOOL v7 = _Block_copy(&v12);
  id v8 = v5;
  objc_msgSend(v8, sel_setInterruptionHandler_, v7);
  _Block_release(v7);

  uint64_t v16 = sub_247A7AB30;
  uint64_t v17 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_247A7AAEC;
  uint64_t v15 = &block_descriptor_4;
  uint64_t v9 = _Block_copy(&v12);
  id v10 = v8;
  objc_msgSend(v10, sel_setInvalidationHandler_, v9);
  _Block_release(v9);

  id result = objc_msgSend(v10, sel_resume);
  qword_26929B250 = v0;
  return result;
}

void sub_247A7AAE0()
{
}

uint64_t sub_247A7AAEC(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_247A7AB30()
{
}

void sub_247A7AB3C(const char *a1)
{
  if (qword_2692984A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247A87210();
  __swift_project_value_buffer(v2, (uint64_t)qword_269298860);
  oslog = sub_247A871F0();
  os_log_type_t v3 = sub_247A872D0();
  if (os_log_type_enabled(oslog, v3))
  {
    unsigned int v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl(&dword_247A70000, oslog, v3, a1, v4, 2u);
    MEMORY[0x24C565E40](v4, -1, -1);
  }
}

uint64_t sub_247A7AC2C()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ServiceConnection()
{
  return self;
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

uint64_t InstallationEvent.id.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.altDsid.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.dsid.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t InstallationEvent.billingStorefront.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.bundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.countryCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.eventVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.evid.getter()
{
  return *(void *)(v0 + 112);
}

uint64_t InstallationEvent.installDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InstallationEvent() + 48);
  uint64_t v4 = sub_247A871D0();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for InstallationEvent()
{
  uint64_t result = qword_2692988F0;
  if (!qword_2692988F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t InstallationEvent.installType.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.isBeta.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 56));
}

uint64_t InstallationEvent.itemID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 60));
}

uint64_t InstallationEvent.osVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 64));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.platform.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 68));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.source.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 72));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.storefront.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 76));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.token.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 80));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.webDomain.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 84));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.postTargetDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InstallationEvent() + 88);
  uint64_t v4 = sub_247A871D0();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t InstallationEvent.gsToken.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 92));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.jwtGSToken.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InstallationEvent() + 96));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InstallationEvent.init(altDsid:dsid:billingStorefront:bundleID:clientID:countryCode:eventVersion:evid:installDate:installType:isBeta:itemID:osVersion:platform:source:storefront:token:webDomain:postTargetDate:gsToken:jwtGSToken:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, long long a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(unsigned char *)(a9 + 24) = a4 & 1;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 112) = a13;
  *(unsigned char *)(a9 + 120) = a14 & 1;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  uint64_t v38 = (int *)type metadata accessor for InstallationEvent();
  uint64_t v39 = a9 + v38[12];
  uint64_t v40 = sub_247A871D0();
  uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 32);
  v41(v39, a15, v40);
  uint64_t v42 = (void *)(a9 + v38[13]);
  void *v42 = a16;
  v42[1] = a17;
  *(unsigned char *)(a9 + v38[14]) = a18;
  uint64_t v43 = a9 + v38[15];
  *(void *)uint64_t v43 = a19;
  *(unsigned char *)(v43 + 8) = a20 & 1;
  uint64_t v44 = (void *)(a9 + v38[16]);
  *uint64_t v44 = a21;
  v44[1] = a22;
  uint64_t v45 = (void *)(a9 + v38[17]);
  void *v45 = a23;
  v45[1] = a24;
  uint64_t v46 = (void *)(a9 + v38[18]);
  void *v46 = a25;
  v46[1] = a26;
  uint64_t v47 = (void *)(a9 + v38[19]);
  *uint64_t v47 = a27;
  v47[1] = a28;
  uint64_t v48 = (void *)(a9 + v38[20]);
  *uint64_t v48 = a29;
  v48[1] = a30;
  uint64_t v49 = (void *)(a9 + v38[21]);
  *uint64_t v49 = a31;
  v49[1] = a32;
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v41)(a9 + v38[22], a33, v40);
  long long v51 = (void *)(a9 + v38[23]);
  *long long v51 = a34;
  v51[1] = a35;
  uint64_t v52 = (void *)(a9 + v38[24]);
  *uint64_t v52 = a36;
  v52[1] = a37;
  return result;
}

unint64_t sub_247A7B414(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 1684632420;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x4449656C646E7562;
      break;
    case 4:
      unint64_t result = 0x4449746E65696C63;
      break;
    case 5:
      unint64_t result = 0x437972746E756F63;
      break;
    case 6:
      unint64_t result = 0x726556746E657665;
      break;
    case 7:
      unint64_t result = 1684633189;
      break;
    case 8:
      unint64_t result = 0x446C6C6174736E69;
      break;
    case 9:
      unint64_t result = 0x546C6C6174736E69;
      break;
    case 10:
      unint64_t result = 0x617465427369;
      break;
    case 11:
      unint64_t result = 0x44496D657469;
      break;
    case 12:
      unint64_t result = 0x6F6973726556736FLL;
      break;
    case 13:
      unint64_t result = 0x6D726F6674616C70;
      break;
    case 14:
      unint64_t result = 0x656372756F73;
      break;
    case 15:
      unint64_t result = 0x6F726665726F7473;
      break;
    case 16:
      unint64_t result = 0x6E656B6F74;
      break;
    case 17:
      unint64_t result = 0x69616D6F44626577;
      break;
    case 18:
      unint64_t result = 0x6772615474736F70;
      break;
    case 19:
      unint64_t result = 0x6E656B6F547367;
      break;
    case 20:
      unint64_t result = 0x6B6F54534774776ALL;
      break;
    default:
      unint64_t result = 0x64697344746C61;
      break;
  }
  return result;
}

unint64_t sub_247A7B6AC()
{
  return sub_247A7B414(*v0);
}

uint64_t sub_247A7B6B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A7DB24(a1, a2);
  *a3 = result;
  return result;
}

void sub_247A7B6DC(unsigned char *a1@<X8>)
{
  *a1 = 21;
}

uint64_t sub_247A7B6E8(uint64_t a1)
{
  unint64_t v2 = sub_247A7BC74();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A7B724(uint64_t a1)
{
  unint64_t v2 = sub_247A7BC74();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InstallationEvent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692988D8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  BOOL v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A7BC74();
  sub_247A875E0();
  char v10 = 0;
  sub_247A87450();
  if (!v1)
  {
    char v10 = 1;
    sub_247A87460();
    char v10 = 2;
    sub_247A87450();
    char v10 = 3;
    sub_247A87470();
    char v10 = 4;
    sub_247A87470();
    char v10 = 5;
    sub_247A87450();
    char v10 = 6;
    sub_247A87470();
    char v10 = 7;
    sub_247A87460();
    type metadata accessor for InstallationEvent();
    char v10 = 8;
    sub_247A871D0();
    sub_247A793C4(&qword_269298890);
    sub_247A87490();
    char v10 = 9;
    sub_247A87470();
    char v10 = 10;
    sub_247A87480();
    char v10 = 11;
    sub_247A87460();
    char v10 = 12;
    sub_247A87470();
    char v10 = 13;
    sub_247A87470();
    char v10 = 14;
    sub_247A87470();
    char v10 = 15;
    sub_247A87450();
    char v10 = 16;
    sub_247A87450();
    char v10 = 17;
    sub_247A87450();
    char v10 = 18;
    sub_247A87490();
    char v10 = 19;
    sub_247A87450();
    char v10 = 20;
    sub_247A87450();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_247A7BC74()
{
  unint64_t result = qword_2692988E0;
  if (!qword_2692988E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692988E0);
  }
  return result;
}

uint64_t InstallationEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v81 = sub_247A871D0();
  uint64_t v78 = *(void *)(v81 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v81, v4);
  BOOL v7 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v8);
  char v10 = (char *)&v73 - v9;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692988E8);
  uint64_t v11 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75, v12);
  uint64_t v14 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for InstallationEvent();
  MEMORY[0x270FA5388](v15, v16);
  uint64_t v80 = (uint64_t *)((char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = a1[3];
  long long v76 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_247A7BC74();
  long long v77 = v14;
  sub_247A875C0();
  uint64_t v82 = (int *)v15;
  if (v2)
  {
    uint64_t v79 = v2;
    LODWORD(v77) = 0;
    uint64_t v22 = v80;
    uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
    int v24 = 0;
    int v83 = 0;
    int v25 = 0;
    uint64_t v26 = v82;
    if (v77) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v19 = v7;
    char v84 = 0;
    uint64_t v20 = v74;
    uint64_t v21 = sub_247A873C0();
    uint64_t v27 = v80;
    *uint64_t v80 = v21;
    v27[1] = v28;
    char v84 = 1;
    _OWORD v27[2] = sub_247A873D0();
    *((unsigned char *)v27 + 24) = v29 & 1;
    char v84 = 2;
    v27[4] = sub_247A873C0();
    v27[5] = v30;
    char v84 = 3;
    v27[6] = sub_247A873E0();
    v27[7] = v31;
    char v84 = 4;
    v27[8] = sub_247A873E0();
    v27[9] = v32;
    char v84 = 5;
    v27[10] = sub_247A873C0();
    v27[11] = v33;
    char v84 = 6;
    v27[12] = sub_247A873E0();
    v27[13] = v34;
    char v84 = 7;
    v27[14] = sub_247A873D0();
    *((unsigned char *)v27 + 120) = v35 & 1;
    char v84 = 8;
    uint64_t v73 = sub_247A793C4(&qword_2692988B0);
    sub_247A87400();
    uint64_t v36 = (char *)v27 + v82[12];
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v78 + 32);
    v37(v36, v10, v81);
    char v84 = 9;
    uint64_t v38 = sub_247A873E0();
    uint64_t v79 = 0;
    uint64_t v39 = (uint64_t *)((char *)v80 + v82[13]);
    *uint64_t v39 = v38;
    v39[1] = v40;
    char v84 = 10;
    char v41 = sub_247A873F0();
    uint64_t v79 = 0;
    *((unsigned char *)v80 + v82[14]) = v41 & 1;
    char v84 = 11;
    uint64_t v42 = sub_247A873D0();
    uint64_t v79 = 0;
    uint64_t v43 = (char *)v80 + v82[15];
    *(void *)uint64_t v43 = v42;
    v43[8] = v44 & 1;
    char v84 = 12;
    uint64_t v45 = sub_247A873E0();
    uint64_t v79 = 0;
    uint64_t v46 = (uint64_t *)((char *)v80 + v82[16]);
    uint64_t *v46 = v45;
    v46[1] = v47;
    char v84 = 13;
    uint64_t v48 = sub_247A873E0();
    uint64_t v79 = 0;
    uint64_t v49 = (uint64_t *)((char *)v80 + v82[17]);
    *uint64_t v49 = v48;
    v49[1] = v50;
    char v84 = 14;
    uint64_t v51 = sub_247A873E0();
    uint64_t v79 = 0;
    uint64_t v52 = (uint64_t *)((char *)v80 + v82[18]);
    *uint64_t v52 = v51;
    v52[1] = v53;
    char v84 = 15;
    uint64_t v54 = sub_247A873C0();
    uint64_t v79 = 0;
    long long v55 = (uint64_t *)((char *)v80 + v82[19]);
    *long long v55 = v54;
    v55[1] = v56;
    char v84 = 16;
    uint64_t v57 = sub_247A873C0();
    uint64_t v79 = 0;
    int v58 = (uint64_t *)((char *)v80 + v82[20]);
    uint64_t *v58 = v57;
    v58[1] = v59;
    char v84 = 17;
    uint64_t v60 = sub_247A873C0();
    int v83 = 1;
    uint64_t v79 = 0;
    uint64_t v61 = (uint64_t *)((char *)v80 + v82[21]);
    uint64_t *v61 = v60;
    v61[1] = v62;
    char v84 = 18;
    sub_247A87400();
    uint64_t v79 = 0;
    v37((char *)v80 + v82[22], v19, v81);
    char v84 = 19;
    uint64_t v63 = v79;
    uint64_t v64 = sub_247A873C0();
    uint64_t v79 = v63;
    if (!v63)
    {
      uint64_t v66 = (uint64_t *)((char *)v80 + v82[23]);
      *uint64_t v66 = v64;
      v66[1] = v65;
      char v84 = 20;
      uint64_t v67 = sub_247A873C0();
      uint64_t v79 = 0;
      uint64_t v68 = v67;
      uint64_t v70 = v69;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v77, v75);
      uint64_t v71 = (uint64_t)v80;
      uint64_t v72 = (uint64_t *)((char *)v80 + v82[24]);
      *uint64_t v72 = v68;
      v72[1] = v70;
      sub_247A7C7D0(v71, v20);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
      return sub_247A7C834(v71);
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v77, v75);
    int v24 = 1;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v76);
    uint64_t v22 = v80;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    LODWORD(v77) = 1;
    int v25 = 1;
    (*(void (**)(char *, uint64_t))(v78 + 8))((char *)v22 + v82[12], v81);
    uint64_t v26 = v82;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v77)
    {
LABEL_5:
      uint64_t result = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  if (!v25)
  {
LABEL_6:
    if (v83) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t result = swift_bridgeObjectRelease();
  if (v83)
  {
LABEL_7:
    uint64_t result = swift_bridgeObjectRelease();
    if ((v24 & 1) == 0) {
      return result;
    }
    return (*(uint64_t (**)(char *, uint64_t))(v78 + 8))((char *)v22 + v26[22], v81);
  }
LABEL_12:
  if (v24) {
    return (*(uint64_t (**)(char *, uint64_t))(v78 + 8))((char *)v22 + v26[22], v81);
  }
  return result;
}

uint64_t sub_247A7C7D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstallationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247A7C834(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InstallationEvent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247A7C890@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InstallationEvent.init(from:)(a1, a2);
}

uint64_t sub_247A7C8A8(void *a1)
{
  return InstallationEvent.encode(to:)(a1);
}

uint64_t sub_247A7C8C0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 72);
  *a1 = *(void *)(v1 + 64);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *initializeBufferWithCopyOfBuffer for InstallationEvent(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v57 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v57 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v11;
    uint64_t v12 = a2[12];
    uint64_t v13 = a2[14];
    *(void *)(a1 + 104) = a2[13];
    *(void *)(a1 + 112) = v13;
    *(unsigned char *)(a1 + 120) = *((unsigned char *)a2 + 120);
    uint64_t v14 = a3[12];
    uint64_t v59 = (uint64_t)a2 + v14;
    uint64_t v60 = a1 + v14;
    *(void *)(a1 + 96) = v12;
    uint64_t v63 = sub_247A871D0();
    uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v62(v60, v59, v63);
    uint64_t v15 = a3[13];
    uint64_t v16 = a3[14];
    uint64_t v17 = (void *)((char *)v4 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    *((unsigned char *)v4 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v20 = a3[15];
    uint64_t v21 = a3[16];
    uint64_t v22 = (char *)v4 + v20;
    uint64_t v23 = (uint64_t)a2 + v20;
    *(void *)uint64_t v22 = *(void *)v23;
    v22[8] = *(unsigned char *)(v23 + 8);
    int v24 = (void *)((char *)v4 + v21);
    int v25 = (uint64_t *)((char *)a2 + v21);
    uint64_t v26 = v25[1];
    *int v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = a3[17];
    uint64_t v28 = a3[18];
    char v29 = (void *)((char *)v4 + v27);
    uint64_t v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    void *v29 = *v30;
    v29[1] = v31;
    uint64_t v32 = (void *)((char *)v4 + v28);
    uint64_t v33 = (uint64_t *)((char *)a2 + v28);
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    uint64_t v35 = a3[19];
    uint64_t v36 = a3[20];
    uint64_t v37 = (void *)((char *)v4 + v35);
    uint64_t v38 = (uint64_t *)((char *)a2 + v35);
    uint64_t v39 = v38[1];
    void *v37 = *v38;
    v37[1] = v39;
    uint64_t v40 = (void *)((char *)v4 + v36);
    char v41 = (uint64_t *)((char *)a2 + v36);
    uint64_t v42 = v41[1];
    *uint64_t v40 = *v41;
    v40[1] = v42;
    uint64_t v43 = a3[21];
    uint64_t v44 = a3[22];
    uint64_t v45 = (void *)((char *)v4 + v43);
    uint64_t v46 = (uint64_t *)((char *)a2 + v43);
    uint64_t v47 = v46[1];
    void *v45 = *v46;
    v45[1] = v47;
    uint64_t v48 = (char *)v4 + v44;
    uint64_t v61 = (uint64_t)a2 + v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v62((uint64_t)v48, v61, v63);
    uint64_t v49 = a3[23];
    uint64_t v50 = a3[24];
    uint64_t v51 = (void *)((char *)v4 + v49);
    uint64_t v52 = (uint64_t *)((char *)a2 + v49);
    uint64_t v53 = v52[1];
    *uint64_t v51 = *v52;
    v51[1] = v53;
    uint64_t v54 = (void *)((char *)v4 + v50);
    long long v55 = (uint64_t *)((char *)a2 + v50);
    uint64_t v56 = v55[1];
    *uint64_t v54 = *v55;
    v54[1] = v56;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for InstallationEvent(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = sub_247A871D0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6(a1 + *(int *)(a2 + 88), v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  uint64_t v11 = *(void *)(a2 + 96);
  uint64_t v12 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v12;
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v13 = a3[12];
  uint64_t v57 = a2 + v13;
  uint64_t v58 = a1 + v13;
  *(void *)(a1 + 96) = v11;
  uint64_t v61 = sub_247A871D0();
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v60(v58, v57, v61);
  uint64_t v14 = a3[13];
  uint64_t v15 = a3[14];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v19 = a3[15];
  uint64_t v20 = a3[16];
  uint64_t v21 = a1 + v19;
  uint64_t v22 = a2 + v19;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  uint64_t v23 = (void *)(a1 + v20);
  int v24 = (void *)(a2 + v20);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  uint64_t v26 = a3[17];
  uint64_t v27 = a3[18];
  uint64_t v28 = (void *)(a1 + v26);
  char v29 = (void *)(a2 + v26);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  uint64_t v31 = (void *)(a1 + v27);
  uint64_t v32 = (void *)(a2 + v27);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  uint64_t v34 = a3[19];
  uint64_t v35 = a3[20];
  uint64_t v36 = (void *)(a1 + v34);
  uint64_t v37 = (void *)(a2 + v34);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = (void *)(a1 + v35);
  uint64_t v40 = (void *)(a2 + v35);
  uint64_t v41 = v40[1];
  *uint64_t v39 = *v40;
  v39[1] = v41;
  uint64_t v42 = a3[21];
  uint64_t v43 = a3[22];
  uint64_t v44 = (void *)(a1 + v42);
  uint64_t v45 = (void *)(a2 + v42);
  uint64_t v46 = v45[1];
  *uint64_t v44 = *v45;
  v44[1] = v46;
  uint64_t v47 = a1 + v43;
  uint64_t v59 = a2 + v43;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v60(v47, v59, v61);
  uint64_t v48 = a3[23];
  uint64_t v49 = a3[24];
  uint64_t v50 = (void *)(a1 + v48);
  uint64_t v51 = (void *)(a2 + v48);
  uint64_t v52 = v51[1];
  void *v50 = *v51;
  v50[1] = v52;
  uint64_t v53 = (void *)(a1 + v49);
  uint64_t v54 = (void *)(a2 + v49);
  uint64_t v55 = v54[1];
  *uint64_t v53 = *v54;
  v53[1] = v55;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v7;
  uint64_t v8 = a3[12];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_247A871D0();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24);
  v12(v9, v10, v11);
  uint64_t v13 = a3[13];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  uint64_t v16 = a3[15];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  char v19 = *(unsigned char *)(v18 + 8);
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = v19;
  uint64_t v20 = a3[16];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[17];
  int v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  *int v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[18];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[19];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[20];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)(a2 + v32);
  void *v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[21];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (void *)(a2 + v35);
  *uint64_t v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12(a1 + a3[22], a2 + a3[22], v11);
  uint64_t v38 = a3[23];
  uint64_t v39 = (void *)(a1 + v38);
  uint64_t v40 = (void *)(a2 + v38);
  *uint64_t v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[24];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (void *)(a2 + v41);
  void *v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for InstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  long long v8 = *(_OWORD *)(a2 + 96);
  uint64_t v9 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v9;
  uint64_t v10 = a3[12];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(_OWORD *)(a1 + 96) = v8;
  uint64_t v13 = sub_247A871D0();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  uint64_t v15 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[15];
  uint64_t v17 = a3[16];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(void *)uint64_t v18 = *(void *)v19;
  *(_OWORD *)(a1 + v17) = *(_OWORD *)(a2 + v17);
  uint64_t v20 = a3[18];
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  uint64_t v21 = a3[20];
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  uint64_t v22 = a3[22];
  *(_OWORD *)(a1 + a3[21]) = *(_OWORD *)(a2 + a3[21]);
  v14(a1 + v22, a2 + v22, v13);
  uint64_t v23 = a3[24];
  *(_OWORD *)(a1 + a3[23]) = *(_OWORD *)(a2 + a3[23]);
  *(_OWORD *)(a1 + v23) = *(_OWORD *)(a2 + v23);
  return a1;
}

uint64_t assignWithTake for InstallationEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v12 = a3[12];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_247A871D0();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  uint64_t v17 = a3[13];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[15];
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  *(void *)uint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  uint64_t v25 = a3[16];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[17];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *uint64_t v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[18];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (uint64_t *)(a2 + v35);
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  *uint64_t v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[19];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (uint64_t *)(a2 + v40);
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  *uint64_t v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[20];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (uint64_t *)(a2 + v45);
  uint64_t v49 = *v47;
  uint64_t v48 = v47[1];
  void *v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[21];
  uint64_t v51 = (void *)(a1 + v50);
  uint64_t v52 = (uint64_t *)(a2 + v50);
  uint64_t v54 = *v52;
  uint64_t v53 = v52[1];
  *uint64_t v51 = v54;
  v51[1] = v53;
  swift_bridgeObjectRelease();
  v16(a1 + a3[22], a2 + a3[22], v15);
  uint64_t v55 = a3[23];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = (uint64_t *)(a2 + v55);
  uint64_t v59 = *v57;
  uint64_t v58 = v57[1];
  *uint64_t v56 = v59;
  v56[1] = v58;
  swift_bridgeObjectRelease();
  uint64_t v60 = a3[24];
  uint64_t v61 = (void *)(a1 + v60);
  uint64_t v62 = (uint64_t *)(a2 + v60);
  uint64_t v64 = *v62;
  uint64_t v63 = v62[1];
  void *v61 = v64;
  v61[1] = v63;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallationEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247A7D640);
}

uint64_t sub_247A7D640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_247A871D0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 48);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for InstallationEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247A7D704);
}

uint64_t sub_247A7D704(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 56) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_247A871D0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 48);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_247A7D7AC()
{
  uint64_t result = sub_247A871D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for InstallationEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
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
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InstallationEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *uint64_t result = a2 + 20;
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
        JUMPOUT(0x247A7D9E4);
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
          *uint64_t result = a2 + 20;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InstallationEvent.CodingKeys()
{
  return &type metadata for InstallationEvent.CodingKeys;
}

unint64_t sub_247A7DA20()
{
  unint64_t result = qword_269298900;
  if (!qword_269298900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298900);
  }
  return result;
}

unint64_t sub_247A7DA78()
{
  unint64_t result = qword_269298908;
  if (!qword_269298908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298908);
  }
  return result;
}

unint64_t sub_247A7DAD0()
{
  unint64_t result = qword_269298910;
  if (!qword_269298910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298910);
  }
  return result;
}

uint64_t sub_247A7DB24(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64697344746C61 && a2 == 0xE700000000000000;
  if (v3 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684632420 && a2 == 0xE400000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000247A892A0 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4449746E65696C63 && a2 == 0xE800000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x726556746E657665 && a2 == 0xEC0000006E6F6973 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 1684633189 && a2 == 0xE400000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x446C6C6174736E69 && a2 == 0xEB00000000657461 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x546C6C6174736E69 && a2 == 0xEB00000000657079 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x617465427369 && a2 == 0xE600000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x44496D657469 && a2 == 0xE600000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEA0000000000746ELL || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x69616D6F44626577 && a2 == 0xE90000000000006ELL || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x6772615474736F70 && a2 == 0xEE00657461447465 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else if (a1 == 0x6E656B6F547367 && a2 == 0xE700000000000000 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 19;
  }
  else if (a1 == 0x6B6F54534774776ALL && a2 == 0xEA00000000006E65)
  {
    swift_bridgeObjectRelease();
    return 20;
  }
  else
  {
    char v6 = sub_247A874E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 20;
    }
    else {
      return 21;
    }
  }
}

unint64_t AppInstallationMetricsError.description.getter()
{
  unint64_t result = 0xD00000000000001ALL;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x6874756120746F4ELL;
      break;
    case 3:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

BOOL static AppInstallationMetricsError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppInstallationMetricsError.hash(into:)()
{
  return sub_247A87570();
}

unint64_t sub_247A7E3F8(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x6F68747541746F6ELL;
      break;
    case 3:
      unint64_t result = 0x456B726F7774656ELL;
      break;
    case 4:
      unint64_t result = 0x4E746E756F636361;
      break;
    case 5:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_247A7E4E8()
{
  return 0;
}

void sub_247A7E4F4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_247A7E500(uint64_t a1)
{
  unint64_t v2 = sub_247A7EF3C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A7E53C(uint64_t a1)
{
  unint64_t v2 = sub_247A7EF3C();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_247A7E580()
{
  return sub_247A7E3F8(*v0);
}

uint64_t sub_247A7E588@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A80180(a1, a2);
  *a3 = result;
  return result;
}

void sub_247A7E5B0(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_247A7E5BC(uint64_t a1)
{
  unint64_t v2 = sub_247A7EE94();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A7E5F8(uint64_t a1)
{
  unint64_t v2 = sub_247A7EE94();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A7E634@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_247A7E664(uint64_t a1)
{
  unint64_t v2 = sub_247A7EF90();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A7E6A0(uint64_t a1)
{
  unint64_t v2 = sub_247A7EF90();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A7E6DC(uint64_t a1)
{
  unint64_t v2 = sub_247A7EFE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A7E718(uint64_t a1)
{
  unint64_t v2 = sub_247A7EFE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A7E754(uint64_t a1)
{
  unint64_t v2 = sub_247A7F038();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A7E790(uint64_t a1)
{
  unint64_t v2 = sub_247A7F038();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A7E7CC(uint64_t a1)
{
  unint64_t v2 = sub_247A7EEE8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A7E808(uint64_t a1)
{
  unint64_t v2 = sub_247A7EEE8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_247A7E844(uint64_t a1)
{
  unint64_t v2 = sub_247A7F08C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A7E880(uint64_t a1)
{
  unint64_t v2 = sub_247A7F08C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AppInstallationMetricsError.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298918);
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v48 = v3;
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v46 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298920);
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v43 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298928);
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v42 = v9;
  MEMORY[0x270FA5388](v9, v10);
  uint64_t v40 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298930);
  uint64_t v38 = *(void *)(v12 - 8);
  uint64_t v39 = v12;
  MEMORY[0x270FA5388](v12, v13);
  uint64_t v37 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298938);
  uint64_t v35 = *(void *)(v15 - 8);
  uint64_t v36 = v15;
  MEMORY[0x270FA5388](v15, v16);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298940);
  uint64_t v34 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19, v20);
  uint64_t v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298948);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v49 = v23;
  uint64_t v50 = v24;
  MEMORY[0x270FA5388](v23, v25);
  uint64_t v27 = (char *)&v34 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A7EE94();
  sub_247A875E0();
  switch(v28)
  {
    case 1:
      char v52 = 1;
      sub_247A7F038();
      uint64_t v29 = v49;
      sub_247A87440();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v36);
      return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v27, v29);
    case 2:
      char v53 = 2;
      sub_247A7EFE4();
      uint64_t v30 = v37;
      uint64_t v29 = v49;
      sub_247A87440();
      uint64_t v32 = v38;
      uint64_t v31 = v39;
      goto LABEL_8;
    case 3:
      char v54 = 3;
      sub_247A7EF90();
      uint64_t v30 = v40;
      uint64_t v29 = v49;
      sub_247A87440();
      uint64_t v32 = v41;
      uint64_t v31 = v42;
      goto LABEL_8;
    case 4:
      char v55 = 4;
      sub_247A7EF3C();
      uint64_t v30 = v43;
      uint64_t v29 = v49;
      sub_247A87440();
      uint64_t v32 = v44;
      uint64_t v31 = v45;
      goto LABEL_8;
    case 5:
      char v56 = 5;
      sub_247A7EEE8();
      uint64_t v30 = v46;
      uint64_t v29 = v49;
      sub_247A87440();
      uint64_t v32 = v47;
      uint64_t v31 = v48;
LABEL_8:
      (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v31);
      break;
    default:
      char v51 = 0;
      sub_247A7F08C();
      uint64_t v29 = v49;
      sub_247A87440();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v22, v19);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v27, v29);
}

unint64_t sub_247A7EE94()
{
  unint64_t result = qword_269298950;
  if (!qword_269298950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298950);
  }
  return result;
}

unint64_t sub_247A7EEE8()
{
  unint64_t result = qword_269298958;
  if (!qword_269298958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298958);
  }
  return result;
}

unint64_t sub_247A7EF3C()
{
  unint64_t result = qword_269298960;
  if (!qword_269298960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298960);
  }
  return result;
}

unint64_t sub_247A7EF90()
{
  unint64_t result = qword_269298968;
  if (!qword_269298968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298968);
  }
  return result;
}

unint64_t sub_247A7EFE4()
{
  unint64_t result = qword_269298970;
  if (!qword_269298970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298970);
  }
  return result;
}

unint64_t sub_247A7F038()
{
  unint64_t result = qword_269298978;
  if (!qword_269298978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298978);
  }
  return result;
}

unint64_t sub_247A7F08C()
{
  unint64_t result = qword_269298980;
  if (!qword_269298980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298980);
  }
  return result;
}

uint64_t AppInstallationMetricsError.hashValue.getter()
{
  return sub_247A87580();
}

uint64_t AppInstallationMetricsError.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298988);
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v59 = v3;
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v73 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298990);
  uint64_t v63 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68, v6);
  uint64_t v72 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298998);
  uint64_t v66 = *(void *)(v8 - 8);
  uint64_t v67 = v8;
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v71 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692989A0);
  uint64_t v64 = *(void *)(v11 - 8);
  uint64_t v65 = v11;
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v69 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692989A8);
  uint64_t v61 = *(void *)(v14 - 8);
  uint64_t v62 = v14;
  MEMORY[0x270FA5388](v14, v15);
  uint64_t v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692989B0);
  uint64_t v60 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18, v19);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692989B8);
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22, v24);
  uint64_t v26 = (char *)&v55 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = a1[3];
  uint64_t v74 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v27);
  sub_247A7EE94();
  uint64_t v28 = v75;
  sub_247A875C0();
  if (v28) {
    goto LABEL_6;
  }
  uint64_t v56 = v18;
  uint64_t v57 = v21;
  uint64_t v29 = v17;
  uint64_t v31 = v71;
  uint64_t v30 = v72;
  uint64_t v32 = v73;
  uint64_t v75 = v22;
  uint64_t v33 = v26;
  uint64_t v34 = sub_247A87420();
  if (*(void *)(v34 + 16) != 1)
  {
    uint64_t v41 = sub_247A87350();
    swift_allocError();
    uint64_t v43 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298580);
    *uint64_t v43 = &type metadata for AppInstallationMetricsError;
    uint64_t v44 = v75;
    sub_247A873B0();
    sub_247A87340();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v41 - 8) + 104))(v43, *MEMORY[0x263F8DCB0], v41);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v33, v44);
LABEL_6:
    uint64_t v39 = (uint64_t)v74;
    return __swift_destroy_boxed_opaque_existential_1Tm(v39);
  }
  char v35 = *(unsigned char *)(v34 + 32);
  switch(v35)
  {
    case 1:
      char v77 = 1;
      sub_247A7F038();
      uint64_t v46 = v75;
      sub_247A873A0();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v29, v62);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v33, v46);
      uint64_t v39 = (uint64_t)v74;
      uint64_t v40 = v70;
      break;
    case 2:
      char v47 = *(unsigned char *)(v34 + 32);
      char v78 = 2;
      sub_247A7EFE4();
      uint64_t v48 = v69;
      uint64_t v49 = v75;
      sub_247A873A0();
      uint64_t v51 = v64;
      uint64_t v50 = v65;
      goto LABEL_11;
    case 3:
      char v47 = *(unsigned char *)(v34 + 32);
      char v79 = 3;
      sub_247A7EF90();
      uint64_t v48 = v31;
      uint64_t v49 = v75;
      sub_247A873A0();
      uint64_t v51 = v66;
      uint64_t v50 = v67;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v51 + 8))(v48, v50);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v33, v49);
      uint64_t v39 = (uint64_t)v74;
      uint64_t v40 = v70;
      char v35 = v47;
      break;
    case 4:
      char v52 = *(unsigned char *)(v34 + 32);
      char v80 = 4;
      sub_247A7EF3C();
      uint64_t v53 = v75;
      sub_247A873A0();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v30, v68);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v33, v53);
      uint64_t v39 = (uint64_t)v74;
      uint64_t v40 = v70;
      char v35 = v52;
      break;
    case 5:
      uint64_t v72 = (char *)*(unsigned __int8 *)(v34 + 32);
      char v81 = 5;
      sub_247A7EEE8();
      uint64_t v54 = v75;
      sub_247A873A0();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v32, v59);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v33, v54);
      uint64_t v39 = (uint64_t)v74;
      uint64_t v40 = v70;
      char v35 = (char)v72;
      break;
    default:
      char v36 = *(unsigned char *)(v34 + 32);
      char v76 = 0;
      sub_247A7F08C();
      uint64_t v37 = v57;
      uint64_t v38 = v75;
      sub_247A873A0();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v37, v56);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v33, v38);
      uint64_t v39 = (uint64_t)v74;
      uint64_t v40 = v70;
      char v35 = v36;
      break;
  }
  *uint64_t v40 = v35;
  return __swift_destroy_boxed_opaque_existential_1Tm(v39);
}

unint64_t sub_247A7F9B4()
{
  unint64_t result = qword_2692989C0;
  if (!qword_2692989C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692989C0);
  }
  return result;
}

uint64_t sub_247A7FA1C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return AppInstallationMetricsError.init(from:)(a1, a2);
}

uint64_t sub_247A7FA34(void *a1)
{
  return AppInstallationMetricsError.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError()
{
  return &type metadata for AppInstallationMetricsError;
}

uint64_t getEnumTagSinglePayload for AppInstallationEligibility.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s22AppInstallationMetrics27AppInstallationMetricsErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x247A7FBC0);
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

ValueMetadata *type metadata accessor for AppInstallationMetricsError.CodingKeys()
{
  return &type metadata for AppInstallationMetricsError.CodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.UnknownCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.ServiceUnavailableCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.ServiceUnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.NotAuthorizedCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.NotAuthorizedCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.NetworkErrorCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.NetworkErrorCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.AccountNotFoundCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.AccountNotFoundCodingKeys;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsError.UnableToGenerateBytesCodingKeys()
{
  return &type metadata for AppInstallationMetricsError.UnableToGenerateBytesCodingKeys;
}

unint64_t sub_247A7FC5C()
{
  unint64_t result = qword_2692989C8;
  if (!qword_2692989C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692989C8);
  }
  return result;
}

unint64_t sub_247A7FCB4()
{
  unint64_t result = qword_2692989D0;
  if (!qword_2692989D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692989D0);
  }
  return result;
}

unint64_t sub_247A7FD0C()
{
  unint64_t result = qword_2692989D8;
  if (!qword_2692989D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692989D8);
  }
  return result;
}

unint64_t sub_247A7FD64()
{
  unint64_t result = qword_2692989E0;
  if (!qword_2692989E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692989E0);
  }
  return result;
}

unint64_t sub_247A7FDBC()
{
  unint64_t result = qword_2692989E8;
  if (!qword_2692989E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692989E8);
  }
  return result;
}

unint64_t sub_247A7FE14()
{
  unint64_t result = qword_2692989F0;
  if (!qword_2692989F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692989F0);
  }
  return result;
}

unint64_t sub_247A7FE6C()
{
  unint64_t result = qword_2692989F8;
  if (!qword_2692989F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2692989F8);
  }
  return result;
}

unint64_t sub_247A7FEC4()
{
  unint64_t result = qword_269298A00;
  if (!qword_269298A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298A00);
  }
  return result;
}

unint64_t sub_247A7FF1C()
{
  unint64_t result = qword_269298A08;
  if (!qword_269298A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298A08);
  }
  return result;
}

unint64_t sub_247A7FF74()
{
  unint64_t result = qword_269298A10;
  if (!qword_269298A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298A10);
  }
  return result;
}

unint64_t sub_247A7FFCC()
{
  unint64_t result = qword_269298A18;
  if (!qword_269298A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298A18);
  }
  return result;
}

unint64_t sub_247A80024()
{
  unint64_t result = qword_269298A20;
  if (!qword_269298A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298A20);
  }
  return result;
}

unint64_t sub_247A8007C()
{
  unint64_t result = qword_269298A28;
  if (!qword_269298A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298A28);
  }
  return result;
}

unint64_t sub_247A800D4()
{
  unint64_t result = qword_269298A30;
  if (!qword_269298A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298A30);
  }
  return result;
}

unint64_t sub_247A8012C()
{
  unint64_t result = qword_269298A38;
  if (!qword_269298A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298A38);
  }
  return result;
}

uint64_t sub_247A80180(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000247A89350 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F68747541746F6ELL && a2 == 0xED000064657A6972 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x456B726F7774656ELL && a2 == 0xEC000000726F7272 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4E746E756F636361 && a2 == 0xEF646E756F46746FLL || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000247A89370)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_247A874E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

unint64_t ServiceMachName.getter()
{
  return 0xD000000000000024;
}

uint64_t sub_247A80440(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppInstallationEvent();
  sub_247A84460(&qword_269298A50);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v5 = sub_247A875D0();
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v9, a2, v4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
  sub_247A874D0();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v4);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
}

uint64_t sub_247A805D0@<X0>(void *a1@<X0>, unsigned char **a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D0);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = swift_allocObject();
  *(_WORD *)(v8 + 16) = -256;
  sub_247A87160();
  swift_allocObject();
  sub_247A87150();
  sub_247A87360();
  uint64_t v9 = sub_247A87370();
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_247A859D8;
    *(void *)(v11 + 24) = v8;
    v22[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D8);
    v22[0] = sub_247A85DFC;
    v22[1] = v11;
    swift_retain();
    uint64_t v12 = (void (*)(unsigned char *, void))sub_247A87140();
    sub_247A731CC((uint64_t)v22, (uint64_t)v7);
    v12(v21, 0);
    unint64_t v13 = sub_247A855E4();
    MEMORY[0x270FA5388](v13, *a1);
    (*(void (**)(unsigned char *))(v15 + 16))(&v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    uint64_t v16 = sub_247A871C0();
    unint64_t v18 = v17;
    sub_247A732DC();
    sub_247A87130();
    if (v2)
    {
      swift_release();
      sub_247A73330(v16, v18);
      return swift_release();
    }
    sub_247A73330(v16, v18);
    uint64_t result = swift_beginAccess();
    unsigned int v19 = *(unsigned __int16 *)(v8 + 16);
    if (v19 >> 8 <= 0xFE)
    {
      uint64_t v20 = *v23;
      *uint64_t v20 = v19;
      v20[1] = BYTE1(v19) & 1;
      swift_release();
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247A8090C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D0);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(unsigned char *)(v8 + 24) = -1;
  sub_247A87160();
  swift_allocObject();
  sub_247A87150();
  sub_247A87360();
  uint64_t v9 = sub_247A87370();
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_247A858A4;
    *(void *)(v11 + 24) = v8;
    v23[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D8);
    v23[0] = sub_247A85DFC;
    v23[1] = v11;
    swift_retain();
    uint64_t v12 = (void (*)(unsigned char *, void))sub_247A87140();
    sub_247A731CC((uint64_t)v23, (uint64_t)v7);
    v12(v22, 0);
    unint64_t v13 = sub_247A855E4();
    MEMORY[0x270FA5388](v13, *a1);
    (*(void (**)(unsigned char *))(v15 + 16))(&v22[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    uint64_t v16 = sub_247A871C0();
    unint64_t v18 = v17;
    sub_247A732DC();
    sub_247A87130();
    if (v2)
    {
      swift_release();
      sub_247A73330(v16, v18);
      return swift_release();
    }
    sub_247A73330(v16, v18);
    uint64_t result = swift_beginAccess();
    int v19 = *(unsigned __int8 *)(v8 + 24);
    if (v19 != 255)
    {
      uint64_t v20 = *(void *)(v8 + 16);
      uint64_t v21 = *v24;
      *(void *)uint64_t v21 = v20;
      *(unsigned char *)(v21 + 8) = v19 & 1;
      sub_247A858C0(v20, v19 & 1);
      swift_release();
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247A80C50@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D0);
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(unsigned char *)(v8 + 32) = -1;
  sub_247A87160();
  swift_allocObject();
  sub_247A87150();
  sub_247A87360();
  uint64_t v9 = sub_247A87370();
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_247A85574;
    *(void *)(v11 + 24) = v8;
    v24[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2692984D8);
    v24[0] = sub_247A855C8;
    v24[1] = v11;
    swift_retain();
    uint64_t v12 = (void (*)(unsigned char *, void))sub_247A87140();
    sub_247A731CC((uint64_t)v24, (uint64_t)v7);
    v12(v23, 0);
    unint64_t v13 = sub_247A855E4();
    MEMORY[0x270FA5388](v13, *a1);
    (*(void (**)(unsigned char *))(v15 + 16))(&v23[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    uint64_t v16 = sub_247A871C0();
    unint64_t v18 = v17;
    sub_247A732DC();
    sub_247A87130();
    if (v2)
    {
      swift_release();
      sub_247A73330(v16, v18);
      return swift_release();
    }
    sub_247A73330(v16, v18);
    uint64_t result = swift_beginAccess();
    int v19 = *(unsigned __int8 *)(v8 + 32);
    if (v19 != 255)
    {
      uint64_t v20 = *(void *)(v8 + 16);
      uint64_t v21 = *(void *)(v8 + 24);
      uint64_t v22 = *v25;
      *(void *)uint64_t v22 = v20;
      *(void *)(v22 + 8) = v21;
      *(unsigned char *)(v22 + 16) = v19 & 1;
      sub_247A85638(v20, v21, v19 & 1);
      swift_release();
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247A80F98(void *a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_247A875A0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298B08);
    sub_247A859F4(&qword_269298B10, &qword_269298B08);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
    sub_247A874C0();
    swift_beginAccess();
    *(_WORD *)(a2 + 16) = v5;
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  }
  return result;
}

uint64_t sub_247A81094(void *a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_247A875A0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298AE8);
    sub_247A859F4(&qword_269298AF0, &qword_269298AE8);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, v10);
    sub_247A874C0();
    swift_beginAccess();
    uint64_t v5 = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = v7;
    unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
    *(unsigned char *)(a2 + 24) = v8;
    sub_247A858CC(v5, v6);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  }
  return result;
}

uint64_t sub_247A811A0(void *a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = sub_247A875A0();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298AC8);
    sub_247A859F4(&qword_269298AD0, &qword_269298AC8);
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    sub_247A874C0();
    swift_beginAccess();
    uint64_t v5 = *(void *)(a2 + 16);
    uint64_t v6 = *(void *)(a2 + 24);
    *(_OWORD *)(a2 + 16) = v8;
    unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
    *(unsigned char *)(a2 + 32) = v9;
    sub_247A85690(v5, v6, v7);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  }
  return result;
}

uint64_t sub_247A812AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[11] = a3;
  v4[12] = v3;
  v4[9] = a1;
  v4[10] = a2;
  v4[13] = *v3;
  uint64_t v5 = *(void *)(type metadata accessor for AppInstallationEvent() - 8);
  v4[14] = v5;
  v4[15] = *(void *)(v5 + 64);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247A813AC, 0, 0);
}

uint64_t sub_247A813AC()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  *(void *)(v0 + 48) = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 128);
    uint64_t v2 = *(void *)(v0 + 136);
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v5 = *(uint64_t **)(v0 + 72);
    sub_247A84460(&qword_269298A48);
    sub_247A84460(&qword_269298A50);
    sub_247A7945C(*v5, v2);
    sub_247A7945C(v2, v3);
    unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v7 = swift_allocObject();
    sub_247A85BA8(v3, v7 + v6);
    sub_247A87190();
    swift_allocObject();
    sub_247A87180();
    *(void *)(v0 + 56) = sub_247A85C0C;
    *(void *)(v0 + 64) = v7;
    sub_247A7262C();
    uint64_t v8 = sub_247A87170();
    *(void *)(v0 + 144) = v8;
    *(void *)(v0 + 152) = v9;
    uint64_t v10 = *(void *)(v0 + 136);
    uint64_t v14 = v8;
    uint64_t v15 = v9;
    uint64_t v17 = *(void *)(v0 + 96);
    uint64_t v16 = *(void *)(v0 + 104);
    long long v22 = *(_OWORD *)(v0 + 80);
    swift_release();
    swift_release();
    sub_247A794C0(v10);
    uint64_t v18 = *(void *)(v17 + 16);
    uint64_t v19 = swift_task_alloc();
    *(void *)(v0 + 160) = v19;
    *(void *)(v19 + 16) = v18;
    *(_OWORD *)(v19 + 24) = v22;
    *(void *)(v19 + 40) = v14;
    *(void *)(v19 + 48) = v15;
    *(void *)(v19 + 56) = v16;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v20;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298AF8);
    *uint64_t v20 = v0;
    v20[1] = sub_247A816CC;
    return MEMORY[0x270FA2360](v0 + 184, 0, 0, 0xD000000000000021, 0x8000000247A893F0, sub_247A85C78, v19, v21);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    unsigned char *v11 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

uint64_t sub_247A816CC()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247A81870;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_247A817E8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247A817E8()
{
  sub_247A73330(*(void *)(v0 + 144), *(void *)(v0 + 152));
  uint64_t v1 = *(unsigned __int8 *)(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_247A81870()
{
  sub_247A73330(v0[18], v0[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247A818F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[10] = a3;
  v4[11] = v3;
  v4[9] = a2;
  v4[12] = *v3;
  return MEMORY[0x270FA2498](sub_247A8193C, 0, 0);
}

uint64_t sub_247A8193C()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  *(void *)(v0 + 48) = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (v1)
  {
    sub_247A87190();
    swift_allocObject();
    sub_247A87180();
    *(void *)(v0 + 56) = sub_247A85450;
    *(void *)(v0 + 64) = 0;
    sub_247A7262C();
    uint64_t v2 = sub_247A87170();
    *(void *)(v0 + 104) = v2;
    *(void *)(v0 + 112) = v3;
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v10 = *(void *)(v0 + 88);
    uint64_t v9 = *(void *)(v0 + 96);
    long long v15 = *(_OWORD *)(v0 + 72);
    swift_release();
    uint64_t v11 = *(void *)(v10 + 16);
    uint64_t v12 = swift_task_alloc();
    *(void *)(v0 + 120) = v12;
    *(void *)(v12 + 16) = v11;
    *(_OWORD *)(v12 + 24) = v15;
    *(void *)(v12 + 40) = v7;
    *(void *)(v12 + 48) = v8;
    *(void *)(v12 + 56) = v9;
    unint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 128) = v13;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298AF8);
    *unint64_t v13 = v0;
    v13[1] = sub_247A81B88;
    return MEMORY[0x270FA2360](v0 + 144, 0, 0, 0xD000000000000021, 0x8000000247A893F0, sub_247A858E4, v12, v14);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_247A81B88()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247A81D0C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_247A81CA4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247A81CA4()
{
  sub_247A73330(*(void *)(v0 + 104), *(void *)(v0 + 112));
  uint64_t v1 = *(unsigned __int8 *)(v0 + 144);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_247A81D0C()
{
  sub_247A73330(v0[13], v0[14]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247A81D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[11] = a3;
  v4[12] = v3;
  v4[10] = a2;
  v4[13] = *v3;
  return MEMORY[0x270FA2498](sub_247A81DC8, 0, 0);
}

uint64_t sub_247A81DC8()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  *(void *)(v0 + 48) = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (v1)
  {
    sub_247A87190();
    swift_allocObject();
    sub_247A87180();
    *(void *)(v0 + 56) = sub_247A85450;
    *(void *)(v0 + 64) = 0;
    sub_247A7262C();
    uint64_t v2 = sub_247A87170();
    *(void *)(v0 + 112) = v2;
    *(void *)(v0 + 120) = v3;
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v10 = *(void *)(v0 + 96);
    uint64_t v9 = *(void *)(v0 + 104);
    long long v15 = *(_OWORD *)(v0 + 80);
    swift_release();
    uint64_t v11 = *(void *)(v10 + 16);
    uint64_t v12 = swift_task_alloc();
    *(void *)(v0 + 128) = v12;
    *(void *)(v12 + 16) = v11;
    *(_OWORD *)(v12 + 24) = v15;
    *(void *)(v12 + 40) = v7;
    *(void *)(v12 + 48) = v8;
    *(void *)(v12 + 56) = v9;
    unint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v13;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298AD8);
    *unint64_t v13 = v0;
    v13[1] = sub_247A82014;
    return MEMORY[0x270FA2360](v0 + 72, 0, 0, 0xD000000000000021, 0x8000000247A893F0, sub_247A856A8, v12, v14);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_247A82014()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247A82198;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_247A82130;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247A82130()
{
  sub_247A73330(v0[14], v0[15]);
  uint64_t v1 = v0[9];
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_247A82198()
{
  sub_247A73330(v0[14], v0[15]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247A82208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[12] = a3;
  v4[13] = v3;
  v4[11] = a2;
  v4[14] = *v3;
  return MEMORY[0x270FA2498](sub_247A82254, 0, 0);
}

uint64_t sub_247A82254()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  *(void *)(v0 + 48) = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (v1)
  {
    sub_247A87190();
    swift_allocObject();
    sub_247A87180();
    *(void *)(v0 + 72) = sub_247A85450;
    *(void *)(v0 + 80) = 0;
    sub_247A7262C();
    uint64_t v2 = sub_247A87170();
    *(void *)(v0 + 120) = v2;
    *(void *)(v0 + 128) = v3;
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v10 = *(void *)(v0 + 104);
    uint64_t v9 = *(void *)(v0 + 112);
    long long v15 = *(_OWORD *)(v0 + 88);
    swift_release();
    uint64_t v11 = *(void *)(v10 + 16);
    uint64_t v12 = swift_task_alloc();
    *(void *)(v0 + 136) = v12;
    *(void *)(v12 + 16) = v11;
    *(_OWORD *)(v12 + 24) = v15;
    *(void *)(v12 + 40) = v7;
    *(void *)(v12 + 48) = v8;
    *(void *)(v12 + 56) = v9;
    unint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v13;
    *unint64_t v13 = v0;
    v13[1] = sub_247A82498;
    uint64_t v14 = MEMORY[0x263F8D310];
    return MEMORY[0x270FA2360](v0 + 56, 0, 0, 0xD000000000000021, 0x8000000247A893F0, sub_247A85468, v12, v14);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_247A82498()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247A8261C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_247A825B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247A825B4()
{
  sub_247A73330(v0[15], v0[16]);
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_247A8261C()
{
  sub_247A73330(v0[15], v0[16]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247A8268C(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a7;
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v31 = a4;
  uint64_t v32 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298B00);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9, v12);
  unint64_t v13 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v33 = a1;
  uint64_t v27 = v14;
  v14(v13, a1, v9);
  unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v16 = v15 + v11;
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v18(v17 + v15, v13, v9);
  aBlock[4] = sub_247A85908;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247A83498;
  aBlock[3] = &block_descriptor_92;
  uint64_t v19 = _Block_copy(aBlock);
  swift_release();
  id v20 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v19);
  _Block_release(v19);
  sub_247A87300();
  swift_unknownObjectRelease();
  sub_247A74640((uint64_t)aBlock, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269298AA8);
  if (swift_dynamicCast())
  {
    uint64_t v21 = v34;
    v27(v13, v33, v9);
    uint64_t v22 = swift_allocObject();
    v18(v22 + v15, v13, v9);
    uint64_t v23 = v29;
    *(void *)(v22 + ((v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = v28;
    v32(v21, v23, v30, sub_247A85920, v22);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_247A75F2C();
    uint64_t v24 = swift_allocError();
    *uint64_t v25 = 1;
    v35[0] = v24;
    sub_247A87290();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
}

uint64_t sub_247A82990(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a7;
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v31 = a4;
  uint64_t v32 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298B00);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9, v12);
  unint64_t v13 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v33 = a1;
  uint64_t v27 = v14;
  v14(v13, a1, v9);
  unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v16 = v15 + v11;
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v18(v17 + v15, v13, v9);
  aBlock[4] = sub_247A85908;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247A83498;
  aBlock[3] = &block_descriptor_68;
  uint64_t v19 = _Block_copy(aBlock);
  swift_release();
  id v20 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v19);
  _Block_release(v19);
  sub_247A87300();
  swift_unknownObjectRelease();
  sub_247A74640((uint64_t)aBlock, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269298AA8);
  if (swift_dynamicCast())
  {
    uint64_t v21 = v34;
    v27(v13, v33, v9);
    uint64_t v22 = swift_allocObject();
    v18(v22 + v15, v13, v9);
    uint64_t v23 = v29;
    *(void *)(v22 + ((v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = v28;
    v32(v21, v23, v30, sub_247A85920, v22);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_247A75F2C();
    uint64_t v24 = swift_allocError();
    *uint64_t v25 = 1;
    v35[0] = v24;
    sub_247A87290();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
}

uint64_t sub_247A82C94(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a7;
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v31 = a4;
  uint64_t v32 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298AE0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9, v12);
  unint64_t v13 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v33 = a1;
  uint64_t v27 = v14;
  v14(v13, a1, v9);
  unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v16 = v15 + v11;
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v18(v17 + v15, v13, v9);
  aBlock[4] = sub_247A856E4;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247A83498;
  aBlock[3] = &block_descriptor_42;
  uint64_t v19 = _Block_copy(aBlock);
  swift_release();
  id v20 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v19);
  _Block_release(v19);
  sub_247A87300();
  swift_unknownObjectRelease();
  sub_247A74640((uint64_t)aBlock, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269298AA8);
  if (swift_dynamicCast())
  {
    uint64_t v21 = v34;
    v27(v13, v33, v9);
    uint64_t v22 = swift_allocObject();
    v18(v22 + v15, v13, v9);
    uint64_t v23 = v29;
    *(void *)(v22 + ((v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = v28;
    v32(v21, v23, v30, sub_247A85770, v22);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_247A75F2C();
    uint64_t v24 = swift_allocError();
    *uint64_t v25 = 1;
    v35[0] = v24;
    sub_247A87290();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
}

uint64_t sub_247A82F98(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a7;
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v31 = a4;
  uint64_t v32 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298AA0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9, v12);
  unint64_t v13 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v33 = a1;
  uint64_t v27 = v14;
  v14(v13, a1, v9);
  unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v16 = v15 + v11;
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v18(v17 + v15, v13, v9);
  aBlock[4] = sub_247A8548C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247A83498;
  aBlock[3] = &block_descriptor_20;
  uint64_t v19 = _Block_copy(aBlock);
  swift_release();
  id v20 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v19);
  _Block_release(v19);
  sub_247A87300();
  swift_unknownObjectRelease();
  sub_247A74640((uint64_t)aBlock, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269298AA8);
  if (swift_dynamicCast())
  {
    uint64_t v21 = v34;
    v27(v13, v33, v9);
    uint64_t v22 = swift_allocObject();
    v18(v22 + v15, v13, v9);
    uint64_t v23 = v29;
    *(void *)(v22 + ((v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = v28;
    v32(v21, v23, v30, sub_247A854A4, v22);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_247A75F2C();
    uint64_t v24 = swift_allocError();
    *uint64_t v25 = 1;
    v35[0] = v24;
    sub_247A87290();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
}

uint64_t sub_247A8329C(void *a1, uint64_t a2, uint64_t *a3)
{
  if (qword_2692984A8 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_247A87210();
  __swift_project_value_buffer(v5, (uint64_t)qword_269298860);
  MEMORY[0x24C565D00](a1);
  MEMORY[0x24C565D00](a1);
  unint64_t v6 = sub_247A871F0();
  os_log_type_t v7 = sub_247A872D0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138543362;
    MEMORY[0x24C565D00](a1);
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    sub_247A872F0();
    void *v9 = v12;

    _os_log_impl(&dword_247A70000, v6, v7, "Error fetching remote object proxy: %{public}@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298AB8);
    swift_arrayDestroy();
    MEMORY[0x24C565E40](v9, -1, -1);
    MEMORY[0x24C565E40](v8, -1, -1);
  }
  else
  {
  }
  sub_247A75F2C();
  swift_allocError();
  *uint64_t v10 = 1;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_247A87290();
}

void sub_247A83498(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_247A83500(uint64_t a1, unint64_t a2)
{
  sub_247A83714(a1, a2, v5);
  char v2 = v5[0];
  if (v5[1])
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298B00);
    return sub_247A87290();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298B00);
    return sub_247A872A0();
  }
}

uint64_t sub_247A8359C(uint64_t a1, unint64_t a2)
{
  sub_247A839A4(a1, a2, (uint64_t)&v6);
  uint64_t v2 = v6;
  if (v7)
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298AE0);
    sub_247A87290();
    uint64_t v2 = v6;
    char v4 = v7;
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298AE0);
    sub_247A872A0();
    char v4 = 0;
  }
  return sub_247A85898(v2, v4);
}

uint64_t sub_247A83650(uint64_t a1, unint64_t a2)
{
  sub_247A83C38(a1, a2, (uint64_t)&v7);
  uint64_t v2 = v7;
  if (v9)
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298AA0);
    sub_247A87290();
    uint64_t v2 = v7;
    uint64_t v4 = v8;
    char v5 = v9;
  }
  else
  {
    uint64_t v4 = v8;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269298AA0);
    sub_247A872A0();
    char v5 = 0;
  }
  return sub_247A85564(v2, v4, v5);
}

uint64_t sub_247A83714@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v10 = &v11;
  uint64_t v7 = a1;
  unint64_t v8 = a2;
  char v9 = &v7;
  sub_247A854C4(a1, a2);
  sub_247A805D0(&v9, &v10);
  uint64_t result = sub_247A73330(v7, v8);
  char v5 = v11;
  char v6 = v12;
  if (!v12) {
    char v5 = v11 & 1;
  }
  *a3 = v5;
  a3[1] = v6;
  return result;
}

uint64_t sub_247A839A4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = &v11;
  uint64_t v7 = a1;
  unint64_t v8 = a2;
  char v9 = &v7;
  sub_247A854C4(a1, a2);
  sub_247A8090C(&v9, (uint64_t *)&v10);
  uint64_t result = sub_247A73330(v7, v8);
  uint64_t v5 = v11;
  char v6 = v12;
  if (v12) {
    uint64_t v5 = v11;
  }
  *(void *)a3 = v5;
  *(unsigned char *)(a3 + 8) = v6;
  return result;
}

uint64_t sub_247A83C38@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v11 = v12;
  uint64_t v8 = a1;
  unint64_t v9 = a2;
  uint64_t v10 = &v8;
  sub_247A854C4(a1, a2);
  sub_247A80C50(&v10, (uint64_t *)&v11);
  uint64_t result = sub_247A73330(v8, v9);
  uint64_t v5 = v12[0];
  uint64_t v6 = v12[1];
  char v7 = v13;
  if (v13)
  {
    uint64_t v5 = LOBYTE(v12[0]);
    uint64_t v6 = 0;
  }
  *(void *)a3 = v5;
  *(void *)(a3 + 8) = v6;
  *(unsigned char *)(a3 + 16) = v7;
  return result;
}

uint64_t static AppInstallationMetricsClient.addInstall(_:)(uint64_t a1)
{
  v1[8] = a1;
  type metadata accessor for AppInstallationEvent();
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247A83F70, 0, 0);
}

uint64_t sub_247A83F70()
{
  v0[5] = &type metadata for FeatureFlag;
  v0[6] = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_2692984B0 != -1) {
      swift_once();
    }
    uint64_t v3 = v0[9];
    uint64_t v2 = v0[10];
    sub_247A7945C(v0[8], v2);
    sub_247A84460(&qword_269298A48);
    sub_247A84460(&qword_269298A50);
    sub_247A7945C(v2, v3);
    v0[7] = v3;
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269298A58 + dword_269298A58);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[11] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_247A84174;
    return v8((uint64_t)(v0 + 7), (uint64_t)sub_247A84384, 0);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    unsigned char *v6 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    char v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_247A84174()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_247A84308;
  }
  else
  {
    sub_247A794C0(*(void *)(v2 + 72));
    uint64_t v3 = sub_247A84290;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_247A84290()
{
  sub_247A794C0(*(void *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247A84308()
{
  uint64_t v1 = v0[10];
  sub_247A794C0(v0[9]);
  sub_247A794C0(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

void sub_247A84384(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)sub_247A871A0();
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_247A844A4;
  v10[3] = &block_descriptor_98;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_handleAppInstall_reply_, v8, v9);
  _Block_release(v9);
}

uint64_t sub_247A84460(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AppInstallationEvent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247A844A4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = sub_247A871B0();
  unint64_t v7 = v6;

  v3(v5, v7);
  sub_247A73330(v5, v7);
  return swift_release();
}

uint64_t static AppInstallationMetricsClient.clearEvents()()
{
  return MEMORY[0x270FA2498](sub_247A84548, 0, 0);
}

uint64_t sub_247A84548()
{
  v0[5] = &type metadata for FeatureFlag;
  v0[6] = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_2692984B0 != -1) {
      swift_once();
    }
    unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269298A68 + dword_269298A68);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_247A846D8;
    return v6((uint64_t)(v0 + 2), (uint64_t)sub_247A847EC, 0);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    *id v4 = 1;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_247A846D8()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_247A85DCC;
  }
  else {
    uint64_t v2 = sub_247A85E38;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_247A847EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t static AppInstallationMetricsClient.flushEvents()()
{
  return MEMORY[0x270FA2498](sub_247A8481C, 0, 0);
}

uint64_t sub_247A8481C()
{
  v0[5] = &type metadata for FeatureFlag;
  v0[6] = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_2692984B0 != -1) {
      swift_once();
    }
    unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269298A68 + dword_269298A68);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_247A846D8;
    return v6((uint64_t)(v0 + 2), (uint64_t)sub_247A849AC, 0);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

void sub_247A849AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t static AppInstallationMetricsClient.getClientEvents()()
{
  return MEMORY[0x270FA2498](sub_247A849DC, 0, 0);
}

uint64_t sub_247A849DC()
{
  v0[5] = &type metadata for FeatureFlag;
  v0[6] = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_2692984B0 != -1) {
      swift_once();
    }
    unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269298A80 + dword_269298A80);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_247A84B6C;
    return v6((uint64_t)(v0 + 2), (uint64_t)sub_247A84CC0, 0);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_247A84B6C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_247A84CA8, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_247A84CA8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_247A84CC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t static AppInstallationMetricsClient.ping()()
{
  return MEMORY[0x270FA2498](sub_247A84CF0, 0, 0);
}

uint64_t sub_247A84CF0()
{
  v0[5] = &type metadata for FeatureFlag;
  v0[6] = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_2692984B0 != -1) {
      swift_once();
    }
    unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269298A90 + dword_269298A90);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_247A84E80;
    return v6((uint64_t)(v0 + 2), (uint64_t)sub_247A84FD0, 0);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_247A84E80(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(v6 + 64) = v2;
  swift_task_dealloc();
  if (v2)
  {
    return MEMORY[0x270FA2498](sub_247A84CA8, 0, 0);
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v7(a1, a2);
  }
}

void sub_247A84FD0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t static AppInstallationMetricsClient.postEvents()()
{
  return MEMORY[0x270FA2498](sub_247A85000, 0, 0);
}

uint64_t sub_247A85000()
{
  v0[5] = &type metadata for FeatureFlag;
  v0[6] = sub_247A771E0();
  char v1 = sub_247A871E0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_2692984B0 != -1) {
      swift_once();
    }
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269298A68 + dword_269298A68);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[7] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_247A85190;
    return v6((uint64_t)(v0 + 2), (uint64_t)sub_247A852BC, 0);
  }
  else
  {
    sub_247A75F2C();
    swift_allocError();
    *uint64_t v4 = 1;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_247A85190()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_247A84CA8;
  }
  else {
    uint64_t v2 = sub_247A852A4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247A852A4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_247A852BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_247A852D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_247A844A4;
  v10[3] = a6;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a1, *a7, v9);
  _Block_release(v9);
}

uint64_t AppInstallationMetricsClient.deinit()
{
  return v0;
}

uint64_t AppInstallationMetricsClient.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for AppInstallationMetricsClient()
{
  return self;
}

uint64_t method lookup function for AppInstallationMetricsClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppInstallationMetricsClient);
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

uint64_t sub_247A853F4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A875D0();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
}

uint64_t sub_247A85450(void *a1)
{
  return sub_247A853F4(a1);
}

uint64_t sub_247A85468(uint64_t a1)
{
  return sub_247A856C0(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_247A82F98);
}

uint64_t sub_247A85480()
{
  return objectdestroyTm(&qword_269298AA0);
}

uint64_t sub_247A8548C(void *a1)
{
  return sub_247A856F0(a1, &qword_269298AA0);
}

uint64_t sub_247A85498()
{
  return objectdestroy_22Tm(&qword_269298AA0);
}

uint64_t sub_247A854A4(uint64_t a1, uint64_t a2)
{
  return sub_247A85790(a1, a2, &qword_269298AA0, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_247A83650);
}

uint64_t sub_247A854C4(uint64_t a1, unint64_t a2)
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

uint64_t sub_247A8551C()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255) {
    sub_247A85564(*(void *)(v0 + 16), *(void *)(v0 + 24), v1 & 1);
  }
  return swift_deallocObject();
}

uint64_t sub_247A85564(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247A85574(void *a1)
{
  return sub_247A811A0(a1, v1);
}

uint64_t sub_247A85590()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247A855C8(uint64_t a1)
{
  return sub_247A73144(a1, *(uint64_t (**)(void))(v1 + 16));
}

unint64_t sub_247A855E4()
{
  unint64_t result = qword_269298AC0;
  if (!qword_269298AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298AC0);
  }
  return result;
}

uint64_t sub_247A85638(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRetain();
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

uint64_t sub_247A85690(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_247A85564(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_247A856A8(uint64_t a1)
{
  return sub_247A856C0(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_247A82C94);
}

uint64_t sub_247A856C0(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_247A856D8()
{
  return objectdestroyTm(&qword_269298AE0);
}

uint64_t sub_247A856E4(void *a1)
{
  return sub_247A856F0(a1, &qword_269298AE0);
}

uint64_t sub_247A856F0(void *a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_247A8329C(a1, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_247A85764()
{
  return objectdestroy_22Tm(&qword_269298AE0);
}

uint64_t sub_247A85770(uint64_t a1, uint64_t a2)
{
  return sub_247A85790(a1, a2, &qword_269298AE0, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_247A8359C);
}

uint64_t sub_247A85790(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v4 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a4(a1, a2, v4 + v8, v9);
}

uint64_t sub_247A85850()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  if (v1 != 255) {
    sub_247A85898(*(void *)(v0 + 16), v1 & 1);
  }
  return swift_deallocObject();
}

uint64_t sub_247A85898(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247A858A4(void *a1)
{
  return sub_247A81094(a1, v1);
}

uint64_t sub_247A858C0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_247A858CC(uint64_t result, unsigned __int8 a2)
{
  if (a2 != 255) {
    return sub_247A85898(result, a2 & 1);
  }
  return result;
}

uint64_t sub_247A858E4(uint64_t a1)
{
  return sub_247A856C0(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_247A82990);
}

uint64_t sub_247A858FC()
{
  return objectdestroyTm(&qword_269298B00);
}

uint64_t sub_247A85908(void *a1)
{
  return sub_247A856F0(a1, &qword_269298B00);
}

uint64_t sub_247A85914()
{
  return objectdestroy_22Tm(&qword_269298B00);
}

uint64_t sub_247A85924(uint64_t a1, unint64_t a2)
{
  return sub_247A83500(a1, a2);
}

uint64_t sub_247A859C8()
{
  return swift_deallocObject();
}

uint64_t sub_247A859D8(void *a1)
{
  return sub_247A80F98(a1, v1);
}

uint64_t sub_247A859F4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_247A85A44()
{
  uint64_t v1 = (int *)(type metadata accessor for AppInstallationEvent() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v2 + v1[9];
  uint64_t v4 = sub_247A871D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_247A85BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppInstallationEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247A85C0C(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for AppInstallationEvent() - 8);
  return sub_247A80440(a1, v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

uint64_t sub_247A85C78(uint64_t a1)
{
  return sub_247A856C0(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_247A8268C);
}

uint64_t sub_247A85C90()
{
  return objectdestroyTm(&qword_269298B00);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_247A85D28()
{
  return objectdestroy_22Tm(&qword_269298B00);
}

uint64_t objectdestroy_22Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_247A85DFC(uint64_t a1)
{
  return sub_247A855C8(a1);
}

uint64_t AppInstallationEligibility.accountIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEligibility.accountIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AppInstallationEligibility.accountIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.accountID.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t AppInstallationEligibility.accountID.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*AppInstallationEligibility.accountID.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.billingCountryCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEligibility.billingCountryCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AppInstallationEligibility.billingCountryCode.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.storefront.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEligibility.storefront.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AppInstallationEligibility.storefront.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.billingStorefront.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppInstallationEligibility.billingStorefront.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*AppInstallationEligibility.billingStorefront.modify())()
{
  return nullsub_1;
}

uint64_t AppInstallationEligibility.eligible.getter()
{
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t AppInstallationEligibility.eligible.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 80) = result;
  return result;
}

uint64_t (*AppInstallationEligibility.eligible.modify())()
{
  return nullsub_1;
}

double AppInstallationEligibility.init(accountID:billingCountryCode:eligible:)@<D0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = a1;
  *(unsigned char *)(a6 + 24) = a2 & 1;
  *(void *)(a6 + 32) = a3;
  *(void *)(a6 + 40) = a4;
  double result = 0.0;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(unsigned char *)(a6 + 80) = a5;
  return result;
}

uint64_t AppInstallationEligibility.init(accountID:storefront:eligible:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a6 + 16) = result;
  *(unsigned char *)(a6 + 24) = a2 & 1;
  *(void *)(a6 + 32) = 0;
  *(void *)(a6 + 40) = 0;
  *(void *)(a6 + 48) = a3;
  *(void *)(a6 + 56) = a4;
  *(void *)(a6 + 64) = 0;
  *(void *)(a6 + 72) = 0;
  *(unsigned char *)(a6 + 80) = a5;
  return result;
}

double AppInstallationEligibility.init(accountIdentifier:billingCountryCode:eligible:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = 0;
  *(unsigned char *)(a6 + 24) = 1;
  *(void *)(a6 + 32) = a3;
  *(void *)(a6 + 40) = a4;
  double result = 0.0;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(unsigned char *)(a6 + 80) = a5;
  return result;
}

uint64_t AppInstallationEligibility.init(accountID:accountIdentifier:billingStorefront:storefront:eligible:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(void *)a9 = a2;
  *(void *)(a9 + 8) = a3;
  *(void *)(a9 + 16) = result;
  *(unsigned char *)(a9 + 24) = 0;
  *(void *)(a9 + 32) = 0;
  *(void *)(a9 + 40) = 0;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 56) = a7;
  *(void *)(a9 + 64) = a4;
  *(void *)(a9 + 72) = a5;
  *(unsigned char *)(a9 + 80) = a8;
  return result;
}

unint64_t sub_247A86154(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x49746E756F636361;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x6F726665726F7473;
      break;
    case 5:
      unint64_t result = 0x656C626967696C65;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_247A86220()
{
  return sub_247A86154(*v0);
}

uint64_t sub_247A86228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247A86EC4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247A86250(uint64_t a1)
{
  unint64_t v2 = sub_247A86524();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247A8628C(uint64_t a1)
{
  unint64_t v2 = sub_247A86524();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AppInstallationEligibility.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298B18);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(v1 + 16);
  int v20 = *(unsigned __int8 *)(v1 + 24);
  uint64_t v8 = *(void *)(v1 + 32);
  uint64_t v18 = *(void *)(v1 + 40);
  uint64_t v19 = v8;
  uint64_t v9 = *(void *)(v1 + 48);
  uint64_t v16 = *(void *)(v1 + 56);
  uint64_t v17 = v9;
  uint64_t v10 = *(void *)(v1 + 72);
  uint64_t v14 = *(void *)(v1 + 64);
  uint64_t v15 = v10;
  v13[1] = *(unsigned __int8 *)(v1 + 80);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A86524();
  sub_247A875E0();
  char v28 = 0;
  uint64_t v11 = v22;
  sub_247A87450();
  if (!v11)
  {
    char v27 = 1;
    sub_247A87460();
    char v26 = 2;
    sub_247A87450();
    char v25 = 3;
    sub_247A87450();
    char v24 = 4;
    sub_247A87450();
    char v23 = 5;
    sub_247A87480();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_247A86524()
{
  unint64_t result = qword_269298B20;
  if (!qword_269298B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298B20);
  }
  return result;
}

uint64_t AppInstallationEligibility.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269298B28);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247A86524();
  sub_247A875C0();
  if (!v2)
  {
    char v40 = 0;
    uint64_t v11 = sub_247A873C0();
    uint64_t v13 = v12;
    char v39 = 1;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_247A873D0();
    int v32 = v15;
    uint64_t v33 = v14;
    uint64_t v34 = v11;
    char v38 = 2;
    uint64_t v16 = sub_247A873C0();
    uint64_t v18 = v17;
    uint64_t v30 = v16;
    uint64_t v31 = a2;
    char v37 = 3;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_247A873C0();
    uint64_t v21 = v20;
    uint64_t v28 = v19;
    uint64_t v29 = v6;
    char v36 = 4;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_247A873C0();
    uint64_t v24 = v23;
    uint64_t v27 = v22;
    char v35 = 5;
    swift_bridgeObjectRetain();
    char v25 = sub_247A873F0();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v5);
    char v26 = v31;
    *uint64_t v31 = v34;
    v26[1] = v13;
    v26[2] = v33;
    *((unsigned char *)v26 + 24) = v32 & 1;
    v26[4] = v30;
    v26[5] = v18;
    v26[6] = v28;
    v26[7] = v21;
    v26[8] = v27;
    v26[9] = v24;
    *((unsigned char *)v26 + 80) = v25 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247A86944@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AppInstallationEligibility.init(from:)(a1, a2);
}

uint64_t sub_247A8695C(void *a1)
{
  return AppInstallationEligibility.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for AppInstallationEligibility(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppInstallationEligibility()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppInstallationEligibility(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppInstallationEligibility(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for AppInstallationEligibility(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallationEligibility(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 81)) {
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

uint64_t storeEnumTagSinglePayload for AppInstallationEligibility(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationEligibility()
{
  return &type metadata for AppInstallationEligibility;
}

unsigned char *storeEnumTagSinglePayload for AppInstallationEligibility.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x247A86D84);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationEligibility.CodingKeys()
{
  return &type metadata for AppInstallationEligibility.CodingKeys;
}

unint64_t sub_247A86DC0()
{
  unint64_t result = qword_269298B30;
  if (!qword_269298B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298B30);
  }
  return result;
}

unint64_t sub_247A86E18()
{
  unint64_t result = qword_269298B38;
  if (!qword_269298B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298B38);
  }
  return result;
}

unint64_t sub_247A86E70()
{
  unint64_t result = qword_269298B40;
  if (!qword_269298B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269298B40);
  }
  return result;
}

uint64_t sub_247A86EC4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x8000000247A89440 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x49746E756F636361 && a2 == 0xE900000000000044 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000247A89460 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEA0000000000746ELL || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000247A892A0 || (sub_247A874E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656C626967696C65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v5 = sub_247A874E0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_247A87130()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_247A87140()
{
  return MEMORY[0x270EEF240]();
}

uint64_t sub_247A87150()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_247A87160()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_247A87170()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_247A87180()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_247A87190()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_247A871A0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_247A871B0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_247A871C0()
{
  return MEMORY[0x270EF0290]();
}

uint64_t sub_247A871D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_247A871E0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_247A871F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247A87200()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247A87210()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247A87220()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_247A87230()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247A87240()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247A87250()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247A87260()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_247A87270()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_247A87280()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_247A87290()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_247A872A0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_247A872B0()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_247A872C0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_247A872D0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247A872E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_247A872F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247A87300()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_247A87310()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_247A87320()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_247A87330()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_247A87340()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_247A87350()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_247A87360()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t sub_247A87370()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_247A87380()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247A87390()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247A873A0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_247A873B0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_247A873C0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_247A873D0()
{
  return MEMORY[0x270F9F2C0]();
}

uint64_t sub_247A873E0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_247A873F0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_247A87400()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247A87410()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_247A87420()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_247A87430()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_247A87440()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_247A87450()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_247A87460()
{
  return MEMORY[0x270F9F3F8]();
}

uint64_t sub_247A87470()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_247A87480()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_247A87490()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247A874A0()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_247A874B0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_247A874C0()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_247A874D0()
{
  return MEMORY[0x270F9F658]();
}

uint64_t sub_247A874E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247A874F0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_247A87510()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_247A87520()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_247A87530()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_247A87540()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_247A87550()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247A87560()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247A87570()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247A87580()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247A87590()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_247A875A0()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t sub_247A875B0()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t sub_247A875C0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247A875D0()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t sub_247A875E0()
{
  return MEMORY[0x270F9FD98]();
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

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x270FA01B0]();
}

uint64_t swift_allocateWitnessTablePack()
{
  return MEMORY[0x270FA01B8]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}