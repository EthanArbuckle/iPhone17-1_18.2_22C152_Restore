uint64_t sub_24E53A040(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24E53A164(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24E53B17C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_24E53B17C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
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

uint64_t sub_24E53A164(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24E545F90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24E542BC0(a5, a6);
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
  uint64_t v8 = sub_24E546000();
  if (!v8)
  {
    sub_24E546020();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24E546040();
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

uint64_t sub_24E53A320(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E53A388(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24E545D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  long long v12 = *(_OWORD *)(a2 + v11 + 24);
  *(_OWORD *)(a1 + v11 + 24) = v12;
  (**(void (***)(void))(v12 - 8))();
  uint64_t v13 = a3[7];
  long long v14 = *(_OWORD *)(a2 + v13 + 24);
  *(_OWORD *)(a1 + v13 + 24) = v14;
  (**(void (***)(void))(v14 - 8))();
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)(a2 + v15 + 24);
  if (v18)
  {
    uint64_t v19 = *(void *)(v17 + 32);
    *(void *)(v16 + 24) = v18;
    *(void *)(v16 + 32) = v19;
    (**(void (***)(void))(v18 - 8))();
  }
  else
  {
    long long v20 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    *(_OWORD *)(v16 + 16) = v20;
    *(void *)(v16 + 32) = *(void *)(v17 + 32);
  }
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t RequestCredential.authHeaders.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 8))();
  sub_24E545EF0();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24E545E70();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  sub_24E545DD0();
  sub_24E53A6B0(v4, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2498);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24E546B10;
  strcpy((char *)(inited + 32), "Authorization");
  *(_WORD *)(inited + 46) = -4864;
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = 0x206369736142;
  *(void *)(inited + 56) = 0xE600000000000000;
  return sub_24E53A708(inited);
}

uint64_t sub_24E53A6B0(uint64_t a1, unint64_t a2)
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

unint64_t sub_24E53A708(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2488);
  v2 = (void *)sub_24E546030();
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
    unint64_t result = sub_24E53B234(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    long long v12 = (void *)(v2[7] + 16 * result);
    *long long v12 = v8;
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

uint64_t sub_24E53A82C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v71 = a5;
  id v74 = a4;
  uint64_t v78 = a3;
  v79 = (void *)a2;
  uint64_t v70 = sub_24E545D60();
  uint64_t v69 = *(void *)(v70 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C23F0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24E545DB0();
  v75 = *(void (***)(void, void))(v10 - 8);
  v76 = (char *)v10;
  ((void (*)(void))MEMORY[0x270FA5388])();
  long long v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24E545DC0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v73 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v72 = (char *)&v68 - v17;
  uint64_t v77 = type metadata accessor for Request();
  MEMORY[0x270FA5388](v77);
  uint64_t v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1[3];
  uint64_t v20 = a1[4];
  v85 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v20);
  sub_24E545D90();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) == 1)
  {
    sub_24E53B390((uint64_t)v9, &qword_26B1C23F0);
    sub_24E53CBAC();
    swift_allocError();
    *(void *)uint64_t v22 = 1;
    *(unsigned char *)(v22 + 8) = 2;
    swift_willThrow();

    sub_24E53B390(v78, &qword_26B1C2420);
    ((void (**)(char *, char *))v75)[1](v12, v76);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v79);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
  }
  v24 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v25 = v72;
  v24(v72, v9, v13);
  ((void (**)(char *, char *))v75)[1](v12, v76);
  v24(v19, v25, v13);
  uint64_t v26 = v77;
  sub_24E53BDB8((uint64_t)v85, (uint64_t)&v19[*(int *)(v77 + 24)]);
  v27 = v79;
  sub_24E53BDB8((uint64_t)v79, (uint64_t)&v19[*(int *)(v26 + 28)]);
  uint64_t v28 = v78;
  sub_24E53CC00(v78, (uint64_t)&v19[*(int *)(v26 + 32)]);
  v29 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v76 = v19;
  v29(v73, v19, v13);
  sub_24E545D30();
  uint64_t v30 = v27[3];
  uint64_t v31 = v27[4];
  __swift_project_boxed_opaque_existential_1(v27, v30);
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)(v31 + 8) + 16))(v82, v30);
  sub_24E545CF0();
  uint64_t v32 = v27[3];
  uint64_t v33 = v27[4];
  __swift_project_boxed_opaque_existential_1(v27, v32);
  (*(void (**)(uint64_t))(*(void *)(v33 + 8) + 24))(v32);
  sub_24E545D20();
  uint64_t v34 = v27[3];
  uint64_t v35 = v27[4];
  __swift_project_boxed_opaque_existential_1(v27, v34);
  (*(void (**)(uint64_t, uint64_t))(v35 + 16))(v34, v35);
  sub_24E545D50();
  sub_24E53CC00(v28, (uint64_t)&v80);
  uint64_t v36 = (uint64_t)v85;
  if (!v81)
  {
    uint64_t v48 = (uint64_t)v27;
    uint64_t v49 = v28;
    uint64_t v50 = v26;
    sub_24E53B390((uint64_t)&v80, &qword_26B1C2420);
    id v51 = v74;
    if (!v74) {
      goto LABEL_50;
    }
    goto LABEL_27;
  }
  sub_24E53CCCC(&v80, (uint64_t)v82);
  uint64_t v37 = v83;
  uint64_t v38 = v84;
  __swift_project_boxed_opaque_existential_1(v82, v83);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 24))(v37, v38);
  int64_t v39 = 0;
  uint64_t v40 = result + 64;
  uint64_t v41 = 1 << *(unsigned char *)(result + 32);
  uint64_t v42 = -1;
  if (v41 < 64) {
    uint64_t v42 = ~(-1 << v41);
  }
  uint64_t v43 = v42 & *(void *)(result + 64);
  int64_t v44 = (unint64_t)(v41 + 63) >> 6;
  while (1)
  {
    if (v43)
    {
      v43 &= v43 - 1;
      goto LABEL_8;
    }
    int64_t v45 = v39 + 1;
    if (__OFADD__(v39, 1))
    {
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    if (v45 >= v44) {
      goto LABEL_24;
    }
    uint64_t v46 = *(void *)(v40 + 8 * v45);
    ++v39;
    if (!v46)
    {
      int64_t v39 = v45 + 1;
      if (v45 + 1 >= v44) {
        goto LABEL_24;
      }
      uint64_t v46 = *(void *)(v40 + 8 * v39);
      if (!v46)
      {
        int64_t v39 = v45 + 2;
        if (v45 + 2 >= v44) {
          goto LABEL_24;
        }
        uint64_t v46 = *(void *)(v40 + 8 * v39);
        if (!v46) {
          break;
        }
      }
    }
LABEL_23:
    uint64_t v43 = (v46 - 1) & v46;
LABEL_8:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E545D40();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v47 = v45 + 3;
  if (v47 < v44)
  {
    uint64_t v46 = *(void *)(v40 + 8 * v47);
    if (!v46)
    {
      while (1)
      {
        int64_t v39 = v47 + 1;
        if (__OFADD__(v47, 1)) {
          break;
        }
        if (v39 >= v44) {
          goto LABEL_24;
        }
        uint64_t v46 = *(void *)(v40 + 8 * v39);
        ++v47;
        if (v46) {
          goto LABEL_23;
        }
      }
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    int64_t v39 = v47;
    goto LABEL_23;
  }
LABEL_24:
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
  uint64_t v36 = (uint64_t)v85;
  uint64_t v49 = v78;
  uint64_t v48 = (uint64_t)v79;
  uint64_t v50 = v77;
  id v51 = v74;
  if (!v74)
  {
LABEL_50:
    unint64_t v67 = sub_24E53A708(MEMORY[0x263F8EE78]);

    sub_24E53B390(v49, &qword_26B1C2420);
    uint64_t v66 = (uint64_t)v76;
    *(void *)&v76[*(int *)(v50 + 36)] = v67;
LABEL_51:
    (*(void (**)(uint64_t, char *, uint64_t))(v69 + 32))(v66 + *(int *)(v50 + 20), v7, v70);
    sub_24E53B3EC(v66, v71);
    __swift_destroy_boxed_opaque_existential_1(v48);
    return __swift_destroy_boxed_opaque_existential_1(v36);
  }
LABEL_27:
  id v52 = v51;
  v53 = (void *)sub_24E545D00();
  id v54 = objc_msgSend(v52, sel_appleIDHeadersForRequest_, v53);

  if (!v54)
  {

    goto LABEL_50;
  }
  v75 = (void (**)(void, void))v52;
  uint64_t v55 = sub_24E545E60();

  *(void *)&v76[*(int *)(v50 + 36)] = v55;
  uint64_t v56 = v55 + 64;
  uint64_t v57 = 1 << *(unsigned char *)(v55 + 32);
  uint64_t v58 = -1;
  if (v57 < 64) {
    uint64_t v58 = ~(-1 << v57);
  }
  uint64_t v59 = v58 & *(void *)(v55 + 64);
  int64_t v60 = (unint64_t)(v57 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v61 = 0;
  while (2)
  {
    if (v59)
    {
      v59 &= v59 - 1;
LABEL_32:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E545D40();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  int64_t v62 = v61 + 1;
  if (__OFADD__(v61, 1)) {
    goto LABEL_53;
  }
  if (v62 >= v60)
  {
LABEL_48:
    id v65 = v75;

    sub_24E53B390(v78, &qword_26B1C2420);
    swift_release();
    uint64_t v36 = (uint64_t)v85;
    uint64_t v48 = (uint64_t)v79;
    uint64_t v66 = (uint64_t)v76;
    uint64_t v50 = v77;
    goto LABEL_51;
  }
  uint64_t v63 = *(void *)(v56 + 8 * v62);
  ++v61;
  if (v63) {
    goto LABEL_47;
  }
  int64_t v61 = v62 + 1;
  if (v62 + 1 >= v60) {
    goto LABEL_48;
  }
  uint64_t v63 = *(void *)(v56 + 8 * v61);
  if (v63) {
    goto LABEL_47;
  }
  int64_t v61 = v62 + 2;
  if (v62 + 2 >= v60) {
    goto LABEL_48;
  }
  uint64_t v63 = *(void *)(v56 + 8 * v61);
  if (v63)
  {
LABEL_47:
    uint64_t v59 = (v63 - 1) & v63;
    goto LABEL_32;
  }
  int64_t v64 = v62 + 3;
  if (v64 >= v60) {
    goto LABEL_48;
  }
  uint64_t v63 = *(void *)(v56 + 8 * v64);
  if (v63)
  {
    int64_t v61 = v64;
    goto LABEL_47;
  }
  while (1)
  {
    int64_t v61 = v64 + 1;
    if (__OFADD__(v64, 1)) {
      break;
    }
    if (v61 >= v60) {
      goto LABEL_48;
    }
    uint64_t v63 = *(void *)(v56 + 8 * v61);
    ++v64;
    if (v63) {
      goto LABEL_47;
    }
  }
LABEL_55:
  __break(1u);
  return result;
}

uint64_t sub_24E53B17C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24E53B1D8(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_24E53B234(uint64_t a1, uint64_t a2)
{
  sub_24E5460E0();
  sub_24E545EE0();
  uint64_t v4 = sub_24E546100();
  return sub_24E53B2AC(a1, a2, v4);
}

unint64_t sub_24E53B2AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24E546080() & 1) == 0)
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
      while (!v14 && (sub_24E546080() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24E53B390(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E53B3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Request();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E53B450()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Request();
  sub_24E545D60();
  sub_24E53BB38();
  uint64_t v26 = sub_24E546070();
  uint64_t result = sub_24E545D10();
  if (!result)
  {
LABEL_27:
    uint64_t v16 = (void *)(v1 + *(int *)(v2 + 28));
    uint64_t v17 = v16[3];
    uint64_t v18 = v16[4];
    __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    if (v20 >> 60 != 15)
    {
      uint64_t v21 = v19;
      unint64_t v22 = v20;
      sub_24E545EF0();
      sub_24E53BAE4();
      sub_24E545D70();
      if (!v23) {
        sub_24E545D80();
      }
      sub_24E545EF0();
      sub_24E53BAD0(v21, v22);
      swift_bridgeObjectRelease();
    }
    return v26;
  }
  uint64_t v24 = v2;
  uint64_t v25 = v0;
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  uint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v8 &= v8 - 1;
      goto LABEL_22;
    }
    int64_t v10 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v10 >= v9) {
      goto LABEL_26;
    }
    uint64_t v11 = *(void *)(v5 + 8 * v10);
    ++v4;
    if (!v11)
    {
      int64_t v4 = v10 + 1;
      if (v10 + 1 >= v9) {
        goto LABEL_26;
      }
      uint64_t v11 = *(void *)(v5 + 8 * v4);
      if (!v11)
      {
        int64_t v4 = v10 + 2;
        if (v10 + 2 >= v9) {
          goto LABEL_26;
        }
        uint64_t v11 = *(void *)(v5 + 8 * v4);
        if (!v11) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v8 = (v11 - 1) & v11;
LABEL_22:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E545EF0();
    sub_24E545EF0();
    if (qword_26B1C2440 != -1) {
      swift_once();
    }
    uint64_t v13 = qword_26B1C2438;
    uint64_t v14 = sub_24E545ED0();
    LOBYTE(v13) = sub_24E53B7C0(v14, v15, v13);
    swift_bridgeObjectRelease();
    if (v13) {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_24E545EF0();
    swift_bridgeObjectRelease();
    sub_24E545EF0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v12 = v10 + 3;
  if (v12 >= v9)
  {
LABEL_26:
    swift_release();
    uint64_t v2 = v24;
    uint64_t v1 = v25;
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)(v5 + 8 * v12);
  if (v11)
  {
    int64_t v4 = v12;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v4 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_26;
    }
    uint64_t v11 = *(void *)(v5 + 8 * v4);
    ++v12;
    if (v11) {
      goto LABEL_21;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_24E53B7C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24E5460E0();
    sub_24E545EE0();
    uint64_t v6 = sub_24E546100();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24E546080() & 1) != 0) {
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
          if (v17 || (sub_24E546080() & 1) != 0) {
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24E53B93C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for Request()
{
  uint64_t result = qword_26B1C2448;
  if (!qword_26B1C2448) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E53B9E8(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_24E545D60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[6]);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  uint64_t v7 = a1 + a2[8];
  if (*(void *)(v7 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v7);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E53BAD0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E53A6B0(a1, a2);
  }
  return a1;
}

unint64_t sub_24E53BAE4()
{
  unint64_t result = qword_26B1C23F8;
  if (!qword_26B1C23F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C23F8);
  }
  return result;
}

unint64_t sub_24E53BB38()
{
  unint64_t result = qword_26B1C23E0;
  if (!qword_26B1C23E0)
  {
    sub_24E545D60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C23E0);
  }
  return result;
}

uint64_t type metadata accessor for Response()
{
  uint64_t result = qword_26B1C2460;
  if (!qword_26B1C2460) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E5444E4);
}

uint64_t sub_24E53BBF0()
{
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v7 = *(void *)(v0 + 368);
  uint64_t v3 = *(void *)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 352);
  sub_24E53CC00(v3, v0 + 16);
  uint64_t v4 = (objc_class *)type metadata accessor for SessionDelegate();
  id v5 = objc_allocWithZone(v4);
  sub_24E53CC00(v0 + 16, (uint64_t)v5+ OBJC_IVAR____TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate_credential);
  *(void *)(v0 + 296) = v5;
  *(void *)(v0 + 304) = v4;
  *(void *)(v0 + 448) = objc_msgSendSuper2((objc_super *)(v0 + 296), sel_init);
  sub_24E53B390(v0 + 16, &qword_26B1C2420);
  sub_24E53BDB8(v2, v0 + 96);
  sub_24E53BDB8(v1, v0 + 136);
  sub_24E53CC00(v3, v0 + 176);
  return MEMORY[0x270FA2498](sub_24E53F8CC, v7, 0);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24E53BDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t storeEnumTagSinglePayload for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E5445A4);
}

uint64_t sub_24E53BE30@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v67 = a5;
  id v70 = a4;
  uint64_t v74 = a3;
  v75 = (void *)a2;
  uint64_t v66 = sub_24E545D60();
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C23F0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24E545DB0();
  uint64_t v71 = *(void (***)(void, void))(v11 - 8);
  v72 = (char *)v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24E545DC0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v69 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v68 = (char *)&v64 - v18;
  uint64_t v73 = type metadata accessor for FileUploadRequest();
  MEMORY[0x270FA5388](v73);
  unint64_t v20 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1[3];
  uint64_t v21 = a1[4];
  uint64_t v81 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v21);
  sub_24E545D90();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14) == 1)
  {
    sub_24E53B390((uint64_t)v10, &qword_26B1C23F0);
    sub_24E53CBAC();
    swift_allocError();
    *(void *)uint64_t v23 = 1;
    *(unsigned char *)(v23 + 8) = 2;
    swift_willThrow();

    sub_24E53B390(v74, &qword_26B1C2420);
    ((void (**)(char *, char *))v71)[1](v13, v72);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
  }
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  uint64_t v26 = v68;
  v25(v68, v10, v14);
  ((void (**)(char *, char *))v71)[1](v13, v72);
  v25(v20, v26, v14);
  v27 = (int *)v73;
  uint64_t v28 = (uint64_t)v81;
  sub_24E53BDB8((uint64_t)v81, (uint64_t)&v20[*(int *)(v73 + 24)]);
  v29 = v75;
  sub_24E53BDB8((uint64_t)v75, (uint64_t)&v20[v27[7]]);
  uint64_t v30 = v74;
  sub_24E53CC00(v74, (uint64_t)&v20[v27[8]]);
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v72 = v20;
  v31(v69, v20, v14);
  sub_24E545D30();
  uint64_t v32 = v29[3];
  uint64_t v33 = v29[4];
  __swift_project_boxed_opaque_existential_1(v29, v32);
  (*(void (**)(void *__return_ptr, uint64_t))(*(void *)(v33 + 8) + 16))(v78, v32);
  sub_24E545CF0();
  uint64_t v34 = v29[3];
  uint64_t v35 = v29[4];
  __swift_project_boxed_opaque_existential_1(v29, v34);
  (*(void (**)(uint64_t))(*(void *)(v35 + 8) + 24))(v34);
  sub_24E545D20();
  sub_24E53CC00(v30, (uint64_t)&v76);
  if (!v77)
  {
    sub_24E53B390((uint64_t)&v76, &qword_26B1C2420);
    id v47 = v70;
    if (!v70) {
      goto LABEL_50;
    }
    goto LABEL_27;
  }
  sub_24E53CCCC(&v76, (uint64_t)v78);
  uint64_t v36 = v79;
  uint64_t v37 = v80;
  __swift_project_boxed_opaque_existential_1(v78, v79);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 24))(v36, v37);
  int64_t v38 = 0;
  uint64_t v39 = result + 64;
  uint64_t v40 = 1 << *(unsigned char *)(result + 32);
  uint64_t v41 = -1;
  if (v40 < 64) {
    uint64_t v41 = ~(-1 << v40);
  }
  uint64_t v42 = v41 & *(void *)(result + 64);
  int64_t v43 = (unint64_t)(v40 + 63) >> 6;
  while (1)
  {
    if (v42)
    {
      v42 &= v42 - 1;
      goto LABEL_8;
    }
    int64_t v44 = v38 + 1;
    if (__OFADD__(v38, 1))
    {
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    if (v44 >= v43) {
      goto LABEL_24;
    }
    uint64_t v45 = *(void *)(v39 + 8 * v44);
    ++v38;
    if (!v45)
    {
      int64_t v38 = v44 + 1;
      if (v44 + 1 >= v43) {
        goto LABEL_24;
      }
      uint64_t v45 = *(void *)(v39 + 8 * v38);
      if (!v45)
      {
        int64_t v38 = v44 + 2;
        if (v44 + 2 >= v43) {
          goto LABEL_24;
        }
        uint64_t v45 = *(void *)(v39 + 8 * v38);
        if (!v45) {
          break;
        }
      }
    }
LABEL_23:
    uint64_t v42 = (v45 - 1) & v45;
LABEL_8:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E545D40();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v46 = v44 + 3;
  if (v46 < v43)
  {
    uint64_t v45 = *(void *)(v39 + 8 * v46);
    if (!v45)
    {
      while (1)
      {
        int64_t v38 = v46 + 1;
        if (__OFADD__(v46, 1)) {
          break;
        }
        if (v38 >= v43) {
          goto LABEL_24;
        }
        uint64_t v45 = *(void *)(v39 + 8 * v38);
        ++v46;
        if (v45) {
          goto LABEL_23;
        }
      }
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    int64_t v38 = v46;
    goto LABEL_23;
  }
LABEL_24:
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
  uint64_t v28 = (uint64_t)v81;
  uint64_t v30 = v74;
  v29 = v75;
  v27 = (int *)v73;
  id v47 = v70;
  if (!v70)
  {
LABEL_50:
    unint64_t v63 = sub_24E53A708(MEMORY[0x263F8EE78]);

    sub_24E53B390(v30, &qword_26B1C2420);
    uint64_t v62 = (uint64_t)v72;
    *(void *)&v72[v27[9]] = v63;
LABEL_51:
    (*(void (**)(uint64_t, char *, uint64_t))(v65 + 32))(v62 + v27[5], v7, v66);
    sub_24E53CC68(v62, v67);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    return __swift_destroy_boxed_opaque_existential_1(v28);
  }
LABEL_27:
  id v48 = v47;
  uint64_t v49 = (void *)sub_24E545D00();
  id v50 = objc_msgSend(v48, sel_appleIDHeadersForRequest_, v49);

  if (!v50)
  {

    goto LABEL_50;
  }
  uint64_t v71 = (void (**)(void, void))v48;
  uint64_t v51 = sub_24E545E60();

  *(void *)&v72[v27[9]] = v51;
  uint64_t v52 = v51 + 64;
  uint64_t v53 = 1 << *(unsigned char *)(v51 + 32);
  uint64_t v54 = -1;
  if (v53 < 64) {
    uint64_t v54 = ~(-1 << v53);
  }
  uint64_t v55 = v54 & *(void *)(v51 + 64);
  int64_t v56 = (unint64_t)(v53 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v57 = 0;
  while (2)
  {
    if (v55)
    {
      v55 &= v55 - 1;
LABEL_32:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E545D40();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  int64_t v58 = v57 + 1;
  if (__OFADD__(v57, 1)) {
    goto LABEL_53;
  }
  if (v58 >= v56)
  {
LABEL_48:
    id v61 = v71;

    sub_24E53B390(v74, &qword_26B1C2420);
    swift_release();
    uint64_t v28 = (uint64_t)v81;
    v29 = v75;
    uint64_t v62 = (uint64_t)v72;
    v27 = (int *)v73;
    goto LABEL_51;
  }
  uint64_t v59 = *(void *)(v52 + 8 * v58);
  ++v57;
  if (v59) {
    goto LABEL_47;
  }
  int64_t v57 = v58 + 1;
  if (v58 + 1 >= v56) {
    goto LABEL_48;
  }
  uint64_t v59 = *(void *)(v52 + 8 * v57);
  if (v59) {
    goto LABEL_47;
  }
  int64_t v57 = v58 + 2;
  if (v58 + 2 >= v56) {
    goto LABEL_48;
  }
  uint64_t v59 = *(void *)(v52 + 8 * v57);
  if (v59)
  {
LABEL_47:
    uint64_t v55 = (v59 - 1) & v59;
    goto LABEL_32;
  }
  int64_t v60 = v58 + 3;
  if (v60 >= v56) {
    goto LABEL_48;
  }
  uint64_t v59 = *(void *)(v52 + 8 * v60);
  if (v59)
  {
    int64_t v57 = v60;
    goto LABEL_47;
  }
  while (1)
  {
    int64_t v57 = v60 + 1;
    if (__OFADD__(v60, 1)) {
      break;
    }
    if (v57 >= v56) {
      goto LABEL_48;
    }
    uint64_t v59 = *(void *)(v52 + 8 * v57);
    ++v60;
    if (v59) {
      goto LABEL_47;
    }
  }
LABEL_55:
  __break(1u);
  return result;
}

uint64_t sub_24E53C73C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E545DC0();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v24 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for FileUploadRequest();
  sub_24E545D60();
  sub_24E53CB64((unint64_t *)&qword_26B1C23E0, MEMORY[0x263F06088]);
  uint64_t v28 = sub_24E546070();
  uint64_t v29 = v5;
  uint64_t result = sub_24E545D10();
  if (!result)
  {
LABEL_23:
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_24E545FE0();
    swift_bridgeObjectRelease();
    uint64_t v26 = 0x65746E6F435B0A0ALL;
    unint64_t v27 = 0xEF20666F2073746ELL;
    uint64_t v16 = (void *)(v1 + *(int *)(v4 + 28));
    uint64_t v17 = v16[3];
    uint64_t v18 = v16[4];
    __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v19 = v24;
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    sub_24E53CB64((unint64_t *)&qword_26B1C23E8, MEMORY[0x263F06EA8]);
    sub_24E546070();
    sub_24E545EF0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v19, v2);
    sub_24E545EF0();
    sub_24E545EF0();
    swift_bridgeObjectRelease();
    return v28;
  }
  uint64_t v21 = v4;
  uint64_t v22 = v0;
  uint64_t v23 = v2;
  int64_t v7 = 0;
  uint64_t v8 = result + 64;
  uint64_t v9 = 1 << *(unsigned char *)(result + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  uint64_t v11 = v10 & *(void *)(result + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v11 &= v11 - 1;
      goto LABEL_6;
    }
    int64_t v13 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v12) {
      goto LABEL_22;
    }
    uint64_t v14 = *(void *)(v8 + 8 * v13);
    ++v7;
    if (!v14)
    {
      int64_t v7 = v13 + 1;
      if (v13 + 1 >= v12) {
        goto LABEL_22;
      }
      uint64_t v14 = *(void *)(v8 + 8 * v7);
      if (!v14)
      {
        int64_t v7 = v13 + 2;
        if (v13 + 2 >= v12) {
          goto LABEL_22;
        }
        uint64_t v14 = *(void *)(v8 + 8 * v7);
        if (!v14) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v11 = (v14 - 1) & v14;
LABEL_6:
    uint64_t v26 = 10;
    unint64_t v27 = 0xE100000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E545EF0();
    swift_bridgeObjectRelease();
    sub_24E545EF0();
    sub_24E545EF0();
    swift_bridgeObjectRelease();
    sub_24E545EF0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v12)
  {
LABEL_22:
    swift_release();
    uint64_t v1 = v22;
    uint64_t v2 = v23;
    uint64_t v4 = v21;
    goto LABEL_23;
  }
  uint64_t v14 = *(void *)(v8 + 8 * v15);
  if (v14)
  {
    int64_t v7 = v15;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v7 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_22;
    }
    uint64_t v14 = *(void *)(v8 + 8 * v7);
    ++v15;
    if (v14) {
      goto LABEL_21;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FileUploadRequest()
{
  uint64_t result = qword_2698F0278;
  if (!qword_2698F0278) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E53CB64(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24E53CBAC()
{
  unint64_t result = qword_2698F03A0;
  if (!qword_2698F03A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F03A0);
  }
  return result;
}

uint64_t sub_24E53CC00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E53CC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FileUploadRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E53CCCC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void type metadata accessor for AuthChallengeDisposition()
{
  if (!qword_2698F0270)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2698F0270);
    }
  }
}

uint64_t *sub_24E53CD3C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24E545DC0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24E545D60();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    long long v13 = *(_OWORD *)((char *)a2 + v12 + 24);
    *(_OWORD *)((char *)a1 + v12 + 24) = v13;
    (**(void (***)(void))(v13 - 8))();
    uint64_t v14 = a3[7];
    long long v15 = *(_OWORD *)((char *)a2 + v14 + 24);
    *(_OWORD *)((char *)a1 + v14 + 24) = v15;
    (**(void (***)(void))(v15 - 8))();
    uint64_t v16 = a3[8];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v16 + 24);
    if (v19)
    {
      uint64_t v20 = *((void *)v18 + 4);
      *((void *)v17 + 3) = v19;
      *((void *)v17 + 4) = v20;
      (**(void (***)(void))(v19 - 8))();
    }
    else
    {
      long long v22 = *((_OWORD *)v18 + 1);
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      *((_OWORD *)v17 + 1) = v22;
      *((void *)v17 + 4) = *((void *)v18 + 4);
    }
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24E53CF5C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24E545D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[6]), (uint64_t *)(a2 + a3[6]));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[7]), (uint64_t *)(a2 + a3[7]));
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  long long v13 = (long long *)(a2 + v11);
  uint64_t v14 = *(void *)(a2 + v11 + 24);
  if (!*(void *)(a1 + v11 + 24))
  {
    if (v14)
    {
      *(void *)(v12 + 24) = v14;
      *(void *)(v12 + 32) = *((void *)v13 + 4);
      (**(void (***)(uint64_t, long long *))(v14 - 8))(v12, v13);
      goto LABEL_8;
    }
LABEL_7:
    long long v15 = *v13;
    long long v16 = v13[1];
    *(void *)(v12 + 32) = *((void *)v13 + 4);
    *(_OWORD *)uint64_t v12 = v15;
    *(_OWORD *)(v12 + 16) = v16;
    goto LABEL_8;
  }
  if (!v14)
  {
    __swift_destroy_boxed_opaque_existential_1(v12);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v12, (uint64_t *)v13);
LABEL_8:
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_24E53D310(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24E545D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v11;
  uint64_t v14 = a2 + v11;
  *(void *)(v13 + 32) = *(void *)(v14 + 32);
  long long v15 = *(_OWORD *)(v14 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(_OWORD *)(v13 + 16) = v15;
  uint64_t v16 = a1 + v12;
  uint64_t v17 = a2 + v12;
  *(void *)(v16 + 32) = *(void *)(v17 + 32);
  long long v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + 16) = v18;
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v19;
  uint64_t v22 = a2 + v19;
  long long v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(void *)(v21 + 32) = *(void *)(v22 + 32);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  return a1;
}

uint64_t sub_24E53D428(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24E545D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  __swift_destroy_boxed_opaque_existential_1(a1 + v11);
  long long v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  __swift_destroy_boxed_opaque_existential_1(a1 + v15);
  *(void *)(v16 + 32) = *(void *)(v17 + 32);
  long long v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + 16) = v18;
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  if (*(void *)(a1 + v19 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + v19);
  }
  long long v21 = *(_OWORD *)(a2 + v19 + 16);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)(a2 + v19);
  *(_OWORD *)(v20 + 16) = v21;
  *(void *)(v20 + 32) = *(void *)(a2 + v19 + 32);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24E53D570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E53D584);
}

uint64_t sub_24E53D584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_24E545D60();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 24);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_24E53D69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E53D6B0);
}

uint64_t sub_24E53D6B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24E545DC0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_24E545D60();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_24E53D7C4()
{
  uint64_t result = sub_24E545DC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24E545D60();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void sub_24E53D8B0(unsigned char *a1@<X8>)
{
}

void ContentRepresentable.method.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

unint64_t sub_24E53D8D4()
{
  return sub_24E53A708(MEMORY[0x263F8EE78]);
}

unint64_t ContentRepresentable.headerDictionary.getter()
{
  return sub_24E53A708(MEMORY[0x263F8EE78]);
}

uint64_t sub_24E53D8EC()
{
  return 0;
}

uint64_t RequestContentRepresentable.body.getter()
{
  return 0;
}

void static Standard.clientInfoValue.getter()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  if (v0)
  {
    unint64_t v1 = v0;
    id v2 = objc_msgSend(v0, sel_serverFriendlyDescription);

    if (v2)
    {
      sub_24E545E90();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t static Standard.clientTime.getter()
{
  uint64_t v0 = sub_24E545E00();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  long long v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E545DF0();
  uint64_t v4 = sub_24E545DE0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6[1] = v4;
  return sub_24E546070();
}

uint64_t _s23FindMyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(a2 + 24))();
  int64_t v3 = 0;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  uint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v9 >= v8) {
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(v4 + 8 * v9);
    ++v3;
    if (!v10)
    {
      int64_t v3 = v9 + 1;
      if (v9 + 1 >= v8) {
        goto LABEL_21;
      }
      uint64_t v10 = *(void *)(v4 + 8 * v3);
      if (!v10)
      {
        int64_t v3 = v9 + 2;
        if (v9 + 2 >= v8) {
          goto LABEL_21;
        }
        uint64_t v10 = *(void *)(v4 + 8 * v3);
        if (!v10) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v7 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E545EF0();
    sub_24E545EF0();
    swift_bridgeObjectRelease();
    sub_24E545EF0();
    sub_24E545EF0();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v11 = v9 + 3;
  if (v11 >= v8)
  {
LABEL_21:
    swift_release();
    return 0;
  }
  uint64_t v10 = *(void *)(v4 + 8 * v11);
  if (v10)
  {
    int64_t v3 = v11;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v3 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_21;
    }
    uint64_t v10 = *(void *)(v4 + 8 * v3);
    ++v11;
    if (v10) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t RequestContentRepresentable.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0 = _s23FindMyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0(a1, *(void *)(a2 + 8));
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  if (v5 >> 60 != 15)
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    sub_24E53BAE4();
    sub_24E545D70();
    if (!v8) {
      sub_24E545D80();
    }
    sub_24E545EF0();
    swift_bridgeObjectRelease();
    sub_24E545EF0();
    sub_24E53BAD0(v6, v7);
    swift_bridgeObjectRelease();
  }
  return MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0;
}

uint64_t FileUploadContentRepresentable.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E545DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0 = _s23FindMyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0(a1, *(void *)(a2 + 8));
  uint64_t v12 = v8;
  v10[0] = 0x4C5255656C69660ALL;
  v10[1] = 0xEA0000000000203ALL;
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_24E53DEC8();
  sub_24E546070();
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  return MyServerInteraction20ContentRepresentablePAAE11descriptionSSvg_0;
}

unint64_t sub_24E53DEC8()
{
  unint64_t result = qword_26B1C23E8;
  if (!qword_26B1C23E8)
  {
    sub_24E545DC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C23E8);
  }
  return result;
}

BOOL static RequestMethod.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RequestMethod.hash(into:)()
{
  return sub_24E5460F0();
}

uint64_t RequestMethod.hashValue.getter()
{
  return sub_24E546100();
}

BOOL sub_24E53DFA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24E53DFBC()
{
  return sub_24E546100();
}

uint64_t sub_24E53E004()
{
  return sub_24E5460F0();
}

uint64_t sub_24E53E030()
{
  return sub_24E546100();
}

unint64_t sub_24E53E078()
{
  unint64_t result = qword_2698F0288;
  if (!qword_2698F0288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F0288);
  }
  return result;
}

uint64_t dispatch thunk of ContentRepresentable.method.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ContentRepresentable.headerDictionary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RequestContentRepresentable.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of FileUploadContentRepresentable.fileURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for Standard()
{
  return &type metadata for Standard;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequestMethod(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RequestMethod(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E53E298);
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

uint64_t sub_24E53E2C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24E53E2CC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RequestMethod()
{
  return &type metadata for RequestMethod;
}

uint64_t Response.requestURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24E545DC0();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

id Response.response.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for Response() + 20));
  return v1;
}

uint64_t Response.body.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for Response() + 24);
  uint64_t v2 = *(void *)v1;
  sub_24E53E3C4(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_24E53E3C4(uint64_t a1, unint64_t a2)
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

uint64_t Response.transaction.getter()
{
  type metadata accessor for Response();
  return swift_retain();
}

void Response.description.getter()
{
  uint64_t v1 = sub_24E545EC0();
  MEMORY[0x270FA5388](v1 - 8);
  v26[1] = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E545DC0();
  sub_24E53DEC8();
  *(void *)&long long v38 = sub_24E546070();
  *((void *)&v38 + 1) = v3;
  sub_24E545EF0();
  uint64_t v27 = type metadata accessor for Response();
  uint64_t v4 = *(int *)(v27 + 20);
  uint64_t v29 = v0;
  uint64_t v28 = v4;
  uint64_t v5 = *(void **)(v0 + v4);
  *(void *)&long long v34 = objc_msgSend(v5, sel_statusCode);
  sub_24E546070();
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  v41[2] = v38;
  id v6 = objc_msgSend(v5, sel_allHeaderFields);
  uint64_t v7 = sub_24E545E60();

  int64_t v8 = 0;
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v30 = v7 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v9;
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  v26[0] = v13 - 1;
  if ((v11 & v9) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  unint64_t v15 = v14 | (v8 << 6);
  while (2)
  {
    sub_24E53B1D8(*(void *)(v7 + 48) + 40 * v15, (uint64_t)&v34);
    sub_24E53B17C(*(void *)(v7 + 56) + 32 * v15, (uint64_t)v36 + 8);
    while (1)
    {
      sub_24E53EA08((uint64_t)&v34, (uint64_t)&v38);
      if (!*((void *)&v39 + 1))
      {
        swift_release();
        uint64_t v19 = v29;
        uint64_t v20 = *(void **)(v29 + v28);
        long long v21 = (void *)sub_24E545E80();
        id v22 = objc_msgSend(v20, sel_valueForHTTPHeaderField_, v21);

        if (v22)
        {
          sub_24E545E90();

          uint64_t v23 = sub_24E545ED0();
          uint64_t v25 = v24;
          swift_bridgeObjectRelease();
          *(void *)&long long v38 = v23;
          *((void *)&v38 + 1) = v25;
          *(void *)&long long v34 = 1852797802;
          *((void *)&v34 + 1) = 0xE400000000000000;
          sub_24E53EA70();
          LOBYTE(v23) = sub_24E545FA0();
          swift_bridgeObjectRelease();
          if (v23)
          {
            sub_24E545EB0();
            sub_24E545EA0();
            *(void *)&long long v38 = 2570;
            *((void *)&v38 + 1) = 0xE200000000000000;
          }
          else
          {
            *(void *)&long long v38 = 2570;
            *((void *)&v38 + 1) = 0xE200000000000000;
            long long v34 = *(_OWORD *)(v19 + *(int *)(v27 + 24));
            sub_24E53BAE4();
            sub_24E545D80();
          }
          sub_24E545EF0();
          swift_bridgeObjectRelease();
          sub_24E545EF0();
          swift_bridgeObjectRelease();
        }
        return;
      }
      long long v34 = v38;
      long long v35 = v39;
      *(void *)&v36[0] = v40;
      sub_24E53EAC4(v41, v33);
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
      sub_24E545EF0();
      sub_24E545FB0();
      sub_24E545EF0();
      swift_bridgeObjectRelease();
      sub_24E545EF0();
      sub_24E546010();
      sub_24E545EF0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      sub_24E53EAD4((uint64_t)&v34);
      if (v12) {
        goto LABEL_6;
      }
LABEL_8:
      int64_t v16 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        goto LABEL_34;
      }
      if (v16 < v13)
      {
        unint64_t v17 = *(void *)(v30 + 8 * v16);
        if (v17) {
          goto LABEL_11;
        }
        int64_t v18 = v8 + 2;
        ++v8;
        if (v16 + 1 < v13)
        {
          unint64_t v17 = *(void *)(v30 + 8 * v18);
          if (v17) {
            goto LABEL_14;
          }
          int64_t v8 = v16 + 1;
          if (v16 + 2 < v13)
          {
            unint64_t v17 = *(void *)(v30 + 8 * (v16 + 2));
            if (v17)
            {
              v16 += 2;
              goto LABEL_11;
            }
            int64_t v18 = v16 + 3;
            int64_t v8 = v16 + 2;
            if (v16 + 3 < v13) {
              break;
            }
          }
        }
      }
LABEL_25:
      unint64_t v12 = 0;
      uint64_t v37 = 0;
      memset(v36, 0, sizeof(v36));
      long long v34 = 0u;
      long long v35 = 0u;
    }
    unint64_t v17 = *(void *)(v30 + 8 * v18);
    if (v17)
    {
LABEL_14:
      int64_t v16 = v18;
LABEL_11:
      unint64_t v12 = (v17 - 1) & v17;
      unint64_t v15 = __clz(__rbit64(v17)) + (v16 << 6);
      int64_t v8 = v16;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v16 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v16 >= v13)
    {
      int64_t v8 = v26[0];
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v30 + 8 * v16);
    ++v18;
    if (v17) {
      goto LABEL_11;
    }
  }
LABEL_34:
  __break(1u);
}

uint64_t sub_24E53EA08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E53EA70()
{
  unint64_t result = qword_26B1C2470;
  if (!qword_26B1C2470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C2470);
  }
  return result;
}

_OWORD *sub_24E53EAC4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24E53EAD4(uint64_t a1)
{
  return a1;
}

id Response.statusCode.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for Response() + 20));
  return objc_msgSend(v1, sel_statusCode);
}

id Response.header.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + *(int *)(type metadata accessor for Response() + 20));
  *a1 = v3;
  return v3;
}

uint64_t ResponseHeaders.subscript.getter()
{
  uint64_t v1 = *v0;
  long long v2 = (void *)sub_24E545E80();
  id v3 = objc_msgSend(v1, sel_valueForHTTPHeaderField_, v2);

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_24E545E90();

  return v4;
}

uint64_t *initializeBufferWithCopyOfBuffer for Response(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_24E545DC0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = *(uint64_t *)((char *)a2 + v9);
    unint64_t v13 = *(uint64_t *)((char *)a2 + v9 + 8);
    id v14 = v10;
    sub_24E53E3C4(v12, v13);
    *uint64_t v11 = v12;
    v11[1] = v13;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  }
  swift_retain();
  return a1;
}

uint64_t destroy for Response(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  sub_24E53A6B0(*(void *)(a1 + *(int *)(a2 + 24)), *(void *)(a1 + *(int *)(a2 + 24) + 8));
  return swift_release();
}

uint64_t initializeWithCopy for Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  uint64_t v10 = (uint64_t *)(a1 + v8);
  uint64_t v11 = *(void *)(a2 + v8);
  unint64_t v12 = *(void *)(a2 + v8 + 8);
  id v13 = v9;
  sub_24E53E3C4(v11, v12);
  *uint64_t v10 = v11;
  v10[1] = v12;
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = a3[6];
  unint64_t v12 = (uint64_t *)(a1 + v11);
  id v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_24E53E3C4(*v13, v15);
  uint64_t v16 = *v12;
  unint64_t v17 = v12[1];
  *unint64_t v12 = v14;
  v12[1] = v15;
  sub_24E53A6B0(v16, v17);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for Response(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[6];
  uint64_t v10 = *(void *)(a1 + v9);
  unint64_t v11 = *(void *)(a1 + v9 + 8);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  sub_24E53A6B0(v10, v11);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Response(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E53F098);
}

uint64_t sub_24E53F098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for Response(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E53F16C);
}

uint64_t sub_24E53F16C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24E545DC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24E53F228()
{
  uint64_t result = sub_24E545DC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ResponseHeaders()
{
  return &type metadata for ResponseHeaders;
}

uint64_t ServerInteractionController.__allocating_init(sessionConfiguration:bundleIdentifier:)(void *a1, uint64_t a2, void *a3)
{
  swift_allocObject();
  uint64_t v6 = sub_24E542F88((uint64_t)a1, a2, a3);

  return v6;
}

uint64_t ServerInteractionController.init(sessionConfiguration:bundleIdentifier:)(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_24E542F88((uint64_t)a1, a2, a3);

  return v4;
}

uint64_t ServerInteractionController.__allocating_init(bundleIdentifier:)(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(self, sel_ephemeralSessionConfiguration);
  objc_msgSend(v4, sel_setURLCache_, 0);
  objc_msgSend(v4, sel_setRequestCachePolicy_, 1);
  objc_msgSend(v4, sel_setHTTPCookieStorage_, 0);
  objc_msgSend(v4, sel_setHTTPCookieAcceptPolicy_, 1);
  objc_msgSend(v4, sel_setURLCredentialStorage_, 0);
  type metadata accessor for ServerInteractionController();
  swift_allocObject();
  uint64_t v5 = sub_24E542F88((uint64_t)v4, a1, a2);

  return v5;
}

uint64_t sub_24E53F46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24E53F494, v4, 0);
}

uint64_t sub_24E53F494()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  sub_24E545CE0();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  uint64_t v6 = type metadata accessor for Response();
  *uint64_t v5 = v0;
  v5[1] = sub_24E53F598;
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x270F28C50](v7, "ServerInteraction.send", 22, 2, &unk_2698F02A0, v3, v6);
}

uint64_t sub_24E53F598()
{
  uint64_t v2 = (void *)*v1;
  v2[9] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[6];
    return MEMORY[0x270FA2498](sub_24E53F6D4, v3, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24E53F6D4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E53F738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[45] = a5;
  v6[46] = a6;
  v6[43] = a3;
  v6[44] = a4;
  v6[41] = a1;
  v6[42] = a2;
  v6[47] = type metadata accessor for Response();
  v6[48] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C2410);
  v6[49] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for MockEndpoint();
  v6[50] = v7;
  v6[51] = *(void *)(v7 - 8);
  v6[52] = swift_task_alloc();
  v6[53] = type metadata accessor for Request();
  v6[54] = swift_task_alloc();
  v6[55] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E53BBF0, 0, 0);
}

uint64_t sub_24E53F8CC()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 368) + 120);
  *(void *)(v0 + 456) = v1;
  id v2 = v1;
  return MEMORY[0x270FA2498](sub_24E53F96C, 0, 0);
}

uint64_t sub_24E53F96C()
{
  uint64_t v34 = v0;
  v33[1] = *MEMORY[0x263EF8340];
  sub_24E53A82C((void *)(v0 + 96), v0 + 136, v0 + 176, *(void **)(v0 + 456), *(void *)(v0 + 440));
  uint64_t v1 = v0 + 56;
  if (qword_26B1C2430 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v2 = *(void *)(v0 + 440);
  uint64_t v4 = sub_24E545E50();
  *(void *)(v0 + 464) = v4;
  *(void *)(v0 + 472) = __swift_project_value_buffer(v4, (uint64_t)qword_26B1C24C0);
  sub_24E53A320(v2, v3, (uint64_t (*)(void))type metadata accessor for Request);
  uint64_t v5 = sub_24E545E30();
  os_log_type_t v6 = sub_24E545F70();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void *)(v0 + 432);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v33[0] = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v11 = sub_24E53B450();
    *(void *)(v0 + 320) = sub_24E53A040(v11, v12, v33);
    sub_24E545F80();
    swift_bridgeObjectRelease();
    sub_24E53B93C(v8, (uint64_t (*)(void))type metadata accessor for Request);
    _os_log_impl(&dword_24E538000, v5, v6, "REQUEST: %s", v9, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v10;
    uint64_t v1 = v0 + 56;
    MEMORY[0x25333E6B0](v13, -1, -1);
    MEMORY[0x25333E6B0](v9, -1, -1);
  }
  else
  {
    sub_24E53B93C(*(void *)(v0 + 432), (uint64_t (*)(void))type metadata accessor for Request);
  }

  uint64_t v14 = *(void *)(v0 + 408);
  sub_24E53BDB8(*(void *)(v0 + 352), v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2458);
  char v15 = swift_dynamicCast();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  if (v15)
  {
    uint64_t v17 = *(void *)(v0 + 416);
    uint64_t v19 = *(void *)(v0 + 392);
    uint64_t v18 = *(void *)(v0 + 400);
    v16(v19, 0, 1, v18);
    sub_24E543EA0(v19, v17);
    uint64_t v20 = (int **)(v17 + *(int *)(v18 + 20));
    long long v21 = *v20;
    *(void *)(v0 + 496) = v20[1];
    unint64_t v32 = (uint64_t (*)(uint64_t))((char *)v21 + *v21);
    swift_retain();
    id v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 504) = v22;
    *id v22 = v0;
    v22[1] = sub_24E53FFC8;
    uint64_t v23 = *(void *)(v0 + 360);
    return v32(v23);
  }
  else
  {
    uint64_t v26 = *(void *)(v0 + 440);
    uint64_t v25 = *(void **)(v0 + 448);
    uint64_t v27 = *(void *)(v0 + 424);
    uint64_t v28 = *(void *)(v0 + 392);
    v16(v28, 1, 1, *(void *)(v0 + 400));
    sub_24E53B390(v28, (uint64_t *)&unk_26B1C2410);
    uint64_t v29 = *(int *)(v27 + 20);
    id v30 = v25;
    uint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 480) = v31;
    *uint64_t v31 = v0;
    v31[1] = sub_24E53FE5C;
    return MEMORY[0x270EF1EB0](v26 + v29, v25);
  }
}

uint64_t sub_24E53FE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  os_log_type_t v6 = (void *)*v4;
  v6[27] = v4;
  v6[28] = a1;
  v6[29] = a2;
  v6[30] = a3;
  v6[31] = v3;
  v6[61] = v3;
  swift_task_dealloc();

  if (v3) {
    BOOL v7 = sub_24E540B7C;
  }
  else {
    BOOL v7 = sub_24E54033C;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_24E53FFC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[32] = v4;
  v5[33] = a1;
  v5[34] = a2;
  v5[35] = a3;
  v5[36] = v3;
  v5[64] = v3;
  swift_task_dealloc();
  swift_release();
  if (v3) {
    os_log_type_t v6 = sub_24E540A70;
  }
  else {
    os_log_type_t v6 = sub_24E540134;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24E540134()
{
  sub_24E53B93C(*(void *)(v0 + 416), (uint64_t (*)(void))type metadata accessor for MockEndpoint);
  uint64_t v2 = *(void *)(v0 + 264);
  unint64_t v1 = *(void *)(v0 + 272);
  uint64_t v3 = *(void **)(v0 + 280);
  *(void *)(v0 + 520) = v1;
  *(void *)(v0 + 528) = v2;
  *(void *)(v0 + 536) = v3;
  *(unsigned char *)(v0 + 552) = 1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  *(void *)(v0 + 544) = v4;
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 368);
    id v6 = v3;
    sub_24E53E3C4(v2, v1);
    return MEMORY[0x270FA2498](sub_24E540528, v5, 0);
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 440);
    uint64_t v8 = *(void **)(v0 + 448);
    sub_24E53CBAC();
    swift_allocError();
    *(void *)uint64_t v9 = v3;
    *(unsigned char *)(v9 + 8) = 1;
    id v10 = v3;
    swift_willThrow();

    sub_24E53A6B0(v2, v1);
    sub_24E53B93C(v7, (uint64_t (*)(void))type metadata accessor for Request);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_24E54033C()
{
  uint64_t v2 = *(void *)(v0 + 224);
  unint64_t v1 = *(void *)(v0 + 232);
  uint64_t v3 = *(void **)(v0 + 240);
  *(void *)(v0 + 520) = v1;
  *(void *)(v0 + 528) = v2;
  *(void *)(v0 + 536) = v3;
  *(unsigned char *)(v0 + 552) = 1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  *(void *)(v0 + 544) = v4;
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 368);
    id v6 = v3;
    sub_24E53E3C4(v2, v1);
    return MEMORY[0x270FA2498](sub_24E540528, v5, 0);
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 440);
    uint64_t v8 = *(void **)(v0 + 448);
    sub_24E53CBAC();
    swift_allocError();
    *(void *)uint64_t v9 = v3;
    *(unsigned char *)(v9 + 8) = 1;
    id v10 = v3;
    swift_willThrow();

    sub_24E53A6B0(v2, v1);
    sub_24E53B93C(v7, (uint64_t (*)(void))type metadata accessor for Request);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_24E540528()
{
  id v1 = *(id *)(v0 + 456);
  return MEMORY[0x270FA2498](sub_24E5405C0, 0, 0);
}

uint64_t sub_24E5405C0()
{
  uint64_t v42 = v0;
  v41[1] = *MEMORY[0x263EF8340];
  id v1 = (unsigned char *)(v0 + 552);
  uint64_t v2 = *(void **)(v0 + 456);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 544);
    id v4 = *(id *)(v0 + 536);
    uint64_t v5 = (void *)sub_24E545D00();
    objc_msgSend(v2, sel_handleResponse_forRequest_shouldRetry_, v3, v5, v0 + 552);

    if (*v1)
    {
      if (qword_26B1C2428 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(*(void *)(v0 + 464), (uint64_t)qword_26B1C24A8);
      id v6 = sub_24E545E30();
      os_log_type_t v7 = sub_24E545F70();
      BOOL v8 = os_log_type_enabled(v6, v7);
      uint64_t v9 = *(void **)(v0 + 456);
      if (v8)
      {
        id v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_24E538000, v6, v7, "AKAppleIDSession told us to retry", v10, 2u);
        MEMORY[0x25333E6B0](v10, -1, -1);
      }
      else
      {
      }
    }
    else
    {
    }
  }
  else
  {
    *id v1 = 0;
  }
  uint64_t v11 = *(void *)(v0 + 544);
  unint64_t v12 = *(void **)(v0 + 536);
  uint64_t v13 = *(void *)(v0 + 528);
  unint64_t v14 = *(void *)(v0 + 520);
  uint64_t v15 = *(void *)(v0 + 440);
  uint64_t v17 = *(int **)(v0 + 376);
  uint64_t v16 = *(void *)(v0 + 384);
  uint64_t v19 = *(void *)(v0 + 328);
  uint64_t v18 = *(void *)(v0 + 336);
  uint64_t v20 = sub_24E545DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v19, v15, v20);
  *(void *)(v19 + v17[5]) = v11;
  long long v21 = (uint64_t *)(v19 + v17[6]);
  *long long v21 = v13;
  v21[1] = v14;
  *(void *)(v19 + v17[7]) = v18;
  sub_24E53A320(v19, v16, (uint64_t (*)(void))type metadata accessor for Response);
  id v22 = v12;
  sub_24E53E3C4(v13, v14);
  swift_retain();
  uint64_t v23 = sub_24E545E30();
  os_log_type_t v24 = sub_24E545F70();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v26 = *(void **)(v0 + 536);
  uint64_t v27 = *(void *)(v0 + 528);
  unint64_t v28 = *(void *)(v0 + 520);
  uint64_t v29 = *(void *)(v0 + 440);
  id v30 = *(void **)(v0 + 448);
  uint64_t v31 = *(void *)(v0 + 384);
  if (v25)
  {
    uint64_t v40 = *(void *)(v0 + 440);
    unint64_t v32 = (uint8_t *)swift_slowAlloc();
    long long v39 = v30;
    uint64_t v33 = swift_slowAlloc();
    v41[0] = v33;
    *(_DWORD *)unint64_t v32 = 136315138;
    Response.description.getter();
    *(void *)(v0 + 312) = sub_24E53A040(v34, v35, v41);
    sub_24E545F80();
    swift_bridgeObjectRelease();
    sub_24E53B93C(v31, (uint64_t (*)(void))type metadata accessor for Response);
    _os_log_impl(&dword_24E538000, v23, v24, "RESPONSE: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333E6B0](v33, -1, -1);
    MEMORY[0x25333E6B0](v32, -1, -1);

    sub_24E53A6B0(v27, v28);
    sub_24E53A6B0(v27, v28);

    uint64_t v36 = v40;
  }
  else
  {

    sub_24E53B93C(v31, (uint64_t (*)(void))type metadata accessor for Response);
    sub_24E53A6B0(v27, v28);

    sub_24E53A6B0(v27, v28);
    uint64_t v36 = v29;
  }
  sub_24E53B93C(v36, (uint64_t (*)(void))type metadata accessor for Request);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = *(uint64_t (**)(void))(v0 + 8);
  return v37();
}

uint64_t sub_24E540A70()
{
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v2 = *(void *)(v0 + 416);

  sub_24E53B93C(v2, (uint64_t (*)(void))type metadata accessor for MockEndpoint);
  sub_24E53B93C(v1, (uint64_t (*)(void))type metadata accessor for Request);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24E540B7C()
{
  uint64_t v1 = *(void *)(v0 + 440);

  sub_24E53B93C(v1, (uint64_t (*)(void))type metadata accessor for Request);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24E540C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24E540C90, v4, 0);
}

uint64_t sub_24E540C90()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  sub_24E545CE0();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  uint64_t v6 = type metadata accessor for Response();
  *uint64_t v5 = v0;
  v5[1] = sub_24E540D94;
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x270F28C50](v7, "ServerInteraction.upload", 24, 2, &unk_2698F02B8, v3, v6);
}

uint64_t sub_24E540D94()
{
  uint64_t v2 = (void *)*v1;
  v2[9] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[6];
    return MEMORY[0x270FA2498](sub_24E543F0C, v3, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24E540ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[30] = a5;
  v6[31] = a6;
  v6[28] = a3;
  v6[29] = a4;
  v6[26] = a1;
  v6[27] = a2;
  v6[32] = type metadata accessor for Response();
  v6[33] = swift_task_alloc();
  uint64_t v7 = sub_24E545DC0();
  v6[34] = v7;
  v6[35] = *(void *)(v7 - 8);
  v6[36] = swift_task_alloc();
  v6[37] = type metadata accessor for FileUploadRequest();
  v6[38] = swift_task_alloc();
  v6[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E541034, 0, 0);
}

uint64_t sub_24E541034()
{
  uint64_t receiver = (uint64_t)v0[15].receiver;
  Class super_class = v0[15].super_class;
  uint64_t v3 = (uint64_t)v0[14].receiver;
  uint64_t v2 = (uint64_t)v0[14].super_class;
  sub_24E53CC00(v3, (uint64_t)&v0[1]);
  long long v4 = (objc_class *)type metadata accessor for SessionDelegate();
  id v5 = objc_allocWithZone(v4);
  sub_24E53CC00((uint64_t)&v0[1], (uint64_t)v5+ OBJC_IVAR____TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate_credential);
  v0[11].uint64_t receiver = v5;
  v0[11].Class super_class = v4;
  v0[20].uint64_t receiver = objc_msgSendSuper2(v0 + 11, sel_init);
  sub_24E53B390((uint64_t)&v0[1], &qword_26B1C2420);
  sub_24E53BDB8(v2, (uint64_t)&v0[6]);
  sub_24E53BDB8(receiver, (uint64_t)&v0[8].super_class);
  sub_24E53CC00(v3, (uint64_t)&v0[3].super_class);
  return MEMORY[0x270FA2498](sub_24E541180, super_class, 0);
}

uint64_t sub_24E541180()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 248) + 120);
  *(void *)(v0 + 328) = v1;
  id v2 = v1;
  return MEMORY[0x270FA2498](sub_24E541220, 0, 0);
}

uint64_t sub_24E541220()
{
  uint64_t v23 = v0;
  v22[1] = *MEMORY[0x263EF8340];
  sub_24E53BE30((void *)(v0 + 96), v0 + 136, v0 + 56, *(void **)(v0 + 328), *(void *)(v0 + 312));
  if (qword_26B1C2430 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v3 = sub_24E545E50();
  *(void *)(v0 + 336) = v3;
  *(void *)(v0 + 344) = __swift_project_value_buffer(v3, (uint64_t)qword_26B1C24C0);
  sub_24E53A320(v2, v1, (uint64_t (*)(void))type metadata accessor for FileUploadRequest);
  uint64_t v4 = sub_24E545E30();
  os_log_type_t v5 = sub_24E545F70();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void *)(v0 + 304);
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v22[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_24E53C73C();
    *(void *)(v0 + 200) = sub_24E53A040(v10, v11, v22);
    sub_24E545F80();
    swift_bridgeObjectRelease();
    sub_24E53B93C(v7, (uint64_t (*)(void))type metadata accessor for FileUploadRequest);
    _os_log_impl(&dword_24E538000, v4, v5, "REQUEST: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333E6B0](v9, -1, -1);
    MEMORY[0x25333E6B0](v8, -1, -1);
  }
  else
  {
    sub_24E53B93C(*(void *)(v0 + 304), (uint64_t (*)(void))type metadata accessor for FileUploadRequest);
  }

  uint64_t v13 = *(void *)(v0 + 312);
  unint64_t v12 = *(void **)(v0 + 320);
  unint64_t v14 = *(void **)(v0 + 240);
  uint64_t v15 = *(int *)(*(void *)(v0 + 296) + 20);
  *(_DWORD *)(v0 + 400) = v15;
  uint64_t v16 = v14[3];
  uint64_t v17 = v14[4];
  __swift_project_boxed_opaque_existential_1(v14, v16);
  (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v16, v17);
  id v18 = v12;
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_24E5415B4;
  uint64_t v20 = *(void *)(v0 + 288);
  return MEMORY[0x270EF1ED0](v13 + v15, v20, v12);
}

uint64_t sub_24E5415B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v5 = (void *)*v4;
  BOOL v6 = (void *)*v4;
  v6[45] = a1;
  v6[46] = a2;
  v6[47] = a3;
  v6[48] = v3;
  swift_task_dealloc();
  uint64_t v7 = (void *)v5[40];
  (*(void (**)(void, void))(v5[35] + 8))(v5[36], v5[34]);

  if (v3) {
    uint64_t v8 = sub_24E541E20;
  }
  else {
    uint64_t v8 = sub_24E541774;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_24E541774()
{
  *(unsigned char *)(v0 + 404) = 1;
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  *(void *)(v0 + 392) = v1;
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 248);
    id v3 = *(id *)(v0 + 376);
    return MEMORY[0x270FA2498](sub_24E541944, v2, 0);
  }
  else
  {
    unint64_t v4 = *(void *)(v0 + 368);
    os_log_type_t v5 = *(void **)(v0 + 376);
    uint64_t v6 = *(void *)(v0 + 360);
    uint64_t v7 = *(void *)(v0 + 312);
    uint64_t v8 = *(void **)(v0 + 320);
    sub_24E53CBAC();
    swift_allocError();
    *(void *)uint64_t v9 = v5;
    *(unsigned char *)(v9 + 8) = 1;
    id v10 = v5;
    swift_willThrow();
    sub_24E53A6B0(v6, v4);

    sub_24E53B93C(v7, (uint64_t (*)(void))type metadata accessor for FileUploadRequest);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_24E541944()
{
  id v1 = *(id *)(v0 + 328);
  return MEMORY[0x270FA2498](sub_24E5419DC, 0, 0);
}

uint64_t sub_24E5419DC()
{
  uint64_t v39 = v0;
  v38[1] = *MEMORY[0x263EF8340];
  id v1 = (unsigned char *)(v0 + 404);
  uint64_t v2 = *(void **)(v0 + 328);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 392);
    id v4 = *(id *)(v0 + 376);
    os_log_type_t v5 = (void *)sub_24E545D00();
    objc_msgSend(v2, sel_handleResponse_forRequest_shouldRetry_, v3, v5, v0 + 404);

    if (*v1)
    {
      if (qword_26B1C2428 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(*(void *)(v0 + 336), (uint64_t)qword_26B1C24A8);
      uint64_t v6 = sub_24E545E30();
      os_log_type_t v7 = sub_24E545F70();
      BOOL v8 = os_log_type_enabled(v6, v7);
      uint64_t v9 = *(void **)(v0 + 328);
      if (v8)
      {
        id v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_24E538000, v6, v7, "AKAppleIDSession told us to retry", v10, 2u);
        MEMORY[0x25333E6B0](v10, -1, -1);
      }
      else
      {
      }
    }
    else
    {
    }
  }
  else
  {
    *id v1 = 0;
  }
  uint64_t v11 = *(void *)(v0 + 392);
  unint64_t v12 = *(void *)(v0 + 368);
  uint64_t v13 = *(void **)(v0 + 376);
  uint64_t v14 = *(void *)(v0 + 360);
  uint64_t v16 = *(int **)(v0 + 256);
  uint64_t v15 = *(void *)(v0 + 264);
  uint64_t v18 = *(void *)(v0 + 208);
  uint64_t v17 = *(void *)(v0 + 216);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 280) + 16))(v18, *(void *)(v0 + 312), *(void *)(v0 + 272));
  *(void *)(v18 + v16[5]) = v11;
  uint64_t v19 = (uint64_t *)(v18 + v16[6]);
  *uint64_t v19 = v14;
  v19[1] = v12;
  *(void *)(v18 + v16[7]) = v17;
  sub_24E53A320(v18, v15, (uint64_t (*)(void))type metadata accessor for Response);
  id v20 = v13;
  sub_24E53E3C4(v14, v12);
  swift_retain();
  long long v21 = sub_24E545E30();
  os_log_type_t v22 = sub_24E545F70();
  BOOL v23 = os_log_type_enabled(v21, v22);
  unint64_t v24 = *(void *)(v0 + 368);
  BOOL v25 = *(void **)(v0 + 376);
  uint64_t v26 = *(void *)(v0 + 360);
  uint64_t v27 = *(void *)(v0 + 312);
  unint64_t v28 = *(void **)(v0 + 320);
  uint64_t v29 = *(void *)(v0 + 264);
  if (v23)
  {
    uint64_t v37 = *(void *)(v0 + 312);
    id v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v38[0] = v31;
    *(_DWORD *)id v30 = 136315138;
    Response.description.getter();
    *(void *)(v0 + 192) = sub_24E53A040(v32, v33, v38);
    sub_24E545F80();
    swift_bridgeObjectRelease();
    sub_24E53B93C(v29, (uint64_t (*)(void))type metadata accessor for Response);
    _os_log_impl(&dword_24E538000, v21, v22, "RESPONSE: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333E6B0](v31, -1, -1);
    MEMORY[0x25333E6B0](v30, -1, -1);

    sub_24E53A6B0(v26, v24);
    uint64_t v34 = v37;
  }
  else
  {

    sub_24E53B93C(v29, (uint64_t (*)(void))type metadata accessor for Response);
    sub_24E53A6B0(v26, v24);

    uint64_t v34 = v27;
  }
  sub_24E53B93C(v34, (uint64_t (*)(void))type metadata accessor for FileUploadRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_24E541E20()
{
  uint64_t v1 = *(void *)(v0 + 312);

  sub_24E53B93C(v1, (uint64_t (*)(void))type metadata accessor for FileUploadRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t ServerInteractionController.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ServerInteractionController.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t ServerInteractionController.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E541F80()
{
  return v0;
}

uint64_t ServerInteractionController.description.getter()
{
  uint64_t v0 = type metadata accessor for ServerInteractionController();
  unint64_t v1 = sub_24E5432E8();
  sub_24E546050();
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  sub_24E545EF0();
  MEMORY[0x25333E1D0](v0, v1);
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  sub_24E545EF0();
  return 60;
}

uint64_t sub_24E542050()
{
  return ServerInteractionController.description.getter();
}

uint64_t sub_24E5421F8(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  id v8 = a1;
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_24E5422E0;
  v11[7] = v9;
  v11[8] = v10;
  return MEMORY[0x270FA2498](sub_24E543BF8, 0, 0);
}

uint64_t sub_24E5422E0(uint64_t a1, void *a2)
{
  os_log_type_t v5 = *(void (***)(void, void, void))(*v2 + 40);
  uint64_t v6 = *(void **)(*v2 + 32);
  os_log_type_t v7 = *(void **)(*v2 + 24);
  id v8 = *(void **)(*v2 + 16);
  uint64_t v11 = *v2;
  swift_task_dealloc();

  ((void (**)(void, uint64_t, void *))v5)[2](v5, a1, a2);
  _Block_release(v5);

  id v9 = *(uint64_t (**)(void))(v11 + 8);
  return v9();
}

id sub_24E54249C()
{
  v2.uint64_t receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for SessionDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24E542500()
{
  uint64_t v0 = sub_24E545E50();
  __swift_allocate_value_buffer(v0, qword_26B1C24A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1C24A8);
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_24E545E90();

    sub_24E545E40();
  }
  else
  {
    __break(1u);
  }
}

void sub_24E5425D4()
{
  uint64_t v0 = sub_24E545E50();
  __swift_allocate_value_buffer(v0, qword_26B1C24C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1C24C0);
  id v1 = objc_msgSend(self, sel_mainBundle);
  id v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_24E545E90();

    sub_24E545E40();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24E5426A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24E543F08;
  return v6();
}

uint64_t sub_24E542774(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *os_log_type_t v5 = v4;
  v5[1] = sub_24E543F08;
  return v7();
}

uint64_t sub_24E542840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545F30();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24E545F20();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24E53B390(a1, &qword_26B1C24A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E545F10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24E5429EC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24E542AC8;
  return v6(a1);
}

uint64_t sub_24E542AC8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E542BC0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24E542C58(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24E542E38(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24E542E38(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24E542C58(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24E542DD0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24E545FF0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24E546020();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24E545F00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24E546040();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24E546020();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24E542DD0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F03A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24E542E38(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698F03A8);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_24E546040();
  __break(1u);
  return result;
}

uint64_t sub_24E542F88(uint64_t a1, uint64_t a2, id a3)
{
  swift_defaultActor_initialize();
  if (a3)
  {
    id v6 = objc_allocWithZone(MEMORY[0x263F29120]);
    int64_t v7 = (void *)sub_24E545E80();
    swift_bridgeObjectRelease();
    a3 = objc_msgSend(v6, sel_initWithIdentifier_, v7);
  }
  *(void *)(v3 + 120) = a3;
  *(void *)(v3 + 112) = objc_msgSend(self, sel_sessionWithConfiguration_, a1);
  return v3;
}

uint64_t type metadata accessor for ServerInteractionController()
{
  return self;
}

uint64_t sub_24E543064(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  id v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *id v10 = v3;
  v10[1] = sub_24E54312C;
  return sub_24E53F738(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_24E54312C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E543220(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  id v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *id v10 = v3;
  v10[1] = sub_24E543F08;
  return sub_24E540ED0(a1, a2, v6, v7, v9, v8);
}

unint64_t sub_24E5432E8()
{
  unint64_t result = qword_2698F02C0;
  if (!qword_2698F02C0)
  {
    type metadata accessor for ServerInteractionController();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F02C0);
  }
  return result;
}

uint64_t method lookup function for ServerInteractionController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ServerInteractionController);
}

uint64_t dispatch thunk of ServerInteractionController.__allocating_init(sessionConfiguration:bundleIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ServerInteractionController.send(endpoint:content:credential:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 112)
                                                                   + **(int **)(*(void *)v4 + 112));
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *id v10 = v5;
  v10[1] = sub_24E543F08;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ServerInteractionController.upload(endpoint:content:credential:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 120)
                                                                   + **(int **)(*(void *)v4 + 120));
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *id v10 = v5;
  v10[1] = sub_24E543F08;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ServerInteractionController.upload()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t initializeBufferWithCopyOfBuffer for ServerInteractionController.Error(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_24E543624(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_24E543624(id result, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return result;
  }
  return result;
}

void destroy for ServerInteractionController.Error(uint64_t a1)
{
}

void sub_24E543650(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
}
  }

uint64_t assignWithCopy for ServerInteractionController.Error(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_24E543624(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_24E543650(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for ServerInteractionController.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_24E543650(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerInteractionController.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ServerInteractionController.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24E5437A0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24E5437B8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ServerInteractionController.Error()
{
  return &type metadata for ServerInteractionController.Error;
}

uint64_t type metadata accessor for SessionDelegate()
{
  return self;
}

uint64_t sub_24E543804()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24E543854()
{
  uint64_t v2 = (void *)v0[2];
  unsigned int v3 = (void *)v0[3];
  unsigned __int8 v5 = (void *)v0[4];
  int v4 = (void *)v0[5];
  unsigned __int8 v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unsigned __int8 v6 = v1;
  v6[1] = sub_24E54312C;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_2698F0358 + dword_2698F0358);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_24E543918()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  int v4 = (int *)v0[4];
  unsigned __int8 v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *unsigned __int8 v5 = v1;
  v5[1] = sub_24E543F08;
  unsigned __int8 v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2698F0368 + dword_2698F0368);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_16Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24E543A1C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned __int8 v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24E543F08;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2698F0378 + dword_2698F0378);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24E543AE8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E543B20(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E543F08;
  unsigned __int8 v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698F0388 + dword_2698F0388);
  return v6(a1, v4);
}

uint64_t sub_24E543BD8(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v1;
  return MEMORY[0x270FA2498](sub_24E543BF8, 0, 0);
}

uint64_t sub_24E543BF8()
{
  uint64_t v1 = v0 + 2;
  if (qword_26B1C2428 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[7];
  uint64_t v3 = sub_24E545E50();
  __swift_project_value_buffer(v3, (uint64_t)qword_26B1C24A8);
  id v4 = v2;
  uint64_t v5 = sub_24E545E30();
  os_log_type_t v6 = sub_24E545F70();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[7];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    v0[2] = v8;
    id v11 = v8;
    sub_24E545F80();
    *uint64_t v10 = v8;

    _os_log_impl(&dword_24E538000, v5, v6, "received challenge: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2478);
    swift_arrayDestroy();
    uint64_t v12 = v10;
    uint64_t v1 = v0 + 2;
    MEMORY[0x25333E6B0](v12, -1, -1);
    MEMORY[0x25333E6B0](v9, -1, -1);
  }
  else
  {
  }
  sub_24E53CC00(v0[8] + OBJC_IVAR____TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate_credential, (uint64_t)v1);
  id v13 = (id)v0[5];
  if (v13)
  {
    uint64_t v14 = v0[6];
    __swift_project_boxed_opaque_existential_1(v1, v0[5]);
    id v13 = RequestCredential.urlCredential.getter((uint64_t)v13, v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  }
  else
  {
    sub_24E53B390((uint64_t)v1, &qword_26B1C2420);
  }
  uint64_t v15 = (uint64_t (*)(void, id))v0[1];
  return v15(0, v13);
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

uint64_t sub_24E543EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MockEndpoint();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t MockEndpoint.urlComponents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24E545DB0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t MockEndpoint.init(mockResponseBlock:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F0470);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E545DA0();
  uint64_t v9 = sub_24E545DB0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v8, v9);
    uint64_t result = type metadata accessor for MockEndpoint();
    uint64_t v12 = (void *)(a3 + *(int *)(result + 20));
    *uint64_t v12 = a1;
    v12[1] = a2;
  }
  return result;
}

uint64_t type metadata accessor for MockEndpoint()
{
  uint64_t result = qword_26B1C2400;
  if (!qword_26B1C2400) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E544110@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24E545DB0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t *initializeBufferWithCopyOfBuffer for MockEndpoint(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_24E545DB0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t destroy for MockEndpoint(uint64_t a1)
{
  uint64_t v2 = sub_24E545DB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for MockEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545DB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_24E5444E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_24E5445A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24E545DB0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24E544660()
{
  uint64_t result = sub_24E545DB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24E5446F8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2490);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24E546A30;
  strcpy((char *)(inited + 32), "authorization");
  *(_WORD *)(inited + 46) = -4864;
  strcpy((char *)(inited + 48), "x-apple-i-md");
  *(unsigned char *)(inited + 61) = 0;
  *(_WORD *)(inited + 62) = -5120;
  strcpy((char *)(inited + 64), "x-apple-i-md-m");
  *(unsigned char *)(inited + 79) = -18;
  *(void *)(inited + 80) = 0xD000000000000012;
  *(void *)(inited + 88) = 0x800000024E547A20;
  uint64_t v1 = sub_24E545284(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_26B1C2438 = v1;
  return result;
}

uint64_t sub_24E5447F4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24E5460E0();
  swift_bridgeObjectRetain();
  sub_24E545EE0();
  uint64_t v8 = sub_24E546100();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24E546080() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24E546080() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24E544C84(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24E5449A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F0478);
  uint64_t v3 = sub_24E545FD0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24E5460E0();
      sub_24E545EE0();
      uint64_t result = sub_24E546100();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24E544C84(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24E5449A4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24E544E20();
      goto LABEL_22;
    }
    sub_24E544FD4();
  }
  uint64_t v11 = *v4;
  sub_24E5460E0();
  sub_24E545EE0();
  uint64_t result = sub_24E546100();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24E546080(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24E546090();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24E546080();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_24E544E20()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F0478);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E545FC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24E544FD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F0478);
  uint64_t v3 = sub_24E545FD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24E5460E0();
    swift_bridgeObjectRetain();
    sub_24E545EE0();
    uint64_t result = sub_24E546100();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E545284(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24E545F40();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24E5447F4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24E54531C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E545330);
}

uint64_t sub_24E545330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E545DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_24E545D60();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 24);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_24E545448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E54545C);
}

uint64_t sub_24E54545C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24E545DC0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_24E545D60();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_24E545570()
{
  uint64_t result = sub_24E545DC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24E545D60();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t dispatch thunk of Endpoint.urlComponents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

id RequestCredential.urlCredential.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 8))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  id v4 = objc_allocWithZone(MEMORY[0x263F08BB8]);
  uint64_t v5 = (void *)sub_24E545E80();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_24E545E80();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithUser_password_persistence_, v5, v6, 0);

  return v7;
}

unint64_t sub_24E545754()
{
  _s12FindMyCommon18SearchpartyAccountV0aB17ServerInteractionE8usernameSSvg_0();
  sub_24E545EF0();
  _s12FindMyCommon18SearchpartyAccountV0aB17ServerInteractionE8passwordSSvg_0();
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_24E545E70();
  unint64_t v2 = v1;
  swift_bridgeObjectRelease();
  sub_24E545DD0();
  sub_24E53A6B0(v0, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2498);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24E546B10;
  strcpy((char *)(inited + 32), "Authorization");
  *(_WORD *)(inited + 46) = -4864;
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = 0x206369736142;
  *(void *)(inited + 56) = 0xE600000000000000;
  return sub_24E53A708(inited);
}

unint64_t sub_24E54587C()
{
  swift_bridgeObjectRetain();
  sub_24E545EF0();
  swift_bridgeObjectRetain();
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_24E545E70();
  unint64_t v2 = v1;
  swift_bridgeObjectRelease();
  sub_24E545DD0();
  sub_24E53A6B0(v0, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2498);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24E546B10;
  strcpy((char *)(inited + 32), "Authorization");
  *(_WORD *)(inited + 46) = -4864;
  sub_24E545EF0();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = 0x206369736142;
  *(void *)(inited + 56) = 0xE600000000000000;
  return sub_24E53A708(inited);
}

uint64_t BasicCredential.username.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BasicCredential.password.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

FindMyServerInteraction::BasicCredential __swiftcall BasicCredential.init(username:password:)(Swift::String username, Swift::String password)
{
  Swift::String *v2 = username;
  v2[1] = password;
  result.password = password;
  result.username = username;
  return result;
}

uint64_t sub_24E545A1C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24E545A4C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_24E545A7C()
{
  return sub_24E54587C();
}

uint64_t dispatch thunk of RequestCredential.username.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RequestCredential.password.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RequestCredential.authHeaders.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t initializeBufferWithCopyOfBuffer for BasicCredential(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BasicCredential()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BasicCredential(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BasicCredential(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

void *assignWithTake for BasicCredential(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BasicCredential(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BasicCredential(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BasicCredential()
{
  return &type metadata for BasicCredential;
}

uint64_t sub_24E545CE0()
{
  return MEMORY[0x270F28C70]();
}

uint64_t sub_24E545CF0()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_24E545D00()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_24E545D10()
{
  return MEMORY[0x270EEDC10]();
}

uint64_t sub_24E545D20()
{
  return MEMORY[0x270EEDC20]();
}

uint64_t sub_24E545D30()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_24E545D40()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_24E545D50()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_24E545D60()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_24E545D70()
{
  return MEMORY[0x270F28E08]();
}

uint64_t sub_24E545D80()
{
  return MEMORY[0x270F28E18]();
}

uint64_t sub_24E545D90()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_24E545DA0()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_24E545DB0()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_24E545DC0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24E545DD0()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_24E545DE0()
{
  return MEMORY[0x270F28E48]();
}

uint64_t sub_24E545DF0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24E545E00()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t _s12FindMyCommon18SearchpartyAccountV0aB17ServerInteractionE8usernameSSvg_0()
{
  return MEMORY[0x270F28F28]();
}

uint64_t _s12FindMyCommon18SearchpartyAccountV0aB17ServerInteractionE8passwordSSvg_0()
{
  return MEMORY[0x270F28F30]();
}

uint64_t sub_24E545E30()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E545E40()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E545E50()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E545E60()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24E545E70()
{
  return MEMORY[0x270F28E80]();
}

uint64_t sub_24E545E80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24E545E90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24E545EA0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_24E545EB0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24E545EC0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24E545ED0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24E545EE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24E545EF0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24E545F00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E545F10()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E545F20()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24E545F30()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24E545F40()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24E545F70()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E545F80()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E545F90()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E545FA0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24E545FB0()
{
  return MEMORY[0x270F9E8B8]();
}

uint64_t sub_24E545FC0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24E545FD0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24E545FE0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24E545FF0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E546000()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E546010()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24E546020()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E546030()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24E546040()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E546050()
{
  return MEMORY[0x270F28EB0]();
}

uint64_t sub_24E546060()
{
  return MEMORY[0x270F28EB8]();
}

uint64_t sub_24E546070()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24E546080()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24E546090()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24E5460A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24E5460B0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24E5460C0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24E5460D0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24E5460E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E5460F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24E546100()
{
  return MEMORY[0x270F9FC90]();
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